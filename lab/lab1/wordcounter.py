#!/usr/bin/env python3
#-*- coding:utf-8 -*-
import os, sys, operator

class WordCounter:
    def __init__(self ):
        self.words_dict = {}
        self.words_total_sum = {}
    def load(self,news):
        words =  news.split()
        if ( len(words)==0) : return []
        for word in words :
            if word in self.words_dict:
                self.words_dict[word] = self.words_dict[word]+1
            else :
                self.words_dict[word] = 1
            """
            if word in self.words_total_sum:
                self.words_total_sum[word] = self.words_total_sum[word]+1
            else:
                self.words_total_sum[word] = 1
            """
    def printCounter(self,minCount=5 ):
        ## minCount 보다 높은 빈도 수만 저장하여 새로운 dictionary 변수를 만듭니다.
        new_dict = dict( (k,v) for (k,v) in self.words_dict.items() if v> minCount)
        sorted_words = sorted(new_dict.items(), key=(lambda x: x[1]))
        sorted_words.reverse()
        for word in sorted_words:
            print("%s,%d"%(word[0], word[1]))
        return sorted_words
    """
    def printTotalSum(self, minCount=5):
        total_dict = dict( (k,v) for (k,v) in self.words_total_sum.iteritems() if v> minCount)
        total_words = sorted(total_dict.items(), key=operator.itemgetter(1))
        total_words.reverse()
        for tword in total_words:
            print("%s,%d"%(tword[0], tword[1]))
        return total_words
    """

if __name__ == "__main__":
    files= sys.argv[1:]
    for novel in files :
        with open(novel) as infile:
            news_tuples = []
            for news in infile.readlines():
                news_tuples.append(news.split(",")[4])
    wc = WordCounter()
    print(f"총 기사수 : {len(news_tuples)}") 
    for news_tuple in news_tuples:
        wc.load(news_tuple)
    wc.printCounter()

