Return-Path: <SRS0=SIUT=F3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76300C433E9
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Dec 2020 01:36:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3794220691
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Dec 2020 01:36:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3794220691
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:Reply-To:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O6NCL3GRTCUVop4q0YoQZflY08phUtCNIzwQNcFfEBo=; b=RuuOI/NofH83v0hPXYBhnyufMd
	nH0+4OXm0/E3BzOFP7PB29IQ7k20GgKW1UYZZDVhb8X2A53oWpMmFoingTCxWSaDkG+9ODVh3lgmp
	v8qa+7E66DZsBA1fyPUh3t56FZlN/tOh85l6gWDOimvcyDaNLaN9qleiHM4dtussR9y9ScxErUPKd
	2zCqKGslJIf8Hv6YyFS0UBgJXvrssIQEHXPat/nwNfR5eqvT2cbS/klZxrxJMarRfomLNgY0xvPn0
	bcsDNM1AVa5tzHuAMP6tXRDt96TnxN4VsM9bW0ccvi6u69opr0wy6Vw8RB+3VBT2UNwaCNm6bhuny
	gKkj5ggw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1krt55-0002UA-3t; Wed, 23 Dec 2020 01:36:47 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1krt4z-0002TD-5h; Wed, 23 Dec 2020 01:36:42 +0000
X-UUID: c3431eb18b964c0788e7e4e37890a4fa-20201222
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:Reply-To:From:Subject:Message-ID;
 bh=igemKLkcQLI3htu4s5toT7cvfqLMBfICa3D565HL4bA=; 
 b=QahvWeeSkj3vVyAsuRHXg4rdBogJeUkSbzyZJn2dnykCXiFhh6U2po39OCBIl1+BhOQy0ciwk2pVdnIu167g14XVRxRVUcFvfZ17B2+7m6oOrDDTR3l76Byom4cKiAR2mtYPuya5FLjaN2b+DNDzAOJBs7gJ/qodGZ6l67+VOdk=;
X-UUID: c3431eb18b964c0788e7e4e37890a4fa-20201222
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yongqiang.niu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 723512627; Tue, 22 Dec 2020 17:36:37 -0800
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 22 Dec 2020 17:36:05 -0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by mtkmbs05n2.mediatek.inc
 (172.21.101.140) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 23 Dec 2020 09:36:05 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 23 Dec 2020 09:36:02 +0800
Message-ID: <1608687363.18252.9.camel@mhfsdcap03>
Subject: Re: [PATCH v2, 10/17] drm/mediatek: fix aal size config
From: Yongqiang Niu <yongqiang.niu@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 23 Dec 2020 09:36:03 +0800
In-Reply-To: <CAAOTY_9JNdL-huHYKq=W5gRMUHVRWeUzDunNa7q_d7DPp4P2pg@mail.gmail.com>
References: <1607746317-4696-1-git-send-email-yongqiang.niu@mediatek.com>
 <1607746317-4696-11-git-send-email-yongqiang.niu@mediatek.com>
 <CAAOTY_9JNdL-huHYKq=W5gRMUHVRWeUzDunNa7q_d7DPp4P2pg@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201222_203641_368656_BC7D10FD 
