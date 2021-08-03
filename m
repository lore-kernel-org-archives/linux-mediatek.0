Return-Path: <SRS0=vV1m=M2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 678C1C4338F
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Aug 2021 16:22:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2345D61029
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Aug 2021 16:22:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2345D61029
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vEsvsFnvafx2JI6GzX/Qz6ISb98Y4Ki49SpBZpCSDvs=; b=SYnSLIWF3DXU/C
	LSTkQYU/WH9soBbsf5T71N2n3XvPiGGNFXjN4Q3j4dXbN8MUbjitjfwPNuwqjK1qMObzBdE+fzf7g
	fQY5jImo1lh43hEPJfmyhZJZcdmqPC6fl/jjbcbrqTaHrCzxUodk2h5SzAmxJqGQ2IYwiFyQlrMUc
	V+xpZGNSL18ibEzOXZA75mf3HTLdrtexGGuryxHIUn8odS9Dap3oghoG7Tv4HA5CjEOMpqqvsm5+V
	cFeNfPBDoeE2A4u9TIQhRyj2DcPZkwlwOsm780VSAe0KMD6myTpFpFYo+BgTekdj0HRDkqQfQD7XK
	yRUwRiCU+zTwzXCauhWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mAxAu-003aF7-6C; Tue, 03 Aug 2021 16:21:52 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mAxAg-003aBw-Uz; Tue, 03 Aug 2021 16:21:40 +0000
X-UUID: dfffe12cac534d51a8411e9b496a0f9f-20210803
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=PQvNGawBaUGH/ESbR10yTDKg08E6F+lDTbg2rOp8l1A=; 
 b=fbl0+dJ/s9GPf8MfWWpmn6XCW+4CNbkC0Y8tJoUyuuETIT5mn8ueNjAbAgEfi6ACN52NCuM2+aKm1bSKzArg6/hiMh/S5qsm/JPveoXWkK8zYBlPtaUxawjysZufxrPlTEeSE+QW0minYixcbEDBYUThc9HjIHTiUvULTl49two=;
X-UUID: dfffe12cac534d51a8411e9b496a0f9f-20210803
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <jason-jh.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 367159034; Tue, 03 Aug 2021 09:21:37 -0700
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 3 Aug 2021 09:11:34 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 4 Aug 2021 00:11:33 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 4 Aug 2021 00:11:33 +0800
Message-ID: <134fedc082a5d698f2f3a2143c0ce8757f3aaf0c.camel@mediatek.com>
Subject: Re: [PATCH v5 1/6] arm64: dts: mt8195: add display node for vdosys0
From: Jason-JH Lin <jason-jh.lin@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
CC: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, "Enric
 Balletbo i Serra" <enric.balletbo@collabora.com>, <fshao@chromium.org>, David
 Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, "Hsin-Yi Wang"
 <hsinyi@chromium.org>, Yongqiang Niu <yongqiang.niu@mediatek.com>, Nancy Lin
 <nancy.lin@mediatek.com>, <singo.chang@mediatek.com>, DTML
 <devicetree@vger.kernel.org>, Linux ARM
 <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>, linux-kernel
 <linux-kernel@vger.kernel.org>, DRI Development
 <dri-devel@lists.freedesktop.org>
Date: Wed, 4 Aug 2021 00:11:33 +0800
In-Reply-To: <CAAOTY_9sasTb=W3Kkhx-UZ-ATSe_ge8A14pmOHFCOQjag89r0Q@mail.gmail.com>
References: <20210729170737.21424-1-jason-jh.lin@mediatek.com>
 <20210729170737.21424-2-jason-jh.lin@mediatek.com>
 <CAAOTY_9sasTb=W3Kkhx-UZ-ATSe_ge8A14pmOHFCOQjag89r0Q@mail.gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210803_092139_034488_20A651C0 
X-CRM114-Status: GOOD (  20.71  )
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

