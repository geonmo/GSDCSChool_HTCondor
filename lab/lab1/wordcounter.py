#!/usr/bin/env python3
#-*- coding:utf-8 -*-
import os, sys, operator

class WordCounter:
    def __init__(self,date,journal ):
        self.date= date
        self.journal = journal
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
    def printCounter(self,minCount=5 ):
        ## minCount 보다 높은 빈도 수만 저장하여 새로운 dictionary 변수를 만듭니다.
        new_dict = dict( (k,v) for (k,v) in self.words_dict.items() if v> minCount)
        sorted_words = sorted(new_dict.items(), key=(lambda x: x[1]))
        sorted_words.reverse()
        for word in sorted_words:
            print("%s,%s,%s,%d"%(self.date,self.journal,word[0], word[1]))
        return sorted_words

if __name__ == "__main__":
    files= sys.argv[1:]
    for news_file in files :
        with open(news_file) as infile:
            for news in infile.readlines():
                date,category,journal,title,body,link = news.split(",")
                news_tuples = []
                news_tuples.append(body)
                wc = WordCounter(date,journal.strip())
                for news_tuple in news_tuples:
                   wc.load(news_tuple)
                wc.printCounter()

