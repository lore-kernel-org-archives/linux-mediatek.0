Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01AB2C43334
	for <linux-mediatek@archiver.kernel.org>; Sun, 26 Jun 2022 04:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S1hi2Eei6TFXiVDL2HCYoKyX/lJX7VqAYHJfrIXkHH4=; b=AKplaDAAg0PovBLJ0IDsNYRFW6
	0ZMaTQ/hNhqEVe+SzfhDhr9hWFEY+U3v3D4AjEQuhLVxxvsFw5JTs1B5GSyHiLYHjrmB9e2eD/P3V
	DLMt5kiZKWHIaUGFNLDZkuJpCZuO6HisvsOHeFtbJWsRzOta0UlBD2ArBFdEgi7il5VMue0L0/R/q
	tKzoHilVx1Dy5LSmXqGaBrU/PzAFrE/mhSh3oRctv82HnN1ehmDWXnS2DJZN1MgC+BP1yOnqpKq29
	/QYPh8qL8IiPmlPzEVSRQnJWoom5ndl4fFQHToc4qRU1yCUA4NE/+F5/xC0t/extwI8jOOCsECUex
	iOOR2ToQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5KFu-009co3-1v; Sun, 26 Jun 2022 04:52:18 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5KDs-009bbF-PF; Sun, 26 Jun 2022 04:50:15 +0000
X-UUID: f0eac8bd2f27493991a903e3b2d5d320-20220625
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=S1hi2Eei6TFXiVDL2HCYoKyX/lJX7VqAYHJfrIXkHH4=;
	b=uu60JwThA7yCE1Ck/hz286xUeVNHiAGCDw9yqFg4BJJHq71fVGbzg84zUjFgdvwekCrEyrf1TsspyvY9NpjTTY/4Pacmp/6tGw79yCAepeKmfMnDA+elcMeKDsMx1yxjiOoxPHP5aYYEJ6lo9b8fCciY6Qo0lXUcWw2OjlyKR/U=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6,REQID:40d36f99-bc06-4c25-8569-c4d831579451,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:b14ad71,CLOUDID:4f9c91d8-850a-491d-a127-60d9309b2b3e,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:-5,EDM:-3,IP:nil,URL:1,File:ni
	l,QS:nil,BEC:nil,COL:0
