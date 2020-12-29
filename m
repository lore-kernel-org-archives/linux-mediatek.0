Return-Path: <SRS0=bnG6=GB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 859C7C433E0
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Dec 2020 01:34:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2F399207D1
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Dec 2020 01:34:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2F399207D1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:Reply-To:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RtCpUKAnEx9K57c7OoMeoCb3AtUat4zW6BoIj0MZAjY=; b=cxHd9VzwBn1wCJBICitdhmp6P4
	Q6A8TPhaK1B/gYlu1lEHu86jhVxerl9bZSmIQr/TXVX8Zo9EPxYZep8MqM9T7NiMx2IeBJvBZV8Vh
	xKg0VMiSfEn4q3di5KbS3PF2P87Jt8JrGtQyhx5iF45PySPv2qkHw2c2/STr3YMEZb3q8TfzMagji
	Huzu1LncUI4F2/7TK+C+n9qt3HrO+ZcDJPYwUZ53dBEWhIqXp20N/l++NZcaDBavD3dpZKoOlvx6H
	rsrG4xMCl8kdwIIACX7aejTDHHFcYoc02SFw0V67r0qpoyxLWSXBhkOuGJb24CjXgEheWQY4QakFF
	ZSu2C3Ng==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ku3u1-0004nN-UD; Tue, 29 Dec 2020 01:34:21 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ku3tx-0004mc-MO; Tue, 29 Dec 2020 01:34:19 +0000
X-UUID: eca50a1ee2bd477fb20090da5f678832-20201228
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:Reply-To:From:Subject:Message-ID;
 bh=fdAfDBXqjGSdAm6mjwKnuxy0qCLmgADvcqdksYzyP64=; 
 b=iXvRob+DgPie6qaWlHIggCqyJO7C8fipoi5tpQbMeUzoPOOUDTjF4GGSz4xOZNkgG+hi82Rgiz4Hmwllr2lXmBFxxuYTbpPxuGqqzVwmtTE8u6X/2uo5z5ebzKMbpmEIitbvaZR0Pjt9XMqG3H+GiB9IkiPz7N7DkIehQQHUerc=;
X-UUID: eca50a1ee2bd477fb20090da5f678832-20201228
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <yongqiang.niu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 632416411; Mon, 28 Dec 2020 17:34:15 -0800
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 28 Dec 2020 17:35:18 -0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by mtkmbs05n2.mediatek.inc
 (172.21.101.140) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 29 Dec 2020 09:35:17 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 29 Dec 2020 09:35:18 +0800
Message-ID: <1609205650.24062.2.camel@mhfsdcap03>
Subject: Re: [PATCH v3, 7/8] soc: mediatek: mmsys: Use function call for
 setting mmsys ovl mout register
From: Yongqiang Niu <yongqiang.niu@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 29 Dec 2020 09:34:10 +0800
In-Reply-To: <CAAOTY_9ObwPwKt6nRc_qSu9JE3WbqeRDEpKObnxsfhENbkT+iw@mail.gmail.com>
References: <1609144630-14721-1-git-send-email-yongqiang.niu@mediatek.com>
 <1609144630-14721-8-git-send-email-yongqiang.niu@mediatek.com>
 <CAAOTY_9ObwPwKt6nRc_qSu9JE3WbqeRDEpKObnxsfhENbkT+iw@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201228_203417_985109_1AC87A21 
