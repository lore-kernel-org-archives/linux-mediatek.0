Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A546C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 May 2022 10:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LXnjunXdgYxID/iD06wM54QYlDwufH7VRTRDOEtMKAM=; b=MtHTD9x5UxNjRz
	gNhhnoVwg+wEItAY0OjlhXQjsTqYT9Ll+YlkZ/w83U1wL833ANNgMEYxppefExZn3+jsRSNBnmOBT
	vjWBndhm8UP1QeFf2WKIMN1GBBRQ4pN9t6HRgsNdwqpfNS7HDOLK58+O3w9ZxKKtRYri7XA8vQN6K
	+F+t9wRo8eEOE86KIMeQkWpTWafaeL7+W6Hl4JZIrb6oH3v7vGNLbeK9IhUJYDKVbqIdpbzCp9JmQ
	vOGnPBNsJhsoIcj7HqF+268GxSq6HYak3RIMrb2rd8h/a865S9w96Mx1PLO2H54CbpVitjxXvsqEn
	Z6nSYbVnIFuBJWO0muDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nuAmc-00EPaU-Hd; Thu, 26 May 2022 10:31:58 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nuAmH-00EPTi-Ai; Thu, 26 May 2022 10:31:38 +0000
X-UUID: 5717d40fa4c0446eab8eea279ac9bcf9-20220526
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5,REQID:07f800b3-98f4-4fe0-a508-ce4c83d2b029,OB:0,LO
	B:0,IP:0,URL:5,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
	ION:release,TS:0
X-CID-META: VersionHash:2a19b09,CLOUDID:0dca58b8-3c45-407b-8f66-25095432a27a,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:0,BEC:nil
X-UUID: 5717d40fa4c0446eab8eea279ac9bcf9-20220526
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 2014047757; Thu, 26 May 2022 03:31:30 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 26 May 2022 03:21:28 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Thu, 26 May 2022 18:21:27 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Thu, 26 May 2022 18:21:27 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Chun-Kuang Hu
	<chunkuang.hu@kernel.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: CK Hu <ck.hu@mediatek.com>, Rex-BC Chen <rex-bc.chen@mediatek.com>, "Nancy
 Lin" <nancy.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, jason-jh.lin
	<jason-jh.lin@mediatek.com>
Subject: [PATCH v22 1/5] drm/mediatek: add DSC support for mediatek-drm
Date: Thu, 26 May 2022 18:21:22 +0800
Message-ID: <20220526102126.19756-2-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220526102126.19756-1-jason-jh.lin@mediatek.com>
References: <20220526102126.19756-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220526_033137_399512_D7E654CA 
X-CRM114-Status: GOOD (  14.08  )
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

From: "jason-jh.lin" <jason-jh.lin@mediatek.com>

DSC is designed for real-time systems with real-time compression,
transmission, decompression and display.
The DSC standard is a specification of the algorithms used for
compressing and decompressing image display streams, including
the specification of the syntax and semantics of the compressed
video bit stream.

Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Acked-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 47 +++++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |  1 +
 2 files changed, 48 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
index 5d7504a72b11..2af1641a49f2 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
@@ -40,6 +40,12 @@
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
@@ -181,6 +187,36 @@ static void mtk_dither_set(struct device *dev, unsigned int bpc,
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
+	/* write with mask to reserve the value set in mtk_dsc_config */
+	mtk_ddp_write_mask(NULL, DSC_EN, &priv->cmdq_reg, priv->regs, DISP_REG_DSC_CON, DSC_EN);
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
@@ -270,6 +306,14 @@ static const struct mtk_ddp_comp_funcs ddp_dpi = {
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
@@ -343,6 +387,7 @@ static const char * const mtk_ddp_comp_stem[MTK_DDP_COMP_TYPE_MAX] = {
 	[MTK_DISP_CCORR] = "ccorr",
 	[MTK_DISP_COLOR] = "color",
 	[MTK_DISP_DITHER] = "dither",
+	[MTK_DISP_DSC] = "dsc",
 	[MTK_DISP_GAMMA] = "gamma",
 	[MTK_DISP_MUTEX] = "mutex",
 	[MTK_DISP_OD] = "od",
@@ -373,6 +418,8 @@ static const struct mtk_ddp_comp_match mtk_ddp_matches[DDP_COMPONENT_ID_MAX] = {
 	[DDP_COMPONENT_DITHER]		= { MTK_DISP_DITHER,	0, &ddp_dither },
 	[DDP_COMPONENT_DPI0]		= { MTK_DPI,		0, &ddp_dpi },
 	[DDP_COMPONENT_DPI1]		= { MTK_DPI,		1, &ddp_dpi },
+	[DDP_COMPONENT_DSC0]		= { MTK_DISP_DSC,	0, &ddp_dsc },
+	[DDP_COMPONENT_DSC1]		= { MTK_DISP_DSC,	1, &ddp_dsc },
 	[DDP_COMPONENT_DSI0]		= { MTK_DSI,		0, &ddp_dsi },
 	[DDP_COMPONENT_DSI1]		= { MTK_DSI,		1, &ddp_dsi },
 	[DDP_COMPONENT_DSI2]		= { MTK_DSI,		2, &ddp_dsi },
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
index 1cbc6332282d..238776bd3b72 100644
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
