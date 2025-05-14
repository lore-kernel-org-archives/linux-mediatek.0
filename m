Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB6E8C3ABDA
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 May 2025 23:36:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EkECUbVUnygvNa720IKl0rVmoKuyemtsLPO+ji1mI0U=; b=IXg+sz2NoJRjloEQmm7HPVJSl3
	qH4A39Zxqz1mGLtZwpGVMaAzEeqR+BPXqDGi+z9BW4OpJCL+CdSEHJkEVb0B2kvcwe9ukRtT4ATus
	UZQEmypn4GBtx9riFvTIssGQeABvL5RubREedVKPjApbMJ/1Nkb6mBQuL6eD0F+Va4l7OIGFVljIy
	CqVuPbbIfGJw0oNOBLcmBlP77QdFnI97TetFQOQ6OQ4LeMXfQKK1bcgpsSwDmCPkuKC6llvafST1u
	GWKgjO0+pltwE+OnesfCFY9Hgb2GVDmQmhjqbm9iFkMXMo5lQw9K8LXEYQJL4ZUYkUuQaA1Ie5d9T
	KgyIjwCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFLei-0000000GZt5-1PwO;
	Wed, 14 May 2025 23:36:56 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFLee-0000000GZsg-2Pi2
	for linux-mediatek@lists.infradead.org;
	Wed, 14 May 2025 23:36:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4C65C4A0CE;
	Wed, 14 May 2025 23:36:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A7B3C4CEE3;
	Wed, 14 May 2025 23:36:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747265811;
	bh=e/UzKf6Tf3n1PZqopATSUBunyUSvZ+piJc7LAnSV1hY=;
	h=From:To:Subject:Date:From;
	b=Kxjrv8qocEX9jhv8LsAFYqilY7EgKEGjr5GP49/deIVYCt7fYlzLjyWGKTkP7cUtB
	 GVJ3/KkgLybE5a8ibiHWdlMfKzs+zhCAsjHHlxvmK2ztEW0/l/jVaOOSjzx7BD2mst
	 QDtDh0rotyW0CAZ/h1rgNbV76Pf35s8TBbrrWAZV49sjuNHEMnF8E+LXDc/xGpF2Y6
	 oGQwd+G6cgf4jM2U+SxFNaduIeJdgR9nTzH9uKWhOThG0iGKOXMP5KCvtBp/dbYfAi
	 BQ0j/k3RdB0cuTitFTFEboOnz/Xp05wHXWRst7LnOhKtYamOBh46DfOKoyu81XTjae
	 bdZwqi/qCY33w==
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
To: David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Guillaume Ranquet <granquet@baylibre.com>,
	Tang Dongxing <tang.dongxing@zte.com.cn>
Subject: [GIT PULL] mediatek drm next - 20250515
Date: Wed, 14 May 2025 23:36:47 +0000
Message-Id: <20250514233647.15907-1-chunkuang.hu@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_163652_655780_174FEF1A 
X-CRM114-Status: UNSURE (   9.21  )
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
1. Prepare for support MT8195/88 HDMIv2 and DDCv2
2. DPI: Cleanups and add support for more formats
3. Cleanups and sanitization
4. Replace custom compare_dev with component_compare_of

Regards,
Chun-Kuang.

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git tags/mediatek-drm-next-20250515

for you to fetch changes up to 07c39476a75bf2541dbdb37815b60cc134cf9aff:

  drm/mediatek: Replace custom compare_dev with component_compare_of (2025-05-14 23:12:24 +0000)

----------------------------------------------------------------
Mediatek DRM Next - 20250515

1. Prepare for support MT8195/88 HDMIv2 and DDCv2
2. DPI: Cleanups and add support for more formats
3. Cleanups and sanitization
4. Replace custom compare_dev with component_compare_of

----------------------------------------------------------------
AngeloGioacchino Del Regno (20):
      dt-bindings: display: mediatek: Add binding for HDMIv2 DDC
      dt-bindings: display: mediatek: Add binding for MT8195 HDMI-TX v2
      drm/mediatek: mtk_cec: Switch to register as module_platform_driver
      drm/mediatek: mtk_hdmi_ddc: Switch to register as module_platform_driver
      drm/mediatek: mtk_hdmi: Convert to module_platform_driver macro
      drm/mediatek: mtk_hdmi: Disgregate function mtk_hdmi_audio_set_param()
      drm/mediatek: mtk_hdmi: Move audio params selection to new function
      drm/mediatek: mtk_hdmi: Move plugged_cb/codec_dev setting to new function
      drm/mediatek: mtk_hdmi: Move N/CTS setting to new function
      drm/mediatek: mtk_hdmi: Use dev_err_probe() in mtk_hdmi_dt_parse_pdata()
      drm/mediatek: mtk_hdmi: Move CEC device parsing in new function
      drm/mediatek: mtk_hdmi: Move output init to mtk_hdmi_register_audio_driver()
      drm/mediatek: mtk_dpi: Use switch in mtk_dpi_config_color_format()
      drm/mediatek: mtk_dpi: Add local helpers for bus format parameters
      drm/mediatek: mtk_dpi: Add support for additional output formats
      drm/mediatek: mtk_dpi: Allow additional output formats on MT8195/88
      drm/mediatek: mtk_dpi: Rename output fmts array for MT8195 DP_INTF
      drm/mediatek: mtk_drm_drv: Fix kobject put for mtk_mutex device ptr
      drm/mediatek: Fix kobject put for component sub-drivers
      drm/mediatek: mtk_drm_drv: Unbind secondary mmsys components on err

Guillaume Ranquet (1):
      drm/mediatek: hdmi: Use regmap instead of iomem for main registers

Krzysztof Kozlowski (1):
      drm/mediatek/hdmi: Use syscon_regmap_lookup_by_phandle_args

Tang Dongxing (1):
      drm/mediatek: Replace custom compare_dev with component_compare_of

 .../display/mediatek/mediatek,mt8195-hdmi-ddc.yaml |  41 +++
 .../display/mediatek/mediatek,mt8195-hdmi.yaml     | 151 ++++++++
 drivers/gpu/drm/mediatek/Makefile                  |   8 +-
 drivers/gpu/drm/mediatek/mtk_cec.c                 |   7 +-
 drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c    |   7 +-
 drivers/gpu/drm/mediatek/mtk_dpi.c                 | 117 +++++-
 drivers/gpu/drm/mediatek/mtk_drm_drv.c             |  31 +-
 drivers/gpu/drm/mediatek/mtk_hdmi.c                | 410 +++++++++------------
 drivers/gpu/drm/mediatek/mtk_hdmi.h                |  14 -
 drivers/gpu/drm/mediatek/mtk_hdmi_ddc.c            |   2 +-
 10 files changed, 497 insertions(+), 291 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,mt8195-hdmi-ddc.yaml
 create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,mt8195-hdmi.yaml
 delete mode 100644 drivers/gpu/drm/mediatek/mtk_hdmi.h

