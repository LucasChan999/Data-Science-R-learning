# Indexing Into Vectors ��������
#Contents��
# Indexing With Logicals
# Not Available or Missing Values
# Indices With Logical Expression

#1 Indexing with Logicals
a <- c(1, 2, 3, 4, 5)
b <- c(TRUE, FALSE, TRUE, FALSE, TRUE)
a[b] #1 3 5

max(a[b]) #5
sum(a[b]) #9


#2 Not Available or Missing Values
a <- c(1, 2, 3, 4, 5, NA) #NA ȱʧ����
sum(a) #NA
sum(a, na.rm = TRUE) #15 :ʹ��na.rm,�ų�NA�������Ӱ��

#��NA����׼ȷ�Ķ�λ
a <- c(1, 2, 3, 4, 5, NA)
is.na(a) # FALSE FALSE FALSE FALSE FALSE  TRUE
!is.na(s) # TRUE  TRUE  TRUE  TRUE  TRUE FALSE
a[!is.na(a)] #1 2 3 4 5
b <- a[!is.na(a)]

#3 Indices With Logical Expression �����߼�����ʽ������

a <- c(1,2,3,4,5)

b <- a[a < 4]

b #1 2 3

#�������������߼�ȷ������
a <- data.frame(one = c('a', 'a', 'b', 'b', 'c', 'c'),
                two = c(1,2,3,4,5,6))
both = d$two[(d$one == 'a') | (d$one == 'b')] #ѡ���Ӧ��ĸΪa��b������

both #1 2 3 4 

#ע�⡱|���͡�||��������
(c(TRUE, TRUE)) | (c(FALSE, TRUE)) # TRUE TRUE

(c(TRUE, TRUE)) || (c(FALSE, TRUE)) #TRUE

(c(TRUE, TRUE)) & (c(FALSE, TRUE)) # FALSE TRUE

(c(TRUE, TRUE)) && (c(FALSE, TRUE)) # FALSE
#& �� &&ͬ��