X-UUID: f0eac8bd2f27493991a903e3b2d5d320-20220625
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
	(envelope-from <guodong.liu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 1792566884; Sat, 25 Jun 2022 21:50:02 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 25 Jun 2022 21:48:45 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3;
 Sun, 26 Jun 2022 12:48:43 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sun, 26 Jun 2022 12:48:43 +0800
Message-ID: <ffcf1452e96ce982b4dc366c508de9e87b0cc0f5.camel@mediatek.com>
Subject: Re: [PATCH v2 3/5] pinctrl: mediatek: add rsel setting on mt8192
From: Guodong Liu <guodong.liu@mediatek.com>
To: "=?ISO-8859-1?Q?N=EDcolas?= F. R. A. Prado" <nfraprado@collabora.com>
CC: Linus Walleij <linus.walleij@linaro.org>, Rob Herring
	<robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Sean Wang
	<sean.wang@kernel.org>, Sean Wang <sean.wang@mediatek.com>, Zhiyong Tao
	<zhiyong.tao@mediatek.com>, <linux-gpio@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Sun, 26 Jun 2022 12:48:42 +0800
In-Reply-To: <20220624152926.76hvymguryhfv4sq@notapiano>
References: <20220624133700.15487-1-guodong.liu@mediatek.com>
	 <20220624133700.15487-4-guodong.liu@mediatek.com>
	 <20220624152926.76hvymguryhfv4sq@notapiano>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
Content-Transfer-Encoding: base64
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220625_215012_875949_51014AA3 
X-CRM114-Status: GOOD (  14.16  )
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
ZWRpYXRlay5jb20NClN1YmplY3Q6IFJlOiBbUEFUQ0ggdjIgMy81XSBwaW5jdHJsOiBtZWRpYXRl
azogYWRkIHJzZWwgc2V0dGluZyBvbg0KbXQ4MTkyDQpEYXRlOiBGcmksIDI0IEp1biAyMDIyIDEx
OjI5OjI2IC0wNDAwDQoNCkhpIEd1b2RvbmcsDQoNCnRoYW5rcyBmb3IgdGhlIHBhdGNoLiBQbGVh
c2Ugc2VlIGNvbW1lbnRzIGJlbG93Lg0KDQpPbiBGcmksIEp1biAyNCwgMjAyMiBhdCAwOTozNjo1
OFBNICswODAwLCBHdW9kb25nIExpdSB3cm90ZToNCj4gMS4gSTJDIHBpbnMncyByZXNpc3RhbmNl
IHZhbHVlIGNhbiBiZSBjb250cm9sbGVkIGJ5IHJzZWwgcmVnaXN0ZXIuDQo+IFRoaXMgcGF0Y2gg
cHJvdmlkZXMgcnNlbCAocmVzaXN0YW5jZSBzZWxlY3Rpb24pIHNldHRpbmcgb24gbXQ4MTkyLg0K
PiAyLiBBbHNvIGFkZCB0aGUgbWlzc2luZyBwdWxsIHR5cGUgYXJyYXkgZm9yIG10ODE5MiB0byBk
b2N1bWVudCB0aGUNCj4gcHVsbCB0eXBlIG9mIGVhY2ggcGluIGFuZCBwcmV2ZW50IGludmFsaWQg
cHVsbCB0eXBlIHNldHRpbmdzLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogR3VvZG9uZyBMaXUgPGd1
b2RvbmcubGl1QG1lZGlhdGVrLmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL3BpbmN0cmwvbWVkaWF0
ZWsvcGluY3RybC1tdDgxOTIuYyB8IDEzNg0KPiArKysrKysrKysrKysrKysrKysrKysrDQo+ICAx
IGZpbGUgY2hhbmdlZCwgMTM2IGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL3BpbmN0cmwvbWVkaWF0ZWsvcGluY3RybC1tdDgxOTIuYw0KPiBiL2RyaXZlcnMvcGluY3Ry
bC9tZWRpYXRlay9waW5jdHJsLW10ODE5Mi5jDQo+IGluZGV4IGVmYWJlYjQyMmFlYS4uZmZiMGIw
NGYwZTNjIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL3BpbmN0cmwvbWVkaWF0ZWsvcGluY3RybC1t
dDgxOTIuYw0KPiArKysgYi9kcml2ZXJzL3BpbmN0cmwvbWVkaWF0ZWsvcGluY3RybC1tdDgxOTIu
Yw0KDQo8c25pcD4NCg0KPiArCU1US19QVUxMX1BVX1BEX1RZUEUsLyoxMDAqIE1US19QVUxMX1BV
X1BEX1RZUEUsLyoxMDEqLw0KPiArCU1US19QVUxMX1BVX1BEX1RZUEUsLyoxMDIqIE1US19QVUxM
X1BVX1BEX1RZUEUsLyoxMDMqLw0KPiArCU1US19QVUxMX1BVX1BEX1RZUEUsLyoxMDQqIE1US19Q
VUxMX1BVX1BEX1RZUEUsLyoxMDUqLw0KPiArCU1US19QVUxMX1BVX1BEX1RZUEUsLyoxMDYqIE1U
S19QVUxMX1BVX1BEX1RZUEUsLyoxMDcqLw0KPiArCU1US19QVUxMX1BVX1BEX1RZUEUsLyoxMDgq
IE1US19QVUxMX1BVX1BEX1RZUEUsLyoxMDkqLw0KPiArCU1US19QVUxMX1BVX1BEX1RZUEUsLyox
MTAqIE1US19QVUxMX1BVX1BEX1RZUEUsLyoxMTEqLw0KPiArCU1US19QVUxMX1BVX1BEX1RZUEUs
LyoxMTIqIE1US19QVUxMX1BVX1BEX1RZUEUsLyoxMTMqLw0KPiArCU1US19QVUxMX1BVX1BEX1RZ
UEUsLyoxMTQqIE1US19QVUxMX1BVX1BEX1RZUEUsLyoxMTUqLw0KPiArCU1US19QVUxMX1BVX1BE
X1RZUEUsLyoxMTYqIE1US19QVUxMX1BVX1BEX1RZUEUsLyoxMTcqLw0KDQpUaGUgY29tbWVudHMg
b24gcGlucyAxMDAgLSAxMTYgYXJlIG1pc3NpbmcgdGhlIGNsb3NpbmcgJy8nLCBlZmZlY3RpdmVs
eQ0KY29tbWVudGluZyBvdXQgcGlucyAxMDEgLSAxMTcgYW5kIGxlYWRpbmcgdG8gZXJyb3JzLiBQ
bGVhc2UgZml4IHRoaXMuDQoNCk90aGVyIHRoYW4gdGhhdCwNCg0KRml4ZWQgaW4gbmV4dCBwYXRj
aCx0aGFua3MhDQoNClJldmlld2VkLWJ5OiBOw61jb2xhcyBGLiBSLiBBLiBQcmFkbyA8bmZyYXBy
YWRvQGNvbGxhYm9yYS5jb20+DQpUZXN0ZWQtYnk6IE7DrWNvbGFzIEYuIFIuIEEuIFByYWRvIDxu
ZnJhcHJhZG9AY29sbGFib3JhLmNvbT4NCg0KVGhhbmtzLA0KTsOtY29sYXMNCg==


