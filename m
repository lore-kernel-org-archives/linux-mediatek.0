Return-Path: <SRS0=u2zk=MW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0AF3C4338F
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Jul 2021 06:12:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9374560F4B
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Jul 2021 06:12:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9374560F4B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f2UAkhqTzszxNt8fzObw2h7aimKacSb4MKpMJUVS+fY=; b=InwbZUfhaYppCa
	TOrq2ExQb66FugpSEEc83ki5N2OBCaFhH97a5oBoOuRZ6f6nHugkBc6h9X75DozZB8hTigvuRmBU5
	24rL66E5K+3rMBSs0o2Gd7Pw8A46AFQJ15AQ0EPXI4DAwhEnuiVlTTSVS52CTawbcIqMY0sW8V0iM
	6sgJ5Uel11qi1Dk9e5Q73GIewMDWdiOnx8WxVyrtHDM4YTRYLqDc5gRTctF/Eg+C/CwVzTQ/QQqCs
	VXY5V54tJL1rYZ1WgK0m0VQ8QUk1aQpTLOWdU60povLgs4nboRX59+u+FtzeHqTqY/PX9dxsRhosC
	QqL7Ik+pSeGIIkbNeVhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m9LkT-007Odt-41; Fri, 30 Jul 2021 06:11:57 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m9Lk6-007OSl-FA; Fri, 30 Jul 2021 06:11:38 +0000
X-UUID: abcd23c413f94d6b94b9cb53c1cb2133-20210729
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=qN+SSS+RDr3jspXwlX0b2sqOdjALlK8YN/RxXhX+HtU=; 
 b=FqaqDrcQFzEx5REvKAm7b9hTEShvtzo9cW9gSaRUQnBxq93cGvznhHJfb2JYOBm/N0KRtjLR38yZxYJj+ITW34n8+BfXjmc1wl0lPgG50Do/d9OreQrNp8yQ/IngtsFCr+5CnHdL5X+yDCYv1U8KiIfPx5ib9/yO58zet5neimk=;
X-UUID: abcd23c413f94d6b94b9cb53c1cb2133-20210729
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <sam.shih@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 526903520; Thu, 29 Jul 2021 23:11:30 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 29 Jul 2021 23:01:28 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 30 Jul 2021 14:01:14 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 30 Jul 2021 14:01:14 +0800
Message-ID: <083a0e8fdd07c0f940285dce2dc26cb0f5e798a6.camel@mediatek.com>
Subject: Re: [PATCH 01/12] dt-bindings: clock: mediatek: document clk
 bindings for mediatek mt7986 SoC
From: Sam Shih <sam.shih@mediatek.com>
To: Chen-Yu Tsai <wenst@chromium.org>
CC: Rob Herring <robh+dt@kernel.org>, Sean Wang <sean.wang@kernel.org>, "Linus
 Walleij" <linus.walleij@linaro.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Matt Mackall <mpm@selenic.com>, Herbert Xu
 <herbert@gondor.apana.org.au>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Hsin-Yi Wang
 <hsinyi@chromium.org>, Enric Balletbo i Serra <enric.balletbo@collabora.com>, 
 Fabien Parent <fparent@baylibre.com>, Seiya Wang <seiya.wang@mediatek.com>,
 Devicetree List <devicetree@vger.kernel.org>, LKML
 <linux-kernel@vger.kernel.org>, "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>, <linux-gpio@vger.kernel.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, <linux-crypto@vger.kernel.org>,
 <linux-serial@vger.kernel.org>, <linux-watchdog@vger.kernel.org>,
 <linux-clk@vger.kernel.org>, John Crispin <john@phrozen.org>, Ryder Lee
 <Ryder.Lee@mediatek.com>
Date: Fri, 30 Jul 2021 14:01:14 +0800
In-Reply-To: <CAGXv+5GeEBAkXKfA=S7XGOLYtCRihP5ov6kSiw+eevPAi74GAQ@mail.gmail.com>
References: <20210726071439.14248-1-sam.shih@mediatek.com>
 <20210726071439.14248-2-sam.shih@mediatek.com>
 <CAGXv+5GeEBAkXKfA=S7XGOLYtCRihP5ov6kSiw+eevPAi74GAQ@mail.gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210729_231136_001678_2E6F66A6 
X-CRM114-Status: GOOD (  28.02  )
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

