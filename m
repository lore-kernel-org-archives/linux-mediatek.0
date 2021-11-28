Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4980C433F5
	for <linux-mediatek@archiver.kernel.org>; Sun, 28 Nov 2021 15:57:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Resent-Cc:Resent-From:Subject:
	MIME-Version:References:In-Reply-To:CC:To:From:Message-ID:Reply-To:Content-ID
	:Content-Description:Resent-Date:Resent-Sender:Resent-To:Resent-Message-ID:
	List-Owner; bh=9PhvaRJHaTH3OcOGBKGAtHdwIE+o4LG82OJR0xWAQYA=; b=4C5AKnHefHt1s6
	wFVcHGuV3ElAV1O5ET5EzOYC+pKZ0/r1Rd4c9Pw2Td7kjbTs+AXC5vri17hCXhQAYCC5xtd5p1F5G
	dsoIrXHDz0EUJElXvhFfJDxi/cge4LX39GuKUIAK95X3M8aWTbGcvm+QrHpPxDpiYwpQnfiQ7T70Z
	6G4fs2N5PqazmGAfS6WOdDsG2UaiO1Ylh4IKBrX3PS00lu12vTEhZGUEqcMmNdCOV2f3pM3BJzqGE
	l4c6uMo0oCG/dM1pUJA3iclimv3vlKg7Y1Kq2S4OqBYihw6frd0flbiurTkrsD2Nudwej3xE0+P/q
	DvvgG3YXoVEdDPMcl3iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mrMYg-00G7Hd-KH; Sun, 28 Nov 2021 15:57:42 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mrMYd-00G7Go-8X; Sun, 28 Nov 2021 15:57:41 +0000
X-UUID: 698d88a339c34e279fc47dc5d03bf1d2-20211128
X-UUID: 698d88a339c34e279fc47dc5d03bf1d2-20211128
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <jason-jh.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 538637904; Sun, 28 Nov 2021 08:57:36 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 28 Nov 2021 07:57:35 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Sun, 28 Nov 2021 23:57:34 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sun, 28 Nov 2021 23:57:33 +0800
Message-ID: <ae29424d8121f8951cfb5fece114b6fcba90d351.camel@mediatek.com>
From: Jason-JH Lin <jason-jh.lin@mediatek.com>
To: Tzung-Bi Shih <tzungbi@google.com>
CC: Chun-Kuang Hu <chunkuang.hu@kernel.org>, "; Philipp Zabel"
 <p.zabel@pengutronix.de>, "; Matthias Brugger" <matthias.bgg@gmail.com>, ";
 Jassi Brar" <jassisinghbrar@gmail.com>, "; David Airlie" <airlied@linux.ie>,
 "; Daniel Vetter" <daniel@ffwll.ch>, "; dri-devel@lists.freedesktop.org;
 linux-mediatek@lists.infradead.org;	  linux-arm-kernel@lists.infradead.org;
 linux-kernel@vger.kernel.org;	  hsinyi@chromium.org; fshao@chromium.org;
 Nancy Lin =?UTF-8?Q?=28=E6=9E=97=E6=AC=A3=E8=9E=A2=29?="
 <Nancy.Lin@mediatek.com>, "; Singo Chang
 =?UTF-8?Q?=28=E5=BC=B5=E8=88=88=E5=9C=8B=29?=" <Singo.Chang@mediatek.com>
In-Reply-To: <PU1PR03MB306252A252139515F7EA9ABCB8659@PU1PR03MB3062.apcprd03.prod.outlook.com>
References: <20211117064158.27451-1-jason-jh.lin@mediatek.com>
 <20211117064158.27451-4-jason-jh.lin@mediatek.com>
 <YZXqz6XDChwscDC0@google.com>
 <PU1PR03MB306252A252139515F7EA9ABCB8659@PU1PR03MB3062.apcprd03.prod.outlook.com>
MIME-Version: 1.0
Subject: Re: FW: [PATCH 3/3] drm/mediatek: add devlink to cmdq dev
Resent-From: Jason-JH Lin <jason-jh.lin@mediatek.com>
Resent-Cc: DRI Development <dri-devel@lists.freedesktop.org>, "moderated
 list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, "Linux
 ARM" <linux-arm-kernel@lists.infradead.org>, linux-kernel
 <linux-kernel@vger.kernel.org>, Hsin-Yi Wang <hsinyi@chromium.org>, "Fei
 Shao" <fshao@chromium.org>
