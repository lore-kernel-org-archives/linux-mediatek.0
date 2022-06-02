Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9657FC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Jun 2022 05:49:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XNiFvD7Y6CXg+URSQIxhfqf8K2akpPupNBsjgvb2SEo=; b=JUivgSG3zeC2qw
	XS/OKr7Y0b3Pr+sQvRPLQq76fgwFPn0f4uGoNvi7ydHB1CmvEFVPGe1MYRNZ2vnMieZ0r00guQAyn
	vrPz1ZLITlqPgP1h6L61YyoAmOsRG+vpEs95LmvmD4j0/jp7koQ2dJCqd+1040sDRJcAi7/pz03ON
	Wavg6rwUgXL532cbs15amkyFqEPw4mSOcs169FMPOatqYwEUZlFpmUuiqEAWcbeVK8MLXZkN5eM5w
	tEbsNgJ04OZf5+OQTRAIEmIIUIt94Ct7l+H2OWkFl3HahQas3A+eb9c/hJKSktf8jb273F4nr290S
	YCkRy+2QgiEzEXfA10Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwdht-001XLn-Lf; Thu, 02 Jun 2022 05:49:17 +0000
Received: from smtp04.smtpout.orange.fr ([80.12.242.126] helo=smtp.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwdhe-001XI8-3W
	for linux-mediatek@lists.infradead.org; Thu, 02 Jun 2022 05:49:06 +0000
Received: from [192.168.1.18] ([90.11.190.129])
	by smtp.orange.fr with ESMTPA
	id wdhSn51g6QKuawdhSnS6n8; Thu, 02 Jun 2022 07:48:57 +0200
X-ME-Helo: [192.168.1.18]
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Thu, 02 Jun 2022 07:48:57 +0200
X-ME-IP: 90.11.190.129
Message-ID: <60d33448-1cc9-c662-167b-10c1f9660545@wanadoo.fr>
Date: Thu, 2 Jun 2022 07:48:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v10 14/21] drm/mediatek: dpi: Add dpintf support
Content-Language: fr
To: granquet@baylibre.com
Cc: airlied@linux.ie, chunfeng.yun@mediatek.com, chunkuang.hu@kernel.org,
 ck.hu@mediatek.com, daniel@ffwll.ch, deller@gmx.de,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 jitao.shi@mediatek.com, kishon@ti.com, krzysztof.kozlowski+dt@linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-phy@lists.infradead.org, maarten.lankhorst@linux.intel.com,
 matthias.bgg@gmail.com, mripard@kernel.org, msp@baylibre.com,
 p.zabel@pengutronix.de, robh+dt@kernel.org, tzimmermann@suse.de,
 vkoul@kernel.org
