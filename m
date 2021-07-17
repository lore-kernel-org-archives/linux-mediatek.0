Return-Path: <SRS0=8BsG=MJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6ADF0C636C9
	for <linux-mediatek@archiver.kernel.org>; Sat, 17 Jul 2021 09:06:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1ACF3611C0
	for <linux-mediatek@archiver.kernel.org>; Sat, 17 Jul 2021 09:06:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1ACF3611C0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RyXVHLDHo1a6uWD+oZvN5NF7x9jwI3Pq+OUAs6siU5o=; b=UcvXuCz7zVgzho
	EDKuSWl0GQCVnDFGsGD+plIywZgJyeorqnRNQjWjzyQVwTm12y+0Bye3eMPCDvZ7Ui/4IIKnhlRsk
	zjYRyKQTno9wYhvzkzRWhas6eWUwAQPaitrIfoqPJ46j1mRdp1WFvjiz/PeIGkfNu5BHosCorOrc7
	nR/CBHmxdJH5usaQkvEU9P+ixa5d2/k4QkXxZV8e54vZqs3tf1iWiB3NLB3S7xRXof9ilvvN72162
	wujZP0jC3rQmO5dQLSkDsbvW/mRXz8Sh5ZuonhSmsUwSlf0kJA1tVoZP5kgU8DA+2ZkMKyaQBqfYi
	QnEW5rTxI4jmb3Ww99KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m4gGg-006HEc-LM; Sat, 17 Jul 2021 09:05:54 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m4gFQ-006GmX-FH; Sat, 17 Jul 2021 09:04:39 +0000
X-UUID: b73e19ed67b5422bb0beda70082f81d5-20210717
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=VYLAizeHXS/pnGDo9BbpfilvSla8blrW+n/6765XGoA=; 
 b=aPNYkXrnI+UcdWi00yPJSYyzyPhlnAmHTeSQ3owEEtDSAWulrXQSiJIdqtqa8cT36m3fRLfw3IEecmZkM6sO5mA9gbxecluFPwzF+uVDP3bRDBOLv3D0j1HO+zYyAWHQy70AjF5UwJ6YniDYKl/NHKhlGtofh1GCHGOG+S5YrC4=;
X-UUID: b73e19ed67b5422bb0beda70082f81d5-20210717
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <nancy.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1800651011; Sat, 17 Jul 2021 02:04:33 -0700
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 17 Jul 2021 02:04:31 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 17 Jul 2021 17:04:29 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sat, 17 Jul 2021 17:04:30 +0800
From: Nancy.Lin <nancy.lin@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>
CC: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, "jason-jh . lin" <jason-jh.lin@mediatek.com>,
 "Nancy . Lin" <nancy.lin@mediatek.com>, Yongqiang Niu
 <yongqiang.niu@mediatek.com>, <dri-devel@lists.freedesktop.org>,
 <linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <singo.chang@mediatek.com>, <srv_heupstream@mediatek.com>
