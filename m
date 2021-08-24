Return-Path: <SRS0=VOwE=NP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81610C4338F
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Aug 2021 16:12:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 363DA61212
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Aug 2021 16:12:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 363DA61212
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f9NauktcZjHyII+hxcWNGtDXCfRwelV6s6FTzMf0IYc=; b=cQqiuyhZOxxRlo
	dviC660yiR2BP99TWdOfwqNNPD5BbYNpu2g+GkdZXk/mlo/9TnMMrRcqhA5yO/PTchccnnP+U4Ycl
	7Dg+d4AFrGm0sVemO+XR92VQniGCxlmsHUD/1MusJteAF0qucaReGKVep8y6Cgl8Rn+XekAC24p/M
	cK5nYHEsV3jicRnNzFoWY35gBfocYRttLsoxikg82sdfboKlzrLujgIDFAYUoK0FhRyN7kbNBebO8
	Pbwgvo2MM5wd10smNtIeFWskhHPlxokI/nCEcEjqLlgTse3f99tyEMmnxXqABO/s6jrDLzreOChdh
	Yg7qHo19MYwzLIicwxYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mIZ2L-003rjm-Tc; Tue, 24 Aug 2021 16:12:29 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mIZ24-003red-KR; Tue, 24 Aug 2021 16:12:16 +0000
X-UUID: 227dbec842654aec9dfa876192bc19ea-20210824
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=fXPeBG+Nlv1CxWMjRr0CGuhcto0PIpsee/0QVL+xfBI=; 
 b=dZUXunRnFlIvYXdi8bsOnsDeKWOBgwb3/End16r7oial3OT3kATkKFqOaa7mjkUeS8R/vuOysRTUbk9mdCYUinnWsL86Se3FQ2ZLxWh1ZfOxxYmGBFBNf6dyE8y3nYxoJlMW6enP5kDVzDRRYm6cNPFX7EBh6lg3DnKfaWPLN18=;
X-UUID: 227dbec842654aec9dfa876192bc19ea-20210824
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <jason-jh.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 699369066; Tue, 24 Aug 2021 09:11:54 -0700
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 24 Aug 2021 09:11:52 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 25 Aug 2021 00:11:51 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 25 Aug 2021 00:11:50 +0800
Message-ID: <2ca1c446d01a20cc60010b1069056724bc921faf.camel@mediatek.com>
Subject: Re: [PATCH v8 01/13] dt-bindings: arm: mediatek: mmsys: add mt8195
 SoC binding
From: Jason-JH Lin <jason-jh.lin@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
CC: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, <fshao@chromium.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, Enric Balletbo i Serra
 <enric.balletbo@collabora.com>, David Airlie <airlied@linux.ie>, "Daniel
 Vetter" <daniel@ffwll.ch>, Fabien Parent <fparent@baylibre.com>, "Hsin-Yi
 Wang" <hsinyi@chromium.org>, Yongqiang Niu <yongqiang.niu@mediatek.com>,
 Jitao shi <jitao.shi@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 <singo.chang@mediatek.com>, DTML <devicetree@vger.kernel.org>, Linux ARM
 <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>, linux-kernel
 <linux-kernel@vger.kernel.org>, DRI Development
 <dri-devel@lists.freedesktop.org>
Date: Wed, 25 Aug 2021 00:11:50 +0800
In-Reply-To: <CAAOTY_9Yug-9S4uBkNLTJH+TU8dHCeOjLuwXdNMJ+R89qJyJ9Q@mail.gmail.com>
References: <20210819022327.13040-1-jason-jh.lin@mediatek.com>
 <20210819022327.13040-2-jason-jh.lin@mediatek.com>
 <CAAOTY_9Yug-9S4uBkNLTJH+TU8dHCeOjLuwXdNMJ+R89qJyJ9Q@mail.gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210824_091212_733322_9946C772 
X-CRM114-Status: GOOD (  22.33  )
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

