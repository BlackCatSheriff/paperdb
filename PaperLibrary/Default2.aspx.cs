using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Default2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //string[] sql = "存在价值,修复价值,综合,其他".Split(',');
        //using (var db=new PaperDbEntities()) {
        //    foreach(string s in sql)
        //    {
        //        Option op = new Option();
        //        op.CategoryId = 12;
        //        op.Name = s;
        //        db.Option.Add(op);
        //    }
        //    db.SaveChanges();
        //}


        HashSet<int> a = new HashSet<int>();
        HashSet<int> b = new HashSet<int>();
        for(int i = 0; i < 10; i++)
        {
        a.Add(i+1);
            if (i > 5)
                b.Add(i);

        }
        a.IntersectWith(b);
        foreach (int i in a)
        {
            Response.Write(i + "<br/>");
        }

    }


    static void LinqAndTest()
    {
        List<string> list = new List<string>();
        list.Add("one");
        list.Add("two");
        list.Add("three");
        list.Add("four");
        list.Add("five");
        list.Add("six");

        //返回字长大于3
        Expression<Func<string, bool>> exp = s => s.Length > 3;
        var results = list.Where(exp.Compile());
        foreach (var result in results)
        {
            Console.WriteLine(result);
        }

        Expression<Func<string, bool>> exp2 = s => s.Contains('o');
        var exp3 = exp.And(exp2);
        //合并两个条件：返回字长大于3且包括o字符
        results = list.Where(exp3.Compile());
        foreach (var result in results)
        {
            Console.WriteLine(result);
        }
        Console.Read();

    }


    void ShowData()
    {
    
        var predicate = PredicateBuilder.True<TypeConnection>();
        List<int> opIds = new List<int>();
        foreach(int id in opIds)
        {

            predicate = predicate.And(p => p.id == id);
        }



    

    }


    List<TypeConnection> GetTypeConnectionByAND(params int[] keywords)
    {
        using (var db = new PaperDbEntities())
        {

        IQueryable<TypeConnection> query = db.TypeConnection;
        foreach (int keyword in keywords)
        {
            query = query.Where(p => p.id== keyword);
        }
        //翻译后的sql语句:  
        //Select [t0].[ID], [t0].[Name], [t0].[Description]  
        //FROM [dbo].[Product] AS [t0]  
        //Where ([t0].[Description] LIKE '%手机%') AND ([t0].[Description] LIKE '%6111%')  
        return query.ToList();
      }
    }

}
