Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFE94C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Feb 2022 02:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ASOGNe+dTdwP+Y28jYTZEBUIptdcbiQP2rR2XNpnUck=; b=4LH57iMaalkzhM
	27wR1lkwZ9ruzOMdNBCG8Rfa81QaDuDXO6YrDWDNcN9LGPj7mTLez2EYHGz+npwkjubiCcNJOEqNY
	FkRBU4enRU4/ey1c9NY1/KSCaFNICzrOTgwnwk5O09aUS13nA/DAJuJa1xBzY5rBCBeg5yJ6AaxUE
	MxfpBntiozMA+DWjxEKmzE+xWclllpRbIHhoN/h0Dp0CfdjpuJQgHo/fLDy/OHakaCiSmVpaXkd7o
	BH1T9milVFOePIGpWXCn5Yh4RfWsdFj7Sb+I18vBAaA9IvEnKNffNMQCummlcko+oGBACtzL1gCjS
	H7cp1NAEfHbumu/TvqRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nLydO-0035Be-1C; Mon, 21 Feb 2022 02:41:06 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nLyd8-00356v-GB; Mon, 21 Feb 2022 02:40:52 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0030761073;
 Mon, 21 Feb 2022 02:40:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55E7EC340F1;
 Mon, 21 Feb 2022 02:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645411249;
 bh=bFvQNAVbGlS7Vkgnjf6TBiEr7ZXdUWSxzalTjblThqE=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=iOYpZ2RVDoZAyMqglzcqxB77Kn23NhumIkrWlWsgMLG7zA8Q2HUuKaf0ipbHD0CGd
 vV0i0mCqfEjrzAVlC/+8zFYxsxpJSNZ0zn71+DkAWdJ7Q0vAZnpeEE9sg8BW+5XWQ9
 amaKz06WAgN7qj1LrM4IcCudViHKWnOtzX6hXsGSbfQRMztAQgeYeN/ESpG0sigFCi
 /ttN43FUaa3fLNP/lBM7feYg7oBzFY2k+vBFLYr4EdK/kRa41WJQJEbmO6ncLEi54H
 ATPW7yxxPVIJZ7pKwL+xoIQHtN8M0MjlVgJjCxlcj5/J5CP0XGsiHhzIEVT3m2PlLo
 zOCTIgkiWe+og==
Received: by mail-ej1-f53.google.com with SMTP id qk11so29381083ejb.2;
 Sun, 20 Feb 2022 18:40:49 -0800 (PST)
X-Gm-Message-State: AOAM531qD9jURiERp02ziZEJ/chqjWuu+3ooHE6dm5lcw4ZszVEGQH4d
 2bbFr9nJUtlqYQJHxomCCWwoElQ9ppKhRcMqww==
X-Google-Smtp-Source: ABdhPJxIHE/AHCRll/nSdxrQ+Ux5BiWkeUzMrG89lMATKPsbYYOa8h8y1euGyif6EtqH2TYXRNJ80g4ZoB5oWBNlWs8=
X-Received: by 2002:a17:907:a06c:b0:6c9:408e:cec with SMTP id
 ia12-20020a170907a06c00b006c9408e0cecmr13894591ejc.510.1645411247627; Sun, 20
 Feb 2022 18:40:47 -0800 (PST)
MIME-Version: 1.0
References: <20220218145437.18563-1-granquet@baylibre.com>
 <20220218145437.18563-9-granquet@baylibre.com>
In-Reply-To: <20220218145437.18563-9-granquet@baylibre.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 21 Feb 2022 10:40:35 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8V91XH4sKeRfSz6hRPhXm15GBkQ76LWtfBBU5cAtWMqA@mail.gmail.com>
Message-ID: <CAAOTY_8V91XH4sKeRfSz6hRPhXm15GBkQ76LWtfBBU5cAtWMqA@mail.gmail.com>
Subject: Re: [PATCH v8 08/19] drm/mediatek: dpi: move dimension mask to board
 config
