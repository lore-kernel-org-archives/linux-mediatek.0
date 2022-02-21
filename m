Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B456FC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Feb 2022 02:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ji9zE9URF+4Nfx1viMQUqsdN7PI9GMW5F5Coh/oVJ1w=; b=tF8vUlxHBqnFGJ
	IFeF4VWXuAnznqRm+yTQjZgPw+vUU1/0MuXBzDKmiAlWcu83DO0ukCIDSD/ZegwoPL5dbRDAQcQip
	NkVj2XRLOjeLu1M0JNQheXnAQeUcE/srWrjfxkzahl+S2Fo6YRnyqdjMsc+9NUuesGTz1OP/vHpsT
	UwShn+EUHz8vbkVHD2ocI0Yu4h0x9NAUvrjp6T6XiKUaPIr1UQoEFA2hystGDac+xZHlqD2rbv7ba
	eZxc6O1aqTsfOe0rj1M86/sYjtOQFiWnHm/wJZE/BwfamOiXMfmgk9PYyV8KdXOpLEsiVcOuYqYwM
	uGru/dU4vCSHYyAbxDXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nLyg7-00367m-6U; Mon, 21 Feb 2022 02:43:55 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nLyfn-00360C-Cf; Mon, 21 Feb 2022 02:43:37 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E758F61132;
 Mon, 21 Feb 2022 02:43:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75282C340F6;
 Mon, 21 Feb 2022 02:43:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645411413;
 bh=fr9WRLrW4coExEzj2Kuaw9OBpeHu4mj+MkxXimcnkCw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=tHGeFe5kGxavBagXfuqMvZGtm9XDhRHHf+F/OYh1gQbFsj115H1fn7bAF3Gy/ZjSV
 tKvXiYAod5rP1da37lvbUbVcupqxjUDf9xRGMcPJE7PGqzqDVLfqGRbd/+GORMiP4O
 Gxe/IimKdeCkmmB86sCgXl8gg7pWab1VGJvjWP0unJ8jiqE949Ywbxs0mCtnjxBB/k
 zlWlE8hjtFtl02/DkLFkYhaG2nIaCaH/9rZIKqdhJdyRcVEkz3xlJLGRyDMHXsDD04
 Q+qfu4OFlOx6hK+6w9Stp1ZngsaT7szHesbaI/vsJaIb1ezjuwYbrropLb71RNgIzV
 eZXH4RvJ2WmPQ==
Received: by mail-ej1-f41.google.com with SMTP id gb39so29398932ejc.1;
 Sun, 20 Feb 2022 18:43:33 -0800 (PST)
X-Gm-Message-State: AOAM531PBCkGG7HLiUW+Maiidf0idAZhJh+WF+v8RxYTiaHvXdxyPjOt
 8VT5799EaG96u4zp/mQPxRYvIif7yenRRGaApA==
X-Google-Smtp-Source: ABdhPJwOzYdjdfRguJrzoCzdajK1FOiYj6KmzNtAScRDhOVtID8EpaZbeIyGY8zVQWhRYhYShCXwM4IhUMsXpmbxZhY=
X-Received: by 2002:a17:906:b348:b0:6cf:5b66:2f80 with SMTP id
 cd8-20020a170906b34800b006cf5b662f80mr13893213ejb.638.1645411411757; Sun, 20
 Feb 2022 18:43:31 -0800 (PST)
MIME-Version: 1.0
References: <20220218145437.18563-1-granquet@baylibre.com>
 <20220218145437.18563-10-granquet@baylibre.com>
