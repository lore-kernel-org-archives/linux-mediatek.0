Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91752C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 May 2022 09:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XjRcxrIqZRsaCLEqKHCSpSWEK0PhMcjWUzP+0h8zHK4=; b=IPCz+ec6PtQqld
	J/M6lkZpBMEJ3FfPVlyZV5IvLgzOzCf70G+ak93gEOVylOdMWpS+0EkRo1R07jRFhQgzjLPGluJpP
	Vq/K22fTZVrhriObVwo5KX1wMX8+P9ppENACg1U0d/3rVIEsFmZFTltILXGqGJ60l3LVF1HfrRpcf
	X+vNdw9uYWNQwDXADGTT57R2YZ7WJJEULWGLRAjpbrTc5Qiv6SFw9bof/t04ps5gZzdGI5K6efZ1h
	6eaURl6EpTESu4Kz3VJ/QVXWM9IoNHv8D+9Ui2UDyYVgjO3vChEnEYkV6Wu66L6eWqCnD9Bc6HMW0
	nQMqgUVCdZwF74iLROzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nt4oj-003290-6o; Mon, 23 May 2022 09:57:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nt2pu-002AAA-Eh; Mon, 23 May 2022 07:50:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
 :Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=DvhYrx98e/bvm+6euBlAh1Ati6s4ymRc78DPvLIPdzg=; b=mvmRp7iUeK89GIRjeJ6rdx8ynA
 nOCx51FbVFSuU4+W3MqMnzdIIaNj4i06QVo4UTXgTuSKHpwGUbf8BN/YxmmOrt9NLuvrYHIou31IG
 o58Ekyv76l+ow1YjzRqM/jhQaj5cgGYCxkPV4EFDQpD+a/mCMWWrZsqDp3KycI3DFLefWzlllIvE4
 ulH+ei44xzUxglf+RcHUr07tEde1UND1ZmiOLZNCpUnwkYKVu+mNuQs87PzhSnpx9GtqrrPCXhHY+
 d8hsCbZBotKY6c3xx9Cvdy6iAZe1tT1w0VMJuQ+C1CE6cyz/WrOyMCOABeApX0FHCFtMe2malzhvp
 UI74Aa1w==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nt0OU-000qj7-Mz; Mon, 23 May 2022 05:14:18 +0000
X-UUID: 53d581c0ee774e03b7c107b32b1acc8e-20220522
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5, REQID:8a044e0e-ee87-4851-917c-ff71a9d31c4a, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:2a19b09, CLOUDID:9f923c7a-5ef6-470b-96c9-bdb8ced32786,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
 ,QS:0,BEC:nil
X-UUID: 53d581c0ee774e03b7c107b32b1acc8e-20220522
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1275019573; Sun, 22 May 2022 22:13:48 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 22 May 2022 22:08:54 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Mon, 23 May 2022 13:08:52 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 23 May 2022 13:08:52 +0800
Message-ID: <9a401f9e0bc1324e801ba05ec4a2269fa82322f2.camel@mediatek.com>
Subject: Re: [PATCH v7 04/19] clk: mediatek: reset: Extract common drivers
 to update function
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: "=?ISO-8859-1?Q?N=EDcolas?= F. R. A. Prado" <nfraprado@collabora.com>
CC: <mturquette@baylibre.com>, <sboyd@kernel.org>, <matthias.bgg@gmail.com>,
 <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
 <p.zabel@pengutronix.de>, <angelogioacchino.delregno@collabora.com>,
 <chun-jie.chen@mediatek.com>, <wenst@chromium.org>,
 <runyang.chen@mediatek.com>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-clk@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Mon, 23 May 2022 13:08:52 +0800
In-Reply-To: <20220520145551.b2sqheaizkegna3n@notapiano>
References: <20220519125527.18544-1-rex-bc.chen@mediatek.com>
 <20220519125527.18544-5-rex-bc.chen@mediatek.com>
 <20220520145551.b2sqheaizkegna3n@notapiano>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220523_061416_637728_C62C3B53 
X-CRM114-Status: GOOD (  19.65  )
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

