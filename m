Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 430FDCCA473
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Jul 2022 10:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aEMOeTOg7fXcK1Fy/6WQ+PDWJnsbtAvCGve1ZAg93f8=; b=122RRPnCZqiekeMprNwpjjwTUX
	COrS1KB6xp263EpVb4gfkr8EVntVBo3BXVQchjymhOH2DpP4xGs26AdkuX2DmWvgywzu0xC/yWww1
	41P5zh4lJAWzY3fKDaO5q/4KQ1+QrScOGHbRDGydSYhXuakU5dcUkSfO1HZagKb1oE/kTZjQQBi2x
	i0sr6T2tnXUDUBwoqnyfwzO6AS16eZB6kmzof7W6S00U7LxDbPRSKzXofGnYverDQWK5FukzHe5Zv
	cKCXJGk9dwRFxbMzMDNMX7tGbzTq4HN2uQZQ/owILvYX7TWDx7Vh5qSfaHgfVu0oookzuvtUaiG6F
	5GvXkj2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFuwl-007uKS-2X; Mon, 25 Jul 2022 10:04:19 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFuwY-007u9a-3Z; Mon, 25 Jul 2022 10:04:07 +0000
X-UUID: d8abbc364dd9409e9b10121b6a355aba-20220725
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=aEMOeTOg7fXcK1Fy/6WQ+PDWJnsbtAvCGve1ZAg93f8=;
	b=U5VgBVS2m1vZITWK9jNJD6jL0a9cAjx+M5R/NZkcj6TulUU8nBN+tnAdAtfbUGzff0cOkGq13s0YyZ0pnEPkIKADzqYG9vxumFPJN9eLmNBbJCmWWFqu9BtfYdbddHnP0OE/HLE++SuHM4oGxyFMoJml2AkCcCxVxeBK9i4vMt4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:bc1a7d65-f91d-487f-af85-4b83b5d88ebd,OB:0,LO
	B:0,IP:0,URL:25,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
	ION:release,TS:25
X-CID-META: VersionHash:0f94e32,CLOUDID:4b64dfd3-912a-458b-a623-74f605a77e93,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: d8abbc364dd9409e9b10121b6a355aba-20220725
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <axe.yang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1981310773; Mon, 25 Jul 2022 03:04:02 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Mon, 25 Jul 2022 17:13:24 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Mon, 25 Jul 2022 17:13:23 +0800
Message-ID: <3747f246650622ef65787159af5271a79401a855.camel@mediatek.com>
Subject: Re: [PATCH v13 3/3] mmc: mediatek: add support for SDIO eint wakup
 IRQ
From: Axe Yang <axe.yang@mediatek.com>
To: Linus Walleij <linus.walleij@linaro.org>, Ulf Hansson
	<ulf.hansson@linaro.org>
CC: Rob Herring <robh+dt@kernel.org>, Chaotian Jing
	<chaotian.jing@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
	Adrian Hunter <adrian.hunter@intel.com>, Yoshihiro Shimoda
	<yoshihiro.shimoda.uh@renesas.com>, Satya Tangirala <satyat@google.com>, Andy
 Shevchenko <andriy.shevchenko@linux.intel.com>, Wolfram Sang
	<wsa+renesas@sang-engineering.com>, Lucas Stach <dev@lynxeye.de>, "Eric
 Biggers" <ebiggers@google.com>, Andrew Jeffery <andrew@aj.id.au>, "Stephen
 Boyd" <swboyd@chromium.org>, Kiwoong Kim <kwmad.kim@samsung.com>, Yue Hu
	<huyue2@yulong.com>, Tian Tao <tiantao6@hisilicon.com>,
	<angelogioacchino.delregno@collabora.com>, <linux-mmc@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Yong Mao
	<yong.mao@mediatek.com>
Date: Mon, 25 Jul 2022 17:13:22 +0800
In-Reply-To: <CACRpkdZ5G2fMCqvkXANVEmZjNcF4U4mSDzZk6aXbqFjYVN3hcA@mail.gmail.com>
References: <20220623090445.1401-1-axe.yang@mediatek.com>
	 <20220623090445.1401-4-axe.yang@mediatek.com>
	 <CACRpkdZ5G2fMCqvkXANVEmZjNcF4U4mSDzZk6aXbqFjYVN3hcA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
