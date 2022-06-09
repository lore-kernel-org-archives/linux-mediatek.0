Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B52DC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Jun 2022 16:12:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ALVn5KhhnKhkADkR6tbOBObLmsJ/JZEQdV2WQwCag2U=; b=fGXDdJx0e1mvqz
	Xzil5rR2qeGBP1hNYHevtOKrebUqc85z6xIxGkiTpB0RLO532U9YZ8Hq4j8mE4BGQcGPvq11KyR+y
	1GHmgYyOiu6s5P2haU5z3hk1bdMwGwo8Qn9b57yIKQRhEFjS25oinGAXXqCdfYcFXzknYqVJuRtA7
	H3Av+vp2A5GTwVMB3zFMgGHNmCPKemUYhBGBt66zfGlMJyyen8ScETroD1lcKt+0uH25OmKP2NHxq
	cN/fFVPszNnreVSrncndYPRo/WgcLf9depEt458h1sji7kKDtJtdCZ+Ji1BR1Bg6VClZ+ko8SBpZY
	3/jSLQMCl8D1DS294h2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzKla-002pgX-GO; Thu, 09 Jun 2022 16:12:14 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzKlW-002pfP-Ot
	for linux-mediatek@lists.infradead.org; Thu, 09 Jun 2022 16:12:13 +0000
Received: by mail-wr1-x435.google.com with SMTP id d14so24086852wra.10
        for <linux-mediatek@lists.infradead.org>; Thu, 09 Jun 2022 09:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=XiAQQdU/syZOX3eZddGQQvraY9oVpO1zoYtsZwQRY3k=;
        b=STWPtDi+oAzSmtHAhwMSNDjOl2/fyL2ZJT4oNxXPfMUy9ajJs93VZOC+hLHAVcKZgU
         Gm04dw9gtP+Ui4FHjY9oN9XH1fqQbVEBTtQqdz6cyMkmRJy83pfncAs1dw6Q/k9IsnHw
         6JIK7/BdYFVP9SgeFh/Ebx1/vQEzJGoXeP3GogsrS6cYl6uuaqHiwpuNGSlIgBY8n8cW
         AHDgq44H4far41vngtYuuiF3irVYVSTbuMTckeeXdd8VFjSjRrPssDU9sTIAenm0CkK/
         Y47NOBtpGDMhqD5pWA8yAg5IDwdpT1orZrQ+uo4T6RK2fuq9Mog6bufHngmRaqHEEV+0
         2kAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=XiAQQdU/syZOX3eZddGQQvraY9oVpO1zoYtsZwQRY3k=;
        b=KMsDN9BC9c+WTnSawRQkRWIF7FDX0Ta6x2OlnTHoLeE9yxCplTupfh54hZwA9EZmoq
         yui5QxO9wcQDvGbJzybuDcB0txJ1rm+Nvn0+3FtqhFyiXUHMBMHzedh8sTH9/+Lu2U6w
         ENPZ6+vEqUvM4C2qqzM7KZ6NDcdDRIYK7bL5OIPe79kleOpQnnOLsks70B7SzAPsUmQY
         XREa66F4tf5vzVYxseX7+UQ3SPrMaY//KIq5VoUA3QqcJx3+x1opeNYOfExwJtwJj+GH
         gfqN9htG6G098E4k6EMuhBBFPMnjHQfi+KyUJ7AmO5mWNXiNNR+yLwpDllZjinOD2Swy
         pxIA==
X-Gm-Message-State: AOAM531FCsr5556E791mS8wUQQ51vda1O7J3BuDh1APdPbKkU0l+0EIT
	XJIi+NpDhUZUeC7pa2+OH3yeuQ==
X-Google-Smtp-Source: ABdhPJyNuZ+1HFvTvBnHQ0x5sU3r4iWWLOFW2JaLVDCEvHC7fSxcHi0ublXnUBe8MVGRA5FnIVcjUw==
X-Received: by 2002:a5d:47aa:0:b0:218:5ac8:f3a8 with SMTP id 10-20020a5d47aa000000b002185ac8f3a8mr11114082wrb.442.1654791126376;
        Thu, 09 Jun 2022 09:12:06 -0700 (PDT)
Received: from blmsp (dynamic-046-114-004-246.46.114.pool.telefonica.de. [46.114.4.246])
        by smtp.gmail.com with ESMTPSA id y6-20020adfee06000000b0021004d7d75asm25498970wrn.84.2022.06.09.09.12.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jun 2022 09:12:05 -0700 (PDT)
Date: Thu, 9 Jun 2022 18:12:03 +0200
From: Markus Schneider-Pargmann <msp@baylibre.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Fabien Parent <fparent@baylibre.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Alexandre Bailon <abailon@baylibre.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] soc: mediatek: add support of MTK_SCPD_STRICT_BUSP
 cap
