Return-Path: <SRS0=JbG7=YO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 752BACA9EAF
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Oct 2019 21:46:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 46C112089C
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Oct 2019 21:46:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aCUbdgo2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 46C112089C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0t3NfCHjk7LBnbTUcbRR8kiuv8/prEzha1WRMYFTGnE=; b=aCUbdgo2rmbuD5
	RtjlOLL2QQT5ixH5CFJizcgPhBJHpAmcW8ST6qiN/erTBCK4PbLmX2Fe1AQqbcpO5VlJtEHhDdxLw
	jM5KyFFpWSUpO47ylSd4KfcUjNT/l2DPragAo07zSRq8qwZZHxY28XWIgy+AQ7taOq4HvLHYsPuSg
	A1XN1QLsNCmdbtnBzgE2iojMqSQm6V5FfTUcv3Lx+VfVP/a6hxY/EET/WZyEOdjpHqbJXP1WXvB9O
	1o/DalnU0bLlYqTkKoqwOnwzWDpY13lBSmuwhP4puZ+TKbDFHW4H2pmyRyYXnATF6C2CC3sJx07+Z
	9apDczEz2lKibwnTsWXw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iMfVC-0000Ow-5Q; Mon, 21 Oct 2019 21:46:10 +0000
Received: from mail-ot1-f67.google.com ([209.85.210.67])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iMfUw-0000C7-GQ; Mon, 21 Oct 2019 21:45:56 +0000
Received: by mail-ot1-f67.google.com with SMTP id 21so12345581otj.11;
 Mon, 21 Oct 2019 14:45:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nqe5QILtIpNsEaGhkK4nGkXs8zLkefJgCA+oa+2s7ok=;
 b=db9KTeYkpaYOOjZMgE35pgtZ2xKfjPyYyi819zk+e31lUGvdoPYUABDmCcMg9ZCdQv
 oMw3u1ARKoFYi/t13JCiUu++uBUMQ1RZcYoSfcX4HuvWJm3wNk/bUK3n083UNoGzYUY5
 +DcsHUqnQYaMKcZtqIrX6+G40IvrJ5p54a+olZL9ZwOENy5U10VU4pzP+RSYrjnTQFSv
 4aMdXl2snQ2zcPM3ZoSA/MZEofZOluh19/j//hAfQbrrtuaFZvBazgrAatl9X4y2XwLU
 mAA9C3tIK56HmV6ZlBDcvnpWTXxXrvB7/zXdmWLRfRg38Q+p6Mja1ybJs4jcoFtQHjG7
 XH+Q==
X-Gm-Message-State: APjAAAWin4AyFyvNmQGDPktfeokkjWclpuZ9GcGJ2lZ7jHZsH1PAnTvW
 liJr8DM5vqnQU0iCjZYt3w==
X-Google-Smtp-Source: APXvYqxCs8yabMuTaUbUxDWWtS2Wplp/U09Sf75zVuQx5s+Q4uVctXMoxLgtzYEKbav8DT5Bobt0qg==
X-Received: by 2002:a9d:3df7:: with SMTP id l110mr40031otc.245.1571694353132; 
 Mon, 21 Oct 2019 14:45:53 -0700 (PDT)
