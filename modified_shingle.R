tokens1_mod <- tokenize_ngrams(text1, n = 3)#getting n-grams
tokens1_mod <- data.frame(tokens1_mod)
colnames(tokens1_mod)[1] = "shingle"
for(i in 1:nrow(tokens1_mod)){              #sorting
  line <- as.character(tokens1_mod$shingle[i])
  line <- unlist(strsplit(line, " "))
  tokens1_mod$sorted[i] <- paste(sort(line), collapse = " ")
}
tokens1_mod <- select(tokens1_mod, sorted)
tokens1_mod <- distinct(tokens1_mod)


tokens2_mod <- tokenize_ngrams(text2, n = 3)
tokens2_mod <- data.frame(tokens2_mod)
colnames(tokens2_mod)[1] = "shingle"
for(i in 1:nrow(tokens2_mod)){
  line <- as.character(tokens2_mod$shingle[i])
  line <- unlist(strsplit(line, " "))
  tokens2_mod$sorted[i] <- paste(sort(line), collapse = " ")
}
tokens2_mod <- select(tokens2_mod, sorted)
tokens2_mod <- distinct(tokens2_mod)


tokens3_mod <- tokenize_ngrams(text3, n = 3)
tokens3_mod <- data.frame(tokens3_mod)
colnames(tokens3_mod)[1] = "shingle"
for(i in 1:nrow(tokens3_mod)){
  line <- as.character(tokens3_mod$shingle[i])
  line <- unlist(strsplit(line, " "))
  tokens3_mod$sorted[i] <- paste(sort(line), collapse = " ")
}
tokens3_mod <- select(tokens3_mod, sorted)
tokens3_mod <- distinct(tokens3_mod)


tokens4_mod <- tokenize_ngrams(text4, n = 3)
tokens4_mod <- data.frame(tokens4_mod)
colnames(tokens4_mod)[1] = "shingle"
for(i in 1:nrow(tokens4_mod)){
  line <- as.character(tokens4_mod$shingle[i])
  line <- unlist(strsplit(line, " "))
  tokens4_mod$sorted[i] <- paste(sort(line), collapse = " ")
}
tokens4_mod <- select(tokens4_mod, sorted)
tokens4_mod <- distinct(tokens4_mod)


tokens5_mod <- tokenize_ngrams(text5, n = 3)
tokens5_mod <- data.frame(tokens5_mod)
colnames(tokens5_mod)[1] = "shingle"
for(i in 1:nrow(tokens5_mod)){
  line <- as.character(tokens5_mod$shingle[i])
  line <- unlist(strsplit(line, " "))
  tokens5_mod$sorted[i] <- paste(sort(line), collapse = " ")
}
tokens5_mod <- select(tokens5_mod, sorted)
tokens5_mod <- distinct(tokens5_mod)


tokens6_mod <- tokenize_ngrams(text6, n = 3)
tokens6_mod <- data.frame(tokens6_mod)
colnames(tokens6_mod)[1] = "shingle"
for(i in 1:nrow(tokens6_mod)){
  line <- as.character(tokens6_mod$shingle[i])
  line <- unlist(strsplit(line, " "))
  tokens6_mod$sorted[i] <- paste(sort(line), collapse = " ")
}
tokens6_mod <- select(tokens6_mod, sorted)
tokens6_mod <- distinct(tokens6_mod)


#hashes
for(i in 1:nrow(tokens1_mod)){
  tokens1_mod$control_sum[i] <- digest(as.character(tokens1_mod$sorted[i]), "md5", serialize = FALSE)
}

for(i in 1:nrow(tokens2_mod)){
  tokens2_mod$control_sum[i] <- digest(as.character(tokens2_mod$sorted[i]), "md5", serialize = FALSE)
}

for(i in 1:nrow(tokens3_mod)){
  tokens3_mod$control_sum[i] <- digest(as.character(tokens3_mod$sorted[i]), "md5", serialize = FALSE)
}

for(i in 1:nrow(tokens4_mod)){
  tokens4_mod$control_sum[i] <- digest(as.character(tokens4_mod$sorted[i]), "md5", serialize = FALSE)
}

for(i in 1:nrow(tokens5_mod)){
  tokens5_mod$control_sum[i] <- digest(as.character(tokens5_mod$sorted[i]), "md5", serialize = FALSE)
}

for(i in 1:nrow(tokens6_mod)){
  tokens6_mod$control_sum[i] <- digest(as.character(tokens6_mod$sorted[i]), "md5", serialize = FALSE)
}


