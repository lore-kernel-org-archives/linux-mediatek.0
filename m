Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C38F8C28B2E
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Mar 2025 14:57:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=t6Spuac881Inag0aUJmGjCotgA2Pw1yY+cr3ZssQZig=; b=lhNPrl/e/OQt6VsT9JBdiFPn7L
	X0+S7s2o7HfCGn6zZXF2FcxDSrLqvbEhpVsXo2vDnN5HrP3AxZSp22T7IVVskylLTzGGoa47nUU8D
	m+RrEGtGbujmAC3Hm1KLgiu+0w07mrGQbl+OG0h+Y1fHDmYKmPy/dU+XGIj7VoqUHHs5WJ4gx+ooq
	embtK0zt27ZCnQPMWOnhEpYGmjtlp2e5Y+kEWeg6Eu+ET7zNVNouf59WfnUw7LYbzV+idYwoU33v5
	tn/3LN4xine2WbFz++WU+TyneRB0WZENwo9EZtg5G2el6tti5BYSjydtUEd4IaGD8Dff2ulvpQJAa
	lD3fyytQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1treZe-000000033Vi-3vyj;
	Mon, 10 Mar 2025 14:57:46 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trdAs-00000002nMr-2EZK
	for linux-mediatek@lists.infradead.org;
	Mon, 10 Mar 2025 13:28:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DA42B5C5DA8;
	Mon, 10 Mar 2025 13:25:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FF8DC4CEE5;
	Mon, 10 Mar 2025 13:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741613284;
	bh=1zUZf3B5y0uC+TWU4CEsCftkbi7r8iw0T6Vz28WKS+4=;
	h=From:To:Subject:Date:From;
	b=mhAr3KhZn4So+W/voBy9tOvXrwo61lxJtZEOYW0wE/r2P+4cVI35R0qzdoxf5Adkv
	 PV2xBT+0kQ0LsxEOglVmQn+tMeRPZBxzKwUzGboMmOvN1yOB1SJvZRHsn6etvaCu0t
	 E28lmBda5Qm0/09YOeN+Wkag8YInJQzq29vCsn4Y8Ysc+Kk7UrLDBXmrG7rwa7XQdl
	 vjR2zCclVeAL7cZmjRDGRrxgugvyi1MEeTIpI6xFbLrEaphi2syLmyxptZrjo2dtN4
	 wN/vqQsHaegeBNHZm5ALCLrobbxZSOxsrcJr+E2i9CSUpk/jQCCEs+By1zN/yExLGp
	 +u8MkvaPv6dFQ==
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
Subject: [GIT PULL] mediatek drm next for 6.15
Date: Mon, 10 Mar 2025 13:27:59 +0000
Message-Id: <20250310132759.3345-1-chunkuang.hu@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_062806_650673_3B56A9D2 
X-CRM114-Status: UNSURE (   8.54  )
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

Regards,
Chun-Kuang.

The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

  Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git tags/mediatek-drm-next-6.15

for you to fetch changes up to 8c9d519aa138aa36c0c3f201ff336b17b0ba32b2:

  drm/mediatek: dsi: fix error codes in mtk_dsi_host_transfer() (2025-03-03 13:26:03 +0000)

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
 drivers/gpu/drm/mediatek/mtk_crtc.c                |   5 +-
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
 15 files changed, 334 insertions(+), 171 deletions(-)

