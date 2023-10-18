Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A815CCDB47E
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Oct 2023 13:58:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=q6+JRldwPp+PHSs1OfIX8OlxFijxJgVnqAPQrm+WBps=; b=oT/ZQL7egt8QMoF+yG/EyWtGEw
	vYUvLkVePhsis+y0UJ1NtnO00Y1HYncOjJcHa8+NaX0Cd11m2SGFsUQrQyPeVnNdnIJmpm0C+D9Q9
	wmAh+aLRbvvtJj5fRdM3bS837O+KF8H884dlpcbQLytYgu1uTsOqiKXeTxBelfcMa58gG+9kCI57Q
	C8vD9RtdPm/XP09hfNEnTkVpwdDIl9wk7OSNC/wigezT7Nb6aTzY8sLC2fQ/uzZchZ8AjPKXKktRu
	R+BOtM4brtesS0UzIZkE0GS1RbvbiQDfWAF3opK4z6t+pQ0okF7ZO8Leak5xq6MMM3At2gVUXT+Ma
	5+J3grJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qt74Z-00EpTE-1N;
	Wed, 18 Oct 2023 13:58:55 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qt74W-00EpS5-0P
	for linux-mediatek@lists.infradead.org;
	Wed, 18 Oct 2023 13:58:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9BFA4617E0;
	Wed, 18 Oct 2023 13:58:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 719B1C433C7;
	Wed, 18 Oct 2023 13:58:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697637531;
	bh=wxEBr6zR30oEb1KN/pZ/GCIcJk3kW74EFYDBwxqr4AA=;
	h=From:To:Cc:Subject:Date:From;
	b=Sngmf5n6aoZxOH3ubzZrHjpUGjD1RloVY5MtNb+6SqqM+Se8rw8QPdk4SpwBTcWjs
	 SHYTWnTC8/yY7fEqQO2E1rXMqD3g5JsxwV5mutmdBUsU3jbLJPvojAqxFVBHVqC+tY
	 1/pzKeV/TePNeN+p00j5VbhLvpjTyjHaB+XRe2/yI+WVdLnVmyNEj3PG7vdIggXKBc
	 Zj+hdc/ez4dLzjWMfdHkF7F6BjQiLah9mc0G0+BaflPq2mxtGg/6V08rZISBdRlfc7
	 F3rhNcGhh238m09IZYdzOqeYWtGamS8wvdu4BOnb/ZX0MdxGNI7Wapj4kldkVxJZ1G
	 pDf0fSz0zeC5A==
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org
Cc: Shuijing Li <shuijing.li@mediatek.com>,
	"Jason-JH . Lin" <jason-jh.lin@mediatek.com>,
	Jani Nikula <jani.nikula@intel.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [GIT PULL] mediatek drm next for 6.7
Date: Wed, 18 Oct 2023 13:58:46 +0000
Message-Id: <20231018135846.5811-1-chunkuang.hu@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231018_065852_249453_994A5B7E 
X-CRM114-Status: UNSURE (   8.99  )
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

1. Add support MT8188 dsi function
2. Fix coverity issue with unintentional integer overflow
3. Add support MT8188 dp/edp function
4. Fix memory leak on ->get_edid callback audio detection
   and error path.
5. Add connector dynamic selection capability
6. MediaTek DDP GAMMA - 12-bit LUT support
7. mtk_dsi: Fix NO_EOT_PACKET settings/handling

Regards,
Chun-Kuang.

