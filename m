Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 046BCC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Apr 2022 03:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5JLSJwB5Upz4piIrcU3pm1XfGo06DQPrMSy2Q+1Npb4=; b=aBjaIBXElA4bIS
	Df+Q3QNgfit2uVHDMV3fZLbscS6oiSiHyNUAMFX1ZyNMlTOB35S3RQWq6xTYu/zlmdbODbrG5Cck7
	RBBply9XZO9rBI1lsttG6Dp1pa6N9iNIJsX1sj5yWzle+pHbIc9EuZVl8QFVMIwQMDTRFzSoyEh/8
	aSgzIn9GOxIkIAu5KfBpE9hr1c4vUxi+F4vCy0DsvPRLyr4rgmPybLyRYnn7p3le6FnnRz8Bdi+/0
	NqRmOCbhpzek/Qo/d7AZ4d45x2hdxRwlfWSuEs82vgHZNJ7lgVrbobFhTy+zlz0gNb/W9Vg2EJBCQ
	Xcwu5uM0k4tWoTyNQU8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncIaH-0090co-65; Thu, 07 Apr 2022 03:13:21 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncIaD-0090bA-C9; Thu, 07 Apr 2022 03:13:19 +0000
X-UUID: 5d08eda1f99f44c897e52d3106496791-20220406
X-UUID: 5d08eda1f99f44c897e52d3106496791-20220406
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <jason-jh.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2133156779; Wed, 06 Apr 2022 20:13:13 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 6 Apr 2022 20:04:13 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Thu, 7 Apr 2022 11:04:11 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 7 Apr 2022 11:04:10 +0800
From: jason-jh.lin <jason-jh.lin@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [RESEND v17 4/7] soc: mediatek: add mtk-mutex support for mt8195
 vdosys0
Date: Thu, 7 Apr 2022 11:04:06 +0800
Message-ID: <20220407030409.9664-5-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220407030409.9664-1-jason-jh.lin@mediatek.com>
References: <20220407030409.9664-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220406_201317_486461_01BDBA39 
X-CRM114-Status: GOOD (  15.64  )
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
Cc: David Airlie <airlied@linux.ie>, singo.chang@mediatek.com,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, postmaster@vger.kernel.org,
 Fabien Parent <fparent@baylibre.com>, John
 'Warthog9' Hawley <warthog9@eaglescrag.net>,
 linux-stm32@st-md-mailman.stormreply.com, roy-cw.yeh@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com, CK
 Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 devicetree@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
 nancy.lin@mediatek.com, linux-mediatek@lists.infradead.org,
 hsinyi@chromium.org, linux-arm-kernel@lists.infradead.org,
 "jason-jh . lin" <jason-jh.lin@mediatek.com>, linux-kernel@vger.kernel.org,
 moudy.ho@mediatek.com, Maxime Coquelin <mcoquelin.stm32@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add mtk-mutex support for mt8195 vdosys0.

Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
Acked-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Tested-by: Fei Shao <fshao@chromium.org>
---
 drivers/soc/mediatek/mtk-mutex.c | 87 ++++++++++++++++++++++++++++++--
 1 file changed, 84 insertions(+), 3 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-mutex.c b/drivers/soc/mediatek/mtk-mutex.c
index d9790140cfa9..9184684baf1d 100644
--- a/drivers/soc/mediatek/mtk-mutex.c
+++ b/drivers/soc/mediatek/mtk-mutex.c
@@ -17,6 +17,9 @@
 #define MT8183_MUTEX0_MOD0			0x30
 #define MT8183_MUTEX0_SOF0			0x2c
 
+#define MT8195_DISP_MUTEX0_MOD0			0x30
+#define MT8195_DISP_MUTEX0_SOF			0x2c
+
 #define DISP_REG_MUTEX_EN(n)			(0x20 + 0x20 * (n))
 #define DISP_REG_MUTEX(n)			(0x24 + 0x20 * (n))
 #define DISP_REG_MUTEX_RST(n)			(0x28 + 0x20 * (n))
