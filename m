Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4EDCCCA479
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Jun 2022 06:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aazl7M3iVrUdTSKCMTzvPJKyQV6z2jr+9LRlCbxJnV0=; b=xzVxl/zMPm9WmQB/+RURc5vtO6
	8axUKxt5GeuLja78B8a1GE7bC6tWwOCtWb8MR2zELXKkgOCuVTdZBxtuVYQsq0NM//bd2PW74Sv40
	OpdrRO5UO7DRcL54VRx+oDkg/XcErJnZAZY7oxYCXFsQdYNJROYrceMb+EXN9vq71k1hDmAKuiXPu
	51TYZOkqotgXRo883mwTa0qtoSTlOAiQ1k8y2oO+SzeeUUnGD494Plgpe26dWQuKp9zCaDCFjomuQ
	JIRFVnNKOq6DY9dyroJygLE0mEAKVjMobt1f5OY9BnaIfuD51wPgUC47eRvtwMtGciOa0OPmMRiA3
	jkJtcd3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o64Hi-004Wpy-WC; Tue, 28 Jun 2022 06:01:15 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o64CT-004Uay-KL; Tue, 28 Jun 2022 05:55:51 +0000
X-UUID: 076a798202ed457abd189241f39d9f72-20220627
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=aazl7M3iVrUdTSKCMTzvPJKyQV6z2jr+9LRlCbxJnV0=;
	b=WqIgWqrC3Hxps+zhvYKaBeZMaCLuIQdJAUVUVbrKD7wXWKHKhqE7CBCiNRixm5g0g70XGugvfrJOZyarcGJx+pEIqjnDpZ8hQ1mFgGw8t1mDXF8629dAZbfZppPgsAy3bAWrAxO9OTsUs8bC4b4z6rcCvtwA88ti/KQ1Q50wZUg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.7,REQID:9e061ef6-5e3f-49c8-875d-ea82a34782f5,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:87442a2,CLOUDID:1068d262-0b3f-4b2c-b3a6-ed5c044366a0,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 076a798202ed457abd189241f39d9f72-20220627
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <biao.huang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 524620713; Mon, 27 Jun 2022 22:55:42 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3;
 Tue, 28 Jun 2022 13:44:32 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 28 Jun 2022 13:44:31 +0800
Message-ID: <3f42845aafce14dcd96a83690fe296eb9eb6b50d.camel@mediatek.com>
Subject: Re: [PATCH net-next v3 09/10] net: ethernet: mtk-star-emac:
 separate tx/rx handling with two NAPIs
From: Biao Huang <biao.huang@mediatek.com>
To: Jakub Kicinski <kuba@kernel.org>
CC: David Miller <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Fabien Parent <fparent@baylibre.com>,
	Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>, Sean Wang
	<sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, <netdev@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	Yinghua Pan <ot_yinghua.pan@mediatek.com>, <srv_heupstream@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>
Date: Tue, 28 Jun 2022 13:44:31 +0800
In-Reply-To: <20220623213431.23528544@kernel.org>
References: <20220622090545.23612-1-biao.huang@mediatek.com>
	 <20220622090545.23612-10-biao.huang@mediatek.com>
	 <20220623213431.23528544@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
Content-Transfer-Encoding: base64
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220627_225549_742254_B9DAC5E1 
X-CRM114-Status: GOOD (  22.43  )
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

