Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACF00C28B28
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Mar 2025 23:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bIsH1iLH3iJLNxbDzTupE1Y7KPlVT6jjMyCRNL01ZWI=; b=xctudTucKRoeJcBBP3le+J+5U0
	9jY/4NwUaoa6K0w8KL/eq3DjhhBo+eAfMOpvTg4zLJr7deo7R8a2cEygtuI/ivUw2nMav8iTjLtrl
	Lw8gv2OffS1AogGGyoqzj9vUDCQDnn6mozduO5CtMoDmQiFco5cLWdneeaO5uZPS9IgRJAebvOey+
	hPqwAraqYxSgE5L8iViY3CKU9VJnry5YyBXBTue559bhzMk5K82swtNJO9wwbl7/PySIRRfOlieNG
	WexsenVyh4DTJwBi/1Ts5bDITPxcT2tuPXQNGHP1LcFxIK/WiZKRIAlN/2soCuws7VCWvdz31laFk
	eDm4FWfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsVVl-00000009igP-2NHr;
	Wed, 12 Mar 2025 23:29:17 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsVVj-00000009ig5-2U76
	for linux-mediatek@lists.infradead.org;
	Wed, 12 Mar 2025 23:29:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7F2835C3478;
	Wed, 12 Mar 2025 23:26:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13CC7C4CEDD;
	Wed, 12 Mar 2025 23:29:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741822154;
	bh=x62sbzA5ZGFY6Vpx4VKtlq3SQzLkZlbRve7cNBb0oWU=;
	h=From:To:Subject:Date:From;
	b=kseCjW2Tq4Ugz8JV7IfKJEKkTCrp3D9G6oktITPUad7QBX82kKdRfBWTx1QYRq+ke
	 YXcbgW7ngVzWCJ5Jmy/QDxYmb89kSLoM0A/Ff+WmnTdC2spJi4o6sB0Mw4myv41qfF
	 q/mAC7HxNsVEmLECqr1ndkQGBs8mf3l2I0yevhqHlSCi12BRUPtmUu8til9a1Ydjfb
	 c6SdP5U2VjMwSSR6ps/ii4soOv1MoSWHU/zKSIiQTVjsmFRQhjam7kNtUL1b7hFx/8
	 Bi9cL8Rqrxr3YNtiwmrxNlR/2IzILq3D3xzQ4F1E4WtUXTBmVnzcz+xXYvZDiaFwWH
	 1cdAPLUFq1Zeg==
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Anusha Srivatsa <asrivats@redhat.com>,
	Jason-JH Lin <jason-jh.lin@mediatek.com>,
	Douglas Anderson <dianders@chromium.org>,
	Fabien Parent <fparent@baylibre.com>,
	Dan Carpenter <dan.carpenter@linaro.org>
Subject: [GIT PULL v2] mediatek drm next for 6.15
Date: Wed, 12 Mar 2025 23:29:09 +0000
Message-Id: <20250312232909.9304-1-chunkuang.hu@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_162915_716617_6ECE90FF 
X-CRM114-Status: UNSURE (   7.92  )
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
1. HDMI fixup and refinement
2. Move to devm_platform_ioremap_resource() usage
3. Add MT8188 dsc compatible
4. Fix config_updating flag never false when no mbox channel
5. dp: drm_err => dev_err in HPD path to avoid NULL ptr
6. Add dpi power-domains example
7. Add MT8365 SoC support
8. Fix error codes in mtk_dsi_host_transfer()

---
Change from v1: Fix build warning.

Regards,
Chun-Kuang.

The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

  Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git tags/mediatek-drm-next-6.15-v2

for you to fetch changes up to dcb166ee43c3d594e7b73a24f6e8cf5663eeff2c:

  drm/mediatek: dsi: fix error codes in mtk_dsi_host_transfer() (2025-03-12 23:17:22 +0000)

----------------------------------------------------------------
Mediatek DRM Next for Linux 6.15

