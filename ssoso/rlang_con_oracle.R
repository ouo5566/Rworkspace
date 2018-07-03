install.packages("rJava")
install.packages("DBI")
install.packages("RJDBC")
library(rJava)
library(DBI)
library(RJDBC)
drv <- JDBC(
  "oracle.jdbc.driver.OracleDriver",
  "C:\\oraclexe\\app\\oracle\\product\\11.2.0\\server\\jdbc\\lib\\ojdbc6.jar"
)
conn <- dbConnect(drv,
                  "jdbc:oracle:thin:@localhost:1521:xe",
                  "ssoso",
                  "sweet93")
rst <- dbGetQuery(conn, "SELECT * FROM TEAM")
rst