References: <20220523104758.29531-1-granquet@baylibre.com>
 <20220523104758.29531-15-granquet@baylibre.com>
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20220523104758.29531-15-granquet@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220601_224902_405419_A1F00DFC 
X-CRM114-Status: GOOD (  28.27  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

TGUgMjMvMDUvMjAyMiDDoCAxMjo0NywgR3VpbGxhdW1lIFJhbnF1ZXQgYSDDqWNyaXTCoDoKPiBk
cGludGYgaXMgdGhlIGRpc3BsYXlwb3J0IGludGVyZmFjZSBoYXJkd2FyZSB1bml0LiBUaGlzIHVu
aXQgaXMgc2ltaWxhcgo+IHRvIGRwaSBhbmQgY2FuIHJldXNlIG1vc3Qgb2YgdGhlIGNvZGUuCj4g
Cj4gVGhpcyBwYXRjaCBhZGRzIHN1cHBvcnQgZm9yIG10ODE5NS1kcGludGYgdG8gdGhpcyBkcGkg
ZHJpdmVyLiBNYWluCj4gZGlmZmVyZW5jZXMgYXJlOgo+ICAgLSBTb21lIGZlYXR1cmVzL2Z1bmN0
aW9uYWwgY29tcG9uZW50cyBhcmUgbm90IGF2YWlsYWJsZSBmb3IgZHBpbnRmCj4gICAgIHdoaWNo
IGFyZSBub3cgZXhjbHVkZWQgZnJvbSBjb2RlIGV4ZWN1dGlvbiBvbmNlIGlzX2RwaW50ZiBpcyBz
ZXQKPiAgIC0gZHBpbnRmIGNhbiBhbmQgbmVlZHMgdG8gY2hvb3NlIGJldHdlZW4gZGlmZmVyZW50
IGNsb2NrZGl2aWRlcnMgYmFzZWQKPiAgICAgb24gdGhlIGNsb2Nrc3BlZWQuIFRoaXMgaXMgZG9u
ZSBieSBjaG9vc2luZyBhIGRpZmZlcmVudCBjbG9jayBwYXJlbnQuCj4gICAtIFRoZXJlIGFyZSB0
d28gYWRkaXRpb25hbCBjbG9ja3MgdGhhdCBuZWVkIHRvIGJlIG1hbmFnZWQuIFRoZXNlIGFyZQo+
ICAgICBvbmx5IHNldCBmb3IgZHBpbnRmIGFuZCB3aWxsIGJlIHNldCB0byBOVUxMIGlmIG5vdCBz
dXBwbGllZC4gVGhlCj4gICAgIGNsa18qIGNhbGxzIGhhbmRsZSB0aGVzZSBhcyBub3JtYWwgY2xv
Y2tzIHRoZW4uCj4gICAtIFNvbWUgcmVnaXN0ZXIgY29udGVudHMgZGlmZmVyIHNsaWdodGx5IGJl
dHdlZW4gdGhlIHR3byBjb21wb25lbnRzLiBUbwo+ICAgICB3b3JrIGFyb3VuZCB0aGlzIEkgYWRk
ZWQgcmVnaXN0ZXIgYml0cy9tYXNrcyB3aXRoIGEgRFBJTlRGXyBwcmVmaXgKPiAgICAgYW5kIHVz
ZSB0aGVtIHdoZXJlIGRpZmZlcmVudC4KPiAKPiBCYXNlZCBvbiBhIHNlcGFyYXRlIGRyaXZlciBm
b3IgZHBpbnRmIGNyZWF0ZWQgYnkKPiBKYXNvbi1KSC5MaW4gPGphc29uLWpoLmxpbi1OdVM1THZO
VXBjSldrMEh0aWszSi93QHB1YmxpYy5nbWFuZS5vcmc+Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IE1h
cmt1cyBTY2huZWlkZXItUGFyZ21hbm4gPG1zcC1yZHZpZDFEdUhSQldrMEh0aWszSi93QHB1Ymxp
Yy5nbWFuZS5vcmc+Cj4gU2lnbmVkLW9mZi1ieTogR3VpbGxhdW1lIFJhbnF1ZXQgPGdyYW5xdWV0
LXJkdmlkMUR1SFJCV2swSHRpazNKL3dAcHVibGljLmdtYW5lLm9yZz4KPiAtLS0KPiAgIGRyaXZl
cnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHBpLmMgICAgICAgICAgfCAxMjYgKysrKysrKysrKysr
KysrKystLS0KPiAgIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHBpX3JlZ3MuaCAgICAg
fCAgMzUgKysrKysrCj4gICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHBfY29t
cC5jIHwgICA4ICsrCj4gICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kZHBfY29t
cC5oIHwgICAxICsKPiAgIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rydi5jICAg
ICAgfCAgIDUgKy0KPiAgIGluY2x1ZGUvbGludXgvc29jL21lZGlhdGVrL210ay1tbXN5cy5oICAg
ICAgfCAgIDQgKy0KPiAgIDYgZmlsZXMgY2hhbmdlZCwgMTU5IGluc2VydGlvbnMoKyksIDIwIGRl
bGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRr
X2RwaS5jIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcGkuYwo+IGluZGV4IGViOTY5
YzVjNWMyZS4uNzYzYmZiNzAwMTM1IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRp
YXRlay9tdGtfZHBpLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RwaS5j
Cj4gQEAgLTcxLDYgKzcxLDcgQEAgc3RydWN0IG10a19kcGkgewo+ICAgCXZvaWQgX19pb21lbSAq
cmVnczsKPiAgIAlzdHJ1Y3QgZGV2aWNlICpkZXY7Cj4gICAJc3RydWN0IGNsayAqZW5naW5lX2Ns
azsKPiArCXN0cnVjdCBjbGsgKmRwaV9ja19jZzsKPiAgIAlzdHJ1Y3QgY2xrICpwaXhlbF9jbGs7
Cj4gICAJc3RydWN0IGNsayAqdHZkX2NsazsKPiAgIAlpbnQgaXJxOwo+IEBAIC0xMjYsNiArMTI3
LDcgQEAgc3RydWN0IG10a19kcGlfY29uZiB7Cj4gICAJY29uc3QgdTMyICpvdXRwdXRfZm10czsK
PiAgIAl1MzIgbnVtX291dHB1dF9mbXRzOwo+ICAgCWJvb2wgaXNfY2tfZGVfcG9sOwo+ICsJYm9v
bCBpc19kcGludGY7Cj4gICAJYm9vbCBzd2FwX2lucHV0X3N1cHBvcnQ7Cj4gICAJLyogTWFzayB1
c2VkIGZvciBIV0lEVEgsIEhQT1JDSCwgVlNZTkNfV0lEVEggYW5kIFZTWU5DX1BPUkNIIChubyBz
aGlmdCkgKi8KPiAgIAl1MzIgZGltZW5zaW9uX21hc2s7Cj4gQEAgLTQzOCw2ICs0NDAsOCBAQCBz
dGF0aWMgdm9pZCBtdGtfZHBpX3Bvd2VyX29mZihzdHJ1Y3QgbXRrX2RwaSAqZHBpKQo+ICAgCW10
a19kcGlfZGlzYWJsZShkcGkpOwo+ICAgCWNsa19kaXNhYmxlX3VucHJlcGFyZShkcGktPnBpeGVs
X2Nsayk7Cj4gICAJY2xrX2Rpc2FibGVfdW5wcmVwYXJlKGRwaS0+ZW5naW5lX2Nsayk7Cj4gKwlj
bGtfZGlzYWJsZV91bnByZXBhcmUoZHBpLT5kcGlfY2tfY2cpOwo+ICsJY2xrX2Rpc2FibGVfdW5w
cmVwYXJlKGRwaS0+dHZkX2Nsayk7Cj4gICB9Cj4gICAKPiAgIHN0YXRpYyBpbnQgbXRrX2RwaV9w
b3dlcl9vbihzdHJ1Y3QgbXRrX2RwaSAqZHBpKQo+IEBAIC00NDcsMTIgKzQ1MSwyNCBAQCBzdGF0
aWMgaW50IG10a19kcGlfcG93ZXJfb24oc3RydWN0IG10a19kcGkgKmRwaSkKPiAgIAlpZiAoKytk
cGktPnJlZmNvdW50ICE9IDEpCj4gICAJCXJldHVybiAwOwo+ICAgCgpIaSwKCmJlbHdvIHRoZSBl
cnJvciBoYW5kbGluZyBwYXRoIGxvb2tzIG9kZC4gKGJvdGggd2hlcmUgd2UgZ290bywgYW5kIHRo
ZSAKb3JkZXIgb2YgdGhlIGNsa19kaXNhYmxlX3VucHJlcGFyZSgpIGluIHRoZSBlcnJvciBoYW5k
bGluZyBwYXRoLgoKanVzdCBteSAyYywKCkNKCgo+ICsJcmV0ID0gY2xrX3ByZXBhcmVfZW5hYmxl
KGRwaS0+dHZkX2Nsayk7Cj4gKwlpZiAocmV0KSB7Cj4gKwkJZGV2X2VycihkcGktPmRldiwgIkZh
aWxlZCB0byBlbmFibGUgdHZkIHBsbDogJWRcbiIsIHJldCk7Cj4gKwkJZ290byBlcnJfcGl4ZWw7
Cj4gKwl9Cj4gKwo+ICAgCXJldCA9IGNsa19wcmVwYXJlX2VuYWJsZShkcGktPmVuZ2luZV9jbGsp
Owo+ICAgCWlmIChyZXQpIHsKPiAgIAkJZGV2X2VycihkcGktPmRldiwgIkZhaWxlZCB0byBlbmFi
bGUgZW5naW5lIGNsb2NrOiAlZFxuIiwgcmV0KTsKPiAgIAkJZ290byBlcnJfcmVmY291bnQ7Cj4g
ICAJfQo+ICAgCj4gKwlyZXQgPSBjbGtfcHJlcGFyZV9lbmFibGUoZHBpLT5kcGlfY2tfY2cpOwo+
ICsJaWYgKHJldCkgewo+ICsJCWRldl9lcnIoZHBpLT5kZXYsICJGYWlsZWQgdG8gZW5hYmxlIGRw
aV9ja19jZyBjbG9jazogJWRcbiIsIHJldCk7Cj4gKwkJZ290byBlcnJfY2tfY2c7Cj4gKwl9Cj4g
Kwo+ICAgCXJldCA9IGNsa19wcmVwYXJlX2VuYWJsZShkcGktPnBpeGVsX2Nsayk7Cj4gICAJaWYg
KHJldCkgewo+ICAgCQlkZXZfZXJyKGRwaS0+ZGV2LCAiRmFpbGVkIHRvIGVuYWJsZSBwaXhlbCBj
bG9jazogJWRcbiIsIHJldCk7Cj4gQEAgLTQ2Niw2ICs0ODIsOCBAQCBzdGF0aWMgaW50IG10a19k
cGlfcG93ZXJfb24oc3RydWN0IG10a19kcGkgKmRwaSkKPiAgIAlyZXR1cm4gMDsKPiAgIAo+ICAg
ZXJyX3BpeGVsOgo+ICsJY2xrX2Rpc2FibGVfdW5wcmVwYXJlKGRwaS0+ZHBpX2NrX2NnKTsKPiAr
ZXJyX2NrX2NnOgo+ICAgCWNsa19kaXNhYmxlX3VucHJlcGFyZShkcGktPmVuZ2luZV9jbGspOwo+
ICAgZXJyX3JlZmNvdW50Ogo+ICAgCWRwaS0+cmVmY291bnQtLTsKClsuLi5dCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWls
aW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