@@ -96,6 +99,20 @@
 #define MT8173_MUTEX_MOD_DISP_PWM1		24
 #define MT8173_MUTEX_MOD_DISP_OD		25
 
+#define MT8195_MUTEX_MOD_DISP_OVL0		0
+#define MT8195_MUTEX_MOD_DISP_WDMA0		1
+#define MT8195_MUTEX_MOD_DISP_RDMA0		2
+#define MT8195_MUTEX_MOD_DISP_COLOR0		3
+#define MT8195_MUTEX_MOD_DISP_CCORR0		4
+#define MT8195_MUTEX_MOD_DISP_AAL0		5
+#define MT8195_MUTEX_MOD_DISP_GAMMA0		6
+#define MT8195_MUTEX_MOD_DISP_DITHER0		7
+#define MT8195_MUTEX_MOD_DISP_DSI0		8
+#define MT8195_MUTEX_MOD_DISP_DSC_WRAP0_CORE0	9
+#define MT8195_MUTEX_MOD_DISP_VPP_MERGE		20
+#define MT8195_MUTEX_MOD_DISP_DP_INTF0		21
+#define MT8195_MUTEX_MOD_DISP_PWM0		27
+
 #define MT2712_MUTEX_MOD_DISP_PWM2		10
 #define MT2712_MUTEX_MOD_DISP_OVL0		11
 #define MT2712_MUTEX_MOD_DISP_OVL1		12
@@ -132,9 +149,21 @@
 #define MT8167_MUTEX_SOF_DPI1			3
 #define MT8183_MUTEX_SOF_DSI0			1
 #define MT8183_MUTEX_SOF_DPI0			2
+#define MT8195_MUTEX_SOF_DSI0			1
+#define MT8195_MUTEX_SOF_DSI1			2
+#define MT8195_MUTEX_SOF_DP_INTF0		3
+#define MT8195_MUTEX_SOF_DP_INTF1		4
+#define MT8195_MUTEX_SOF_DPI0			6 /* for HDMI_TX */
+#define MT8195_MUTEX_SOF_DPI1			5 /* for digital video out */
 
 #define MT8183_MUTEX_EOF_DSI0			(MT8183_MUTEX_SOF_DSI0 << 6)
 #define MT8183_MUTEX_EOF_DPI0			(MT8183_MUTEX_SOF_DPI0 << 6)
