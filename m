Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA4E4D29C39
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Jan 2026 15:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZeRSgWEeQQQDS6dX053IERw7UOhSiIsZ8RiAvAAwT5A=; b=kfoipwoxZxrhTeYXBtMnJ1Zf7T
	g6lEI2pP5u4lA+IwlcERahedwxsDzXsGRLEt7EpadSI5gzrYFCpvzkxfaAZBy12dUqPqx6S8ZqLr4
	THS8V1x5DBmcB296ZFu1u5j+y7+51slK4UpJBZ46nD5aYS/G/pOaAhexmhaD9MZo1+fj8IwWlAVHp
	SwDL7KvDSxoIwn91Nnyqb0ilbc94sqP+Smr/IzK/673HqS7F0UEoB+a5vozzaJ1PcJSK0Zv1v16ye
	2JjJCLDUWECnyj6AdwE7CqOqSjfLrD+TPL0g1OrJu7l8bMa7Tg4v4bhacLL/A0L4fvDaqQYg8Fe5d
	vS5Dg3jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhrTQ-00000002O42-2u0w;
	Mon, 19 Jan 2026 15:47:25 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhrTO-00000002O3G-3qA8
	for linux-mediatek@lists.infradead.org;
	Mon, 19 Jan 2026 15:47:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 091B860054;
	Mon, 19 Jan 2026 15:47:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1477C116C6;
	Mon, 19 Jan 2026 15:47:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768837641;
	bh=cBO3cObQRu1/ZTypup7vWo41HKPaKjiUdsb37Zb9arQ=;
	h=From:To:Subject:Date:From;
	b=P1VMETY/Y2KsMgRR2c7UbTKCOETq13NGGAvwaT4fzoMDraMX+HLm8BlUj45OQ7NVY
	 tezp79p69qWbTF0LMUiRmNXpVSTGM4uifmHVNGp0MMm37HNNTFZDRE2A2IGzpYJVVe
	 xPUygs23jT6Czb40IZod9Lo/3v2EyNaf6vUmGnsmDIhbp7+LmnT89scuSr7xO9ECkV
	 ggyk84f1lW0xBKVHJsjOQv7CTyd39d8S6RbxEnAIZWhc8I8Nq105MQrz6HIMiX8CM1
	 RqeC836Pq6NzaMsiqJQuo/0TOSYOyAyKQ9OPO/jzCo+OAsBmunozk0FxYr8FzDX47c
	 GZYdDgL+92zVA==
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: David Airlie <airlied@linux.ie>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Nauman Sabir <officialnaumansabir@gmail.com>
Subject: [GIT PULL] mediatek drm fixes - 20260119
Date: Mon, 19 Jan 2026 15:47:17 +0000
Message-Id: <20260119154717.4735-1-chunkuang.hu@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Hi, Dave & Sima:

This includes:
1. Fix platform_get_irq() error checking
2. HDMI DDC v2 driver fixes
3. dpi: Find next bridge during probe
4. mtk_gem: Partial refactor and use drm_gem_dma_object
5. dt-bindings: Fix typo 'hardwares' to 'hardware'

Regards,
Chun-Kuang.

The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git tags/mediatek-drm-fixes-20260119

for you to fetch changes up to b9639c5e313e14ff1feaf175f2a93b4640732a8e:

  dt-bindings: display: mediatek: Fix typo 'hardwares' to 'hardware' (2026-01-19 15:31:09 +0000)

----------------------------------------------------------------
Mediatek DRM Fixes - 20260119

1. Fix platform_get_irq() error checking
2. HDMI DDC v2 driver fixes
3. dpi: Find next bridge during probe
4. mtk_gem: Partial refactor and use drm_gem_dma_object
5. dt-bindings: Fix typo 'hardwares' to 'hardware'

----------------------------------------------------------------
AngeloGioacchino Del Regno (1):
      drm/mediatek: mtk_gem: Partial refactor and use drm_gem_dma_object

Chen-Yu Tsai (1):
      drm/mediatek: dpi: Find next bridge during probe

Dan Carpenter (1):
      drm/mediatek: Fix platform_get_irq() error checking

Louis-Alexis Eyraud (2):
      drm/mediatek: mtk_hdmi_ddc_v2: Add transfer abort on timeout cases
      drm/mediatek: mtk_hdmi_ddc_v2: Fix multi-byte writes

Nathan Chancellor (1):
      drm/mediatek: mtk_hdmi_v2: Fix return type of mtk_hdmi_v2_tmds_char_rate_valid()

Nauman Sabir (1):
      dt-bindings: display: mediatek: Fix typo 'hardwares' to 'hardware'

 .../bindings/display/mediatek/mediatek,dp.yaml     |   2 +-
 drivers/gpu/drm/mediatek/Kconfig                   |   2 +-
 drivers/gpu/drm/mediatek/mtk_dpi.c                 |  23 +-
 drivers/gpu/drm/mediatek/mtk_gem.c                 | 264 ++++++++-------------
 drivers/gpu/drm/mediatek/mtk_gem.h                 |  33 +--
 drivers/gpu/drm/mediatek/mtk_hdmi_common.c         |   2 +-
 drivers/gpu/drm/mediatek/mtk_hdmi_common.h         |   2 +-
 drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c         |  58 +++--
 drivers/gpu/drm/mediatek/mtk_hdmi_v2.c             |   7 +-
 drivers/gpu/drm/mediatek/mtk_plane.c               |   8 +-
 10 files changed, 158 insertions(+), 243 deletions(-)

