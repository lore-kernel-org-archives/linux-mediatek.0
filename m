Return-Path: <SRS0=Eo9X=NA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8520CC432BE
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Aug 2021 13:09:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4396A60F93
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Aug 2021 13:09:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4396A60F93
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G3kXEJ2R1k1Qw3QqvMsWxQLEimWScvwEJnQN1LOPBiI=; b=huL79L3RP9wcZZ
	zaXOBsF4ybSDaAcwwgB6IFkc9RGPjsipx4wpGZ4IdT/yG7UShmBCCC6u4ybTQtVDcDmpzKSXhsBjX
	ZH4vX7TEsJ3qVyBodPE+Sl+MAKNhT6HfXFWEUQWU6iBvwVeNauhbxn394jABnu96EwYumrv9vRLL6
	4ptXMsBmdj+Ru0UcgEzhnzpj/z3epecg5PzZl8qUT6PUFYENwRrm+i2aenRv55NovCC/5ICRegNFC
	IlLK/KDJJ8CFqX1CCSQQEAYxKxDdwO4VW5uXPkcoqC4F4tlz+sTnrmopiBnbZCyh1ztnq9AGarwQ+
	vgobjznyFX2954QK3WNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mD51o-000h0K-Gz; Mon, 09 Aug 2021 13:09:16 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mD51j-000gyL-9s; Mon, 09 Aug 2021 13:09:14 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id C7D6760F93;
 Mon,  9 Aug 2021 13:09:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628514550;
 bh=YzG7BnFCln4Yyp6LxrxvxeyUMj5GmzMjIhVfIPMKSYc=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=YmsjoOgVwiRCGySrWrLQ8XAV3Hz23Fmp6MLYCvervZuSKrMaAZslkj4v/hhPPLKYQ
 bo4QrDLjJrAvJT4Sd0fFUGs0bCtBNV1gh9i13HYWdDpmSjWwAPqOqDotgvqQICL/9Y
 deEweM9WJz5jdqJoqsQZgcTZV+NXWanhFYNPKzRzWfLqLezWsmne8IOBXWMghv+42c
 3e92f/x6lQZcC4+5PxT+UOaHppXO5oJy1OLg6W6OseMdg7x1vithmCkJX2fxZEG4zE
 IhHqfjPsdDALo4O3nuWicYy+9Pvk6q8Uy5rL93t76MlZVJPARFLmZDQ+t4kUlBFCkY
 3KK017L+mf6TQ==
Received: by mail-lj1-f182.google.com with SMTP id x9so21562302ljj.2;
 Mon, 09 Aug 2021 06:09:10 -0700 (PDT)
X-Gm-Message-State: AOAM533WhYrYTy1ew118DQMmOXG47AM2htD5zoGN8WJSaWSrS+yTzkz4
 PUQSWita9Y7Vtf/JRwOQ0+LhgG5hrRqu9Auw7Q==
X-Google-Smtp-Source: ABdhPJzottn9lR1w4Ou5tspJmaMhExuHvfqLuRluAKs7dQZoer2iHn4k6bWFWu6HusN3FgH38v3t3o0558IoBlRW8NU=
X-Received: by 2002:a17:906:4156:: with SMTP id
 l22mr6919385ejk.75.1628514539014; 
 Mon, 09 Aug 2021 06:08:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210625082222.3845-1-tzimmermann@suse.de>
 <20210625082222.3845-14-tzimmermann@suse.de>