+#define MT8195_MUTEX_EOF_DSI0			(MT8195_MUTEX_SOF_DSI0 << 7)
+#define MT8195_MUTEX_EOF_DSI1			(MT8195_MUTEX_SOF_DSI1 << 7)
+#define MT8195_MUTEX_EOF_DP_INTF0		(MT8195_MUTEX_SOF_DP_INTF0 << 7)
+#define MT8195_MUTEX_EOF_DP_INTF1		(MT8195_MUTEX_SOF_DP_INTF1 << 7)
+#define MT8195_MUTEX_EOF_DPI0			(MT8195_MUTEX_SOF_DPI0 << 7)
+#define MT8195_MUTEX_EOF_DPI1			(MT8195_MUTEX_SOF_DPI1 << 7)
 
 struct mtk_mutex {
 	int id;
@@ -149,6 +178,9 @@ enum mtk_mutex_sof_id {
 	MUTEX_SOF_DPI1,
 	MUTEX_SOF_DSI2,
 	MUTEX_SOF_DSI3,
+	MUTEX_SOF_DP_INTF0,
+	MUTEX_SOF_DP_INTF1,
+	DDP_MUTEX_SOF_MAX,
 };
 
 struct mtk_mutex_data {
@@ -270,7 +302,23 @@ static const unsigned int mt8192_mutex_mod[DDP_COMPONENT_ID_MAX] = {
 	[DDP_COMPONENT_RDMA4] = MT8192_MUTEX_MOD_DISP_RDMA4,
 };
 
-static const unsigned int mt2712_mutex_sof[MUTEX_SOF_DSI3 + 1] = {
+static const unsigned int mt8195_mutex_mod[DDP_COMPONENT_ID_MAX] = {
+	[DDP_COMPONENT_OVL0] = MT8195_MUTEX_MOD_DISP_OVL0,
+	[DDP_COMPONENT_WDMA0] = MT8195_MUTEX_MOD_DISP_WDMA0,
+	[DDP_COMPONENT_RDMA0] = MT8195_MUTEX_MOD_DISP_RDMA0,
+	[DDP_COMPONENT_COLOR0] = MT8195_MUTEX_MOD_DISP_COLOR0,
+	[DDP_COMPONENT_CCORR] = MT8195_MUTEX_MOD_DISP_CCORR0,
+	[DDP_COMPONENT_AAL0] = MT8195_MUTEX_MOD_DISP_AAL0,
+	[DDP_COMPONENT_GAMMA] = MT8195_MUTEX_MOD_DISP_GAMMA0,
+	[DDP_COMPONENT_DITHER0] = MT8195_MUTEX_MOD_DISP_DITHER0,
+	[DDP_COMPONENT_MERGE0] = MT8195_MUTEX_MOD_DISP_VPP_MERGE,
+	[DDP_COMPONENT_DSC0] = MT8195_MUTEX_MOD_DISP_DSC_WRAP0_CORE0,
+	[DDP_COMPONENT_DSI0] = MT8195_MUTEX_MOD_DISP_DSI0,
+	[DDP_COMPONENT_PWM0] = MT8195_MUTEX_MOD_DISP_PWM0,
+	[DDP_COMPONENT_DP_INTF0] = MT8195_MUTEX_MOD_DISP_DP_INTF0,
+};
+
+static const unsigned int mt2712_mutex_sof[DDP_MUTEX_SOF_MAX] = {
 	[MUTEX_SOF_SINGLE_MODE] = MUTEX_SOF_SINGLE_MODE,
 	[MUTEX_SOF_DSI0] = MUTEX_SOF_DSI0,
 	[MUTEX_SOF_DSI1] = MUTEX_SOF_DSI1,
@@ -280,7 +328,7 @@ static const unsigned int mt2712_mutex_sof[MUTEX_SOF_DSI3 + 1] = {
 	[MUTEX_SOF_DSI3] = MUTEX_SOF_DSI3,
 };
 
-static const unsigned int mt8167_mutex_sof[MUTEX_SOF_DSI3 + 1] = {
+static const unsigned int mt8167_mutex_sof[DDP_MUTEX_SOF_MAX] = {
 	[MUTEX_SOF_SINGLE_MODE] = MUTEX_SOF_SINGLE_MODE,
 	[MUTEX_SOF_DSI0] = MUTEX_SOF_DSI0,
 	[MUTEX_SOF_DPI0] = MT8167_MUTEX_SOF_DPI0,
@@ -288,7 +336,7 @@ static const unsigned int mt8167_mutex_sof[MUTEX_SOF_DSI3 + 1] = {
 };
 
 /* Add EOF setting so overlay hardware can receive frame done irq */
-static const unsigned int mt8183_mutex_sof[MUTEX_SOF_DSI3 + 1] = {
+static const unsigned int mt8183_mutex_sof[DDP_MUTEX_SOF_MAX] = {
 	[MUTEX_SOF_SINGLE_MODE] = MUTEX_SOF_SINGLE_MODE,
 	[MUTEX_SOF_DSI0] = MUTEX_SOF_DSI0 | MT8183_MUTEX_EOF_DSI0,
 	[MUTEX_SOF_DPI0] = MT8183_MUTEX_SOF_DPI0 | MT8183_MUTEX_EOF_DPI0,
@@ -300,6 +348,26 @@ static const unsigned int mt8186_mutex_sof[MUTEX_SOF_DSI3 + 1] = {
 	[MUTEX_SOF_DPI0] = MT8186_MUTEX_SOF_DPI0 | MT8186_MUTEX_EOF_DPI0,
 };
 
+/*
+ * To support refresh mode(video mode), DISP_REG_MUTEX_SOF should
+ * select the EOF source and configure the EOF plus timing from the
+ * module that provides the timing signal.
+ * So that MUTEX can not only send a STREAM_DONE event to GCE
+ * but also detect the error at end of frame(EAEOF) when EOF signal
+ * arrives.
+ */
+static const unsigned int mt8195_mutex_sof[DDP_MUTEX_SOF_MAX] = {
+	[MUTEX_SOF_SINGLE_MODE] = MUTEX_SOF_SINGLE_MODE,
+	[MUTEX_SOF_DSI0] = MT8195_MUTEX_SOF_DSI0 | MT8195_MUTEX_EOF_DSI0,
+	[MUTEX_SOF_DSI1] = MT8195_MUTEX_SOF_DSI1 | MT8195_MUTEX_EOF_DSI1,
+	[MUTEX_SOF_DPI0] = MT8195_MUTEX_SOF_DPI0 | MT8195_MUTEX_EOF_DPI0,
+	[MUTEX_SOF_DPI1] = MT8195_MUTEX_SOF_DPI1 | MT8195_MUTEX_EOF_DPI1,
+	[MUTEX_SOF_DP_INTF0] =
+		MT8195_MUTEX_SOF_DP_INTF0 | MT8195_MUTEX_EOF_DP_INTF0,
+	[MUTEX_SOF_DP_INTF1] =
+		MT8195_MUTEX_SOF_DP_INTF1 | MT8195_MUTEX_EOF_DP_INTF1,
+};
+
 static const struct mtk_mutex_data mt2701_mutex_driver_data = {
 	.mutex_mod = mt2701_mutex_mod,
 	.mutex_sof = mt2712_mutex_sof,
@@ -351,6 +419,13 @@ static const struct mtk_mutex_data mt8192_mutex_driver_data = {
 	.mutex_sof_reg = MT8183_MUTEX0_SOF0,
 };
 
+static const struct mtk_mutex_data mt8195_mutex_driver_data = {
+	.mutex_mod = mt8195_mutex_mod,
+	.mutex_sof = mt8195_mutex_sof,
+	.mutex_mod_reg = MT8195_DISP_MUTEX0_MOD0,
+	.mutex_sof_reg = MT8195_DISP_MUTEX0_SOF,
+};
+
 struct mtk_mutex *mtk_mutex_get(struct device *dev)
 {
 	struct mtk_mutex_ctx *mtx = dev_get_drvdata(dev);
@@ -423,6 +498,9 @@ void mtk_mutex_add_comp(struct mtk_mutex *mutex,
 	case DDP_COMPONENT_DPI1:
 		sof_id = MUTEX_SOF_DPI1;
 		break;
+	case DDP_COMPONENT_DP_INTF0:
+		sof_id = MUTEX_SOF_DP_INTF0;
+		break;
 	default:
 		if (mtx->data->mutex_mod[id] < 32) {
 			offset = DISP_REG_MUTEX_MOD(mtx->data->mutex_mod_reg,
@@ -462,6 +540,7 @@ void mtk_mutex_remove_comp(struct mtk_mutex *mutex,
 	case DDP_COMPONENT_DSI3:
 	case DDP_COMPONENT_DPI0:
 	case DDP_COMPONENT_DPI1:
+	case DDP_COMPONENT_DP_INTF0:
 		writel_relaxed(MUTEX_SOF_SINGLE_MODE,
 			       mtx->regs +
 			       DISP_REG_MUTEX_SOF(mtx->data->mutex_sof_reg,
@@ -587,6 +666,8 @@ static const struct of_device_id mutex_driver_dt_match[] = {
 	  .data = &mt8186_mutex_driver_data},
 	{ .compatible = "mediatek,mt8192-disp-mutex",
 	  .data = &mt8192_mutex_driver_data},
+	{ .compatible = "mediatek,mt8195-disp-mutex",
+	  .data = &mt8195_mutex_driver_data},
 	{},
 };
 MODULE_DEVICE_TABLE(of, mutex_driver_dt_match);
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
