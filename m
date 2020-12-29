Return-Path: <SRS0=bnG6=GB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A91C9C433E0
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Dec 2020 00:53:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4C1A9207D0
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Dec 2020 00:53:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4C1A9207D0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:Reply-To:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z95uMRkeRjvgZGQYBBGeBsEEC3pySBBxhyNEeoeVCvI=; b=ZS94xEmUnG/wpbOW6qH2st82TT
	jStw8SeObcHwSXfmAgoGCoO28OdWjswaTXfBb4D1b2dBs/J2MSakVTuXz4Yry2rzrIE/Uul38e/tg
	pjWTxXG2cz07tKjYtknhRN7OZ2h67E1X7XbWNlSuj0Ti0rLyhDlDZNHcVdSCCw6jxC7X5GXLW3NxT
	Q1BZaKs/63lWoh3vbjnm4kglEM9cEJRLb74iAQ9BfXY1fPdvKxT0fgX/Td9W+Lvi6y9eKAnQqMe3z
	m0BlRk/Kh4kUbEZhiInupq+S1w1zj2YrY98XrXoVihugDG33IzhLI8VqN0aHg/Qw2hYwUt5Liyy4z
	K8GQi93Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ku3GF-0000y4-3f; Tue, 29 Dec 2020 00:53:15 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ku3G9-0000xM-GP; Tue, 29 Dec 2020 00:53:11 +0000
X-UUID: b962f5882dee4158b145f766129044ab-20201228
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:Reply-To:From:Subject:Message-ID;
 bh=l5BaJ1fMqhHLJEANX8+mPHsA/fgq1r0nW6xefUzPcD0=; 
 b=eKeidNTixcgpBrO6+Ap3QrfxHF/wnqPGXYnHW8AcCJ+khjjensH3uD8UrhfE7wrWODiCZnvulmOYxOap7OQ2sGn8uTe5QZWiCcr/8Lpc4yHO7Q2oN55gHAIL4oP8Hsu3nXX+7FRf94eL1n7J14P7PP7/Q+c+Hpwd7aEJjso/1F4=;
X-UUID: b962f5882dee4158b145f766129044ab-20201228
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yongqiang.niu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 674031991; Mon, 28 Dec 2020 16:53:04 -0800
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 28 Dec 2020 16:54:08 -0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by mtkmbs05n1.mediatek.inc
 (172.21.101.15) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 29 Dec 2020 08:54:07 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 29 Dec 2020 08:54:07 +0800
Message-ID: <1609203179.24062.0.camel@mhfsdcap03>
Subject: Re: [PATCH v3, 7/8] soc: mediatek: mmsys: Use function call for
 setting mmsys ovl mout register
From: Yongqiang Niu <yongqiang.niu@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 29 Dec 2020 08:52:59 +0800
In-Reply-To: <CAAOTY_9ObwPwKt6nRc_qSu9JE3WbqeRDEpKObnxsfhENbkT+iw@mail.gmail.com>
References: <1609144630-14721-1-git-send-email-yongqiang.niu@mediatek.com>
 <1609144630-14721-8-git-send-email-yongqiang.niu@mediatek.com>
 <CAAOTY_9ObwPwKt6nRc_qSu9JE3WbqeRDEpKObnxsfhENbkT+iw@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201228_195310_317509_27898DE6 
X-CRM114-Status: GOOD (  20.84  )
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
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob
 Herring <robh+dt@kernel.org>, "moderated
 list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, CK Hu <ck.hu@mediatek.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gVHVlLCAyMDIwLTEyLTI5IGF0IDAwOjM4ICswODAwLCBDaHVuLUt1YW5nIEh1IHdyb3RlOg0K