Date: Sun, 28 Nov 2021 23:57:33 +0800
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211128_075739_335111_296E7E7C 
X-CRM114-Status: GOOD (  18.79  )
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

SGkgVHp1bmctQmksCgpUaGFua3MgZm9yIHRoZSByZXZpZXdzLgoKPiBGcm9tOiBMaW51eC1tZWRp
YXRlayA8bGludXgtbWVkaWF0ZWstYm91bmNlc0BsaXN0cy5pbmZyYWRlYWQub3JnPiBPbgo+IEJl
aGFsZiBPZiBUenVuZy1CaSBTaGloCj4gU2VudDogVGh1cnNkYXksIE5vdmVtYmVyIDE4LCAyMDIx
IDE6NTUgUE0KPiBUbzogSmFzb24tSkggTGluICjmnpfnnb/npaUpIDxKYXNvbi1KSC5MaW5AbWVk
aWF0ZWsuY29tPgo+IENjOiBDaHVuLUt1YW5nIEh1IDxjaHVua3VhbmcuaHVAa2VybmVsLm9yZz47
IFBoaWxpcHAgWmFiZWwgPAo+IHAuemFiZWxAcGVuZ3V0cm9uaXguZGU+OyBNYXR0aGlhcyBCcnVn
Z2VyIDxtYXR0aGlhcy5iZ2dAZ21haWwuY29tPjsKPiBKYXNzaSBCcmFyIDxqYXNzaXNpbmdoYnJh
ckBnbWFpbC5jb20+OyBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWUKPiA+OyBEYW5pZWwg
VmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+OyBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
OyAKPiBsaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnOyAKPiBsaW51eC1hcm0ta2Vy
bmVsQGxpc3RzLmluZnJhZGVhZC5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IAo+
IGhzaW55aUBjaHJvbWl1bS5vcmc7IGZzaGFvQGNocm9taXVtLm9yZzsgTmFuY3kgTGluICjmnpfm
rKPonqIpIDwKPiBOYW5jeS5MaW5AbWVkaWF0ZWsuY29tPjsgU2luZ28gQ2hhbmcgKOW8teiIiOWc
iykgPFNpbmdvLkNoYW5nQG1lZGlhdGVrLmNvbT4KPiBTdWJqZWN0OiBSZTogW1BBVENIIDMvM10g
ZHJtL21lZGlhdGVrOiBhZGQgZGV2bGluayB0byBjbWRxIGRldgo+IAo+IE9uIFdlZCwgTm92IDE3
LCAyMDIxIGF0IDAyOjQxOjU4UE0gKzA4MDAsIGphc29uLWpoLmxpbiB3cm90ZToKPiA+IEBAIC0x
NTgsNiArMTU5LDcgQEAgc3RhdGljIHZvaWQgbXRrX2RybV9jcnRjX2Rlc3Ryb3koc3RydWN0Cj4g
PiBkcm1fY3J0YyAqY3J0YykKPiA+ICAJbXRrX2RybV9jbWRxX3BrdF9kZXN0cm95KCZtdGtfY3J0
Yy0+Y21kcV9oYW5kbGUpOwo+ID4gIAo+ID4gIAlpZiAobXRrX2NydGMtPmNtZHFfY2xpZW50LmNo
YW4pIHsKPiA+ICsJCWRldmljZV9saW5rX3JlbW92ZShtdGtfY3J0Yy0+ZHJtX2RldiwgbXRrX2Ny
dGMtCj4gPiA+Y21kcV9jbGllbnQuY2hhbi0+bWJveC0+ZGV2KTsKPiA+ICAJCW1ib3hfZnJlZV9j
aGFubmVsKG10a19jcnRjLT5jbWRxX2NsaWVudC5jaGFuKTsKPiA+ICAJCW10a19jcnRjLT5jbWRx
X2NsaWVudC5jaGFuID0gTlVMTDsKPiA+ICAJfQo+IAo+IFsuLi5dCj4gPiBAQCAtOTU2LDYgKzk1
OSwxNiBAQCBpbnQgbXRrX2RybV9jcnRjX2NyZWF0ZShzdHJ1Y3QgZHJtX2RldmljZQo+ID4gKmRy
bV9kZXYsCj4gPiAgCX0KPiA+ICAKPiA+ICAJaWYgKG10a19jcnRjLT5jbWRxX2NsaWVudC5jaGFu
KSB7Cj4gPiArCQlzdHJ1Y3QgZGV2aWNlX2xpbmsgKmxpbms7Cj4gPiArCj4gPiArCQkvKiBhZGQg
ZGV2bGluayB0byBjbWRxIGRldiB0byBtYWtlIHN1cmUgc3VzcGVuZC9yZXN1bWUKPiA+IG9yZGVy
IGlzIGNvcnJlY3QgKi8KPiA+ICsJCWxpbmsgPSBkZXZpY2VfbGlua19hZGQoZGV2LCBtdGtfY3J0
Yy0+Y21kcV9jbGllbnQuY2hhbi0KPiA+ID5tYm94LT5kZXYsCj4gPiArCQkJCSAgICAgICBETF9G
TEFHX1BNX1JVTlRJTUUgfAo+ID4gRExfRkxBR19TVEFURUxFU1MpOwo+ID4gKwkJaWYgKCFsaW5r
KSB7Cj4gPiArCQkJZGV2X2VycihkZXYsICJVbmFibGUgdG8gbGluayBkZXY9JXNcbiIsCj4gPiAr
CQkJCWRldl9uYW1lKG10a19jcnRjLT5jbWRxX2NsaWVudC5jaGFuLQo+ID4gPm1ib3gtPmRldikp
Owo+ID4gKwkJfQo+ID4gKwo+IAo+IElmIGRldmljZV9saW5rX2FkZCgpIGZhaWxlZCwgZG9lc24n
dCBtdGtfZHJtX2NydGNfY3JlYXRlKCkgbmVlZCB0bwo+IHJldHVybiBhbiBlcnJvciBhbmQgZXhp
dD8KCk9LLCBJJ2xsIGFkZCB0aGUgcmV0dXJuIGVycm9yIGF0IHRoZSBuZXh0IHZlcmlvbi4KPiAK
PiBPVE9ILCBpZiBkZXZpY2VfbGlua19hZGQoKSBmYWlsZWQsIHdvbid0IGl0IGJyaW5nIGFueSBz
aWRlIGVmZmVjdHMgdG8KPiBjYWxsIGRldmljZV9saW5rX3JlbW92ZSgpPwo+IAoKQmVjYXVzZSBk
ZXZpY2VfbGlua19yZW1vdmUoKSB3aWxsIGZpbmQgdGhlIGRldmljZV9saW5rIG9mIHN1cHBsaWVy
IGFuZApjb25zdW1lciwgdGhlbiBkZWxldGUgdGhlIGRldmljZV9saW5rIGJldHdlZW4gdGhlbS4K
SWYgZGV2aWNlX2xpbmtfYWRkKCkgZmFpbGVkLCBzdXBwbGllciBhbmQgY29uc3VtZXIgd29uJ3Qg
Y3JlYXRlIHRoZQpkZXZpY2VfbGluay4KU28gY2FsbGluZyBkZXZpY2VfbGlua19yZW1vdmUoKSB3
b24ndCBkbyBhbnl0aGluZyB3aXRob3V0IGRlaXZlX2xpbmsKYW5kIHdvbid0IGJyaW5nIGFueSBz
aWRlIGVmZmVjdHMuCgpSZWdhcmRzLApKYXNvbi1KSC5MaW4KPiBfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IExpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlz
dAo+IExpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKPiAKaHR0cHM6Ly91cmxkZWZl
bnNlLmNvbS92My9fX2h0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtbWVkaWF0ZWtfXzshIUNUUk5LQTl3TWcwQVJidyExMjVkbU9aN3hDTGt3YklyelpmMVZx
VkxRQmJkVDRSRkhvTWpSMzhVMUdlQ3hhVE02eHZ2Qi1tU3I3c1RjNkJ1WTVJSCQKPiAgCi0tIApK
YXNvbi1KSCBMaW4gPGphc29uLWpoLmxpbkBtZWRpYXRlay5jb20+CgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBs
aXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
