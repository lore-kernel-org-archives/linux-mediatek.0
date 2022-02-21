Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66679C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Feb 2022 03:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f5JxRd5uMXwegYmdiRIZJ6kEXZrOI5GEmN9qZcrQGfw=; b=jd6n/VComV/XjL
	BBplW4ZfK70QZChha1FNOSGo51O4NZkEv1tqZc9IZMvxFQqTIDMKJfOOHMuxZr5M0mVwyul9gDIsP
	CZFpnXyotaGek7anZmoCygASP0pPqc/A2oPIbD7V6BOZ3P4bXb0Ydp1atK9IXroYjNIDFEvIyda8Z
	HgCeZKDRfUSJA1YkfUlMZdkSmG8UabPSvJtF9qUrGnJ2A48kPjnwnrlwW/mqumo0JW/l0xreWMGlo
	XGFVTyzcEaklnqwcboMJRvGCyX4khud3HY3G0aLyami3oikr+yh8D/gO4dj5TKqlAeHpZ9MDq+UhM
	9JnS9GGRApOBSek23atQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nLzR1-003D5g-Gi; Mon, 21 Feb 2022 03:32:23 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nLzQo-003D2y-Q9; Mon, 21 Feb 2022 03:32:13 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 516DBB80E59;
 Mon, 21 Feb 2022 03:32:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAD43C340EB;
 Mon, 21 Feb 2022 03:32:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645414328;
 bh=sVhTO4V/J+PBVK3PUU1n0L77FQqMLHWUGIXArEdj6Hk=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=GrD9MsKVlxEEDL6YmRcPwp1WtAR+T+rIyZTHF1CRY04eR8LXrlB02NUF1pXyWeva9
 5+bPDk8Htz7TGyTF7naW6y4YY2ps5lVMosh+PciDL4VwstgIuZ0pS/jSQg+hZ5ETIV
 jfqps4qQfhS0yU5TWm2boGxpRb7r0bGlWoyh2dRBZ1aoug6LKaQaw0O4wdHkImTsKV
 BCL9C0GqgFKiiQZZNd1mChx/AIRVKvbf4J41AcePt+JyjjXTib+HG6tfJTR/r8+Zm/
 q8rk62pXdWamoXkxXrqpN3yoLnEf07KXBg1tngNh0qY0ooeVXirAo/SC+dm4/bKk6C
 o4Py35ISBI++w==
Received: by mail-ej1-f49.google.com with SMTP id p14so29495237ejf.11;
 Sun, 20 Feb 2022 19:32:07 -0800 (PST)
X-Gm-Message-State: AOAM533lo6uncHddPMesfZumBTVNkBTfD7vU1VRq8tNefVPNYr0URQ+8
 CIb0F0H693DQ0Z73A718YJLWP7/7/xF6Jq4OMQ==
X-Google-Smtp-Source: ABdhPJxfxo0hzxeTqTccLlT0ltYFEr2mGzS6xuefZo7jwVZH88S6M6qDz0iPDAFl7ugWQnJtM4+isexDKT36CBTSYE8=
X-Received: by 2002:a17:906:2a11:b0:69f:286a:66a7 with SMTP id
 j17-20020a1709062a1100b0069f286a66a7mr14319822eje.680.1645414326327; Sun, 20
 Feb 2022 19:32:06 -0800 (PST)
MIME-Version: 1.0
References: <20220218145437.18563-1-granquet@baylibre.com>
 <20220218145437.18563-12-granquet@baylibre.com>
In-Reply-To: <20220218145437.18563-12-granquet@baylibre.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 21 Feb 2022 11:31:54 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-Bqo+1JoVJdk7eUEoW3B4ZKhzhuvFEqxxGxweQkQBbKA@mail.gmail.com>
Message-ID: <CAAOTY_-Bqo+1JoVJdk7eUEoW3B4ZKhzhuvFEqxxGxweQkQBbKA@mail.gmail.com>
Subject: Re: [PATCH v8 11/19] drm/mediatek: dpi: move the yuv422_en_bit to
 board config
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
X-CRM114-CacheID: sfid-20220220_193211_877740_F21A5DB9 
X-CRM114-Status: GOOD (  17.04  )
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