Subject: [PATCH v1 06/10] drm/mediatek: add ETHDR support for MT8195
Date: Sat, 17 Jul 2021 17:04:04 +0800
Message-ID: <20210717090408.28283-7-nancy.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210717090408.28283-1-nancy.lin@mediatek.com>
References: <20210717090408.28283-1-nancy.lin@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210717_020436_589421_9C86B66B 
X-CRM114-Status: GOOD (  21.40  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add ETHDR module files:
ETHDR is designed for HDR video and graphics conversion in the external
display path. It handles multiple HDR input types and performs tone
mapping, color space/color format conversion, and then combines
different layers, output the required HDR or SDR signal to the
subsequent display path.

Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
---
 drivers/gpu/drm/mediatek/Makefile           |   3 +-
 drivers/gpu/drm/mediatek/mtk_disp_drv.h     |   8 +
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c |  11 +
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |   1 +
 drivers/gpu/drm/mediatek/mtk_drm_drv.c      |   4 +
 drivers/gpu/drm/mediatek/mtk_drm_drv.h      |   1 +
 drivers/gpu/drm/mediatek/mtk_ethdr.c        | 537 ++++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_ethdr.h        |  20 +
 8 files changed, 584 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/mediatek/mtk_ethdr.c
 create mode 100644 drivers/gpu/drm/mediatek/mtk_ethdr.h

diff --git a/drivers/gpu/drm/mediatek/Makefile b/drivers/gpu/drm/mediatek/Makefile
index 27c89847d43b..fcce08710cef 100644
--- a/drivers/gpu/drm/mediatek/Makefile
+++ b/drivers/gpu/drm/mediatek/Makefile
@@ -13,7 +13,8 @@ mediatek-drm-y := mtk_disp_ccorr.o \
 		  mtk_drm_gem.o \
 		  mtk_drm_plane.o \
 		  mtk_dsi.o \
-		  mtk_dpi.o
+		  mtk_dpi.o \
+		  mtk_ethdr.o
 
 obj-$(CONFIG_DRM_MEDIATEK) += mediatek-drm.o
 
diff --git a/drivers/gpu/drm/mediatek/mtk_disp_drv.h b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
index 3e27ce7fef57..7227ffbc3eae 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_drv.h
+++ b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
@@ -105,4 +105,12 @@ void mtk_rdma_enable_vblank(struct device *dev,
 			    void *vblank_cb_data);
 void mtk_rdma_disable_vblank(struct device *dev);
 
+int mtk_ethdr_clk_enable(struct device *dev);
+void mtk_ethdr_clk_disable(struct device *dev);
+void mtk_ethdr_config(struct device *dev, unsigned int w,
+		      unsigned int h, unsigned int vrefresh,
+		      unsigned int bpc, struct cmdq_pkt *cmdq_pkt);
+void mtk_ethdr_start(struct device *dev);
+void mtk_ethdr_stop(struct device *dev);
+
 #endif
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
index 9125d0f6352f..3fa86f12feb4 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
@@ -355,6 +355,14 @@ static const struct mtk_ddp_comp_funcs ddp_ufoe = {
 	.start = mtk_ufoe_start,
 };
 
+static const struct mtk_ddp_comp_funcs ddp_ethdr = {
+	.clk_enable = mtk_ethdr_clk_enable,
+	.clk_disable = mtk_ethdr_clk_disable,
+	.config = mtk_ethdr_config,
+	.start = mtk_ethdr_start,
+	.stop = mtk_ethdr_stop,
+};
+
 static const char * const mtk_ddp_comp_stem[MTK_DDP_COMP_TYPE_MAX] = {
 	[MTK_DISP_OVL] = "ovl",
 	[MTK_DISP_OVL_2L] = "ovl-2l",
@@ -363,6 +371,7 @@ static const char * const mtk_ddp_comp_stem[MTK_DDP_COMP_TYPE_MAX] = {
 	[MTK_DISP_COLOR] = "color",
 	[MTK_DISP_CCORR] = "ccorr",
 	[MTK_DISP_AAL] = "aal",
+	[MTK_DISP_ETHDR] = "ethdr",
 	[MTK_DISP_GAMMA] = "gamma",
 	[MTK_DISP_DITHER] = "dither",
 	[MTK_DISP_UFOE] = "ufoe",
@@ -399,6 +408,7 @@ static const struct mtk_ddp_comp_match mtk_ddp_matches[DDP_COMPONENT_ID_MAX] = {
 	[DDP_COMPONENT_DSI1]	= { MTK_DSI,		1, &ddp_dsi },
 	[DDP_COMPONENT_DSI2]	= { MTK_DSI,		2, &ddp_dsi },
 	[DDP_COMPONENT_DSI3]	= { MTK_DSI,		3, &ddp_dsi },
+	[DDP_COMPONENT_ETHDR]	= { MTK_DISP_ETHDR,	0, &ddp_ethdr},
 	[DDP_COMPONENT_GAMMA]	= { MTK_DISP_GAMMA,	0, &ddp_gamma },
 	[DDP_COMPONENT_MERGE0]	= { MTK_DISP_MERGE,	0, &ddp_merge },
 	[DDP_COMPONENT_MERGE1]	= { MTK_DISP_MERGE,	1, &ddp_merge },
@@ -536,6 +546,7 @@ int mtk_ddp_comp_init(struct device_node *node, struct mtk_ddp_comp *comp,
 	    type == MTK_DISP_CCORR ||
 	    type == MTK_DISP_COLOR ||
 	    type == MTK_DISP_DSC ||
+	    type == MTK_DISP_ETHDR ||
 	    type == MTK_DISP_GAMMA ||
 	    type == MTK_DISP_MERGE ||
 	    type == MTK_DISP_OVL ||
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
index 0afd78c0bc92..f55efba6e744 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
@@ -36,6 +36,7 @@ enum mtk_ddp_comp_type {
 	MTK_DISP_BLS,
 	MTK_DISP_DSC,
 	MTK_DISP_MERGE,
+	MTK_DISP_ETHDR,
 	MTK_DDP_COMP_TYPE_MAX,
 };
 
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index 11c25daf05d8..ace958a34bb5 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -480,6 +480,8 @@ static const struct of_device_id mtk_ddp_comp_dt_ids[] = {
 	  .data = (void *)MTK_DISP_PWM },
 	{ .compatible = "mediatek,mt8173-disp-od",
 	  .data = (void *)MTK_DISP_OD },
+	{ .compatible = "mediatek,mt8195-disp-ethdr",
+	  .data = (void *)MTK_DISP_ETHDR },
 	{ }
 };
 
@@ -567,6 +569,7 @@ static int mtk_drm_probe(struct platform_device *pdev)
 		if (comp_type == MTK_DISP_CCORR ||
 		    comp_type == MTK_DISP_COLOR ||
 		    comp_type == MTK_DISP_DSC ||
+		    comp_type == MTK_DISP_ETHDR ||
 		    comp_type == MTK_DISP_GAMMA ||
 		    comp_type == MTK_DISP_MERGE ||
 		    comp_type == MTK_DISP_OVL ||
@@ -676,6 +679,7 @@ static struct platform_driver * const mtk_drm_drivers[] = {
 	&mtk_dpi_driver,
 	&mtk_drm_platform_driver,
 	&mtk_dsi_driver,
+	&mtk_ethdr_driver,
 };
 
 static int __init mtk_drm_init(void)
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.h b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
index c4d802a43531..c87ebb5309d0 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
@@ -55,5 +55,6 @@ extern struct platform_driver mtk_disp_dsc_driver;
 extern struct platform_driver mtk_disp_merge_driver;
 extern struct platform_driver mtk_dpi_driver;
 extern struct platform_driver mtk_dsi_driver;
+extern struct platform_driver mtk_ethdr_driver;
 
 #endif /* MTK_DRM_DRV_H */
diff --git a/drivers/gpu/drm/mediatek/mtk_ethdr.c b/drivers/gpu/drm/mediatek/mtk_ethdr.c
new file mode 100644
index 000000000000..ceadb28169b8
--- /dev/null
+++ b/drivers/gpu/drm/mediatek/mtk_ethdr.c
@@ -0,0 +1,537 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2021 MediaTek Inc.
+ */
+
+#include <drm/drm_fourcc.h>
+#include <linux/clk.h>
+#include <linux/component.h>
+#include <linux/of_device.h>
+#include <linux/of_address.h>
+#include <linux/platform_device.h>
+#include <linux/soc/mediatek/mtk-cmdq.h>
+
+#include "mtk_drm_crtc.h"
+#include "mtk_drm_ddp_comp.h"
+#include "mtk_drm_drv.h"
+#include "mtk_ethdr.h"
+
+#define MIX_EN		0xc
+#define MIX_RST		0x14
+#define MIX_ROI_SIZE	0x18
+#define MIX_DATAPATH_CON	0x1c
+#define MIX_ROI_BGCLR	0x20
+#define MIX_SRC_CON	0x24
+#define MIX_L0_CON	0x28
+#define MIX_L0_SRC_SIZE	0x30
+#define MIX_L0_OFFSET	0x34
+#define MIX_L1_CON	0x40
+#define MIX_L1_SRC_SIZE	0x48
+#define MIX_L1_OFFSET	0x4c
+#define MIX_L2_CON	0x58
+#define MIX_L2_SRC_SIZE	0x60
+#define MIX_L2_OFFSET	0x64
+#define MIX_L3_CON	0x70
+#define MIX_L3_SRC_SIZE	0x78
+#define MIX_L3_OFFSET	0x7c
+#define MIX_FUNC_DCM0	0x120
+#define MIX_FUNC_DCM1	0x124
+
+#define HDR_VDO_FE_0804_HDR_DM_FE	0x804
+#define HDR_VDO_FE_081C_HDR_DM_FE	0x81c
+#define HDR_VDO_FE_09EC_HDR_DM_FE	0x9ec
+#define HDR_VDO_FE_0618_HDR_TOP_FE	0x618
+#define HDR_VDO_FE_061C_HDR_TOP_FE	0x61c
+#define HDR_VDO_FE_06D0_HDR_TOP_FE	0x6d0
+#define HDR_VDO_FE_0634_HDR_TOP_FE	0x634
+
+#define HDR_GFX_FE_0100_GFX_DV_WP	0x100
+#define HDR_GFX_FE_012C_GFX_DV_WP	0x12c
+#define HDR_GFX_FE_0134_GFX_DV_WP	0x134
+#define HDR_GFX_FE_0138_GFX_DV_WP	0x138
+#define HDR_GFX_FE_013C_GFX_DV_WP	0x13c
+#define HDR_GFX_FE_0140_GFX_DV_WP	0x140
+#define HDR_GFX_FE_0144_GFX_DV_WP	0x144
+#define HDR_GFX_FE_0148_GFX_DV_WP	0x148
+#define HDR_GFX_FE_014C_GFX_DV_WP	0x14c
+#define HDR_GFX_FE_0150_GFX_DV_WP	0x150
+#define HDR_GFX_FE_0154_GFX_DV_WP	0x154
+#define HDR_GFX_FE_0204_GFX_HDR_FE	0x204
+#define HDR_GFX_FE_021C_GFX_HDR_FE	0x21c
+#define HDR_GFX_FE_03EC_GFX_HDR_FE	0x3ec
+
+#define HDR_VDO_BE_0204_VDO_DM_BE	0x204
+#define HDR_VDO_BE_0320_VDO_DM_BE	0x320
+#define HDR_VDO_BE_03C8_VDO_DM_BE	0x3c8
+
+#define VDO1_CONFIG_SW0_RST_B 0x1d0
+#define VDO1_CONFIG_SW1_RST_B 0x1d4
+	#define HDR_ASYNC_RESET_BIT (BIT(19) | BIT(20) | BIT(21) | BIT(22) | BIT(23))
+#define VDO1_CONFIG_HDR_BE_ASYNC_CFG_WD 0xe70
+#define VDO1_CONFIG_HDR_TOP_CFG 0xd00
+	#define HDR_ALPHA_SEL_MIXER_IN1 BIT(20)
+	#define HDR_ALPHA_SEL_MIXER_IN2 BIT(21)
+	#define HDR_ALPHA_SEL_MIXER_IN3 BIT(22)
+	#define HDR_ALPHA_SEL_MIXER_IN4 BIT(23)
+#define VDO1_CONFIG_MIXER_IN1_ALPHA 0xd30
+#define VDO1_CONFIG_MIXER_IN2_ALPHA 0xd34
+#define VDO1_CONFIG_MIXER_IN3_ALPHA 0xd38
+#define VDO1_CONFIG_MIXER_IN4_ALPHA 0xd3c
+#define VDO1_CONFIG_MIXER_IN4_PAD   0xd4c
+
+#define	MIXER_ALPHA_AEN		BIT(8)
+#define	MIXER_ALPHA		0xff
+#define ETHDR_CLK_NUM		13
+
+enum mtk_ethdr_comp_id {
+	ETHDR_MIXER,
+	ETHDR_VDO_FE0,
+	ETHDR_VDO_FE1,
+	ETHDR_GFX_FE0,
+	ETHDR_GFX_FE1,
+	ETHDR_VDO_BE,
+	ETHDR_ADL_DS,
+	ETHDR_ID_MAX
+};
+
+struct mtk_ethdr_comp {
+	struct device *dev;
+	void __iomem *regs;
+	struct cmdq_client_reg cmdq_base;
+};
+
+struct mtk_ethdr {
+	void __iomem *top_regs;
+	struct cmdq_client_reg top_cmdq_base;
+	struct mtk_ethdr_comp ethdr_comp[ETHDR_ID_MAX];
+	struct clk_bulk_data ethdr_clk[ETHDR_CLK_NUM];
+};
+
+static const char * const ethdr_comp_str[] = {
+	"ETHDR_MIXER",
+	"ETHDR_VDO_FE0",
+	"ETHDR_VDO_FE1",
+	"ETHDR_GFX_FE0",
+	"ETHDR_GFX_FE1",
+	"ETHDR_VDO_BE",
+	"ETHDR_ADL_DS",
+	"ETHDR_ID_MAX"
+};
+
+static const char * const ethdr_clk_str[] = {
+	"ethdr_top",
+	"mixer",
+	"vdo_fe0",
+	"vdo_fe1",
+	"gfx_fe0",
+	"gfx_fe1",
+	"vdo_be",
+	"adl_ds",
+	"vdo_fe0_async",
+	"vdo_fe1_async",
+	"gfx_fe0_async",
+	"gfx_fe1_async",
+	"vdo_be_async",
+};
+
+static const unsigned int alpha_source_sel[] = {
+	HDR_ALPHA_SEL_MIXER_IN1,
+	HDR_ALPHA_SEL_MIXER_IN2,
+	HDR_ALPHA_SEL_MIXER_IN3,
+	HDR_ALPHA_SEL_MIXER_IN4,
+};
+
+void mtk_ethdr_layer_on(struct device *dev, unsigned int idx,
+			struct cmdq_pkt *cmdq_pkt)
+{
+	struct mtk_ethdr *priv = dev_get_drvdata(dev);
+	struct mtk_ethdr_comp *mixer = &priv->ethdr_comp[ETHDR_MIXER];
+
+	dev_dbg(dev, "%s+ idx:%d", __func__, idx);
+
+	if (idx < 4)
+		mtk_ddp_write_mask(cmdq_pkt, BIT(idx), &mixer->cmdq_base,
+				   mixer->regs, MIX_SRC_CON, BIT(idx));
+}
+
+void mtk_ethdr_layer_off(struct device *dev, unsigned int idx,
+			 struct cmdq_pkt *cmdq_pkt)
+{
+	struct mtk_ethdr *priv = dev_get_drvdata(dev);
+	struct mtk_ethdr_comp *mixer = &priv->ethdr_comp[ETHDR_MIXER];
+
+	dev_dbg(dev, "%s+ idx:%d", __func__, idx);
+
+	switch (idx) {
+	case 0:
+		mtk_ddp_write_mask(cmdq_pkt, 0, &mixer->cmdq_base,
+				   mixer->regs, MIX_L0_SRC_SIZE, ~0);
+		break;
+	case 1:
+		mtk_ddp_write_mask(cmdq_pkt, 0, &mixer->cmdq_base,
+				   mixer->regs, MIX_L1_SRC_SIZE, ~0);
+		break;
+	case 2:
+		mtk_ddp_write_mask(cmdq_pkt, 0, &mixer->cmdq_base,
+				   mixer->regs, MIX_L2_SRC_SIZE, ~0);
+		break;
+	case 3:
+		mtk_ddp_write_mask(cmdq_pkt, 0, &mixer->cmdq_base,
+				   mixer->regs, MIX_L3_SRC_SIZE, ~0);
+		break;
+	default:
+		dev_dbg(dev, "%s Wrong layer ID\n", __func__);
+		break;
+	}
+}
+
+void mtk_ethdr_layer_config(struct device *dev, unsigned int idx,
+			    struct mtk_plane_state *state,
+			    struct cmdq_pkt *cmdq_pkt)
+{
+	struct mtk_ethdr *priv = dev_get_drvdata(dev);
+	struct mtk_ethdr_comp *mixer = &priv->ethdr_comp[ETHDR_MIXER];
+	struct mtk_plane_pending_state *pending = &state->pending;
+	unsigned int src_size = (pending->height << 16) | pending->width;
+	unsigned int offset = (pending->y << 16) | pending->x;
+	unsigned int alpha_con = 0;
+	unsigned int fmt = 0;
+
+	fmt = state->pending.format;
+
+	if (state->base.fb && state->base.fb->format->has_alpha) {
+		alpha_con = MIXER_ALPHA_AEN | MIXER_ALPHA;
+		mtk_ddp_write_mask(cmdq_pkt, 0, &priv->top_cmdq_base, priv->top_regs,
+				   VDO1_CONFIG_HDR_TOP_CFG, alpha_source_sel[idx]);
+	} else {
+		mtk_ddp_write_mask(cmdq_pkt, ~0, &priv->top_cmdq_base, priv->top_regs,
+				   VDO1_CONFIG_HDR_TOP_CFG, alpha_source_sel[idx]);
+	}
+
+	switch (idx) {
+	case 0:
+		mtk_ddp_write_mask(cmdq_pkt, src_size, &mixer->cmdq_base,
+				   mixer->regs, MIX_L0_SRC_SIZE, ~0);
+		mtk_ddp_write_mask(cmdq_pkt, offset, &mixer->cmdq_base,
+				   mixer->regs, MIX_L0_OFFSET, ~0);
+		mtk_ddp_write_mask(cmdq_pkt, alpha_con, &mixer->cmdq_base,
+				   mixer->regs, MIX_L0_CON, 0x1ff);
+		break;
+	case 1:
+		mtk_ddp_write_mask(cmdq_pkt, src_size, &mixer->cmdq_base,
+				   mixer->regs, MIX_L1_SRC_SIZE, ~0);
+		mtk_ddp_write_mask(cmdq_pkt, offset, &mixer->cmdq_base,
+				   mixer->regs, MIX_L1_OFFSET, ~0);
+		mtk_ddp_write_mask(cmdq_pkt, alpha_con, &mixer->cmdq_base,
+				   mixer->regs, MIX_L1_CON, 0x1ff);
+		break;
+	case 2:
+		mtk_ddp_write_mask(cmdq_pkt, src_size, &mixer->cmdq_base,
+				   mixer->regs, MIX_L2_SRC_SIZE, ~0);
+		mtk_ddp_write_mask(cmdq_pkt, offset, &mixer->cmdq_base,
+				   mixer->regs, MIX_L2_OFFSET, ~0);
+		mtk_ddp_write_mask(cmdq_pkt, alpha_con, &mixer->cmdq_base,
+				   mixer->regs, MIX_L2_CON, 0x1ff);
+		break;
+	case 3:
+		mtk_ddp_write_mask(cmdq_pkt, src_size, &mixer->cmdq_base,
+				   mixer->regs, MIX_L3_SRC_SIZE, ~0);
+		mtk_ddp_write_mask(cmdq_pkt, offset, &mixer->cmdq_base,
+				   mixer->regs, MIX_L3_OFFSET, ~0);
+		mtk_ddp_write_mask(cmdq_pkt, alpha_con, &mixer->cmdq_base,
+				   mixer->regs, MIX_L3_CON, 0x1ff);
+		break;
+	default:
+		dev_dbg(dev, "%s Wrong layer ID\n", __func__);
+		break;
+	}
+}
+
+void mtk_ethdr_config(struct device *dev, unsigned int w,
+		      unsigned int h, unsigned int vrefresh,
+		      unsigned int bpc, struct cmdq_pkt *cmdq_pkt)
+{
+	struct mtk_ethdr *priv = dev_get_drvdata(dev);
+	struct mtk_ethdr_comp *mixer = &priv->ethdr_comp[ETHDR_MIXER];
+
+	dev_dbg(dev, "%s-w:%d, h:%d\n", __func__, w, h);
+	mtk_ddp_write_mask(cmdq_pkt, (h << 16) | (w / 2), &priv->top_cmdq_base,
+			   priv->top_regs, VDO1_CONFIG_HDR_BE_ASYNC_CFG_WD, ~0);
+	mtk_ddp_write_mask(cmdq_pkt, 0, &priv->top_cmdq_base,
+			   priv->top_regs, VDO1_CONFIG_MIXER_IN4_PAD, ~0);
+	mtk_ddp_write_mask(cmdq_pkt, (h << 16 | w), &mixer->cmdq_base,
+			   mixer->regs, MIX_ROI_SIZE, ~0);
+	mtk_ddp_write_mask(cmdq_pkt, 0x01000100, &priv->top_cmdq_base,
+			   priv->top_regs, VDO1_CONFIG_MIXER_IN1_ALPHA, ~0);
+	mtk_ddp_write_mask(cmdq_pkt, 0x01000100, &priv->top_cmdq_base,
+			   priv->top_regs, VDO1_CONFIG_MIXER_IN2_ALPHA, ~0);
+	mtk_ddp_write_mask(cmdq_pkt, 0x01000100, &priv->top_cmdq_base,
+			   priv->top_regs, VDO1_CONFIG_MIXER_IN3_ALPHA, ~0);
+	mtk_ddp_write_mask(cmdq_pkt, 0x01000100, &priv->top_cmdq_base,
+			   priv->top_regs, VDO1_CONFIG_MIXER_IN4_ALPHA, ~0);
+}
+
+void mtk_ethdr_start(struct device *dev)
+{
+	struct mtk_ethdr *priv = dev_get_drvdata(dev);
+	struct mtk_ethdr_comp *vdo_fe0 = &priv->ethdr_comp[ETHDR_VDO_FE0];
+	struct mtk_ethdr_comp *vdo_fe1 = &priv->ethdr_comp[ETHDR_VDO_FE1];
+	struct mtk_ethdr_comp *gfx_fe0 = &priv->ethdr_comp[ETHDR_GFX_FE0];
+	struct mtk_ethdr_comp *gfx_fe1 = &priv->ethdr_comp[ETHDR_GFX_FE1];
+	struct mtk_ethdr_comp *vdo_be = &priv->ethdr_comp[ETHDR_VDO_BE];
+	struct mtk_ethdr_comp *mixer = &priv->ethdr_comp[ETHDR_MIXER];
+
+	mtk_ddp_write_mask(NULL, 0xfd, &vdo_fe0->cmdq_base, vdo_fe0->regs,
+			   HDR_VDO_FE_0804_HDR_DM_FE, ~0);
+	mtk_ddp_write_mask(NULL, 0x80, &vdo_fe0->cmdq_base, vdo_fe0->regs,
+			   HDR_VDO_FE_09EC_HDR_DM_FE, ~0);
+	mtk_ddp_write_mask(NULL, 0x12e, &vdo_fe0->cmdq_base, vdo_fe0->regs,
+			   HDR_VDO_FE_081C_HDR_DM_FE, ~0);
+	mtk_ddp_write_mask(NULL, 0x0, &vdo_fe0->cmdq_base, vdo_fe0->regs,
+			   HDR_VDO_FE_0618_HDR_TOP_FE, ~0);
+	mtk_ddp_write_mask(NULL, 0x2, &vdo_fe0->cmdq_base, vdo_fe0->regs,
+			   HDR_VDO_FE_061C_HDR_TOP_FE, ~0);
+	mtk_ddp_write_mask(NULL, 0x8001, &vdo_fe0->cmdq_base, vdo_fe0->regs,
+			   HDR_VDO_FE_06D0_HDR_TOP_FE, ~0);
+	mtk_ddp_write_mask(NULL, 0x8000, &vdo_fe0->cmdq_base, vdo_fe0->regs,
+			   HDR_VDO_FE_0634_HDR_TOP_FE, ~0);
+
+	mtk_ddp_write_mask(NULL, 0xfd, &vdo_fe1->cmdq_base, vdo_fe1->regs,
+			   HDR_VDO_FE_0804_HDR_DM_FE, ~0);
+	mtk_ddp_write_mask(NULL, 0x80, &vdo_fe1->cmdq_base, vdo_fe1->regs,
+			   HDR_VDO_FE_09EC_HDR_DM_FE, ~0);
+	mtk_ddp_write_mask(NULL, 0x12e, &vdo_fe1->cmdq_base, vdo_fe1->regs,
+			   HDR_VDO_FE_081C_HDR_DM_FE, ~0);
+	mtk_ddp_write_mask(NULL, 0x0, &vdo_fe1->cmdq_base, vdo_fe1->regs,
+			   HDR_VDO_FE_0618_HDR_TOP_FE, ~0);
+	mtk_ddp_write_mask(NULL, 0x2, &vdo_fe1->cmdq_base, vdo_fe1->regs,
+			   HDR_VDO_FE_061C_HDR_TOP_FE, ~0);
+	mtk_ddp_write_mask(NULL, 0x8001, &vdo_fe1->cmdq_base, vdo_fe1->regs,
+			   HDR_VDO_FE_06D0_HDR_TOP_FE, ~0);
+	mtk_ddp_write_mask(NULL, 0x8000, &vdo_fe1->cmdq_base, vdo_fe1->regs,
+			   HDR_VDO_FE_0634_HDR_TOP_FE, ~0);
+
+	mtk_ddp_write_mask(NULL, 0x8001, &gfx_fe0->cmdq_base, gfx_fe0->regs,
+			   HDR_GFX_FE_0100_GFX_DV_WP, ~0);
+	mtk_ddp_write_mask(NULL, 0xe030, &gfx_fe0->cmdq_base, gfx_fe0->regs,
+			   HDR_GFX_FE_012C_GFX_DV_WP, ~0);
+	mtk_ddp_write_mask(NULL, 0x1c0, &gfx_fe0->cmdq_base, gfx_fe0->regs,
+			   HDR_GFX_FE_0134_GFX_DV_WP, ~0);
+	mtk_ddp_write_mask(NULL, 0x1e69, &gfx_fe0->cmdq_base, gfx_fe0->regs,
+			   HDR_GFX_FE_0138_GFX_DV_WP, ~0);
+	mtk_ddp_write_mask(NULL, 0x1fd7, &gfx_fe0->cmdq_base, gfx_fe0->regs,
+			   HDR_GFX_FE_013C_GFX_DV_WP, ~0);
+	mtk_ddp_write_mask(NULL, 0xba, &gfx_fe0->cmdq_base, gfx_fe0->regs,
+			   HDR_GFX_FE_0140_GFX_DV_WP, ~0);
+	mtk_ddp_write_mask(NULL, 0x275, &gfx_fe0->cmdq_base, gfx_fe0->regs,
+			   HDR_GFX_FE_0144_GFX_DV_WP, ~0);
+	mtk_ddp_write_mask(NULL, 0x3f, &gfx_fe0->cmdq_base, gfx_fe0->regs,
+			   HDR_GFX_FE_0148_GFX_DV_WP, ~0);
+	mtk_ddp_write_mask(NULL, 0x1f99, &gfx_fe0->cmdq_base, gfx_fe0->regs,
+			   HDR_GFX_FE_014C_GFX_DV_WP, ~0);
+	mtk_ddp_write_mask(NULL, 0x1ea6, &gfx_fe0->cmdq_base, gfx_fe0->regs,
+			   HDR_GFX_FE_0150_GFX_DV_WP, ~0);
+	mtk_ddp_write_mask(NULL, 0x1c2, &gfx_fe0->cmdq_base, gfx_fe0->regs,
+			   HDR_GFX_FE_0154_GFX_DV_WP, ~0);
+	mtk_ddp_write_mask(NULL, 0xfd, &gfx_fe0->cmdq_base, gfx_fe0->regs,
+			   HDR_GFX_FE_0204_GFX_HDR_FE, ~0);
+	mtk_ddp_write_mask(NULL, 0x80, &gfx_fe0->cmdq_base, gfx_fe0->regs,
+			   HDR_GFX_FE_03EC_GFX_HDR_FE, ~0);
+	mtk_ddp_write_mask(NULL, 0x20, &gfx_fe0->cmdq_base, gfx_fe0->regs,
+			   HDR_GFX_FE_021C_GFX_HDR_FE, ~0);
+
+	mtk_ddp_write_mask(NULL, 0x8001, &gfx_fe1->cmdq_base, gfx_fe1->regs,
+			   HDR_GFX_FE_0100_GFX_DV_WP, ~0);
+	mtk_ddp_write_mask(NULL, 0xe030, &gfx_fe1->cmdq_base, gfx_fe1->regs,
+			   HDR_GFX_FE_012C_GFX_DV_WP, ~0);
+	mtk_ddp_write_mask(NULL, 0x1c0, &gfx_fe1->cmdq_base, gfx_fe1->regs,
+			   HDR_GFX_FE_0134_GFX_DV_WP, ~0);
+	mtk_ddp_write_mask(NULL, 0x1e69, &gfx_fe1->cmdq_base, gfx_fe1->regs,
+			   HDR_GFX_FE_0138_GFX_DV_WP, ~0);
+	mtk_ddp_write_mask(NULL, 0x1fd7, &gfx_fe1->cmdq_base, gfx_fe1->regs,
+			   HDR_GFX_FE_013C_GFX_DV_WP, ~0);
+	mtk_ddp_write_mask(NULL, 0xba, &gfx_fe1->cmdq_base, gfx_fe1->regs,
+			   HDR_GFX_FE_0140_GFX_DV_WP, ~0);
+	mtk_ddp_write_mask(NULL, 0x275, &gfx_fe1->cmdq_base, gfx_fe1->regs,
+			   HDR_GFX_FE_0144_GFX_DV_WP, ~0);
+	mtk_ddp_write_mask(NULL, 0x3f, &gfx_fe1->cmdq_base, gfx_fe1->regs,
+			   HDR_GFX_FE_0148_GFX_DV_WP, ~0);
+	mtk_ddp_write_mask(NULL, 0x1f99, &gfx_fe1->cmdq_base, gfx_fe1->regs,
+			   HDR_GFX_FE_014C_GFX_DV_WP, ~0);
+	mtk_ddp_write_mask(NULL, 0x1ea6, &gfx_fe1->cmdq_base, gfx_fe1->regs,
+			   HDR_GFX_FE_0150_GFX_DV_WP, ~0);
+	mtk_ddp_write_mask(NULL, 0x1c2, &gfx_fe1->cmdq_base, gfx_fe1->regs,
+			   HDR_GFX_FE_0154_GFX_DV_WP, ~0);
+	mtk_ddp_write_mask(NULL, 0xfd, &gfx_fe1->cmdq_base, gfx_fe1->regs,
+			   HDR_GFX_FE_0204_GFX_HDR_FE, ~0);
+	mtk_ddp_write_mask(NULL, 0x80, &gfx_fe1->cmdq_base, gfx_fe1->regs,
+			   HDR_GFX_FE_03EC_GFX_HDR_FE, ~0);
+	mtk_ddp_write_mask(NULL, 0x20, &gfx_fe1->cmdq_base, gfx_fe1->regs,
+			   HDR_GFX_FE_021C_GFX_HDR_FE, ~0);
+
+	mtk_ddp_write_mask(NULL, 0x7e, &vdo_be->cmdq_base, vdo_be->regs,
+			   HDR_VDO_BE_0204_VDO_DM_BE, ~0);
+	mtk_ddp_write_mask(NULL, 0x00, &vdo_be->cmdq_base, vdo_be->regs,
+			   HDR_VDO_BE_0320_VDO_DM_BE, ~0);
+	mtk_ddp_write_mask(NULL, 0x01, &vdo_be->cmdq_base, vdo_be->regs,
+			   HDR_VDO_BE_03C8_VDO_DM_BE, ~0);
+
+	mtk_ddp_write_mask(NULL, 0xffffffff, &mixer->cmdq_base, mixer->regs,
+			   MIX_FUNC_DCM0, ~0);
+	mtk_ddp_write_mask(NULL, 0xffffffff, &mixer->cmdq_base, mixer->regs,
+			   MIX_FUNC_DCM1, ~0);
+	mtk_ddp_write_mask(NULL, 0x00000888, &mixer->cmdq_base, mixer->regs,
+			   MIX_DATAPATH_CON, ~0);
+	mtk_ddp_write_mask(NULL, 0x000021ff, &mixer->cmdq_base, mixer->regs,
+			   MIX_L0_CON, ~0);
+	mtk_ddp_write_mask(NULL, 0x000021ff, &mixer->cmdq_base, mixer->regs,
+			   MIX_L1_CON, ~0);
+	mtk_ddp_write_mask(NULL, 0x000021ff, &mixer->cmdq_base, mixer->regs,
+			   MIX_L2_CON, ~0);
+	mtk_ddp_write_mask(NULL, 0x000021ff, &mixer->cmdq_base, mixer->regs,
+			   MIX_L3_CON, ~0);
+	mtk_ddp_write_mask(NULL, 0x0, &mixer->cmdq_base, mixer->regs,
+			   MIX_L0_SRC_SIZE, ~0);
+	mtk_ddp_write_mask(NULL, 0x0, &mixer->cmdq_base, mixer->regs,
+			   MIX_L1_SRC_SIZE, ~0);
+	mtk_ddp_write_mask(NULL, 0x0, &mixer->cmdq_base, mixer->regs,
+			   MIX_L2_SRC_SIZE, ~0);
+	mtk_ddp_write_mask(NULL, 0x0, &mixer->cmdq_base, mixer->regs,
+			   MIX_L3_SRC_SIZE, ~0);
+	mtk_ddp_write_mask(NULL, 0x0fa50001, &mixer->cmdq_base, mixer->regs,
+			   MIX_SRC_CON, ~0);
+	mtk_ddp_write_mask(NULL, 0xFF000000, &mixer->cmdq_base, mixer->regs,
+			   MIX_ROI_BGCLR, ~0);
+	mtk_ddp_write_mask(NULL, 0x00000001, &mixer->cmdq_base, mixer->regs,
+			   MIX_EN, ~0);
+}
+
+void mtk_ethdr_stop(struct device *dev)
+{
+	struct mtk_ethdr *priv = dev_get_drvdata(dev);
+	struct mtk_ethdr_comp *mixer = &priv->ethdr_comp[ETHDR_MIXER];
+
+	mtk_ddp_write_mask(NULL, 0, &mixer->cmdq_base, mixer->regs, MIX_EN, ~0);
+	mtk_ddp_write_mask(NULL, 1, &mixer->cmdq_base, mixer->regs, MIX_RST, ~0);
+	mtk_ddp_write_mask(NULL, 0, &priv->top_cmdq_base, priv->top_regs,
+			   VDO1_CONFIG_SW1_RST_B, HDR_ASYNC_RESET_BIT);
+	mtk_ddp_write_mask(NULL, 0, &priv->top_cmdq_base, priv->top_regs,
+			   VDO1_CONFIG_SW0_RST_B, BIT(29));
+	mtk_ddp_write_mask(NULL, 0, &mixer->cmdq_base, mixer->regs, MIX_RST, ~0);
+	mtk_ddp_write_mask(NULL, HDR_ASYNC_RESET_BIT, &priv->top_cmdq_base,
+			   priv->top_regs, VDO1_CONFIG_SW1_RST_B,
+			   HDR_ASYNC_RESET_BIT);
+	mtk_ddp_write_mask(NULL, BIT(29), &priv->top_cmdq_base, priv->top_regs,
+			   VDO1_CONFIG_SW0_RST_B, BIT(29));
+}
+
+int mtk_ethdr_clk_enable(struct device *dev)
+{
+	int i, ret;
+	struct mtk_ethdr *priv = dev_get_drvdata(dev);
+
+	ret = clk_bulk_prepare_enable(ETHDR_CLK_NUM, priv->ethdr_clk);
+	if (ret)
+		dev_err(dev,
+			"ethdr_clk prepare enable failed\n");
+	return ret;
+}
+
+void mtk_ethdr_clk_disable(struct device *dev)
+{
+	struct mtk_ethdr *priv = dev_get_drvdata(dev);
+	int i;
+
+	clk_bulk_disable_unprepare(ETHDR_CLK_NUM, priv->ethdr_clk);
+}
+
+static int mtk_ethdr_bind(struct device *dev, struct device *master,
+			  void *data)
+{
+	struct mtk_ethdr *priv = dev_get_drvdata(dev);
+	struct drm_device *drm_dev = data;
+	struct mtk_drm_private *drm_private = drm_dev->dev_private;
+	struct device *mmsys_dev = drm_private->mmsys_dev;
+
+	priv->top_regs = of_iomap(mmsys_dev->of_node, 0);
+#if IS_REACHABLE(CONFIG_MTK_CMDQ)
+	if (cmdq_dev_get_client_reg(mmsys_dev, &priv->top_cmdq_base, 0))
+		dev_dbg(dev, "get mediatek,gce-client-reg fail!\n");
+#endif
+	return 0;
+}
+
+static void mtk_ethdr_unbind(struct device *dev, struct device *master, void *data)
+{
+}
+
+static const struct component_ops mtk_ethdr_component_ops = {
+	.bind	= mtk_ethdr_bind,
+	.unbind = mtk_ethdr_unbind,
+};
+
+static int mtk_ethdr_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct mtk_ethdr *priv;
+	int ret;
+	int i;
+
+	dev_info(dev, "%s+\n", __func__);
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	for (i = 0; i < ETHDR_ID_MAX; i++) {
+		priv->ethdr_comp[i].dev = dev;
+		priv->ethdr_comp[i].regs = of_iomap(dev->of_node, i);
+#if IS_REACHABLE(CONFIG_MTK_CMDQ)
+		ret = cmdq_dev_get_client_reg(dev,
+					      &priv->ethdr_comp[i].cmdq_base, i);
+		if (ret)
+			dev_dbg(dev, "get mediatek,gce-client-reg fail!\n");
+#endif
+		dev_info(dev, "[DRM]regs:0x%x, node:%s\n",
+			 priv->ethdr_comp[i].regs, ethdr_comp_str[i]);
+	}
+
+	for (i = 0; i < ETHDR_CLK_NUM; i++)
+		priv->ethdr_clk[i].id = ethdr_clk_str[i];
+	ret = devm_clk_bulk_get_optional(dev, ETHDR_CLK_NUM, priv->ethdr_clk);
+	if (ret)
+		return ret;
+
+	platform_set_drvdata(pdev, priv);
+
+	ret = component_add(dev, &mtk_ethdr_component_ops);
+	if (ret)
+		dev_notice(dev, "Failed to add component: %d\n", ret);
+
+	dev_info(dev, "%s-\n", __func__);
+
+	return ret;
+}
+
+static int mtk_ethdr_remove(struct platform_device *pdev)
+{
+	component_del(&pdev->dev, &mtk_ethdr_component_ops);
+	return 0;
+}
+
+static const struct of_device_id mtk_ethdr_driver_dt_match[] = {
+	{ .compatible = "mediatek,mt8195-disp-ethdr"},
+	{},
+};
+
+MODULE_DEVICE_TABLE(of, mtk_ethdr_driver_dt_match);
+
+struct platform_driver mtk_ethdr_driver = {
+	.probe = mtk_ethdr_probe,
+	.remove = mtk_ethdr_remove,
+	.driver = {
+			.name = "mediatek-disp-ethdr",
+			.owner = THIS_MODULE,
+			.of_match_table = mtk_ethdr_driver_dt_match,
+		},
+};
diff --git a/drivers/gpu/drm/mediatek/mtk_ethdr.h b/drivers/gpu/drm/mediatek/mtk_ethdr.h
new file mode 100644
index 000000000000..c8fc0581a632
--- /dev/null
+++ b/drivers/gpu/drm/mediatek/mtk_ethdr.h
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2021 MediaTek Inc.
+ */
+
+#ifndef __MTK_DISP_ETHDR_H__
+#define __MTK_DISP_ETHDR_H__
+
+#include <linux/uaccess.h>
+#include <drm/mediatek_drm.h>
+
+void mtk_ethdr_layer_config(struct device *dev, unsigned int idx,
+			    struct mtk_plane_state *state,
+			    struct cmdq_pkt *cmdq_pkt);
+void mtk_ethdr_layer_on(struct device *dev, unsigned int idx,
+			struct cmdq_pkt *cmdq_pkt);
+void mtk_ethdr_layer_off(struct device *dev, unsigned int idx,
+			 struct cmdq_pkt *cmdq_pkt);
+#endif
+
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
