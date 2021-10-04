Return-Path: <SRS0=jwT2=OY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB1BFC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Oct 2021 06:23:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6F8F761159
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Oct 2021 06:23:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6F8F761159
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7+2hc/7DuupDTShwk9MiGeAWE/wMWS2qA1T4nbkoQUE=; b=S3EsjxkyNhWwVG
	G1QiKMZF0UHFTDLO6fiB8NYnAdkaTU/ux27xIhp2c6gwSYKdj2JEC6LtH8g1Zb69Hg16Lsqi2u6rA
	lxG6spHFIWMujiwXblr3aA3BLx0PH6o18lI9uPqOc6Ai9wnqTJjcJzO4+SY4B+vUX0lHCB2q5pY8a
	qtVIZQOMiZT0oJ5l2wEiW/4i9RpdnregYNZK4iUQHQ2mpFj3n+t8TJ4PFAZ76oX1aEXiyUdTNJCau
	Rj7uU2Oe5OJC6/uS5FmzIKmo2xZgaMHboi5/NYEmMgqCjL5+PeIHA2x0tYNJ2y70V0RG4duX3gIyD
	8InN8iVNQLZ2SL9t6msA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mXHNj-005Gd1-MM; Mon, 04 Oct 2021 06:23:23 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mXHMJ-005FqW-Nq; Mon, 04 Oct 2021 06:21:57 +0000
X-UUID: 0be5c10579054eb88a3ac6b77c85041c-20211003
X-UUID: 0be5c10579054eb88a3ac6b77c85041c-20211003
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <nancy.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 978852268; Sun, 03 Oct 2021 23:21:47 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 3 Oct 2021 23:21:46 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Mon, 4 Oct 2021 14:21:44 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 4 Oct 2021 14:21:43 +0800
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
Subject: [PATCH v6 07/16] soc: mediatek: add mtk-mmsys config API for mt8195
 vdosys1
Date: Mon, 4 Oct 2021 14:21:31 +0800
Message-ID: <20211004062140.29803-8-nancy.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20211004062140.29803-1-nancy.lin@mediatek.com>
References: <20211004062140.29803-1-nancy.lin@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211003_232155_814088_ADE9A785 
X-CRM114-Status: GOOD (  19.39  )
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

Add mmsys config API. The config API is used for config mmsys reg.
Some mmsys regs need to be setting according to the HW engine binding
to the mmsys simultaneously.

Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
---
 drivers/soc/mediatek/mt8195-mmsys.h    | 62 ++++++++++++++++++++++++++
 drivers/soc/mediatek/mtk-mmsys.c       | 34 ++++++++++++++
 drivers/soc/mediatek/mtk-mmsys.h       | 10 +++++
 include/linux/soc/mediatek/mtk-mmsys.h | 16 +++++++
 4 files changed, 122 insertions(+)

diff --git a/drivers/soc/mediatek/mt8195-mmsys.h b/drivers/soc/mediatek/mt8195-mmsys.h
index f19ec72c1243..648baaec112b 100644
--- a/drivers/soc/mediatek/mt8195-mmsys.h
+++ b/drivers/soc/mediatek/mt8195-mmsys.h
@@ -123,6 +123,21 @@
 #define MT8195_VDO1_MIXER_SOUT_SEL_IN				0xf68
 #define MT8195_MIXER_SOUT_SEL_IN_FROM_DISP_MIXER		(0 << 0)
 
