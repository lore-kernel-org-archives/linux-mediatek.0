Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FF1BC7EE2E
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 May 2023 15:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=u469KRx4vCdKAgsfJAWOcmQKH6zjtkSVtIxNGkN2biE=; b=Y+Vb3HI2nwnWPc
	ih8RHyqZmyjwWYnlEN1rCUc+8VoUmPTuiJda26TgApveHDKtbJ50a61I0IgmjpWgdTGuoATsGS+Nq
	Y9vk0YEy5Dza1IsfehZ9J+SQ1Aa5tUcx7FAP0ZLFqGdB/Gpoii6Zm7/NbQVLvkkmzuXSQeyNiTgFv
	DQdkKGFRebPVTsUIsVviFvregCPzLRxMrBaA9JHwKb0F+qQ2jYmCsDsG5Buvzk8k/+u2OQxp0dAld
	h3jg7JCiuS1uKMrxMG45yW48vPMi5Mq4ry8rYdr1s3l5bE7eHgDG91MGD2fapYH3VtEjUrIqVUqOi
	ts7Vwl5l+lch2f0Zaarw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3f3c-00AyLB-0m;
	Mon, 29 May 2023 15:45:16 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3dzF-00AnPm-0T
	for linux-mediatek@lists.infradead.org;
	Mon, 29 May 2023 14:36:44 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-514ab6cb529so361906a12.1
        for <linux-mediatek@lists.infradead.org>; Mon, 29 May 2023 07:36:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1685370997; x=1687962997;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=u469KRx4vCdKAgsfJAWOcmQKH6zjtkSVtIxNGkN2biE=;
        b=LIZ4udwIb2+6Nfp5qkp9iblRacSJeZvPPcNcudBzj55PlslMHwN9P4aafKJbgKR/fI
         L2xsMqJu3btNijZwCJzEMJHNiKHVMHTX2ihz2jFKtNm+TyDdM8tb9IB07gwEDTdrYlGJ
         UqNV9TW751xwkDwv5HpblkjURzWpP060pFuxLpy1K9Qg6i+PPzAlJ1xnXRkj9UPCpg82
         YrzoLlQ9WuxiDokSGrfaf823RunWlIYNf5IC25S6fo2DMd4EM4uKfLtEjSDKJb8MxeEL
         2PcZYZl3ziHLluExHZ0qn1BNjMBf+VnhUH0fnSdqwup6fR8HQo5ax2WB5LBTeyF36jtX
         L9gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685370997; x=1687962997;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u469KRx4vCdKAgsfJAWOcmQKH6zjtkSVtIxNGkN2biE=;
        b=N6IzkECdzG4yFg9zHa7fzXsBQ1fpYnLn4uH/Y53M1bl5QVbtE7cY8EX8FCXl4cCp4X
         JEc1MGryRiobDrqD7aTejiA+od0gBd7xcaGEgeO/RbcbJigWYVmdUgE4hXBQosMUAnOS
         2LjjWUkmQwaAXoFIdkcOwY09XFvFKCKe4T/1mqUa9Sahj/hAF4pj7cV28RG1CpPFXKgW
         meZfx2hHp9y16ekZ+9NKUKXrtvY5ketIdmmwgQR6nPqflUlDpl+R6CDGasrJcaR0Iv0D
         8809sB5Kw6Z1S/w0Sce01LIKc/vbqVrLp1s3omlU/lPU/naFN6BQVljs0USDvXdIVkm8
         QSQA==
X-Gm-Message-State: AC+VfDzUP8WuzQEIKdd9WiA6fsDYPJDBjw2ZP+HlZ6+r3IwFKJ2Y5I6h
	V9tc+EsO15zEoSLpdeCeTlxXdA==
X-Google-Smtp-Source: ACHHUZ7Hr4ZDVqH/Qj4vE00E8I4yNM7z78NM1kCWU9wALVVd+CWGUQTIyvQ5+OTL9WYuwLzBxngfDQ==
X-Received: by 2002:a17:906:6a29:b0:96f:5511:8803 with SMTP id qw41-20020a1709066a2900b0096f55118803mr7370099ejc.22.1685370996818;
        Mon, 29 May 2023 07:36:36 -0700 (PDT)
Received: from [127.0.0.1] (abordeaux-655-1-129-86.w90-5.abo.wanadoo.fr. [90.5.10.86])
        by smtp.gmail.com with ESMTPSA id le8-20020a170907170800b0096f803afbe3sm5993654ejc.66.2023.05.29.07.36.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 May 2023 07:36:36 -0700 (PDT)
From: Guillaume Ranquet <granquet@baylibre.com>
Subject: [PATCH v4 0/8] Add MT8195 HDMI support
Date: Mon, 29 May 2023 16:30:57 +0200
Message-Id: <20220919-v4-0-687f09a06dd9@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACG3dGQC/23MTQrCMBAF4KuUWRtJ0lATV72HiOSvJtimkNRAK
 b27gxuhuBre432zQfE5+gLXZoPsayxxThjEqQEbdHp6Eh1m4JRzqpgiwU3xMS0vwIXRxROTdbI
 BN+k9jliGWJY5r9+PleG5/XBlhBIhhZCss0pS2Ru9jtFkf7bzBHfklR8IRyIFU84OYqDK/SHtg
 bRItKTtwLuOMn45kH3fP9SYURL4AAAA
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, 
 Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, CK Hu <ck.hu@mediatek.com>, 
 Jitao shi <jitao.shi@mediatek.com>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 mac.shen@mediatek.com, stuart.lee@mediatek.com, 
 Guillaume Ranquet <granquet@baylibre.com>
