Return-Path: <SRS0=pvhC=NQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B337AC4338F
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Aug 2021 10:32:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6FA1761037
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Aug 2021 10:32:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6FA1761037
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e4pXtMzy4ghoPjq2p0Ly+Zn1iK+WbAcTdCsU6Xpml0A=; b=c/T8j1GP2rxrXj
	VyuQF1P//XLXhaazdYNveiXYroSPfBBZF+mO8iA3j/XKpoSPTOFitb3HiwktQEp0txdQ/2uVzoWaw
	PHTZNtvTusznIO/aTzdHs3kkRN4ofSd1SR687/LUIwEMPONT+xVc0JcSZhrlOPqMP8xxHrW5tV7vj
	44OnRpz6r6ijwkaJkSgR1HPGJGaC8P91jJ8P+rfxkwgyGPJtbLBT8mjcloK+luYtS9cPMbDfvfWuY
	aTP1tPYAwNuhQLHCWYhK3lvqaXFedErsy8EAXX3t7ax4qXnOCBAOPD4OcZS4TVDz2B5z1RWQYnBhM
	MDep+4eYB7Vg/o+m8k3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mIqCa-006WHL-V8; Wed, 25 Aug 2021 10:32:13 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mIpwc-006OPg-Tl; Wed, 25 Aug 2021 10:15:46 +0000
X-UUID: 0f04a05540d04db081aad374a4728306-20210825
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=KwIJK87rJFC9q78elwvMlcrkqzGo5AgWaLBRXRyLjKU=; 
 b=DDywCqC9pRkpjP32Zt4IRaYa3Nbsrudgr6l3idEdH47eiOxJX/TEgZVi6mxD9IfOlUxuKuIQtl+ETTD2Xt0b+eFM/7lpLF5NzlCXR3GDqepESGjqG1/AvS7jLBE2WTLC8lpwjyF10u1bm96NrbypFzUXrg6W/OJ/yTpeBoHkttc=;
X-UUID: 0f04a05540d04db081aad374a4728306-20210825
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <nancy.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 311989030; Wed, 25 Aug 2021 03:15:37 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 25 Aug 2021 03:05:35 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 25 Aug 2021 18:05:34 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 25 Aug 2021 18:05:34 +0800
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
Subject: [PATCH v4 08/17] soc: mediatek: add mtk-mmsys config API for mt8195
 vdosys1
Date: Wed, 25 Aug 2021 18:05:22 +0800
Message-ID: <20210825100531.5653-9-nancy.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210825100531.5653-1-nancy.lin@mediatek.com>
References: <20210825100531.5653-1-nancy.lin@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210825_031543_091417_F309ACA3 
X-CRM114-Status: GOOD (  19.98  )
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
 drivers/soc/mediatek/mtk-mmsys.c       | 33 ++++++++++++++
 drivers/soc/mediatek/mtk-mmsys.h       | 10 +++++
 include/linux/soc/mediatek/mtk-mmsys.h | 16 +++++++
 4 files changed, 121 insertions(+)

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
index 7365731c9fd7..cd59a4157731 100644
--- a/drivers/soc/mediatek/mtk-mmsys.c
+++ b/drivers/soc/mediatek/mtk-mmsys.c
@@ -70,6 +70,8 @@ static const struct mtk_mmsys_driver_data mt8195_vdosys1_driver_data = {
 	.clk_driver = "clk-mt8195-vdo1",
 	.routes = mmsys_mt8195_routing_table,
 	.num_routes = ARRAY_SIZE(mmsys_mt8195_routing_table),
+	.config = mmsys_mt8195_config_table,
+	.num_configs = ARRAY_SIZE(mmsys_mt8195_config_table),
 };
 
 struct mtk_mmsys {
@@ -114,6 +116,37 @@ void mtk_mmsys_ddp_disconnect(struct device *dev,
 }
 EXPORT_SYMBOL_GPL(mtk_mmsys_ddp_disconnect);
 
+void mtk_mmsys_ddp_config(struct device *dev, enum mtk_mmsys_config_type config,
+			  u32 id, u32 val)
+{
+	struct mtk_mmsys *mmsys = dev_get_drvdata(dev);
+	const struct mtk_mmsys_config *mmsys_config = mmsys->data->config;
+	u32 reg_val;
+	u32 mask;
+	u32 offset;
+	int i;
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
+	u32 tmp = readl(mmsys->regs + offset);
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
index 5f3e2bf0c40b..825857d8d7f4 100644
--- a/drivers/soc/mediatek/mtk-mmsys.h
+++ b/drivers/soc/mediatek/mtk-mmsys.h
@@ -86,10 +86,20 @@ struct mtk_mmsys_routes {
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
index 619392221a52..ef2a6d9a834b 100644
--- a/include/linux/soc/mediatek/mtk-mmsys.h
+++ b/include/linux/soc/mediatek/mtk-mmsys.h
@@ -53,6 +53,19 @@ enum mtk_ddp_comp_id {
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
@@ -61,4 +74,7 @@ void mtk_mmsys_ddp_disconnect(struct device *dev,
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