+#define MT8195_VDO1_MERGE0_ASYNC_CFG_WD	0xe30
+#define MT8195_VDO1_MERGE1_ASYNC_CFG_WD	0xe40
+#define MT8195_VDO1_MERGE2_ASYNC_CFG_WD	0xe50
+#define MT8195_VDO1_MERGE3_ASYNC_CFG_WD	0xe60
+#define MT8195_VDO1_HDRBE_ASYNC_CFG_WD	0xe70
+#define MT8195_VDO1_HDR_TOP_CFG		0xd00
+#define MT8195_VDO1_MIXER_IN1_ALPHA	0xd30
+#define MT8195_VDO1_MIXER_IN2_ALPHA	0xd34
+#define MT8195_VDO1_MIXER_IN3_ALPHA	0xd38
+#define MT8195_VDO1_MIXER_IN4_ALPHA	0xd3c
+#define MT8195_VDO1_MIXER_IN1_PAD	0xd40
+#define MT8195_VDO1_MIXER_IN2_PAD	0xd44
+#define MT8195_VDO1_MIXER_IN3_PAD	0xd48
+#define MT8195_VDO1_MIXER_IN4_PAD	0xd4c
+
 static const struct mtk_mmsys_routes mmsys_mt8195_routing_table[] = {
 	{
 		DDP_COMPONENT_OVL0, DDP_COMPONENT_RDMA0,
@@ -247,4 +262,51 @@ static const struct mtk_mmsys_routes mmsys_mt8195_routing_table[] = {
 	}
 };
 
+/*
+ * mtk_mmsys_config table is used for config mmsys reg in runtime.
+ * MMSYS_CONFIG_MERGE_ASYNC_WIDTH: config merge async width
+ * MMSYS_CONFIG_MERGE_ASYNC_HEIGHT: config merge async height
+ * MMSYS_CONFIG_HDR_BE_ASYNC_WIDTH: config hdr_be async width
+ * MMSYS_CONFIG_HDR_BE_ASYNC_HEIGHT: config hdr_be async height
+ * MMSYS_CONFIG_MIXER_IN_ALPHA_ODD: config mixer odd channel 9bit alpha value
+ * MMSYS_CONFIG_MIXER_IN_ALPHA_EVEN: config mixer even channel 9bit alpha value
+ * MMSYS_CONFIG_MIXER_IN_CH_SWAP: config mixer input RGB channel swap
+ * MMSYS_CONFIG_HDR_ALPHA_SEL: config alpha source
+ * MMSYS_CONFIG_MIXER_IN_MODE: config mixer pad mode(bypass/even extend mode)
+ * MMSYS_CONFIG_MIXER_IN_BIWIDTH: config mixer pad width. formula: width / 2 - 1
+ */
+static const struct mtk_mmsys_config mmsys_mt8195_config_table[] = {
+	{ MMSYS_CONFIG_MERGE_ASYNC_WIDTH, 0, MT8195_VDO1_MERGE0_ASYNC_CFG_WD, GENMASK(13, 0), 0},
+	{ MMSYS_CONFIG_MERGE_ASYNC_HEIGHT, 0, MT8195_VDO1_MERGE0_ASYNC_CFG_WD, GENMASK(29, 16), 16},
+	{ MMSYS_CONFIG_MERGE_ASYNC_WIDTH, 1, MT8195_VDO1_MERGE1_ASYNC_CFG_WD, GENMASK(13, 0), 0},
+	{ MMSYS_CONFIG_MERGE_ASYNC_HEIGHT, 1, MT8195_VDO1_MERGE1_ASYNC_CFG_WD, GENMASK(29, 16), 16},
+	{ MMSYS_CONFIG_MERGE_ASYNC_WIDTH, 2, MT8195_VDO1_MERGE2_ASYNC_CFG_WD, GENMASK(13, 0), 0},
+	{ MMSYS_CONFIG_MERGE_ASYNC_HEIGHT, 2, MT8195_VDO1_MERGE2_ASYNC_CFG_WD, GENMASK(29, 16), 16},
+	{ MMSYS_CONFIG_MERGE_ASYNC_WIDTH, 3, MT8195_VDO1_MERGE3_ASYNC_CFG_WD, GENMASK(13, 0), 0},
+	{ MMSYS_CONFIG_MERGE_ASYNC_HEIGHT, 3, MT8195_VDO1_MERGE3_ASYNC_CFG_WD, GENMASK(29, 16), 16},
+	{ MMSYS_CONFIG_HDR_BE_ASYNC_WIDTH, 0, MT8195_VDO1_HDRBE_ASYNC_CFG_WD, GENMASK(13, 0), 0},
+	{ MMSYS_CONFIG_HDR_BE_ASYNC_HEIGHT, 0, MT8195_VDO1_HDRBE_ASYNC_CFG_WD, GENMASK(29, 16), 16},
+	{ MMSYS_CONFIG_MIXER_IN_ALPHA_ODD, 1, MT8195_VDO1_MIXER_IN1_ALPHA, GENMASK(8, 0), 0},
+	{ MMSYS_CONFIG_MIXER_IN_ALPHA_EVEN, 1, MT8195_VDO1_MIXER_IN1_ALPHA, GENMASK(24, 16), 16},
+	{ MMSYS_CONFIG_MIXER_IN_ALPHA_ODD, 2, MT8195_VDO1_MIXER_IN2_ALPHA, GENMASK(8, 0), 0},
+	{ MMSYS_CONFIG_MIXER_IN_ALPHA_EVEN, 2, MT8195_VDO1_MIXER_IN2_ALPHA, GENMASK(24, 16), 16},
+	{ MMSYS_CONFIG_MIXER_IN_ALPHA_ODD, 3, MT8195_VDO1_MIXER_IN3_ALPHA, GENMASK(8, 0), 0},
+	{ MMSYS_CONFIG_MIXER_IN_ALPHA_EVEN, 3, MT8195_VDO1_MIXER_IN3_ALPHA, GENMASK(24, 16), 16},
+	{ MMSYS_CONFIG_MIXER_IN_ALPHA_ODD, 4, MT8195_VDO1_MIXER_IN4_ALPHA, GENMASK(8, 0), 0},
+	{ MMSYS_CONFIG_MIXER_IN_ALPHA_EVEN, 4, MT8195_VDO1_MIXER_IN4_ALPHA, GENMASK(24, 16), 16},
+	{ MMSYS_CONFIG_MIXER_IN_CH_SWAP, 4, MT8195_VDO1_MIXER_IN4_PAD, GENMASK(4, 4), 4},
+	{ MMSYS_CONFIG_HDR_ALPHA_SEL, 1, MT8195_VDO1_HDR_TOP_CFG, GENMASK(20, 20), 20},
+	{ MMSYS_CONFIG_HDR_ALPHA_SEL, 2, MT8195_VDO1_HDR_TOP_CFG, GENMASK(21, 21), 21},
+	{ MMSYS_CONFIG_HDR_ALPHA_SEL, 3, MT8195_VDO1_HDR_TOP_CFG, GENMASK(22, 22), 22},
+	{ MMSYS_CONFIG_HDR_ALPHA_SEL, 4, MT8195_VDO1_HDR_TOP_CFG, GENMASK(23, 23), 23},
+	{ MMSYS_CONFIG_MIXER_IN_MODE, 1, MT8195_VDO1_MIXER_IN1_PAD, GENMASK(1, 0), 0},
+	{ MMSYS_CONFIG_MIXER_IN_MODE, 2, MT8195_VDO1_MIXER_IN2_PAD, GENMASK(1, 0), 0},
+	{ MMSYS_CONFIG_MIXER_IN_MODE, 3, MT8195_VDO1_MIXER_IN3_PAD, GENMASK(1, 0), 0},
+	{ MMSYS_CONFIG_MIXER_IN_MODE, 4, MT8195_VDO1_MIXER_IN4_PAD, GENMASK(1, 0), 0},
+	{ MMSYS_CONFIG_MIXER_IN_BIWIDTH, 1, MT8195_VDO1_MIXER_IN1_PAD, GENMASK(31, 16), 16},
+	{ MMSYS_CONFIG_MIXER_IN_BIWIDTH, 2, MT8195_VDO1_MIXER_IN2_PAD, GENMASK(31, 16), 16},
+	{ MMSYS_CONFIG_MIXER_IN_BIWIDTH, 3, MT8195_VDO1_MIXER_IN3_PAD, GENMASK(31, 16), 16},
+	{ MMSYS_CONFIG_MIXER_IN_BIWIDTH, 4, MT8195_VDO1_MIXER_IN4_PAD, GENMASK(31, 16), 16},
+};
+
 #endif /* __SOC_MEDIATEK_MT8195_MMSYS_H */
diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
index 4da11b2911a5..f9f18ee81efb 100644
--- a/drivers/soc/mediatek/mtk-mmsys.c
+++ b/drivers/soc/mediatek/mtk-mmsys.c
@@ -73,6 +73,8 @@ static const struct mtk_mmsys_driver_data mt8195_vdosys1_driver_data = {
 	.clk_driver = "clk-mt8195-vdo1",
 	.routes = mmsys_mt8195_routing_table,
 	.num_routes = ARRAY_SIZE(mmsys_mt8195_routing_table),
+	.config = mmsys_mt8195_config_table,
+	.num_configs = ARRAY_SIZE(mmsys_mt8195_config_table),
 };
 
 static const struct mtk_mmsys_driver_data mt8365_mmsys_driver_data = {
@@ -178,6 +180,38 @@ static const struct reset_control_ops mtk_mmsys_reset_ops = {
 	.reset = mtk_mmsys_reset,
 };
 
+void mtk_mmsys_ddp_config(struct device *dev, enum mtk_mmsys_config_type config,
+			  u32 id, u32 val)
+{
+	struct mtk_mmsys *mmsys = dev_get_drvdata(dev);
+	const struct mtk_mmsys_config *mmsys_config = mmsys->data->config;
+	u32 reg_val;
+	u32 mask;
+	u32 offset;
+	int i;
+	u32 tmp;
+
+	if (!mmsys->data->num_configs)
+		return;
+
+	for (i = 0; i < mmsys->data->num_configs; i++)
+		if (config == mmsys_config[i].config && id == mmsys_config[i].id)
+			break;
+
+	if (i == mmsys->data->num_configs)
+		return;
+
+	offset = mmsys_config[i].addr;
+	mask = mmsys_config[i].mask;
+	reg_val = val << mmsys_config[i].shift;
+
+	tmp = readl(mmsys->regs + offset);
+
+	tmp = (tmp & ~mask) | reg_val;
+	writel(tmp, mmsys->regs + offset);
+}
+EXPORT_SYMBOL_GPL(mtk_mmsys_ddp_config);
+
 static int mtk_mmsys_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
diff --git a/drivers/soc/mediatek/mtk-mmsys.h b/drivers/soc/mediatek/mtk-mmsys.h
index 8b0ed05117ea..2694021435d2 100644
--- a/drivers/soc/mediatek/mtk-mmsys.h
+++ b/drivers/soc/mediatek/mtk-mmsys.h
@@ -88,10 +88,20 @@ struct mtk_mmsys_routes {
 	u32 val;
 };
 
+struct mtk_mmsys_config {
+	enum mtk_mmsys_config_type config;
+	u32 id;
+	u32 addr;
+	u32 mask;
+	u32 shift;
+};
+
 struct mtk_mmsys_driver_data {
 	const char *clk_driver;
 	const struct mtk_mmsys_routes *routes;
 	const unsigned int num_routes;
+	const struct mtk_mmsys_config *config;
+	const unsigned int num_configs;
 };
 
 /*
diff --git a/include/linux/soc/mediatek/mtk-mmsys.h b/include/linux/soc/mediatek/mtk-mmsys.h
index eaf7f7345519..b2d2310d7e7a 100644
--- a/include/linux/soc/mediatek/mtk-mmsys.h
+++ b/include/linux/soc/mediatek/mtk-mmsys.h
@@ -56,6 +56,19 @@ enum mtk_ddp_comp_id {
 	DDP_COMPONENT_ID_MAX,
 };
 
+enum mtk_mmsys_config_type {
+	MMSYS_CONFIG_MERGE_ASYNC_WIDTH,
+	MMSYS_CONFIG_MERGE_ASYNC_HEIGHT,
+	MMSYS_CONFIG_HDR_BE_ASYNC_WIDTH,
+	MMSYS_CONFIG_HDR_BE_ASYNC_HEIGHT,
+	MMSYS_CONFIG_HDR_ALPHA_SEL,
+	MMSYS_CONFIG_MIXER_IN_ALPHA_ODD,
+	MMSYS_CONFIG_MIXER_IN_ALPHA_EVEN,
+	MMSYS_CONFIG_MIXER_IN_CH_SWAP,
+	MMSYS_CONFIG_MIXER_IN_MODE,
+	MMSYS_CONFIG_MIXER_IN_BIWIDTH,
+};
+
 void mtk_mmsys_ddp_connect(struct device *dev,
 			   enum mtk_ddp_comp_id cur,
 			   enum mtk_ddp_comp_id next);
@@ -64,4 +77,7 @@ void mtk_mmsys_ddp_disconnect(struct device *dev,
 			      enum mtk_ddp_comp_id cur,
 			      enum mtk_ddp_comp_id next);
 
+void mtk_mmsys_ddp_config(struct device *dev, enum mtk_mmsys_config_type config,
+			  u32 id, u32 val);
+
 #endif /* __MTK_MMSYS_H */
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
