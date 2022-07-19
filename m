Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33A82C43334
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Jul 2022 06:13:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+vtvFKOriBDSAwwMa2gfg320KgNN4SXwPXoryI7fbes=; b=rB3LUnenZsg6VbjmNbvDo7eLem
	CYYBl9IV3bpebLhC8M2/y6vEUa7Axu3JaUX/U9rOvCDZsgkICWEhwWQ0eU23zDaQw6l5BggBfV3Fp
	dWR4TWiOOPkZx2BgeyiiGXQNKFCAIMCVZlCxKeQaPQpAZhJP8ftjMguCaKIafbxacavabA3Axgsvq
	Gt/Xo2h64JJtAndv9WNglE8GKWnPCBHPAfG1TfuycvTuxic8pwZODrjy/WGz1p4ezo4TUDSA0GEW6
	N5Zsqd+xzNH8/f3uCJHTut4YWUu7o8AGpNSok6D7s/27lQlHrDhQsh481BYkE+9fDNIvZ1Z0t/wwF
	A6sSePCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDgTu-005cwE-Pv; Tue, 19 Jul 2022 06:13:18 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDgTs-005cvc-M0; Tue, 19 Jul 2022 06:13:17 +0000
X-UUID: f3bb4e55efbb44828735624ec3e58d0d-20220718
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=+vtvFKOriBDSAwwMa2gfg320KgNN4SXwPXoryI7fbes=;
	b=poY2v/C45zTjxGu71h1MWqghs5P53A7oh2DbhY5CwVdICDvSHNGfinR+ARDQKZ5I6QR6wmEVXzb7GRVGwxE61lJBMfg53EpKR3/o5zLpfHDSeg7lRFqPaplwQwJufM8+151OeL7bSV5NX30cIsrTSYyOF5C9hAXz97Jw4RGp2XA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:f7b99077-9199-49cd-be81-415da3a01d0a,OB:0,LO
	B:0,IP:0,URL:5,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:5
X-CID-META: VersionHash:0f94e32,CLOUDID:2265aa64-0b3f-4b2c-b3a6-ed5c044366a0,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: f3bb4e55efbb44828735624ec3e58d0d-20220718
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1874285875; Mon, 18 Jul 2022 23:13:11 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Tue, 19 Jul 2022 13:23:06 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Tue, 19 Jul 2022 13:23:06 +0800
Message-ID: <2893728a294ef13bdeba9e587083b82fb794cc68.camel@mediatek.com>
Subject: Re: [for-next][PATCH 13/23] USB: mtu3: tracing: Use the new
 __vstring() helper
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Steven Rostedt <rostedt@goodmis.org>
CC: <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@kernel.org>, "Andrew
 Morton" <akpm@linux-foundation.org>, <linux-usb@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Tue, 19 Jul 2022 13:23:06 +0800
In-Reply-To: <20220715173944.386743d8@gandalf.local.home>
References: <20220714164256.403842845@goodmis.org>
	 <20220714164330.311734558@goodmis.org>
	 <1267b234b09280b9b475cfe2bb32580e967e2dac.camel@mediatek.com>
	 <20220715173944.386743d8@gandalf.local.home>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
Content-Transfer-Encoding: base64
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220718_231316_744331_3569D290 
X-CRM114-Status: GOOD (  12.98  )
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

