using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WordGamePuzzle.Model
{
    public static  class WordsCustom 
    
    {
        

        /// <summary>
        /// Method to identify if the user has entered a valid english word.
        /// </summary>
        /// <param name="text"></param>
        /// <returns></returns>
        public static  bool IsValidEnglishWord(string word)
        {
            NetSpell.SpellChecker.Dictionary.WordDictionary oDict = new NetSpell.SpellChecker.Dictionary.WordDictionary();

            oDict.DictionaryFile = @"C:\Users\amiri\source\repos\WordGamePuzzle\packages\NetSpell.2.1.7\dic\en-US.dic";
            oDict.Initialize();
            string wordToCheck = word;
            NetSpell.SpellChecker.Spelling oSpell = new NetSpell.SpellChecker.Spelling();

            oSpell.Dictionary = oDict;
            if (!oSpell.TestWord(wordToCheck))
            {
                return false;
            }
            return true;
        }

        

       
       
    }
}