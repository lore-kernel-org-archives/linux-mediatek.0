Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06E81C35274
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Dec 2023 14:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=klt/jQVmL0Wx9D4S28Y/TUHKvTrE2pecqXu9u4+HsAE=; b=srxYvYqs6Ls+3aqdzEcEx3WnL9
	PYhywluNDXh6uzyi4u8qigcaGfxn+fw1ltKN+nImd/EsiLe35dnhUmf7NqY/1RsW1cDui+XAjNwjm
	PRY9Jh+iI8xZmj5roqhReULIMeuNbIBnv5A7L6rKmBlVoYimZzg0Iw0ejrA9hbrRbA8IprbUBlDsp
	6V9TysTTeHWsvxayI9RnR20jSi+qObv0ALtB/JCzE/wK3S2x9L4+nCT82N738R5rWeuhAqGLS3tIS
	jcjP69EAFPt/f4oTOjx3KS14xCPdGHAaJRIZpVroXCfjdTRN7VGNdsc5yYE9arLaj7TRsMxu2E8+P
	tk0If/Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFF4k-00B7PS-2x;
	Mon, 18 Dec 2023 14:58:34 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFF4h-00B7Ov-34
	for linux-mediatek@lists.infradead.org;
	Mon, 18 Dec 2023 14:58:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 297F36103E;
	Mon, 18 Dec 2023 14:58:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AE9AC433C8;
	Mon, 18 Dec 2023 14:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702911510;
	bh=6LAl176ZhST6JB0D7GcBf8KrJiM7ETJQxrahsxZmBok=;
	h=From:To:Cc:Subject:Date:From;
	b=muTOJZ8woBy6swRqoxPS4w+YQaS2b1WXqn+sySIkIuQMoB2FoGs4CYSNCh2abm3Zm
	 XGZJ/ugBxCiE0CsuR4rpTTw/HjdyYZ6XnGkY2p/fQVPHZwyMppEn5OylbHD0XSzFzW
	 B6e+i88s0Bw5a1RY8UEnyIwI1bTOxCjzO+co0722beET9uSPWUv+YHpxNP2OokrRMI
	 90m9WszrI/r6LVtMTtyoNHHiVhMYFZpnBb+K3YITrOfnwWh9sD/KlhXEtgIBgtxkm+
	 dueVeARKlqWnPAMagflm0A+B8dKgj5NqKtI5SxoLQ1cZhCBp2EW7boDMHwG/gCDvwk
	 pekvP7R8/6lzg==
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org
Cc: Yang Li <yang.lee@linux.alibaba.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Hsiao Chien Sung <shawn.sung@mediatek.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>
Subject: [GIT PULL] mediatek drm next for 6.8
Date: Mon, 18 Dec 2023 14:58:26 +0000
Message-Id: <20231218145826.5643-1-chunkuang.hu@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231218_065832_093724_8CCDB8E4 
X-CRM114-Status: UNSURE (   9.79  )
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

1. Use devm_platform_ioremap_resource()
2. Stop using iommu_present()
3. Add display driver for MT8188 VDOSYS1
4. Add phy_mtk_dp module as pre-dependency

Regards,
Chun-Kuang.

The following changes since commit b85ea95d086471afb4ad062012a4d73cd328fa86:

  Linux 6.7-rc1 (2023-11-12 16:19:07 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git tags/mediatek-drm-next-6.8

for you to fetch changes up to c8048dd0b07df68724805254b9e994d99e9a7af4:

  drm/mediatek: dp: Add phy_mtk_dp module as pre-dependency (2023-12-18 14:31:32 +0000)

----------------------------------------------------------------
Mediatek DRM Next for Linux 6.8

1. Use devm_platform_ioremap_resource()
2. Stop using iommu_present()
3. Add display driver for MT8188 VDOSYS1
4. Add phy_mtk_dp module as pre-dependency

----------------------------------------------------------------
Hsiao Chien Sung (15):
      dt-bindings: display: mediatek: ethdr: Add compatible for MT8188
      dt-bindings: display: mediatek: mdp-rdma: Add compatible for MT8188
      dt-bindings: display: mediatek: merge: Add compatible for MT8188
      dt-bindings: display: mediatek: padding: Add MT8188
      drm/mediatek: Rename OVL_ADAPTOR_TYPE_RDMA
      drm/mediatek: Add component ID to component match structure
      drm/mediatek: Manage component's clock with function pointers
      drm/mediatek: Power on/off devices with function pointers
      drm/mediatek: Start/Stop components with function pointers
      drm/mediatek: Sort OVL adaptor components
      drm/mediatek: Refine device table of OVL adaptor
      drm/mediatek: Support MT8188 Padding in display driver
      drm/mediatek: Return error if MDP RDMA failed to enable the clock
      drm/mediatek: Remove the redundant driver data for DPI
      drm/mediatek: Fix underrun in VDO1 when switches off the layer

Nícolas F. R. A. Prado (1):
      drm/mediatek: dp: Add phy_mtk_dp module as pre-dependency

Robin Murphy (1):
      drm/mediatek: Stop using iommu_present()

Yang Li (1):
      drm/mediatek: Use devm_platform_ioremap_resource()

 .../bindings/display/mediatek/mediatek,ethdr.yaml  |   6 +-
 .../display/mediatek/mediatek,mdp-rdma.yaml        |   6 +-
 .../bindings/display/mediatek/mediatek,merge.yaml  |   3 +
 .../display/mediatek/mediatek,padding.yaml         |  81 +++++++
 drivers/gpu/drm/mediatek/Makefile                  |   3 +-
 drivers/gpu/drm/mediatek/mtk_cec.c                 |   4 +-
 drivers/gpu/drm/mediatek/mtk_disp_aal.c            |   4 +-
 drivers/gpu/drm/mediatek/mtk_disp_ccorr.c          |   4 +-
 drivers/gpu/drm/mediatek/mtk_disp_drv.h            |   8 +
 drivers/gpu/drm/mediatek/mtk_disp_merge.c          |   2 +-
 drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c    | 248 ++++++++++++---------
 drivers/gpu/drm/mediatek/mtk_dp.c                  |   1 +
 drivers/gpu/drm/mediatek/mtk_dpi.c                 |  16 +-
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c            |  10 +-
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c        |   2 +
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h        |  20 ++
 drivers/gpu/drm/mediatek/mtk_drm_drv.c             |   5 +-
 drivers/gpu/drm/mediatek/mtk_drm_drv.h             |   2 +-
 drivers/gpu/drm/mediatek/mtk_mdp_rdma.c            |  19 +-
 drivers/gpu/drm/mediatek/mtk_padding.c             | 160 +++++++++++++
 20 files changed, 461 insertions(+), 143 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,padding.yaml
 create mode 100644 drivers/gpu/drm/mediatek/mtk_padding.c

