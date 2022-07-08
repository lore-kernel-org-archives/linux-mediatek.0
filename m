Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAC90C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Jul 2022 01:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C2Zh0bc6yAgtV5qWvETSNBm0C06X9LlmlAoQnYeMrM0=; b=RyOBtgSK80FAKknuIw4zsW6c1c
	obvfxVahkNddQmDX3Ht94mTg9mpZQMZIzvs0VDUQrXkTA9TnvbN7ge7ANAVkg4xsaSlX+qYao9HwQ
	BBuXIGbJ2gXcQq2aw31ULNAzmRCmafWVFt2mhXMI5wCD7he5OHLorM79d2v4M8hsIoauqt2t0CnTn
	//Jsndq/4NrnBPYt7pXCoWtCcStMRw6FVyu2Oh7i1tILSv04zx3QjxdUKT/eRG0SRnPun0qNykapz
	lZfpT1H/MP+/rSyzn4QthHBwaSiYPb+kacvE4rmSGM6OGqmfbeRN4e8Md4YgbF0kAH/jIr930UWUw
	GV58bM9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9dDC-0013zB-9h; Fri, 08 Jul 2022 01:55:18 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9dD9-0013xs-Kd; Fri, 08 Jul 2022 01:55:17 +0000
X-UUID: ec1d20211b5f414a8b259a85b99f14b7-20220707
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=C2Zh0bc6yAgtV5qWvETSNBm0C06X9LlmlAoQnYeMrM0=;
	b=pkFmr668DV+xZFykkW+/XpNacDFnNnOaOB80Z0u0TGmeZ/WvRGchIWWIO4oDJeWiUJxkdFKzBxrPEkf4Y/s804+7SOgE1jldZZJMITarc2rS8KB/fz6/gGqEopadgKMegE1xBEGPQtbtAJweeF6KDIfjjF1GkN8lw8BQLvOEonk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:7a1c741c-2f62-4487-938d-0035eb5594b5,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:0f94e32,CLOUDID:e2c3b863-0b3f-4b2c-b3a6-ed5c044366a0,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: ec1d20211b5f414a8b259a85b99f14b7-20220707
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <kewei.xu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1158504222; Thu, 07 Jul 2022 18:55:12 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3;
 Fri, 8 Jul 2022 09:24:39 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 8 Jul 2022 09:24:38 +0800
Message-ID: <0fba8d4ecf11a471da9e3eadb8ce3b2029261c2c.camel@mediatek.com>
Subject: Re: [PATCH 2/2] i2c: mediatek: Add i2c compatible for Mediatek
 MT8188
From: Kewei Xu <kewei.xu@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	<wsa@the-dreams.de>
CC: <matthias.bgg@gmail.com>, <robh+dt@kernel.org>,
	<linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, <srv_heupstream@mediatek.com>,
	<leilk.liu@mediatek.com>, <qii.wang@mediatek.com>,
	<liguo.zhang@mediatek.com>, <caiyu.chen@mediatek.com>,
	<housong.zhang@mediatek.com>, <yuhan.wei@mediatek.com>,
	<david-yh.chiu@mediatek.com>, <liju-clr.chen@mediatek.com>
Date: Fri, 8 Jul 2022 09:24:38 +0800
In-Reply-To: <fae6c582-ec65-47d8-548f-934e8e829daf@collabora.com>
References: <20220707054617.13583-1-kewei.xu@mediatek.com>
	 <20220707054617.13583-3-kewei.xu@mediatek.com>
	 <fae6c582-ec65-47d8-548f-934e8e829daf@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
Content-Transfer-Encoding: base64
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220707_185515_731445_479C2D6E 
X-CRM114-Status: GOOD (  20.31  )
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

