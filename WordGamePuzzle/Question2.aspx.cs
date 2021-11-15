using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WordGamePuzzle.Model;

namespace WordGamePuzzle
{
    public partial class Question2 : System.Web.UI.Page
    {
        PlayBookDataContext _context = new PlayBookDataContext();
        //https://forums.asp.net/t/1609072.aspx?Page+level+global+variables+always+bad+style+ 
        static int sourceWordId = 0;//static variables are persisted across postbacks. 
        List<int> combo_id = new List<int>();



        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                var query = from c in _context.WordsDictionaries select c;
                int count = query.Count();
                if (query.Count() > 0)
                {
                    Random r = new Random();
                    var randomword = new WordsDictionaries(query.ToList()[r.Next(0, count)]);
                    lblWord1.Text = randomword.WordDesc;
                    sourceWordId = randomword.WordId;


                }
            }
        }

        protected void btn_Next_Click(object sender, EventArgs e)
        {

            //Make sure that the user entered a valid english word. 
            if (Page.IsValid)
            {
               NewWordProcessing(sourceWordId, txtWord1.Text.ToUpper());
               ExistingWordProcessing(sourceWordId, txtWord1.Text.ToUpper());
               Response.Redirect("Question3.aspx");
            }
        }

        private void NewWordProcessing(int sourceWordId, string userEnteredWord)
        {
            int gend_id = 0;
            int race_id = 0;
            if (Session["gender_id"] != null && Session["eth_id"] != null)
            {
                gend_id = Convert.ToInt32(Session["gender_id"]);
                race_id = Convert.ToInt32(Session["eth_id"]);
            }

            var result = (from c in _context.WordsDictionaries
                          where c.word_id == sourceWordId
                          select new { c.word_id, c.word_desc }).ToList();
            var result1 = (from c in _context.WordsDictionaries
                           where c.word_desc == userEnteredWord.ToUpper()
                           select new { c.word_id, c.word_desc }).ToList();
            if (result.Count == 0)
            {
                WordsDictionary word = new WordsDictionary { word_desc = lblWord1.Text.ToUpper() };
                _context.WordsDictionaries.Add(word);
                _context.SaveChanges();
            }
            if (result1.Count == 0)
            {
                WordsDictionary word = new WordsDictionary { word_desc = userEnteredWord.ToUpper() };
                _context.WordsDictionaries.Add(word);
                _context.SaveChanges();
            }

            var userEnteredWordId = (from c in _context.WordsDictionaries
                                     where c.word_desc == userEnteredWord.ToUpper()
                                     select new { c.word_id, c.word_desc }).ToList();


            var combresult = _context.usp_CheckCombinationCount(Convert.ToInt32(sourceWordId), Convert.ToInt32(userEnteredWordId[0].word_id)).ToList();
            var combresult1 = _context.usp_CheckCombinationCount(Convert.ToInt32(userEnteredWordId[0].word_id), Convert.ToInt32(sourceWordId)).ToList();
            //now insert into the wordcombination table 
            if (combresult.Count == 0 && combresult1.Count == 0)
            {
                WordCombination combination = new WordCombination
                {
                    key1 = sourceWordId,
                    key2 = userEnteredWordId[0].word_id,
                    ValueCount = 0,
                    eth_id = race_id,
                    gender_id = gend_id
                };
                _context.WordCombinations.Add(combination);
                _context.SaveChanges();
            }

        }


        /// <summary>
        /// If your custom classes depend on the existence of a current instance of HttpContext then
        /// that code can never be used outside of a fully-aware web application context. So the code is less re-usable.
        /// So, depending on what you need from that context, you can re-factor the code to not need the context itself but
        /// only to require that the necessary items from the context be provided.
        /// https://stackoverflow.com/questions/9999403/adding-a-reference-to-system-web
        /// reasons as to why i did not move these methods outside these web context classes. 
        /// </summary>
        /// <param name="sourceWordId"></param>
        /// <param name="userEnteredWord"></param>
        /// <returns></returns>
        private void ExistingWordProcessing(int sourceWordId, string userEnteredWord)
        {
          
            var userEnteredWordId = (from c in _context.WordsDictionaries
                                     where c.word_desc == userEnteredWord.ToUpper()
                                     select new { c.word_id, c.word_desc }).ToList();

            var combresult = _context.usp_CheckCombinationCount(Convert.ToInt32(sourceWordId), Convert.ToInt32(userEnteredWordId[0].word_id)).ToList();
            var combresult1 = _context.usp_CheckCombinationCount(Convert.ToInt32(userEnteredWordId[0].word_id), Convert.ToInt32(sourceWordId)).ToList();
            if (combresult.Count() > 0)
            {

                combo_id.Add(Convert.ToInt32(combresult[0].Value));
                Session["combo_id_question_2"] = combo_id;

            }
            if (combresult1.Count() > 0)
            {

                combo_id.Add(Convert.ToInt32(combresult1[0].Value));
                Session["combo_id_question_2"] = combo_id;
            }

        }

        protected void cvValidEnglishWordValidator_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (!WordsCustom.IsValidEnglishWord(txtWord1.Text))
            {
                args.IsValid = false;

            }
        }
    }
}