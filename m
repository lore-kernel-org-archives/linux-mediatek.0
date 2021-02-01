Return-Path: <SRS0=VX5C=HD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E81F4C433E0
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Feb 2021 10:38:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8BB2564E9D
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Feb 2021 10:38:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8BB2564E9D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=PUvS9PCKm2dRKNymXECiOJGnER2QryF0Q971szK0X0c=; b=ccxIBHmUnVgFU5ZkoTPUou0oe
	oc1uvfj7rW5bOfi8aSZPmI99kjCJi9WSeTRV8BweXwuar0hD+dCrpkwDbFHf5VBdXD8+rDG9yrOhz
	MgaTSqVDT/t081iAyAVj1sJLe0e+zH8dzZ/Vb2mT5nwwYL1Q1HQoPMcTRl1Ikv34ulrdTqdd1V5rS
	Mhmr/o9Mz/cIPxkmavyalt886TDlMawdTvV7xymV5pobKmXOXsGisfFP7OnFylQQqavlgiW+dH8MT
	tCWsRQvpgzk5SxYeKMs9fEVyA6RFgsCDheBGYsMj0VdvxdqZTLbTGKoPs6x8eWyqLFUZZFbwqv8md
	lKxE1cKBg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6WbT-0002EN-Jq; Mon, 01 Feb 2021 10:38:43 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6Wah-0001lV-7C
 for linux-mediatek@lists.infradead.org; Mon, 01 Feb 2021 10:38:01 +0000
Received: by mail-pj1-x1036.google.com with SMTP id lw17so9397832pjb.0
 for <linux-mediatek@lists.infradead.org>; Mon, 01 Feb 2021 02:37:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WkiF/Od1cqQcHsYlKFgtGdXXn/hgpppkdQOzfhIxQgk=;
 b=X3aHc5W9X9gps25WsaMKyQPbXGQGGxSTiM/Yt3RAySDMjG4HDGChZ0bvqnfHi91AkN
 GpiNe8XmUZIUOkUQOr4pyFA50qlDw+lFPTPU7RgW1dqzxvqEw5YQEPo+p2wQfaaGP9/J
 Z5066b4iyaAFU5lRxTcNw8Xtckf6gen8MJQ5Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WkiF/Od1cqQcHsYlKFgtGdXXn/hgpppkdQOzfhIxQgk=;
 b=UH3bV43qZByvmFnuKy//gxK2fwdiitvwNYLyUFa8K1rGuiSZ89M4xqtNYqovGx4mf6
 fnz3cdL/Ou12mtjD6VhQ33vdfUfg1BwooETGiNnF/fi1DDxHQ5J3uKoCd3ePIGkN6i1G
 WhyWgPvLVDXCmx/Z+UKuWu9KG9kQkLNpo0O5zG30R7GkKsE5SisEo2XDgtlNAtCh9Otf
 txzD0iEyT5OI1A/vh+yjfbhLPk974jzF0GefL6A7a43uCt1sraP82ekEPW3pFQlT4wVw
 MBQp92dkcfVF+/5P7jqgZjRTtJJGOITWuoaaOVAGpfytYW/bM0R/HGfHyklYbd0kSprg
 WBIQ==
X-Gm-Message-State: AOAM5323CQiaoaooJsanzhXqJKuRmnUvs6uAlHkVjxXvjakn6C/hLLjS
 E0lz8EDt0wNmU4e4+ZFNXa84iw==
X-Google-Smtp-Source: ABdhPJzhjovDKFmFOnJJ3s/2Uq2FnbanyuusdqqtQbaRqd4Md2zkkSrZ+fFVG/Uuudh/1QqKx3fE6g==
X-Received: by 2002:a17:90a:5b:: with SMTP id
 27mr16543397pjb.207.1612175872712; 
 Mon, 01 Feb 2021 02:37:52 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:a0cd:1b84:6d56:68e1])
 by smtp.gmail.com with ESMTPSA id 76sm17610356pfz.174.2021.02.01.02.37.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Feb 2021 02:37:52 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v5 8/8] drm/mediatek: add support for mediatek SOC MT8192
