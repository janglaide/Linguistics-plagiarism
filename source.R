library(digest)
library(tidyverse)
#install.packages("tokenizers")
library(tokenizers)
library(stringi)
#library(dplyr) 


f1 <- "texts/dovzhenko_antarktyda_ukr.txt"
f2 <- "texts/dovzhenko_Ukrana_u_vogn_ukr.txt"
f3 <- "texts/dovzhenko_Zacharovana_Desna_ukr.txt"
f4 <- "texts/myrnyi_Khiba_revut_voly_ukr.txt"
f5 <- "texts/myrnyi_lykhi-liudy-tovaryshi2607_2_ukr.txt"
f6 <- "texts/myrnyi_poviya_ukr.txt"

f_test1 <- "test/test1.txt"
f_test2 <- "test/test2.txt"
f_test3 <- "test/test3.txt"
f_test4 <- "test/test4.txt"
f_test5 <- "test/test5.txt"
f_test6 <- "test/test6.txt"

text1 <- read_file(f1)
text2 <- read_file(f2)
text3 <- read_file(f3)
text4 <- read_file(f4)
text5 <- read_file(f5)
text6 <- read_file(f6)

test1 <- read_file(f_test1)
test2 <- read_file(f_test2)
test3 <- read_file(f_test3)
test4 <- read_file(f_test4)
test5 <- read_file(f_test5)
test6 <- read_file(f_test6)

#rm(text1, text2, text3, text4, text5, text6)
#rm(test1, test2, test3, test4, test5, test6)
#rm(tokens1, tokens_mod_test, tokens_test, tokens1_mod, tokens2, tokens2_mod, tokens3, tokens3_mod, 
#   tokens4, tokens4_mod, tokens5, tokens5_mod, tokens6, tokens6_mod, s1, s2, symbols)

symbols <- tokenize_characters(test1) #symbols only
symbols <- table(symbols)
symbols <- data.frame(char = names(symbols), count = as.numeric(symbols))

quantity <- sum(symbols$count) #counting characters in the text
