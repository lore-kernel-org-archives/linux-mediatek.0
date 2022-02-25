Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 914A0C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Feb 2022 10:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1wECG7weCLUhf7Ld2FyH8+oBWV/rCO05Vi+nb8abVHk=; b=QbPpVVXmovNnSj
	wchpOYXClxEZKP23KXPAKpPtvDfF14Obfza8C4ngZ+GnpXTtdGSvVm9uoc5DhwZrK4QdRzTdCrHoH
	5shzXjrLdYhFRrSzkTOe418rw4gMJO2gBxi9uq+8brivP7zCZXj9QYg5OID5a07k+q3S5C7t6oF+c
	QuKrOoTb4YdMT5L7RMY622GmP/AHolr8Bq3jpk8xd+jNzBk6sLfFCtUVvV5v+QxN8YoT8MBdFkGM0
	TeZwUpymgXwVXT3yYR/KFTjg6hIYa2hiA/vTLTx4c9xF3Dc4SvdDjI8rL5mMgwdzKYu4lKFuBsec2
	VqGswtcvMDkJpBCUoLRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNYGu-004ZYA-Lw; Fri, 25 Feb 2022 10:56:24 +0000
Received: from mail-oo1-xc30.google.com ([2607:f8b0:4864:20::c30])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNYGF-004ZCd-FI
 for linux-mediatek@lists.infradead.org; Fri, 25 Feb 2022 10:55:45 +0000
Received: by mail-oo1-xc30.google.com with SMTP id
 k13-20020a4a948d000000b003172f2f6bdfso5778357ooi.1
 for <linux-mediatek@lists.infradead.org>; Fri, 25 Feb 2022 02:55:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc:content-transfer-encoding;
 bh=kysMFOh8+xcDGXHPPVRwQiPaslPV5k2XuSftAh0IGXM=;
 b=PfiEhsRzmUlc1wRl7CP4cP59K9Lm7uNP+Beg+DIjXFCoCXFJ6hYi3zhDk33axm8PI7
 OX61MA/O4DZS/HoW6kOxIWkvBiMuwlsca/oj02T1KYHGmh7HU8j8l2wGRgmnrZyMrQLS
 kXxVXXDFw3y+zQ+iN14/BLSQrgMsQfSFvHpmNWi95tMVAQyK7aoxcrrPGVyot4GcrsHL
 HqOYh5V6/opTiE2A3eCCw6smo2gMJjIk+78lXh+jd0q4r6SgMWNjwP3t9C0e2BnAVkbd
 NezHGnBxkQSrkIL3dcWMZI3u7OAGkRKDtJNnWZ8R9MWQw71qfg1N3irCviYM2WYS1oUs
 FWuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc:content-transfer-encoding;
 bh=kysMFOh8+xcDGXHPPVRwQiPaslPV5k2XuSftAh0IGXM=;
 b=5wgRPOD7/2roUy1iy2Fcum8teeqe5fg6MP5ajPpTYqtaACHj1ESWC7fWo6jogAO6Jn
 03XwX0UgRtOcJRJmcWMawME2uM79MD9I8vRelulHR5LztOgvg4bGnTvb21xFq8Uw2gmL
 FKrGdDXoXRklWWkHA6M3SdFnsimxHDOoE9KAuIfwYTq3GsSTbulMD0w7dZpJu2VNX1a2
 QKKxJRXZNBPOIw0ZJ8lP9KtcLdjIAhFCq8wSEOeUQNA5zQrRbzzdYmFTjVuxU31C3q60
 oQenyhocMZjgkMrtXxbyCUjYEoH56JnBGqhBnCLMvzgB96JX/I7z2sENET0ows/FGqvH
 cxQg==
X-Gm-Message-State: AOAM5333dEP4xJsDScifYsKWbVY7OipXSCpEMdbBu0tWqj1QdKk9Wuih
 4LkN7QlfNcLHAlGUJC55nazGT4T8NeVh+Rzi2mZiuw==
X-Google-Smtp-Source: ABdhPJyj6wu6NzHc7L+z5p9txi1s1uYfQozYWTw3yryTNIRQzg7lTSsRCXyXFdJgD2WTiJR3FSSONQVrrSY9I5VWBm8=
X-Received: by 2002:a4a:4112:0:b0:319:3eb2:11b with SMTP id
 x18-20020a4a4112000000b003193eb2011bmr2462193ooa.40.1645786542268; Fri, 25
 Feb 2022 02:55:42 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 25 Feb 2022 02:55:41 -0800