T24gVGh1LCAyMDIyLTA3LTA3IGF0IDEwOjQzICswMjAwLCBBbmdlbG9HaW9hY2NoaW5vIERlbCBS
ZWdubyB3cm90ZToNCj4gSWwgMDcvMDcvMjIgMDc6NDYsIEtld2VpIFh1IGhhIHNjcml0dG86DQo+
ID4gQWRkIGkyYyBjb21wYXRpYmxlIGZvciBNVDgxODguIENvbXBhcmUgdG8gTVQ4MTkyIGkyYyBj
b250cm9sbGVyLA0KPiA+IFRoZSBNVDgxODggaTJjIE9GRlNFVF9TTEFWRV9BRERSIHJlZ2lzdGVy
IGNoYW5nZWQgZnJvbSAweDA0IHRvDQo+ID4gMHg5NC4NCj4gPiANCj4gPiBTaWduZWQtb2ZmLWJ5
OiBLZXdlaSBYdSA8a2V3ZWkueHVAbWVkaWF0ZWsuY29tPg0KPiA+IC0tLQ0KPiA+ICAgZHJpdmVy
cy9pMmMvYnVzc2VzL2kyYy1tdDY1eHguYyB8IDQxDQo+ID4gKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKy0tDQo+ID4gICAxIGZpbGUgY2hhbmdlZCwgMzkgaW5zZXJ0aW9ucygrKSwgMiBk
ZWxldGlvbnMoLSkNCj4gPiANCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pMmMvYnVzc2VzL2ky
Yy1tdDY1eHguYw0KPiA+IGIvZHJpdmVycy9pMmMvYnVzc2VzL2kyYy1tdDY1eHguYw0KPiA+IGlu
ZGV4IDhlNjk4NTM1NGZkNS4uYWEyZTFjYjg3NDIwIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMv
aTJjL2J1c3Nlcy9pMmMtbXQ2NXh4LmMNCj4gPiArKysgYi9kcml2ZXJzL2kyYy9idXNzZXMvaTJj
LW10NjV4eC5jDQo+ID4gQEAgLTEzNSw2ICsxMzUsNyBAQCBlbnVtIG10a190cmFuc19vcCB7DQo+
ID4gICBlbnVtIEkyQ19SRUdTX09GRlNFVCB7DQo+ID4gICAJT0ZGU0VUX0RBVEFfUE9SVCwNCj4g
PiAgIAlPRkZTRVRfU0xBVkVfQUREUiwNCj4gPiArCU9GRlNFVF9TTEFWRV9BRERSMSwNCj4gPiAg
IAlPRkZTRVRfSU5UUl9NQVNLLA0KPiA+ICAgCU9GRlNFVF9JTlRSX1NUQVQsDQo+ID4gICAJT0ZG
U0VUX0NPTlRST0wsDQo+ID4gQEAgLTIwMyw2ICsyMDQsNyBAQCBzdGF0aWMgY29uc3QgdTE2IG10
X2kyY19yZWdzX3YxW10gPSB7DQo+ID4gICBzdGF0aWMgY29uc3QgdTE2IG10X2kyY19yZWdzX3Yy
W10gPSB7DQo+ID4gICAJW09GRlNFVF9EQVRBX1BPUlRdID0gMHgwLA0KPiA+ICAgCVtPRkZTRVRf
U0xBVkVfQUREUl0gPSAweDQsDQo+ID4gKwlbT0ZGU0VUX1NMQVZFX0FERFIxXSA9IDB4OTQsDQo+
IA0KPiBJbnN0ZWFkIG9mIGFkZGluZyBhICJzbGF2ZSBhZGRyIHZlcnNpb24iIGVudHJ5Li4uIHlv
dSBjYW4gYXMgd2VsbA0KPiBqdXN0IGRlZmluZQ0KPiBhIG5ldyBhcnJheSBoZXJlIHdpdGggYW4g
YXBwcm9wcmlhdGUgbmFtZS4NCj4gDQo+IHN0YXRpYyBjb25zdCB1MTYgbXRfaTJjX3JlZ3NfdjNb
XSA9IHsNCj4gDQo+IC4uLi4uLi4NCj4gDQo+IH0NCj4gDQo+IFRoaXMgd2F5LCB5b3UgZG9uJ3Qg
aGF2ZSB0byBjaGFuZ2UgYWxsIG9mIHRoZSBwbGF0Zm9ybSBkYXRhIGVudHJpZXMNCj4gYW5kIHlv
dQ0KPiBhbHNvIHdvbid0IGhhdmUgdG8gYWRkIGNoZWNrcyBpbiB0aGUgZG9fdHJhbnNmZXIgZnVu
Y3Rpb24sIGFzIHRoYXQncw0KPiBvbmUgb2YNCj4gdGhlIGFjdHVhbCBwb2ludHMgb2YgaGF2aW5n
IHRoZXNlIGFycmF5cyBvZiByZWdpc3RlciBvZmZzZXRzIGluIGhlcmUuDQo+IA0KPiBSZWdhcmRz
LA0KPiBBbmdlbG8NCj4gDQoNCkhpIEFuZ2VsbywNCg0KVGhhbmsgeW91IHZlcnkgbXVjaCBmb3Ig
eW91ciBzdWdnZXN0aW9uLCBJIHdpbGwgdXBkYXRlIHRoZSBwYXRjaCBhcw0Kc29vbiBhcyBwb3Nz
aWJsZS4NCg0KUmVnYXJkcywNCktld2VpDQo=