SGksIEd1aWxsYXVtZToKCkd1aWxsYXVtZSBSYW5xdWV0IDxncmFucXVldEBiYXlsaWJyZS5jb20+
IOaWvCAyMDIy5bm0MuaciDE45pelIOmAseS6lCDkuIvljYgxMDo1NuWvq+mBk++8mgo+Cj4gQWRk
IGZsZXhpYmlsaXR5IGJ5IG1vdmluZyB0aGUgeXV2NDIyIGVuIGJpdCB0byBib2FyZCBjb25maWcK
CkFmdGVyIHJlcGxhY2UgJ2JvYXJkJyB3aXRoICdTb0MnLAoKUmV2aWV3ZWQtYnk6IENodW4tS3Vh
bmcgSHUgPGNodW5rdWFuZy5odUBrZXJuZWwub3JnPgoKPgo+IFNpZ25lZC1vZmYtYnk6IEd1aWxs
YXVtZSBSYW5xdWV0IDxncmFucXVldEBiYXlsaWJyZS5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1
L2RybS9tZWRpYXRlay9tdGtfZHBpLmMgfCA4ICsrKysrKystCj4gIDEgZmlsZSBjaGFuZ2VkLCA3
IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vbWVkaWF0ZWsvbXRrX2RwaS5jIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19k
cGkuYwo+IGluZGV4IGVjMjIxZTI0ZTBmZWUuLmZjZjg4ZGNkOGI4OWQgMTAwNjQ0Cj4gLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcGkuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9tZWRpYXRlay9tdGtfZHBpLmMKPiBAQCAtMTMyLDYgKzEzMiw3IEBAIHN0cnVjdCBtdGtfZHBp
X2NvbmYgewo+ICAgICAgICAgLy8gTWFzayB1c2VkIGZvciBIU0laRSBhbmQgVlNJWkUgKG5vIHNo
aWZ0KQo+ICAgICAgICAgdTMyIGh2c2l6ZV9tYXNrOwo+ICAgICAgICAgdTMyIGNoYW5uZWxfc3dh
cF9zaGlmdDsKPiArICAgICAgIHUzMiB5dXY0MjJfZW5fYml0Owo+ICAgICAgICAgY29uc3Qgc3Ry
dWN0IG10a19kcGlfeWNfbGltaXQgKmxpbWl0Owo+ICB9Owo+Cj4gQEAgLTM1Niw3ICszNTcsOCBA
QCBzdGF0aWMgdm9pZCBtdGtfZHBpX2NvbmZpZ19jaGFubmVsX3N3YXAoc3RydWN0IG10a19kcGkg
KmRwaSwKPgo+ICBzdGF0aWMgdm9pZCBtdGtfZHBpX2NvbmZpZ195dXY0MjJfZW5hYmxlKHN0cnVj
dCBtdGtfZHBpICpkcGksIGJvb2wgZW5hYmxlKQo+ICB7Cj4gLSAgICAgICBtdGtfZHBpX21hc2so
ZHBpLCBEUElfQ09OLCBlbmFibGUgPyBZVVY0MjJfRU4gOiAwLCBZVVY0MjJfRU4pOwo+ICsgICAg
ICAgbXRrX2RwaV9tYXNrKGRwaSwgRFBJX0NPTiwgZW5hYmxlID8gZHBpLT5jb25mLT55dXY0MjJf
ZW5fYml0IDogMCwKPiArICAgICAgICAgICAgICAgICAgICBkcGktPmNvbmYtPnl1djQyMl9lbl9i
aXQpOwo+ICB9Cj4KPiAgc3RhdGljIHZvaWQgbXRrX2RwaV9jb25maWdfY3NjX2VuYWJsZShzdHJ1
Y3QgbXRrX2RwaSAqZHBpLCBib29sIGVuYWJsZSkKPiBAQCAtODI0LDYgKzgyNiw3IEBAIHN0YXRp
YyBjb25zdCBzdHJ1Y3QgbXRrX2RwaV9jb25mIG10ODE3M19jb25mID0gewo+ICAgICAgICAgLmRp
bWVuc2lvbl9tYXNrID0gSFBXX01BU0ssCj4gICAgICAgICAuaHZzaXplX21hc2sgPSBIU0laRV9N
QVNLLAo+ICAgICAgICAgLmNoYW5uZWxfc3dhcF9zaGlmdCA9IENIX1NXQVAsCj4gKyAgICAgICAu
eXV2NDIyX2VuX2JpdCA9IFlVVjQyMl9FTiwKPiAgICAgICAgIC5saW1pdCA9ICZtdGtfZHBpX2xp
bWl0LAo+ICB9Owo+Cj4gQEAgLTgzOSw2ICs4NDIsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IG10
a19kcGlfY29uZiBtdDI3MDFfY29uZiA9IHsKPiAgICAgICAgIC5kaW1lbnNpb25fbWFzayA9IEhQ
V19NQVNLLAo+ICAgICAgICAgLmh2c2l6ZV9tYXNrID0gSFNJWkVfTUFTSywKPiAgICAgICAgIC5j
aGFubmVsX3N3YXBfc2hpZnQgPSBDSF9TV0FQLAo+ICsgICAgICAgLnl1djQyMl9lbl9iaXQgPSBZ
VVY0MjJfRU4sCj4gICAgICAgICAubGltaXQgPSAmbXRrX2RwaV9saW1pdCwKPiAgfTsKPgo+IEBA
IC04NTMsNiArODU3LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBtdGtfZHBpX2NvbmYgbXQ4MTgz
X2NvbmYgPSB7Cj4gICAgICAgICAuZGltZW5zaW9uX21hc2sgPSBIUFdfTUFTSywKPiAgICAgICAg
IC5odnNpemVfbWFzayA9IEhTSVpFX01BU0ssCj4gICAgICAgICAuY2hhbm5lbF9zd2FwX3NoaWZ0
ID0gQ0hfU1dBUCwKPiArICAgICAgIC55dXY0MjJfZW5fYml0ID0gWVVWNDIyX0VOLAo+ICAgICAg
ICAgLmxpbWl0ID0gJm10a19kcGlfbGltaXQsCj4gIH07Cj4KPiBAQCAtODY3LDYgKzg3Miw3IEBA
IHN0YXRpYyBjb25zdCBzdHJ1Y3QgbXRrX2RwaV9jb25mIG10ODE5Ml9jb25mID0gewo+ICAgICAg
ICAgLmRpbWVuc2lvbl9tYXNrID0gSFBXX01BU0ssCj4gICAgICAgICAuaHZzaXplX21hc2sgPSBI
U0laRV9NQVNLLAo+ICAgICAgICAgLmNoYW5uZWxfc3dhcF9zaGlmdCA9IENIX1NXQVAsCj4gKyAg
ICAgICAueXV2NDIyX2VuX2JpdCA9IFlVVjQyMl9FTiwKPiAgICAgICAgIC5saW1pdCA9ICZtdGtf
ZHBpX2xpbWl0LAo+ICB9Owo+Cj4gLS0KPiAyLjM0LjEKPgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0Ckxp
bnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