PiBIaSwgWW9uZ3FpYW5nOg0KPiANCj4gWW9uZ3FpYW5nIE5pdSA8eW9uZ3FpYW5nLm5pdUBtZWRp
YXRlay5jb20+IOaWvCAyMDIw5bm0MTLmnIgyOOaXpSDpgLHkuIAg5LiL5Y2INDozOOWvq+mBk++8
mg0KPiA+DQo+ID4gVXNlIGZ1bmN0aW9uIGNhbGwgZm9yIHNldHRpbmcgbW1zeXMgb3ZsIG1vdXQg
cmVnaXN0ZXINCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFlvbmdxaWFuZyBOaXUgPHlvbmdxaWFu
Zy5uaXVAbWVkaWF0ZWsuY29tPg0KPiA+IC0tLQ0KPiA+ICBkcml2ZXJzL3NvYy9tZWRpYXRlay9t
bXN5cy9tdGstbW1zeXMuYyB8IDIwICsrKysrKysrKysrKysrKysrKysrDQo+ID4gIGluY2x1ZGUv
bGludXgvc29jL21lZGlhdGVrL210ay1tbXN5cy5oIHwgIDMgKysrDQo+ID4gIDIgZmlsZXMgY2hh
bmdlZCwgMjMgaW5zZXJ0aW9ucygrKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvc29j
L21lZGlhdGVrL21tc3lzL210ay1tbXN5cy5jIGIvZHJpdmVycy9zb2MvbWVkaWF0ZWsvbW1zeXMv
bXRrLW1tc3lzLmMNCj4gPiBpbmRleCBkYWU2NjViLi5lYTM2YTExIDEwMDY0NA0KPiA+IC0tLSBh
L2RyaXZlcnMvc29jL21lZGlhdGVrL21tc3lzL210ay1tbXN5cy5jDQo+ID4gKysrIGIvZHJpdmVy
cy9zb2MvbWVkaWF0ZWsvbW1zeXMvbXRrLW1tc3lzLmMNCj4gPiBAQCAtNzQsNiArNzQsMTcgQEAg
dm9pZCBtdGtfbW1zeXNfZGRwX2Nvbm5lY3Qoc3RydWN0IGRldmljZSAqZGV2LA0KPiA+ICAgICAg
ICAgICAgICAgICByZWcgPSByZWFkbF9yZWxheGVkKG1tc3lzLT5yZWdzICsgYWRkcikgfCB2YWx1
ZTsNCj4gPiAgICAgICAgICAgICAgICAgd3JpdGVsX3JlbGF4ZWQocmVnLCBtbXN5cy0+cmVncyAr
IGFkZHIpOw0KPiA+ICAgICAgICAgfQ0KPiA+ICsNCj4gPiArICAgICAgIGlmICghZnVuY3MtPm92
bF9tb3V0X2VuKQ0KPiA+ICsgICAgICAgICAgICAgICByZXR1cm47DQo+ID4gKw0KPiA+ICsgICAg
ICAgaWYgKGZ1bmNzLT5vdmxfbW91dF9lbikgew0KPiA+ICsgICAgICAgICAgICAgICB2YWx1ZSA9
IGZ1bmNzLT5vdmxfbW91dF9lbihjdXIsIG5leHQsICZhZGRyKTsNCj4gPiArICAgICAgICAgICAg
ICAgaWYgKHZhbHVlKSB7DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgcmVnID0gcmVhZGxf
cmVsYXhlZChtbXN5cy0+cmVncyArIGFkZHIpIHwgdmFsdWU7DQo+ID4gKyAgICAgICAgICAgICAg
ICAgICAgICAgd3JpdGVsX3JlbGF4ZWQocmVnLCBtbXN5cy0+cmVncyArIGFkZHIpOw0KPiA+ICsg
ICAgICAgICAgICAgICB9DQo+ID4gKyAgICAgICB9DQo+IA0KPiBtdGtfbW1zeXNfZGRwX21vdXRf
ZW4oKSBjb3VsZCB3cml0ZSByZWdpc3RlciBpbnNpZGUgaXQgcmF0aGVyIHRoYW4NCj4gcmV0dXJu
IHZhbHVlIGFuZCB3cml0ZSByZWdpc3RlciBpbiBtdGtfbW1zeXNfZGRwX2Nvbm5lY3QoKS4gU28g
eW91DQo+IGNvdWxkIGRvIG92bF9tb3V0X2VuKCkgaW4gbXRrX21tc3lzX2RkcF9tb3V0X2VuKCku
DQo+IA0KPiBSZWdhcmRzLA0KPiBDaHVuLUt1YW5nLg0KDQppZiB0aGF0LCB0aGVyZSB3aWxsIGJl
IG1hbnkgcmVwZWF0IGNvZGUgbGlrZSB0aGlzOg0KDQppZiAodmFsdWUpIHsNCiAgICAgICAgICAg
ICAgICAgICAgcmVnID0gcmVhZGxfcmVsYXhlZChtbXN5cy0+cmVncyArIGFkZHIpIHwgdmFsdWU7
DQogICAgICAgICAgICAgICAgICAgIHdyaXRlbF9yZWxheGVkKHJlZywgbW1zeXMtPnJlZ3MgKyBh
ZGRyKTsNCiAgICAgICAgICAgICB9DQoNCg0KPiANCj4gPiAgfQ0KPiA+ICBFWFBPUlRfU1lNQk9M
X0dQTChtdGtfbW1zeXNfZGRwX2Nvbm5lY3QpOw0KPiA+DQo+ID4gQEAgLTk5LDYgKzExMCwxNSBA
QCB2b2lkIG10a19tbXN5c19kZHBfZGlzY29ubmVjdChzdHJ1Y3QgZGV2aWNlICpkZXYsDQo+ID4g
ICAgICAgICAgICAgICAgIHJlZyA9IHJlYWRsX3JlbGF4ZWQobW1zeXMtPnJlZ3MgKyBhZGRyKSAm
IH52YWx1ZTsNCj4gPiAgICAgICAgICAgICAgICAgd3JpdGVsX3JlbGF4ZWQocmVnLCBtbXN5cy0+
cmVncyArIGFkZHIpOw0KPiA+ICAgICAgICAgfQ0KPiA+ICsNCj4gPiArICAgICAgIGlmICghZnVu
Y3MtPm92bF9tb3V0X2VuKQ0KPiA+ICsgICAgICAgICAgICAgICByZXR1cm47DQo+ID4gKw0KPiA+
ICsgICAgICAgdmFsdWUgPSBmdW5jcy0+b3ZsX21vdXRfZW4oY3VyLCBuZXh0LCAmYWRkcik7DQo+
ID4gKyAgICAgICBpZiAodmFsdWUpIHsNCj4gPiArICAgICAgICAgICAgICAgcmVnID0gcmVhZGxf
cmVsYXhlZChtbXN5cy0+cmVncyArIGFkZHIpICYgfnZhbHVlOw0KPiA+ICsgICAgICAgICAgICAg
ICB3cml0ZWxfcmVsYXhlZChyZWcsIG1tc3lzLT5yZWdzICsgYWRkcik7DQo+ID4gKyAgICAgICB9
DQo+ID4gIH0NCj4gPiAgRVhQT1JUX1NZTUJPTF9HUEwobXRrX21tc3lzX2RkcF9kaXNjb25uZWN0
KTsNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L3NvYy9tZWRpYXRlay9tdGst
bW1zeXMuaCBiL2luY2x1ZGUvbGludXgvc29jL21lZGlhdGVrL210ay1tbXN5cy5oDQo+ID4gaW5k
ZXggYWE0ZjYwZS4uMjIwMjAzZCAxMDA2NDQNCj4gPiAtLS0gYS9pbmNsdWRlL2xpbnV4L3NvYy9t
ZWRpYXRlay9tdGstbW1zeXMuaA0KPiA+ICsrKyBiL2luY2x1ZGUvbGludXgvc29jL21lZGlhdGVr
L210ay1tbXN5cy5oDQo+ID4gQEAgLTQ5LDYgKzQ5LDkgQEAgc3RydWN0IG10a19tbXN5c19jb25u
X2Z1bmNzIHsNCj4gPiAgICAgICAgIHUzMiAoKm1vdXRfZW4pKGVudW0gbXRrX2RkcF9jb21wX2lk
IGN1ciwNCj4gPiAgICAgICAgICAgICAgICAgICAgICAgIGVudW0gbXRrX2RkcF9jb21wX2lkIG5l
eHQsDQo+ID4gICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgKmFkZHIpOw0KPiA+
ICsgICAgICAgdTMyICgqb3ZsX21vdXRfZW4pKGVudW0gbXRrX2RkcF9jb21wX2lkIGN1ciwNCj4g
PiArICAgICAgICAgICAgICAgICAgICAgICAgICBlbnVtIG10a19kZHBfY29tcF9pZCBuZXh0LA0K
PiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGludCAqYWRkcik7DQo+ID4g
ICAgICAgICB1MzIgKCpzZWxfaW4pKGVudW0gbXRrX2RkcF9jb21wX2lkIGN1ciwNCj4gPiAgICAg
ICAgICAgICAgICAgICAgICAgZW51bSBtdGtfZGRwX2NvbXBfaWQgbmV4dCwNCj4gPiAgICAgICAg
ICAgICAgICAgICAgICAgdW5zaWduZWQgaW50ICphZGRyKTsNCj4gPiAtLQ0KPiA+IDEuOC4xLjEu
ZGlydHkNCj4gPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Xw0KPiA+IExpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdA0KPiA+IExpbnV4LW1lZGlhdGVrQGxp
c3RzLmluZnJhZGVhZC5vcmcNCj4gPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRp
YXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