In-Reply-To: <20210625082222.3845-14-tzimmermann@suse.de>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 9 Aug 2021 21:08:48 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8Y7VZm2JWtPXVGfsPQ-j72wMULQJHCHdmQEV+a=TyW1Q@mail.gmail.com>
Message-ID: <CAAOTY_8Y7VZm2JWtPXVGfsPQ-j72wMULQJHCHdmQEV+a=TyW1Q@mail.gmail.com>
Subject: Re: [PATCH v4 13/27] drm/mediatek: Don't set struct
 drm_device.irq_enabled
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>, 
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Xinhui.Pan@amd.com, james.qian.wang@arm.com, liviu.dudau@arm.com, 
 mihail.atanassov@arm.com, brian.starkey@arm.com, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, 
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, 
 krzysztof.kozlowski@canonical.com, xinliang.liu@linaro.org, 
 tiantao6@hisilicon.com, john.stultz@linaro.org, kong.kongxinwei@hisilicon.com, 
 puck.chen@hisilicon.com, Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, 
 Lucas Stach <l.stach@pengutronix.de>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, 
 NXP Linux Team <linux-imx@nxp.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Ben Skeggs <bskeggs@redhat.com>, 
 Tomi Valkeinen <tomba@kernel.org>, Sandy Huang <hjc@rock-chips.com>, 
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Yannick Fertre <yannick.fertre@foss.st.com>,
 Philippe Cornu <philippe.cornu@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Thierry Reding <thierry.reding@gmail.com>, jonathanh@nvidia.com, 
 Jyri Sarha <jyri.sarha@iki.fi>, emma@anholt.net,
 linux-graphics-maintainer@vmware.com, 
 zackr@vmware.com, hyun.kwon@xilinx.com, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, michal.simek@xilinx.com, 
 jani.nikula@linux.intel.com, rodrigo.vivi@intel.com, 
 Russell King <linux@armlinux.org.uk>, kieran.bingham+renesas@ideasonboard.com, 
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, amd-gfx@lists.freedesktop.org, 
 DRI Development <dri-devel@lists.freedesktop.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linux-samsung-soc@vger.kernel.org, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 nouveau@lists.freedesktop.org, 
 linux-rockchip@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210809_060911_427169_03B73D01 
X-CRM114-Status: GOOD (  18.07  )
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

SGksIFRob21hczoKClRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPiDmlrwg
MjAyMeW5tDbmnIgyNeaXpSDpgLHkupQg5LiL5Y2INDoyMuWvq+mBk++8mgo+Cj4gVGhlIGZpZWxk
IGRybV9kZXZpY2UuaXJxX2VuYWJsZWQgaXMgb25seSB1c2VkIGJ5IGxlZ2FjeSBkcml2ZXJzCj4g
d2l0aCB1c2Vyc3BhY2UgbW9kZXNldHRpbmcuIERvbid0IHNldCBpdCBpbiBtZWRpYXRlay4KPgoK
QWNrZWQtYnk6IENodW4tS3VhbmcgSHUgPGNodW5rdWFuZy5odUBrZXJuZWwub3JnPgoKPiBTaWdu
ZWQtb2ZmLWJ5OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4KPiBSZXZp
ZXdlZC1ieTogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQu
Y29tPgo+IEFja2VkLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPgo+
IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kcnYuYyB8IDYgLS0tLS0t
Cj4gIDEgZmlsZSBjaGFuZ2VkLCA2IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rydi5jIGIvZHJpdmVycy9ncHUvZHJtL21lZGlh
dGVrL210a19kcm1fZHJ2LmMKPiBpbmRleCBiNDZiZGI4OTg1ZGEuLjliNjBiZWMzM2QzYiAxMDA2
NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kcnYuYwo+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rydi5jCj4gQEAgLTI3MCwxMiArMjcw
LDYgQEAgc3RhdGljIGludCBtdGtfZHJtX2ttc19pbml0KHN0cnVjdCBkcm1fZGV2aWNlICpkcm0p
Cj4gICAgICAgICAgICAgICAgIGdvdG8gZXJyX2NvbXBvbmVudF91bmJpbmQ7Cj4gICAgICAgICB9
Cj4KPiAtICAgICAgIC8qCj4gLSAgICAgICAgKiBXZSBkb24ndCB1c2UgdGhlIGRybV9pcnFfaW5z
dGFsbCgpIGhlbHBlcnMgcHJvdmlkZWQgYnkgdGhlIERSTQo+IC0gICAgICAgICogY29yZSwgc28g
d2UgbmVlZCB0byBzZXQgdGhpcyBtYW51YWxseSBpbiBvcmRlciB0byBhbGxvdyB0aGUKPiAtICAg
ICAgICAqIERSTV9JT0NUTF9XQUlUX1ZCTEFOSyB0byBvcGVyYXRlIGNvcnJlY3RseS4KPiAtICAg
ICAgICAqLwo+IC0gICAgICAgZHJtLT5pcnFfZW5hYmxlZCA9IHRydWU7Cj4gICAgICAgICByZXQg
PSBkcm1fdmJsYW5rX2luaXQoZHJtLCBNQVhfQ1JUQyk7Cj4gICAgICAgICBpZiAocmV0IDwgMCkK
PiAgICAgICAgICAgICAgICAgZ290byBlcnJfY29tcG9uZW50X3VuYmluZDsKPiAtLQo+IDIuMzIu
MAo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlh
dGVrCg==
