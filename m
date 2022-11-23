Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED3CEC4332F
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Nov 2022 23:49:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fZCAv8miwLD28ocQga5KKMmBjpZneJh4bPE8gm+3RgA=; b=gWKGrwCUyLQDi2wBLbuGgZZ2GJ
	eBfkPE07nlPRTbKE9cDfmhpn0PqCjzggAuUyCExmMLe3MtzQquQMMmi5VcEWJkn26IOnseLkCdRTF
	0Jfb1VNcHfdw29y8fvIrofamqOulphW2y7+Q/9BCs9iCLYwdBwDQY6W+KY8Mr7MRmCfYTcEHDIz+4
	D0y3TaLT2zADLW1hXKKu2Gg1SM17duD0Ff1UxZzHyETVXiEC8BjSca+u1sQvGAV2Qk2tyBetsWqHW
	OGrl4RouupEQ4Nemucal5WDImmEZRFfmbiHW6arpmqYXDd2iGS9d+Ht6vc8anFRNsxnO8ikyb6BvA
	VzX7sbvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxzUG-002xUh-Cx; Wed, 23 Nov 2022 23:49:04 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxzUC-002xU4-Cu
	for linux-mediatek@lists.infradead.org; Wed, 23 Nov 2022 23:49:02 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A7A8361F64;
	Wed, 23 Nov 2022 23:48:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93248C433D6;
	Wed, 23 Nov 2022 23:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669247339;
	bh=60qY6zuvc6YQxUkOpZg/HwdONSAOl74Rznw66aYgEQM=;
	h=From:To:Cc:Subject:Date:From;
	b=P6iIXbVEjocAalQgwYYlPM59WQ+CkEM/gz3kzlIkppkaS6AogK+iMnaxAlCTekB0A
	 Y2vKT2LJPdezq++7zPTUEm4dunU7p2lMNkrqou2BvH2+Cn5zKQJT3HpDDSsNefchQ8
	 Or3JW/JB1VavZRw3GiWvC55pPqD72hAaemoqvBDhZEsxIl+PKJilH8Dl0BCn4q8I6H
	 TMiqIzI3/+ZlmfSVds4ffKMeqErWtekWoouOp8aOCN5Jsh1pOnnudBGpVU2i6ERZ0T
	 oPaYja3tYcFzEyfJydwA3kKbg9gE7984QLBT9SfnL+e4J1s+HRbZH5aXMdAi/dVeU7
	 VWi6HONmXTR7A==
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org
Cc: Xinlei Lee <xinlei.lee@mediatek.com>,
	Gil Dekel <gildekel@chromium.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Justin Green <greenjustin@chromium.org>
Subject: [GIT PULL] mediatek drm next for 6.2
Date: Wed, 23 Nov 2022 23:48:55 +0000
Message-Id: <20221123234855.2485-1-chunkuang.hu@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221123_154900_489885_55C24860 
X-CRM114-Status: UNSURE (   8.09  )
X-CRM114-Notice: Please train this message.
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

Hi, Dave & Daniel:

This includes:

1. Fixup of dpi and hdmi
2. Move panel connector to head
3. Add MT8188 dpi support
4. Add MT8195 AFBC support

Regards,
Chun-Kuang.

The following changes since commit 9abf2313adc1ca1b6180c508c25f22f9395cc780:

  Linux 6.1-rc1 (2022-10-16 15:36:24 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git tags/mediatek-drm-next-6.2

for you to fetch changes up to 76cdcb87d391a8e426d81b26be0afc221291cfc2:

  drm/mediatek: Add MT8195 ovl driver support (2022-11-23 16:18:42 +0000)

----------------------------------------------------------------
Mediatek DRM Next for Linux 6.2

1. Fixup of dpi and hdmi
2. Move panel connector to head
3. Add MT8188 dpi support
4. Add MT8195 AFBC support

----------------------------------------------------------------
Gil Dekel (1):
      drm/mediatek: Make eDP panel as the first connected connector

Justin Green (2):
      drm/mediatek: Add AFBC support to Mediatek DRM driver
      drm/mediatek: Add MT8195 ovl driver support

Nathan Chancellor (1):
      drm/mediatek: Fix return type of mtk_hdmi_bridge_mode_valid()

Xinlei Lee (1):
      drm/mediatek: Modify dpi power on/off sequence.

xinlei lee (2):
      dt-bindings: display: mediatek: dpi: Add compatible for MediaTek MT8188
      drm/mediatek: Add mt8188 dpi compatibles and platform data

 .../bindings/display/mediatek/mediatek,dpi.yaml    |  1 +
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c            | 57 ++++++++++++++++-
 drivers/gpu/drm/mediatek/mtk_dpi.c                 | 29 +++++++--
 drivers/gpu/drm/mediatek/mtk_drm_drv.c             |  8 +++
 drivers/gpu/drm/mediatek/mtk_drm_plane.c           | 74 +++++++++++++++++++++-
 drivers/gpu/drm/mediatek/mtk_drm_plane.h           |  8 +++
 drivers/gpu/drm/mediatek/mtk_hdmi.c                |  7 +-
 7 files changed, 170 insertions(+), 14 deletions(-)

