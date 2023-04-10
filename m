Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1071CC77B61
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Apr 2023 23:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XaqbF8QK7DItBFQLv7NLkYA8/j2C76m3FgLlXHXbAiE=; b=oce9f9I7Uj1dDPRhcTHdoyxsme
	QjWdsTPr5b14RqFVe+52sQYgQP6IZAJa+tNXFU6BG0krqpXyFqNqIILtcI3T0uKyloQzSy6lfhlKp
	ncqdVBEaYJisOlx2EwPlu6oUTJEvNk8L/PVo8g62TwV1aAFRru5792qo023QmtHN5nbGGRSihx8KG
	pcgt7kQtDPu3QRvdAOKrkGXsCBgAQfcCXDsaOSFJZdsVfuNbJb7QSeY9Kz9blPB6WS4r04jYNyu9i
	+Daqp+cX3JywoiujaX3M4YIfLdSCNXzJBR/cv/0QsOTcZBbMESuergHX5e1IS4Sj2wnM2q8BuZg/u
	SF/Nnfsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pm0xi-00G52V-2l;
	Mon, 10 Apr 2023 23:30:14 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pm0xf-00G512-2X
	for linux-mediatek@lists.infradead.org;
	Mon, 10 Apr 2023 23:30:13 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id CA0C161BB5;
	Mon, 10 Apr 2023 23:30:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A340C433EF;
	Mon, 10 Apr 2023 23:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681169410;
	bh=fxAJLliD3eqAk8lHb8+D+7yvycKZCMLOfLqalDVN9Wg=;
	h=From:To:Cc:Subject:Date:From;
	b=P62DzVIhPtQ2D9bsyxHswE4BzYFSFvhx4HMoE/Z4zPhDLZOhfeFoXehBcxtaj9Qls
	 JWoJiySFmrB2G5auJNJF1bn2X2GRvGqstHrbVaUlta6VEtoXJVBJgzStRQ2RSDqMl8
	 4AYbATSCAd3qHUAzlRb4XQZ6MxLYnY5etvTnrV2y6x2ua3f0M+J6w4VEdKdDtdXnCk
	 Y4KSb2mEdqlbWvSKzSpAVExHLPbfKO1OG1cUpdoQv36u+ORIi9b+4P/OSXBbQhMSRp
	 4IIhta1iJDn6ea81hdJWPI1jdPJeasp+M4GGLlA2ngO2SG9HBQwFp/OtXKoNW/o+M7
	 fLc3hz4afBqbA==
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org
Cc: Xinlei Lee <xinlei.lee@mediatek.com>,
	"Nancy . Lin" <nancy.lin@mediatek.com>,
	Nathan Lu <nathan.lu@mediatek.com>,
	Alexandre Mergnat <amergnat@baylibre.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Justin Green <greenjustin@chromium.org>,
	"Jason-JH . Lin" <jason-jh.lin@mediatek.com>
Subject: [GIT PULL] mediatek drm next for 6.4
Date: Mon, 10 Apr 2023 23:30:05 +0000
Message-Id: <20230410233005.2572-1-chunkuang.hu@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230410_163011_915681_11C9A4A7 
X-CRM114-Status: GOOD (  12.01  )
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

1. Add support for 10-bit overlays
2. Add MediaTek SoC DRM (vdosys1) support for mt8195
3. Change mmsys compatible for mt8195 mediatek-drm
4. Only trigger DRM HPD events if bridge is attached
5. Change the aux retries times when receiving AUX_DEFER

Regards,
Chun-Kuang.

The following changes since commit fe15c26ee26efa11741a7b632e9f23b01aca4cc6:

  Linux 6.3-rc1 (2023-03-05 14:52:03 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git tags/mediatek-drm-next-6.4

for you to fetch changes up to 9243d70e05c5989f84f840612965f96b524da925:

  drm/mediatek: dp: Change the aux retries times when receiving AUX_DEFER (2023-04-03 16:49:49 +0000)

----------------------------------------------------------------
Mediatek DRM Next for Linux 6.4

1. Add support for 10-bit overlays
2. Add MediaTek SoC DRM (vdosys1) support for mt8195
3. Change mmsys compatible for mt8195 mediatek-drm
4. Only trigger DRM HPD events if bridge is attached
5. Change the aux retries times when receiving AUX_DEFER

----------------------------------------------------------------
Alexandre Mergnat (1):
      dt-bindings: display: mediatek: clean unnecessary item

Chen-Yu Tsai (1):
      drm/mediatek: dp: Only trigger DRM HPD events if bridge is attached

Jason-JH.Lin (1):
      drm/mediatek: Change mmsys compatible for mt8195 mediatek-drm

Justin Green (3):
      drm/mediatek: Refactor pixel format logic
      drm/mediatek: Add support for AR30 and BA30 overlays
      drm/mediatek: Enable AR30 and BA30 overlays on MT8195

Nancy.Lin (9):
      dt-bindings: mediatek: add ethdr definition for mt8195
      drm/mediatek: Add ETHDR support for MT8195
      drm/mediatek: Add ovl_adaptor support for MT8195
      drm/mediatek: Add dma dev get function
      drm/mediatek: Modify mediatek-drm for mt8195 multi mmsys support
      drm/mediatek: Add drm ovl_adaptor sub driver for MT8195
      drm/mediatek: Add mediatek-drm of vdosys1 support for MT8195
      drm/mediatek: Add mdp_rdma get format function
      drm/mediatek: Add ovl_adaptor get format function

Nathan Lu (1):
      drm/mediatek: Add mediatek-drm of vdosys0 support for mt8188

Xinlei Lee (1):
      drm/mediatek: dp: Change the aux retries times when receiving AUX_DEFER

 .../bindings/display/mediatek/mediatek,ccorr.yaml  |   5 +-
 .../bindings/display/mediatek/mediatek,ethdr.yaml  | 182 +++++++
 drivers/gpu/drm/mediatek/Makefile                  |   2 +
 drivers/gpu/drm/mediatek/mtk_disp_drv.h            |  35 ++
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c            |  94 ++++
 drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c    | 547 +++++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c           |  38 ++
 drivers/gpu/drm/mediatek/mtk_dp.c                  |  15 +-
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c            |  89 +++-
 drivers/gpu/drm/mediatek/mtk_drm_crtc.h            |   6 +-
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c        | 135 +++--
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h        |  78 ++-
 drivers/gpu/drm/mediatek/mtk_drm_drv.c             | 475 ++++++++++--------
 drivers/gpu/drm/mediatek/mtk_drm_drv.h             |  30 +-
 drivers/gpu/drm/mediatek/mtk_drm_plane.c           |  24 +-
 drivers/gpu/drm/mediatek/mtk_drm_plane.h           |   3 +-
 drivers/gpu/drm/mediatek/mtk_ethdr.c               | 370 ++++++++++++++
 drivers/gpu/drm/mediatek/mtk_ethdr.h               |  25 +
 drivers/gpu/drm/mediatek/mtk_mdp_rdma.c            |  24 +
 19 files changed, 1858 insertions(+), 319 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,ethdr.yaml
 create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
 create mode 100644 drivers/gpu/drm/mediatek/mtk_ethdr.c
 create mode 100644 drivers/gpu/drm/mediatek/mtk_ethdr.h

