Return-Path: <SRS0=FoZt=PX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A313C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Nov 2021 03:36:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C240C61106
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Nov 2021 03:36:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C240C61106
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NasPjsYfNpdhJhueSUxnPGXgyGGOzJnrPxQLB1yqHig=; b=mP8wZuEboCsPpo
	+BQYfbhsD2aYmQIauG/0nFWlkKSY1p4ulVeKLLQWkHiYlS6ITg+PP29O3054iIlqmQ25+o71NolVa
	bmhFB6ZAxZxqVryBRmaxTUqdQwJGIMa9dbYuPIjhEj2tre6zKZj/hxS2mUmp0mDxj9s6OVUX/oUhj
	A+xie5g0NfWi0CK59mUWT//xdN9T/llcZsBS6z42vjRT6ey+M7z9hd/tPwjXAdAzPe+zUSkdJaQmb
	pY6+oFLcx2qaO5YhnH0tlnmBrEaFwEQvj30YOj7WRIeFWWOHWVA7sQefg2YVnao6YjP1diKKxWlTQ
	sudAQ3p1LqGsg2Rojklg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1miTYK-007ldI-2B; Thu, 04 Nov 2021 03:36:36 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1miTY6-007lZb-VJ; Thu, 04 Nov 2021 03:36:24 +0000
X-UUID: 9cae7f49957d49d985d30055c5e74c43-20211103
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=jyivBy6suiwNi0Rud/PxmeHxAt9PJF265dfp0MCeEzQ=; 
 b=pQJ6AaFjNaZKSYDrrSxT9w9YVy3S3NpvcH2gGGnwWIJlrgRCkE3v0tcz2royyAgmjPww4WFCuBcfZXOhi8X81hnAnFaW2O8eFBlhCIDyVxK0/tg6eFxfcV6JJTUHWO6ETAusvMKBboyK8ulxUmFqHHZugoqMqZ6lxd8IV4ss8gI=;
X-UUID: 9cae7f49957d49d985d30055c5e74c43-20211103
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 77851919; Wed, 03 Nov 2021 20:36:20 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 3 Nov 2021 20:36:19 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkexhb02.mediatek.inc (172.21.101.103) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 4 Nov 2021 11:36:17 +0800
Received: from mszsdhlt06 (10.16.6.206) by mtkmbs10n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Thu, 4 Nov 2021 11:36:16 +0800
Message-ID: <ad925a6c1438b78f3c79b37fd0a545c9eb153a59.camel@mediatek.com>
Subject: Re: [PATCH v7 1/3] drm/dsi: transer dsi hs packet aligned
From: Jitao Shi <jitao.shi@mediatek.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, "Chun-Kuang
 Hu" <chunkuang.hu@kernel.org>
CC: Philipp Zabel <p.zabel@pengutronix.de>, Matthias Brugger
 <matthias.bgg@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, David Airlie
 <airlied@linux.ie>, DRI Development <dri-devel@lists.freedesktop.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>, Linux ARM
 <linux-arm-kernel@lists.infradead.org>, CK Hu <ck.hu@mediatek.com>,
 <stonea168@163.com>, <huijuan.xie@mediatek.com>, Rex-BC Chen
 <rex-bc.chen@mediatek.com>, <shuijing.li@mediatek.com>
Date: Thu, 4 Nov 2021 11:36:16 +0800
In-Reply-To: <CAAOTY_8H=TE8574xB3FFcGVgN_fTb_83+FT8ei1CDuB4k4-Oew@mail.gmail.com>
References: <20210915223117.7857-1-jitao.shi@mediatek.com>
 <20210915223117.7857-2-jitao.shi@mediatek.com>
 <CAAOTY_8H=TE8574xB3FFcGVgN_fTb_83+FT8ei1CDuB4k4-Oew@mail.gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211103_203623_038519_E32875EA 
