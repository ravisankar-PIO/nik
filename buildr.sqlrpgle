 Dcl-S Count Char(10) Inz(*Blank);
 Dcl-S Total Zoned(2) Inz(*Zero);
 Dcl-S Count_Qry Char(100) Inz(*Blank);

 Exec Sql
    Set Option Commit = *None;

 Exec Sql
    Select Count(Build) Into :Total From Buildpf;

    Count = 'Build# ' + %Char(Total+1);

    Count_Qry = 'Insert into Buildpf Values(?)';

  Exec Sql
    Prepare Cursor1 From :Count_Qry;

  Exec Sql
    Execute Cursor1 Using :Count;

  *Inlr = *On;
