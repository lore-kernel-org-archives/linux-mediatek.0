Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E3D0CCA473
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Jun 2022 13:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T1PCttt/CXyyM+WkbEoXS2G9tB4Ph6o5HOlrFfZAcV0=; b=scaebjxYeBn8izWHPucREXXzaV
	Jj83i2m75lm9vObEHdZRjjO36I/1YNx1lTITVNMfq9gvVrTcwp3l7gs3ddRONbx9xmZ++URRJPwg6
	L4Cjey6a678juWN9o5OZIM7182CCWOchK9EGHqKyS9oEVF3YTsy62AZ9XBfdr8crUrv3oYPEpo4UI
	HHIewKPubKrXJHHqHFCsotWJKVP5ilJ01xZIuKYR3BIwGWirhWAJ8yycAznIwhF25Bfz0oe0VEOzq
	sEfxt4w8PGAxIzcIXpJg6TS0bLdK4Rk/mW/evETCVobXclz7C5Fb/tPE8ZxyNoDCN53Y5Kbo1h2Tj
	QRwMUgiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4jfe-002Sqw-IS; Fri, 24 Jun 2022 13:48:26 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4jej-002SR6-Dg; Fri, 24 Jun 2022 13:47:34 +0000
X-UUID: c0c24ac57aa34d1aae27bc5fce1623c7-20220624
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=T1PCttt/CXyyM+WkbEoXS2G9tB4Ph6o5HOlrFfZAcV0=;
	b=t6qFWG2ERxmNtriJEQlRmXKszSOMz02aKxnJ5579LeV/isP/Hju3+yOQMhne40r3U65TwQsNCphTib0ZkEv4xy3zGoGrqwwmpL6nc2BMHy+sQIPuaGg2GtTwK9RBWI8Y4og/kJMubIa5MYrn9QU7sxlOQbkRF3uG1cf4Q6NXB0A=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6,REQID:ee33ec6f-0ac1-491b-a00e-79a47a858dec,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:b14ad71,CLOUDID:27637ed8-850a-491d-a127-60d9309b2b3e,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:-5,EDM:-3,IP:nil,URL:1,File:ni
	l,QS:nil,BEC:nil,COL:0