X-CRM114-Status: GOOD (  21.17  )
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
DQo+IA0KPiBSZWdhcmRzLA0KPiBDaHVuLUt1YW5nLg0KDQppIHdpbGwgYWRkIHRoaXMgbW9kaWZp
Y2F0aW9uIGluIG5leHQgdmVyc2lvbg0KPiANCj4gPiAgfQ0KPiA+ICBFWFBPUlRfU1lNQk9MX0dQ
TChtdGtfbW1zeXNfZGRwX2Nvbm5lY3QpOw0KPiA+DQo+ID4gQEAgLTk5LDYgKzExMCwxNSBAQCB2
b2lkIG10a19tbXN5c19kZHBfZGlzY29ubmVjdChzdHJ1Y3QgZGV2aWNlICpkZXYsDQo+ID4gICAg
ICAgICAgICAgICAgIHJlZyA9IHJlYWRsX3JlbGF4ZWQobW1zeXMtPnJlZ3MgKyBhZGRyKSAmIH52
YWx1ZTsNCj4gPiAgICAgICAgICAgICAgICAgd3JpdGVsX3JlbGF4ZWQocmVnLCBtbXN5cy0+cmVn
cyArIGFkZHIpOw0KPiA+ICAgICAgICAgfQ0KPiA+ICsNCj4gPiArICAgICAgIGlmICghZnVuY3Mt
Pm92bF9tb3V0X2VuKQ0KPiA+ICsgICAgICAgICAgICAgICByZXR1cm47DQo+ID4gKw0KPiA+ICsg
ICAgICAgdmFsdWUgPSBmdW5jcy0+b3ZsX21vdXRfZW4oY3VyLCBuZXh0LCAmYWRkcik7DQo+ID4g
KyAgICAgICBpZiAodmFsdWUpIHsNCj4gPiArICAgICAgICAgICAgICAgcmVnID0gcmVhZGxfcmVs
YXhlZChtbXN5cy0+cmVncyArIGFkZHIpICYgfnZhbHVlOw0KPiA+ICsgICAgICAgICAgICAgICB3
cml0ZWxfcmVsYXhlZChyZWcsIG1tc3lzLT5yZWdzICsgYWRkcik7DQo+ID4gKyAgICAgICB9DQo+
ID4gIH0NCj4gPiAgRVhQT1JUX1NZTUJPTF9HUEwobXRrX21tc3lzX2RkcF9kaXNjb25uZWN0KTsN
Cj4gPg0KPiA+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L3NvYy9tZWRpYXRlay9tdGstbW1z
eXMuaCBiL2luY2x1ZGUvbGludXgvc29jL21lZGlhdGVrL210ay1tbXN5cy5oDQo+ID4gaW5kZXgg
YWE0ZjYwZS4uMjIwMjAzZCAxMDA2NDQNCj4gPiAtLS0gYS9pbmNsdWRlL2xpbnV4L3NvYy9tZWRp
YXRlay9tdGstbW1zeXMuaA0KPiA+ICsrKyBiL2luY2x1ZGUvbGludXgvc29jL21lZGlhdGVrL210
ay1tbXN5cy5oDQo+ID4gQEAgLTQ5LDYgKzQ5LDkgQEAgc3RydWN0IG10a19tbXN5c19jb25uX2Z1
bmNzIHsNCj4gPiAgICAgICAgIHUzMiAoKm1vdXRfZW4pKGVudW0gbXRrX2RkcF9jb21wX2lkIGN1
ciwNCj4gPiAgICAgICAgICAgICAgICAgICAgICAgIGVudW0gbXRrX2RkcF9jb21wX2lkIG5leHQs
DQo+ID4gICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgKmFkZHIpOw0KPiA+ICsg
ICAgICAgdTMyICgqb3ZsX21vdXRfZW4pKGVudW0gbXRrX2RkcF9jb21wX2lkIGN1ciwNCj4gPiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICBlbnVtIG10a19kZHBfY29tcF9pZCBuZXh0LA0KPiA+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGludCAqYWRkcik7DQo+ID4gICAg
ICAgICB1MzIgKCpzZWxfaW4pKGVudW0gbXRrX2RkcF9jb21wX2lkIGN1ciwNCj4gPiAgICAgICAg
ICAgICAgICAgICAgICAgZW51bSBtdGtfZGRwX2NvbXBfaWQgbmV4dCwNCj4gPiAgICAgICAgICAg
ICAgICAgICAgICAgdW5zaWduZWQgaW50ICphZGRyKTsNCj4gPiAtLQ0KPiA+IDEuOC4xLjEuZGly
dHkNCj4gPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0K
PiA+IExpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdA0KPiA+IExpbnV4LW1lZGlhdGVrQGxpc3Rz
LmluZnJhZGVhZC5vcmcNCj4gPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LW1lZGlhdGVrDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRl
a0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