Received: from xps15.herring.priv (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.googlemail.com with ESMTPSA id u130sm4122676oib.56.2019.10.21.14.45.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Oct 2019 14:45:52 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/6] drm: Support CMA per allocation kernel mappings
Date: Mon, 21 Oct 2019 16:45:44 -0500
Message-Id: <20191021214550.1461-1-robh@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191021_144554_544317_B8C090D6 
X-CRM114-Status: GOOD (  14.65  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Liviu Dudau <liviu.dudau@arm.com>, Sandy Huang <hjc@rock-chips.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Yannick Fertre <yannick.fertre@st.com>, Kevin Hilman <khilman@baylibre.com>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Xinliang Liu <z.liuxinliang@hisilicon.com>, linux-rockchip@lists.infradead.org,
 Chen-Yu Tsai <wens@csie.org>,
 =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>,
 "James \(Qian\) Wang" <james.qian.wang@arm.com>, CK Hu <ck.hu@mediatek.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Chen Feng <puck.chen@hisilicon.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org,
 Philippe Cornu <philippe.cornu@st.com>, Vincent Abriou <vincent.abriou@st.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Rongrong Zou <zourongrong@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This series adds support for CMA/DMA users to skip kernel mappings for
GEM allocations. The DMA API only guarantees a kernel mapping at
allocation time. Creating mappings with vmap() after allocation may or
may not work as not all allocations have a struct page. As virtual
memory space is limited on 32-bit systems some drivers will skip kernel
mappings when possible. This prevents those drivers from using CMA
helpers and the generic fbdev emulation which results in a lot of
duplicated code.

In order to distinguish between kernel and userspace allocations,
a new flag, DRM_MODE_DUMB_KERNEL_MAP, for drm_mode_create_dumb() is
introduced. This allows drivers to override the default behavior for
CMA helpers of always creating a kernel mapping.

Mediatek is converted to CMA helpers and Rockchip is converted to generic
fbdev support. I also have patches to convert Rockchip to CMA and shmem
helpers, but they need a bit more work. Exynos can also probably be
converted to use CMA helpers.

Compile tested only. I did test fbdev on Rockchip, but the h/w I have
has an IOMMU, so the CMA code path doesn't get tested.

Rob

Rob Herring (6):
  drm/kirin: Use DRM_GEM_CMA_VMAP_DRIVER_OPS
  drm: Introduce DRM_MODE_DUMB_KERNEL_MAP flag
  drm/cma-helper: Use the dma_*_attr API variant
  drm/cma-helper: Support DRM_MODE_DUMB_KERNEL_MAP flag
  drm/mediatek: Convert to use CMA helpers
  drm/rockchip: Convert to use generic fbdev emulation

 .../gpu/drm/arm/display/komeda/komeda_kms.c   |   1 +
 drivers/gpu/drm/arm/malidp_drv.c              |   1 +
 drivers/gpu/drm/drm_client.c                  |   1 +
 drivers/gpu/drm/drm_dumb_buffers.c            |   5 +-
 drivers/gpu/drm/drm_gem_cma_helper.c          |  68 +++--
 .../gpu/drm/hisilicon/kirin/kirin_drm_ade.c   |  11 +-
 drivers/gpu/drm/mediatek/Makefile             |   1 -
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c       |   2 +-
 drivers/gpu/drm/mediatek/mtk_drm_drv.c        |  28 +-
 drivers/gpu/drm/mediatek/mtk_drm_fb.c         |   1 -
 drivers/gpu/drm/mediatek/mtk_drm_gem.c        | 289 ------------------
 drivers/gpu/drm/mediatek/mtk_drm_gem.h        |  51 ----
 drivers/gpu/drm/mediatek/mtk_drm_plane.c      |   7 +-
 drivers/gpu/drm/meson/meson_drv.c             |   1 +
 drivers/gpu/drm/rcar-du/rcar_du_kms.c         |   1 +
 drivers/gpu/drm/rockchip/Makefile             |   1 -
 drivers/gpu/drm/rockchip/rockchip_drm_drv.c   |  10 +-
 drivers/gpu/drm/rockchip/rockchip_drm_drv.h   |   2 -
 drivers/gpu/drm/rockchip/rockchip_drm_fb.c    |  14 -
 drivers/gpu/drm/rockchip/rockchip_drm_fb.h    |   6 -
 drivers/gpu/drm/rockchip/rockchip_drm_fbdev.c | 170 -----------
 drivers/gpu/drm/rockchip/rockchip_drm_fbdev.h |  24 --
 drivers/gpu/drm/rockchip/rockchip_drm_gem.c   |   6 +-
 drivers/gpu/drm/rockchip/rockchip_drm_gem.h   |   4 -
 drivers/gpu/drm/stm/drv.c                     |   1 +
 drivers/gpu/drm/sun4i/sun4i_drv.c             |   1 +
 include/drm/drm_gem_cma_helper.h              |   1 +
 include/uapi/drm/drm_mode.h                   |   2 +
 28 files changed, 78 insertions(+), 632 deletions(-)
 delete mode 100644 drivers/gpu/drm/mediatek/mtk_drm_gem.c
 delete mode 100644 drivers/gpu/drm/mediatek/mtk_drm_gem.h
 delete mode 100644 drivers/gpu/drm/rockchip/rockchip_drm_fbdev.c
 delete mode 100644 drivers/gpu/drm/rockchip/rockchip_drm_fbdev.h

--
2.20.1

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
