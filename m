Return-Path: <SRS0=EFw0=NG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E7A6C432BE
	for <linux-mediatek@archiver.kernel.org>; Sun, 15 Aug 2021 15:01:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 34046611C0
	for <linux-mediatek@archiver.kernel.org>; Sun, 15 Aug 2021 15:01:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 34046611C0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Jwi1eGn2yvgQN38HHBG9Z4nPEDNp7+LVRENOiMKp38g=; b=4QTho9HAiWroRS
	K5ocnSM0Q6g1joS+C9+kfDH2in0XlGjfF3ob5GNXR5/vnGOZNNkLTajCfGgJN1ey9V4FGj4JFDzeE
	E+Do6CjYzo4nhh4CRnWYZXB7howRcadG/2/oBYHU9b3zNh/PUPzOJmf9qmvq/5gYfLtpQGPNdacrb
	AigQzdmXotVSFBi7WPJBktYnaGzAsfCP2kbBmC4IwgKi8+9dmNoy0thO2luHFBLowOHDubGae1Cme
	Jl1eM6oQBJWrprgRe+uuGz+5OjTTXKrTEu+GxKqIgFe7DexOR+vtHLIZHjNqrLsx15hVWqwpwwIXx
	X7AOhlWbhaDLZz2aqwSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFHdU-00FNwU-Uu; Sun, 15 Aug 2021 15:01:17 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFHYx-00FLVi-Nv; Sun, 15 Aug 2021 14:56:38 +0000
X-UUID: 59c5123dcf714456bf9469e404588093-20210815
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=Lai5XwfAcHPaWlL0yiTVyv8t6hOSVUiwG1qEDIQ3fPE=; 
 b=ceLc4jT3KaEkei9HZNxv4qysR0vr4/ffPpbOBzznTQr/8NrK+UkVSy/R52kKI0sKMh6lul8XFPFCNNi37KLsRym8+2EY/02I8DIPEd2BeSY65ECSudXdCx3rNtr2GsAwjykq9v5zTfrtUr/heNo3/4A94F8mkRk3PE+aTbAM0OQ=;
X-UUID: 59c5123dcf714456bf9469e404588093-20210815
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <jason-jh.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1601328322; Sun, 15 Aug 2021 07:56:19 -0700
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 15 Aug 2021 07:56:18 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 15 Aug 2021 22:56:16 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sun, 15 Aug 2021 22:56:16 +0800
From: jason-jh.lin <jason-jh.lin@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, "Philipp
 Zabel" <p.zabel@pengutronix.de>, Enric Balletbo i Serra
 <enric.balletbo@collabora.com>, <fshao@chromium.org>
CC: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, "Fabien
 Parent" <fparent@baylibre.com>, <hsinyi@chromium.org>, "jason-jh . lin"
 <jason-jh.lin@mediatek.com>, Yongqiang Niu <yongqiang.niu@mediatek.com>,
 <nancy.lin@mediatek.com>, <singo.chang@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>
Subject: [PATCH v7 07/13] soc: mediatek: add mtk-mutex support for mt8195
 vdosys0
Date: Sun, 15 Aug 2021 22:56:04 +0800
Message-ID: <20210815145610.2050-8-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210815145610.2050-1-jason-jh.lin@mediatek.com>
References: <20210815145610.2050-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210815_075635_830285_172CC999 
X-CRM114-Status: GOOD (  13.12  )
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

Add mtk-mutex support for mt8195 vdosys0.

Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
---
 drivers/soc/mediatek/mtk-mutex.c | 93 ++++++++++++++++++++++++++++++--
 1 file changed, 90 insertions(+), 3 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-mutex.c b/drivers/soc/mediatek/mtk-mutex.c
index 2e4bcc300576..cb8bbf7f3fd8 100644
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
@@ -67,6 +70,36 @@
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
+#define MT8195_MUTEX_MOD_DISP_OVL1		10
+#define MT8195_MUTEX_MOD_DISP_WDMA1		11
+#define MT8195_MUTEX_MOD_DISP_RDMA1		12
+#define MT8195_MUTEX_MOD_DISP_COLOR1		13
+#define MT8195_MUTEX_MOD_DISP_CCORR1		14
+#define MT8195_MUTEX_MOD_DISP_AAL1		15
+#define MT8195_MUTEX_MOD_DISP_GAMMA1		16
+#define MT8195_MUTEX_MOD_DISP_DITHER1		17
+#define MT8195_MUTEX_MOD_DISP_DSI1		18
+#define MT8195_MUTEX_MOD_DISP_DSC_WRAP0_CORE1	19
+#define MT8195_MUTEX_MOD_DISP_VPP_MERGE		20
+#define MT8195_MUTEX_MOD_DISP_DP_INTF0		21
+#define MT8195_MUTEX_MOD_DISP_VPP1_DL_RELAY0	22
+#define MT8195_MUTEX_MOD_DISP_VPP1_DL_RELAY1	23
+#define MT8195_MUTEX_MOD_DISP_VDO1_DL_RELAY2	24
+#define MT8195_MUTEX_MOD_DISP_VDO0_DL_RELAY3	25
+#define MT8195_MUTEX_MOD_DISP_VDO0_DL_RELAY4	26
+#define MT8195_MUTEX_MOD_DISP_PWM0		27
+#define MT8195_MUTEX_MOD_DISP_PWM1		28
+
 #define MT2712_MUTEX_MOD_DISP_PWM2		10
 #define MT2712_MUTEX_MOD_DISP_OVL0		11
 #define MT2712_MUTEX_MOD_DISP_OVL1		12
