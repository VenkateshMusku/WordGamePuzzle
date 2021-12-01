CREATE TABLE Ethnicity(
   eth_id  INT  IDENTITY  PRIMARY KEY  NOT NULL,
   eth_name VARCHAR (100)  NOT NULL
   );

   CREATE TABLE Gender(
   gender_id  INT IDENTITY  PRIMARY KEY  NOT NULL,
   gender_name VARCHAR (20)  NOT NULL
   );

   
   CREATE TABLE WordsDictionary(

   word_id  INT IDENTITY  PRIMARY KEY  NOT NULL,
   word_desc VARCHAR (30)  NOT NULL
   );

    CREATE TABLE WordCombinations(

   comb_id  INT IDENTITY  PRIMARY KEY  NOT NULL,
   key1 int  NOT NULL,
   key2 int  NOT NULL,
   gender_id int NOT NULL,
   eth_id int NOT NULL,
   ValueCount int
   );

ALTER TABLE WordCombinations
ADD FOREIGN KEY (key1) REFERENCES WordsDictionary(word_id);
ALTER TABLE WordCombinations
ADD FOREIGN KEY (key2) REFERENCES WordsDictionary(word_id);
ALTER TABLE WordCombinations
ADD FOREIGN KEY (gender_id) REFERENCES Gender(gender_id);
ALTER TABLE WordCombinations
ADD FOREIGN KEY (eth_id) REFERENCES Ethnicity(eth_id);

insert into PlayBook.dbo.Gender (gender_name) values ('Male')

insert into PlayBook.dbo.Gender (gender_name) values ('Female')


insert into PlayBook.dbo.Gender (gender_name) values ('Other')


insert into PlayBook.dbo.Gender (gender_name) values ('NotDisclosed')

insert into PlayBook.dbo.Ethnicity (eth_name) values ('African-American')

insert into PlayBook.dbo.Ethnicity (eth_name) values ('White')


insert into PlayBook.dbo.Ethnicity (eth_name) values ('Asian')


insert into PlayBook.dbo.Ethnicity (eth_name) values ('American Indian or Alaska Native')


insert into PlayBook.dbo.Ethnicity (eth_name) values ('Native Hawain or Pacific Islander')


insert into PlayBook.dbo.Ethnicity (eth_name) values ('Other')


insert into PlayBook.dbo.Ethnicity (eth_name) values ('NotDisclosed')


insert into PlayBook.dbo.WordsDictionary(word_desc) values ('APPLE')
insert into PlayBook.dbo.WordsDictionary(word_desc) values ('MANGO')
insert into PlayBook.dbo.WordsDictionary(word_desc) values ('ORANGES')
insert into PlayBook.dbo.WordsDictionary(word_desc) values ('FRUITS')
insert into PlayBook.dbo.WordsDictionary(word_desc) values ('RED')



USE PlayBook;  
GO  
CREATE PROCEDURE usp_UpdateValueCount  
    @comb_id int
     
AS   
    
    SET NOCOUNT ON; 
	Declare @ValueCount int =0
	select @ValueCount = ValueCount from PlayBook.dbo.WordCombinations where comb_id = @comb_id
    Update PlayBook.dbo.WordCombinations set ValueCount =  @ValueCount + 1 where comb_id = @comb_id 
GO

USE PlayBook;  
GO  
CREATE PROCEDURE usp_CheckCombinationCount
    @source_id int, 
	@target_id int
	
     
AS   
    
    SET NOCOUNT ON; 
	declare @comb_id int
	select @comb_id = ISNULL(comb_id,0) from WordCombinations
     where key1 = @source_id and key2 = @target_id 

GO



CREATE PROCEDURE usp_getReport  
   
     
AS   
    
    SET NOCOUNT ON; 

select g.gender_name as 'Gender', e.eth_name as 'Race', wd.word_desc as 'Word',
count(wc.ValueCount) as 'FrequencyUsed' from Playbook.dbo.WordCombinations wc
inner join PlayBook.dbo.Ethnicity(nolock) e
on wc.eth_id = e.eth_id
inner join PlayBook.dbo.Gender(nolock) g 
on g.gender_id = wc.gender_id 
inner join PlayBook.dbo.WordsDictionary(nolock) wd 
on wd.word_id = wc.key1
group by g.gender_name,e.eth_name,wd.word_desc
