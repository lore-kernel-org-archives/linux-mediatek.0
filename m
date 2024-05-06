Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 941F5C25B4F
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 May 2024 13:35:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fkXvm8K73uRGt43Fh5pP2CjGxAWo/753DWe98SqauEI=; b=39cUPoJuoiO7ZL
	XPbW6tm1cm1h9Xn+EfRbBQntvQ8ODQIzoVqY0VHlS1b7Jay1CiqOW1o2IxFQhJWUden3q+TWhU4wD
	/e5FJqhWwndUVSrAqt6RVNxT0x9OGzbxYnCtUtAz7wO4cuDhX07la9YBfQO+Xn280IH0OmqduDF0q
	f2pDkCj2Pv2vWOcx5OZEbR5JNoeifVw81/83jK7uW7+e54s5n5nJYZNc2O4uoUU5Gm7HN6yWYoMQb
	BNj+DsEHebjAWDph4AQEjxoupdMIt1MTYgSd/esxEaJc9FBVzgUvKMeb1mzRhyaiExEcvR/3Tt+1P
	05kv/MBZR4i2fWqhZmsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3yUw-00000007Szz-2Umm;
	Mon, 06 May 2024 13:35:18 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3yUk-00000007SnA-2HS2;
	Mon, 06 May 2024 13:35:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 2B2BECE0E76;
	Mon,  6 May 2024 13:35:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C0E4C116B1;
	Mon,  6 May 2024 13:34:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715002503;
	bh=7KQKdwRJtBFZkLdfMhs2OLN3qUwlGvTF8MBUDqOjd3s=;
	h=From:Subject:Date:To:Cc:From;
	b=XtKnAA/XWOfsPqfFPNMzDVsGyICjYHcSlf8yN7QfZtjlSZqSiy5hAzHxSY8rsgFJw
	 3/hyujLhOEw1+5r+M6JvWl7pIFUa759fB+oMeFWlMjrnpyy/jbd6Wcgfw5Y7L8e4ew
	 FOZG46X4xaoX09TdyFSn6ZQf1dSKkjYei64HiVGsq42hEqOtxuBnw7BwPEPZRpVhhy
	 KTQDbLBkXcbirv4Ug2rw8AvhFbgFpQcT2myKjRx2vLHBf83Szm0wich1/Jp9Zq51Ge
	 s0S261RfU+xxKJ0DjL64p/1LO0WzWkNKtRwEyPkWRG/lQJshAOVx0XKzGhpo1TToeS
	 9xAidLnwcpCgg==
From: Michael Walle <mwalle@kernel.org>
Subject: [PATCH 00/20] drm/bridge: tc358775: proper bridge bringup and code
 cleanup
Date: Mon, 06 May 2024 15:34:29 +0200
Message-Id: <20240506-tc358775-fix-powerup-v1-0-545dcf00b8dd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGXcOGYC/x2Myw5AMBAAf0X2bJOlreJXxEFY7IWm9Uoa/65xn
 ExmIgT2wgHaLILnS4LsW4Iiz2Bch21hlCkxlFRqMlThMSpTW2twlgfdfrM/HRo164ZIq8I2kFL
 nOel/2/Xv+wEve/DHZgAAAA==
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sam Ravnborg <sam@ravnborg.org>, Vinay Simha BN <simhavcs@gmail.com>, 
 Tony Lindgren <tony@atomide.com>
Cc: Daniel Semkowicz <dse@thaumatec.com>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, Michael Walle <mwalle@kernel.org>
X-Mailer: b4 0.12.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240506_063507_127262_88C76064 
X-CRM114-Status: GOOD (  13.77  )
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

This patchset fixes the bridge initialization according to the
datasheet. Not sure how that even worked before. Maybe because the
initialization was done prior to linux (?).

The bridge has some peculiarities:
 (1) The reset has to be deasserted in LP-11 mode
 (2) For I2C access the bridge needs the DSI clock
 (3) The bridge has to be configured while the video stream is
     disabled.
 (4) The bridge has limitations on the display timings. In particular,
     the horizontal pulse width has to be at least 8 pixels wide and
     both the horizontal pulse width as well as the back porch has to
     be even. According to the datasheet the horizontal front porch as
     well but in line sync mode, this is ignored. Also line sync is the
     only supported mode for this bridge, therefore, the front porch
     is always ignored.

The most controversial patch is probably "drm/bridge: add
dsi_lp11_notify mechanism" which is needed for (1) above. Some time ago
there was a series [1] to add a manual power-up, which was abandoned and
which didn't suite the needs for this bridge anyway.

Also, this will gradually change the tc_ prefix to tc358775_ while the
functions are refactored.

The bridge was successfully tested on a Mediatek MT8195 SoC with the
following panels:
 - Innolux G101ICE
 - AUO G121EAN01.0
 - Innolux G156HCE (dual-link LVDS)

[1] https://lore.kernel.org/r/20231016165355.1327217-1-dmitry.baryshkov@linaro.org/

Signed-off-by: Michael Walle <mwalle@kernel.org>
---
Michael Walle (20):
      drm/bridge: add dsi_lp11_notify mechanism
      drm/mediatek: dsi: provide LP-11 mode during .pre_enable
      drm/mediatek: dsi: add support for .dsi_lp11_notity()
      drm/bridge: tc358775: fix regulator supply id
      drm/bridge: tc358775: add crtc modes fixup
      drm/bridge: tc358775: redefine LV_MX()
      drm/bridge: tc358775: use regmap instead of open coded access functions
      drm/bridge: tc358775: remove error message if regulator is missing
      drm/bridge: tc358775: remove complex vsdelay calculation
      drm/bridge: tc358775: simplify lvds_link property
      drm/bridge: tc358775: reformat weird indentation
      drm/bridge: tc358775: correctly configure LVDS clock
      drm/bridge: tc358775: split the init code
      drm/bridge: tc358775: configure PLL depending on the LVDS clock
      drm/bridge: tc358775: dynamically configure DSI link settings
      drm/bridge: tc358775: use proper defines to configure LVDS timings
      drm/bridge: tc358775: move bridge power up/down into functions
      drm/bridge: tc358775: fix the power-up/down delays
      drm/bridge: tc358775: fix power-up sequencing
      drm/bridge: tc358775: use devm_drm_bridge_add()

 drivers/gpu/drm/bridge/Kconfig     |   1 +
 drivers/gpu/drm/bridge/tc358775.c  | 601 ++++++++++++++++++++-----------------
 drivers/gpu/drm/drm_bridge.c       |  16 +
 drivers/gpu/drm/mediatek/mtk_dsi.c |   8 +-
 include/drm/drm_bridge.h           |  12 +
 5 files changed, 355 insertions(+), 283 deletions(-)
---
base-commit: 9221b2819b8a4196eecf5476d66201be60fbcf29
change-id: 20240506-tc358775-fix-powerup-53f490043179