X-CRM114-Status: GOOD (  22.07  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Reply-To: Yongqiang Niu <yongqiang.niu@mediatek.com>
Cc: Mark Rutland <mark.rutland@arm.com>, DTML <devicetree@vger.kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob
 Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, CK Hu <ck.hu@mediatek.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gV2VkLCAyMDIwLTEyLTE2IGF0IDIzOjEwICswODAwLCBDaHVuLUt1YW5nIEh1IHdyb3RlOg0K
PiBIaSwgWW9uZ3FpYW5nOg0KPiANCj4gWW9uZ3FpYW5nIE5pdSA8eW9uZ3FpYW5nLm5pdUBtZWRp
YXRlay5jb20+IOaWvCAyMDIw5bm0MTLmnIgxMuaXpSDpgLHlha0g5LiL5Y2IMTI6MjLlr6vpgZPv
vJoNCj4gPg0KPiA+IGZpeCBhYWwgc2l6ZSBjb25maWcNCj4gPg0KPiA+IEZpeGVzOiAwNjY0ZDEz
OTJjMjYgKGRybS9tZWRpYXRlazogQWRkIEFBTCBlbmdpbmUgYmFzaWMgZnVuY3Rpb24pDQo+ID4g
U2lnbmVkLW9mZi1ieTogWW9uZ3FpYW5nIE5pdSA8eW9uZ3FpYW5nLm5pdUBtZWRpYXRlay5jb20+
DQo+ID4gLS0tDQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcF9jb21w
LmMgfCAxMSArKysrKysrKysrLQ0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygr
KSwgMSBkZWxldGlvbigtKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9t
ZWRpYXRlay9tdGtfZHJtX2RkcF9jb21wLmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRr
X2RybV9kZHBfY29tcC5jDQo+ID4gaW5kZXggYmU2MWQxMS4uZTdkNDgxZTAgMTAwNjQ0DQo+ID4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRwX2NvbXAuYw0KPiA+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcF9jb21wLmMNCj4gPiBAQCAt
MzMsOCArMzMsMTMgQEANCj4gPiAgI2RlZmluZSBESVNQX1JFR19VRk9fU1RBUlQgICAgICAgICAg
ICAgICAgICAgICAweDAwMDANCj4gPg0KPiA+ICAjZGVmaW5lIERJU1BfQUFMX0VOICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIDB4MDAwMA0KPiA+ICsjZGVmaW5lIERJU1BfQUFMX0NGRyAgICAg
ICAgICAgICAgICAgICAgICAgICAgIDB4MDAyMA0KPiA+ICsjZGVmaW5lIEFBTF9SRUxBWV9NT0RF
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgQklUKDApDQo+ID4gKyNkZWZpbmUgQUFM
X0VOR0lORV9FTiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBCSVQoMSkNCj4gPiAg
I2RlZmluZSBESVNQX0FBTF9TSVpFICAgICAgICAgICAgICAgICAgICAgICAgICAweDAwMzANCj4g
Pg0KPiA+ICsjZGVmaW5lIERJU1BfQUFMX09VVFBVVF9TSVpFICAgICAgICAgICAgICAgICAgIDB4
MDRkOA0KPiA+ICsNCj4gPiAgI2RlZmluZSBESVNQX0NDT1JSX0VOICAgICAgICAgICAgICAgICAg
ICAgICAgICAweDAwMDANCj4gPiAgI2RlZmluZSBDQ09SUl9FTiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBCSVQoMCkNCj4gPiAgI2RlZmluZSBESVNQX0NDT1JSX0NGRyAgICAgICAgICAg
ICAgICAgICAgICAgICAweDAwMjANCj4gPiBAQCAtMTg0LDcgKzE4OSwxMSBAQCBzdGF0aWMgdm9p
ZCBtdGtfYWFsX2NvbmZpZyhzdHJ1Y3QgbXRrX2RkcF9jb21wICpjb21wLCB1bnNpZ25lZCBpbnQg
dywNCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgaCwgdW5zaWdu
ZWQgaW50IHZyZWZyZXNoLA0KPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVk
IGludCBicGMsIHN0cnVjdCBjbWRxX3BrdCAqY21kcV9wa3QpDQo+ID4gIHsNCj4gPiAtICAgICAg
IG10a19kZHBfd3JpdGUoY21kcV9wa3QsIGggPDwgMTYgfCB3LCBjb21wLCBESVNQX0FBTF9TSVpF
KTsNCj4gPiArICAgICAgIG10a19kZHBfd3JpdGUoY21kcV9wa3QsIHcgPDwgMTYgfCBoLCBjb21w
LCBESVNQX0FBTF9TSVpFKTsNCj4gPiArICAgICAgIG10a19kZHBfd3JpdGUoY21kcV9wa3QsIHcg
PDwgMTYgfCBoLCBjb21wLCBESVNQX0FBTF9PVVRQVVRfU0laRSk7DQo+ID4gKw0KPiA+ICsgICAg
ICAgbXRrX2RkcF93cml0ZV9tYXNrKE5VTEwsIEFBTF9SRUxBWV9NT0RFLCBjb21wLCBESVNQX0FB
TF9DRkcsDQo+IA0KPiBjbWRxX3BrdA0KPiANCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAg
ICBBQUxfUkVMQVlfTU9ERSB8IEFBTF9FTkdJTkVfRU4pOw0KPiANCj4gVGhpcyBwYXRjaCBpcyB0
byBmaXggc2l6ZSBjb25maWcsIHNvIG1vdmUgdGhpcyBzdGF0ZW1lbnQgdG8gYW5vdGhlciBwYXRj
aC4NCj4gDQo+IFJlZ2FyZHMsDQo+IENodW4tS3VhbmcuDQo+IA0KDQp3aWxsIGJlIGZpeGVkIGlu
IG5leHQgdmVyc2lvbg0KDQo+ID4gIH0NCj4gPg0KPiA+ICBzdGF0aWMgdm9pZCBtdGtfYWFsX3N0
YXJ0KHN0cnVjdCBtdGtfZGRwX2NvbXAgKmNvbXApDQo+ID4gLS0NCj4gPiAxLjguMS4xLmRpcnR5
DQo+ID4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCj4g
PiBMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QNCj4gPiBMaW51eC1tZWRpYXRla0BsaXN0cy5p
bmZyYWRlYWQub3JnDQo+ID4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1tZWRpYXRlaw0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
