/**
 * XMLPLUS: A Json, sessionStore, offline, ledger
 * Created by: Jonas Bosson jonas@illuminet.se 2011
 * Licenced under GPLv3, see: http://www.gnu.org/licenses/gpl-3.0.html
 */

// check for jquery
if(!window["$"]) alert("missing jquery before loading bzon.js!");
// fake sessionStore for older browsers
if (!window["localStorage"]) {
    window.localStorage = {
	data:{},
	getItem:function(key){return data[key];},
	setItem:function(key,val){data[key]=val;}	
    };
}


var Transaction = function(id,type,reporter) {
    this.id = id; 
    this.type = type; 
    this.reporter = reporter; 
    this.rows = [];
    this.tags = [];
}; 

var TransactionRow = function(account,amount,date,comment) {
    this.account = account; 
    this.amount = amount; 
    this.date = date; 
    this.comment = comment; 
    this.created = new Date();
}

var Account = function(id,type,name,sku,tags) {
    this.id = id; 
    this.type = type; 
    this.name = name; 
    this.sku = sku; 
    this.tags = tags?tags:[];
};

var Ledger = function(company,book,startDay,endDay) {
    this.company = company; 
    this.book = book;
    this.startDay = startDay; /* YYYY-MM-DD */
    this.endDay = endDay;  /* YYYY-MM-DD */
    this.balance = new Transaction(0,"balance","");
    this.transactions = [];
    this.orders = [];
    this.loadedTime = null;
    this.accounts = {};
} 

xmlplus = {

    ledger: new Ledger("Acme","2010-2011","20100701","20110631"),
    sourceXML: null,
    sourceURI: null,

    loadXML: function (xmlUri, callback) {

      function attr(el,attr) {
          var a = el.attributes[attr];
          if (a) return a.nodeValue;
	  return "";
      }

      $.ajax({
        url: xmlUri, 
        dataType: "xml",
        success:function(data,textStatus,xhr) {

           var doc = data;
           var ledger = xmlplus.ledger;
           xmlplus.sourceXML = data; // save for reference
           xmlplus.sourceURI = xmlUri;

           var book = doc.getElementsByTagName("book")[0];
	   ledger.startDay = book.start; 
           ledger.endDay = book.end; 

	   console.log("reading accounts");
	   var aList = book.getElementsByTagName("accounts")[0].getElementsByTagName("account");
           $.each(aList, function(i,a) {
                   var id = attr(a,"id"); 
                   var type = attr(a,"type");
                   var name = a.firstChild.nodeValue; 
                   var sku = attr(a,"sku");
		   var ac = new Account(id,type,name,sku);
		   ledger.accounts[id] = ac;
	   });

	   console.log("reading balance");
	   var rList = book.getElementsByTagName("balances")[0].getElementsByTagName("balance");
           $.each(rList, function(i,b) {
		   var id = attr(b,"id");
		   var type = attr(b,"type");
		   var name = attr(b,"name");
		   var account = attr(b,"account");
		   var amount = attr(b,"amount");
		   var tr = new TransactionRow(account,amount,id,b.type,b.name);
		   ledger.balance.push(tr);
	   });

	   console.log("reading transactions");
	   var tList = book.getElementsByTagName("transactions")[0].getElementsByTagName("transaction");
           $.each(tList, function(i,t) {
                   var id = t.id; 
		   var tx = new Transaction(id,t.type,t.reporter);
		   ledger.transactions.push(tx);
	   });

	   if (callback) callback()

        },
        error:function(xhr,text,error) {
           alert(error);
        }    
      });

    },

    cents: function(f) {  // float into (-)###.##
	v = ""+Math.round(f*100)/100;
	if (v.indexOf(".") > 0) {
	    if ((v.indexOf(".") + 2) == v.length) {
		v = v + "0";
	    }
	} else { 
	    v = v + ".00";
	}
	return v;
    }

} 


