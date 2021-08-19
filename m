Return-Path: <SRS0=ccVP=NK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E190EC4338F
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Aug 2021 02:31:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A56C6610FA
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Aug 2021 02:31:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A56C6610FA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MLB9x/Jt3Q+K7h8fYlaXcnZd890Q13yltdGbxZrEHX8=; b=RGIRuvcJL1CrEt
	EWB+Xh4l4crfMSwNe3PBSD6L54tDMPBA+cBsxU1Rgp7Xun4pac4kpRv0/AiuB/xFm/Nn2PRRCjQo0
	YO7QWCqpfjXy9IiO1Gt9xXhqGi+UXCMcYSkyOZzlbEo74Q9l9sgz1yZ/cOKlEaRZNQAUDynAOUFH9
	H4akL6iZJwvMswH4eYtfYJvWiLAeAuNIntjUvmy8n60LgD6F+7M7GSO/OT10Ux0DT6bj8262/+7ej
	GyKq6PR+jFTnJA9XE+7Kj/N97dN6/3ZQcAC9AIjDK9Uz3dBwssXDYMKPkEzYXQ00kpSLF8NZOLJoo
	utVSvH4C40e5N5WyCDVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGXqK-0073VU-CH; Thu, 19 Aug 2021 02:31:44 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGXiv-006zri-9J; Thu, 19 Aug 2021 02:24:09 +0000
X-UUID: 7c03faff7f344224ab9f82a43534df7a-20210818
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=cDKDlqkATAUcMnfy7YbTis46KioCt1KQ4O3vQj1qkCA=; 
 b=oze0HoMo5fog4sgGnXeVTEnp9B+hgq+UiWw4e1/yC4/AZrSy+L3VOJnakUU3k6v2E8JaSISDuv3uzipPi6kjgFr4SKKGTATYhnd0ST+uLya5U3Y02Gndb4E451fAqHjeJVXrSo1ubetb3XeQz7hl1z+E2xMFeLGyfc82loEBx/k=;
X-UUID: 7c03faff7f344224ab9f82a43534df7a-20210818
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <jason-jh.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1087313585; Wed, 18 Aug 2021 19:23:50 -0700
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 18 Aug 2021 19:23:48 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 19 Aug 2021 10:23:46 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 19 Aug 2021 10:23:46 +0800
From: jason-jh.lin <jason-jh.lin@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 <fshao@chromium.org>
CC: Philipp Zabel <p.zabel@pengutronix.de>, Enric Balletbo i Serra
 <enric.balletbo@collabora.com>, David Airlie <airlied@linux.ie>, "Daniel
 Vetter" <daniel@ffwll.ch>, Fabien Parent <fparent@baylibre.com>,
 <hsinyi@chromium.org>, "jason-jh . lin" <jason-jh.lin@mediatek.com>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, Jitao shi
 <jitao.shi@mediatek.com>, <nancy.lin@mediatek.com>,
 <singo.chang@mediatek.com>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH v8 11/13] drm/mediatek: add DSC support for mediatek-drm
Date: Thu, 19 Aug 2021 10:23:25 +0800
Message-ID: <20210819022327.13040-12-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210819022327.13040-1-jason-jh.lin@mediatek.com>
References: <20210819022327.13040-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210818_192405_399066_A059B3A6 
X-CRM114-Status: GOOD (  13.61  )
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

DSC is designed for real-time systems with real-time compression,
transmission, decompression and display.
The DSC standard is a specification of the algorithms used for
compressing and decompressing image display streams, including
the specification of the syntax and semantics of the compressed
video bit stream.

Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 46 +++++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |  1 +
 2 files changed, 47 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
index 28bc42fd0b8a..929630a6d832 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
@@ -45,6 +45,12 @@
 #define DITHER_LSB_ERR_SHIFT_G(x)		(((x) & 0x7) << 12)
 #define DITHER_ADD_LSHIFT_G(x)			(((x) & 0x7) << 4)
 
+#define DISP_REG_DSC_CON			0x0000
+#define DSC_EN					BIT(0)
+#define DSC_DUAL_INOUT				BIT(2)
+#define DSC_BYPASS				BIT(4)
+#define DSC_UFOE_SEL				BIT(16)
+
 #define DISP_REG_OD_EN				0x0000
 #define DISP_REG_OD_CFG				0x0020
 #define OD_RELAYMODE				BIT(0)