X-Mailer: b4 0.13-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230529_073642_044093_63F1E2C7 
X-CRM114-Status: GOOD (  17.18  )
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

Add support for HDMI Tx on MT8195.

This includes a split of the current "legacy" hdmi driver into a common
library of functions and two dedicated compilation units with specific
code for mt8167 and another for the "v2" mt8195 SoC.

Support for the new mt8195 dpi/drm_drv adjustments to support hdmi.

Based on next-20230523

Still in my TODO-list for v5:

- Removal of the 'is_internal_hdmi' flag in mtk_dpi. [1]
    I Couldn't find a way to get rid of it with the way things are done
    in mtk_drm_drv/mtk_ddp_comp.
- Do not use a "virtual" device for the ddc v2 hw as it is embedded in
  the hdmi IP. [2]
    Seems that a lot of work is done by the framework when using a
    proper device-tree entry that can be linked as the ddc-i2c-bus of
    the hdmi-connector.
    I will keep the virtual device unless I find a way to avoid
    rewriting the framework code that handles this.

[1] : https://lore.kernel.org/all/988b0a7a-69bb-34e4-e777-1d9516221077@collabora.com/
[2] : https://lore.kernel.org/all/7da1e73a0cca6867a060d5b69d45e8d4dfc89748.camel@mediatek.com/

Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
---

Changes in v4:
- Split phy related patches to another series (merged)
- Removed regmap wrappers in mtk_hdmi
- Removed colorimetry related changes as this initial version only
  support one color depth
- Fixed dt-bindings properties
- Removed some now useless clocks from mtk_hdmi_v2 and mtk_dpi
- Link to v3: https://lore.kernel.org/r/20220919-v3-0-a803f2660127@baylibre.com

Changes in v3:
- phy: Grouped register and bit definition together to add clarity
- dt-bindings: Addressed comments
- Link to v2: https://lore.kernel.org/r/20220919-v2-0-8419dcf4f09d@baylibre.com

Changes in v2:
- Removed syscon requirement from the hdmi node
- Use as much as possible bit FIELD_PREP/FIELD_GET macros across all the
  patches
- Make cec optional dynamically instead of hardcoded with a flag
- Renamed hdmi variants to v1 (legacy) and v2 (mt8195) while waiting for
  a better name
- Rework hdmi v2 code to use a connector (same as v1)
- Remove "magic" 0x43 addr special handling in hdmi ddc code
- Link to v1: https://lore.kernel.org/r/20220919-v1-0-4844816c9808@baylibre.com

---
Guillaume Ranquet (8):
      dt-bindings: display: mediatek: add MT8195 hdmi bindings
      drm/mediatek: hdmi: use a regmap instead of iomem
      drm/mediatek: extract common functions from the mtk hdmi driver
      drm/mediatek: hdmi: make the cec dev optional
      drm/mediatek: hdmi: add v2 support
      drm/mediatek: hdmi: v2: add audio support
      dt-bindings: display: mediatek: dpi: Add compatible for MediaTek MT8195
      drm/mediatek: dpi: Add mt8195 hdmi to DPI driver

 .../bindings/display/mediatek/mediatek,dpi.yaml    |    1 +
 .../bindings/display/mediatek/mediatek,hdmi.yaml   |   59 +-
 .../display/mediatek/mediatek,mt8195-hdmi-ddc.yaml |   45 +
 drivers/gpu/drm/mediatek/Kconfig                   |    2 +
 drivers/gpu/drm/mediatek/Makefile                  |    5 +-
 drivers/gpu/drm/mediatek/mtk_dpi.c                 |  121 +-
 drivers/gpu/drm/mediatek/mtk_dpi_regs.h            |    5 +
 drivers/gpu/drm/mediatek/mtk_hdmi.c                |  773 ++----------
 drivers/gpu/drm/mediatek/mtk_hdmi.h                |   18 +
 drivers/gpu/drm/mediatek/mtk_hdmi_common.c         |  437 +++++++
 drivers/gpu/drm/mediatek/mtk_hdmi_common.h         |  208 ++++
 drivers/gpu/drm/mediatek/mtk_hdmi_ddc_v2.c         |  362 ++++++
 drivers/gpu/drm/mediatek/mtk_hdmi_regs_v2.h        |  276 +++++
 drivers/gpu/drm/mediatek/mtk_hdmi_v2.c             | 1303 ++++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_hdmi_v2.h             |   32 +
 15 files changed, 2955 insertions(+), 692 deletions(-)
---
base-commit: c8a64c6a78c54887da437098d97dc2accc689e89
change-id: 20220919-hdmi_mtk

Best regards,
-- 
Guillaume Ranquet <granquet@baylibre.com>