T24gRnJpLCAyMDIyLTA3LTE1IGF0IDE3OjM5IC0wNDAwLCBTdGV2ZW4gUm9zdGVkdCB3cm90ZToN
Cj4gT24gRnJpLCAxNSBKdWwgMjAyMiAxNDozMjowNSArMDgwMA0KPiBDaHVuZmVuZyBZdW4gPGNo
dW5mZW5nLnl1bkBtZWRpYXRlay5jb20+IHdyb3RlOg0KPiANCj4gPiBDYW4geW91IGhlbHAgdG8g
cmVtb3ZlIG1hY3JvICJNVFUzX01TR19NQVgiIGFuZCBvbmUgYmxhbmsgbGluZQ0KPiA+IGFmdGVy
IGl0DQo+ID4gaW4gdGhpcyBmaWxlLCB0aGlzIG1hY3JvIGlzIG5vdCB1c2VkIGFueW1vcmUgYWZ0
ZXIgYXBwbHkgdGhpcw0KPiA+IHBhdGNoLg0KPiANCj4gQ2FyZSB0byBzZW5kIG1lIGEgcGF0Y2gs
IGFuZCBJJ2xsIGp1c3QgaW5jbHVkZSBpdCBpbiBteSBzZXJpZXM/DQpTZWVtcyBubyBuZWVkIGFk
ZCBhbm90aGVyIHBhdGNoLCBqdXN0IG1vZGlmeSB0aGlzIHBhdGNoIGFzIGJlbG93Og0KDQpkaWZm
IC0tZ2l0IGEvZHJpdmVycy91c2IvbXR1My9tdHUzX3RyYWNlLmgNCmIvZHJpdmVycy91c2IvbXR1
My9tdHUzX3RyYWNlLmgNCmluZGV4IGEwOWRlYWUxMTQ2Zi4uMDNkMmE5YmFjMjdlIDEwMDY0NA0K
LS0tIGEvZHJpdmVycy91c2IvbXR1My9tdHUzX3RyYWNlLmgNCisrKyBiL2RyaXZlcnMvdXNiL210
dTMvbXR1M190cmFjZS5oDQpAQCAtMTgsMTggKzE4LDE2IEBADQoNCiAjaW5jbHVkZSAibXR1My5o
Ig0KDQotI2RlZmluZSBNVFUzX01TR19NQVggICAyNTYNCi0NCiBUUkFDRV9FVkVOVChtdHUzX2xv
ZywNCiAgICAgICAgVFBfUFJPVE8oc3RydWN0IGRldmljZSAqZGV2LCBzdHJ1Y3QgdmFfZm9ybWF0
ICp2YWYpLA0KICAgICAgICBUUF9BUkdTKGRldiwgdmFmKSwNCiAgICAgICAgVFBfU1RSVUNUX19l
bnRyeSgNCiAgICAgICAgICAgICAgICBfX3N0cmluZyhuYW1lLCBkZXZfbmFtZShkZXYpKQ0KLSAg
ICAgICAgICAgICAgIF9fZHluYW1pY19hcnJheShjaGFyLCBtc2csIE1UVTNfTVNHX01BWCkNCisg
ICAgICAgICAgICAgICBfX3ZzdHJpbmcobXNnLCB2YWYtPmZtdCwgdmFmLT52YSkNCiAgICAgICAg
KSwNCiAgICAgICAgVFBfZmFzdF9hc3NpZ24oDQogICAgICAgICAgICAgICAgX19hc3NpZ25fc3Ry
KG5hbWUsIGRldl9uYW1lKGRldikpOw0KLSAgICAgICAgICAgICAgIHZzbnByaW50ZihfX2dldF9z
dHIobXNnKSwgTVRVM19NU0dfTUFYLCB2YWYtPmZtdCwgKnZhZi0NCj52YSk7DQorICAgICAgICAg
ICAgICAgX19hc3NpZ25fdnN0cihtc2csIHZhZi0+Zm10LCB2YWYtPnZhKTsNCiAgICAgICAgKSwN
CiAgICAgICAgVFBfcHJpbnRrKCIlczogJXMiLCBfX2dldF9zdHIobmFtZSksIF9fZ2V0X3N0ciht
c2cpKQ0KICk7DQo+IA0KDQpyZW1vdmUgYmVsb3cgdHdvIGxpbmVzDQoiDQotI2RlZmluZSBNVFUz
X01TR19NQVggICAyNTYNCi0NCiINClRoYW5rcw0KDQo+IC0tIFN0ZXZlDQo=