MIME-Version: 1.0
In-Reply-To: <CAAOTY_-5g4fXVTOETDxbn2Cp3MVjFs-Sh9NT1NepfEXUhdJQEw@mail.gmail.com>
References: <20220218145437.18563-1-granquet@baylibre.com>
 <20220218145437.18563-8-granquet@baylibre.com>
 <CAAOTY_-5g4fXVTOETDxbn2Cp3MVjFs-Sh9NT1NepfEXUhdJQEw@mail.gmail.com>
From: Guillaume Ranquet <granquet@baylibre.com>
User-Agent: alot/0.10
Date: Fri, 25 Feb 2022 02:55:41 -0800
Message-ID: <CABnWg9vOOcKsGqjZmakX3XrMhHcj5r23AUs77EnLR+xuw0Cg3g@mail.gmail.com>
Subject: Re: [PATCH v8 07/19] drm/mediatek: dpi: implement a swap_input toggle
 in board config
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, 
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>, 
 deller@gmx.de, CK Hu <ck.hu@mediatek.com>, Jitao Shi <jitao.shi@mediatek.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 DRI Development <dri-devel@lists.freedesktop.org>, 
 "ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 DTML <devicetree@vger.kernel.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-phy@lists.infradead.org,
 linux-fbdev@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220225_025543_537900_C5C9930F 
X-CRM114-Status: GOOD (  16.76  )
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

