Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4580C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Jul 2022 08:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zn6QJbBfToARw5+lYJG08RmzVu4yYkQuQ2wDbheWxvQ=; b=tIi/h53janO+JnGS2ZG0QsplN8
	OoA21RZuUj5Bfxem5KELdzocg0uL9e/s6WjeoRBxuDFO9iAmEVG4lvRb9ghfywSmJy1k/Cqm2Znxi
	Rmo8dKIWV2KhNRt/RDvpu4SeZ8XYqujHA67WhYMPCWmY7olvc/lQ1Wt9uKSabpYEHn0dzLgvl9PUz
	6u6nPoFB5JAYDqAitY/SbLDdUesFb9E32aewn+h2/be/e5SDoX2E+6eG9Ux2bni0H9QbaerSRiIua
	5AeHEGlft2UjjUWJkOI1JK/j3qa2FuqXPix0X3396OrT9uNX9nw9psNMW6uMBXaq6Via/sn1PMpX/
	weGrdkdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGFlr-00A2eD-0E; Tue, 26 Jul 2022 08:18:27 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGFkl-00A1v3-QD; Tue, 26 Jul 2022 08:17:21 +0000
X-UUID: e22d60ee7dd347e6a03dfb1ba7575ab7-20220726
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=zn6QJbBfToARw5+lYJG08RmzVu4yYkQuQ2wDbheWxvQ=;
	b=FsA0GfMLVFlDaGxk98xXDAr/YDY/cjeZwC5X1flcK9CW5LlD4AT7C8+FT6QPuxrGyZQYVwh+jxCZhis9+EAJTllC6+u+RNAT47FruNSGfudLvc2SOWi5Q51jjQGd3XlFNqmHS6yEw5glC31hVpA3KQOwQWE31ZVa3Ufro/ckU+Q=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:3ffe8534-5cf7-47f6-b7b3-2ec495134935,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:0f94e32,CLOUDID:0f690cee-db04-4499-9fdf-04ef44b9468c,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: e22d60ee7dd347e6a03dfb1ba7575ab7-20220726
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <axe.yang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1364106535; Tue, 26 Jul 2022 01:17:13 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Tue, 26 Jul 2022 15:46:35 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 26 Jul 2022 15:46:34 +0800
Message-ID: <aface69bc8eeb0a34805428fa36d13f7909f694d.camel@mediatek.com>
Subject: Re: [PATCH v13 3/3] mmc: mediatek: add support for SDIO eint wakup
 IRQ
From: Axe Yang <axe.yang@mediatek.com>
To: Linus Walleij <linus.walleij@linaro.org>, Ulf Hansson
	<ulf.hansson@linaro.org>
CC: Rob Herring <robh+dt@kernel.org>, Chaotian Jing
	<chaotian.jing@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
	Adrian Hunter <adrian.hunter@intel.com>, Yoshihiro Shimoda
	<yoshihiro.shimoda.uh@renesas.com>, Satya Tangirala <satyat@google.com>, Andy
 Shevchenko <andriy.shevchenko@linux.intel.com>, Wolfram Sang
	<wsa+renesas@sang-engineering.com>, Lucas Stach <dev@lynxeye.de>, "Eric
 Biggers" <ebiggers@google.com>, Andrew Jeffery <andrew@aj.id.au>, "Stephen
 Boyd" <swboyd@chromium.org>, Kiwoong Kim <kwmad.kim@samsung.com>, Yue Hu
	<huyue2@yulong.com>, Tian Tao <tiantao6@hisilicon.com>,
	<angelogioacchino.delregno@collabora.com>, <linux-mmc@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Yong Mao
	<yong.mao@mediatek.com>
Date: Tue, 26 Jul 2022 15:46:34 +0800
In-Reply-To: <CACRpkdZP-FBP8hsBfeMn1M8=VR_cYG+j9GQc9VdV-HjkvSo73w@mail.gmail.com>
References: <20220623090445.1401-1-axe.yang@mediatek.com>
	 <20220623090445.1401-4-axe.yang@mediatek.com>
	 <CACRpkdZ5G2fMCqvkXANVEmZjNcF4U4mSDzZk6aXbqFjYVN3hcA@mail.gmail.com>
	 <3747f246650622ef65787159af5271a79401a855.camel@mediatek.com>
	 <CACRpkdZP-FBP8hsBfeMn1M8=VR_cYG+j9GQc9VdV-HjkvSo73w@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
Content-Transfer-Encoding: base64
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220726_011719_999981_C49EEE0D 
X-CRM114-Status: GOOD (  32.36  )
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