The following changes since commit 0bb80ecc33a8fb5a682236443c1e740d5c917d1d:

  Linux 6.6-rc1 (2023-09-10 16:28:41 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git tags/mediatek-drm-next-6.7

for you to fetch changes up to 5855d422a6f250f3518f43b49092c8e87a5e42be:

  drm: mediatek: mtk_dsi: Fix NO_EOT_PACKET settings/handling (2023-10-18 13:18:22 +0000)

----------------------------------------------------------------
Mediatek DRM Next for Linux 6.7

1. Add support MT8188 dsi function
2. Fix coverity issue with unintentional integer overflow
3. Add support MT8188 dp/edp function
4. Fix memory leak on ->get_edid callback audio detection
   and error path.
5. Add connector dynamic selection capability
6. MediaTek DDP GAMMA - 12-bit LUT support
7. mtk_dsi: Fix NO_EOT_PACKET settings/handling

----------------------------------------------------------------
AngeloGioacchino Del Regno (16):
      drm/mediatek: gamma: Reduce indentation in mtk_gamma_set_common()
      drm/mediatek: gamma: Support SoC specific LUT size
      drm/mediatek: gamma: Improve and simplify HW LUT calculation
      drm/mediatek: gamma: Enable the Gamma LUT table only after programming
      drm/mediatek: gamma: Use bitfield macros
      drm/mediatek: aal: Use bitfield macros
      drm/mediatek: De-commonize disp_aal/disp_gamma gamma_set functions
      drm/mediatek: gamma: Support multi-bank gamma LUT
      drm/mediatek: gamma: Add support for 12-bit LUT
      drm/mediatek: gamma: Add support for MT8195
      drm/mediatek: gamma: Make sure relay mode is disabled
      drm/mediatek: gamma: Program gamma LUT type for descending or rising
      drm/mediatek: aal: Add kerneldoc for struct mtk_disp_aal
      drm/mediatek: gamma: Add kerneldoc for struct mtk_disp_gamma
      drm/mediatek: aal: Compress of_device_id entries and add sentinel
      drm: mediatek: mtk_dsi: Fix NO_EOT_PACKET settings/handling

Jani Nikula (2):
      drm/mediatek/dp: fix memory leak on ->get_edid callback audio detection
      drm/mediatek/dp: fix memory leak on ->get_edid callback error path

Jason-JH.Lin (12):
      drm/mediatek: Fix coverity issue with unintentional integer overflow
      drm/mediatek: Add mmsys_dev_num to mt8188 vdosys0 driver data
      drm/mediatek: Add crtc path enum for all_drm_priv array
      drm/mediatek: Fix using wrong drm private data to bind mediatek-drm
      drm/mediatek: Add encoder_index interface for mtk_ddp_comp_funcs
      drm/mediatek: Add connector dynamic selection capability
      drm/mediatek: dpi: Support dynamic connector selection
      drm/mediatek: dsi: Support dynamic connector selection
      drm/mediatek: Support dynamic selection of MT8188 VDOSYS0
      drm/mediatek: Fix iommu fault by swapping FBs after updating plane state
      drm/mediatek: Fix iommu fault during crtc enabling
      drm/mediatek: gamma: Adjust mtk_drm_gamma_set_common parameters

Shuijing Li (8):
      dt-bindings: display: mediatek: dsi: Add compatible for MediaTek MT8188
      drm/mediatek: dsi: Add dsi cmdq_ctl to send panel initial code
      drm/mediatek: Add mt8188 dsi compatible to mtk_dsi.c
      dt-bindings: display: mediatek: dp: Add compatible for MediaTek MT8188
      drm/mediatek: dp: Add the audio packet flag to mtk_dp_data struct
      drm/mediatek: dp: Add the audio divider to mtk_dp_data struct
      drm/mediatek: dp: Add support MT8188 dp/edp function
      drm/mediatek: dsi: Add mode_valid callback to DSI bridge

 .../bindings/display/mediatek/mediatek,dp.yaml     |   2 +
 .../bindings/display/mediatek/mediatek,dsi.yaml    |   1 +
 drivers/gpu/drm/mediatek/mtk_disp_aal.c            |  86 ++++++++-
 drivers/gpu/drm/mediatek/mtk_disp_drv.h            |   5 +-
 drivers/gpu/drm/mediatek/mtk_disp_gamma.c          | 203 +++++++++++++++++----
 drivers/gpu/drm/mediatek/mtk_dp.c                  |  42 ++++-
 drivers/gpu/drm/mediatek/mtk_dp_reg.h              |  23 ++-
 drivers/gpu/drm/mediatek/mtk_dpi.c                 |   9 +
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c            |  83 ++++++++-
 drivers/gpu/drm/mediatek/mtk_drm_crtc.h            |   6 +-
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c        |  34 +++-
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h        |  17 ++
 drivers/gpu/drm/mediatek/mtk_drm_drv.c             |  47 ++++-
 drivers/gpu/drm/mediatek/mtk_drm_drv.h             |  15 +-
 drivers/gpu/drm/mediatek/mtk_drm_gem.c             |   9 +-
 drivers/gpu/drm/mediatek/mtk_drm_plane.c           |  41 ++++-
 drivers/gpu/drm/mediatek/mtk_dsi.c                 |  48 ++++-
 17 files changed, 583 insertions(+), 88 deletions(-)