X-CRM114-Status: GOOD (  19.15  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGkgc2lycw0KDQpQbHMgaGVscCB0byByZXZpZXcgdGhpcyBjaGFuZ2UuDQoNCkJlc3QgUmVnYXJk
cw0KSml0YW8uDQoNCk9uIFR1ZSwgMjAyMS0xMC0wNSBhdCAwNzo1MyArMDgwMCwgQ2h1bi1LdWFu
ZyBIdSB3cm90ZToNCj4gSGksIEppdGFvOg0KPiANCj4gSml0YW8gU2hpIDxqaXRhby5zaGlAbWVk
aWF0ZWsuY29tPiDmlrwgMjAyMeW5tDnmnIgxNuaXpSDpgLHlm5sg5LiK5Y2INjozMeWvq+mBk++8
mg0KPiA+IA0KPiA+IFNvbWUgRFNJIGRldmljZXMgcmVxaXJlIHRoZSBocyBwYWNrZXQgc3RhcnRp
bmcgYW5kIGVuZGluZw0KPiA+IGF0IHNhbWUgdGltZSBvbiBhbGwgZHNpIGxhbmVzLiBTbyB1c2Ug
YSBmbGFnIHRvIHRob3NlIGRldmljZXMuDQo+ID4gDQo+IA0KPiBSZXZpZXdlZC1ieTogQ2h1bi1L
dWFuZyBIdSA8Y2h1bmt1YW5nLmh1QGtlcm5lbC5vcmc+DQo+IA0KPiA+IFNpZ25lZC1vZmYtYnk6
IEppdGFvIFNoaSA8aml0YW8uc2hpQG1lZGlhdGVrLmNvbT4NCj4gPiAtLS0NCj4gPiAgaW5jbHVk
ZS9kcm0vZHJtX21pcGlfZHNpLmggfCAyICsrDQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2Vy
dGlvbnMoKykNCj4gPiANCj4gPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vZHJtX21pcGlfZHNp
LmgNCj4gPiBiL2luY2x1ZGUvZHJtL2RybV9taXBpX2RzaS5oDQo+ID4gaW5kZXggYWY3YmE4MDcx
ZWIwLi44ZTg1NjM3OTI2ODIgMTAwNjQ0DQo+ID4gLS0tIGEvaW5jbHVkZS9kcm0vZHJtX21pcGlf
ZHNpLmgNCj4gPiArKysgYi9pbmNsdWRlL2RybS9kcm1fbWlwaV9kc2kuaA0KPiA+IEBAIC0xNzcs
NiArMTc3LDcgQEAgc3RydWN0IG1pcGlfZHNpX2RldmljZV9pbmZvIHsNCj4gPiAgICogQGxwX3Jh
dGU6IG1heGltdW0gbGFuZSBmcmVxdWVuY3kgZm9yIGxvdyBwb3dlciBtb2RlIGluIGhlcnR6LA0K
PiA+IHRoaXMgc2hvdWxkDQo+ID4gICAqIGJlIHNldCB0byB0aGUgcmVhbCBsaW1pdHMgb2YgdGhl
IGhhcmR3YXJlLCB6ZXJvIGlzIG9ubHkNCj4gPiBhY2NlcHRlZCBmb3INCj4gPiAgICogbGVnYWN5
IGRyaXZlcnMNCj4gPiArICogQGhzX3BhY2tldF9lbmRfYWxpZ25lZDogdHJhbnNmZXIgZHNpIGhz
IHBhY2tldCBlbmRpbmcgYWxpZ25lZA0KPiA+ICAgKi8NCj4gPiAgc3RydWN0IG1pcGlfZHNpX2Rl
dmljZSB7DQo+ID4gICAgICAgICBzdHJ1Y3QgbWlwaV9kc2lfaG9zdCAqaG9zdDsNCj4gPiBAQCAt
MTg5LDYgKzE5MCw3IEBAIHN0cnVjdCBtaXBpX2RzaV9kZXZpY2Ugew0KPiA+ICAgICAgICAgdW5z
aWduZWQgbG9uZyBtb2RlX2ZsYWdzOw0KPiA+ICAgICAgICAgdW5zaWduZWQgbG9uZyBoc19yYXRl
Ow0KPiA+ICAgICAgICAgdW5zaWduZWQgbG9uZyBscF9yYXRlOw0KPiA+ICsgICAgICAgYm9vbCBo
c19wYWNrZXRfZW5kX2FsaWduZWQ7DQo+ID4gIH07DQo+ID4gDQo+ID4gICNkZWZpbmUgTUlQSV9E
U0lfTU9EVUxFX1BSRUZJWCAibWlwaS1kc2k6Ig0KPiA+IC0tDQo+ID4gMi4yNS4xDQpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBt
YWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