T24gTW9uLCAyMDIyLTA3LTI1IGF0IDE0OjQ2ICswMjAwLCBMaW51cyBXYWxsZWlqIHdyb3RlOg0K
PiBPbiBNb24sIEp1bCAyNSwgMjAyMiBhdCAxMToxMyBBTSBBeGUgWWFuZyA8YXhlLnlhbmdAbWVk
aWF0ZWsuY29tPg0KPiB3cm90ZToNCj4gPiBPbiBGcmksIDIwMjItMDctMjIgYXQgMTM6MjEgKzAy
MDAsIExpbnVzIFdhbGxlaWogd3JvdGU6DQo+ID4gPiBPbiBUaHUsIEp1biAyMywgMjAyMiBhdCAx
MToxMCBBTSBBeGUgWWFuZyA8YXhlLnlhbmdAbWVkaWF0ZWsuY29tPg0KPiA+ID4gd3JvdGU6DQo+
ID4gU0RJTyBEQVQxIHBpbiBtb2RlIGlzIGNoYW5nZWQgdG8gR1BJTyBtb2RlIGluDQo+ID4gZGV2
X3BtX3NldF9kZWRpY2F0ZWRfd2FrZV9pcnFfcmV2ZXJzZSgpOg0KPiA+IA0KPiA+IA0KaHR0cHM6
Ly91cmxkZWZlbnNlLmNvbS92My9fX2h0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L2xh
dGVzdC9zb3VyY2UvZHJpdmVycy9waW5jdHJsL21lZGlhdGVrL3BpbmN0cmwtbXRrLWNvbW1vbi12
Mi5jKkwzMzlfXztJdyEhQ1RSTktBOXdNZzBBUmJ3IXpFM2ttaTM3cFp3NEhpQk5lUmlwV2JpM2di
QXFybGpMVlFjNUpWei1XUF9OYUlXVFZoWHNoa2FrakZOaDQ3OGUkDQo+ID4gIA0KPiA+IA0KPiA+
IGRldl9wbV9zZXRfZGVkaWNhdGVkX3dha2VfaXJxX3JldmVyc2UoKSAtPiAuLi4NCj4gPiAtPnJl
cXVlc3RfdGhyZWFkZWRfaXJxKCkNCj4gPiAtPiBfX3NldHVwX2lycSgpIC0+IGlycV9yZXF1ZXN0
X3Jlc291cmNlcygpIC0+DQo+ID4gbXRrX2VpbnRfaXJxX3JlcXVlc3RfcmVzb3VyY2VzKCktPiBt
dGtfeHRfc2V0X2dwaW9fYXNfZWludCgpDQo+IA0KPiBUaGlzIGRvZXNuJ3Qgc2VlbSB0byBoYXZl
IG11Y2ggdG8gZG8gd2l0aCBwaW4gY29udHJvbD8NCj4gTm8gcGluIGNvbnRyb2wgZnVuY3Rpb25z
IGFyZSBjYWxsZWQgb24gdGhpcyBleGVjdXRpb24gcGF0aCwNCj4gbm8gcGluIGNvbnRyb2wgc3Rh
dGUgaXMgY2hhbmdlZCwgcmlnaHQ/DQoNClRoYXQncyByaWdodCwgbm8gcGluIGNvbnRyb2wgc3Rh
dGUgaXMgY2hhbmdlZC4NCg0KPiANCj4gSWYgd2hhdCB5b3UgbWVhbiBpcyB0aGF0DQo+IGl0IGhh
cHBlbnMgdG8gcG9rZSBpbnRvIHRoZSBzYW1lIGhhcmR3YXJlIHJlZ2lzdGVycyB0aGF0IGlzDQo+
IG1haW5seSBhIG1hdHRlciBvZiBjb25jdXJyZW5jeSBpbiB0aGUgZHJpdmVyLCBzb21ldGltZXMg
dHdvDQo+IGFic3RyYWN0aW9ucyBoYXBwZW4gdG8gaGF2ZSB0byBwb2tlIGludG8gdGhlIHNhbWUg
aGFyZHdhcmUNCj4gcmVnaXN0ZXJzIGFuZCB0aGVuIGl0IGlzIHVwIHRvIHRoZSBkcml2ZXIgdG8g
bWFpbnRhaW4gc3RhdGUgZm9yDQo+IHRoZSBoYXJkd2FyZSwgdGhpcyBpcyBub3QgYSBxdWVzdGlv
biBmb3IgdGhlIGZyYW1ld29yay4NCj4gDQo+IEhvdyBpcyBNZWRpYXRlayBkZXZlbG9wZXJzIHRo
aW5raW5nIGFib3V0IHRoaXMgdGhpbmcgaW4gZ2VuZXJhbD8NCj4gWW91IGFyZSBhIGZldyBwZW9w
bGUgd2hvIGRldmVsb3BlZCB0aGUgZHJpdmVyIHNvIGNlcnRhaW5seQ0KPiB5b3UgbXVzdCBoYXZl
IHNvbWUgZGVzaWduIGlkZWEgdG8gd2h5IGlycV9yZXF1ZXN0X3Jlc291cmNlcygpDQo+IHBva2Ug
YXJvdW5kIGluIHRoZXNlIHJlZ2lzdGVycz8gRG9lcyBpdCBldmVuIHBlcmZvcm0gcGluDQo+IGNv
bnRyb2wgYmVoaW5kIHRoZSBiYWNrIG9mIHRoZSBwaW4gY29udHJvbCBmcmFtZXdvcms/DQoNCkkg
c2VlLiBJdCBpcyBzZW5zaWJsZSB0byByZXNldCBwaW4gZnVuY3Rpb24gdG8gR1BJTyBtb2RlIHdo
ZW4gdHJ5aW5nIHRvDQpyZWdpc3RlciB0aGUgcGluIHRvIGVpbnQgbW9kZSwgYW5kIHRoZSBvcGVy
YXRpb24gaXMgb3V0IG9mIHBpbmN0cmwNCmZyYW1ld29yay4NCg0KU2VlbXMgbGlrZSBtYWludGFp
biB0aGUgcGluIHN0YXRlIGluIGRyaXZlciBpcyB0aGUgb25seSB3YXkgdG8gZml4IHRoZQ0KcGlu
IGZ1bmN0aW9uIGNvbmZsaWN0Lg0KDQo+IA0KPiA+IFRvIHJlc3RvcmUgU0RJTyBEQVQxIHBpbiB0
byB1aHMgbW9kZS4gSSBoYXZlIHRvIGNhbGwNCj4gPiBwaW5jdHJsX3NlbGVjdF9zdGF0ZSgpIHR3
aWNlKGNoYW5nZSBwaW5jdHJsIHRvIGFub3RoZXIgc3RhdGUsIHRoZW4NCj4gPiBjaGFuZ2UgYmFj
ayB0byB1aHMgbW9kZSkuIFVsZiB3b3JyaWVkIHdlIG1pZ2h0IGJlIGRvaW5nIHNvbWV0aGluZw0K
PiA+IGF0DQo+ID4gdGhlIG1tYyBkcml2ZXIgbGV2ZWwsIHdoaWNoIHNob3VsZCByZWFsbHkgYmUg
bWFuYWdlZCBhdCB0aGUgcGluY3RybA0KPiA+IGxheWVyLg0KPiA+IA0KPiA+IERvIHlvdSBoYXZl
IGFueSBjb21tZW50IG9yIHN1Z2dlc3Rpb24gb24gdGhpcz8NCj4gDQo+IFRoZSBwaW4gY29udHJv
bCBzdGF0ZSB0cmFuc2l0aW9ucyBhcmUgcmVhbGx5IGp1c3QgZmluaXRlIGF1dG9tYXRhLg0KPiAN
Cj4gWW91ciBwaW4gY29udHJvbCBuZWVkcyB0byBiZSBkaWZmZXJlbnQgd2hlbiB1c2luZyB3YWtl
dXAgZnJvbQ0KPiB3aGVuIGJlaW5nIHVzZWQgZm9yIFNESU8gYW5kIHRoaXMgaXMgcGVyZmVjdGx5
IGZpbmUsIGl0J3Mgbm8NCj4gZGlmZmVyZW50IGZyb20gdGhlIGZhY3QgdGhhdCB0aGUgcmVndWxh
dG9yIGFuZCBjbG9jayBtaWdodCBuZWVkDQo+IHRvIGJlIGluIGRpZmZlcmVudCBzdGF0ZXMsIHNv
IEkgZG9uJ3QgcXVpdGUgdW5kZXJzdGFuZCB0aGUNCj4gcXVlc3Rpb24/DQoNCkkgc2VlLiBBdCBm
aXJzdCBJIHRob3VnaHQgdGhhdCBwaW5jdHJsIGZyYW1ld29yayBzaG91bGQgYmUgYXdhcmUgb2YN
CnRoZSBoaWRkZW4gbW9kaWZpY2F0aW9uIG9mIHBpbiBmdW5jdGlvbi4gQnV0IGFzIHlvdSBzYWlk
LCBpdCBpcyBqdXN0DQphIGZpbml0ZSBhdXRvbWF0YS4gRHJpdmVyIHNob3VsZCBjb3JyZWN0IEdQ
SU8gc2V0dGluZ3MgYnkgaXRzZWxmIGlmIHBpbg0Kc3RhdGUgYmUgY2hhbmdlZCBvdXRzaWRlIHBp
biBjb250cm9sIHN0YXRlIG1lY2hhbmljYWwuDQpTb3JyeSBmb3IgdGhlIG5vaXNlLCBhbmQgdGhh
bmtzIGZvciB5b3VyIGNvbW1lbnQgYWdhaW4uDQoNCj4gDQo+IA0KUmVnYXJkcywNCkF4ZQ0K


