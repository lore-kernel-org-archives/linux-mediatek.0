Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6D87C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Jul 2022 07:23:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hE/hokx04qSE7pHcxD3eoXA/syXvVWpNsjetqt/pLKI=; b=mFTU9a9IpB57RLepmcBfkHxpNp
	AdysNormIlD9Vybu6KyEBWGYcAXH+2MyFPOeJhWZDxbe7MqVfmeFEEKYJ9kGxtl0olDmZbN6BAdg6
	hIlga8fdB6qRSvjySXqmHkjv94zIsVSJCmitb+tmEPm06+dinR8yUP4xZiAN2KJeh02yVO5+KH+Dw
	kheLRsdm6+XrkRv0uOfcz9bcGlz8cza80Uh2R4UDEA2mpeOzv7sTsLCx7ZGbLEk0/Tqc5j1zf9IE3
	RDc6Muj9Swb88MGVkYkqJ7nIKphdltt8Eh/E47nLwrmtYBmrmIDcHKvtarbyA7zt/RvWC8MeojgAy
	dcqVzFaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oAnlB-00Gman-Dy; Mon, 11 Jul 2022 07:23:13 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oAnhz-00Gk3e-O2; Mon, 11 Jul 2022 07:19:57 +0000
X-UUID: 2abe2dfca7404baba0cbd6416be33812-20220711
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=hE/hokx04qSE7pHcxD3eoXA/syXvVWpNsjetqt/pLKI=;
	b=eCigxaqGDNlKT6XbOO70myBZmZN5RbZJJTTy5dtFrsjBTUuuxopxesbW4ldibU1eE0A9JUG1VQWxbfW/CzwSTmGlHnz7bfhPLeq6mIs15uyf+RiVP35L8xnDjOkyK4GJuJvolA6b1U1REprw4W7dZvnN2nvBEKlImFYuqZqSctI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:f36046d9-28e3-4d4b-a252-57f4acf8dc04,OB:0,LO
	B:0,IP:0,URL:5,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:5
X-CID-META: VersionHash:0f94e32,CLOUDID:f51ef163-0b3f-4b2c-b3a6-ed5c044366a0,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 2abe2dfca7404baba0cbd6416be33812-20220711
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 104863540; Mon, 11 Jul 2022 00:19:49 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Mon, 11 Jul 2022 14:39:12 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 11 Jul 2022 14:39:10 +0800
Message-ID: <9bbc0472bafa6116618e9861c3566d470c30c619.camel@mediatek.com>
Subject: Re: [PATCH 1/5] usb: mtu3: fix coverity of string buffer
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: Matthias Brugger <matthias.bgg@gmail.com>, <linux-usb@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Felipe Balbi <balbi@kernel.org>, Eddie Hung
	<eddie.hung@mediatek.com>
Date: Mon, 11 Jul 2022 14:39:10 +0800
In-Reply-To: <YsfcFXtkDxe6ndFT@kroah.com>
References: <20220708071903.25752-1-chunfeng.yun@mediatek.com>
	 <YsfcFXtkDxe6ndFT@kroah.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
Content-Transfer-Encoding: base64
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220711_001955_838987_08165D26 
X-CRM114-Status: GOOD (  22.77  )
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