@@ -101,12 +134,27 @@
 #define MT2712_MUTEX_SOF_DSI3			6
 #define MT8167_MUTEX_SOF_DPI0			2
 #define MT8167_MUTEX_SOF_DPI1			3
+
 #define MT8183_MUTEX_SOF_DSI0			1
 #define MT8183_MUTEX_SOF_DPI0			2
 
 #define MT8183_MUTEX_EOF_DSI0			(MT8183_MUTEX_SOF_DSI0 << 6)
 #define MT8183_MUTEX_EOF_DPI0			(MT8183_MUTEX_SOF_DPI0 << 6)
 
+#define MT8195_MUTEX_SOF_DSI0			1
+#define MT8195_MUTEX_SOF_DSI1			2
+#define MT8195_MUTEX_SOF_DP_INTF0		3
+#define MT8195_MUTEX_SOF_DP_INTF1		4
+#define MT8195_MUTEX_SOF_DPI0			6 /* for HDMI_TX */
+#define MT8195_MUTEX_SOF_DPI1			5 /* for digital video out */
+
+#define MT8195_MUTEX_EOF_DSI0			(MT8195_MUTEX_SOF_DSI0 << 7)
+#define MT8195_MUTEX_EOF_DSI1			(MT8195_MUTEX_SOF_DSI1 << 7)
+#define MT8195_MUTEX_EOF_DP_INTF0		(MT8195_MUTEX_SOF_DP_INTF0 << 7)
+#define MT8195_MUTEX_EOF_DP_INTF1		(MT8195_MUTEX_SOF_DP_INTF1 << 7)
+#define MT8195_MUTEX_EOF_DPI0			(MT8195_MUTEX_SOF_DPI0 << 7)
+#define MT8195_MUTEX_EOF_DPI1			(MT8195_MUTEX_SOF_DPI1 << 7)
+
 struct mtk_mutex {
 	int id;
 	bool claimed;
@@ -120,6 +168,9 @@ enum mtk_mutex_sof_id {
 	MUTEX_SOF_DPI1,
 	MUTEX_SOF_DSI2,
 	MUTEX_SOF_DSI3,
+	MUTEX_SOF_DP_INTF0,
+	MUTEX_SOF_DP_INTF1,
+	DDP_MUTEX_SOF_MAX,
 };
 
 struct mtk_mutex_data {
@@ -214,7 +265,22 @@ static const unsigned int mt8183_mutex_mod[DDP_COMPONENT_ID_MAX] = {
 	[DDP_COMPONENT_WDMA0] = MT8183_MUTEX_MOD_DISP_WDMA0,
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
+	[DDP_COMPONENT_DITHER] = MT8195_MUTEX_MOD_DISP_DITHER0,
+	[DDP_COMPONENT_MERGE0] = MT8195_MUTEX_MOD_DISP_VPP_MERGE,
+	[DDP_COMPONENT_DSC0] = MT8195_MUTEX_MOD_DISP_DSC_WRAP0_CORE0,
+	[DDP_COMPONENT_DSI0] = MT8195_MUTEX_MOD_DISP_DSI0,
+	[DDP_COMPONENT_PWM0] = MT8195_MUTEX_MOD_DISP_PWM0,
+};
+
+static const unsigned int mt2712_mutex_sof[DDP_MUTEX_SOF_MAX] = {
 	[MUTEX_SOF_SINGLE_MODE] = MUTEX_SOF_SINGLE_MODE,
 	[MUTEX_SOF_DSI0] = MUTEX_SOF_DSI0,
 	[MUTEX_SOF_DSI1] = MUTEX_SOF_DSI1,
@@ -224,7 +290,7 @@ static const unsigned int mt2712_mutex_sof[MUTEX_SOF_DSI3 + 1] = {
 	[MUTEX_SOF_DSI3] = MUTEX_SOF_DSI3,
 };
 
-static const unsigned int mt8167_mutex_sof[MUTEX_SOF_DSI3 + 1] = {
+static const unsigned int mt8167_mutex_sof[DDP_MUTEX_SOF_MAX] = {
 	[MUTEX_SOF_SINGLE_MODE] = MUTEX_SOF_SINGLE_MODE,
 	[MUTEX_SOF_DSI0] = MUTEX_SOF_DSI0,
 	[MUTEX_SOF_DPI0] = MT8167_MUTEX_SOF_DPI0,
@@ -232,12 +298,24 @@ static const unsigned int mt8167_mutex_sof[MUTEX_SOF_DSI3 + 1] = {
 };
 
 /* Add EOF setting so overlay hardware can receive frame done irq */
-static const unsigned int mt8183_mutex_sof[MUTEX_SOF_DSI3 + 1] = {
+static const unsigned int mt8183_mutex_sof[DDP_MUTEX_SOF_MAX] = {
 	[MUTEX_SOF_SINGLE_MODE] = MUTEX_SOF_SINGLE_MODE,
 	[MUTEX_SOF_DSI0] = MUTEX_SOF_DSI0 | MT8183_MUTEX_EOF_DSI0,
 	[MUTEX_SOF_DPI0] = MT8183_MUTEX_SOF_DPI0 | MT8183_MUTEX_EOF_DPI0,
 };
 
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
@@ -275,6 +353,13 @@ static const struct mtk_mutex_data mt8183_mutex_driver_data = {
 	.no_clk = true,
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
@@ -507,6 +592,8 @@ static const struct of_device_id mutex_driver_dt_match[] = {
 	  .data = &mt8173_mutex_driver_data},
 	{ .compatible = "mediatek,mt8183-disp-mutex",
 	  .data = &mt8183_mutex_driver_data},
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
