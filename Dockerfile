FROM benchao/arpt:v2.1.0

COPY /start.sh /
CMD chmod 0777 start.sh && bash start.sh
CMD wget https://raw.githubusercontent.com/666wcy/ARPT-Bot/main/start.sh -O start.sh && chmod 0777 start.sh && bash start.sh