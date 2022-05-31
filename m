Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 428CFC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 May 2022 17:17:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EoXq2JFSsFX6qLMMabz0iRoND3DLd8lh/jPCvQ4PxCA=; b=p+ID89FMASGqdZ
	n7f3Iv8qIkJJ9RA5PWQGf60cLWz6qTMP9REIZV46W3UdCUIZUFxOEaMtEKsRcSVQVjpF28h+xZG6S
	T7CJ1hK7apfR01fmRGjlAitCXjeObn8B68MDGiw69Emf3+NGYxmclKUZaa/PLzeRT4VU9MQPXPBCg
	iUfnGr0B63mek3huPG1cG50rTFbC/pKHTVKthOxzUJ+URG5tIpFOsRbbS+xsq8yv7tdsB91a7IZ1v
	Etmvrk9HRpUHPSj1iMx0woKc+aBQP6HjYGeQbz4VX9LfzJBhmyeriaGJBBbG51XItRGQWv1mkwWfn
	clnViPen2ZjmP1ciyogg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nw5Uj-00C1DL-Ey; Tue, 31 May 2022 17:17:25 +0000
Received: from smtp08.smtpout.orange.fr ([80.12.242.130] helo=smtp.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nw5Uf-00C17R-SI
	for linux-mediatek@lists.infradead.org; Tue, 31 May 2022 17:17:24 +0000
Received: from [192.168.1.18] ([90.11.190.129])
	by smtp.orange.fr with ESMTPA
	id w5USneYqRNUm1w5UTnpWfe; Tue, 31 May 2022 19:17:11 +0200
X-ME-Helo: [192.168.1.18]
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Tue, 31 May 2022 19:17:11 +0200
X-ME-IP: 90.11.190.129
Message-ID: <bfe13669-0b22-2b50-12df-e37095faf62c@wanadoo.fr>
Date: Tue, 31 May 2022 19:17:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 3/4] soc: mediatek: add support of MTK_SCPD_STRICT_BUSP
 cap