Date: Mon,  1 Feb 2021 18:37:27 +0800
Message-Id: <20210201103727.376721-9-hsinyi@chromium.org>
X-Mailer: git-send-email 2.30.0.365.g02bc693789-goog
In-Reply-To: <20210201103727.376721-1-hsinyi@chromium.org>
References: <20210201103727.376721-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210201_053755_355519_557482EE 
X-CRM114-Status: GOOD (  14.99  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Yongqiang Niu <yongqiang.niu@mediatek.com>

add support for mediatek SOC MT8192

Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 drivers/gpu/drm/mediatek/mtk_disp_ccorr.c    |  6 +++
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c      | 20 ++++++++++
 drivers/gpu/drm/mediatek/mtk_disp_postmask.c |  1 +
 drivers/gpu/drm/mediatek/mtk_disp_rdma.c     |  6 +++
 drivers/gpu/drm/mediatek/mtk_drm_drv.c       | 42 ++++++++++++++++++++
 5 files changed, 75 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c b/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
index fb86f3a8b3a18..5c178ec67cd40 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
@@ -212,9 +212,15 @@ static const struct mtk_disp_ccorr_data mt8183_ccorr_driver_data = {
 	.matrix_bits = CCORR_MATRIX_BITS,
 };
 
+static const struct mtk_disp_ccorr_data mt8192_ccorr_driver_data = {
+	.matrix_bits = 11,
+};
+
 static const struct of_device_id mtk_disp_ccorr_driver_dt_match[] = {
 	{ .compatible = "mediatek,mt8183-disp-ccorr",
 	  .data = &mt8183_ccorr_driver_data},
+	{ .compatible = "mediatek,mt8192-disp-ccorr",
+	  .data = &mt8192_ccorr_driver_data},
 	{},
 };
 MODULE_DEVICE_TABLE(of, mtk_disp_ccorr_driver_dt_match);
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
index 961f87f8d4d15..e266baae586c4 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
@@ -455,6 +455,22 @@ static const struct mtk_disp_ovl_data mt8183_ovl_2l_driver_data = {
 	.fmt_rgb565_is_0 = true,
 };
 
+static const struct mtk_disp_ovl_data mt8192_ovl_driver_data = {
+	.addr = DISP_REG_OVL_ADDR_MT8173,
+	.gmc_bits = 10,
+	.layer_nr = 4,
+	.fmt_rgb565_is_0 = true,
+	.smi_id_en = true,
+};
+
+static const struct mtk_disp_ovl_data mt8192_ovl_2l_driver_data = {
+	.addr = DISP_REG_OVL_ADDR_MT8173,
+	.gmc_bits = 10,
+	.layer_nr = 2,
+	.fmt_rgb565_is_0 = true,
+	.smi_id_en = true,
+};
+
 static const struct of_device_id mtk_disp_ovl_driver_dt_match[] = {
 	{ .compatible = "mediatek,mt2701-disp-ovl",
 	  .data = &mt2701_ovl_driver_data},
@@ -464,6 +480,10 @@ static const struct of_device_id mtk_disp_ovl_driver_dt_match[] = {
 	  .data = &mt8183_ovl_driver_data},
 	{ .compatible = "mediatek,mt8183-disp-ovl-2l",
 	  .data = &mt8183_ovl_2l_driver_data},
+	{ .compatible = "mediatek,mt8192-disp-ovl",
+	  .data = &mt8192_ovl_driver_data},
+	{ .compatible = "mediatek,mt8192-disp-ovl-2l",
+	  .data = &mt8192_ovl_2l_driver_data},
 	{},
 };
 MODULE_DEVICE_TABLE(of, mtk_disp_ovl_driver_dt_match);
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_postmask.c b/drivers/gpu/drm/mediatek/mtk_disp_postmask.c
index 5a109fee6b238..ed19dd8ac9bdb 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_postmask.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_postmask.c
@@ -134,6 +134,7 @@ static int mtk_disp_postmask_remove(struct platform_device *pdev)
 }
 
 static const struct of_device_id mtk_disp_postmask_driver_dt_match[] = {
+	{ .compatible = "mediatek,mt8192-disp-postmask"},
 	{},
 };
 MODULE_DEVICE_TABLE(of, mtk_disp_postmask_driver_dt_match);
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
index 728aaadfea8cf..f123fc00a3935 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_rdma.c
@@ -355,6 +355,10 @@ static const struct mtk_disp_rdma_data mt8183_rdma_driver_data = {
 	.fifo_size = 5 * SZ_1K,
 };
 
+static const struct mtk_disp_rdma_data mt8192_rdma_driver_data = {
+	.fifo_size = 5 * SZ_1K,
+};
+
 static const struct of_device_id mtk_disp_rdma_driver_dt_match[] = {
 	{ .compatible = "mediatek,mt2701-disp-rdma",
 	  .data = &mt2701_rdma_driver_data},
@@ -362,6 +366,8 @@ static const struct of_device_id mtk_disp_rdma_driver_dt_match[] = {
 	  .data = &mt8173_rdma_driver_data},
 	{ .compatible = "mediatek,mt8183-disp-rdma",
 	  .data = &mt8183_rdma_driver_data},
+	{ .compatible = "mediatek,mt8192-disp-rdma",
+	  .data = &mt8192_rdma_driver_data},
 	{},
 };
 MODULE_DEVICE_TABLE(of, mtk_disp_rdma_driver_dt_match);
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index 3da8996438dbc..6261d6bbe863e 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -147,6 +147,25 @@ static const enum mtk_ddp_comp_id mt8183_mtk_ddp_ext[] = {
 	DDP_COMPONENT_DPI0,
 };
 