1. HDMI fixup and refinement
2. Move to devm_platform_ioremap_resource() usage
3. Add MT8188 dsc compatible
4. Fix config_updating flag never false when no mbox channel
5. dp: drm_err => dev_err in HPD path to avoid NULL ptr
6. Add dpi power-domains example
7. Add MT8365 SoC support
8. Fix error codes in mtk_dsi_host_transfer()

----------------------------------------------------------------
AngeloGioacchino Del Regno (21):
      drm/mediatek: mtk_hdmi: Unregister audio platform device on failure
      drm/mediatek: mtk_hdmi: Fix typo for aud_sampe_size member
      drm/mediatek: mtk_hdmi: Compress of_device_id array entries
      drm/mediatek: mtk_hdmi: Move vendor/product strings to drm_bridge
      drm/mediatek: mtk_hdmi: Remove unused members of struct mtk_hdmi
      drm/mediatek: mtk_hdmi: Use devm managed version of drm_bridge_add
      drm/mediatek: mtk_hdmi: Remove ifdef for CONFIG_PM_SLEEP
      drm/mediatek: mtk_hdmi: Remove goto in mtk_hdmi_clk_enable_audio()
      drm/mediatek: mtk_hdmi: Remove driver bound to HDMI print
      drm/mediatek: mtk_hdmi: Cleanup function mtk_hdmi_resume()
      dt-bindings: display: mediatek: dpi: Add MT8195 and MT8188 compat
      drm/mediatek: mtk_dpi: Add support for Pattern Generator in debugfs
      drm/mediatek: mtk_dpi: Use an array for pixclk factor calculation
      drm/mediatek: mtk_dpi: Move pixel clock setting flow to function
      drm/mediatek: mtk_dpi: Add checks for reg_h_fre_con existence
      drm/mediatek: mtk_dpi: Move the input_2p_en bit to platform data
      drm/mediatek: mtk_dpi: Add support for DPI input clock from HDMI
      drm/mediatek: mtk_dpi: Support AFIFO 1T1P output and conversion
      drm/mediatek: mtk_dpi: Explicitly manage TVD clock in power on/off
      drm/mediatek: Add support for MT8195 Digital Parallel Interface
      dt-bindings: display: mediatek: dsc: Add MT8188 compatible

Anusha Srivatsa (1):
      drm/mediatek: Move to devm_platform_ioremap_resource() usage

Dan Carpenter (1):
      drm/mediatek: dsi: fix error codes in mtk_dsi_host_transfer()

Douglas Anderson (1):
      drm/mediatek: dp: drm_err => dev_err in HPD path to avoid NULL ptr

Fabien Parent (2):
      dt-bindings: display: mediatek: dpi: add power-domains example
      drm/mediatek: add MT8365 SoC support

Jason-JH Lin (1):
      drm/mediatek: Fix config_updating flag never false when no mbox channel

 .../bindings/display/mediatek/mediatek,dpi.yaml    |   7 +
 .../bindings/display/mediatek/mediatek,dsc.yaml    |   3 +
 drivers/gpu/drm/mediatek/mtk_crtc.c                |   7 +-
 drivers/gpu/drm/mediatek/mtk_disp_color.c          |   4 +-
 drivers/gpu/drm/mediatek/mtk_disp_gamma.c          |   4 +-
 drivers/gpu/drm/mediatek/mtk_disp_merge.c          |   4 +-
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c            |   4 +-
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c           |   4 +-
 drivers/gpu/drm/mediatek/mtk_dp.c                  |   6 +-
 drivers/gpu/drm/mediatek/mtk_dpi.c                 | 323 +++++++++++++++------
 drivers/gpu/drm/mediatek/mtk_dpi_regs.h            |   9 +
 drivers/gpu/drm/mediatek/mtk_drm_drv.c             |  10 +
 drivers/gpu/drm/mediatek/mtk_dsi.c                 |  10 +-
 drivers/gpu/drm/mediatek/mtk_hdmi.c                | 108 +++----
 drivers/gpu/drm/mediatek/mtk_mdp_rdma.c            |   4 +-
 15 files changed, 336 insertions(+), 171 deletions(-)

