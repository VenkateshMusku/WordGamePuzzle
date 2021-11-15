
using WordGamePuzzle.Model;
namespace WordGamePuzzle
{
    internal class WordsDictionaries
    {
        private WordsDictionary wordsDictionary;

        public WordsDictionaries()
        {
        }

        public WordsDictionaries(WordsDictionary wordsDictionary)
        {
            this.wordsDictionary = wordsDictionary;
            this.WordDesc = wordsDictionary.word_desc;
            this.WordId = wordsDictionary.word_id;
        }

        public string WordDesc { get; set; }
        public int WordId { get; set; }
    }
}
