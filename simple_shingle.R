tokens1 <- tokenize_ngrams(text1, n = 3) #getting n-grams
tokens1 <- data.frame(tokens1)
tokens1 <- distinct(tokens1)
colnames(tokens1)[1] = "shingle"

tokens2 <- tokenize_ngrams(text2, n = 3)
tokens2 <- data.frame(tokens2)
tokens2 <- distinct(tokens2)
colnames(tokens2)[1] = "shingle"

tokens3 <- tokenize_ngrams(text3, n = 3)
tokens3 <- data.frame(tokens3)
tokens3 <- distinct(tokens3)
colnames(tokens3)[1] = "shingle"

tokens4 <- tokenize_ngrams(text4, n = 3)
tokens4 <- data.frame(tokens4)
tokens4 <- distinct(tokens4)
colnames(tokens4)[1] = "shingle"

tokens5 <- tokenize_ngrams(text5, n = 3)
tokens5 <- data.frame(tokens5)
tokens5 <- distinct(tokens5)
colnames(tokens5)[1] = "shingle"

tokens6 <- tokenize_ngrams(text6, n = 3)
tokens6 <- data.frame(tokens6)
tokens6 <- distinct(tokens6)
colnames(tokens6)[1] = "shingle"


#hashes
for(i in 1:nrow(tokens1)){
  tokens1$control_sum[i] <- digest(as.character(tokens1$shingle[i]), "md5", serialize = FALSE)
}

for(i in 1:nrow(tokens2)){
  tokens2$control_sum[i] <- digest(as.character(tokens2$shingle[i]), "md5", serialize = FALSE)
}

for(i in 1:nrow(tokens3)){
  tokens3$control_sum[i] <- digest(as.character(tokens3$shingle[i]), "md5", serialize = FALSE)
}

for(i in 1:nrow(tokens4)){
  tokens4$control_sum[i] <- digest(as.character(tokens4$shingle[i]), "md5", serialize = FALSE)
}

for(i in 1:nrow(tokens5)){
  tokens5$control_sum[i] <- digest(as.character(tokens5$shingle[i]), "md5", serialize = FALSE)
}

for(i in 1:nrow(tokens6)){
  tokens6$control_sum[i] <- digest(as.character(tokens6$shingle[i]), "md5", serialize = FALSE)
}


######################################################   Test

tokens_test <- tokenize_ngrams(test6, n = 3)
tokens_test <- data.frame(tokens_test)
tokens_test <- distinct(tokens_test)
colnames(tokens_test)[1] = "shingle"

for(i in 1:nrow(tokens_test)){
  tokens_test$control_sum[i] <- digest(as.character(tokens_test$shingle[i]), "md5", serialize = FALSE)
}


union1 <- union(x = tokens1$control_sum, y = tokens_test$control_sum)
intersect1 <- intersect(x = tokens1$control_sum, y = tokens_test$control_sum)
union1 <- length(union1)
intersect1 <- length(intersect1)
r_1 <- as.numeric(intersect1 / union1)
c_1 <- as.numeric(intersect1 / nrow(tokens_test))


union2 <- union(x = tokens2$control_sum, y = tokens_test$control_sum)
intersect2 <- intersect(x = tokens2$control_sum, y = tokens_test$control_sum)
union2 <- length(union2)
intersect2 <- length(intersect2)
r_2 <- as.numeric(intersect2 / union2)
c_2 <- as.numeric(intersect2 / nrow(tokens_test))


union3 <- union(x = tokens3$control_sum, y = tokens_test$control_sum)
intersect3 <- intersect(x = tokens3$control_sum, y = tokens_test$control_sum)
union3 <- length(union3)
intersect3 <- length(intersect3)
r_3 <- as.numeric(intersect3 / union3)
c_3 <- as.numeric(intersect3 / nrow(tokens_test))


union4 <- union(x = tokens4$control_sum, y = tokens_test$control_sum)
intersect4 <- intersect(x = tokens4$control_sum, y = tokens_test$control_sum)
union4 <- length(union4)
intersect4 <- length(intersect4)
r_4 <- as.numeric(intersect4 / union4)
c_4 <- as.numeric(intersect4 / nrow(tokens_test))


union5 <- union(x = tokens5$control_sum, y = tokens_test$control_sum)
intersect5 <- intersect(x = tokens5$control_sum, y = tokens_test$control_sum)
union5 <- length(union5)
intersect5 <- length(intersect5)
r_5 <- as.numeric(intersect5 / union5)
c_5 <- as.numeric(intersect5 / nrow(tokens_test))


union6 <- union(x = tokens6$control_sum, y = tokens_test$control_sum)
intersect6 <- intersect(x = tokens6$control_sum, y = tokens_test$control_sum)
union6 <- length(union6)
intersect6 <- length(intersect6)
r_6 <- as.numeric(intersect6 / union6)
c_6 <- as.numeric(intersect6 / nrow(tokens_test))

sprintf("Match 1: r = %f, c = %f, d = %f", r_1, c_1, as.numeric(1 - r_1))
sprintf("Match 2: r = %f, c = %f, d = %f", r_2, c_2, as.numeric(1 - r_2))
sprintf("Match 3: r = %f, c = %f, d = %f", r_3, c_3, as.numeric(1 - r_3))
sprintf("Match 4: r = %f, c = %f, d = %f", r_4, c_4, as.numeric(1 - r_4))
sprintf("Match 5: r = %f, c = %f, d = %f", r_5, c_5, as.numeric(1 - r_5))
sprintf("Match 6: r = %f, c = %f, d = %f", r_6, c_6, as.numeric(1 - r_6))