X-UUID: c0c24ac57aa34d1aae27bc5fce1623c7-20220624
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
	(envelope-from <guodong.liu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 1257150827; Fri, 24 Jun 2022 06:47:13 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 24 Jun 2022 06:41:37 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3;
 Fri, 24 Jun 2022 21:41:36 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 24 Jun 2022 21:41:35 +0800
Message-ID: <e2f9f60f2ab7a18e9326845a95ccea28a02c39a9.camel@mediatek.com>
Subject: Re: [PATCH v1 2/4] pinctrl: add drive for I2C related pins on mt8192
From: Guodong Liu <guodong.liu@mediatek.com>
To: "=?ISO-8859-1?Q?N=EDcolas?= F. R. A. Prado" <nfraprado@collabora.com>
CC: Linus Walleij <linus.walleij@linaro.org>, Rob Herring
	<robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Sean Wang
	<sean.wang@kernel.org>, Sean Wang <sean.wang@mediatek.com>, Zhiyong Tao
	<zhiyong.tao@mediatek.com>, <linux-gpio@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Fri, 24 Jun 2022 21:41:35 +0800
In-Reply-To: <20220609182537.zbqk7gqsyscayv7b@notapiano>
References: <20220608053909.1252-1-guodong.liu@mediatek.com>
	 <20220608053909.1252-3-guodong.liu@mediatek.com>
	 <20220609182537.zbqk7gqsyscayv7b@notapiano>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
Content-Transfer-Encoding: base64
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220624_064729_614455_E456442B 
X-CRM114-Status: GOOD (  19.79  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IE7DrWNvbGFzIEYuIFIuIEEuIFByYWRv
IDxuZnJhcHJhZG9AY29sbGFib3JhLmNvbT4NClRvOiBHdW9kb25nIExpdSA8Z3VvZG9uZy5saXVA
bWVkaWF0ZWsuY29tPg0KQ2M6IExpbnVzIFdhbGxlaWogPGxpbnVzLndhbGxlaWpAbGluYXJvLm9y
Zz4sIFJvYiBIZXJyaW5nIDwNCnJvYmgrZHRAa2VybmVsLm9yZz4sIE1hdHRoaWFzIEJydWdnZXIg
PG1hdHRoaWFzLmJnZ0BnbWFpbC5jb20+LCBTZWFuDQpXYW5nIDxzZWFuLndhbmdAa2VybmVsLm9y
Zz4sIFNlYW4gV2FuZyA8c2Vhbi53YW5nQG1lZGlhdGVrLmNvbT4sDQpaaGl5b25nIFRhbyA8emhp
eW9uZy50YW9AbWVkaWF0ZWsuY29tPiwgbGludXgtZ3Bpb0B2Z2VyLmtlcm5lbC5vcmcsIA0KZGV2
aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmcsIGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFk
Lm9yZywgDQpsaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnLCBsaW51eC1rZXJuZWxA
dmdlci5rZXJuZWwub3JnLCANClByb2plY3RfR2xvYmFsX0Nocm9tZV9VcHN0cmVhbV9Hcm91cEBt
ZWRpYXRlay5jb20NClN1YmplY3Q6IFJlOiBbUEFUQ0ggdjEgMi80XSBwaW5jdHJsOiBhZGQgZHJp
dmUgZm9yIEkyQyByZWxhdGVkIHBpbnMgb24NCm10ODE5Mg0KRGF0ZTogVGh1LCA5IEp1biAyMDIy
IDE0OjI1OjM3IC0wNDAwDQoNCkhpIEd1b2RvbmcsDQoNCnRoYW5rIHlvdSBmb3IgdGhlIHBhdGNo
LiBQbGVhc2Ugc2VlIHNvbWUgc3VnZ2VzdGlvbnMgYmVsb3cuDQoNCk9uIFdlZCwgSnVuIDA4LCAy
MDIyIGF0IDAxOjM5OjA3UE0gKzA4MDAsIEd1b2RvbmcgTGl1IHdyb3RlOg0KPiBUaGlzIHBhdGNo
IHByb3ZpZGVzIHRoZSBhZHZhbmNlZCBkcml2ZSByYXcgZGF0YSBzZXR0aW5nIHZlcnNpb24NCj4g
Zm9yIEkyQyB1c2VkIHBpbnMgb24gbXQ4MTkyDQoNClBsZWFzZSBhZGQgIm1lZGlhdGVrOiIgb24g
dGhlIGNvbW1pdCB0aXRsZSBmb3IgdGhpcyBwYXRjaCBhbmQgcGF0Y2ggMSwNCmxpa2UgeW91DQpk
aWQgZm9yIDMgYW5kIDQuDQoNCndpbGwgZml4IGl0IGluIG5leHQgdmVyc2lvbix0aGFua3MhDQo+
IA0KPiBTaWduZWQtb2ZmLWJ5OiBHdW9kb25nIExpdSA8Z3VvZG9uZy5saXVAbWVkaWF0ZWsuY29t
Pg0KPiAtLS0NCj4gIGRyaXZlcnMvcGluY3RybC9tZWRpYXRlay9waW5jdHJsLW10ODE5Mi5jIHwg
MzENCj4gKysrKysrKysrKysrKysrKysrKysrLS0NCj4gIDEgZmlsZSBjaGFuZ2VkLCAyOSBpbnNl
cnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGlu
Y3RybC9tZWRpYXRlay9waW5jdHJsLW10ODE5Mi5jDQo+IGIvZHJpdmVycy9waW5jdHJsL21lZGlh
dGVrL3BpbmN0cmwtbXQ4MTkyLmMNCj4gaW5kZXggOWZhZjcwMDEzNjlkLi5kMTFmZjU1MTllMWUg
MTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvcGluY3RybC9tZWRpYXRlay9waW5jdHJsLW10ODE5Mi5j
DQo+ICsrKyBiL2RyaXZlcnMvcGluY3RybC9tZWRpYXRlay9waW5jdHJsLW10ODE5Mi5jDQo+IEBA
IC0xMjU5LDYgKzEyNTksMzIgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBtdGtfcGluX2ZpZWxkX2Nh
bGMNCj4gbXQ4MTkyX3Bpbl9yMV9yYW5nZVtdID0gew0KPiAgCVBJTl9GSUVMRF9CQVNFKDIwNSwg
MjA1LCA4LCAweDAwNzAsIDB4MTAsIDUsIDEpLA0KPiAgfTsNCj4gIA0KPiArc3RhdGljIGNvbnN0
IHN0cnVjdCBtdGtfcGluX2ZpZWxkX2NhbGMgbXQ4MTkyX3Bpbl9kcnZfYWR2X3JhbmdlW10gPQ0K
PiB7DQo+ICsJUElOX0ZJRUxEX0JBU0UoODksIDg5LCAyLCAweDAwNDAsIDB4MTAsIDAsIDUpLA0K
PiArCVBJTl9GSUVMRF9CQVNFKDkwLCA5MCwgMiwgMHgwMDQwLCAweDEwLCA1LCA1KSwNCj4gKw0K
PiArCVBJTl9GSUVMRF9CQVNFKDExOCwgMTE4LCA0LCAweDAwNDAsIDB4MTAsIDAsIDMpLA0KPiAr
CVBJTl9GSUVMRF9CQVNFKDExOSwgMTE5LCA0LCAweDAwNDAsIDB4MTAsIDE4LCAzKSwNCj4gKwlQ
SU5fRklFTERfQkFTRSgxMjAsIDEyMCwgNCwgMHgwMDQwLCAweDEwLCAxNSwgMyksDQo+ICsJUElO
X0ZJRUxEX0JBU0UoMTIxLCAxMjEsIDQsIDB4MDA1MCwgMHgxMCwgMywgMyksDQo+ICsJUElOX0ZJ
RUxEX0JBU0UoMTIyLCAxMjIsIDQsIDB4MDA0MCwgMHgxMCwgMTIsIDMpLA0KPiArCVBJTl9GSUVM
RF9CQVNFKDEyMywgMTIzLCA0LCAweDAwNTAsIDB4MTAsIDAsIDMpLA0KPiArCVBJTl9GSUVMRF9C
QVNFKDEyNCwgMTI0LCA0LCAweDAwNDAsIDB4MTAsIDksIDMpLA0KPiArCVBJTl9GSUVMRF9CQVNF
KDEyNSwgMTI1LCA0LCAweDAwNDAsIDB4MTAsIDI3LCAzKSwNCj4gKwlQSU5fRklFTERfQkFTRSgx
MzksIDEzOSwgNCwgMHgwMDQwLCAweDEwLCA2LCAzKSwNCj4gKwlQSU5fRklFTERfQkFTRSgxNDAs
IDE0MCwgNCwgMHgwMDQwLCAweDEwLCAyNCwgMyksDQo+ICsJUElOX0ZJRUxEX0JBU0UoMTQxLCAx
NDEsIDQsIDB4MDA0MCwgMHgxMCwgMywgMyksDQo+ICsJUElOX0ZJRUxEX0JBU0UoMTQyLCAxNDIs
IDQsIDB4MDA0MCwgMHgxMCwgMjEsIDMpLA0KPiArCVBJTl9GSUVMRF9CQVNFKDE2MCwgMTYwLCA3
LCAweDAwMzAsIDB4MTAsIDAsIDMpLA0KPiArCVBJTl9GSUVMRF9CQVNFKDE2MSwgMTYxLCA3LCAw
eDAwMzAsIDB4MTAsIDMsIDMpLA0KPiArCVBJTl9GSUVMRF9CQVNFKDIwMCwgMjAwLCA4LCAweDAw
MTAsIDB4MTAsIDMsIDMpLA0KPiArCVBJTl9GSUVMRF9CQVNFKDIwMSwgMjAxLCA4LCAweDAwMTAs
IDB4MTAsIDksIDMpLA0KPiArCVBJTl9GSUVMRF9CQVNFKDIwMiwgMjAyLCA1LCAweDAwMjAsIDB4
MTAsIDAsIDMpLA0KPiArCVBJTl9GSUVMRF9CQVNFKDIwMywgMjAzLCA1LCAweDAwMjAsIDB4MTAs
IDMsIDMpLA0KPiArCVBJTl9GSUVMRF9CQVNFKDIwNCwgMjA0LCA4LCAweDAwMTAsIDB4MTAsIDAs
IDMpLA0KPiArCVBJTl9GSUVMRF9CQVNFKDIwNSwgMjA1LCA4LCAweDAwMTAsIDB4MTAsIDYsIDMp
LA0KPiArfTsNCj4gKw0KPiAgc3RhdGljIGNvbnN0IHN0cnVjdCBtdGtfcGluX2ZpZWxkX2NhbGMg
bXQ4MTkyX3Bpbl9lMWUwZW5fcmFuZ2VbXSA9IHsNCj4gIAlQSU5fRklFTERfQkFTRSgxMTgsIDEx
OCwgNCwgMHgwMDQwLCAweDEwLCAwLCAxKSwNCj4gIAlQSU5fRklFTERfQkFTRSgxMTksIDExOSwg
NCwgMHgwMDQwLCAweDEwLCAxOCwgMSksDQo+IEBAIC0xMzU3LDYgKzEzODMsNyBAQCBzdGF0aWMg
Y29uc3Qgc3RydWN0IG10a19waW5fcmVnX2NhbGMNCj4gbXQ4MTkyX3JlZ19jYWxzW1BJTkNUUkxf
UElOX1JFR19NQVhdID0gew0KPiAgCVtQSU5DVFJMX1BJTl9SRUdfUjFdID0gTVRLX1JBTkdFKG10
ODE5Ml9waW5fcjFfcmFuZ2UpLA0KPiAgCVtQSU5DVFJMX1BJTl9SRUdfRFJWX0VOXSA9IE1US19S
QU5HRShtdDgxOTJfcGluX2UxZTBlbl9yYW5nZSksDQo+ICAJW1BJTkNUUkxfUElOX1JFR19EUlZf
RTBdID0gTVRLX1JBTkdFKG10ODE5Ml9waW5fZTBfcmFuZ2UpLA0KPiArCVtQSU5DVFJMX1BJTl9S
RUdfRFJWX0FEVl0JPQ0KPiBNVEtfUkFOR0UobXQ4MTkyX3Bpbl9kcnZfYWR2X3JhbmdlKSwNCg0K
Tml0OiB1c2Ugc3BhY2UgaW5zdGVhZCBvZiB0YWIgYmVmb3JlIHRoZSA9Lg0KDQp3aWxsIGZpeCBp
dCBpbiBuZXh0IHZlcnNpb24sdGhhbmtzIQ0KDQpUaGFua3MsDQpOw61jb2xhcw0KDQo+ICAJW1BJ
TkNUUkxfUElOX1JFR19EUlZfRTFdID0gTVRLX1JBTkdFKG10ODE5Ml9waW5fZTFfcmFuZ2UpLA0K
PiAgfTsNCj4gIA0KPiBAQCAtMTM3Niw4ICsxNDAzLDggQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBt
dGtfcGluX3NvYyBtdDgxOTJfZGF0YSA9IHsNCj4gIAkuZHJpdmVfZ2V0CT0gbXRrX3BpbmNvbmZf
ZHJpdmVfZ2V0X3JldjEsDQo+ICAJLmFkdl9wdWxsX2dldCA9IG10a19waW5jb25mX2Fkdl9wdWxs
X2dldCwNCj4gIAkuYWR2X3B1bGxfc2V0ID0gbXRrX3BpbmNvbmZfYWR2X3B1bGxfc2V0LA0KPiAt
CS5hZHZfZHJpdmVfZ2V0ID0gbXRrX3BpbmNvbmZfYWR2X2RyaXZlX2dldCwNCj4gLQkuYWR2X2Ry
aXZlX3NldCA9IG10a19waW5jb25mX2Fkdl9kcml2ZV9zZXQsDQo+ICsJLmFkdl9kcml2ZV9nZXQJ
PSBtdGtfcGluY29uZl9hZHZfZHJpdmVfZ2V0X3JhdywNCj4gKwkuYWR2X2RyaXZlX3NldAk9IG10
a19waW5jb25mX2Fkdl9kcml2ZV9zZXRfcmF3LA0KPiAgfTsNCj4gIA0KPiAgc3RhdGljIGNvbnN0
IHN0cnVjdCBvZl9kZXZpY2VfaWQgbXQ4MTkyX3BpbmN0cmxfb2ZfbWF0Y2hbXSA9IHsNCj4gLS0g
DQo+IDIuMjUuNQ0KPiANCg==


