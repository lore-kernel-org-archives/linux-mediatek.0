Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E563C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 May 2022 08:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F5BJAkUYnNc/Si14mgPePM/HLIQMr3Y0jFHLKkAOhX8=; b=OvS8oZCCdNUnEu
	fDslldyGKUUQ1AizcVsZorE8hWtQpKtPIiToqZwEuTcS9+kpp5VzEIh4N5zbfBdpt2d/jShfRIKpY
	cAXI3n+h/KpaNSWhr1lu/Tr4J1PeTANHKs2twHpfUfzK2MaEeXDbegovuvaOklbOxsCNfUL6NaRaY
	ion9FlmMVqNDhXVvrez/rP28LKez9EpHi2iggIH1gN2WfVQeOFkOpTt9dGFao+hUC4BgIXgrSk7pL
	8dvxeTnx5yMfzUq3evu7HEu5pbx66Z4LdeUrc4uLpA/sXkYepD/PDtIcdv5MQ2z6I+88/nXOYjoJ2
	RbzSt/TFShY0rtGD63Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nt3uG-002dWe-OU; Mon, 23 May 2022 08:59:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nt2pz-002A7b-Sc; Mon, 23 May 2022 07:50:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
 :Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=ISirZv7u2fGLKuAG94sOY5WyWEVOlTjqq7rCj0x7ue8=; b=jZrrG95oLKt5zSByfFay2Aw8WD
 32C9YAKT59v/fEt1ekWcbGnXp2oY8ELZc8YCrlUg8TslUsjQ5mvrnaGXaK5frcp34FADSX3fC+269
 D3scyNfJeu2SguMfh+UpCcAU/+ohRKXlT2CSBn/pM6JoxsEoHvMYm3WSKFMLdP14Fo2vEZwAOfOGL
 eqyTuwO++kSHS0GK0Nc9WWnCTubheyuO+25A6N/t66zUfOS3K/Ncc5u0ZAfiMCJv75EGIzhdK7f7h
 4TqrJZbsGPZNabSrsA7bdY92eZ+TTXaengAkoE5VZjISMNQ274pgXvbPS1qxvr5Bhr2kagNNNWhff
 jTAX4wlQ==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nt0Mm-000qg4-1t; Mon, 23 May 2022 05:12:31 +0000
X-UUID: e8dc38e9236743a8a132da336603ca8f-20220522
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5, REQID:516e76c8-894a-406f-a641-30ff3be8b6b4, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:2a19b09, CLOUDID:71853c7a-5ef6-470b-96c9-bdb8ced32786,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
 ,QS:0,BEC:nil
X-UUID: e8dc38e9236743a8a132da336603ca8f-20220522
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1585277053; Sun, 22 May 2022 22:12:23 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 22 May 2022 22:12:21 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Mon, 23 May 2022 13:12:19 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 23 May 2022 13:12:19 +0800
Message-ID: <5484a9e2be7e71c3ecc86f4184f076be09ee9420.camel@mediatek.com>
Subject: Re: [PATCH v7 00/19] Cleanup MediaTek clk reset drivers and support
 SoCs
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
Date: Mon, 23 May 2022 13:12:19 +0800
In-Reply-To: <20220520154020.dywardvr3silhjwk@notapiano>
References: <20220519125527.18544-1-rex-bc.chen@mediatek.com>
 <20220520154020.dywardvr3silhjwk@notapiano>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220523_061228_770366_B25613E1 
X-CRM114-Status: GOOD (  20.13  )
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

