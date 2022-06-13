Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47175C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jun 2022 06:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ISCKLd9HVd2aD7sMpO4/7lN984A4VXH/Cd47RnbrIjo=; b=e0KZYUYwFXXUCp
	cw3ptR52E/aXO1NUjJO48VTE52KSwpkrEMUtxVnKxAnBh8UYhxsOA3djIWQO7i+qkz57lkxBwa9OX
	x1IVhgrsFG7MKH38+CZUHavk0R6nGP6YLKFx8w5VbRLgP9fk2o41KwtFTwoITcQk2OzvKPK43N0Cp
	5fjttV6AzVfpdUnNPpNqaLP1CmZxiX4kk7DvUcI5SERXSTiqi6n52YlUG9z0DZTkykW2/UykWWvdM
	Le4vWZiBxexfeWGeavbUB+KPn4to3a/1LNxWc6+mtt38864xKMl8UXJPSxEK0+AnsYucKViRORuNw
	C90cPbqZ8YyyrKVQloxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0dD6-001aov-T0; Mon, 13 Jun 2022 06:06:00 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0dD4-001anl-1b; Mon, 13 Jun 2022 06:05:59 +0000
X-UUID: d5bb8c69b733438bb1b1c621bea41c24-20220612
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5,REQID:c1644704-2405-4dfb-87d3-3f2434a73eec,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:2a19b09,CLOUDID:639b58c6-12ba-4305-bfdf-9aefbdc32516,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:0,BEC:nil
X-UUID: d5bb8c69b733438bb1b1c621bea41c24-20220612
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
	(envelope-from <rex-bc.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 1711806881; Sun, 12 Jun 2022 23:05:50 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 12 Jun 2022 23:05:49 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Mon, 13 Jun 2022 14:05:46 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Mon, 13 Jun 2022 14:05:46 +0800
Message-ID: <85102b2a8abeac8719ffdb2a1ec1c6463e91ddd7.camel@mediatek.com>
Subject: Re: [PATCH v10 14/21] drm/mediatek: dpi: Add dpintf support
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	<granquet@baylibre.com>
CC: <airlied@linux.ie>, <chunfeng.yun@mediatek.com>,
	<chunkuang.hu@kernel.org>, <ck.hu@mediatek.com>, <daniel@ffwll.ch>,
	<deller@gmx.de>, <devicetree@vger.kernel.org>,
	<dri-devel@lists.freedesktop.org>, <jitao.shi@mediatek.com>, <kishon@ti.com>,
	<krzysztof.kozlowski+dt@linaro.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-fbdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, <linux-phy@lists.infradead.org>,
	<maarten.lankhorst@linux.intel.com>, <matthias.bgg@gmail.com>,
	<mripard@kernel.org>, <msp@baylibre.com>, <p.zabel@pengutronix.de>,
	<robh+dt@kernel.org>, <tzimmermann@suse.de>, <vkoul@kernel.org>
Date: Mon, 13 Jun 2022 14:05:45 +0800
In-Reply-To: <60d33448-1cc9-c662-167b-10c1f9660545@wanadoo.fr>
References: <20220523104758.29531-1-granquet@baylibre.com>
	 <20220523104758.29531-15-granquet@baylibre.com>
	 <60d33448-1cc9-c662-167b-10c1f9660545@wanadoo.fr>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220612_230558_137545_B5D1A7BC 
X-CRM114-Status: GOOD (  35.49  )
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

T24gVGh1LCAyMDIyLTA2LTAyIGF0IDA3OjQ4ICswMjAwLCBDaHJpc3RvcGhlIEpBSUxMRVQgd3Jv
dGU6Cj4gTGUgMjMvMDUvMjAyMiDDoCAxMjo0NywgR3VpbGxhdW1lIFJhbnF1ZXQgYSDDqWNyaXQg
Ogo+ID4gZHBpbnRmIGlzIHRoZSBkaXNwbGF5cG9ydCBpbnRlcmZhY2UgaGFyZHdhcmUgdW5pdC4g
VGhpcyB1bml0IGlzCj4gPiBzaW1pbGFyCj4gPiB0byBkcGkgYW5kIGNhbiByZXVzZSBtb3N0IG9m
IHRoZSBjb2RlLgo+ID4gCj4gPiBUaGlzIHBhdGNoIGFkZHMgc3VwcG9ydCBmb3IgbXQ4MTk1LWRw
aW50ZiB0byB0aGlzIGRwaSBkcml2ZXIuIE1haW4KPiA+IGRpZmZlcmVuY2VzIGFyZToKPiA+ICAg
LSBTb21lIGZlYXR1cmVzL2Z1bmN0aW9uYWwgY29tcG9uZW50cyBhcmUgbm90IGF2YWlsYWJsZSBm
b3IKPiA+IGRwaW50Zgo+ID4gICAgIHdoaWNoIGFyZSBub3cgZXhjbHVkZWQgZnJvbSBjb2RlIGV4
ZWN1dGlvbiBvbmNlIGlzX2RwaW50ZiBpcwo+ID4gc2V0Cj4gPiAgIC0gZHBpbnRmIGNhbiBhbmQg
bmVlZHMgdG8gY2hvb3NlIGJldHdlZW4gZGlmZmVyZW50IGNsb2NrZGl2aWRlcnMKPiA+IGJhc2Vk
Cj4gPiAgICAgb24gdGhlIGNsb2Nrc3BlZWQuIFRoaXMgaXMgZG9uZSBieSBjaG9vc2luZyBhIGRp
ZmZlcmVudCBjbG9jawo+ID4gcGFyZW50Lgo+ID4gICAtIFRoZXJlIGFyZSB0d28gYWRkaXRpb25h
bCBjbG9ja3MgdGhhdCBuZWVkIHRvIGJlIG1hbmFnZWQuIFRoZXNlCj4gPiBhcmUKPiA+ICAgICBv
bmx5IHNldCBmb3IgZHBpbnRmIGFuZCB3aWxsIGJlIHNldCB0byBOVUxMIGlmIG5vdCBzdXBwbGll
ZC4KPiA+IFRoZQo+ID4gICAgIGNsa18qIGNhbGxzIGhhbmRsZSB0aGVzZSBhcyBub3JtYWwgY2xv
Y2tzIHRoZW4uCj4gPiAgIC0gU29tZSByZWdpc3RlciBjb250ZW50cyBkaWZmZXIgc2xpZ2h0bHkg
YmV0d2VlbiB0aGUgdHdvCj4gPiBjb21wb25lbnRzLiBUbwo+ID4gICAgIHdvcmsgYXJvdW5kIHRo
aXMgSSBhZGRlZCByZWdpc3RlciBiaXRzL21hc2tzIHdpdGggYSBEUElOVEZfCj4gPiBwcmVmaXgK
PiA+ICAgICBhbmQgdXNlIHRoZW0gd2hlcmUgZGlmZmVyZW50Lgo+ID4gCj4gPiBCYXNlZCBvbiBh
IHNlcGFyYXRlIGRyaXZlciBmb3IgZHBpbnRmIGNyZWF0ZWQgYnkKPiA+IEphc29uLUpILkxpbiA8
amFzb24tamgubGluLU51UzVMdk5VcGNKV2swSHRpazNKL3dAcHVibGljLmdtYW5lLm9yZz4KPiA+
IC4KPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogTWFya3VzIFNjaG5laWRlci1QYXJnbWFubiA8Cj4g
PiBtc3AtcmR2aWQxRHVIUkJXazBIdGlrM0ovd0BwdWJsaWMuZ21hbmUub3JnPgo+ID4gU2lnbmVk
LW9mZi1ieTogR3VpbGxhdW1lIFJhbnF1ZXQgPAo+ID4gZ3JhbnF1ZXQtcmR2aWQxRHVIUkJXazBI
dGlrM0ovd0BwdWJsaWMuZ21hbmUub3JnPgo+ID4gLS0tCj4gPiAgIGRyaXZlcnMvZ3B1L2RybS9t
ZWRpYXRlay9tdGtfZHBpLmMgICAgICAgICAgfCAxMjYKPiA+ICsrKysrKysrKysrKysrKysrLS0t
Cj4gPiAgIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHBpX3JlZ3MuaCAgICAgfCAgMzUg
KysrKysrCj4gPiAgIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2RkcF9jb21wLmMg
fCAgIDggKysKPiA+ICAgZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZGRwX2NvbXAu
aCB8ICAgMSArCj4gPiAgIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rydi5jICAg
ICAgfCAgIDUgKy0KPiA+ICAgaW5jbHVkZS9saW51eC9zb2MvbWVkaWF0ZWsvbXRrLW1tc3lzLmgg
ICAgICB8ICAgNCArLQo+ID4gICA2IGZpbGVzIGNoYW5nZWQsIDE1OSBpbnNlcnRpb25zKCspLCAy
MCBkZWxldGlvbnMoLSkKPiA+IAo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRp
YXRlay9tdGtfZHBpLmMKPiA+IGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcGkuYwo+
ID4gaW5kZXggZWI5NjljNWM1YzJlLi43NjNiZmI3MDAxMzUgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RwaS5jCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
bWVkaWF0ZWsvbXRrX2RwaS5jCj4gPiBAQCAtNzEsNiArNzEsNyBAQCBzdHJ1Y3QgbXRrX2RwaSB7
Cj4gPiAgIAl2b2lkIF9faW9tZW0gKnJlZ3M7Cj4gPiAgIAlzdHJ1Y3QgZGV2aWNlICpkZXY7Cj4g
PiAgIAlzdHJ1Y3QgY2xrICplbmdpbmVfY2xrOwo+ID4gKwlzdHJ1Y3QgY2xrICpkcGlfY2tfY2c7
Cj4gPiAgIAlzdHJ1Y3QgY2xrICpwaXhlbF9jbGs7Cj4gPiAgIAlzdHJ1Y3QgY2xrICp0dmRfY2xr
Owo+ID4gICAJaW50IGlycTsKPiA+IEBAIC0xMjYsNiArMTI3LDcgQEAgc3RydWN0IG10a19kcGlf
Y29uZiB7Cj4gPiAgIAljb25zdCB1MzIgKm91dHB1dF9mbXRzOwo+ID4gICAJdTMyIG51bV9vdXRw
dXRfZm10czsKPiA+ICAgCWJvb2wgaXNfY2tfZGVfcG9sOwo+ID4gKwlib29sIGlzX2RwaW50ZjsK
PiA+ICAgCWJvb2wgc3dhcF9pbnB1dF9zdXBwb3J0Owo+ID4gICAJLyogTWFzayB1c2VkIGZvciBI
V0lEVEgsIEhQT1JDSCwgVlNZTkNfV0lEVEggYW5kIFZTWU5DX1BPUkNICj4gPiAobm8gc2hpZnQp
ICovCj4gPiAgIAl1MzIgZGltZW5zaW9uX21hc2s7Cj4gPiBAQCAtNDM4LDYgKzQ0MCw4IEBAIHN0
YXRpYyB2b2lkIG10a19kcGlfcG93ZXJfb2ZmKHN0cnVjdCBtdGtfZHBpCj4gPiAqZHBpKQo+ID4g
ICAJbXRrX2RwaV9kaXNhYmxlKGRwaSk7Cj4gPiAgIAljbGtfZGlzYWJsZV91bnByZXBhcmUoZHBp
LT5waXhlbF9jbGspOwo+ID4gICAJY2xrX2Rpc2FibGVfdW5wcmVwYXJlKGRwaS0+ZW5naW5lX2Ns
ayk7Cj4gPiArCWNsa19kaXNhYmxlX3VucHJlcGFyZShkcGktPmRwaV9ja19jZyk7Cj4gPiArCWNs
a19kaXNhYmxlX3VucHJlcGFyZShkcGktPnR2ZF9jbGspOwo+ID4gICB9Cj4gPiAgIAo+ID4gICBz
dGF0aWMgaW50IG10a19kcGlfcG93ZXJfb24oc3RydWN0IG10a19kcGkgKmRwaSkKPiA+IEBAIC00
NDcsMTIgKzQ1MSwyNCBAQCBzdGF0aWMgaW50IG10a19kcGlfcG93ZXJfb24oc3RydWN0IG10a19k
cGkKPiA+ICpkcGkpCj4gPiAgIAlpZiAoKytkcGktPnJlZmNvdW50ICE9IDEpCj4gPiAgIAkJcmV0
dXJuIDA7Cj4gPiAgIAo+IAo+IEhpLAo+IAo+IGJlbHdvIHRoZSBlcnJvciBoYW5kbGluZyBwYXRo
IGxvb2tzIG9kZC4gKGJvdGggd2hlcmUgd2UgZ290bywgYW5kCj4gdGhlIAo+IG9yZGVyIG9mIHRo
ZSBjbGtfZGlzYWJsZV91bnByZXBhcmUoKSBpbiB0aGUgZXJyb3IgaGFuZGxpbmcgcGF0aC4KPiAK
PiBqdXN0IG15IDJjLAo+IAo+IENKCj4gCgpIZWxsbyBDaHJpc3RvcGhlLAoKVGhhbmtzIGZvciB5
b3VyIHJldmlldy4KSSB3aWxsIGZpeCB0aGlzIG9yZGVyIGluIGVueHQgdmVyc2lvbi4KClRoYW5r
cwoKQlJzLApCby1DaGVuCgo+ID4gKwlyZXQgPSBjbGtfcHJlcGFyZV9lbmFibGUoZHBpLT50dmRf
Y2xrKTsKPiA+ICsJaWYgKHJldCkgewo+ID4gKwkJZGV2X2VycihkcGktPmRldiwgIkZhaWxlZCB0
byBlbmFibGUgdHZkIHBsbDogJWRcbiIsCj4gPiByZXQpOwo+ID4gKwkJZ290byBlcnJfcGl4ZWw7
Cj4gPiArCX0KPiA+ICsKPiA+ICAgCXJldCA9IGNsa19wcmVwYXJlX2VuYWJsZShkcGktPmVuZ2lu
ZV9jbGspOwo+ID4gICAJaWYgKHJldCkgewo+ID4gICAJCWRldl9lcnIoZHBpLT5kZXYsICJGYWls
ZWQgdG8gZW5hYmxlIGVuZ2luZSBjbG9jazoKPiA+ICVkXG4iLCByZXQpOwo+ID4gICAJCWdvdG8g
ZXJyX3JlZmNvdW50Owo+ID4gICAJfQo+ID4gICAKPiA+ICsJcmV0ID0gY2xrX3ByZXBhcmVfZW5h
YmxlKGRwaS0+ZHBpX2NrX2NnKTsKPiA+ICsJaWYgKHJldCkgewo+ID4gKwkJZGV2X2VycihkcGkt
PmRldiwgIkZhaWxlZCB0byBlbmFibGUgZHBpX2NrX2NnIGNsb2NrOgo+ID4gJWRcbiIsIHJldCk7
Cj4gPiArCQlnb3RvIGVycl9ja19jZzsKPiA+ICsJfQo+ID4gKwo+ID4gICAJcmV0ID0gY2xrX3By
ZXBhcmVfZW5hYmxlKGRwaS0+cGl4ZWxfY2xrKTsKPiA+ICAgCWlmIChyZXQpIHsKPiA+ICAgCQlk
ZXZfZXJyKGRwaS0+ZGV2LCAiRmFpbGVkIHRvIGVuYWJsZSBwaXhlbCBjbG9jazogJWRcbiIsCj4g
PiByZXQpOwo+ID4gQEAgLTQ2Niw2ICs0ODIsOCBAQCBzdGF0aWMgaW50IG10a19kcGlfcG93ZXJf
b24oc3RydWN0IG10a19kcGkKPiA+ICpkcGkpCj4gPiAgIAlyZXR1cm4gMDsKPiA+ICAgCj4gPiAg
IGVycl9waXhlbDoKPiA+ICsJY2xrX2Rpc2FibGVfdW5wcmVwYXJlKGRwaS0+ZHBpX2NrX2NnKTsK
PiA+ICtlcnJfY2tfY2c6Cj4gPiAgIAljbGtfZGlzYWJsZV91bnByZXBhcmUoZHBpLT5lbmdpbmVf
Y2xrKTsKPiA+ICAgZXJyX3JlZmNvdW50Ogo+ID4gICAJZHBpLT5yZWZjb3VudC0tOwo+IAo+IFsu
Li5dCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
PiBsaW51eC1hcm0ta2VybmVsIG1haWxpbmcgbGlzdAo+IGxpbnV4LWFybS1rZXJuZWxAbGlzdHMu
aW5mcmFkZWFkLm9yZwo+IGh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtYXJtLWtlcm5lbAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0Bs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbWVkaWF0ZWsK