T24gRnJpLCAyMDIyLTA3LTA4IGF0IDA5OjI2ICswMjAwLCBHcmVnIEtyb2FoLUhhcnRtYW4gd3Jv
dGU6DQo+IE9uIEZyaSwgSnVsIDA4LCAyMDIyIGF0IDAzOjE4OjU5UE0gKzA4MDAsIENodW5mZW5n
IFl1biB3cm90ZToNCj4gPiBVc2Ugc25wcmludGYgaW5zdGVhZCBvZiBzcHJpbnRmIHdoaWNoIGNv
dWxkIGNhdXNlIGJ1ZmZlciBvdmVyZmxvdy4NCj4gDQo+IEhvdyBjYW4gaXQgY2F1c2UgYW4gb3Zl
cmZsb3c/DQpNYXliZSBJIGRpZG4ndCBkZXNjcmliZSBpdCBjbGVhcmx5LCB0aGlzIHBhdGNoIGlz
IHVzZWQgdG8gZml4IGNvdmVyaXR5DQpjaGVjayB3YXJuaW5nIG9mIHN0cmluZyBidWZmZXIsIGlu
IGZhY3Qgbm8gb3ZlcmZsb3cgaGFwcGVucy4NCg0KPiANCj4gPiANCj4gPiBTaWduZWQtb2ZmLWJ5
OiBDaHVuZmVuZyBZdW4gPGNodW5mZW5nLnl1bkBtZWRpYXRlay5jb20+DQo+ID4gLS0tDQo+ID4g
IGRyaXZlcnMvdXNiL210dTMvbXR1My5oICAgICAgICAgfCA0ICsrKy0NCj4gPiAgZHJpdmVycy91
c2IvbXR1My9tdHUzX2RlYnVnZnMuYyB8IDIgKy0NCj4gPiAgZHJpdmVycy91c2IvbXR1My9tdHUz
X2dhZGdldC5jICB8IDQgKystLQ0KPiA+ICAzIGZpbGVzIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygr
KSwgNCBkZWxldGlvbnMoLSkNCj4gPiANCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvbXR1
My9tdHUzLmggYi9kcml2ZXJzL3VzYi9tdHUzL210dTMuaA0KPiA+IGluZGV4IDg0MDhlMWIxYTI0
YS4uOTg5M2RkMWJhZmJiIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvdXNiL210dTMvbXR1My5o
DQo+ID4gKysrIGIvZHJpdmVycy91c2IvbXR1My9tdHUzLmgNCj4gPiBAQCAtOTIsNiArOTIsOCBA
QCBzdHJ1Y3QgbXR1M19yZXF1ZXN0Ow0KPiA+ICANCj4gPiAgI2RlZmluZSBCVUxLX0NMS1NfQ05U
CTQNCj4gPiAgDQo+ID4gKyNkZWZpbmUgTVRVM19FUF9OQU1FX0xFTgkxMg0KPiA+ICsNCj4gPiAg
LyogZGV2aWNlIG9wZXJhdGVkIGxpbmsgYW5kIHNwZWVkIGdvdCBmcm9tIERFVklDRV9DT05GIHJl
Z2lzdGVyICovDQo+ID4gIGVudW0gbXR1M19zcGVlZCB7DQo+ID4gIAlNVFUzX1NQRUVEX0lOQUNU
SVZFID0gMCwNCj4gPiBAQCAtMjcyLDcgKzI3NCw3IEBAIHN0cnVjdCBzc3VzYl9tdGsgew0KPiA+
ICAgKi8NCj4gPiAgc3RydWN0IG10dTNfZXAgew0KPiA+ICAJc3RydWN0IHVzYl9lcCBlcDsNCj4g
PiAtCWNoYXIgbmFtZVsxMl07DQo+ID4gKwljaGFyIG5hbWVbTVRVM19FUF9OQU1FX0xFTl07DQo+
ID4gIAlzdHJ1Y3QgbXR1MyAqbXR1Ow0KPiA+ICAJdTggZXBudW07DQo+ID4gIAl1OCB0eXBlOw0K
PiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9tdHUzL210dTNfZGVidWdmcy5jDQo+ID4gYi9k
cml2ZXJzL3VzYi9tdHUzL210dTNfZGVidWdmcy5jDQo+ID4gaW5kZXggZDI3ZGU2NDdjODZhLi5h
NmY3MjQ5NGI4MTkgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy91c2IvbXR1My9tdHUzX2RlYnVn
ZnMuYw0KPiA+ICsrKyBiL2RyaXZlcnMvdXNiL210dTMvbXR1M19kZWJ1Z2ZzLmMNCj4gPiBAQCAt
MTMyLDcgKzEzMiw3IEBAIHN0YXRpYyB2b2lkIG10dTNfZGVidWdmc19yZWdzZXQoc3RydWN0IG10
dTMNCj4gPiAqbXR1LCB2b2lkIF9faW9tZW0gKmJhc2UsDQo+ID4gIAlpZiAoIW1yZWdzKQ0KPiA+
ICAJCXJldHVybjsNCj4gPiAgDQo+ID4gLQlzcHJpbnRmKG1yZWdzLT5uYW1lLCAiJXMiLCBuYW1l
KTsNCj4gPiArCXNucHJpbnRmKG1yZWdzLT5uYW1lLCBNVFUzX0RFQlVHRlNfTkFNRV9MRU4sICIl
cyIsIG5hbWUpOw0KPiANCj4gV2hlcmUgZG9lcyBuYW1lIGNvbWUgZnJvbT8gIEl0IGxvb2tzIGxp
a2UgeW91IGNvbnRyb2wgdGhpcyBzdHJpbmcsIHNvDQo+IHRoZXJlIGlzIG5vIG92ZXJmbG93IGFu
eXdoZXJlLg0KWWVzLCBkb24ndCBlbmNvdW50ZXIgb3ZlcmZsb3cgYXQgYWxsLCBidXQgdGhlcmUg
aXMgd2FybmluZyB3aGVuIHNjYW5uZWQNCmJ5IGNvdmVyaXR5IGluIG91ciBpbnRlcm5hbCBwcm9q
ZWN0IGJyYW5jaGVzLg0KDQo+IA0KPiA+ICAJcmVnc2V0ID0gJm1yZWdzLT5yZWdzZXQ7DQo+ID4g
IAlyZWdzZXQtPnJlZ3MgPSByZWdzOw0KPiA+ICAJcmVnc2V0LT5ucmVncyA9IG5yZWdzOw0KPiA+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9tdHUzL210dTNfZ2FkZ2V0LmMNCj4gPiBiL2RyaXZl
cnMvdXNiL210dTMvbXR1M19nYWRnZXQuYw0KPiA+IGluZGV4IDMwOTk5YjRkZWJiOC4uYTc1MWUw
NTMzYzJkIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvdXNiL210dTMvbXR1M19nYWRnZXQuYw0K
PiA+ICsrKyBiL2RyaXZlcnMvdXNiL210dTMvbXR1M19nYWRnZXQuYw0KPiA+IEBAIC02MzUsOCAr
NjM1LDggQEAgc3RhdGljIHZvaWQgaW5pdF9od19lcChzdHJ1Y3QgbXR1MyAqbXR1LCBzdHJ1Y3QN
Cj4gPiBtdHUzX2VwICptZXAsDQo+ID4gIA0KPiA+ICAJSU5JVF9MSVNUX0hFQUQoJm1lcC0+cmVx
X2xpc3QpOw0KPiA+ICANCj4gPiAtCXNwcmludGYobWVwLT5uYW1lLCAiZXAlZCVzIiwgZXBudW0s
DQo+ID4gLQkJIWVwbnVtID8gIiIgOiAoaXNfaW4gPyAiaW4iIDogIm91dCIpKTsNCj4gPiArCXNu
cHJpbnRmKG1lcC0+bmFtZSwgTVRVM19FUF9OQU1FX0xFTiwgImVwJWQlcyIsIGVwbnVtLA0KPiA+
ICsJCSAhZXBudW0gPyAiIiA6IChpc19pbiA/ICJpbiIgOiAib3V0IikpOw0KPiANCj4gU2FtZSBo
ZXJlLCB5b3UgYWxyZWFkeSBjb250cm9sIHRoaXMgc3RyaW5nIHNpemUsIHNvIHdoZXJlIGlzIHRo
ZQ0KPiBpc3N1ZT8NCkp1c3QgZml4IGNvdmVyaXR5IHdhcm5pbmcuDQoNClRoYW5rcyBhIGxvdA0K
DQo+IA0KPiB0aGFua3MsDQo+IA0KPiBncmVnIGstaA0K