T24gRnJpLCAyMDIyLTA1LTIwIGF0IDExOjQwIC0wNDAwLCBOw61jb2xhcyBGLiBSLiBBLiBQcmFk
byB3cm90ZToKPiBPbiBUaHUsIE1heSAxOSwgMjAyMiBhdCAwODo1NTowOFBNICswODAwLCBSZXgt
QkMgQ2hlbiB3cm90ZToKPiA+IEluIHRoaXMgc2VyaWVzLCB3ZSBjbGVhbnVwIE1lZGlhVGVrIGNs
b2NrIHJlc2V0IGRyaXZlcnMgaW4KPiA+IGNsay9tZWRpYXRlawo+ID4gZm9sZGVyLiBNZWRpYVRl
ayBjbG9jayByZXNldCBkcml2ZXIgaXMgdXNlZCB0byBwcm92aWRlIHJlc2V0Cj4gPiBjb250cm9s
Cj4gPiBvZiBtb2R1bGVzIGNvbnRyb2xsZWQgaW4gY2xrLCBsaWtlIGluZnJhX2FvLgo+ID4gCj4g
PiBDaGFuZ2VzIGZvciB2NzoKPiA+IDEuIHY3IGlzIGJhc2VkIG9uIGxpbnV4LW5leHQgbmV4dC0y
MDIyMDUxOSBhbmQgQ2hlbi1ZdSdzIHNlcmllc1sxXS4KPiA+IDIuIEFkZCBzdXBwb3J0IGZvciBN
VDgxODYuCj4gPiAKPiA+IFsxXTogCj4gPiBodHRwczovL3VybGRlZmVuc2UuY29tL3YzL19faHR0
cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L2xpbnV4LW1lZGlhdGVrL2xpc3QvP3Nl
cmllcz02NDMwMDNfXzshIUNUUk5LQTl3TWcwQVJidyEzTl9SMVIycVhZZC12TFVFLUJ6cmMxWkRf
MzlsaUZPNlZ6X1J5SmRQaXVBeW9NSE80VHVhb093V2sxa2E1MGJWZV8wZmR5SmFrQi1GekNMR2p6
ZFZ0c2Q2c1EkCj4gPiAgCj4gPiAKPiA+IENoYW5nZXMgZm9yIHY2Ogo+ID4gMS4gQWRkIGEgbmV3
IHBhdGNoIHRvIHN1cHBvcnQgaW51cHV0IGFyZ3VtZW50IGluZGV4IG1vZGUuCj4gPiAyLiBSZXZp
c2UgZGVmaW5pdGlvbiBpbiByZXNldC5oIHRvIGluZGV4Lgo+ID4gCj4gPiBSZXgtQkMgQ2hlbiAo
MTkpOgo+ID4gICBjbGs6IG1lZGlhdGVrOiByZXNldDogQWRkIHJlc2V0LmgKPiA+ICAgY2xrOiBt
ZWRpYXRlazogcmVzZXQ6IEZpeCB3cml0dGVuIHJlc2V0IGJpdCBvZmZzZXQKPiA+ICAgY2xrOiBt
ZWRpYXRlazogcmVzZXQ6IFJlZmluZSBhbmQgcmVvcmRlciBmdW5jdGlvbnMgaW4gcmVzZXQuYwo+
ID4gICBjbGs6IG1lZGlhdGVrOiByZXNldDogRXh0cmFjdCBjb21tb24gZHJpdmVycyB0byB1cGRh
dGUgZnVuY3Rpb24KPiA+ICAgY2xrOiBtZWRpYXRlazogcmVzZXQ6IE1lcmdlIGFuZCByZXZpc2Ug
cmVzZXQgcmVnaXN0ZXIgZnVuY3Rpb24KPiA+ICAgY2xrOiBtZWRpYXRlazogcmVzZXQ6IFJldmlz
ZSBzdHJ1Y3R1cmUgdG8gY29udHJvbCByZXNldCByZWdpc3Rlcgo+ID4gICBjbGs6IG1lZGlhdGVr
OiByZXNldDogU3VwcG9ydCBub25zZXF1ZW5jZSBiYXNlIG9mZnNldHMgb2YgcmVzZXQKPiA+ICAg
ICByZWdpc3RlcnMKPiA+ICAgY2xrOiBtZWRpYXRlazogcmVzZXQ6IFN1cHBvcnQgaW51cHV0IGFy
Z3VtZW50IGluZGV4IG1vZGUKPiA+ICAgY2xrOiBtZWRpYXRlazogcmVzZXQ6IENoYW5nZSByZXR1
cm4gdHlwZSBmb3IgY2xvY2sgcmVzZXQgcmVnaXN0ZXIKPiA+ICAgICBmdW5jdGlvbgo+ID4gICBj
bGs6IG1lZGlhdGVrOiByZXNldDogQWRkIG5ldyByZWdpc3RlciByZXNldCBmdW5jdGlvbiB3aXRo
IGRldmljZQo+ID4gICBjbGs6IG1lZGlhdGVrOiByZXNldDogQWRkIHJlc2V0IHN1cHBvcnQgZm9y
IHNpbXBsZSBwcm9iZQo+ID4gICBkdC1iaW5kaW5nczogYXJtOiBtZWRpYXRlazogQWRkICNyZXNl
dC1jZWxscyBwcm9wZXJ0eSBmb3IKPiA+ICAgICBNVDgxOTIvTVQ4MTk1Cj4gPiAgIGR0LWJpbmRp
bmdzOiByZXNldDogbWVkaWF0ZWs6IEFkZCBpbmZyYV9hbyByZXNldCBpbmRleCBmb3IKPiA+ICAg
ICBNVDgxOTIvTVQ4MTk1Cj4gPiAgIGNsazogbWVkaWF0ZWs6IHJlc2V0OiBBZGQgaW5mcmFfYW8g
cmVzZXQgc3VwcG9ydCBmb3IKPiA+IE1UODE5Mi9NVDgxOTUKPiA+ICAgYXJtNjQ6IGR0czogbWVk
aWF0ZWs6IEFkZCBpbmZyYSAjcmVzZXQtY2VsbHMgcHJvcGVydHkgZm9yIE1UODE5Mgo+ID4gICBh
cm02NDogZHRzOiBtZWRpYXRlazogQWRkIGluZnJhICNyZXNldC1jZWxscyBwcm9wZXJ0eSBmb3Ig
TVQ4MTk1Cj4gPiAgIGR0LWJpbmRpbmdzOiByZXNldDogbWVkaWF0ZWs6IEFkZCBpbmZyYV9hbyBy
ZXNldCBpbmRleCBmb3IgTVQ4MTg2Cj4gPiAgIGR0LWJpbmRpbmdzOiBhcm06IG1lZGlhdGVrOiBB
ZGQgI3Jlc2V0LWNlbGxzIHByb3BlcnR5IGZvciBNVDgxODYKPiA+ICAgY2xrOiBtZWRpYXRlazog
cmVzZXQ6IEFkZCBpbmZyYV9hbyByZXNldCBzdXBwb3J0IGZvciBNVDgxODYKPiAKPiBGb3IgdGhl
IHdob2xlIHNlcmllczoKPiAKPiBSZXZpZXdlZC1ieTogTsOtY29sYXMgRi4gUi4gQS4gUHJhZG8g
PG5mcmFwcmFkb0Bjb2xsYWJvcmEuY29tPgo+IAo+IEFuZCBhbHNvCj4gCj4gVGVzdGVkLWJ5OiBO
w61jb2xhcyBGLiBSLiBBLiBQcmFkbyA8bmZyYXByYWRvQGNvbGxhYm9yYS5jb20+Cj4gCj4gb24g
bXQ4MTkyLWFzdXJhZGEtc3BoZXJpb24uIFBDSWUgcmVzZXRzIHdvcmsgYXMgaW50ZW5kZWQgYnkg
YWRkaW5nIG9uCj4gdGhlIHBjaWUKPiBub2RlIAo+IAo+ICsgICAgICAgICAgICAgICAgICAgICAg
IHJlc2V0cyA9IDwmaW5mcmFjZmcKPiBNVDgxOTJfSU5GUkFfUlNUMl9QRVhUUF9QSFlfU1dSU1Q+
LAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDwmaW5mcmFjZmcKPiBNVDgxOTJf
SU5GUkFfUlNUNF9QQ0lFX1RPUF9TV1JTVD47Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgcmVz
ZXQtbmFtZXMgPSAicGh5IiwgIm1hYyI7Cj4gCj4gVGhhbmtzIGZvciB0aGUgZ3JlYXQgd29yayBv
biB0aGlzIHNlcmllcywgUmV4IQo+IAo+IE7DrWNvbGFzCgpIZWxsbyBOw61jb2xhcywKClRoYW5r
cyBmb3IgaGVscGluZyBtZSB0byB0ZXN0IHRoaXMgc2VyaWVzIGluIE1UODE5Mi4KCkJScywKUmV4
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgt
bWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRl
awo=