@@ -211,6 +217,35 @@ static void mtk_dither_set(struct device *dev, unsigned int bpc,
 			      DISP_DITHERING, cmdq_pkt);
 }
 
+static void mtk_dsc_config(struct device *dev, unsigned int w,
+			   unsigned int h, unsigned int vrefresh,
+			   unsigned int bpc, struct cmdq_pkt *cmdq_pkt)
+{
+	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
+
+	/* dsc bypass mode */
+	mtk_ddp_write_mask(cmdq_pkt, DSC_BYPASS, &priv->cmdq_reg, priv->regs,
+			   DISP_REG_DSC_CON, DSC_BYPASS);
+	mtk_ddp_write_mask(cmdq_pkt, DSC_UFOE_SEL, &priv->cmdq_reg, priv->regs,
+			   DISP_REG_DSC_CON, DSC_UFOE_SEL);
+	mtk_ddp_write_mask(cmdq_pkt, DSC_DUAL_INOUT, &priv->cmdq_reg, priv->regs,
+			   DISP_REG_DSC_CON, DSC_DUAL_INOUT);
+}
+
+static void mtk_dsc_start(struct device *dev)
+{
+	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
+
+	writel_relaxed(DSC_EN, &priv->regs + DISP_REG_DSC_CON);
+}
+
+static void mtk_dsc_stop(struct device *dev)
+{
+	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
+
+	writel_relaxed(0x0, priv->regs + DISP_REG_DSC_CON);
+}
+
 static void mtk_od_config(struct device *dev, unsigned int w,
 			  unsigned int h, unsigned int vrefresh,
 			  unsigned int bpc, struct cmdq_pkt *cmdq_pkt)
@@ -274,6 +309,14 @@ static const struct mtk_ddp_comp_funcs ddp_dpi = {
 	.stop = mtk_dpi_stop,
 };
 
+static const struct mtk_ddp_comp_funcs ddp_dsc = {
+	.clk_enable = mtk_ddp_clk_enable,
+	.clk_disable = mtk_ddp_clk_disable,
+	.config = mtk_dsc_config,
+	.start = mtk_dsc_start,
+	.stop = mtk_dsc_stop,
+};
+
 static const struct mtk_ddp_comp_funcs ddp_dsi = {
 	.start = mtk_dsi_ddp_start,
 	.stop = mtk_dsi_ddp_stop,
@@ -335,6 +378,7 @@ static const char * const mtk_ddp_comp_stem[MTK_DDP_COMP_TYPE_MAX] = {
 	[MTK_DISP_CCORR] = "ccorr",
 	[MTK_DISP_COLOR] = "color",
 	[MTK_DISP_DITHER] = "dither",
+	[MTK_DISP_DSC] = "dsc",
 	[MTK_DISP_GAMMA] = "gamma",
 	[MTK_DISP_MUTEX] = "mutex",
 	[MTK_DISP_OD] = "od",
@@ -364,6 +408,8 @@ static const struct mtk_ddp_comp_match mtk_ddp_matches[DDP_COMPONENT_ID_MAX] = {
 	[DDP_COMPONENT_DITHER]	= { MTK_DISP_DITHER,	0, &ddp_dither },
 	[DDP_COMPONENT_DPI0]	= { MTK_DPI,		0, &ddp_dpi },
 	[DDP_COMPONENT_DPI1]	= { MTK_DPI,		1, &ddp_dpi },
+	[DDP_COMPONENT_DSC0]	= { MTK_DISP_DSC,	0, &ddp_dsc },
+	[DDP_COMPONENT_DSC1]	= { MTK_DISP_DSC,	1, &ddp_dsc },
 	[DDP_COMPONENT_DSI0]	= { MTK_DSI,		0, &ddp_dsi },
 	[DDP_COMPONENT_DSI1]	= { MTK_DSI,		1, &ddp_dsi },
 	[DDP_COMPONENT_DSI2]	= { MTK_DSI,		2, &ddp_dsi },
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
index d317b944df66..560be6bc9d0e 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
@@ -23,6 +23,7 @@ enum mtk_ddp_comp_type {
 	MTK_DISP_CCORR,
 	MTK_DISP_COLOR,
 	MTK_DISP_DITHER,
+	MTK_DISP_DSC,
 	MTK_DISP_GAMMA,
 	MTK_DISP_MUTEX,
 	MTK_DISP_OD,
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