T24gRnJpLCAyMDIyLTA1LTIwIGF0IDEwOjU1IC0wNDAwLCBOw61jb2xhcyBGLiBSLiBBLiBQcmFk
byB3cm90ZToKPiBPbiBUaHUsIE1heSAxOSwgMjAyMiBhdCAwODo1NToxMlBNICswODAwLCBSZXgt
QkMgQ2hlbiB3cm90ZToKPiA+IFRvIG1ha2UgZHJpdmVycyBtb3JlIGNsZWFyIGFuZCByZWFkYWJs
ZSwgd2UgZXh0cmFjdCBjb21tb24gY29kZQo+ID4gd2l0aGluIGFzc2VydCBhbmQgZGVhc3NlcnQg
dG8gbXRrX3Jlc2V0X3VwZGF0ZV9zZXRfY2xyKCkgYW5kCj4gPiBtdGtfcmVzZXRfdXBkYXRlKCku
Cj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IFJleC1CQyBDaGVuIDxyZXgtYmMuY2hlbkBtZWRpYXRl
ay5jb20+Cj4gPiBSZXZpZXdlZC1ieTogQW5nZWxvR2lvYWNjaGlubyBEZWwgUmVnbm8gPAo+ID4g
YW5nZWxvZ2lvYWNjaGluby5kZWxyZWdub0Bjb2xsYWJvcmEuY29tPgo+ID4gLS0tCj4gPiAgZHJp
dmVycy9jbGsvbWVkaWF0ZWsvcmVzZXQuYyB8IDM4ICsrKysrKysrKysrKysrKysrKysrKy0tLS0t
LS0tLS0tCj4gPiAtLS0tCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDIyIGluc2VydGlvbnMoKyksIDE2
IGRlbGV0aW9ucygtKQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9jbGsvbWVkaWF0ZWsv
cmVzZXQuYwo+ID4gYi9kcml2ZXJzL2Nsay9tZWRpYXRlay9yZXNldC5jCj4gPiBpbmRleCA1Y2Ji
Y2MyMmE0ZmMuLjIyZmE5ZjA5NzUyYyAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvY2xrL21lZGlh
dGVrL3Jlc2V0LmMKPiA+ICsrKyBiL2RyaXZlcnMvY2xrL21lZGlhdGVrL3Jlc2V0LmMKPiA+IEBA
IC0xMiwyNCArMTIsMjcgQEAKPiA+ICAKPiA+ICAjaW5jbHVkZSAicmVzZXQuaCIKPiA+ICAKPiA+
IC1zdGF0aWMgaW50IG10a19yZXNldF9hc3NlcnQoc3RydWN0IHJlc2V0X2NvbnRyb2xsZXJfZGV2
ICpyY2RldiwKPiA+IC0JCQkgICAgdW5zaWduZWQgbG9uZyBpZCkKPiA+ICtzdGF0aWMgaW50IG10
a19yZXNldF91cGRhdGUoc3RydWN0IHJlc2V0X2NvbnRyb2xsZXJfZGV2ICpyY2RldiwKPiA+ICsJ
CQkgICAgdW5zaWduZWQgbG9uZyBpZCwgYm9vbCBkZWFzc2VydCkKPiAKPiBJJ2QgaGF2ZSBjYWxs
ZWQgdGhlIGJvb2wgJ2Fzc2VydCcsIGFuZCB0aGVuIHBhc3NlZCB0cnVlIG9uIGFzc2VydCBhbmQK
PiBmYWxzZSBvbgo+IGRlYXNzZXJ0LCBhcyBJIHRoaW5rIHRoYXQncyBzbGlnaHRseSBtb3JlIGlu
dHVpdGl2ZSwgYnV0IHRoYXQncyBqdXN0Cj4gcGVyc29uYWwKPiBwcmVmZXJlbmNlLiBJdCdzIGZp
bmUgbGlrZSB0aGlzIGFzIHdlbGwuCj4gCj4gVGhhbmtzLAo+IE7DrWNvbGFzCj4gCgpIZWxsbyBO
w61jb2xhcywKClRoYW5rcyBmb3IgeW91ciBhZHZpY2UsIGJ1dCBJIHRoaW5rIEkgd2lsbCBrZWVw
IHRoZSBvcmlnaW5hbCBsb2dpYyBpbgpuZXh0IHZlcnNpb24uCgpCUnMsClJleAoKCj4gPiAgewo+
ID4gIAlzdHJ1Y3QgbXRrX3Jlc2V0ICpkYXRhID0gY29udGFpbmVyX29mKHJjZGV2LCBzdHJ1Y3Qg
bXRrX3Jlc2V0LAo+ID4gcmNkZXYpOwo+ID4gKwl1bnNpZ25lZCBpbnQgdmFsID0gZGVhc3NlcnQg
PyAwIDogfjA7Cj4gPiAgCj4gPiAgCXJldHVybiByZWdtYXBfdXBkYXRlX2JpdHMoZGF0YS0+cmVn
bWFwLAo+ID4gIAkJCQkgIGRhdGEtPnJlZ29mcyArICgoaWQgLyAzMikgPDwgMiksCj4gPiAtCQkJ
CSAgQklUKGlkICUgMzIpLCB+MCk7Cj4gPiArCQkJCSAgQklUKGlkICUgMzIpLCB2YWwpOwo+ID4g
K30KPiA+ICsKPiA+ICtzdGF0aWMgaW50IG10a19yZXNldF9hc3NlcnQoc3RydWN0IHJlc2V0X2Nv
bnRyb2xsZXJfZGV2ICpyY2RldiwKPiA+ICsJCQkgICAgdW5zaWduZWQgbG9uZyBpZCkKPiA+ICt7
Cj4gPiArCXJldHVybiBtdGtfcmVzZXRfdXBkYXRlKHJjZGV2LCBpZCwgZmFsc2UpOwo+ID4gIH0K
PiA+ICAKPiA+ICBzdGF0aWMgaW50IG10a19yZXNldF9kZWFzc2VydChzdHJ1Y3QgcmVzZXRfY29u
dHJvbGxlcl9kZXYgKnJjZGV2LAo+ID4gIAkJCSAgICAgIHVuc2lnbmVkIGxvbmcgaWQpCj4gPiAg
ewo+ID4gLQlzdHJ1Y3QgbXRrX3Jlc2V0ICpkYXRhID0gY29udGFpbmVyX29mKHJjZGV2LCBzdHJ1
Y3QgbXRrX3Jlc2V0LAo+ID4gcmNkZXYpOwo+ID4gLQo+ID4gLQlyZXR1cm4gcmVnbWFwX3VwZGF0
ZV9iaXRzKGRhdGEtPnJlZ21hcCwKPiA+IC0JCQkJICBkYXRhLT5yZWdvZnMgKyAoKGlkIC8gMzIp
IDw8IDIpLAo+ID4gLQkJCQkgIEJJVChpZCAlIDMyKSwgMCk7Cj4gPiArCXJldHVybiBtdGtfcmVz
ZXRfdXBkYXRlKHJjZGV2LCBpZCwgdHJ1ZSk7Cj4gPiAgfQo+ID4gIAo+ID4gIHN0YXRpYyBpbnQg
bXRrX3Jlc2V0KHN0cnVjdCByZXNldF9jb250cm9sbGVyX2RldiAqcmNkZXYsIHVuc2lnbmVkCj4g
PiBsb25nIGlkKQo+ID4gQEAgLTQzLDI0ICs0NiwyNyBAQCBzdGF0aWMgaW50IG10a19yZXNldChz
dHJ1Y3QKPiA+IHJlc2V0X2NvbnRyb2xsZXJfZGV2ICpyY2RldiwgdW5zaWduZWQgbG9uZyBpZCkK
PiA+ICAJcmV0dXJuIG10a19yZXNldF9kZWFzc2VydChyY2RldiwgaWQpOwo+ID4gIH0KPiA+ICAK
PiA+IC1zdGF0aWMgaW50IG10a19yZXNldF9hc3NlcnRfc2V0X2NscihzdHJ1Y3QgcmVzZXRfY29u
dHJvbGxlcl9kZXYKPiA+ICpyY2RldiwKPiA+IC0JCQkJICAgIHVuc2lnbmVkIGxvbmcgaWQpCj4g
PiArc3RhdGljIGludCBtdGtfcmVzZXRfdXBkYXRlX3NldF9jbHIoc3RydWN0IHJlc2V0X2NvbnRy
b2xsZXJfZGV2Cj4gPiAqcmNkZXYsCj4gPiArCQkJCSAgICB1bnNpZ25lZCBsb25nIGlkLCBib29s
IGRlYXNzZXJ0KQo+ID4gIHsKPiA+ICAJc3RydWN0IG10a19yZXNldCAqZGF0YSA9IGNvbnRhaW5l
cl9vZihyY2Rldiwgc3RydWN0IG10a19yZXNldCwKPiA+IHJjZGV2KTsKPiA+ICsJdW5zaWduZWQg
aW50IGRlYXNzZXJ0X29mcyA9IGRlYXNzZXJ0ID8gMHg0IDogMDsKPiA+ICAKPiA+ICAJcmV0dXJu
IHJlZ21hcF93cml0ZShkYXRhLT5yZWdtYXAsCj4gPiAtCQkJICAgIGRhdGEtPnJlZ29mcyArICgo
aWQgLyAzMikgPDwgNCksCj4gPiArCQkJICAgIGRhdGEtPnJlZ29mcyArICgoaWQgLyAzMikgPDwg
NCkgKwo+ID4gZGVhc3NlcnRfb2ZzLAo+ID4gIAkJCSAgICBCSVQoaWQgJSAzMikpOwo+ID4gIH0K
PiA+ICAKPiA+ICtzdGF0aWMgaW50IG10a19yZXNldF9hc3NlcnRfc2V0X2NscihzdHJ1Y3QgcmVz
ZXRfY29udHJvbGxlcl9kZXYKPiA+ICpyY2RldiwKPiA+ICsJCQkJICAgIHVuc2lnbmVkIGxvbmcg
aWQpCj4gPiArewo+ID4gKwlyZXR1cm4gbXRrX3Jlc2V0X3VwZGF0ZV9zZXRfY2xyKHJjZGV2LCBp
ZCwgZmFsc2UpOwo+ID4gK30KPiA+ICsKPiA+ICBzdGF0aWMgaW50IG10a19yZXNldF9kZWFzc2Vy
dF9zZXRfY2xyKHN0cnVjdCByZXNldF9jb250cm9sbGVyX2Rldgo+ID4gKnJjZGV2LAo+ID4gIAkJ
CQkgICAgICB1bnNpZ25lZCBsb25nIGlkKQo+ID4gIHsKPiA+IC0Jc3RydWN0IG10a19yZXNldCAq
ZGF0YSA9IGNvbnRhaW5lcl9vZihyY2Rldiwgc3RydWN0IG10a19yZXNldCwKPiA+IHJjZGV2KTsK
PiA+IC0KPiA+IC0JcmV0dXJuIHJlZ21hcF93cml0ZShkYXRhLT5yZWdtYXAsCj4gPiAtCQkJICAg
IGRhdGEtPnJlZ29mcyArICgoaWQgLyAzMikgPDwgNCkgKyAweDQsCj4gPiAtCQkJICAgIEJJVChp
ZCAlIDMyKSk7Cj4gPiArCXJldHVybiBtdGtfcmVzZXRfdXBkYXRlX3NldF9jbHIocmNkZXYsIGlk
LCB0cnVlKTsKPiA+ICB9Cj4gPiAgCj4gPiAgc3RhdGljIGludCBtdGtfcmVzZXRfc2V0X2Nscihz
dHJ1Y3QgcmVzZXRfY29udHJvbGxlcl9kZXYgKnJjZGV2LAo+ID4gLS0gCj4gPiAyLjE4LjAKPiA+
IAo+ID4gCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
ZWRpYXRlawo=
