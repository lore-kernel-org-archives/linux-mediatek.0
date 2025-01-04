Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E84B5E77188
	for <linux-mediatek@archiver.kernel.org>; Sat,  4 Jan 2025 12:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kqbUvv0CXt9RdulI9bIVcE+IxBG7OHOyo3iuG7TnbYo=; b=mvOX24YyMKruB055LyNDV8IrmS
	irqshR984pV1fYkQxL0RfO+xdGVDmAnhQE5upHaKAfuPqMquBO2ZFN6E5MV8dFnzVRd/DKnW6vvka
	Plpl/vREjA6ACWU7hum1Th81YqOHOaJRDuhTu6U9rGYkp1r6PCINAR7c6lsxhEa80ZQUx9Y7kg305
	TvE9z6WromG5f3M6GeTVYfy4wmR/5kivdYc0lehudyBa2R9bSBYQjTMQYIYbd49pDQLf+FUxeGh8U
	3Kl3/eCKn4uQRfxO2KyR/8sLqsvC/a+LR+DD96EAuaiiEeiYgNSANdYy2JOT0LpsrKPoOFNJAbSzf
	9pWmo4uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tU3UG-0000000EzKv-3pXu;
	Sat, 04 Jan 2025 12:42:40 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tU3UA-0000000EzK9-2JaO
	for linux-mediatek@lists.infradead.org;
	Sat, 04 Jan 2025 12:42:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id DF1DFA4032F;
	Sat,  4 Jan 2025 12:40:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09B0FC4CED1;
	Sat,  4 Jan 2025 12:42:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735994552;
	bh=i3MCDANbM1srZh8kgYeU036iM9ApZitZLDa4c9jlvhI=;
	h=From:To:Subject:Date:From;
	b=dAwITT5jmQfKT+RNq/xcYyBsrL2wFV6NRm8WWvNl16/oLZgf5At/OaJP/0OwuW54/
	 FT3lTKPwdhXAvux7jpe7TtD2P5zX6zjpx24CDkA6mI/x3vE9jFFLkQlKyf3ELfz5XZ
	 1wDF4x/R9siHR2lvCGL1oG3cM/aNfuoNqApNsa/S42GEZeCw+rbXbymeYJuTXBUyl8
	 5UmyxwHOYjN4ytdq+XIzHzPcAYDiJl58YLNSxOXqQaw7gfjQEXp+iimAwn7DMGBcX6
	 9kZJ8y+N/SmDZ9oQ35Scafgcpc7vDV/85qpvsXQGu0Ikn23psSR8wc0+U3zKcRxtSz
	 6vMjAWs2Whlzg==
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	Guoqing Jiang <guoqing.jiang@canonical.com>,
	"Jason-JH . Lin" <jason-jh.lin@mediatek.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Liankun Yang <liankun.yang@mediatek.com>,
	Fei Shao <fshao@chromium.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [GIT PULL] mediatek drm fixes 20250104
Date: Sat,  4 Jan 2025 12:42:27 +0000
Message-Id: <20250104124227.45505-1-chunkuang.hu@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250104_044234_739930_E08D5D59 
X-CRM114-Status: UNSURE (   7.88  )
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

1. Revert "drm/mediatek: dsi: Correct calculation formula of PHY Timing"
2. Set private->all_drm_private[i]->drm to NULL if mtk_drm_bind returns err
3. Move mtk_crtc_finish_page_flip() to ddp_cmdq_cb()
4. Only touch DISP_REG_OVL_PITCH_MSB if AFBC is supported
5. Add support for 180-degree rotation in the display driver
6. Stop selecting foreign drivers
7. Revert "drm/mediatek: Switch to for_each_child_of_node_scoped()"
8. Fix YCbCr422 color format issue for DP
9. Fix mode valid issue for dp
10. dp: Reference common DAI properties
11. dsi: Add registers to pdata to fix MT8186/MT8188
12. Remove unneeded semicolon
13. Add return value check when reading DPCD
14. Initialize pointer in mtk_drm_of_ddp_path_build_one()

Regards,
Chun-Kuang.

The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:

  Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git tags/mediatek-drm-fixes-20250104

for you to fetch changes up to f563dd9ca6cb6ed52c5fb6e4285d1ef26cfa7e8a:

  drm/mediatek: Initialize pointer in mtk_drm_of_ddp_path_build_one() (2025-01-04 12:15:19 +0000)

----------------------------------------------------------------
Mediatek DRM Fixes - 20250104

1. Revert "drm/mediatek: dsi: Correct calculation formula of PHY Timing"
2. Set private->all_drm_private[i]->drm to NULL if mtk_drm_bind returns err
3. Move mtk_crtc_finish_page_flip() to ddp_cmdq_cb()
4. Only touch DISP_REG_OVL_PITCH_MSB if AFBC is supported
5. Add support for 180-degree rotation in the display driver
6. Stop selecting foreign drivers
7. Revert "drm/mediatek: Switch to for_each_child_of_node_scoped()"
8. Fix YCbCr422 color format issue for DP
9. Fix mode valid issue for dp
10. dp: Reference common DAI properties
11. dsi: Add registers to pdata to fix MT8186/MT8188
12. Remove unneeded semicolon
13. Add return value check when reading DPCD
14. Initialize pointer in mtk_drm_of_ddp_path_build_one()

----------------------------------------------------------------
AngeloGioacchino Del Regno (2):
      drm/mediatek: mtk_dsi: Add registers to pdata to fix MT8186/MT8188
      drm/mediatek: Initialize pointer in mtk_drm_of_ddp_path_build_one()

Arnd Bergmann (1):
      drm/mediatek: stop selecting foreign drivers

Chun-Kuang Hu (3):
      Revert "drm/mediatek: dsi: Correct calculation formula of PHY Timing"
      Revert "drm/mediatek: Switch to for_each_child_of_node_scoped()"
      drm/mediatek: Remove unneeded semicolon

Daniel Golle (1):
      drm/mediatek: Only touch DISP_REG_OVL_PITCH_MSB if AFBC is supported

Fei Shao (1):
      dt-bindings: display: mediatek: dp: Reference common DAI properties

Guoqing Jiang (1):
      drm/mediatek: Set private->all_drm_private[i]->drm to NULL if mtk_drm_bind returns err

Jason-JH.Lin (2):
      drm/mediatek: Move mtk_crtc_finish_page_flip() to ddp_cmdq_cb()
      drm/mediatek: Add support for 180-degree rotation in the display driver

Liankun Yang (3):
      drm/mediatek: Fix YCbCr422 color format issue for DP
      drm/mediatek: Fix mode valid issue for dp
      drm/mediatek: Add return value check when reading DPCD

 .../bindings/display/mediatek/mediatek,dp.yaml     | 19 +++++-
 drivers/gpu/drm/mediatek/Kconfig                   |  5 --
 drivers/gpu/drm/mediatek/mtk_crtc.c                | 25 ++++++--
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c            | 69 ++++++++++++----------
 drivers/gpu/drm/mediatek/mtk_dp.c                  | 46 +++++++++------
 drivers/gpu/drm/mediatek/mtk_drm_drv.c             | 13 ++--
 drivers/gpu/drm/mediatek/mtk_dsi.c                 | 49 +++++++++------
 7 files changed, 142 insertions(+), 84 deletions(-)