Content-Language: fr
To: Fabien Parent <fparent@baylibre.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Alexandre Bailon <abailon@baylibre.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20220530204214.913251-1-fparent@baylibre.com>
 <20220530204214.913251-3-fparent@baylibre.com>
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20220530204214.913251-3-fparent@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220531_101722_061711_857A0861 
X-CRM114-Status: GOOD (  20.43  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

TGUgMzAvMDUvMjAyMiDDoCAyMjo0MiwgRmFiaWVuIFBhcmVudCBhIMOpY3JpdMKgOgo+IEZyb206
IEFsZXhhbmRyZSBCYWlsb24gPGFiYWlsb25AYmF5bGlicmUuY29tPgo+IAo+IFRoaXMgYWRkcyBz
dXBwb3J0IG9mIE1US19TQ1BEX1NUUklDVF9CVVNQIGNhcC4KPiBUaGlzIGlzIHJlcXVpcmVkIGJ5
IHRoZSBtdDgzNjUsIGZvciB0aGUgTU0gcG93ZXIgZG9tYWluLgo+IAo+IFNpZ25lZC1vZmYtYnk6
IEFsZXhhbmRyZSBCYWlsb24gPGFiYWlsb25AYmF5bGlicmUuY29tPgo+IFNpZ25lZC1vZmYtYnk6
IEZhYmllbiBQYXJlbnQgPGZwYXJlbnRAYmF5bGlicmUuY29tPgo+IC0tLQo+ICAgZHJpdmVycy9z
b2MvbWVkaWF0ZWsvbXRrLXBtLWRvbWFpbnMuYyB8IDM3ICsrKysrKysrKysrKysrKysrKysrLS0t
LS0tLQo+ICAgZHJpdmVycy9zb2MvbWVkaWF0ZWsvbXRrLXBtLWRvbWFpbnMuaCB8ICAxICsKPiAg
IDIgZmlsZXMgY2hhbmdlZCwgMjkgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkKPiAKPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9zb2MvbWVkaWF0ZWsvbXRrLXBtLWRvbWFpbnMuYyBiL2RyaXZl
cnMvc29jL21lZGlhdGVrL210ay1wbS1kb21haW5zLmMKPiBpbmRleCA5MGI5MWIzYjE5YTguLmJl
YWE1Nzg1ZmRhMiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3NvYy9tZWRpYXRlay9tdGstcG0tZG9t
YWlucy5jCj4gKysrIGIvZHJpdmVycy9zb2MvbWVkaWF0ZWsvbXRrLXBtLWRvbWFpbnMuYwo+IEBA
IC0yNjMsMTcgKzI2MywzNiBAQCBzdGF0aWMgaW50IHNjcHN5c19wb3dlcl9vbihzdHJ1Y3QgZ2Vu
ZXJpY19wbV9kb21haW4gKmdlbnBkKQo+ICAgCXJlZ21hcF9jbGVhcl9iaXRzKHNjcHN5cy0+YmFz
ZSwgcGQtPmRhdGEtPmN0bF9vZmZzLCBQV1JfSVNPX0JJVCk7Cj4gICAJcmVnbWFwX3NldF9iaXRz
KHNjcHN5cy0+YmFzZSwgcGQtPmRhdGEtPmN0bF9vZmZzLCBQV1JfUlNUX0JfQklUKTsKPiAgIAo+
IC0JcmV0ID0gY2xrX2J1bGtfcHJlcGFyZV9lbmFibGUocGQtPm51bV9zdWJzeXNfY2xrcywgcGQt
PnN1YnN5c19jbGtzKTsKPiAtCWlmIChyZXQpCj4gLQkJZ290byBlcnJfcHdyX2FjazsKPiArCWlm
IChNVEtfU0NQRF9DQVBTKHBkLCBNVEtfU0NQRF9TVFJJQ1RfQlVTUCkpIHsKPiArCQkvKgo+ICsJ
CSAqIEluIGZldyBNZWRpYXRlayBwbGF0Zm9ybXMoZS5nLiBNVDY3NzkpLCB0aGUgYnVzIHByb3Rl
Y3QKPiArCQkgKiBwb2xpY3kgaXMgc3RyaWN0ZXIsIHdoaWNoIGxlYWRzIHRvIGJ1cyBwcm90ZWN0
IHJlbGVhc2UgbXVzdAo+ICsJCSAqIGJlIHByaW9yIHRvIGJ1cyBhY2Nlc3MuCj4gKwkJICovCj4g
KwkJcmV0ID0gc2Nwc3lzX3NyYW1fZW5hYmxlKHBkKTsKPiArCQlpZiAocmV0IDwgMCkKPiArCQkJ
Z290byBlcnJfcHdyX2FjazsKCkhpLAp3aXRoIHRoaXMgbmV3IHBhdGgsIHRoZSBlcnJvciBoYW5k
bGluZyBwYXRoIGxvb2tzIG9kZCBiZWNhdXNlIHRoZSBvcmRlciAKb2Ygb3BlcmF0aW9uIGlzIG5v
dCB0aGUgc2FtZS4KCj4gICAKPiAtCXJldCA9IHNjcHN5c19zcmFtX2VuYWJsZShwZCk7Cj4gLQlp
ZiAocmV0IDwgMCkKPiAtCQlnb3RvIGVycl9kaXNhYmxlX3N1YnN5c19jbGtzOwo+ICsJCXJldCA9
IHNjcHN5c19idXNfcHJvdGVjdF9kaXNhYmxlKHBkKTsKPiArCQlpZiAocmV0IDwgMCkKPiArCQkJ
Z290byBlcnJfcHdyX2FjazsKCkhlcmUuLi4KCj4gICAKPiAtCXJldCA9IHNjcHN5c19idXNfcHJv
dGVjdF9kaXNhYmxlKHBkKTsKPiAtCWlmIChyZXQgPCAwKQo+IC0JCWdvdG8gZXJyX2Rpc2FibGVf
c3JhbTsKPiArCQlyZXQgPSBjbGtfYnVsa19wcmVwYXJlX2VuYWJsZShwZC0+bnVtX3N1YnN5c19j
bGtzLCBwZC0+c3Vic3lzX2Nsa3MpOwo+ICsJCWlmIChyZXQgPCAwKQo+ICsJCQlnb3RvIGVycl9w
d3JfYWNrOwoKLi4uIGFuZCBoZXJlIGFzIHdlbGwuCgpDSgoKPiArCX0gZWxzZSB7Cj4gKwkJcmV0
ID0gY2xrX2J1bGtfcHJlcGFyZV9lbmFibGUocGQtPm51bV9zdWJzeXNfY2xrcywgcGQtPnN1YnN5
c19jbGtzKTsKPiArCQlpZiAocmV0KQo+ICsJCQlnb3RvIGVycl9wd3JfYWNrOwo+ICsKPiArCQly
ZXQgPSBzY3BzeXNfc3JhbV9lbmFibGUocGQpOwo+ICsJCWlmIChyZXQgPCAwKQo+ICsJCQlnb3Rv
IGVycl9kaXNhYmxlX3N1YnN5c19jbGtzOwo+ICsKPiArCQlyZXQgPSBzY3BzeXNfYnVzX3Byb3Rl
Y3RfZGlzYWJsZShwZCk7Cj4gKwkJaWYgKHJldCA8IDApCj4gKwkJCWdvdG8gZXJyX2Rpc2FibGVf
c3JhbTsKPiArCX0KPiAgIAo+ICAgCXJldHVybiAwOwo+ICAgCj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvc29jL21lZGlhdGVrL210ay1wbS1kb21haW5zLmggYi9kcml2ZXJzL3NvYy9tZWRpYXRlay9t
dGstcG0tZG9tYWlucy5oCj4gaW5kZXggYTM5NTVkOTYwMjMzLi41MzQ3NDcxYmMzYzQgMTAwNjQ0
Cj4gLS0tIGEvZHJpdmVycy9zb2MvbWVkaWF0ZWsvbXRrLXBtLWRvbWFpbnMuaAo+ICsrKyBiL2Ry
aXZlcnMvc29jL21lZGlhdGVrL210ay1wbS1kb21haW5zLmgKPiBAQCAtOCw2ICs4LDcgQEAKPiAg
ICNkZWZpbmUgTVRLX1NDUERfU1JBTV9JU08JCUJJVCgyKQo+ICAgI2RlZmluZSBNVEtfU0NQRF9L
RUVQX0RFRkFVTFRfT0ZGCUJJVCgzKQo+ICAgI2RlZmluZSBNVEtfU0NQRF9ET01BSU5fU1VQUExZ
CQlCSVQoNCkKPiArI2RlZmluZSBNVEtfU0NQRF9TVFJJQ1RfQlVTUAkJQklUKDUpCj4gICAjZGVm
aW5lIE1US19TQ1BEX0NBUFMoX3NjcGQsIF94KQkoKF9zY3BkKS0+ZGF0YS0+Y2FwcyAmIChfeCkp
Cj4gICAKPiAgICNkZWZpbmUgU1BNX1ZERV9QV1JfQ09OCQkJMHgwMjEwCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGlu
ZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