Content-Transfer-Encoding: base64
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220725_030406_176549_18180C2C 
X-CRM114-Status: GOOD (  29.64  )
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

SGkgTGludXMsDQoNClRoYW5rcyBmb3IgdGhlIGNvbW1lbnRzLCBidXQgVWxmIGFuZCBJIGhhdmUg
c29tZSBxdWVzdGlvbiBvbiBwaW5jdHJsLg0KDQpPbiBGcmksIDIwMjItMDctMjIgYXQgMTM6MjEg
KzAyMDAsIExpbnVzIFdhbGxlaWogd3JvdGU6DQo+IE9uIFRodSwgSnVuIDIzLCAyMDIyIGF0IDEx
OjEwIEFNIEF4ZSBZYW5nIDxheGUueWFuZ0BtZWRpYXRlay5jb20+DQo+IHdyb3RlOg0KPiANCj4g
PiBNU0RDIGRyaXZlciB3aWxsIHRpbWUtc2hhcmUgdGhlIFNESU8gREFUMSBwaW4uIER1cmluZyBz
dXNwZW5kLCBNU0RDDQo+ID4gdHVybiBvZmYgY2xvY2sgYW5kIHN3aXRjaCBTRElPIERBVDEgcGlu
IHRvIEdQSU8gbW9kZS4gQW5kIGR1cmluZw0KPiA+IHJlc3VtZSwgc3dpdGNoIEdQSU8gZnVuY3Rp
b24gYmFjayB0byBEQVQxIG1vZGUgdGhlbiB0dXJuIG9uIGNsb2NrLg0KPiANCj4gU28gd2hhdCBJ
IHNlZSBpcyB0aGF0IHlvdSBoYXZlIHdoYXQgdGhlIGVsZWN0cm9uaWNzIGNoaXAgcGVvcGxlIGNh
bGwNCj4gYW4gYXJtZWQgcGFkIHJpbmcsIHN1Y2ggdGhhdCBhbiBhc3luY2hyb25vdXMgZXZlbnQg
ZGV0ZWN0b3IgaXMNCj4gY29ubmVjdGVkDQo+IHRvIHRoZSBwaW4gd2hlbiBpdCBpcyBpbiBHUElP
IG1vZGUsIGFuZCBpbiB0aGlzIG1vZGUgdGhlIHN5c3RlbQ0KPiBjYW4gZW50ZXIgYSBsb3dlciBz
bGVlcCBzdGF0ZSAobGlrZSBwb3dlcmluZyBvZmYgdGhlIE1NQyBibG9jaw0KPiBzaWxpY29uLi4u
KQ0KPiANCj4gVGhhdCBzZWVtcyBmaW5lLCB0aGlzIGlzIGRlZmluaXRlbHkgaG93IHRoZSBjaGlw
IHBlb3BsZSBleHBlY3RlZA0KPiBpdCB0byB3b3JrLg0KPiANCj4gPiArICAgICAgIGlmIChtbWNf
Y2FyZF9lbmFibGVfYXN5bmNfaXJxKG1tYy0+Y2FyZCkgJiYgaG9zdC0NCj4gPiA+cGluc19laW50
KSB7DQo+ID4gKyAgICAgICAgICAgICAgIGlmIChlbmIpIHsNCj4gPiArICAgICAgICAgICAgICAg
ICAgICAgICAvKg0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAqIEluDQo+ID4gZGV2X3Bt
X3NldF9kZWRpY2F0ZWRfd2FrZV9pcnFfcmV2ZXJzZSgpLCBlaW50IHBpbiB3aWxsIGJlIHNldCB0
bw0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAqIEdQSU8gbW9kZS4gV2UgbmVlZCB0byBy
ZXN0b3JlIGl0IHRvIFNESU8NCj4gPiBEQVQxIG1vZGUgYWZ0ZXIgdGhhdC4NCj4gPiArICAgICAg
ICAgICAgICAgICAgICAgICAgKiBTaW5jZSB0aGUgY3VycmVudCBwaW5zdGF0ZSBpcyBwaW5zX3Vo
cywNCj4gPiB0byBlbnN1cmUgcGluY3RybCBzZWxlY3QgdGFrZQ0KPiA+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAqIGFmZmVjdCBzdWNjZXNzZnVsbHksIHdlIGNoYW5nZSB0aGUNCj4gPiBwaW5z
dGF0ZSB0byBwaW5zX2VpbnQgZmlyc3RseS4NCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAg
Ki8NCj4gPiArICAgICAgICAgICAgICAgICAgICAgICBwaW5jdHJsX3NlbGVjdF9zdGF0ZShob3N0
LT5waW5jdHJsLCBob3N0LQ0KPiA+ID5waW5zX2VpbnQpOw0KPiA+ICsgICAgICAgICAgICAgICAg
ICAgICAgIHJldCA9DQo+ID4gZGV2X3BtX3NldF9kZWRpY2F0ZWRfd2FrZV9pcnFfcmV2ZXJzZSho
b3N0LT5kZXYsIGhvc3QtPmVpbnRfaXJxKTsNCj4gPiArDQo+ID4gKyAgICAgICAgICAgICAgICAg
ICAgICAgaWYgKHJldCkgew0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZGV2
X2Vycihob3N0LT5kZXYsICJGYWlsZWQgdG8NCj4gPiByZWdpc3RlciBTRElPIHdha2V1cCBpcnEh
XG4iKTsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGhvc3QtPnBpbnNfZWlu
dCA9IE5VTEw7DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwbV9ydW50aW1l
X2dldF9ub3Jlc3VtZShob3N0LT5kZXYpOw0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIH0g
ZWxzZSB7DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBkZXZfZGJnKGhvc3Qt
PmRldiwgIlNESU8gZWludCBpcnE6DQo+ID4gJWQhXG4iLCBob3N0LT5laW50X2lycSk7DQo+ID4g
KyAgICAgICAgICAgICAgICAgICAgICAgfQ0KPiA+ICsNCj4gPiArICAgICAgICAgICAgICAgICAg
ICAgICBwaW5jdHJsX3NlbGVjdF9zdGF0ZShob3N0LT5waW5jdHJsLCBob3N0LQ0KPiA+ID5waW5z
X3Vocyk7DQo+ID4gKyAgICAgICAgICAgICAgIH0gZWxzZSB7DQo+ID4gKyAgICAgICAgICAgICAg
ICAgICAgICAgZGV2X3BtX2NsZWFyX3dha2VfaXJxKGhvc3QtPmRldik7DQo+ID4gKyAgICAgICAg
ICAgICAgIH0NCj4gPiArICAgICAgIH0gZWxzZSB7DQo+ID4gKyAgICAgICAgICAgICAgIGlmIChl
bmIpIHsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAvKiBFbnN1cmUgaG9zdC0+cGluc19l
aW50IGlzIE5VTEwgKi8NCj4gPiArICAgICAgICAgICAgICAgICAgICAgICBob3N0LT5waW5zX2Vp
bnQgPSBOVUxMOw0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIHBtX3J1bnRpbWVfZ2V0X25v
cmVzdW1lKGhvc3QtPmRldik7DQo+ID4gKyAgICAgICAgICAgICAgIH0gZWxzZSB7DQo+ID4gKyAg
ICAgICAgICAgICAgICAgICAgICAgcG1fcnVudGltZV9wdXRfbm9pZGxlKGhvc3QtPmRldik7DQo+
ID4gKyAgICAgICAgICAgICAgIH0NCj4gPiArICAgICAgIH0NCj4gDQo+IFRoaXMgbG9va3Mgcmln
aHQuDQoNClNESU8gREFUMSBwaW4gbW9kZSBpcyBjaGFuZ2VkIHRvIEdQSU8gbW9kZSBpbg0KZGV2
X3BtX3NldF9kZWRpY2F0ZWRfd2FrZV9pcnFfcmV2ZXJzZSgpOg0KDQpodHRwczovL2VsaXhpci5i
b290bGluLmNvbS9saW51eC9sYXRlc3Qvc291cmNlL2RyaXZlcnMvcGluY3RybC9tZWRpYXRlay9w
aW5jdHJsLW10ay1jb21tb24tdjIuYyNMMzM5DQoNCmRldl9wbV9zZXRfZGVkaWNhdGVkX3dha2Vf
aXJxX3JldmVyc2UoKSAtPiAuLi4gLT5yZXF1ZXN0X3RocmVhZGVkX2lycSgpDQotPiBfX3NldHVw
X2lycSgpIC0+IGlycV9yZXF1ZXN0X3Jlc291cmNlcygpIC0+DQptdGtfZWludF9pcnFfcmVxdWVz
dF9yZXNvdXJjZXMoKS0+IG10a194dF9zZXRfZ3Bpb19hc19laW50KCkNCg0KDQpUbyByZXN0b3Jl
IFNESU8gREFUMSBwaW4gdG8gdWhzIG1vZGUuIEkgaGF2ZSB0byBjYWxsDQpwaW5jdHJsX3NlbGVj
dF9zdGF0ZSgpIHR3aWNlKGNoYW5nZSBwaW5jdHJsIHRvIGFub3RoZXIgc3RhdGUsIHRoZW4NCmNo
YW5nZSBiYWNrIHRvIHVocyBtb2RlKS4gVWxmIHdvcnJpZWQgd2UgbWlnaHQgYmUgZG9pbmcgc29t
ZXRoaW5nIGF0DQp0aGUgbW1jIGRyaXZlciBsZXZlbCwgd2hpY2ggc2hvdWxkIHJlYWxseSBiZSBt
YW5hZ2VkIGF0IHRoZSBwaW5jdHJsDQpsYXllci4NCg0KRG8geW91IGhhdmUgYW55IGNvbW1lbnQg
b3Igc3VnZ2VzdGlvbiBvbiB0aGlzPw0KDQoNCj4gDQo+ID4gKyAgICAgICAvKiBTdXBwb3J0IGZv
ciBTRElPIGVpbnQgaXJxID8gKi8NCj4gPiArICAgICAgIGlmICgobW1jLT5wbV9jYXBzICYgTU1D
X1BNX1dBS0VfU0RJT19JUlEpICYmIChtbWMtPnBtX2NhcHMNCj4gPiAmIE1NQ19QTV9LRUVQX1BP
V0VSKSkgew0KPiA+ICsgICAgICAgICAgICAgICBob3N0LT5laW50X2lycSA9IHBsYXRmb3JtX2dl
dF9pcnFfYnluYW1lKHBkZXYsDQo+ID4gInNkaW9fd2FrZXVwIik7DQo+ID4gKyAgICAgICAgICAg
ICAgIGlmIChob3N0LT5laW50X2lycSA+IDApIHsNCj4gPiArICAgICAgICAgICAgICAgICAgICAg
ICBob3N0LT5waW5zX2VpbnQgPQ0KPiA+IHBpbmN0cmxfbG9va3VwX3N0YXRlKGhvc3QtPnBpbmN0
cmwsICJzdGF0ZV9laW50Iik7DQo+IA0KPiBJIGd1ZXNzIG9uZSBvZiB0aGUgb3RoZXIgcGF0Y2hl
cyBhZGRzIHRoaXMgdG8gdGhlIERUIGJpbmRpbmc/DQoNClllcy4gVGhlIHByb3BlcnR5IHJlbGF0
ZWQgY2hhbmdlIGlzIGluIHBhdGNoIDEvMw0KDQo+IA0KPiBXaXRoIHRoYXQ6DQo+IFJldmlld2Vk
LWJ5OiBMaW51cyBXYWxsZWlqIDxsaW51cy53YWxsZWlqQGxpbmFyby5vcmc+DQo+IA0KPiBZb3Vy
cywNCj4gTGludXMgV2FsbGVpag0KDQpSZWdhcmRzLA0KQXhlDQoNCg==


