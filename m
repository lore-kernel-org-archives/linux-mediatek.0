Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97B9BC48BF6
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Feb 2024 16:21:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=iSuzYSxR1qmeyldNDHNARQ2hz+Hv9FEZf+0IazXWCtE=; b=i8lgCTtJOFTelhFL29lrkCsNeQ
	CD++FEB6bs/uZ8MxdHBTdC4LBX9tpycMeFQQFZcVTQDGolRAJBvo3tlRIvHWuGcSZMhWcdnrGpH2Z
	6jKDUoyq4I1hvr3dKSH6mOYgfbhiyqG9HSOBU+JWSfgJt5Km/pJTHztvh8J7+NLyQVPHkq/kF+xMf
	HXXSURuV+efafokgi1SU0x6/yaiymbknI/QppnGS8qtnQklVCHlIC1YLrPvPclUDtPQakZb6IYoG3
	A5SLpt/onsdvSeeJB03TF9xwRyfB9vSL3Vrzldu9ofk3ecNfa+uoUz70jQE2uq2WO6nCKa5jLNOxJ
	rBSzbNgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfjAQ-0000000EGgo-1AUL;
	Thu, 29 Feb 2024 16:21:54 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfjAM-0000000EGew-2iCO
	for linux-mediatek@lists.infradead.org;
	Thu, 29 Feb 2024 16:21:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 74654CE022B;
	Thu, 29 Feb 2024 16:21:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 116F5C433C7;
	Thu, 29 Feb 2024 16:21:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709223707;
	bh=1+cy61Mj8Q+WBtF9d1xGIDEwN/pAnkT6tvBKpomCTEQ=;
	h=From:To:Cc:Subject:Date:From;
	b=IchzYkK6MDrNK7HizlXxwFSFOKsNeROrWb3KWipwDl22+CTGQcwJ40GUbxV9cxx6E
	 JgBvxjXkqGJoxeLTVRcvxC7XGoxXFviyjCAiTry/X7dMNdFKGEdFX+bpv22MiOoCzK
	 soMzSZmVz8J7I4ZhTahQidHB6csRmG9oAF0UWTrzM6u68k0rlLSuJmMC9v9qUVQwoc
	 nEgym8m0fyfT0vN1iFnyxVhrS4L9bFGY1aw3i2uYOCKFHuuLw7CcoeNBknAqUjAe8Q
	 fu87z18gNZESOKlj3Bs7eFbEjqDQl4H7BaMEGgmeeGGJOkDmGX4Qpb6IbzFgLxT1jn
	 2zcaHKWx8eoAg==
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org
Cc: Hsiao Chien Sung <shawn.sung@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Hsin-Yi Wang <hsinyi@chromium.org>
Subject: [GIT PULL] mediatek drm next for 6.9
Date: Thu, 29 Feb 2024 16:21:43 +0000
Message-Id: <20240229162143.28957-1-chunkuang.hu@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240229_082150_884661_39F87EBA 
X-CRM114-Status: UNSURE (   6.48  )
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

1. Add display driver for MT8188 VDOSYS1
2. DSI driver cleanups
3. Filter modes according to hardware capability
4. Fix a null pointer crash in mtk_drm_crtc_finish_page_flip

Regards,
Chun-Kuang.

The following changes since commit 6613476e225e090cc9aad49be7fa504e290dd33d:

  Linux 6.8-rc1 (2024-01-21 14:11:32 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git tags/mediatek-drm-next-6.9

for you to fetch changes up to c958e86e9cc1b48cac004a6e245154dfba8e163b:

  drm/mediatek: Fix a null pointer crash in mtk_drm_crtc_finish_page_flip (2024-02-29 16:15:28 +0000)

----------------------------------------------------------------
Mediatek DRM Next for Linux 6.9

1. Add display driver for MT8188 VDOSYS1
2. DSI driver cleanups
3. Filter modes according to hardware capability
4. Fix a null pointer crash in mtk_drm_crtc_finish_page_flip

----------------------------------------------------------------
AngeloGioacchino Del Regno (9):
      drm/mediatek: dsi: Use GENMASK() for register mask definitions
      drm/mediatek: dsi: Fix DSI RGB666 formats and definitions
      drm/mediatek: dsi: Cleanup functions mtk_dsi_ps_control{_vact}()
      drm/mediatek: dsi: Use bitfield macros where useful
      drm/mediatek: dsi: Replace open-coded instance of HZ_PER_MHZ
      drm/mediatek: dsi: Register DSI host after acquiring clocks and PHY
      drm/mediatek: dsi: Simplify with dev_err_probe and remove gotos
      drm/mediatek: dsi: Compress of_device_id entries and add sentinel
      drm/mediatek: dsi: Use mipi_dsi_pixel_format_to_bpp() helper function

Hsiao Chien Sung (3):
      drm/mediatek: Add Padding to OVL adaptor
      drm/mediatek: Support MT8188 VDOSYS1 in display driver
      drm/mediatek: Filter modes according to hardware capability

Hsin-Yi Wang (1):
      drm/mediatek: Fix a null pointer crash in mtk_drm_crtc_finish_page_flip

 drivers/gpu/drm/mediatek/mtk_disp_drv.h         |   4 +
 drivers/gpu/drm/mediatek/mtk_disp_merge.c       |  65 +++++
 drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c |  43 ++++
 drivers/gpu/drm/mediatek/mtk_drm_crtc.c         |  29 ++-
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c     |   1 +
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h     |  12 +
 drivers/gpu/drm/mediatek/mtk_drm_drv.c          |   4 +-
 drivers/gpu/drm/mediatek/mtk_dsi.c              | 310 ++++++++++--------------
 8 files changed, 278 insertions(+), 190 deletions(-)