UXVvdGluZyBDaHVuLUt1YW5nIEh1ICgyMDIyLTAyLTIxIDAzOjMyOjMyKQo+IEhpLCBHdWlsbGF1
bWU6Cj4KPiBHdWlsbGF1bWUgUmFucXVldCA8Z3JhbnF1ZXRAYmF5bGlicmUuY29tPiDmlrwgMjAy
MuW5tDLmnIgxOOaXpSDpgLHkupQg5LiL5Y2IMTA6NTblr6vpgZPvvJoKPiA+Cj4gPiBBZGRzIGEg
Yml0IG9mIGZsZXhpYmlsaXR5IHRvIHN1cHBvcnQgYm9hcmRzIHdpdGhvdXQgc3dhcF9pbnB1dCBz
dXBwb3J0Cj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogR3VpbGxhdW1lIFJhbnF1ZXQgPGdyYW5xdWV0
QGJheWxpYnJlLmNvbT4KPiA+IC0tLQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtf
ZHBpLmMgfCAxNCArKysrKysrKysrKy0tLQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxMSBpbnNlcnRp
b25zKCspLCAzIGRlbGV0aW9ucygtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vbWVkaWF0ZWsvbXRrX2RwaS5jIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcGku
Ywo+ID4gaW5kZXggNTQ1YTEzMzdjYzg5OS4uNDU0Zjg1NjNlZmFlNCAxMDA2NDQKPiA+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHBpLmMKPiA+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS9tZWRpYXRlay9tdGtfZHBpLmMKPiA+IEBAIC0xMjYsNiArMTI2LDcgQEAgc3RydWN0IG10
a19kcGlfY29uZiB7Cj4gPiAgICAgICAgIGNvbnN0IHUzMiAqb3V0cHV0X2ZtdHM7Cj4gPiAgICAg
ICAgIHUzMiBudW1fb3V0cHV0X2ZtdHM7Cj4gPiAgICAgICAgIGJvb2wgaXNfY2tfZGVfcG9sOwo+
ID4gKyAgICAgICBib29sIHN3YXBfaW5wdXRfc3VwcG9ydDsKPiA+ICAgICAgICAgY29uc3Qgc3Ry
dWN0IG10a19kcGlfeWNfbGltaXQgKmxpbWl0Owo+ID4gIH07Cj4gPgo+ID4gQEAgLTM3OCwxOCAr
Mzc5LDIxIEBAIHN0YXRpYyB2b2lkIG10a19kcGlfY29uZmlnX2NvbG9yX2Zvcm1hdChzdHJ1Y3Qg
bXRrX2RwaSAqZHBpLAo+ID4gICAgICAgICAgICAgKGZvcm1hdCA9PSBNVEtfRFBJX0NPTE9SX0ZP
Uk1BVF9ZQ0JDUl80NDRfRlVMTCkpIHsKPiA+ICAgICAgICAgICAgICAgICBtdGtfZHBpX2NvbmZp
Z195dXY0MjJfZW5hYmxlKGRwaSwgZmFsc2UpOwo+ID4gICAgICAgICAgICAgICAgIG10a19kcGlf
Y29uZmlnX2NzY19lbmFibGUoZHBpLCB0cnVlKTsKPiA+IC0gICAgICAgICAgICAgICBtdGtfZHBp
X2NvbmZpZ19zd2FwX2lucHV0KGRwaSwgZmFsc2UpOwo+ID4gKyAgICAgICAgICAgICAgIGlmIChk
cGktPmNvbmYtPnN3YXBfaW5wdXRfc3VwcG9ydCkKPiA+ICsgICAgICAgICAgICAgICAgICAgICAg
IG10a19kcGlfY29uZmlnX3N3YXBfaW5wdXQoZHBpLCBmYWxzZSk7Cj4gPiAgICAgICAgICAgICAg
ICAgbXRrX2RwaV9jb25maWdfY2hhbm5lbF9zd2FwKGRwaSwgTVRLX0RQSV9PVVRfQ0hBTk5FTF9T
V0FQX0JHUik7Cj4gPiAgICAgICAgIH0gZWxzZSBpZiAoKGZvcm1hdCA9PSBNVEtfRFBJX0NPTE9S
X0ZPUk1BVF9ZQ0JDUl80MjIpIHx8Cj4gPiAgICAgICAgICAgICAgICAgICAgKGZvcm1hdCA9PSBN
VEtfRFBJX0NPTE9SX0ZPUk1BVF9ZQ0JDUl80MjJfRlVMTCkpIHsKPiA+ICAgICAgICAgICAgICAg
ICBtdGtfZHBpX2NvbmZpZ195dXY0MjJfZW5hYmxlKGRwaSwgdHJ1ZSk7Cj4gPiAgICAgICAgICAg
ICAgICAgbXRrX2RwaV9jb25maWdfY3NjX2VuYWJsZShkcGksIHRydWUpOwo+ID4gLSAgICAgICAg
ICAgICAgIG10a19kcGlfY29uZmlnX3N3YXBfaW5wdXQoZHBpLCB0cnVlKTsKPiA+ICsgICAgICAg
ICAgICAgICBpZiAoZHBpLT5jb25mLT5zd2FwX2lucHV0X3N1cHBvcnQpCj4gPiArICAgICAgICAg
ICAgICAgICAgICAgICBtdGtfZHBpX2NvbmZpZ19zd2FwX2lucHV0KGRwaSwgdHJ1ZSk7Cj4KPiBJ
biBNVDgxNzMsIE1UMjcwMSwgTVQ4MTgzLCBNVDgxOTIsIFlDQkNSXzQ0NCB3b3VsZCBub3Qgc3dh
cCBidXQKPiBZQ0JDUl80MjIgd291bGQgc3dhcC4gQnV0IEluIE1UODE5NSwgYm90aCBZQ0JDUl80
NDQgYW5kIFlDQkNSXzQyMgo+IHdvdWxkIG5vdCBzd2FwLCBTbyBJIHRoaW5rIG9uZSBvZiB0aGVz
ZSBmb3JtYXQgd291bGQgYmUgYWJub3JtYWwgaW4KPiBNVDgxOTUsIHJpZ2h0PyBPciB3b3VsZCB5
b3UgcHJvdmlkZSBtb3JlIGluZm9ybWF0aW9uIGFib3V0IGhvdyB0aGlzCj4gc3dhcCB3b3JrPwo+
Cj4gUmVnYXJkcywKPiBDaHVuLUt1YW5nLgo+CgpJJ20gbm90IHN1cmUgSSBoYXZlIGFjY2VzcyB0
byB0aGF0IGxldmVsIG9mIGluZm9ybWF0aW9uLi4uIGFuZCBteQprbm93bGVkZ2Ugb24gbWVkaWF0
ZWsKU29DIGlzIHJhdGhlciBsaW1pdGVkLCBJIHdpbGwgY2lyY2xlIGJhY2sgd2l0aCBtZWRpYXRl
ayBlbmdpbmVlcnMgdG8KaGF2ZSBhIGRlZmluaXRlCmFuc3dlci4KClRoeCwKR3VpbGxhdW1lCj4g
PiAgICAgICAgICAgICAgICAgbXRrX2RwaV9jb25maWdfY2hhbm5lbF9zd2FwKGRwaSwgTVRLX0RQ
SV9PVVRfQ0hBTk5FTF9TV0FQX1JHQik7Cj4gPiAgICAgICAgIH0gZWxzZSB7Cj4gPiAgICAgICAg
ICAgICAgICAgbXRrX2RwaV9jb25maWdfeXV2NDIyX2VuYWJsZShkcGksIGZhbHNlKTsKPiA+ICAg
ICAgICAgICAgICAgICBtdGtfZHBpX2NvbmZpZ19jc2NfZW5hYmxlKGRwaSwgZmFsc2UpOwo+ID4g
LSAgICAgICAgICAgICAgIG10a19kcGlfY29uZmlnX3N3YXBfaW5wdXQoZHBpLCBmYWxzZSk7Cj4g
PiArICAgICAgICAgICAgICAgaWYgKGRwaS0+Y29uZi0+c3dhcF9pbnB1dF9zdXBwb3J0KQo+ID4g
KyAgICAgICAgICAgICAgICAgICAgICAgbXRrX2RwaV9jb25maWdfc3dhcF9pbnB1dChkcGksIGZh
bHNlKTsKPiA+ICAgICAgICAgICAgICAgICBtdGtfZHBpX2NvbmZpZ19jaGFubmVsX3N3YXAoZHBp
LCBNVEtfRFBJX09VVF9DSEFOTkVMX1NXQVBfUkdCKTsKPiA+ICAgICAgICAgfQo+ID4gIH0KPiA+
IEBAIC04MDgsNiArODEyLDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBtdGtfZHBpX2NvbmYgbXQ4
MTczX2NvbmYgPSB7Cj4gPiAgICAgICAgIC5vdXRwdXRfZm10cyA9IG10ODE3M19vdXRwdXRfZm10
cywKPiA+ICAgICAgICAgLm51bV9vdXRwdXRfZm10cyA9IEFSUkFZX1NJWkUobXQ4MTczX291dHB1
dF9mbXRzKSwKPiA+ICAgICAgICAgLmlzX2NrX2RlX3BvbCA9IHRydWUsCj4gPiArICAgICAgIC5z
d2FwX2lucHV0X3N1cHBvcnQgPSB0cnVlLAo+ID4gICAgICAgICAubGltaXQgPSAmbXRrX2RwaV9s
aW1pdCwKPiA+ICB9Owo+ID4KPiA+IEBAIC04MTksNiArODI0LDcgQEAgc3RhdGljIGNvbnN0IHN0
cnVjdCBtdGtfZHBpX2NvbmYgbXQyNzAxX2NvbmYgPSB7Cj4gPiAgICAgICAgIC5vdXRwdXRfZm10
cyA9IG10ODE3M19vdXRwdXRfZm10cywKPiA+ICAgICAgICAgLm51bV9vdXRwdXRfZm10cyA9IEFS
UkFZX1NJWkUobXQ4MTczX291dHB1dF9mbXRzKSwKPiA+ICAgICAgICAgLmlzX2NrX2RlX3BvbCA9
IHRydWUsCj4gPiArICAgICAgIC5zd2FwX2lucHV0X3N1cHBvcnQgPSB0cnVlLAo+ID4gICAgICAg
ICAubGltaXQgPSAmbXRrX2RwaV9saW1pdCwKPiA+ICB9Owo+ID4KPiA+IEBAIC04MjksNiArODM1
LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBtdGtfZHBpX2NvbmYgbXQ4MTgzX2NvbmYgPSB7Cj4g
PiAgICAgICAgIC5vdXRwdXRfZm10cyA9IG10ODE4M19vdXRwdXRfZm10cywKPiA+ICAgICAgICAg
Lm51bV9vdXRwdXRfZm10cyA9IEFSUkFZX1NJWkUobXQ4MTgzX291dHB1dF9mbXRzKSwKPiA+ICAg
ICAgICAgLmlzX2NrX2RlX3BvbCA9IHRydWUsCj4gPiArICAgICAgIC5zd2FwX2lucHV0X3N1cHBv
cnQgPSB0cnVlLAo+ID4gICAgICAgICAubGltaXQgPSAmbXRrX2RwaV9saW1pdCwKPiA+ICB9Owo+
ID4KPiA+IEBAIC04MzksNiArODQ2LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBtdGtfZHBpX2Nv
bmYgbXQ4MTkyX2NvbmYgPSB7Cj4gPiAgICAgICAgIC5vdXRwdXRfZm10cyA9IG10ODE3M19vdXRw
dXRfZm10cywKPiA+ICAgICAgICAgLm51bV9vdXRwdXRfZm10cyA9IEFSUkFZX1NJWkUobXQ4MTcz
X291dHB1dF9mbXRzKSwKPiA+ICAgICAgICAgLmlzX2NrX2RlX3BvbCA9IHRydWUsCj4gPiArICAg
ICAgIC5zd2FwX2lucHV0X3N1cHBvcnQgPSB0cnVlLAo+ID4gICAgICAgICAubGltaXQgPSAmbXRr
X2RwaV9saW1pdCwKPiA+ICB9Owo+ID4KPiA+IC0tCj4gPiAyLjM0LjEKPiA+CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWls
aW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