In-Reply-To: <20220218145437.18563-10-granquet@baylibre.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 21 Feb 2022 10:43:19 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8zj3PxdZ-CftM8jE+0T-vmck1UMH9tNYN6YL5MuaTdQw@mail.gmail.com>
Message-ID: <CAAOTY_8zj3PxdZ-CftM8jE+0T-vmck1UMH9tNYN6YL5MuaTdQw@mail.gmail.com>
Subject: Re: [PATCH v8 09/19] drm/mediatek: dpi: move dimension_mask to board
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
X-CRM114-CacheID: sfid-20220220_184335_541793_F0E93A0C 
X-CRM114-Status: GOOD (  16.59  )
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
IGZsZXhpYmlsaXR5IGJ5IG1vdmluZyB0aGUgZGltZW5zaW9uIG1hc2sgdG8gYm9hcmQgY29uZmln
CgpSZXBsYWNlICdib2FyZCcgd2l0aCAnU29DJy4KCj4KPiBTaWduZWQtb2ZmLWJ5OiBHdWlsbGF1
bWUgUmFucXVldCA8Z3JhbnF1ZXRAYmF5bGlicmUuY29tPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9k
cm0vbWVkaWF0ZWsvbXRrX2RwaS5jIHwgMTIgKysrKysrKysrKy0tCj4gIDEgZmlsZSBjaGFuZ2Vk
LCAxMCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHBpLmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsv
bXRrX2RwaS5jCj4gaW5kZXggOGNhMzQ1NWVkNjRlZS4uMGQzYWNkMDhlYTM1OCAxMDA2NDQKPiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RwaS5jCj4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL21lZGlhdGVrL210a19kcGkuYwo+IEBAIC0xMjksNiArMTI5LDggQEAgc3RydWN0IG10
a19kcGlfY29uZiB7Cj4gICAgICAgICBib29sIHN3YXBfaW5wdXRfc3VwcG9ydDsKPiAgICAgICAg
IC8vIE1hc2sgdXNlZCBmb3IgSFdJRFRILCBIUE9SQ0gsIFZTWU5DX1dJRFRIIGFuZCBWU1lOQ19Q
T1JDSCAobm8gc2hpZnQpCj4gICAgICAgICB1MzIgZGltZW5zaW9uX21hc2s7Cj4gKyAgICAgICAv
LyBNYXNrIHVzZWQgZm9yIEhTSVpFIGFuZCBWU0laRSAobm8gc2hpZnQpCgovKiAuLi4gKi8KClJl
Z2FyZHMsCkNodW4tS3VhbmcuCgo+ICsgICAgICAgdTMyIGh2c2l6ZV9tYXNrOwo+ICAgICAgICAg
Y29uc3Qgc3RydWN0IG10a19kcGlfeWNfbGltaXQgKmxpbWl0Owo+ICB9Owo+Cj4gQEAgLTI0Myw4
ICsyNDUsMTAgQEAgc3RhdGljIHZvaWQgbXRrX2RwaV9jb25maWdfaW50ZXJmYWNlKHN0cnVjdCBt
dGtfZHBpICpkcGksIGJvb2wgaW50ZXIpCj4KPiAgc3RhdGljIHZvaWQgbXRrX2RwaV9jb25maWdf
ZmJfc2l6ZShzdHJ1Y3QgbXRrX2RwaSAqZHBpLCB1MzIgd2lkdGgsIHUzMiBoZWlnaHQpCj4gIHsK
PiAtICAgICAgIG10a19kcGlfbWFzayhkcGksIERQSV9TSVpFLCB3aWR0aCA8PCBIU0laRSwgSFNJ
WkVfTUFTSyk7Cj4gLSAgICAgICBtdGtfZHBpX21hc2soZHBpLCBEUElfU0laRSwgaGVpZ2h0IDw8
IFZTSVpFLCBWU0laRV9NQVNLKTsKPiArICAgICAgIG10a19kcGlfbWFzayhkcGksIERQSV9TSVpF
LCB3aWR0aCA8PCBIU0laRSwKPiArICAgICAgICAgICAgICAgICAgICBkcGktPmNvbmYtPmh2c2l6
ZV9tYXNrIDw8IEhTSVpFKTsKPiArICAgICAgIG10a19kcGlfbWFzayhkcGksIERQSV9TSVpFLCBo
ZWlnaHQgPDwgVlNJWkUsCj4gKyAgICAgICAgICAgICAgICAgICAgZHBpLT5jb25mLT5odnNpemVf
bWFzayA8PCBWU0laRSk7Cj4gIH0KPgo+ICBzdGF0aWMgdm9pZCBtdGtfZHBpX2NvbmZpZ19jaGFu
bmVsX2xpbWl0KHN0cnVjdCBtdGtfZHBpICpkcGkpCj4gQEAgLTgxNiw2ICs4MjAsNyBAQCBzdGF0
aWMgY29uc3Qgc3RydWN0IG10a19kcGlfY29uZiBtdDgxNzNfY29uZiA9IHsKPiAgICAgICAgIC5p
c19ja19kZV9wb2wgPSB0cnVlLAo+ICAgICAgICAgLnN3YXBfaW5wdXRfc3VwcG9ydCA9IHRydWUs
Cj4gICAgICAgICAuZGltZW5zaW9uX21hc2sgPSBIUFdfTUFTSywKPiArICAgICAgIC5odnNpemVf
bWFzayA9IEhTSVpFX01BU0ssCj4gICAgICAgICAubGltaXQgPSAmbXRrX2RwaV9saW1pdCwKPiAg
fTsKPgo+IEBAIC04MjksNiArODM0LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBtdGtfZHBpX2Nv
bmYgbXQyNzAxX2NvbmYgPSB7Cj4gICAgICAgICAuaXNfY2tfZGVfcG9sID0gdHJ1ZSwKPiAgICAg
ICAgIC5zd2FwX2lucHV0X3N1cHBvcnQgPSB0cnVlLAo+ICAgICAgICAgLmRpbWVuc2lvbl9tYXNr
ID0gSFBXX01BU0ssCj4gKyAgICAgICAuaHZzaXplX21hc2sgPSBIU0laRV9NQVNLLAo+ICAgICAg
ICAgLmxpbWl0ID0gJm10a19kcGlfbGltaXQsCj4gIH07Cj4KPiBAQCAtODQxLDYgKzg0Nyw3IEBA
IHN0YXRpYyBjb25zdCBzdHJ1Y3QgbXRrX2RwaV9jb25mIG10ODE4M19jb25mID0gewo+ICAgICAg
ICAgLmlzX2NrX2RlX3BvbCA9IHRydWUsCj4gICAgICAgICAuc3dhcF9pbnB1dF9zdXBwb3J0ID0g
dHJ1ZSwKPiAgICAgICAgIC5kaW1lbnNpb25fbWFzayA9IEhQV19NQVNLLAo+ICsgICAgICAgLmh2
c2l6ZV9tYXNrID0gSFNJWkVfTUFTSywKPiAgICAgICAgIC5saW1pdCA9ICZtdGtfZHBpX2xpbWl0
LAo+ICB9Owo+Cj4gQEAgLTg1Myw2ICs4NjAsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IG10a19k
cGlfY29uZiBtdDgxOTJfY29uZiA9IHsKPiAgICAgICAgIC5pc19ja19kZV9wb2wgPSB0cnVlLAo+
ICAgICAgICAgLnN3YXBfaW5wdXRfc3VwcG9ydCA9IHRydWUsCj4gICAgICAgICAuZGltZW5zaW9u
X21hc2sgPSBIUFdfTUFTSywKPiArICAgICAgIC5odnNpemVfbWFzayA9IEhTSVpFX01BU0ssCj4g
ICAgICAgICAubGltaXQgPSAmbXRrX2RwaV9saW1pdCwKPiAgfTsKPgo+IC0tCj4gMi4zNC4xCj4K
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1l
ZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
