Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67FB2C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 31 Mar 2022 18:34:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xjSTYWSEU1QJlCGKDn1T8pUWCgsxR31xSDC6VnH+wNg=; b=e0hpKtKGMndny/
	wOjBynH3MIvzTLKPQOnhkebySU20Hw0Edt4X6BQ80sXK4FDtRotLHoJMxY8l8KyxZp4t1RLAMTN9/
	tLY78f9z8sH90rsHF9M44YJ+jfzkSgchGap6Pjzhi0QhH5C5PP3TlNc1M/sJKId/koXe+Ef6ZdFmM
	CWCiyAUjhFI6iPwC7HCCV9N568GhXbSTJDqCGpM80ksb9lg1zeQR1l3yXTW1vAyfXLXaBTXS2i0+V
	e+70nm1LuAG+v01Pj3Gf9Ea4vsJtbZ5+0TEUkAf1ZmTbJWqcDS3cPqKe9x13jVLqKR/q1B6Umu8oM
	/4GyG/yyxCorooBQDo4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZzcT-003Dcf-0Z; Thu, 31 Mar 2022 18:34:05 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZzc6-003DTw-Ls; Thu, 31 Mar 2022 18:33:45 +0000
X-UUID: b3dbb0747f8f4fb78e94081d582529c5-20220331
X-UUID: b3dbb0747f8f4fb78e94081d582529c5-20220331
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <jason-jh.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1144961481; Thu, 31 Mar 2022 11:33:37 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 31 Mar 2022 11:23:34 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Fri, 1 Apr 2022 02:23:33 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 1 Apr 2022 02:23:32 +0800
From: jason-jh.lin <jason-jh.lin@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v17 3/7] soc: mediatek: add mtk-mmsys support for mt8195
 vdosys0
Date: Fri, 1 Apr 2022 02:23:27 +0800
Message-ID: <20220331182331.27205-4-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220331182331.27205-1-jason-jh.lin@mediatek.com>
References: <20220331182331.27205-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220331_113342_752735_3234CDA2 
X-CRM114-Status: GOOD (  16.84  )
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, David Airlie <airlied@linux.ie>,
 "jason-jh . lin" <jason-jh.lin@mediatek.com>, singo.chang@mediatek.com,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, roy-cw.yeh@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Fabien Parent <fparent@baylibre.com>, moudy.ho@mediatek.com,
 linux-mediatek@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>,
 hsinyi@chromium.org, CK
 Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 nancy.lin@mediatek.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

1. Add mt8195 mmsys compatible for vdosys0.
2. Add mt8195 routing table settings and fix build fail.
3. Add clock name, clock driver name and routing table into the driver data
   of mt8195 vdosys0.