SGksDQoNCk9uIE1vbiwgMjAyMS0wNy0yNiBhdCAxNzoyMCArMDgwMCwgQ2hlbi1ZdSBUc2FpIHdy
b3RlOg0KPiBGdXJ0aGVybW9yZSwgYmFzZWQgb24gdGhlIGRyaXZlciBwYXRjaCBhbmQgdGhlIGZh
Y3QgdGhhdCB0aGV5IHNoYXJlDQo+IHRoZQ0KPiBzYW1lIGNvbXBhdGlibGUgc3RyaW5nLCBpdCBz
ZWVtcyB5b3Ugc2hvdWxkbid0IG5lZWQgdG8gaGF2ZSB0d28NCj4gY29tcGF0aWJsZQ0KPiBzdHJp
bmdzIGZvciB0d28gaWRlbnRpY2FsIGhhcmR3YXJlIGJsb2Nrcy4gVGhlIG5lZWQgZm9yIHNlcGFy
YXRlDQo+IGVudHJpZXMNCj4gdG8gaGF2ZSBkaWZmZXJlbnQgY2xvY2sgbmFtZXMgaXMgYW4gaW1w
bGVtZW50YXRpb24gZGV0YWlsLiBQbGVhc2UNCj4gY29uc2lkZXINCj4gdXNpbmcgYW5kIHN1cHBv
cnRpbmcgY2xvY2stb3V0cHV0LW5hbWVzLg0KPiANCj4gQWxzbywgcGxlYXNlIGNoZWNrIG91dCB0
aGUgTVQ4MTk1IGNsb2NrIGRyaXZlciBzZXJpZXMgWzFdLiBJJ20NCj4gZ3Vlc3NpbmcNCj4gYSBs
b3Qgb2YgdGhlIGNvbW1lbnRzIGFwcGx5IHRvIHRoaXMgb25lIGFzIHdlbGwuDQo+IA0KPiBSZWdh
cmRzDQo+IENoZW5ZdQ0KPiANCj4gWzFdIA0KPiBodHRwczovL3VybGRlZmVuc2UuY29tL3YzL19f
aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtbWVkaWF0ZWsvMjAyMTA2MTYyMjQ3NDMuNTEw
OS0xLWNodW4tamllLmNoZW5AbWVkaWF0ZWsuY29tL1QvKnRfXztJdyEhQ1RSTktBOXdNZzBBUmJ3
ITI5cGI0VEppR0hMdkxiWUpnREIyRGhmOE1wdzVWVTh6Vi1XM05yTWFuX1JQUXJ0V1QyRWRSVHl5
aldwdTBuWkUkDQo+ICANCj4gDQoNCkkgaGF2ZSBvcmdhbml6ZWQgeW91ciBjb21tZW50cyBpbiAi
TWVkaWF0ZWsgTVQ4MTk1IGNsb2NrIHN1cHBvcnQiDQpzZXJpZXMgaW50byB0aGUgZm9sbG93aW5n
IGxpc3QsIHJlcGx5IHRvIHlvdXIgaGVyZToNCg0KPiBkdC1iaW5kaW5nOiBNb3ZlIHRoZSBub3Qt
dG8tYmUtZXhwb3NlZCBjbG9jayB0byBkcml2ZXIgZGlyZWN0b3J5IG9yDQo+IHNpbXBseSBsZWZ0
IG91dA0KT2theSwgdGhhbmtzIGZvciB5b3VyIGNvbW1lbnQsIEkgd2lsbCB1cGRhdGUgdGhpcyBp
biB0aGUgbmV4dCBwYXRjaCBzZXQNCg0KPiBkZXNjcmliZSBzb21lIG9mIHRoZSBjbG9jayByZWxh
dGlvbnMgYmV0d2VlbiB0aGUgdmFyaW91cyBjbG9jaw0KPiBjb250cm9sbGVycw0KSSBoYXZlIGNo
ZWNrZWQgdGhlIGZpbGVzIGluDQoiRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Fy
bS9tZWRpYXRlayIsIEl0IHNlZW1zIHRoYXQgYWxsDQpNZWRpYVRlayBTb0MgY2xvY2tzIGFyZSBz
aW1wbHkgZGVzY3JpYmVkIGJ5IGVhY2ggY29udHJvbGxlciwgbGlrZQ0KIm1lZGlhdGVrLGluZnJh
Y2ZnLnR4dCIgYW5kICJtZWRpYXRlayx0b3Bja2dlbi50eHQiLCBhbmQgdGhvc2UgZG9jdW1lbnQN
Cm9ubHkgaW5jbHVkZSBjb21wYXRpYmxlIHN0cmluZ3MgaW5mb3JtYXRpb24gYW5kIGV4YW1wbGVz
Lg0KQ2FuIHdlIGluc2VydCB0aGUgY2xvY2sgcmVsYXRpb25zaGlwIG9mIE1UNzk4NiBkaXJlY3Rs
bHkgaW4gY29tbW9uDQpkb2N1bWVudHM/DQpPciB3ZSBzaG91bGQgYWRkIGEgbmV3ICJtZWRpYXRl
ayxtdDc5ODYtY2xvY2sueWFtbCIgYW5kIG1vdmUgY29tcGF0aWJsZQ0Kc3RyaW5ncyBpbmZvcm1h
dGlvbiBhbmQgZXhhbXBsZSB0byB0aGlzIGZpbGUsIGFuZCBpbnNlcnQgY2xvY2sNCnJlbGF0aW9u
c2hpcCBkZXNjcmlwdGlvbnMgdG8gdGhpcyBmaWxlPyBXb3VsZG7igJl0IGl0IGJlIHN0cmFuZ2Ug
dG8gc2tpcA0KZXhpc3RpbmcgZmlsZXMgYW5kIGNyZWF0ZSBhIG5ldyBvbmU/DQoNCj4gZXh0ZXJu
YWwgb3NjaWxsYXRvcidzIGNhc2UsIHRoZSBvc2NpbGxhdG9yIGlzIGRlc2NyaWJlZCBpbiB0aGUg
ZGV2aWNlDQo+IHRyZWUNClllcywgd2UgaGF2ZSAiY2xreHRhbCIgaW4gdGhlIERULCB3aGljaCBz
dGFuZHMgZm9yIGV4dGVybmFsIG9zY2lsbGF0b3IsDQpBbGwgY2xvY2tzIGluIGFwbWl4ZWRzeXMg
dXNlICJjbGt4dGFsIiBhcyB0aGUgcGFyZW50IGNsb2NrDQoNCj4gRHVhbCBsaWNlbnNlIHBsZWFz
ZSAoYW5kIHRoZSBkdHMgZmlsZXMpLg0KT2theSwgdGhhbmtzIGZvciB5b3VyIGNvbW1lbnQsIEkg
d2lsbCB1cGRhdGUgdGhpcyBpbiB0aGUgbmV4dCBwYXRjaCBzZXQNCg0KPiBXaHkgYXJlIHRoaXMg
YW5kIG90aGVyIDE6MSBmYWN0b3IgY2xrcyBuZWVkZWQ/IFRoZXkgbG9vayBsaWtlDQo+IHBsYWNl
aG9sZGVycy4gUGxlYXNlIHJlbW92ZSB0aGVtLg0KT2theSwgdGhhbmtzIGZvciB5b3VyIGNvbW1l
bnQsIEkgd2lsbCB1cGRhdGUgdGhpcyBpbiB0aGUgbmV4dCBwYXRjaCBzZXQNCg0KPiBNZXJnZSBk
dXBsaWNhdGUgcGFyZW50IGluc3RhbmNlcw0KV2UgaGF2ZSBjb25zaWRlcmVkIHRoaXMgaW4gdGhl
IE1UNzk4NiBiYXNpYyBjbG9jayBkcml2ZXIsIGJ1dCBJIHdpbGwNCmNoZWNrIGFnYWluLiBJZiBj
b3JyZWN0aW9ucyBhcmUgbmVlZGVkLCBJIHdpbGwgbWFrZSBjaGFuZ2VzIGluIHRoZSBuZXh0DQpw
YXRjaCBzZXQuDQoNCj4gTGVha2luZyBjbGtfZGF0YSBpZiBzb21lIGZ1bmN0aW9uIHJldHVybiBm
YWlsDQpPa2F5LCB0aGFua3MgZm9yIHlvdXIgY29tbWVudCwgSSB3aWxsIHVwZGF0ZSB0aGlzIGlu
IHRoZSBuZXh0IHBhdGNoIHNldA0KDQo+IFRoaXMgZmlsZSBjb250YWlucyBmb3VyIGRyaXZlcnMu
IFRoZXkgZG8gbm90IGhhdmUgZGVwZW5kIG9uIGVhY2gNCj4gb3RoZXIsIGFuZCBkbyBub3QgbmVl
ZCB0byBiZSBpbiB0aGUgc2FtZSBmaWxlLiBQbGVhc2Ugc3BsaXQgdGhlbSBpbnRvDQo+IGRpZmZl
cmVuIGZpbGVzIGFuZCBwcmVmZXJhYmx5IGRpZmZlcmVudCBwYXRjaGVzDQpPa2F5LCB0aGFua3Mg
Zm9yIHlvdXIgY29tbWVudCwgSSB3aWxsIHNlcGFyYXRlIHRob3NlIGNsb2NrIGRyaXZlcnMgaW4N
CnRoZSBuZXh0IHBhdGNoIHNldA0KDQo+IElzIHRoZXJlIGFueSBwYXJ0aWN1bGFyIHJlYXNvbiBm
b3IgYXJjaF9pbml0Y2FsbA0KV2UgaGF2ZSBjb25zaWRlcmVkIHRoaXMgaW4gTVQ3OTg2IGJhc2lj
IGNsb2NrIGRyaXZlciwgYW5kIHVzZQ0KQ0xLX09GX0RFQ0xBUkUgaW5zdGVhZCBvZiBhcmNoX2lu
aXRjYWxsLg0KDQpBbm90aGVyIHF1ZXN0aW9uOg0KU2hvdWxkIHRoZSBjbG9jayBwYXRjaGVzIGlu
ICJBZGQgYmFzaWMgU29DIHN1cHBvcnQgZm9yIE1lZGlhVGVrIG10Nzk4NiINCm5lZWQgdG8gYmUg
c2VwYXJhdGVkIGludG8gYW5vdGhlciBwYXRjaCBzZXJpZXMsIHN1Y2ggYXMgTVQ4MTk1DQoiTWVk
aWF0ZWsgTVQ4MTk1IGNsb2NrIHN1cHBvcnQiID8gDQoNCg0KUmVnYXJkcw0KU2FtDQpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBt
YWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