To: Guillaume Ranquet <granquet@baylibre.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>, 
 deller@gmx.de, CK Hu <ck.hu@mediatek.com>, Jitao Shi <jitao.shi@mediatek.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 DRI Development <dri-devel@lists.freedesktop.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 DTML <devicetree@vger.kernel.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-phy@lists.infradead.org,
 linux-fbdev@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220220_184050_646832_FFEE8539 
X-CRM114-Status: GOOD (  15.72  )
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

SEksIEd1aWxsYXVtZToKCkd1aWxsYXVtZSBSYW5xdWV0IDxncmFucXVldEBiYXlsaWJyZS5jb20+
IOaWvCAyMDIy5bm0MuaciDE45pelIOmAseS6lCDkuIvljYgxMDo1NuWvq+mBk++8mgo+Cj4gQWRk
IGZsZXhpYmlsaXR5IGJ5IG1vdmluZyB0aGUgZGltZW5zaW9uIG1hc2sgdG8gdGhlIGJvYXJkIGNv
bmZpZwoKQWZ0ZXIgY2hhbmdlICdib2FyZCcgdG8gJ1NvQycsCgpSZXZpZXdlZC1ieTogQ2h1bi1L
dWFuZyBIdSA8Y2h1bmt1YW5nLmh1QGtlcm5lbC5vcmc+Cgo+Cj4gU2lnbmVkLW9mZi1ieTogR3Vp
bGxhdW1lIFJhbnF1ZXQgPGdyYW5xdWV0QGJheWxpYnJlLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9n
cHUvZHJtL21lZGlhdGVrL210a19kcGkuYyB8IDI2ICsrKysrKysrKysrKysrKystLS0tLS0tLS0t
Cj4gIDEgZmlsZSBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspLCAxMCBkZWxldGlvbnMoLSkKPgo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RwaS5jIGIvZHJpdmVy
cy9ncHUvZHJtL21lZGlhdGVrL210a19kcGkuYwo+IGluZGV4IDQ1NGY4NTYzZWZhZTQuLjhjYTM0
NTVlZDY0ZWUgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcGku
Ywo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHBpLmMKPiBAQCAtMTI3LDYg
KzEyNyw4IEBAIHN0cnVjdCBtdGtfZHBpX2NvbmYgewo+ICAgICAgICAgdTMyIG51bV9vdXRwdXRf
Zm10czsKPiAgICAgICAgIGJvb2wgaXNfY2tfZGVfcG9sOwo+ICAgICAgICAgYm9vbCBzd2FwX2lu
cHV0X3N1cHBvcnQ7Cj4gKyAgICAgICAvLyBNYXNrIHVzZWQgZm9yIEhXSURUSCwgSFBPUkNILCBW
U1lOQ19XSURUSCBhbmQgVlNZTkNfUE9SQ0ggKG5vIHNoaWZ0KQo+ICsgICAgICAgdTMyIGRpbWVu
c2lvbl9tYXNrOwo+ICAgICAgICAgY29uc3Qgc3RydWN0IG10a19kcGlfeWNfbGltaXQgKmxpbWl0
Owo+ICB9Owo+Cj4gQEAgLTE1NiwzMCArMTU4LDMwIEBAIHN0YXRpYyB2b2lkIG10a19kcGlfZGlz
YWJsZShzdHJ1Y3QgbXRrX2RwaSAqZHBpKQo+ICBzdGF0aWMgdm9pZCBtdGtfZHBpX2NvbmZpZ19o
c3luYyhzdHJ1Y3QgbXRrX2RwaSAqZHBpLAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHN0cnVjdCBtdGtfZHBpX3N5bmNfcGFyYW0gKnN5bmMpCj4gIHsKPiAtICAgICAgIG10a19k
cGlfbWFzayhkcGksIERQSV9UR0VOX0hXSURUSCwKPiAtICAgICAgICAgICAgICAgICAgICBzeW5j
LT5zeW5jX3dpZHRoIDw8IEhQVywgSFBXX01BU0spOwo+IC0gICAgICAgbXRrX2RwaV9tYXNrKGRw
aSwgRFBJX1RHRU5fSFBPUkNILAo+IC0gICAgICAgICAgICAgICAgICAgIHN5bmMtPmJhY2tfcG9y
Y2ggPDwgSEJQLCBIQlBfTUFTSyk7Cj4gKyAgICAgICBtdGtfZHBpX21hc2soZHBpLCBEUElfVEdF
Tl9IV0lEVEgsIHN5bmMtPnN5bmNfd2lkdGggPDwgSFBXLAo+ICsgICAgICAgICAgICAgICAgICAg
IGRwaS0+Y29uZi0+ZGltZW5zaW9uX21hc2sgPDwgSFBXKTsKPiArICAgICAgIG10a19kcGlfbWFz
ayhkcGksIERQSV9UR0VOX0hQT1JDSCwgc3luYy0+YmFja19wb3JjaCA8PCBIQlAsCj4gKyAgICAg
ICAgICAgICAgICAgICAgZHBpLT5jb25mLT5kaW1lbnNpb25fbWFzayA8PCBIQlApOwo+ICAgICAg
ICAgbXRrX2RwaV9tYXNrKGRwaSwgRFBJX1RHRU5fSFBPUkNILCBzeW5jLT5mcm9udF9wb3JjaCA8
PCBIRlAsCj4gLSAgICAgICAgICAgICAgICAgICAgSEZQX01BU0spOwo+ICsgICAgICAgICAgICAg
ICAgICAgIGRwaS0+Y29uZi0+ZGltZW5zaW9uX21hc2sgPDwgSEZQKTsKPiAgfQo+Cj4gIHN0YXRp
YyB2b2lkIG10a19kcGlfY29uZmlnX3ZzeW5jKHN0cnVjdCBtdGtfZHBpICpkcGksCj4gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IG10a19kcGlfc3luY19wYXJhbSAqc3lu
YywKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1MzIgd2lkdGhfYWRkciwgdTMy
IHBvcmNoX2FkZHIpCj4gIHsKPiAtICAgICAgIG10a19kcGlfbWFzayhkcGksIHdpZHRoX2FkZHIs
Cj4gLSAgICAgICAgICAgICAgICAgICAgc3luYy0+c3luY193aWR0aCA8PCBWU1lOQ19XSURUSF9T
SElGVCwKPiAtICAgICAgICAgICAgICAgICAgICBWU1lOQ19XSURUSF9NQVNLKTsKPiAgICAgICAg
IG10a19kcGlfbWFzayhkcGksIHdpZHRoX2FkZHIsCj4gICAgICAgICAgICAgICAgICAgICAgc3lu
Yy0+c2hpZnRfaGFsZl9saW5lIDw8IFZTWU5DX0hBTEZfTElORV9TSElGVCwKPiAgICAgICAgICAg
ICAgICAgICAgICBWU1lOQ19IQUxGX0xJTkVfTUFTSyk7Cj4gKyAgICAgICBtdGtfZHBpX21hc2so
ZHBpLCB3aWR0aF9hZGRyLAo+ICsgICAgICAgICAgICAgICAgICAgIHN5bmMtPnN5bmNfd2lkdGgg
PDwgVlNZTkNfV0lEVEhfU0hJRlQsCj4gKyAgICAgICAgICAgICAgICAgICAgZHBpLT5jb25mLT5k
aW1lbnNpb25fbWFzayA8PCBWU1lOQ19XSURUSF9TSElGVCk7Cj4gICAgICAgICBtdGtfZHBpX21h
c2soZHBpLCBwb3JjaF9hZGRyLAo+ICAgICAgICAgICAgICAgICAgICAgIHN5bmMtPmJhY2tfcG9y
Y2ggPDwgVlNZTkNfQkFDS19QT1JDSF9TSElGVCwKPiAtICAgICAgICAgICAgICAgICAgICBWU1lO
Q19CQUNLX1BPUkNIX01BU0spOwo+ICsgICAgICAgICAgICAgICAgICAgIGRwaS0+Y29uZi0+ZGlt
ZW5zaW9uX21hc2sgPDwgVlNZTkNfQkFDS19QT1JDSF9TSElGVCk7Cj4gICAgICAgICBtdGtfZHBp
X21hc2soZHBpLCBwb3JjaF9hZGRyLAo+ICAgICAgICAgICAgICAgICAgICAgIHN5bmMtPmZyb250
X3BvcmNoIDw8IFZTWU5DX0ZST05UX1BPUkNIX1NISUZULAo+IC0gICAgICAgICAgICAgICAgICAg
IFZTWU5DX0ZST05UX1BPUkNIX01BU0spOwo+ICsgICAgICAgICAgICAgICAgICAgIGRwaS0+Y29u
Zi0+ZGltZW5zaW9uX21hc2sgPDwgVlNZTkNfRlJPTlRfUE9SQ0hfU0hJRlQpOwo+ICB9Cj4KPiAg
c3RhdGljIHZvaWQgbXRrX2RwaV9jb25maWdfdnN5bmNfbG9kZChzdHJ1Y3QgbXRrX2RwaSAqZHBp
LAo+IEBAIC04MTMsNiArODE1LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBtdGtfZHBpX2NvbmYg
bXQ4MTczX2NvbmYgPSB7Cj4gICAgICAgICAubnVtX291dHB1dF9mbXRzID0gQVJSQVlfU0laRSht
dDgxNzNfb3V0cHV0X2ZtdHMpLAo+ICAgICAgICAgLmlzX2NrX2RlX3BvbCA9IHRydWUsCj4gICAg
ICAgICAuc3dhcF9pbnB1dF9zdXBwb3J0ID0gdHJ1ZSwKPiArICAgICAgIC5kaW1lbnNpb25fbWFz
ayA9IEhQV19NQVNLLAo+ICAgICAgICAgLmxpbWl0ID0gJm10a19kcGlfbGltaXQsCj4gIH07Cj4K
PiBAQCAtODI1LDYgKzgyOCw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgbXRrX2RwaV9jb25mIG10
MjcwMV9jb25mID0gewo+ICAgICAgICAgLm51bV9vdXRwdXRfZm10cyA9IEFSUkFZX1NJWkUobXQ4
MTczX291dHB1dF9mbXRzKSwKPiAgICAgICAgIC5pc19ja19kZV9wb2wgPSB0cnVlLAo+ICAgICAg
ICAgLnN3YXBfaW5wdXRfc3VwcG9ydCA9IHRydWUsCj4gKyAgICAgICAuZGltZW5zaW9uX21hc2sg
PSBIUFdfTUFTSywKPiAgICAgICAgIC5saW1pdCA9ICZtdGtfZHBpX2xpbWl0LAo+ICB9Owo+Cj4g
QEAgLTgzNiw2ICs4NDAsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IG10a19kcGlfY29uZiBtdDgx
ODNfY29uZiA9IHsKPiAgICAgICAgIC5udW1fb3V0cHV0X2ZtdHMgPSBBUlJBWV9TSVpFKG10ODE4
M19vdXRwdXRfZm10cyksCj4gICAgICAgICAuaXNfY2tfZGVfcG9sID0gdHJ1ZSwKPiAgICAgICAg
IC5zd2FwX2lucHV0X3N1cHBvcnQgPSB0cnVlLAo+ICsgICAgICAgLmRpbWVuc2lvbl9tYXNrID0g
SFBXX01BU0ssCj4gICAgICAgICAubGltaXQgPSAmbXRrX2RwaV9saW1pdCwKPiAgfTsKPgo+IEBA
IC04NDcsNiArODUyLDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBtdGtfZHBpX2NvbmYgbXQ4MTky
X2NvbmYgPSB7Cj4gICAgICAgICAubnVtX291dHB1dF9mbXRzID0gQVJSQVlfU0laRShtdDgxNzNf
b3V0cHV0X2ZtdHMpLAo+ICAgICAgICAgLmlzX2NrX2RlX3BvbCA9IHRydWUsCj4gICAgICAgICAu
c3dhcF9pbnB1dF9zdXBwb3J0ID0gdHJ1ZSwKPiArICAgICAgIC5kaW1lbnNpb25fbWFzayA9IEhQ
V19NQVNLLAo+ICAgICAgICAgLmxpbWl0ID0gJm10a19kcGlfbGltaXQsCj4gIH07Cj4KPiAtLQo+
IDIuMzQuMQo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LW1lZGlhdGVrCg==