4. Add get match data by clock name function and clock platform labels
   to identify which mmsys node is corresponding to vdosys0.

Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c |   2 +-
 drivers/gpu/drm/mediatek/mtk_drm_drv.c      |   6 +-
 drivers/soc/mediatek/mt8167-mmsys.h         |   2 +-
 drivers/soc/mediatek/mt8183-mmsys.h         |   2 +-
 drivers/soc/mediatek/mt8186-mmsys.h         |   4 +-
 drivers/soc/mediatek/mt8192-mmsys.h         |   4 +-
 drivers/soc/mediatek/mt8195-mmsys.h         | 370 ++++++++++++++++++++
 drivers/soc/mediatek/mt8365-mmsys.h         |   4 +-
 drivers/soc/mediatek/mtk-mmsys.c            |  62 ++++
 drivers/soc/mediatek/mtk-mmsys.h            |   1 +
 drivers/soc/mediatek/mtk-mutex.c            |   8 +-
 include/linux/soc/mediatek/mtk-mmsys.h      |  13 +-
 12 files changed, 461 insertions(+), 17 deletions(-)
 create mode 100644 drivers/soc/mediatek/mt8195-mmsys.h

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
index 2e99aee13dfe..f543d3eb9439 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
@@ -366,7 +366,7 @@ static const struct mtk_ddp_comp_match mtk_ddp_matches[DDP_COMPONENT_ID_MAX] = {
 	[DDP_COMPONENT_CCORR]		= { MTK_DISP_CCORR,	0, &ddp_ccorr },
 	[DDP_COMPONENT_COLOR0]		= { MTK_DISP_COLOR,	0, &ddp_color },
 	[DDP_COMPONENT_COLOR1]		= { MTK_DISP_COLOR,	1, &ddp_color },
-	[DDP_COMPONENT_DITHER]		= { MTK_DISP_DITHER,	0, &ddp_dither },
+	[DDP_COMPONENT_DITHER0]		= { MTK_DISP_DITHER,	0, &ddp_dither },
 	[DDP_COMPONENT_DPI0]		= { MTK_DPI,		0, &ddp_dpi },
 	[DDP_COMPONENT_DPI1]		= { MTK_DPI,		1, &ddp_dpi },
 	[DDP_COMPONENT_DSI0]		= { MTK_DSI,		0, &ddp_dsi },
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index 247c6ff277ef..6a0a167320f0 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -116,7 +116,7 @@ static enum mtk_ddp_comp_id mt8167_mtk_ddp_main[] = {
 	DDP_COMPONENT_CCORR,
 	DDP_COMPONENT_AAL0,
 	DDP_COMPONENT_GAMMA,
-	DDP_COMPONENT_DITHER,
+	DDP_COMPONENT_DITHER0,
 	DDP_COMPONENT_RDMA0,
 	DDP_COMPONENT_DSI0,
 };
@@ -148,7 +148,7 @@ static const enum mtk_ddp_comp_id mt8183_mtk_ddp_main[] = {
 	DDP_COMPONENT_CCORR,
 	DDP_COMPONENT_AAL0,
 	DDP_COMPONENT_GAMMA,
-	DDP_COMPONENT_DITHER,
+	DDP_COMPONENT_DITHER0,
 	DDP_COMPONENT_DSI0,
 };
 
@@ -167,7 +167,7 @@ static const enum mtk_ddp_comp_id mt8192_mtk_ddp_main[] = {
 	DDP_COMPONENT_AAL0,
 	DDP_COMPONENT_GAMMA,
 	DDP_COMPONENT_POSTMASK0,
-	DDP_COMPONENT_DITHER,
+	DDP_COMPONENT_DITHER0,
 	DDP_COMPONENT_DSI0,
 };
 
diff --git a/drivers/soc/mediatek/mt8167-mmsys.h b/drivers/soc/mediatek/mt8167-mmsys.h
index 2772ef5e3934..f7a35b3656bb 100644
--- a/drivers/soc/mediatek/mt8167-mmsys.h
+++ b/drivers/soc/mediatek/mt8167-mmsys.h
@@ -18,7 +18,7 @@ static const struct mtk_mmsys_routes mt8167_mmsys_routing_table[] = {
 		DDP_COMPONENT_OVL0, DDP_COMPONENT_COLOR0,
 		MT8167_DISP_REG_CONFIG_DISP_OVL0_MOUT_EN, OVL0_MOUT_EN_COLOR0,
 	}, {
-		DDP_COMPONENT_DITHER, DDP_COMPONENT_RDMA0,
+		DDP_COMPONENT_DITHER0, DDP_COMPONENT_RDMA0,
 		MT8167_DISP_REG_CONFIG_DISP_DITHER_MOUT_EN, MT8167_DITHER_MOUT_EN_RDMA0
 	}, {
 		DDP_COMPONENT_OVL0, DDP_COMPONENT_COLOR0,
diff --git a/drivers/soc/mediatek/mt8183-mmsys.h b/drivers/soc/mediatek/mt8183-mmsys.h
index 0c021f4b76d2..ff6be1703469 100644
--- a/drivers/soc/mediatek/mt8183-mmsys.h
+++ b/drivers/soc/mediatek/mt8183-mmsys.h
@@ -41,7 +41,7 @@ static const struct mtk_mmsys_routes mmsys_mt8183_routing_table[] = {
 		MT8183_DISP_OVL1_2L_MOUT_EN, MT8183_OVL1_2L_MOUT_EN_RDMA1,
 		MT8183_OVL1_2L_MOUT_EN_RDMA1
 	}, {
-		DDP_COMPONENT_DITHER, DDP_COMPONENT_DSI0,
+		DDP_COMPONENT_DITHER0, DDP_COMPONENT_DSI0,
 		MT8183_DISP_DITHER0_MOUT_EN, MT8183_DITHER0_MOUT_IN_DSI0,
 		MT8183_DITHER0_MOUT_IN_DSI0
 	}, {
diff --git a/drivers/soc/mediatek/mt8186-mmsys.h b/drivers/soc/mediatek/mt8186-mmsys.h
index c72ccf86ea28..eb1ad9c37a9c 100644
--- a/drivers/soc/mediatek/mt8186-mmsys.h
+++ b/drivers/soc/mediatek/mt8186-mmsys.h
@@ -76,12 +76,12 @@ static const struct mtk_mmsys_routes mmsys_mt8186_routing_table[] = {
 		MT8186_RDMA0_SOUT_TO_COLOR0
 	},
 	{
-		DDP_COMPONENT_DITHER, DDP_COMPONENT_DSI0,
+		DDP_COMPONENT_DITHER0, DDP_COMPONENT_DSI0,
 		MT8186_DISP_DITHER0_MOUT_EN, MT8186_DITHER0_MOUT_EN_MASK,
 		MT8186_DITHER0_MOUT_TO_DSI0,
 	},
 	{
-		DDP_COMPONENT_DITHER, DDP_COMPONENT_DSI0,
+		DDP_COMPONENT_DITHER0, DDP_COMPONENT_DSI0,
 		MT8186_DISP_DSI0_SEL_IN, MT8186_DSI0_SEL_IN_MASK,
 		MT8186_DSI0_FROM_DITHER0
 	},
diff --git a/drivers/soc/mediatek/mt8192-mmsys.h b/drivers/soc/mediatek/mt8192-mmsys.h
index 6aae0b12b6ff..a016d80b4bc1 100644
--- a/drivers/soc/mediatek/mt8192-mmsys.h
+++ b/drivers/soc/mediatek/mt8192-mmsys.h
@@ -40,7 +40,7 @@ static const struct mtk_mmsys_routes mmsys_mt8192_routing_table[] = {
 		MT8192_DISP_OVL2_2L_MOUT_EN, MT8192_OVL2_2L_MOUT_EN_RDMA4,
 		MT8192_OVL2_2L_MOUT_EN_RDMA4
 	}, {
-		DDP_COMPONENT_DITHER, DDP_COMPONENT_DSI0,
+		DDP_COMPONENT_DITHER0, DDP_COMPONENT_DSI0,
 		MT8192_DISP_DITHER0_MOUT_EN, MT8192_DITHER0_MOUT_IN_DSI0,
 		MT8192_DITHER0_MOUT_IN_DSI0
 	}, {
@@ -52,7 +52,7 @@ static const struct mtk_mmsys_routes mmsys_mt8192_routing_table[] = {
 		MT8192_DISP_AAL0_SEL_IN, MT8192_AAL0_SEL_IN_CCORR0,
 		MT8192_AAL0_SEL_IN_CCORR0
 	}, {
-		DDP_COMPONENT_DITHER, DDP_COMPONENT_DSI0,
+		DDP_COMPONENT_DITHER0, DDP_COMPONENT_DSI0,
 		MT8192_DISP_DSI0_SEL_IN, MT8192_DSI0_SEL_IN_DITHER0,
 		MT8192_DSI0_SEL_IN_DITHER0
 	}, {
diff --git a/drivers/soc/mediatek/mt8195-mmsys.h b/drivers/soc/mediatek/mt8195-mmsys.h
new file mode 100644
index 000000000000..abfe94a30248
--- /dev/null
+++ b/drivers/soc/mediatek/mt8195-mmsys.h
@@ -0,0 +1,370 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef __SOC_MEDIATEK_MT8195_MMSYS_H
+#define __SOC_MEDIATEK_MT8195_MMSYS_H
+
+#define MT8195_VDO0_OVL_MOUT_EN					0xf14
+#define MT8195_MOUT_DISP_OVL0_TO_DISP_RDMA0			BIT(0)
+#define MT8195_MOUT_DISP_OVL0_TO_DISP_WDMA0			BIT(1)
+#define MT8195_MOUT_DISP_OVL0_TO_DISP_OVL1			BIT(2)
+#define MT8195_MOUT_DISP_OVL1_TO_DISP_RDMA1			BIT(4)
+#define MT8195_MOUT_DISP_OVL1_TO_DISP_WDMA1			BIT(5)
+#define MT8195_MOUT_DISP_OVL1_TO_DISP_OVL0			BIT(6)
+
+#define MT8195_VDO0_SEL_IN					0xf34
+#define MT8195_SEL_IN_VPP_MERGE_FROM_MASK			GENMASK(1, 0)
+#define MT8195_SEL_IN_VPP_MERGE_FROM_DSC_WRAP0_OUT		(0 << 0)
+#define MT8195_SEL_IN_VPP_MERGE_FROM_DISP_DITHER1		(1 << 0)
+#define MT8195_SEL_IN_VPP_MERGE_FROM_VDO1_VIRTUAL0		(2 << 0)
+#define MT8195_SEL_IN_DSC_WRAP0_IN_FROM_MASK			GENMASK(4, 4)
+#define MT8195_SEL_IN_DSC_WRAP0_IN_FROM_DISP_DITHER0		(0 << 4)
+#define MT8195_SEL_IN_DSC_WRAP0_IN_FROM_VPP_MERGE		(1 << 4)
+#define MT8195_SEL_IN_DSC_WRAP1_IN_FROM_MASK			GENMASK(5, 5)
+#define MT8195_SEL_IN_DSC_WRAP1_IN_FROM_DISP_DITHER1		(0 << 5)
+#define MT8195_SEL_IN_DSC_WRAP1_IN_FROM_VPP_MERGE		(1 << 5)
+#define MT8195_SEL_IN_SINA_VIRTUAL0_FROM_MASK			GENMASK(8, 8)
+#define MT8195_SEL_IN_SINA_VIRTUAL0_FROM_VPP_MERGE		(0 << 8)
+#define MT8195_SEL_IN_SINA_VIRTUAL0_FROM_DSC_WRAP1_OUT		(1 << 8)
+#define MT8195_SEL_IN_SINB_VIRTUAL0_FROM_MASK			GENMASK(9, 9)
+#define MT8195_SEL_IN_SINB_VIRTUAL0_FROM_DSC_WRAP0_OUT		(0 << 9)
+#define MT8195_SEL_IN_DP_INTF0_FROM_MASK			GENMASK(13, 12)
+#define MT8195_SEL_IN_DP_INTF0_FROM_DSC_WRAP1_OUT		(0 << 0)
+#define MT8195_SEL_IN_DP_INTF0_FROM_VPP_MERGE			(1 << 12)
+#define MT8195_SEL_IN_DP_INTF0_FROM_VDO1_VIRTUAL0		(2 << 12)
+#define MT8195_SEL_IN_DSI0_FROM_MASK				GENMASK(16, 16)
+#define MT8195_SEL_IN_DSI0_FROM_DSC_WRAP0_OUT			(0 << 16)
+#define MT8195_SEL_IN_DSI0_FROM_DISP_DITHER0			(1 << 16)
+#define MT8195_SEL_IN_DSI1_FROM_MASK				GENMASK(17, 17)
+#define MT8195_SEL_IN_DSI1_FROM_DSC_WRAP1_OUT			(0 << 17)
+#define MT8195_SEL_IN_DSI1_FROM_VPP_MERGE			(1 << 17)
+#define MT8195_SEL_IN_DISP_WDMA1_FROM_MASK			GENMASK(20, 20)
+#define MT8195_SEL_IN_DISP_WDMA1_FROM_DISP_OVL1			(0 << 20)
+#define MT8195_SEL_IN_DISP_WDMA1_FROM_VPP_MERGE			(1 << 20)
+#define MT8195_SEL_IN_DSC_WRAP1_FROM_MASK			GENMASK(21, 21)
+#define MT8195_SEL_IN_DSC_WRAP1_OUT_FROM_DSC_WRAP1_IN		(0 << 21)
+#define MT8195_SEL_IN_DSC_WRAP1_OUT_FROM_DISP_DITHER1		(1 << 21)
+#define MT8195_SEL_IN_DISP_WDMA0_FROM_MASK			GENMASK(22, 22)
+#define MT8195_SEL_IN_DISP_WDMA0_FROM_DISP_OVL0			(0 << 22)
+
+#define MT8195_VDO0_SEL_OUT					0xf38
+#define MT8195_SOUT_DISP_DITHER0_TO_MASK			BIT(0)
+#define MT8195_SOUT_DISP_DITHER0_TO_DSC_WRAP0_IN		(0 << 0)
+#define MT8195_SOUT_DISP_DITHER0_TO_DSI0			(1 << 0)
+#define MT8195_SOUT_DISP_DITHER1_TO_MASK			GENMASK(2, 1)
+#define MT8195_SOUT_DISP_DITHER1_TO_DSC_WRAP1_IN		(0 << 1)
+#define MT8195_SOUT_DISP_DITHER1_TO_VPP_MERGE			(1 << 1)
+#define MT8195_SOUT_DISP_DITHER1_TO_DSC_WRAP1_OUT		(2 << 1)
+#define MT8195_SOUT_VDO1_VIRTUAL0_TO_MASK			GENMASK(4, 4)
+#define MT8195_SOUT_VDO1_VIRTUAL0_TO_VPP_MERGE			(0 << 4)
+#define MT8195_SOUT_VDO1_VIRTUAL0_TO_DP_INTF0			(1 << 4)
+#define MT8195_SOUT_VPP_MERGE_TO_MASK				GENMASK(10, 8)
+#define MT8195_SOUT_VPP_MERGE_TO_DSI1				(0 << 8)
+#define MT8195_SOUT_VPP_MERGE_TO_DP_INTF0			(1 << 8)
+#define MT8195_SOUT_VPP_MERGE_TO_SINA_VIRTUAL0			(2 << 8)
+#define MT8195_SOUT_VPP_MERGE_TO_DISP_WDMA1			(3 << 8)
+#define MT8195_SOUT_VPP_MERGE_TO_DSC_WRAP0_IN			(4 << 8)
+#define MT8195_SOUT_VPP_MERGE_TO_DSC_WRAP1_IN_MASK		GENMASK(11, 11)
+#define MT8195_SOUT_VPP_MERGE_TO_DSC_WRAP1_IN			(0 << 11)
+#define MT8195_SOUT_DSC_WRAP0_OUT_TO_MASK			GENMASK(13, 12)
+#define MT8195_SOUT_DSC_WRAP0_OUT_TO_DSI0			(0 << 12)
+#define MT8195_SOUT_DSC_WRAP0_OUT_TO_SINB_VIRTUAL0		(1 << 12)
+#define MT8195_SOUT_DSC_WRAP0_OUT_TO_VPP_MERGE			(2 << 12)
+#define MT8195_SOUT_DSC_WRAP1_OUT_TO_MASK			GENMASK(17, 16)
+#define MT8195_SOUT_DSC_WRAP1_OUT_TO_DSI1			(0 << 16)
+#define MT8195_SOUT_DSC_WRAP1_OUT_TO_DP_INTF0			(1 << 16)
+#define MT8195_SOUT_DSC_WRAP1_OUT_TO_SINA_VIRTUAL0		(2 << 16)
+#define MT8195_SOUT_DSC_WRAP1_OUT_TO_VPP_MERGE			(3 << 16)
+
+static const struct mtk_mmsys_routes mmsys_mt8195_routing_table[] = {
+	{
+		DDP_COMPONENT_OVL0, DDP_COMPONENT_RDMA0,
+		MT8195_VDO0_OVL_MOUT_EN, MT8195_MOUT_DISP_OVL0_TO_DISP_RDMA0,
+		MT8195_MOUT_DISP_OVL0_TO_DISP_RDMA0
+	}, {
+		DDP_COMPONENT_OVL0, DDP_COMPONENT_WDMA0,
+		MT8195_VDO0_OVL_MOUT_EN, MT8195_MOUT_DISP_OVL0_TO_DISP_WDMA0,
+		MT8195_MOUT_DISP_OVL0_TO_DISP_WDMA0
+	}, {
+		DDP_COMPONENT_OVL0, DDP_COMPONENT_OVL1,
+		MT8195_VDO0_OVL_MOUT_EN, MT8195_MOUT_DISP_OVL0_TO_DISP_OVL1,
+		MT8195_MOUT_DISP_OVL0_TO_DISP_OVL1
+	}, {
+		DDP_COMPONENT_OVL1, DDP_COMPONENT_RDMA1,
+		MT8195_VDO0_OVL_MOUT_EN, MT8195_MOUT_DISP_OVL1_TO_DISP_RDMA1,
+		MT8195_MOUT_DISP_OVL1_TO_DISP_RDMA1
+	}, {
+		DDP_COMPONENT_OVL1, DDP_COMPONENT_WDMA1,
+		MT8195_VDO0_OVL_MOUT_EN, MT8195_MOUT_DISP_OVL1_TO_DISP_WDMA1,
+		MT8195_MOUT_DISP_OVL1_TO_DISP_WDMA1
+	}, {
+		DDP_COMPONENT_OVL1, DDP_COMPONENT_OVL0,
+		MT8195_VDO0_OVL_MOUT_EN, MT8195_MOUT_DISP_OVL1_TO_DISP_OVL0,
+		MT8195_MOUT_DISP_OVL1_TO_DISP_OVL0
+	}, {
+		DDP_COMPONENT_DSC0, DDP_COMPONENT_MERGE0,
+		MT8195_VDO0_SEL_IN, MT8195_SEL_IN_VPP_MERGE_FROM_MASK,
+		MT8195_SEL_IN_VPP_MERGE_FROM_DSC_WRAP0_OUT
+	}, {
+		DDP_COMPONENT_DITHER1, DDP_COMPONENT_MERGE0,
+		MT8195_VDO0_SEL_IN, MT8195_SEL_IN_VPP_MERGE_FROM_MASK,
+		MT8195_SEL_IN_VPP_MERGE_FROM_DISP_DITHER1
+	}, {
+		DDP_COMPONENT_MERGE5, DDP_COMPONENT_MERGE0,
+		MT8195_VDO0_SEL_IN, MT8195_SEL_IN_VPP_MERGE_FROM_MASK,
+		MT8195_SEL_IN_VPP_MERGE_FROM_VDO1_VIRTUAL0
+	}, {
+		DDP_COMPONENT_DITHER0, DDP_COMPONENT_DSC0,
+		MT8195_VDO0_SEL_IN, MT8195_SEL_IN_DSC_WRAP0_IN_FROM_MASK,
+		MT8195_SEL_IN_DSC_WRAP0_IN_FROM_DISP_DITHER0
+	}, {
+		DDP_COMPONENT_MERGE0, DDP_COMPONENT_DSC0,
+		MT8195_VDO0_SEL_IN, MT8195_SEL_IN_DSC_WRAP0_IN_FROM_MASK,
+		MT8195_SEL_IN_DSC_WRAP0_IN_FROM_VPP_MERGE
+	}, {
+		DDP_COMPONENT_DITHER1, DDP_COMPONENT_DSC1,
+		MT8195_VDO0_SEL_IN, MT8195_SEL_IN_DSC_WRAP1_IN_FROM_MASK,
+		MT8195_SEL_IN_DSC_WRAP1_IN_FROM_DISP_DITHER1
+	}, {
+		DDP_COMPONENT_MERGE0, DDP_COMPONENT_DSC1,
+		MT8195_VDO0_SEL_IN, MT8195_SEL_IN_DSC_WRAP1_IN_FROM_MASK,
+		MT8195_SEL_IN_DSC_WRAP1_IN_FROM_VPP_MERGE
+	}, {
+		DDP_COMPONENT_MERGE0, DDP_COMPONENT_DP_INTF1,
+		MT8195_VDO0_SEL_IN, MT8195_SEL_IN_SINA_VIRTUAL0_FROM_MASK,
+		MT8195_SEL_IN_SINA_VIRTUAL0_FROM_VPP_MERGE
+	}, {
+		DDP_COMPONENT_MERGE0, DDP_COMPONENT_DPI0,
+		MT8195_VDO0_SEL_IN, MT8195_SEL_IN_SINA_VIRTUAL0_FROM_MASK,
+		MT8195_SEL_IN_SINA_VIRTUAL0_FROM_VPP_MERGE
+	}, {
+		DDP_COMPONENT_MERGE0, DDP_COMPONENT_DPI1,
+		MT8195_VDO0_SEL_IN, MT8195_SEL_IN_SINA_VIRTUAL0_FROM_MASK,
+		MT8195_SEL_IN_SINA_VIRTUAL0_FROM_VPP_MERGE
+	}, {
+		DDP_COMPONENT_DSC1, DDP_COMPONENT_DP_INTF1,
+		MT8195_VDO0_SEL_IN, MT8195_SEL_IN_SINA_VIRTUAL0_FROM_MASK,
+		MT8195_SEL_IN_SINA_VIRTUAL0_FROM_DSC_WRAP1_OUT
+	}, {
+		DDP_COMPONENT_DSC1, DDP_COMPONENT_DPI0,
+		MT8195_VDO0_SEL_IN, MT8195_SEL_IN_SINA_VIRTUAL0_FROM_MASK,
+		MT8195_SEL_IN_SINA_VIRTUAL0_FROM_DSC_WRAP1_OUT
+	}, {
+		DDP_COMPONENT_DSC1, DDP_COMPONENT_DPI1,
+		MT8195_VDO0_SEL_IN, MT8195_SEL_IN_SINA_VIRTUAL0_FROM_MASK,
+		MT8195_SEL_IN_SINA_VIRTUAL0_FROM_DSC_WRAP1_OUT
+	}, {
+		DDP_COMPONENT_DSC0, DDP_COMPONENT_DP_INTF1,
+		MT8195_VDO0_SEL_IN, MT8195_SEL_IN_SINB_VIRTUAL0_FROM_MASK,
+		MT8195_SEL_IN_SINB_VIRTUAL0_FROM_DSC_WRAP0_OUT
+	}, {
+		DDP_COMPONENT_DSC0, DDP_COMPONENT_DPI0,
+		MT8195_VDO0_SEL_IN, MT8195_SEL_IN_SINB_VIRTUAL0_FROM_MASK,
+		MT8195_SEL_IN_SINB_VIRTUAL0_FROM_DSC_WRAP0_OUT
+	}, {
+		DDP_COMPONENT_DSC0, DDP_COMPONENT_DPI1,
+		MT8195_VDO0_SEL_IN, MT8195_SEL_IN_SINB_VIRTUAL0_FROM_MASK,
+		MT8195_SEL_IN_SINB_VIRTUAL0_FROM_DSC_WRAP0_OUT
+	}, {
+		DDP_COMPONENT_DSC1, DDP_COMPONENT_DP_INTF0,
+		MT8195_VDO0_SEL_IN, MT8195_SEL_IN_DP_INTF0_FROM_MASK,
+		MT8195_SEL_IN_DP_INTF0_FROM_DSC_WRAP1_OUT
+	}, {
+		DDP_COMPONENT_MERGE0, DDP_COMPONENT_DP_INTF0,
+		MT8195_VDO0_SEL_IN, MT8195_SEL_IN_DP_INTF0_FROM_MASK,
+		MT8195_SEL_IN_DP_INTF0_FROM_VPP_MERGE
+	}, {
+		DDP_COMPONENT_MERGE5, DDP_COMPONENT_DP_INTF0,
+		MT8195_VDO0_SEL_IN, MT8195_SEL_IN_DP_INTF0_FROM_MASK,
+		MT8195_SEL_IN_DP_INTF0_FROM_VDO1_VIRTUAL0
+	}, {
+		DDP_COMPONENT_DSC0, DDP_COMPONENT_DSI0,
+		MT8195_VDO0_SEL_IN, MT8195_SEL_IN_DSI0_FROM_MASK,
+		MT8195_SEL_IN_DSI0_FROM_DSC_WRAP0_OUT
+	}, {
+		DDP_COMPONENT_DITHER0, DDP_COMPONENT_DSI0,
+		MT8195_VDO0_SEL_IN, MT8195_SEL_IN_DSI0_FROM_MASK,
+		MT8195_SEL_IN_DSI0_FROM_DISP_DITHER0
+	}, {
+		DDP_COMPONENT_DSC1, DDP_COMPONENT_DSI1,
+		MT8195_VDO0_SEL_IN, MT8195_SEL_IN_DSI1_FROM_MASK,
+		MT8195_SEL_IN_DSI1_FROM_DSC_WRAP1_OUT
+	}, {
+		DDP_COMPONENT_MERGE0, DDP_COMPONENT_DSI1,
+		MT8195_VDO0_SEL_IN, MT8195_SEL_IN_DSI1_FROM_MASK,
+		MT8195_SEL_IN_DSI1_FROM_VPP_MERGE
+	}, {
+		DDP_COMPONENT_OVL1, DDP_COMPONENT_WDMA1,
+		MT8195_VDO0_SEL_IN, MT8195_SEL_IN_DISP_WDMA1_FROM_MASK,
+		MT8195_SEL_IN_DISP_WDMA1_FROM_DISP_OVL1
+	}, {
+		DDP_COMPONENT_MERGE0, DDP_COMPONENT_WDMA1,
+		MT8195_VDO0_SEL_IN, MT8195_SEL_IN_DISP_WDMA1_FROM_MASK,
+		MT8195_SEL_IN_DISP_WDMA1_FROM_VPP_MERGE
+	}, {
+		DDP_COMPONENT_DSC1, DDP_COMPONENT_DSI1,
+		MT8195_VDO0_SEL_IN, MT8195_SEL_IN_DSC_WRAP1_FROM_MASK,
+		MT8195_SEL_IN_DSC_WRAP1_OUT_FROM_DSC_WRAP1_IN
+	}, {
+		DDP_COMPONENT_DSC1, DDP_COMPONENT_DP_INTF0,
+		MT8195_VDO0_SEL_IN, MT8195_SEL_IN_DSC_WRAP1_FROM_MASK,
+		MT8195_SEL_IN_DSC_WRAP1_OUT_FROM_DSC_WRAP1_IN
+	}, {
+		DDP_COMPONENT_DSC1, DDP_COMPONENT_DP_INTF1,
+		MT8195_VDO0_SEL_IN, MT8195_SEL_IN_DSC_WRAP1_FROM_MASK,
+		MT8195_SEL_IN_DSC_WRAP1_OUT_FROM_DSC_WRAP1_IN
+	}, {
+		DDP_COMPONENT_DSC1, DDP_COMPONENT_DPI0,
+		MT8195_VDO0_SEL_IN, MT8195_SEL_IN_DSC_WRAP1_FROM_MASK,
+		MT8195_SEL_IN_DSC_WRAP1_OUT_FROM_DSC_WRAP1_IN
+	}, {
+		DDP_COMPONENT_DSC1, DDP_COMPONENT_DPI1,
+		MT8195_VDO0_SEL_IN, MT8195_SEL_IN_DSC_WRAP1_FROM_MASK,
+		MT8195_SEL_IN_DSC_WRAP1_OUT_FROM_DSC_WRAP1_IN
+	}, {
+		DDP_COMPONENT_DSC1, DDP_COMPONENT_MERGE0,
+		MT8195_VDO0_SEL_IN, MT8195_SEL_IN_DSC_WRAP1_FROM_MASK,
+		MT8195_SEL_IN_DSC_WRAP1_OUT_FROM_DSC_WRAP1_IN
+	}, {
+		DDP_COMPONENT_DITHER1, DDP_COMPONENT_DSI1,
+		MT8195_VDO0_SEL_IN, MT8195_SEL_IN_DSC_WRAP1_FROM_MASK,
+		MT8195_SEL_IN_DSC_WRAP1_OUT_FROM_DISP_DITHER1
+	}, {
+		DDP_COMPONENT_DITHER1, DDP_COMPONENT_DP_INTF0,
+		MT8195_VDO0_SEL_IN, MT8195_SEL_IN_DSC_WRAP1_FROM_MASK,
+		MT8195_SEL_IN_DSC_WRAP1_OUT_FROM_DISP_DITHER1
+	}, {
+		DDP_COMPONENT_DITHER1, DDP_COMPONENT_DPI0,
+		MT8195_VDO0_SEL_IN, MT8195_SEL_IN_DSC_WRAP1_FROM_MASK,
+		MT8195_SEL_IN_DSC_WRAP1_OUT_FROM_DISP_DITHER1
+	}, {
+		DDP_COMPONENT_DITHER1, DDP_COMPONENT_DPI1,
+		MT8195_VDO0_SEL_IN, MT8195_SEL_IN_DSC_WRAP1_FROM_MASK,
+		MT8195_SEL_IN_DSC_WRAP1_OUT_FROM_DISP_DITHER1
+	}, {
+		DDP_COMPONENT_OVL0, DDP_COMPONENT_WDMA0,
+		MT8195_VDO0_SEL_IN, MT8195_SEL_IN_DISP_WDMA0_FROM_MASK,
+		MT8195_SEL_IN_DISP_WDMA0_FROM_DISP_OVL0
+	}, {
+		DDP_COMPONENT_DITHER0, DDP_COMPONENT_DSC0,
+		MT8195_VDO0_SEL_OUT, MT8195_SOUT_DISP_DITHER0_TO_MASK,
+		MT8195_SOUT_DISP_DITHER0_TO_DSC_WRAP0_IN
+	}, {
+		DDP_COMPONENT_DITHER0, DDP_COMPONENT_DSI0,
+		MT8195_VDO0_SEL_OUT, MT8195_SOUT_DISP_DITHER0_TO_MASK,
+		MT8195_SOUT_DISP_DITHER0_TO_DSI0
+	}, {
+		DDP_COMPONENT_DITHER1, DDP_COMPONENT_DSC1,
+		MT8195_VDO0_SEL_OUT, MT8195_SOUT_DISP_DITHER1_TO_MASK,
+		MT8195_SOUT_DISP_DITHER1_TO_DSC_WRAP1_IN
+	}, {
+		DDP_COMPONENT_DITHER1, DDP_COMPONENT_MERGE0,
+		MT8195_VDO0_SEL_OUT, MT8195_SOUT_DISP_DITHER1_TO_MASK,
+		MT8195_SOUT_DISP_DITHER1_TO_VPP_MERGE
+	}, {
+		DDP_COMPONENT_DITHER1, DDP_COMPONENT_DSI1,
+		MT8195_VDO0_SEL_OUT, MT8195_SOUT_DISP_DITHER1_TO_MASK,
+		MT8195_SOUT_DISP_DITHER1_TO_DSC_WRAP1_OUT
+	}, {
+		DDP_COMPONENT_DITHER1, DDP_COMPONENT_DP_INTF0,
+		MT8195_VDO0_SEL_OUT, MT8195_SOUT_DISP_DITHER1_TO_MASK,
+		MT8195_SOUT_DISP_DITHER1_TO_DSC_WRAP1_OUT
+	}, {
+		DDP_COMPONENT_DITHER1, DDP_COMPONENT_DP_INTF1,
+		MT8195_VDO0_SEL_OUT, MT8195_SOUT_DISP_DITHER1_TO_MASK,
+		MT8195_SOUT_DISP_DITHER1_TO_DSC_WRAP1_OUT
+	}, {
+		DDP_COMPONENT_DITHER1, DDP_COMPONENT_DPI0,
+		MT8195_VDO0_SEL_OUT, MT8195_SOUT_DISP_DITHER1_TO_MASK,
+		MT8195_SOUT_DISP_DITHER1_TO_DSC_WRAP1_OUT
+	}, {
+		DDP_COMPONENT_DITHER1, DDP_COMPONENT_DPI1,
+		MT8195_VDO0_SEL_OUT, MT8195_SOUT_DISP_DITHER1_TO_MASK,
+		MT8195_SOUT_DISP_DITHER1_TO_DSC_WRAP1_OUT
+	}, {
+		DDP_COMPONENT_MERGE5, DDP_COMPONENT_MERGE0,
+		MT8195_VDO0_SEL_OUT, MT8195_SOUT_VDO1_VIRTUAL0_TO_MASK,
+		MT8195_SOUT_VDO1_VIRTUAL0_TO_VPP_MERGE
+	}, {
+		DDP_COMPONENT_MERGE5, DDP_COMPONENT_DP_INTF0,
+		MT8195_VDO0_SEL_OUT, MT8195_SOUT_VDO1_VIRTUAL0_TO_MASK,
+		MT8195_SOUT_VDO1_VIRTUAL0_TO_DP_INTF0
+	}, {
+		DDP_COMPONENT_MERGE0, DDP_COMPONENT_DSI1,
+		MT8195_VDO0_SEL_OUT, MT8195_SOUT_VPP_MERGE_TO_MASK,
+		MT8195_SOUT_VPP_MERGE_TO_DSI1
+	}, {
+		DDP_COMPONENT_MERGE0, DDP_COMPONENT_DP_INTF0,
+		MT8195_VDO0_SEL_OUT, MT8195_SOUT_VPP_MERGE_TO_MASK,
+		MT8195_SOUT_VPP_MERGE_TO_DP_INTF0
+	}, {
+		DDP_COMPONENT_MERGE0, DDP_COMPONENT_DP_INTF1,
+		MT8195_VDO0_SEL_OUT, MT8195_SOUT_VPP_MERGE_TO_MASK,
+		MT8195_SOUT_VPP_MERGE_TO_SINA_VIRTUAL0
+	}, {
+		DDP_COMPONENT_MERGE0, DDP_COMPONENT_DPI0,
+		MT8195_VDO0_SEL_OUT, MT8195_SOUT_VPP_MERGE_TO_MASK,
+		MT8195_SOUT_VPP_MERGE_TO_SINA_VIRTUAL0
+	}, {
+		DDP_COMPONENT_MERGE0, DDP_COMPONENT_DPI1,
+		MT8195_VDO0_SEL_OUT, MT8195_SOUT_VPP_MERGE_TO_MASK,
+		MT8195_SOUT_VPP_MERGE_TO_SINA_VIRTUAL0
+	}, {
+		DDP_COMPONENT_MERGE0, DDP_COMPONENT_WDMA1,
+		MT8195_VDO0_SEL_OUT, MT8195_SOUT_VPP_MERGE_TO_MASK,
+		MT8195_SOUT_VPP_MERGE_TO_DISP_WDMA1
+	}, {
+		DDP_COMPONENT_MERGE0, DDP_COMPONENT_DSC0,
+		MT8195_VDO0_SEL_OUT, MT8195_SOUT_VPP_MERGE_TO_MASK,
+		MT8195_SOUT_VPP_MERGE_TO_DSC_WRAP0_IN
+	}, {
+		DDP_COMPONENT_MERGE0, DDP_COMPONENT_DSC1,
+		MT8195_VDO0_SEL_OUT, MT8195_SOUT_VPP_MERGE_TO_DSC_WRAP1_IN_MASK,
+		MT8195_SOUT_VPP_MERGE_TO_DSC_WRAP1_IN
+	}, {
+		DDP_COMPONENT_DSC0, DDP_COMPONENT_DSI0,
+		MT8195_VDO0_SEL_OUT, MT8195_SOUT_DSC_WRAP0_OUT_TO_MASK,
+		MT8195_SOUT_DSC_WRAP0_OUT_TO_DSI0
+	}, {
+		DDP_COMPONENT_DSC0, DDP_COMPONENT_DP_INTF1,
+		MT8195_VDO0_SEL_OUT, MT8195_SOUT_DSC_WRAP0_OUT_TO_MASK,
+		MT8195_SOUT_DSC_WRAP0_OUT_TO_SINB_VIRTUAL0
+	}, {
+		DDP_COMPONENT_DSC0, DDP_COMPONENT_DPI0,
+		MT8195_VDO0_SEL_OUT, MT8195_SOUT_DSC_WRAP0_OUT_TO_MASK,
+		MT8195_SOUT_DSC_WRAP0_OUT_TO_SINB_VIRTUAL0
+	}, {
+		DDP_COMPONENT_DSC0, DDP_COMPONENT_DPI1,
+		MT8195_VDO0_SEL_OUT, MT8195_SOUT_DSC_WRAP0_OUT_TO_MASK,
+		MT8195_SOUT_DSC_WRAP0_OUT_TO_SINB_VIRTUAL0
+	}, {
+		DDP_COMPONENT_DSC0, DDP_COMPONENT_MERGE0,
+		MT8195_VDO0_SEL_OUT, MT8195_SOUT_DSC_WRAP0_OUT_TO_MASK,
+		MT8195_SOUT_DSC_WRAP0_OUT_TO_VPP_MERGE
+	}, {
+		DDP_COMPONENT_DSC1, DDP_COMPONENT_DSI1,
+		MT8195_VDO0_SEL_OUT, MT8195_SOUT_DSC_WRAP1_OUT_TO_MASK,
+		MT8195_SOUT_DSC_WRAP1_OUT_TO_DSI1
+	}, {
+		DDP_COMPONENT_DSC1, DDP_COMPONENT_DP_INTF0,
+		MT8195_VDO0_SEL_OUT, MT8195_SOUT_DSC_WRAP1_OUT_TO_MASK,
+		MT8195_SOUT_DSC_WRAP1_OUT_TO_DP_INTF0
+	}, {
+		DDP_COMPONENT_DSC1, DDP_COMPONENT_DP_INTF1,
+		MT8195_VDO0_SEL_OUT, MT8195_SOUT_DSC_WRAP1_OUT_TO_MASK,
+		MT8195_SOUT_DSC_WRAP1_OUT_TO_SINA_VIRTUAL0
+	}, {
+		DDP_COMPONENT_DSC1, DDP_COMPONENT_DPI0,
+		MT8195_VDO0_SEL_OUT, MT8195_SOUT_DSC_WRAP1_OUT_TO_MASK,
+		MT8195_SOUT_DSC_WRAP1_OUT_TO_SINA_VIRTUAL0
+	}, {
+		DDP_COMPONENT_DSC1, DDP_COMPONENT_DPI1,
+		MT8195_VDO0_SEL_OUT, MT8195_SOUT_DSC_WRAP1_OUT_TO_MASK,
+		MT8195_SOUT_DSC_WRAP1_OUT_TO_SINA_VIRTUAL0
+	}, {
+		DDP_COMPONENT_DSC1, DDP_COMPONENT_MERGE0,
+		MT8195_VDO0_SEL_OUT, MT8195_SOUT_DSC_WRAP1_OUT_TO_MASK,
+		MT8195_SOUT_DSC_WRAP1_OUT_TO_VPP_MERGE
+	}
+};
+
+#endif /* __SOC_MEDIATEK_MT8195_MMSYS_H */
diff --git a/drivers/soc/mediatek/mt8365-mmsys.h b/drivers/soc/mediatek/mt8365-mmsys.h
index 690e3fe2dee0..24129a6c25f8 100644
--- a/drivers/soc/mediatek/mt8365-mmsys.h
+++ b/drivers/soc/mediatek/mt8365-mmsys.h
@@ -41,12 +41,12 @@ static const struct mtk_mmsys_routes mt8365_mmsys_routing_table[] = {
 		MT8365_DISP_COLOR_SEL_IN_COLOR0,MT8365_DISP_COLOR_SEL_IN_COLOR0
 	},
 	{
-		DDP_COMPONENT_DITHER, DDP_COMPONENT_DSI0,
+		DDP_COMPONENT_DITHER0, DDP_COMPONENT_DSI0,
 		MT8365_DISP_REG_CONFIG_DISP_DITHER0_MOUT_EN,
 		MT8365_DITHER_MOUT_EN_DSI0, MT8365_DITHER_MOUT_EN_DSI0
 	},
 	{
-		DDP_COMPONENT_DITHER, DDP_COMPONENT_DSI0,
+		DDP_COMPONENT_DITHER0, DDP_COMPONENT_DSI0,
 		MT8365_DISP_REG_CONFIG_DISP_DSI0_SEL_IN,
 		MT8365_DSI0_SEL_IN_DITHER, MT8365_DSI0_SEL_IN_DITHER
 	},
diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
index 4fc4c2c9ea20..b2fa239c5f5f 100644
--- a/drivers/soc/mediatek/mtk-mmsys.c
+++ b/drivers/soc/mediatek/mtk-mmsys.c
@@ -4,6 +4,8 @@
  * Author: James Liao <jamesjj.liao@mediatek.com>
  */
 
+#include <linux/clk.h>
+#include <linux/clk-provider.h>
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/io.h>
@@ -17,6 +19,7 @@
 #include "mt8183-mmsys.h"
 #include "mt8186-mmsys.h"
 #include "mt8192-mmsys.h"
+#include "mt8195-mmsys.h"
 #include "mt8365-mmsys.h"
 
 static const struct mtk_mmsys_driver_data mt2701_mmsys_driver_data = {
@@ -72,12 +75,24 @@ static const struct mtk_mmsys_driver_data mt8192_mmsys_driver_data = {
 	.num_routes = ARRAY_SIZE(mmsys_mt8192_routing_table),
 };
 
+static const struct mtk_mmsys_driver_data mt8195_vdosys0_driver_data = {
+	.clk_name = "cfg_vdo0",
+	.clk_driver = "clk-mt8195-vdo0",
+	.routes = mmsys_mt8195_routing_table,
+	.num_routes = ARRAY_SIZE(mmsys_mt8195_routing_table),
+};
+
 static const struct mtk_mmsys_driver_data mt8365_mmsys_driver_data = {
 	.clk_driver = "clk-mt8365-mm",
 	.routes = mt8365_mmsys_routing_table,
 	.num_routes = ARRAY_SIZE(mt8365_mmsys_routing_table),
 };
 
+static const struct of_device_id mtk_clk_platform_labels[] = {
+	{ .compatible = "mediatek,mt8195-mmsys",
+	  .data = (void *)"clk-mt8195"},
+};
+
 struct mtk_mmsys {
 	void __iomem *regs;
 	const struct mtk_mmsys_driver_data *data;
@@ -85,6 +100,45 @@ struct mtk_mmsys {
 	struct reset_controller_dev rcdev;
 };
 
+static int mtk_mmsys_get_match_data_by_clk_name(const struct mtk_mmsys_driver_data **data,
+						struct device *dev)
+{
+	int i;
+	struct clk *clk;
+	const char *clk_name;
+	const struct of_device_id *of_id = of_match_node(mtk_clk_platform_labels,
+							 dev->of_node);
+	const struct mtk_mmsys_driver_data *drvdata[] = {
+		&mt8195_vdosys0_driver_data,
+	};
+
+	if (!of_id || !of_id->data) {
+		dev_err(dev, "Can't find match clk platform labels\n");
+		return -EINVAL;
+	}
+
+	clk = devm_clk_get(dev, NULL);
+	if (IS_ERR(clk)) {
+		dev_err(dev, "failed to get mmsys clk\n");
+		return PTR_ERR(clk);
+	}
+
+	clk_name = __clk_get_name(clk);
+	if (!clk_name) {
+		dev_err(dev, "invalid mmsys clk name\n");
+		return -EINVAL;
+	}
+
+	for (i = 0; i < ARRAY_SIZE(drvdata); i++)
+		if (strncmp(drvdata[i]->clk_name, clk_name, strlen(clk_name)) == 0 &&
+		    strncmp(drvdata[i]->clk_driver, of_id->data, strlen(of_id->data)) == 0) {
+			*data = drvdata[i];
+			return 0;
+		}
+
+	return -EINVAL;
+}
+
 void mtk_mmsys_ddp_connect(struct device *dev,
 			   enum mtk_ddp_comp_id cur,
 			   enum mtk_ddp_comp_id next)
@@ -206,6 +260,11 @@ static int mtk_mmsys_probe(struct platform_device *pdev)
 	}
 
 	mmsys->data = of_device_get_match_data(&pdev->dev);
+	if (!mmsys->data && mtk_mmsys_get_match_data_by_clk_name(&mmsys->data, dev) < 0) {
+		dev_err(dev, "Couldn't get match driver data\n");
+		return -EINVAL;
+	}
+
 	platform_set_drvdata(pdev, mmsys);
 
 	clks = platform_device_register_data(&pdev->dev, mmsys->data->clk_driver,
@@ -260,6 +319,9 @@ static const struct of_device_id of_match_mtk_mmsys[] = {
 		.compatible = "mediatek,mt8192-mmsys",
 		.data = &mt8192_mmsys_driver_data,
 	},
+	{
+		.compatible = "mediatek,mt8195-mmsys",
+	},
 	{
 		.compatible = "mediatek,mt8365-mmsys",
 		.data = &mt8365_mmsys_driver_data,
diff --git a/drivers/soc/mediatek/mtk-mmsys.h b/drivers/soc/mediatek/mtk-mmsys.h
index 77f37f8c715b..b119af6646bf 100644
--- a/drivers/soc/mediatek/mtk-mmsys.h
+++ b/drivers/soc/mediatek/mtk-mmsys.h
@@ -87,6 +87,7 @@ struct mtk_mmsys_routes {
 };
 
 struct mtk_mmsys_driver_data {
+	const char *clk_name;
 	const char *clk_driver;
 	const struct mtk_mmsys_routes *routes;
 	const unsigned int num_routes;
diff --git a/drivers/soc/mediatek/mtk-mutex.c b/drivers/soc/mediatek/mtk-mutex.c
index aaf8fc1abb43..d9790140cfa9 100644
--- a/drivers/soc/mediatek/mtk-mutex.c
+++ b/drivers/soc/mediatek/mtk-mutex.c
@@ -200,7 +200,7 @@ static const unsigned int mt8167_mutex_mod[DDP_COMPONENT_ID_MAX] = {
 	[DDP_COMPONENT_AAL0] = MT8167_MUTEX_MOD_DISP_AAL,
 	[DDP_COMPONENT_CCORR] = MT8167_MUTEX_MOD_DISP_CCORR,
 	[DDP_COMPONENT_COLOR0] = MT8167_MUTEX_MOD_DISP_COLOR,
-	[DDP_COMPONENT_DITHER] = MT8167_MUTEX_MOD_DISP_DITHER,
+	[DDP_COMPONENT_DITHER0] = MT8167_MUTEX_MOD_DISP_DITHER,
 	[DDP_COMPONENT_GAMMA] = MT8167_MUTEX_MOD_DISP_GAMMA,
 	[DDP_COMPONENT_OVL0] = MT8167_MUTEX_MOD_DISP_OVL0,
 	[DDP_COMPONENT_OVL1] = MT8167_MUTEX_MOD_DISP_OVL1,
@@ -233,7 +233,7 @@ static const unsigned int mt8183_mutex_mod[DDP_COMPONENT_ID_MAX] = {
 	[DDP_COMPONENT_AAL0] = MT8183_MUTEX_MOD_DISP_AAL0,
 	[DDP_COMPONENT_CCORR] = MT8183_MUTEX_MOD_DISP_CCORR0,
 	[DDP_COMPONENT_COLOR0] = MT8183_MUTEX_MOD_DISP_COLOR0,
-	[DDP_COMPONENT_DITHER] = MT8183_MUTEX_MOD_DISP_DITHER0,
+	[DDP_COMPONENT_DITHER0] = MT8183_MUTEX_MOD_DISP_DITHER0,
 	[DDP_COMPONENT_GAMMA] = MT8183_MUTEX_MOD_DISP_GAMMA0,
 	[DDP_COMPONENT_OVL0] = MT8183_MUTEX_MOD_DISP_OVL0,
 	[DDP_COMPONENT_OVL_2L0] = MT8183_MUTEX_MOD_DISP_OVL0_2L,
@@ -247,7 +247,7 @@ static const unsigned int mt8186_mutex_mod[DDP_COMPONENT_ID_MAX] = {
 	[DDP_COMPONENT_AAL0] = MT8186_MUTEX_MOD_DISP_AAL0,
 	[DDP_COMPONENT_CCORR] = MT8186_MUTEX_MOD_DISP_CCORR0,
 	[DDP_COMPONENT_COLOR0] = MT8186_MUTEX_MOD_DISP_COLOR0,
-	[DDP_COMPONENT_DITHER] = MT8186_MUTEX_MOD_DISP_DITHER0,
+	[DDP_COMPONENT_DITHER0] = MT8186_MUTEX_MOD_DISP_DITHER0,
 	[DDP_COMPONENT_GAMMA] = MT8186_MUTEX_MOD_DISP_GAMMA0,
 	[DDP_COMPONENT_OVL0] = MT8186_MUTEX_MOD_DISP_OVL0,
 	[DDP_COMPONENT_OVL_2L0] = MT8186_MUTEX_MOD_DISP_OVL0_2L,
@@ -260,7 +260,7 @@ static const unsigned int mt8192_mutex_mod[DDP_COMPONENT_ID_MAX] = {
 	[DDP_COMPONENT_AAL0] = MT8192_MUTEX_MOD_DISP_AAL0,
 	[DDP_COMPONENT_CCORR] = MT8192_MUTEX_MOD_DISP_CCORR0,
 	[DDP_COMPONENT_COLOR0] = MT8192_MUTEX_MOD_DISP_COLOR0,
-	[DDP_COMPONENT_DITHER] = MT8192_MUTEX_MOD_DISP_DITHER0,
+	[DDP_COMPONENT_DITHER0] = MT8192_MUTEX_MOD_DISP_DITHER0,
 	[DDP_COMPONENT_GAMMA] = MT8192_MUTEX_MOD_DISP_GAMMA0,
 	[DDP_COMPONENT_POSTMASK0] = MT8192_MUTEX_MOD_DISP_POSTMASK0,
 	[DDP_COMPONENT_OVL0] = MT8192_MUTEX_MOD_DISP_OVL0,
diff --git a/include/linux/soc/mediatek/mtk-mmsys.h b/include/linux/soc/mediatek/mtk-mmsys.h
index 4bba275e235a..fb719fd1281c 100644
--- a/include/linux/soc/mediatek/mtk-mmsys.h
+++ b/include/linux/soc/mediatek/mtk-mmsys.h
@@ -16,14 +16,25 @@ enum mtk_ddp_comp_id {
 	DDP_COMPONENT_CCORR,
 	DDP_COMPONENT_COLOR0,
 	DDP_COMPONENT_COLOR1,
-	DDP_COMPONENT_DITHER,
+	DDP_COMPONENT_DITHER0,
+	DDP_COMPONENT_DITHER1,
+	DDP_COMPONENT_DP_INTF0,
+	DDP_COMPONENT_DP_INTF1,
 	DDP_COMPONENT_DPI0,
 	DDP_COMPONENT_DPI1,
+	DDP_COMPONENT_DSC0,
+	DDP_COMPONENT_DSC1,
 	DDP_COMPONENT_DSI0,
 	DDP_COMPONENT_DSI1,
 	DDP_COMPONENT_DSI2,
 	DDP_COMPONENT_DSI3,
 	DDP_COMPONENT_GAMMA,
+	DDP_COMPONENT_MERGE0,
+	DDP_COMPONENT_MERGE1,
+	DDP_COMPONENT_MERGE2,
+	DDP_COMPONENT_MERGE3,
+	DDP_COMPONENT_MERGE4,
+	DDP_COMPONENT_MERGE5,
 	DDP_COMPONENT_OD0,
 	DDP_COMPONENT_OD1,
 	DDP_COMPONENT_OVL0,
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