SGkgQ2h1bi1LdWFuZywNCg0KVGhhbmtzIGZvciB0aGUgcmV2aWV3Lg0KDQpPbiBUaHUsIDIwMjEt
MDgtMTkgYXQgMjM6MDAgKzA4MDAsIENodW4tS3VhbmcgSHUgd3JvdGU6DQo+IEhpLCBKYXNvbjoN
Cj4gDQo+IGphc29uLWpoLmxpbiA8amFzb24tamgubGluQG1lZGlhdGVrLmNvbT4g5pa8IDIwMjHl
ubQ45pyIMTnml6Ug6YCx5ZubIOS4iuWNiDEwOjIz5a+r6YGT77yaDQo+ID4gDQo+ID4gMS4gVGhl
cmUgYXJlIDIgbW1zeXMsIG5hbWVseSB2ZG9zeXMwIGFuZCB2ZG9zeXMxIGluIG10ODE5NS4NCj4g
PiAgICBFYWNoIG9mIHRoZW0gaXMgYm91bmQgdG8gYSBkaXNwbGF5IHBpcGVsaW5lLCBzbyBhZGQg
dGhlaXINCj4gPiAgICBkZWZpbml0aW9uIGluIG10ay1tbXN5cyBkb2N1bWVudGF0aW9uIHdpdGgg
MiBjb21wYXRpYmxlcy4NCj4gPiANCj4gPiAyLiBBZGQgZGVzY3JpcHRpb24gZm9yIHBvd2VyLWRv
bWFpbiBwcm9wZXJ0eS4NCj4gPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBqYXNvbi1qaC5saW4gPGph
c29uLWpoLmxpbkBtZWRpYXRlay5jb20+DQo+ID4gLS0tDQo+ID4gdGhpcyBwYXRjaCBpcyBiYXNl
IG9uIFsxXVsyXQ0KPiA+IA0KPiA+IFsxXSBkdC1iaW5kaW5nczogYXJtOiBtZWRpYXRlazogbW1z
eXM6IGNvbnZlcnQgdG8gWUFNTCBmb3JtYXQNCj4gPiAtIA0KPiA+IGh0dHBzOi8vdXJsZGVmZW5z
ZS5jb20vdjMvX19odHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3Byb2plY3QvbGludXgtbWVk
aWF0ZWsvcGF0Y2gvMjAyMTA1MTkxNjE4NDcuMzc0NzM1Mi0xLWZwYXJlbnRAYmF5bGlicmUuY29t
L19fOyEhQ1RSTktBOXdNZzBBUmJ3IXc4bzVibW9pTGU5MmpMVDEtX2xWXzBxOW1sY3ZJT2NBQ1Vv
VEktVmphVnYzdEd0S3I0MTRBUXlEbmYxeXdpdnc5QkhKJA0KPiA+ICANCj4gPiBbMl0gZHQtYmlu
ZGluZ3M6IGFybTogbWVkaWF0ZWs6IG1tc3lzOiBhZGQgTVQ4MzY1IFNvQyBiaW5kaW5nDQo+ID4g
LSANCj4gPiBodHRwczovL3VybGRlZmVuc2UuY29tL3YzL19faHR0cHM6Ly9wYXRjaHdvcmsua2Vy
bmVsLm9yZy9wcm9qZWN0L2xpbnV4LW1lZGlhdGVrL3BhdGNoLzIwMjEwNTE5MTYxODQ3LjM3NDcz
NTItMi1mcGFyZW50QGJheWxpYnJlLmNvbS9fXzshIUNUUk5LQTl3TWcwQVJidyF3OG81Ym1vaUxl
OTJqTFQxLV9sVl8wcTltbGN2SU9jQUNVb1RJLVZqYVZ2M3RHdEtyNDE0QVF5RG5mMXl3bU5GNzlK
WiQNCj4gPiAgDQo+ID4gLS0tDQo+ID4gIC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9tZWRp
YXRlay9tZWRpYXRlayxtbXN5cy55YW1sICB8IDgNCj4gPiArKysrKysrKw0KPiA+ICAxIGZpbGUg
Y2hhbmdlZCwgOCBpbnNlcnRpb25zKCspDQo+ID4gDQo+ID4gZGlmZiAtLWdpdA0KPiA+IGEvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9tZWRpYXRlay9tZWRpYXRlayxtbXN5
cy55YW0NCj4gPiBsDQo+ID4gYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvYXJt
L21lZGlhdGVrL21lZGlhdGVrLG1tc3lzLnlhbQ0KPiA+IGwNCj4gPiBpbmRleCAyZDRmZjBjZTM4
N2IuLjY4Y2IzMzBkNzU5NSAxMDA2NDQNCj4gPiAtLS0NCj4gPiBhL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9hcm0vbWVkaWF0ZWsvbWVkaWF0ZWssbW1zeXMueWFtDQo+ID4gbA0K
PiA+ICsrKw0KPiA+IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9tZWRp
YXRlay9tZWRpYXRlayxtbXN5cy55YW0NCj4gPiBsDQo+ID4gQEAgLTMwLDYgKzMwLDggQEAgcHJv
cGVydGllczoNCj4gPiAgICAgICAgICAgICAgICAtIG1lZGlhdGVrLG10ODE3My1tbXN5cw0KPiA+
ICAgICAgICAgICAgICAgIC0gbWVkaWF0ZWssbXQ4MTgzLW1tc3lzDQo+ID4gICAgICAgICAgICAg
ICAgLSBtZWRpYXRlayxtdDgzNjUtbW1zeXMNCj4gPiArICAgICAgICAgICAgICAtIG1lZGlhdGVr
LG10ODE5NS12ZG9zeXMwDQo+ID4gKyAgICAgICAgICAgICAgLSBtZWRpYXRlayxtdDgxOTUtdmRv
c3lzMQ0KPiA+ICAgICAgICAgICAgLSBjb25zdDogc3lzY29uDQo+ID4gICAgICAgIC0gaXRlbXM6
DQo+ID4gICAgICAgICAgICAtIGNvbnN0OiBtZWRpYXRlayxtdDc2MjMtbW1zeXMNCj4gPiBAQCAt
MzksNiArNDEsMTIgQEAgcHJvcGVydGllczoNCj4gPiAgICByZWc6DQo+ID4gICAgICBtYXhJdGVt
czogMQ0KPiA+IA0KPiA+ICsgIHBvd2VyLWRvbWFpbnM6DQo+ID4gKyAgICBkZXNjcmlwdGlvbjoN
Cj4gPiArICAgICAgQSBwaGFuZGxlIGFuZCBQTSBkb21haW4gc3BlY2lmaWVyIGFzIGRlZmluZWQg
YnkgYmluZGluZ3MNCj4gPiArICAgICAgb2YgdGhlIHBvd2VyIGNvbnRyb2xsZXIgc3BlY2lmaWVk
IGJ5IHBoYW5kbGUuIFNlZQ0KPiA+ICsgICAgICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvcG93ZXIvcG93ZXItZG9tYWluLnlhbWwNCj4gPiBmb3IgZGV0YWlscy4NCj4gPiArDQo+
IA0KPiBUaGlzIHBhdGNoIGlzIGFib3V0IG10ODE5NSwgYnV0IG10ODE3MyBtbXN5cyBhbHNvIGhh
cyBwb3dlciBkb21haW4uDQo+IFNvDQo+IG1vdmUgdGhpcyBwYXJ0IHRvIGFub3RoZXIgcGF0Y2gu
DQo+IA0KPiBSZWdhcmRzLA0KPiBDaHVuLUt1YW5nLg0KPiANCk9LLCBJJ2xsIG1vdmUgdGhpcyBw
YXJ0IHRvIGFub3RoZXIgcGF0Y2guDQoNClJlZ2FyZHMsDQpKYXNvbi1KSC5MaW4NCg0KPiANCj4g
PiAgICAiI2Nsb2NrLWNlbGxzIjoNCj4gPiAgICAgIGNvbnN0OiAxDQo+ID4gDQo+ID4gLS0NCj4g
PiAyLjE4LjANCj4gPiANCi0tIA0KSmFzb24tSkggTGluIDxqYXNvbi1qaC5saW5AbWVkaWF0ZWsu
Y29tPg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRp
YXRlawo=