+static const enum mtk_ddp_comp_id mt8192_mtk_ddp_main[] = {
+	DDP_COMPONENT_OVL0,
+	DDP_COMPONENT_OVL_2L0,
+	DDP_COMPONENT_RDMA0,
+	DDP_COMPONENT_COLOR0,
+	DDP_COMPONENT_CCORR,
+	DDP_COMPONENT_AAL0,
+	DDP_COMPONENT_GAMMA,
+	DDP_COMPONENT_POSTMASK0,
+	DDP_COMPONENT_DITHER,
+	DDP_COMPONENT_DSI0,
+};
+
+static const enum mtk_ddp_comp_id mt8192_mtk_ddp_ext[] = {
+	DDP_COMPONENT_OVL_2L2,
+	DDP_COMPONENT_RDMA4,
+	DDP_COMPONENT_DPI0,
+};
+
 static const struct mtk_mmsys_driver_data mt2701_mmsys_driver_data = {
 	.main_path = mt2701_mtk_ddp_main,
 	.main_len = ARRAY_SIZE(mt2701_mtk_ddp_main),
@@ -186,6 +205,13 @@ static const struct mtk_mmsys_driver_data mt8183_mmsys_driver_data = {
 	.ext_len = ARRAY_SIZE(mt8183_mtk_ddp_ext),
 };
 
+static const struct mtk_mmsys_driver_data mt8192_mmsys_driver_data = {
+	.main_path = mt8192_mtk_ddp_main,
+	.main_len = ARRAY_SIZE(mt8192_mtk_ddp_main),
+	.ext_path = mt8192_mtk_ddp_ext,
+	.ext_len = ARRAY_SIZE(mt8192_mtk_ddp_ext),
+};
+
 static int mtk_drm_kms_init(struct drm_device *drm)
 {
 	struct mtk_drm_private *private = drm->dev_private;
@@ -404,22 +430,32 @@ static const struct of_device_id mtk_ddp_comp_dt_ids[] = {
 	  .data = (void *)MTK_DISP_OVL },
 	{ .compatible = "mediatek,mt8183-disp-ovl-2l",
 	  .data = (void *)MTK_DISP_OVL_2L },
+	{ .compatible = "mediatek,mt8192-disp-ovl",
+	  .data = (void *)MTK_DISP_OVL },
+	{ .compatible = "mediatek,mt8192-disp-ovl-2l",
+	  .data = (void *)MTK_DISP_OVL_2L },
 	{ .compatible = "mediatek,mt2701-disp-rdma",
 	  .data = (void *)MTK_DISP_RDMA },
 	{ .compatible = "mediatek,mt8173-disp-rdma",
 	  .data = (void *)MTK_DISP_RDMA },
 	{ .compatible = "mediatek,mt8183-disp-rdma",
 	  .data = (void *)MTK_DISP_RDMA },
+	{ .compatible = "mediatek,mt8192-disp-rdma",
+	  .data = (void *)MTK_DISP_RDMA },
 	{ .compatible = "mediatek,mt8173-disp-wdma",
 	  .data = (void *)MTK_DISP_WDMA },
 	{ .compatible = "mediatek,mt8183-disp-ccorr",
 	  .data = (void *)MTK_DISP_CCORR },
+	{ .compatible = "mediatek,mt8192-disp-ccorr",
+	  .data = (void *)MTK_DISP_CCORR },
 	{ .compatible = "mediatek,mt2701-disp-color",
 	  .data = (void *)MTK_DISP_COLOR },
 	{ .compatible = "mediatek,mt8173-disp-color",
 	  .data = (void *)MTK_DISP_COLOR },
 	{ .compatible = "mediatek,mt8173-disp-aal",
 	  .data = (void *)MTK_DISP_AAL},
+	{ .compatible = "mediatek,mt8192-disp-aal",
+	  .data = (void *)MTK_DISP_AAL},
 	{ .compatible = "mediatek,mt8173-disp-gamma",
 	  .data = (void *)MTK_DISP_GAMMA, },
 	{ .compatible = "mediatek,mt8183-disp-gamma",
@@ -448,12 +484,16 @@ static const struct of_device_id mtk_ddp_comp_dt_ids[] = {
 	  .data = (void *)MTK_DISP_MUTEX },
 	{ .compatible = "mediatek,mt8183-disp-mutex",
 	  .data = (void *)MTK_DISP_MUTEX },
+	{ .compatible = "mediatek,mt8192-disp-mutex",
+	  .data = (void *)MTK_DISP_MUTEX },
 	{ .compatible = "mediatek,mt2701-disp-pwm",
 	  .data = (void *)MTK_DISP_BLS },
 	{ .compatible = "mediatek,mt8173-disp-pwm",
 	  .data = (void *)MTK_DISP_PWM },
 	{ .compatible = "mediatek,mt8173-disp-od",
 	  .data = (void *)MTK_DISP_OD },
+	{ .compatible = "mediatek,mt8192-disp-postmask",
+	  .data = (void *)MTK_DISP_POSTMASK },
 	{ }
 };
 
@@ -468,6 +508,8 @@ static const struct of_device_id mtk_drm_of_ids[] = {
 	  .data = &mt8173_mmsys_driver_data},
 	{ .compatible = "mediatek,mt8183-mmsys",
 	  .data = &mt8183_mmsys_driver_data},
+	{ .compatible = "mediatek,mt8192-mmsys",
+	 .data = &mt8192_mmsys_driver_data},
 	{ }
 };
 
-- 
2.30.0.365.g02bc693789-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