######################################################   Test

tokens_mod_test <- tokenize_ngrams(test6, n = 3)
tokens_mod_test <- data.frame(tokens_mod_test)
colnames(tokens_mod_test)[1] = "shingle"
for(i in 1:nrow(tokens_mod_test)){
  line <- as.character(tokens_mod_test$shingle[i])
  line <- unlist(strsplit(line, " "))
  tokens_mod_test$sorted[i] <- paste(sort(line), collapse = " ")
}
tokens_mod_test <- select(tokens_mod_test, sorted)
tokens_mod_test <- distinct(tokens_mod_test)

for(i in 1:nrow(tokens_mod_test)){
  tokens_mod_test$control_sum[i] <- digest(as.character(tokens_mod_test$sorted[i]), "md5", serialize = FALSE)
}


union1_mod <- union(x = tokens1_mod$control_sum, y = tokens_mod_test$control_sum)
intersect1_mod <- intersect(x = tokens1_mod$control_sum, y = tokens_mod_test$control_sum)
union1_mod <- length(union1_mod)
intersect1_mod <- length(intersect1_mod)
r_1_mod <- as.numeric(intersect1_mod / union1_mod)
c_1_mod <- as.numeric(intersect1_mod / nrow(tokens_mod_test))



union2_mod <- union(x = tokens2_mod$control_sum, y = tokens_mod_test$control_sum)
intersect2_mod <- intersect(x = tokens2_mod$control_sum, y = tokens_mod_test$control_sum)
union2_mod <- length(union2_mod)
intersect2_mod <- length(intersect2_mod)
r_2_mod <- as.numeric(intersect2_mod / union2_mod)
c_2_mod <- as.numeric(intersect2_mod / nrow(tokens_mod_test))



union3_mod <- union(x = tokens3_mod$control_sum, y = tokens_mod_test$control_sum)
intersect3_mod <- intersect(x = tokens3_mod$control_sum, y = tokens_mod_test$control_sum)
union3_mod <- length(union3_mod)
intersect3_mod <- length(intersect3_mod)
r_3_mod <- as.numeric(intersect3_mod / union3_mod)
c_3_mod <- as.numeric(intersect3_mod / nrow(tokens_mod_test))

union4_mod <- union(x = tokens4_mod$control_sum, y = tokens_mod_test$control_sum)
intersect4_mod <- intersect(x = tokens4_mod$control_sum, y = tokens_mod_test$control_sum)
union4_mod <- length(union4_mod)
intersect4_mod <- length(intersect4_mod)
r_4_mod <- as.numeric(intersect4_mod / union4_mod)
c_4_mod <- as.numeric(intersect4_mod / nrow(tokens_mod_test))

union5_mod <- union(x = tokens5_mod$control_sum, y = tokens_mod_test$control_sum)
intersect5_mod <- intersect(x = tokens5_mod$control_sum, y = tokens_mod_test$control_sum)
union5_mod <- length(union5_mod)
intersect5_mod <- length(intersect5_mod)
r_5_mod <- as.numeric(intersect5_mod / union5_mod)
c_5_mod <- as.numeric(intersect5_mod / nrow(tokens_mod_test))


union6_mod <- union(x = tokens6_mod$control_sum, y = tokens_mod_test$control_sum)
intersect6_mod <- intersect(x = tokens6_mod$control_sum, y = tokens_mod_test$control_sum)
union6_mod <- length(union6_mod)
intersect6_mod <- length(intersect6_mod)
r_6_mod <- as.numeric(intersect6_mod / union6_mod)
c_6_mod <- as.numeric(intersect6_mod / nrow(tokens_mod_test))
sprintf("Match 1 (modified): r = %f, c = %f, d = %f", r_1_mod, c_1_mod, as.numeric(1 - r_1_mod))
sprintf("Match 2 (modified): r = %f, c = %f, d = %f", r_2_mod, c_2_mod, as.numeric(1 - r_2_mod))
sprintf("Match 3 (modified): r = %f, c = %f, d = %f", r_3_mod, c_3_mod, as.numeric(1 - r_3_mod))
sprintf("Match 4 (modified): r = %f, c = %f, d = %f", r_4_mod, c_4_mod, as.numeric(1 - r_4_mod))
sprintf("Match 5 (modified): r = %f, c = %f, d = %f", r_5_mod, c_5_mod, as.numeric(1 - r_5_mod))
sprintf("Match 6 (modified): r = %f, c = %f, d = %f", r_6_mod, c_6_mod, as.numeric(1 - r_6_mod))