SGkgQ0ssDQoNCk9uIFN1biwgMjAyMS0wOC0wMSBhdCAwODozNiArMDgwMCwgQ2h1bi1LdWFuZyBI
dSB3cm90ZToNCj4gSGksIEphc29uOg0KPiANCj4gamFzb24tamgubGluIDxqYXNvbi1qaC5saW5A
bWVkaWF0ZWsuY29tPiDmlrwgMjAyMeW5tDfmnIgzMOaXpSDpgLHkupQg5LiK5Y2IMTowN+Wvq+mB
k++8mg0KPiA+IA0KPiA+IEFkZCBkaXNwbGF5IG5vZGUgZm9yIHZkb3N5czAuDQo+ID4gDQo+ID4g
U2lnbmVkLW9mZi1ieTogamFzb24tamgubGluIDxqYXNvbi1qaC5saW5AbWVkaWF0ZWsuY29tPg0K
PiA+IC0tLQ0KPiA+IFRoaXMgcGF0Y2ggaXMgYmFzZWQgb24gWzFdWzJdWzNdWzRdDQo+ID4gDQo+
ID4gWzFdYXJtNjQ6IGR0czogQWRkIE1lZGlhdGVrIFNvQyBNVDgxOTUgYW5kIGV2YWx1YXRpb24g
Ym9hcmQgZHRzIGFuZA0KPiA+IE1ha2VmaWxlDQo+ID4gLSANCj4gPiBodHRwczovL3VybGRlZmVu
c2UuY29tL3YzL19faHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L2xpbnV4LW1l
ZGlhdGVrL3BhdGNoLzIwMjEwNjAxMDc1MzUwLjMxNTE1LTItc2VpeWEud2FuZ0BtZWRpYXRlay5j
b20vX187ISFDVFJOS0E5d01nMEFSYnchM2JqZmpHZjJHWUo1RlE1RVdzakc5eVBHd2Y2dVZNdjhk
RHlYTFkyVGxxX3NUY3plSUprRURUV1Z0MWR4cDRiN3RvamokDQo+ID4gIA0KPiA+IFsyXWFybTY0
OiBkdHM6IG10ODE5NTogYWRkIElPTU1VIGFuZCBzbWkgbm9kZXMNCj4gPiAtIA0KPiA+IGh0dHBz
Oi8vdXJsZGVmZW5zZS5jb20vdjMvX19odHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3Byb2pl
Y3QvbGludXgtbWVkaWF0ZWsvcGF0Y2gvMjAyMTA2MTUxNzMyMzMuMjY2ODItMTUtdGluZ2hhbi5z
aGVuQG1lZGlhdGVrLmNvbS9fXzshIUNUUk5LQTl3TWcwQVJidyEzYmpmakdmMkdZSjVGUTVFV3Nq
Rzl5UEd3ZjZ1Vk12OGREeVhMWTJUbHFfc1RjemVJSmtFRFRXVnQxZHhwMHNmWFBjLSQNCj4gPiAg
DQo+ID4gWzNdYXJtNjQ6IGR0czogbXQ4MTk1OiBhZGQgZ2NlIG5vZGUNCj4gPiAtIA0KPiA+IGh0
dHBzOi8vdXJsZGVmZW5zZS5jb20vdjMvX19odHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3By
b2plY3QvbGludXgtbWVkaWF0ZWsvcGF0Y2gvMjAyMTA3MDUwNTM0MjkuNDM4MC00LWphc29uLWpo
LmxpbkBtZWRpYXRlay5jb20vX187ISFDVFJOS0E5d01nMEFSYnchM2JqZmpHZjJHWUo1RlE1RVdz
akc5eVBHd2Y2dVZNdjhkRHlYTFkyVGxxX3NUY3plSUprRURUV1Z0MWR4cDV1dzZjcUIkDQo+ID4g
IA0KPiA+IFs0XWFkZCBtdDgxOTUgU29DIERSTSBiaW5kaW5nDQo+ID4gLSANCj4gPiBodHRwczov
L3VybGRlZmVuc2UuY29tL3YzL19faHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0
L2xpbnV4LW1lZGlhdGVrL2xpc3QvP3Nlcmllcz01MTk1OTdfXzshIUNUUk5LQTl3TWcwQVJidyEz
YmpmakdmMkdZSjVGUTVFV3NqRzl5UEd3ZjZ1Vk12OGREeVhMWTJUbHFfc1RjemVJSmtFRFRXVnQx
ZHhwMHFuMWltUiQNCj4gPiAgDQo+ID4gLS0tDQo+ID4gIGFyY2gvYXJtNjQvYm9vdC9kdHMvbWVk
aWF0ZWsvbXQ4MTk1LmR0c2kgfCAxMTINCj4gPiArKysrKysrKysrKysrKysrKysrKysrKw0KPiA+
ICAxIGZpbGUgY2hhbmdlZCwgMTEyIGluc2VydGlvbnMoKykNCj4gPiANCj4gPiBkaWZmIC0tZ2l0
IGEvYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDgxOTUuZHRzaQ0KPiA+IGIvYXJjaC9h
cm02NC9ib290L2R0cy9tZWRpYXRlay9tdDgxOTUuZHRzaQ0KPiA+IGluZGV4IDA0ZDNlOTUxNzVm
YS4uNGZhNDdjYjJiZWRlIDEwMDY0NA0KPiA+IC0tLSBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvbWVk
aWF0ZWsvbXQ4MTk1LmR0c2kNCj4gPiArKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVr
L210ODE5NS5kdHNpDQo+ID4gQEAgLTExNTUsOSArMTE1NSwxMjEgQEANCj4gPiAgICAgICAgICAg
ICAgICAgICAgICAgICAjY2xvY2stY2VsbHMgPSA8MT47DQo+ID4gICAgICAgICAgICAgICAgIH07
DQo+ID4gDQo+IA0KPiBbc25pcF0NCj4gDQo+ID4gKw0KPiA+ICsgICAgICAgICAgICAgICBtZXJn
ZTA6IGRpc3BfdnBwX21lcmdlMEAxYzAxNDAwMCB7DQo+ID4gKyAgICAgICAgICAgICAgICAgICAg
ICAgY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDgxOTUtZGlzcC1tZXJnZSI7DQo+ID4gKyAgICAg
ICAgICAgICAgICAgICAgICAgcmVnID0gPDAgMHgxYzAxNDAwMCAwIDB4MTAwMD47DQo+ID4gKyAg
ICAgICAgICAgICAgICAgICAgICAgaW50ZXJydXB0cyA9IDxHSUNfU1BJIDY1Ng0KPiA+IElSUV9U
WVBFX0xFVkVMX0hJR0ggMD47DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgcG93ZXItZG9t
YWlucyA9IDwmc3BtDQo+ID4gTVQ4MTk1X1BPV0VSX0RPTUFJTl9WRE9TWVMwPjsNCj4gPiArICAg
ICAgICAgICAgICAgICAgICAgICBjbG9ja3MgPSA8JnZkb3N5czAgQ0xLX1ZETzBfVlBQX01FUkdF
MD47DQo+IA0KPiBXaHkgdGhpcyBtZXJnZSBoYXMgbm8gYXN5bmMgY2xvY2s/DQo+IA0KPiBSZWdh
cmRzLA0KPiBDaHVuLUt1YW5nLg0KPiANCk9ubHkgdGhlIE1FUkdFIGxpbmtlZCB0byB0aGUgZGlz
cGxheSBmdW5jdGlvbiBibG9jayB0aGF0IGlzIGNyb3NzDQp2ZG9zeXMwIHRvIHZkb3N5czEgbmVl
ZCB0byBhZGQgYXN5bmMgY2xvY2suDQoNCkknbGwgYWRkIHRoaXMgZGVzY3JpcHRpb24gaW50byB0
aGlzIHBhdGNoIFsxXQ0KWzFdIA0KaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0
L2xpbnV4LW1lZGlhdGVrL3BhdGNoLzIwMjEwNzI5MTU0OTEyLjIwMDUxLTQtamFzb24tamgubGlu
QG1lZGlhdGVrLmNvbS8NCg0KUmVnYXJkcywNCkphc29uLUpILkxpbg0KDQo+ID4gKyAgICAgICAg
ICAgICAgICAgICAgICAgbWVkaWF0ZWssZ2NlLWNsaWVudC1yZWcgPQ0KPiA+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIDwmZ2NlMSBTVUJTWVNfMWMwMVhYWFggMHg0MDAwDQo+ID4g
MHgxMDAwPjsNCj4gPiArICAgICAgICAgICAgICAgfTsNCj4gPiArDQotLSANCkphc29uLUpIIExp
biA8amFzb24tamgubGluQG1lZGlhdGVrLmNvbT4NCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1t
ZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