RGVhciBKYWt1YiwNCglUaGFua3MgZm9yIHlvdXIgY29tbWVudHN+DQoNCk9uIFRodSwgMjAyMi0w
Ni0yMyBhdCAyMTozNCAtMDcwMCwgSmFrdWIgS2ljaW5za2kgd3JvdGU6DQo+IE9uIFdlZCwgMjIg
SnVuIDIwMjIgMTc6MDU6NDQgKzA4MDAgQmlhbyBIdWFuZyB3cm90ZToNCj4gPiArCWlmIChyeCB8
fCB0eCkgew0KPiA+ICsJCXNwaW5fbG9ja19pcnFzYXZlKCZwcml2LT5sb2NrLCBmbGFncyk7DQo+
ID4gKwkJLyogbWFzayBSeCBhbmQgVFggQ29tcGxldGUgaW50ZXJydXB0ICovDQo+ID4gKwkJbXRr
X3N0YXJfZGlzYWJsZV9kbWFfaXJxKHByaXYsIHJ4LCB0eCk7DQo+ID4gKwkJc3Bpbl91bmxvY2tf
aXJxcmVzdG9yZSgmcHJpdi0+bG9jaywgZmxhZ3MpOw0KPiANCj4gWW91IGRvIF9pcnFzYXZlIC8g
X2lycXJlc3RvcmUgaGVyZQ0KV2Ugc2hvdWxkIGludm9rZSBzcGluX2xvY2ssIG5vIG5lZWQgc2F2
ZS9zdG9yZSBpcnEgaGVyZS4NCj4gDQo+ID4gKwkJaWYgKHJ4KQ0KPiA+ICsJCQlfX25hcGlfc2No
ZWR1bGVfaXJxb2ZmKCZwcml2LT5yeF9uYXBpKTsNCj4gPiArCQlpZiAodHgpDQo+ID4gKwkJCV9f
bmFwaV9zY2hlZHVsZV9pcnFvZmYoJnByaXYtPnR4X25hcGkpOw0KPiANCj4gWWV0IGFzc3VtZSBf
aXJxb2ZmIGhlcmUuDQo+IA0KPiBTbyBjYW4gdGhpcyBiZSBydW4gZnJvbSBub24tSVJRIGNvbnRl
eHQgb3Igbm90Pw0Kc2VlbXMgX19uYXBpX3NjaGVkdWxlIGlzIG1vcmUgcHJvcGVyIGZvciBvdXIg
Y2FzZSwgd2UnbGwgbW9kaWZ5IGl0IGluDQpuZXh0IHNlbmQuDQo+IA0KPiA+IC0JaWYgKG10a19z
dGFyX3JpbmdfZnVsbChyaW5nKSkNCj4gPiArCWlmICh1bmxpa2VseShtdGtfc3Rhcl90eF9yaW5n
X2F2YWlsKHJpbmcpIDwgTUFYX1NLQl9GUkFHUyArIDEpKQ0KPiA+ICAJCW5ldGlmX3N0b3BfcXVl
dWUobmRldik7DQo+IA0KPiBQbGVhc2UgbG9vayBhcm91bmQgb3RoZXIgZHJpdmVycyAobGlrZSBp
eGdiZSkgYW5kIGNvcHkgdGhlIHdheSB0aGV5DQo+IGhhbmRsZSBzYWZlIHN0b3BwaW5nIG9mIHRo
ZSBxdWV1ZXMuIFlvdSBuZWVkIHRvIGFkZCBzb21lIGJhcnJpZXJzIGFuZA0KPiByZS1jaGVjayBh
ZnRlciBkaXNhYmxpbmcuDQpZZXMsIHdlIGxvb2sgZHJpdmVycyBmcm9tIG90aGVyIHZlbmRvcnMs
IGFuZCB3aWxsIGRvIHNpbWlsYXIgdGhpbmcgaW4NCm5leHQgc2VuZC4NCj4gDQo+ID4gLQlzcGlu
X3VubG9ja19iaCgmcHJpdi0+bG9jayk7DQo+ID4gLQ0KPiA+ICAJbXRrX3N0YXJfZG1hX3Jlc3Vt
ZV90eChwcml2KTsNCj4gPiAgDQo+ID4gIAlyZXR1cm4gTkVUREVWX1RYX09LOw0KPiANCj4gDQo+
ID4gKwl3aGlsZSAoKGVudHJ5ICE9IGhlYWQpICYmIChjb3VudCA8IE1US19TVEFSX1JJTkdfTlVN
X0RFU0NTIC0NCj4gPiAxKSkgew0KPiA+ICANCj4gDQo+IFBhcmVudGhlc2lzIHVubmVjZXNzYXJ5
LCBzbyBpcyB0aGUgZW1wdHkgbGluZSBhZnRlciB0aGUgd2hpbGUgKCkuDQpZZXMsIHRoZSBlbXB0
eSBsaW5lIHdpbGwgYmUgcmVtb3ZlZCBpbiBuZXh0IHNlbmQuDQo+IA0KPiA+ICAJCXJldCA9IG10
a19zdGFyX3R4X2NvbXBsZXRlX29uZShwcml2KTsNCj4gPiAgCQlpZiAocmV0IDwgMCkNCj4gPiAg
CQkJYnJlYWs7DQo+ID4gKw0KPiA+ICsJCWNvdW50Kys7DQo+ID4gKwkJcGt0c19jb21wbCsrOw0K
PiA+ICsJCWJ5dGVzX2NvbXBsICs9IHJldDsNCj4gPiArCQllbnRyeSA9IHJpbmctPnRhaWw7DQo+
ID4gIAl9DQo+ID4gIA0KPiA+ICsJX19uZXRpZl90eF9sb2NrX2JoKG5ldGRldl9nZXRfdHhfcXVl
dWUocHJpdi0+bmRldiwgMCkpOw0KPiA+ICAJbmV0ZGV2X2NvbXBsZXRlZF9xdWV1ZShuZGV2LCBw
a3RzX2NvbXBsLCBieXRlc19jb21wbCk7DQo+ID4gKwlfX25ldGlmX3R4X3VubG9ja19iaChuZXRk
ZXZfZ2V0X3R4X3F1ZXVlKHByaXYtPm5kZXYsIDApKTsNCj4gDQo+IHdoYXQgYXJlIHlvdSB0YWtp
bmcgdGhpcyBsb2NrIGZvcj8NCkluIHRoaXMgdmVyc2lvbiwgd2UgZW5jb3VudGVyIHNvbWUgaXNz
dWUgcmVsYXRlZCB0bw0KX19RVUVVRV9TVEFURV9TVEFDS19PRkYsIA0KYW5kIGlmIHdlIGFkZCBf
X25ldGlmX3R4X2xvY2tfYmggaGVyZSwgaXQgZGlzYXBwZWFycy4NCg0KV2hlbiByZWNpZXZlIHlv
dXIgY29tbWVudHMsIHdlIHN1cnZleSBuZXRkZXZfY29tcGxldGVkX3F1ZXVlIGhhbmRsZXMgaW4N
CmRyaXZlcnMgZnJvbSBvdGhlciB2ZW5kb3JzLCB3ZSBiZWxlaXZlIHRoZSBfX1FVRVVFX1NUQVRF
X1NUQUNLX09GRg0KaXNzdWUgbWF5IGNhdXNlZCBieSB1bnByb3BlciB1c2FnZSBvZiBfX25hcGlf
c2NoZWR1bGVfaXJxb2ZmIGluDQpwcmV2aW91cyBsaW5lcywgYW5kIHdlJ2xsIHJlbW92ZSBfX25l
dGlmX3R4X2xvY2tfYmgsIGFuZCBoYXZlIGFub3RoZXINCnRyeS4NCg0KSWYgb3VyIGxvY2FsIHN0
cmVzcyB0ZXN0IHBhc3MsIGNvcnJlc3BvbmRpbmcgbW9kaWZpY2F0aW9uIHdpbGwgYmUgYWRkZWQN
CmluIG5leHQgc2VuZC4NCj4gDQo+ID4gLQlpZiAod2FrZSAmJiBuZXRpZl9xdWV1ZV9zdG9wcGVk
KG5kZXYpKQ0KPiA+ICsJaWYgKHVubGlrZWx5KG5ldGlmX3F1ZXVlX3N0b3BwZWQobmRldikpICYm
DQo+ID4gKwkgICAgKG10a19zdGFyX3R4X3JpbmdfYXZhaWwocmluZykgPiBNVEtfU1RBUl9UWF9U
SFJFU0gpKQ0KPiA+ICAJCW5ldGlmX3dha2VfcXVldWUobmRldik7DQo+ID4gIA0KPiA+IC0Jc3Bp
bl91bmxvY2soJnByaXYtPmxvY2spOw0KPiA+ICsJaWYgKG5hcGlfY29tcGxldGUobmFwaSkpIHsN
Cj4gPiArCQlzcGluX2xvY2tfaXJxc2F2ZSgmcHJpdi0+bG9jaywgZmxhZ3MpOw0KPiA+ICsJCW10
a19zdGFyX2VuYWJsZV9kbWFfaXJxKHByaXYsIGZhbHNlLCB0cnVlKTsNCj4gPiArCQlzcGluX3Vu
bG9ja19pcnFyZXN0b3JlKCZwcml2LT5sb2NrLCBmbGFncyk7DQo+ID4gKwl9DQo+ID4gKw0KPiA+
ICsJcmV0dXJuIDA7DQo+ID4gIH0NCj4gPiBAQCAtMTQ3NSw2ICsxNTE0LDcgQEAgc3RhdGljIGlu
dCBtdGtfc3Rhcl9zZXRfdGltaW5nKHN0cnVjdA0KPiA+IG10a19zdGFyX3ByaXYgKnByaXYpDQo+
ID4gIA0KPiA+ICAJcmV0dXJuIHJlZ21hcF93cml0ZShwcml2LT5yZWdzLCBNVEtfU1RBUl9SRUdf
VEVTVDAsIGRlbGF5X3ZhbCk7DQo+ID4gIH0NCj4gPiArDQo+ID4gIHN0YXRpYyBpbnQgbXRrX3N0
YXJfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4gPiAgew0KPiA+ICAJc3Ry
dWN0IGRldmljZV9ub2RlICpvZl9ub2RlOw0KPiANCj4gc3B1cmlvdXMgd2hpdGVzcGFjZSBjaGFu
Z2UNClllcywgd2lsbCBmaXggaXQgaW4gbmV4dCBzZW5kLg0KDQpCZXN0IFJlZ2FyZHMhDQpCaWFv
DQo=