Message-ID: <20220609161203.o33ydagex5r7pgd2@blmsp>
References: <20220530204214.913251-1-fparent@baylibre.com>
 <20220530204214.913251-3-fparent@baylibre.com>
 <bfe13669-0b22-2b50-12df-e37095faf62c@wanadoo.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <bfe13669-0b22-2b50-12df-e37095faf62c@wanadoo.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220609_091211_053557_42CB3EB8 
X-CRM114-Status: GOOD (  23.15  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGkgQ2hyaXN0b3BoZSwKCk9uIFR1ZSwgTWF5IDMxLCAyMDIyIGF0IDA3OjE3OjA4UE0gKzAyMDAs
IENocmlzdG9waGUgSkFJTExFVCB3cm90ZToKPiBMZSAzMC8wNS8yMDIyIMOgIDIyOjQyLCBGYWJp
ZW4gUGFyZW50IGEgw6ljcml0wqA6Cj4gPiBGcm9tOiBBbGV4YW5kcmUgQmFpbG9uIDxhYmFpbG9u
QGJheWxpYnJlLmNvbT4KPiA+IAo+ID4gVGhpcyBhZGRzIHN1cHBvcnQgb2YgTVRLX1NDUERfU1RS
SUNUX0JVU1AgY2FwLgo+ID4gVGhpcyBpcyByZXF1aXJlZCBieSB0aGUgbXQ4MzY1LCBmb3IgdGhl
IE1NIHBvd2VyIGRvbWFpbi4KPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogQWxleGFuZHJlIEJhaWxv
biA8YWJhaWxvbkBiYXlsaWJyZS5jb20+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBGYWJpZW4gUGFyZW50
IDxmcGFyZW50QGJheWxpYnJlLmNvbT4KPiA+IC0tLQo+ID4gICBkcml2ZXJzL3NvYy9tZWRpYXRl
ay9tdGstcG0tZG9tYWlucy5jIHwgMzcgKysrKysrKysrKysrKysrKysrKystLS0tLS0tCj4gPiAg
IGRyaXZlcnMvc29jL21lZGlhdGVrL210ay1wbS1kb21haW5zLmggfCAgMSArCj4gPiAgIDIgZmls
ZXMgY2hhbmdlZCwgMjkgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkKPiA+IAo+ID4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvc29jL21lZGlhdGVrL210ay1wbS1kb21haW5zLmMgYi9kcml2ZXJz
L3NvYy9tZWRpYXRlay9tdGstcG0tZG9tYWlucy5jCj4gPiBpbmRleCA5MGI5MWIzYjE5YTguLmJl
YWE1Nzg1ZmRhMiAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvc29jL21lZGlhdGVrL210ay1wbS1k
b21haW5zLmMKPiA+ICsrKyBiL2RyaXZlcnMvc29jL21lZGlhdGVrL210ay1wbS1kb21haW5zLmMK
PiA+IEBAIC0yNjMsMTcgKzI2MywzNiBAQCBzdGF0aWMgaW50IHNjcHN5c19wb3dlcl9vbihzdHJ1
Y3QgZ2VuZXJpY19wbV9kb21haW4gKmdlbnBkKQo+ID4gICAJcmVnbWFwX2NsZWFyX2JpdHMoc2Nw
c3lzLT5iYXNlLCBwZC0+ZGF0YS0+Y3RsX29mZnMsIFBXUl9JU09fQklUKTsKPiA+ICAgCXJlZ21h
cF9zZXRfYml0cyhzY3BzeXMtPmJhc2UsIHBkLT5kYXRhLT5jdGxfb2ZmcywgUFdSX1JTVF9CX0JJ
VCk7Cj4gPiAtCXJldCA9IGNsa19idWxrX3ByZXBhcmVfZW5hYmxlKHBkLT5udW1fc3Vic3lzX2Ns
a3MsIHBkLT5zdWJzeXNfY2xrcyk7Cj4gPiAtCWlmIChyZXQpCj4gPiAtCQlnb3RvIGVycl9wd3Jf
YWNrOwo+ID4gKwlpZiAoTVRLX1NDUERfQ0FQUyhwZCwgTVRLX1NDUERfU1RSSUNUX0JVU1ApKSB7
Cj4gPiArCQkvKgo+ID4gKwkJICogSW4gZmV3IE1lZGlhdGVrIHBsYXRmb3JtcyhlLmcuIE1UNjc3
OSksIHRoZSBidXMgcHJvdGVjdAo+ID4gKwkJICogcG9saWN5IGlzIHN0cmljdGVyLCB3aGljaCBs
ZWFkcyB0byBidXMgcHJvdGVjdCByZWxlYXNlIG11c3QKPiA+ICsJCSAqIGJlIHByaW9yIHRvIGJ1
cyBhY2Nlc3MuCj4gPiArCQkgKi8KPiA+ICsJCXJldCA9IHNjcHN5c19zcmFtX2VuYWJsZShwZCk7
Cj4gPiArCQlpZiAocmV0IDwgMCkKPiA+ICsJCQlnb3RvIGVycl9wd3JfYWNrOwo+IAo+IEhpLAo+
IHdpdGggdGhpcyBuZXcgcGF0aCwgdGhlIGVycm9yIGhhbmRsaW5nIHBhdGggbG9va3Mgb2RkIGJl
Y2F1c2UgdGhlIG9yZGVyIG9mCj4gb3BlcmF0aW9uIGlzIG5vdCB0aGUgc2FtZS4KClRydWUsIHRo
YW5rIHlvdS4gSSBhbSB0YWtpbmcgb3ZlciB0aGlzIHNlcmllcyBhbmQgd2lsbCBmaXggaXQgZm9y
IHYyLgoKQmVzdCwKTWFya3VzCgo+IAo+ID4gLQlyZXQgPSBzY3BzeXNfc3JhbV9lbmFibGUocGQp
Owo+ID4gLQlpZiAocmV0IDwgMCkKPiA+IC0JCWdvdG8gZXJyX2Rpc2FibGVfc3Vic3lzX2Nsa3M7
Cj4gPiArCQlyZXQgPSBzY3BzeXNfYnVzX3Byb3RlY3RfZGlzYWJsZShwZCk7Cj4gPiArCQlpZiAo
cmV0IDwgMCkKPiA+ICsJCQlnb3RvIGVycl9wd3JfYWNrOwo+IAo+IEhlcmUuLi4KPiAKPiA+IC0J
cmV0ID0gc2Nwc3lzX2J1c19wcm90ZWN0X2Rpc2FibGUocGQpOwo+ID4gLQlpZiAocmV0IDwgMCkK
PiA+IC0JCWdvdG8gZXJyX2Rpc2FibGVfc3JhbTsKPiA+ICsJCXJldCA9IGNsa19idWxrX3ByZXBh
cmVfZW5hYmxlKHBkLT5udW1fc3Vic3lzX2Nsa3MsIHBkLT5zdWJzeXNfY2xrcyk7Cj4gPiArCQlp
ZiAocmV0IDwgMCkKPiA+ICsJCQlnb3RvIGVycl9wd3JfYWNrOwo+IAo+IC4uLiBhbmQgaGVyZSBh
cyB3ZWxsLgo+IAo+IENKCj4gCj4gPiArCX0gZWxzZSB7Cj4gPiArCQlyZXQgPSBjbGtfYnVsa19w
cmVwYXJlX2VuYWJsZShwZC0+bnVtX3N1YnN5c19jbGtzLCBwZC0+c3Vic3lzX2Nsa3MpOwo+ID4g
KwkJaWYgKHJldCkKPiA+ICsJCQlnb3RvIGVycl9wd3JfYWNrOwo+ID4gKwo+ID4gKwkJcmV0ID0g
c2Nwc3lzX3NyYW1fZW5hYmxlKHBkKTsKPiA+ICsJCWlmIChyZXQgPCAwKQo+ID4gKwkJCWdvdG8g
ZXJyX2Rpc2FibGVfc3Vic3lzX2Nsa3M7Cj4gPiArCj4gPiArCQlyZXQgPSBzY3BzeXNfYnVzX3By
b3RlY3RfZGlzYWJsZShwZCk7Cj4gPiArCQlpZiAocmV0IDwgMCkKPiA+ICsJCQlnb3RvIGVycl9k
aXNhYmxlX3NyYW07Cj4gPiArCX0KPiA+ICAgCXJldHVybiAwOwo+ID4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvc29jL21lZGlhdGVrL210ay1wbS1kb21haW5zLmggYi9kcml2ZXJzL3NvYy9tZWRpYXRl
ay9tdGstcG0tZG9tYWlucy5oCj4gPiBpbmRleCBhMzk1NWQ5NjAyMzMuLjUzNDc0NzFiYzNjNCAx
MDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvc29jL21lZGlhdGVrL210ay1wbS1kb21haW5zLmgKPiA+
ICsrKyBiL2RyaXZlcnMvc29jL21lZGlhdGVrL210ay1wbS1kb21haW5zLmgKPiA+IEBAIC04LDYg
KzgsNyBAQAo+ID4gICAjZGVmaW5lIE1US19TQ1BEX1NSQU1fSVNPCQlCSVQoMikKPiA+ICAgI2Rl
ZmluZSBNVEtfU0NQRF9LRUVQX0RFRkFVTFRfT0ZGCUJJVCgzKQo+ID4gICAjZGVmaW5lIE1US19T
Q1BEX0RPTUFJTl9TVVBQTFkJCUJJVCg0KQo+ID4gKyNkZWZpbmUgTVRLX1NDUERfU1RSSUNUX0JV
U1AJCUJJVCg1KQo+ID4gICAjZGVmaW5lIE1US19TQ1BEX0NBUFMoX3NjcGQsIF94KQkoKF9zY3Bk
KS0+ZGF0YS0+Y2FwcyAmIChfeCkpCj4gPiAgICNkZWZpbmUgU1BNX1ZERV9QV1JfQ09OCQkJMHgw
MjEwCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1l
ZGlhdGVrCg==
