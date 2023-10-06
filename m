Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 825F9E92FF7
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Oct 2023 07:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fB7sc1MNvWs54Qm48DYRR18EDwvOkwPPYFuVVwGEI8U=; b=SqXaen25dCVOoWv8fW49wls0M9
	TiBu8hJPrXzddnejOBtIZVyCKokl/7LCVBqaRu9LB0rRsLO7fu8HespckxAEwqjPYiaScA9UBE6Do
	wuphTIL9NGzQFe8WT6WrnDjfNAOV+6IfxJC44recIg2dDX8AW2IeTCC2+ykRQ6jcYynY/4hwwfZij
	9OWiLnKMfcuo0dMAy9g2pkem2ZVbli5UM6FRZV613a/zNMG5cZNb6zrD9q+SpIEkmFCqL0FEV0Y9g
	mqeO3b0XToKRY9WiGLjR3T4XBHOGHfF00jS2xmbwscEfr2GDKbE7Xr7yBKanV9XtIefjlxK80R/8m
	raMGQs6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qofQa-005AWi-01;
	Fri, 06 Oct 2023 07:39:16 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qofQU-005APZ-1F;
	Fri, 06 Oct 2023 07:39:14 +0000
X-UUID: 6e8a9bce641b11ee9b7791016c24628a-20231006
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=fB7sc1MNvWs54Qm48DYRR18EDwvOkwPPYFuVVwGEI8U=;
	b=rEAAWu1XGjLpYEWyY82EJeWWYS7/hgbazkuuROI+/NDXti+sQS4n6mp++HMsV3fh5XvvNicpSYUiT8EFY3mlLHPA5GNC9Qx1USfgJvyLkBRir1f+BoN4E8fICu+IcwtFNMJJvTM2Af+uzC1EfIbmKoRs/pRKs9DUHUHxypbw6qE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32,REQID:94f7c7af-5c29-43ef-aa75-420202f46dee,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:5f78ec9,CLOUDID:0aafc014-4929-4845-9571-38c601e9c3c9,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 6e8a9bce641b11ee9b7791016c24628a-20231006
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <shawn.sung@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 983169537; Fri, 06 Oct 2023 00:39:07 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 6 Oct 2023 15:38:34 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 6 Oct 2023 15:38:34 +0800
From: Hsiao Chien Sung <shawn.sung@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, CK
 Hu <ck.hu@mediatek.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>
CC: Conor Dooley <conor+dt@kernel.org>, Philipp Zabel
	<p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, Daniel Vetter
	<daniel@ffwll.ch>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, Mauro Carvalho
 Chehab <mchehab@kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
	<linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	Singo Chang <singo.chang@mediatek.com>, "Nancy . Lin"
	<nancy.lin@mediatek.com>, "Jason-JH . Lin" <jason-jh.lin@mediatek.com>, Hsiao
 Chien Sung <shawn.sung@mediatek.com>
Subject: [PATCH v7 07/23] soc: mediatek: Support MT8188 VDOSYS1 in mtk-mmsys
Date: Fri, 6 Oct 2023 15:38:15 +0800
Message-ID: <20231006073831.10402-8-shawn.sung@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20231006073831.10402-1-shawn.sung@mediatek.com>
References: <20231006073831.10402-1-shawn.sung@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231006_003910_451337_DEA0A376 
X-CRM114-Status: GOOD (  20.68  )
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

- Add register definitions for MT8188
- Add VDOSYS1 routing table
- Update MUTEX definitions accordingly
- Set VSYNC length from 0x40 (default) to 1 since ETHDR is bypassed

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
---
 drivers/soc/mediatek/mt8188-mmsys.h | 126 ++++++++++++++++++++++++++++
 drivers/soc/mediatek/mtk-mmsys.c    |  13 +++
 drivers/soc/mediatek/mtk-mmsys.h    |  29 +++++++
 drivers/soc/mediatek/mtk-mutex.c    |  35 ++++++++
 4 files changed, 203 insertions(+)

diff --git a/drivers/soc/mediatek/mt8188-mmsys.h b/drivers/soc/mediatek/mt8188-mmsys.h
index 448cc3761b43..a9490c3c4256 100644
--- a/drivers/soc/mediatek/mt8188-mmsys.h
+++ b/drivers/soc/mediatek/mt8188-mmsys.h
@@ -67,6 +67,56 @@
 #define MT8188_SOUT_DSC_WRAP0_OUT_TO_VPP_MERGE		BIT(18)
 #define MT8188_SOUT_DSC_WRAP0_OUT_TO_DISP_WDMA0		BIT(19)
 
+#define MT8188_VDO1_HDR_TOP_CFG					0xd00
+#define MT8188_VDO1_MIXER_IN1_ALPHA				0xd30
+#define MT8188_VDO1_MIXER_IN1_PAD				0xd40
+#define MT8188_VDO1_MIXER_VSYNC_LEN				0xd5c
+#define MT8188_VDO1_MERGE0_ASYNC_CFG_WD				0xe30
+#define MT8188_VDO1_HDRBE_ASYNC_CFG_WD				0xe70
+#define MT8188_VDO1_VPP_MERGE0_P0_SEL_IN			0xf04
+#define MT8188_VPP_MERGE0_P0_SEL_IN_FROM_MDP_RDMA0		1
+#define MT8188_VDO1_VPP_MERGE0_P1_SEL_IN			0xf08
+#define MT8188_VPP_MERGE0_P1_SEL_IN_FROM_MDP_RDMA1		1
+#define MT8188_VDO1_DISP_DPI1_SEL_IN				0xf10
+#define MT8188_DISP_DPI1_SEL_IN_FROM_VPP_MERGE4_MOUT		0
+#define MT8188_VDO1_DISP_DP_INTF0_SEL_IN			0xf14
+#define MT8188_DISP_DP_INTF0_SEL_IN_FROM_VPP_MERGE4_MOUT	0
+#define MT8188_VDO1_MERGE4_SOUT_SEL				0xf18
+#define MT8188_MERGE4_SOUT_TO_DPI1_SEL				BIT(2)
+#define MT8188_MERGE4_SOUT_TO_DP_INTF0_SEL			BIT(3)
+#define MT8188_VDO1_MIXER_IN1_SEL_IN				0xf24
+#define MT8188_MIXER_IN1_SEL_IN_FROM_MERGE0_ASYNC_SOUT		1
+#define MT8188_VDO1_MIXER_IN2_SEL_IN				0xf28
+#define MT8188_MIXER_IN2_SEL_IN_FROM_MERGE1_ASYNC_SOUT		1
+#define MT8188_VDO1_MIXER_IN3_SEL_IN				0xf2c
+#define MT8188_MIXER_IN3_SEL_IN_FROM_MERGE2_ASYNC_SOUT		1
+#define MT8188_VDO1_MIXER_IN4_SEL_IN				0xf30
+#define MT8188_MIXER_IN4_SEL_IN_FROM_MERGE3_ASYNC_SOUT		1
+#define MT8188_VDO1_MIXER_OUT_SOUT_SEL				0xf34
+#define MT8188_MIXER_SOUT_TO_MERGE4_ASYNC_SEL			1
+#define MT8188_VDO1_VPP_MERGE1_P0_SEL_IN			0xf3c
+#define MT8188_VPP_MERGE1_P0_SEL_IN_FROM_MDP_RDMA2		1
+#define MT8188_VDO1_MERGE0_ASYNC_SOUT_SEL			0xf40
+#define MT8188_SOUT_TO_MIXER_IN1_SEL				1
+#define MT8188_VDO1_MERGE1_ASYNC_SOUT_SEL			0xf44
+#define MT8188_SOUT_TO_MIXER_IN2_SEL				1
+#define MT8188_VDO1_MERGE2_ASYNC_SOUT_SEL			0xf48
+#define MT8188_SOUT_TO_MIXER_IN3_SEL				1
+#define MT8188_VDO1_MERGE3_ASYNC_SOUT_SEL			0xf4c
+#define MT8188_SOUT_TO_MIXER_IN4_SEL				1
+#define MT8188_VDO1_MERGE4_ASYNC_SEL_IN				0xf50
+#define MT8188_MERGE4_ASYNC_SEL_IN_FROM_MIXER_OUT_SOUT		1
+#define MT8188_VDO1_MIXER_IN1_SOUT_SEL				0xf58
+#define MT8188_MIXER_IN1_SOUT_TO_DISP_MIXER			0
+#define MT8188_VDO1_MIXER_IN2_SOUT_SEL				0xf5c
+#define MT8188_MIXER_IN2_SOUT_TO_DISP_MIXER			0
+#define MT8188_VDO1_MIXER_IN3_SOUT_SEL				0xf60
+#define MT8188_MIXER_IN3_SOUT_TO_DISP_MIXER			0
+#define MT8188_VDO1_MIXER_IN4_SOUT_SEL				0xf64
+#define MT8188_MIXER_IN4_SOUT_TO_DISP_MIXER			0
+#define MT8188_VDO1_MIXER_SOUT_SEL_IN				0xf68
+#define MT8188_MIXER_SOUT_SEL_IN_FROM_DISP_MIXER		0
+
 static const struct mtk_mmsys_routes mmsys_mt8188_routing_table[] = {
 	{
 		DDP_COMPONENT_OVL0, DDP_COMPONENT_RDMA0,
@@ -146,4 +196,80 @@ static const struct mtk_mmsys_routes mmsys_mt8188_routing_table[] = {
 	},
 };
 
+static const struct mtk_mmsys_routes mmsys_mt8188_vdo1_routing_table[] = {
+	{
+		DDP_COMPONENT_MDP_RDMA0, DDP_COMPONENT_MERGE1,
+		MT8188_VDO1_VPP_MERGE0_P0_SEL_IN, GENMASK(0, 0),
+		MT8188_VPP_MERGE0_P0_SEL_IN_FROM_MDP_RDMA0
+	}, {
+		DDP_COMPONENT_MDP_RDMA1, DDP_COMPONENT_MERGE1,
+		MT8188_VDO1_VPP_MERGE0_P1_SEL_IN, GENMASK(0, 0),
+		MT8188_VPP_MERGE0_P1_SEL_IN_FROM_MDP_RDMA1
+	}, {
+		DDP_COMPONENT_MDP_RDMA2, DDP_COMPONENT_MERGE2,
+		MT8188_VDO1_VPP_MERGE1_P0_SEL_IN, GENMASK(0, 0),
+		MT8188_VPP_MERGE1_P0_SEL_IN_FROM_MDP_RDMA2
+	}, {
+		DDP_COMPONENT_MERGE1, DDP_COMPONENT_ETHDR_MIXER,
+		MT8188_VDO1_MERGE0_ASYNC_SOUT_SEL, GENMASK(1, 0),
+		MT8188_SOUT_TO_MIXER_IN1_SEL
+	}, {
+		DDP_COMPONENT_MERGE2, DDP_COMPONENT_ETHDR_MIXER,
+		MT8188_VDO1_MERGE1_ASYNC_SOUT_SEL, GENMASK(1, 0),
+		MT8188_SOUT_TO_MIXER_IN2_SEL
+	}, {
+		DDP_COMPONENT_MERGE3, DDP_COMPONENT_ETHDR_MIXER,
+		MT8188_VDO1_MERGE2_ASYNC_SOUT_SEL, GENMASK(1, 0),
+		MT8188_SOUT_TO_MIXER_IN3_SEL
+	}, {
+		DDP_COMPONENT_MERGE4, DDP_COMPONENT_ETHDR_MIXER,
+		MT8188_VDO1_MERGE3_ASYNC_SOUT_SEL, GENMASK(1, 0),
+		MT8188_SOUT_TO_MIXER_IN4_SEL
+	}, {
+		DDP_COMPONENT_ETHDR_MIXER, DDP_COMPONENT_MERGE5,
+		MT8188_VDO1_MIXER_OUT_SOUT_SEL, GENMASK(0, 0),
+		MT8188_MIXER_SOUT_TO_MERGE4_ASYNC_SEL
+	}, {
+		DDP_COMPONENT_MERGE1, DDP_COMPONENT_ETHDR_MIXER,
+		MT8188_VDO1_MIXER_IN1_SEL_IN, GENMASK(0, 0),
+		MT8188_MIXER_IN1_SEL_IN_FROM_MERGE0_ASYNC_SOUT
+	}, {
+		DDP_COMPONENT_MERGE2, DDP_COMPONENT_ETHDR_MIXER,
+		MT8188_VDO1_MIXER_IN2_SEL_IN, GENMASK(0, 0),
+		MT8188_MIXER_IN2_SEL_IN_FROM_MERGE1_ASYNC_SOUT
+	}, {
+		DDP_COMPONENT_MERGE3, DDP_COMPONENT_ETHDR_MIXER,
+		MT8188_VDO1_MIXER_IN3_SEL_IN, GENMASK(0, 0),
+		MT8188_MIXER_IN3_SEL_IN_FROM_MERGE2_ASYNC_SOUT
+	}, {
+		DDP_COMPONENT_MERGE4, DDP_COMPONENT_ETHDR_MIXER,
+		MT8188_VDO1_MIXER_IN4_SEL_IN, GENMASK(0, 0),
+		MT8188_MIXER_IN4_SEL_IN_FROM_MERGE3_ASYNC_SOUT
+	}, {
+		DDP_COMPONENT_ETHDR_MIXER, DDP_COMPONENT_MERGE5,
+		MT8188_VDO1_MIXER_SOUT_SEL_IN, GENMASK(2, 0),
+		MT8188_MIXER_SOUT_SEL_IN_FROM_DISP_MIXER
+	}, {
+		DDP_COMPONENT_ETHDR_MIXER, DDP_COMPONENT_MERGE5,
+		MT8188_VDO1_MERGE4_ASYNC_SEL_IN, GENMASK(2, 0),
+		MT8188_MERGE4_ASYNC_SEL_IN_FROM_MIXER_OUT_SOUT
+	}, {
+		DDP_COMPONENT_MERGE5, DDP_COMPONENT_DPI1,
+		MT8188_VDO1_DISP_DPI1_SEL_IN, GENMASK(1, 0),
+		MT8188_DISP_DPI1_SEL_IN_FROM_VPP_MERGE4_MOUT
+	}, {
+		DDP_COMPONENT_MERGE5, DDP_COMPONENT_DPI1,
+		MT8188_VDO1_MERGE4_SOUT_SEL, GENMASK(1, 0),
+		MT8188_MERGE4_SOUT_TO_DPI1_SEL
+	}, {
+		DDP_COMPONENT_MERGE5, DDP_COMPONENT_DP_INTF1,
+		MT8188_VDO1_DISP_DP_INTF0_SEL_IN, GENMASK(1, 0),
+		MT8188_DISP_DP_INTF0_SEL_IN_FROM_VPP_MERGE4_MOUT
+	}, {
+		DDP_COMPONENT_MERGE5, DDP_COMPONENT_DP_INTF1,
+		MT8188_VDO1_MERGE4_SOUT_SEL, GENMASK(3, 0),
+		MT8188_MERGE4_SOUT_TO_DP_INTF0_SEL
+	}
+};
+
 #endif /* __SOC_MEDIATEK_MT8188_MMSYS_H */
diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
index ffb75711a1da..aa6014d25420 100644
--- a/drivers/soc/mediatek/mtk-mmsys.c
+++ b/drivers/soc/mediatek/mtk-mmsys.c
@@ -89,6 +89,14 @@ static const struct mtk_mmsys_driver_data mt8188_vdosys0_driver_data = {
 	.num_routes = ARRAY_SIZE(mmsys_mt8188_routing_table),
 };
 
+static const struct mtk_mmsys_driver_data mt8188_vdosys1_driver_data = {
+	.clk_driver = "clk-mt8188-vdo1",
+	.routes = mmsys_mt8188_vdo1_routing_table,
+	.num_routes = ARRAY_SIZE(mmsys_mt8188_vdo1_routing_table),
+	.num_resets = 96,
+	.vsync_len = 1,
+};
+
 static const struct mtk_mmsys_driver_data mt8192_mmsys_driver_data = {
 	.clk_driver = "clk-mt8192-mm",
 	.routes = mmsys_mt8192_routing_table,
@@ -169,6 +177,10 @@ void mtk_mmsys_ddp_connect(struct device *dev,
 		if (cur == routes[i].from_comp && next == routes[i].to_comp)
 			mtk_mmsys_update_bits(mmsys, routes[i].addr, routes[i].mask,
 					      routes[i].val, NULL);
+
+	if (mmsys->data->vsync_len)
+		mtk_mmsys_update_bits(mmsys, MT8188_VDO1_MIXER_VSYNC_LEN, GENMASK(31, 0),
+				      mmsys->data->vsync_len, NULL);
 }
 EXPORT_SYMBOL_GPL(mtk_mmsys_ddp_connect);
 
@@ -431,6 +443,7 @@ static const struct of_device_id of_match_mtk_mmsys[] = {
 	{ .compatible = "mediatek,mt8183-mmsys", .data = &mt8183_mmsys_driver_data },
 	{ .compatible = "mediatek,mt8186-mmsys", .data = &mt8186_mmsys_driver_data },
 	{ .compatible = "mediatek,mt8188-vdosys0", .data = &mt8188_vdosys0_driver_data },
+	{ .compatible = "mediatek,mt8188-vdosys1", .data = &mt8188_vdosys1_driver_data },
 	{ .compatible = "mediatek,mt8192-mmsys", .data = &mt8192_mmsys_driver_data },
 	/* "mediatek,mt8195-mmsys" compatible is deprecated */
 	{ .compatible = "mediatek,mt8195-mmsys", .data = &mt8195_vdosys0_driver_data },
diff --git a/drivers/soc/mediatek/mtk-mmsys.h b/drivers/soc/mediatek/mtk-mmsys.h
index 6725403d2e3a..49851bc7aa9e 100644
--- a/drivers/soc/mediatek/mtk-mmsys.h
+++ b/drivers/soc/mediatek/mtk-mmsys.h
@@ -86,6 +86,34 @@ struct mtk_mmsys_routes {
 	u32 val;
 };
 
+/**
+ * struct mtk_mmsys_driver_data - settings for the mmsys
+ * @clk_driver: Clock driver name that the mmsys is using
+ *              (defined in drivers/clk/mediatek/clk-*.c).
+ * @routes: Routing table of the mmsys.
+ *          It provides mux settings from one module to another.
+ * @num_routes: Array size of the routes.
+ * @sw0_rst_offset: Register offset for the reset control.
+ * @num_resets: Number of reset bits that are defined
+ * @is_vppsys: Whether the mmsys is VPPSYS (Video Processing Pipe)
+ *             or VDOSYS (Video). Only VDOSYS needs to be added to drm driver.
+ * @vsync_len: VSYNC length of the MIXER.
+ *             VSYNC is usually triggered by the connector, so its length is a
+ *             fixed value when the frame rate is decided, but ETHDR and
+ *             MIXER generate their own VSYNC due to hardware design, therefore
+ *             MIXER has to sync with ETHDR by adjusting VSYNC length.
+ *             On MT8195, there is no such setting so we use the gap between
+ *             falling edge and rising edge of SOF (Start of Frame) signal to
+ *             do the job, but since MT8188, VSYNC_LEN setting is introduced to
+ *             solve the problem and is given 0x40 (ticks) as the default value.
+ *             Please notice that this value has to be set to 1 (minimum) if
+ *             ETHDR is bypassed, otherwise MIXER could wait too long and causing
+ *             underflow.
+ *
+ * Each MMSYS (multi-media system) may have different settings, they may use
+ * different clock sources, mux settings, reset control ...etc., and these
+ * differences are all stored here.
+ */
 struct mtk_mmsys_driver_data {
 	const char *clk_driver;
 	const struct mtk_mmsys_routes *routes;
@@ -93,6 +121,7 @@ struct mtk_mmsys_driver_data {
 	const u16 sw0_rst_offset;
 	const u32 num_resets;
 	const bool is_vppsys;
+	const u8 vsync_len;
 };
 
 /*
diff --git a/drivers/soc/mediatek/mtk-mutex.c b/drivers/soc/mediatek/mtk-mutex.c
index 9d9f5ae578ac..e76722289175 100644
--- a/drivers/soc/mediatek/mtk-mutex.c
+++ b/drivers/soc/mediatek/mtk-mutex.c
@@ -133,6 +133,22 @@
 #define MT8188_MUTEX_MOD_DISP_POSTMASK0		24
 #define MT8188_MUTEX_MOD2_DISP_PWM0		33
 
+#define MT8188_MUTEX_MOD_DISP1_MDP_RDMA0	0
+#define MT8188_MUTEX_MOD_DISP1_MDP_RDMA1	1
+#define MT8188_MUTEX_MOD_DISP1_MDP_RDMA2	2
+#define MT8188_MUTEX_MOD_DISP1_MDP_RDMA3	3
+#define MT8188_MUTEX_MOD_DISP1_MDP_RDMA4	4
+#define MT8188_MUTEX_MOD_DISP1_MDP_RDMA5	5
+#define MT8188_MUTEX_MOD_DISP1_MDP_RDMA6	6
+#define MT8188_MUTEX_MOD_DISP1_MDP_RDMA7	7
+#define MT8188_MUTEX_MOD_DISP1_VPP_MERGE0	20
+#define MT8188_MUTEX_MOD_DISP1_VPP_MERGE1	21
+#define MT8188_MUTEX_MOD_DISP1_VPP_MERGE2	22
+#define MT8188_MUTEX_MOD_DISP1_VPP_MERGE3	23
+#define MT8188_MUTEX_MOD_DISP1_VPP_MERGE4	24
+#define MT8188_MUTEX_MOD_DISP1_DISP_MIXER	30
+#define MT8188_MUTEX_MOD_DISP1_DP_INTF1		39
+
 #define MT8195_MUTEX_MOD_DISP_OVL0		0
 #define MT8195_MUTEX_MOD_DISP_WDMA0		1
 #define MT8195_MUTEX_MOD_DISP_RDMA0		2
@@ -264,6 +280,7 @@
 #define MT8183_MUTEX_SOF_DPI0			2
 #define MT8188_MUTEX_SOF_DSI0			1
 #define MT8188_MUTEX_SOF_DP_INTF0		3
+#define MT8188_MUTEX_SOF_DP_INTF1		4
 #define MT8195_MUTEX_SOF_DSI0			1
 #define MT8195_MUTEX_SOF_DSI1			2
 #define MT8195_MUTEX_SOF_DP_INTF0		3
@@ -275,6 +292,7 @@
 #define MT8183_MUTEX_EOF_DPI0			(MT8183_MUTEX_SOF_DPI0 << 6)
 #define MT8188_MUTEX_EOF_DSI0			(MT8188_MUTEX_SOF_DSI0 << 7)
 #define MT8188_MUTEX_EOF_DP_INTF0		(MT8188_MUTEX_SOF_DP_INTF0 << 7)
+#define MT8188_MUTEX_EOF_DP_INTF1		(MT8188_MUTEX_SOF_DP_INTF1 << 7)
 #define MT8195_MUTEX_EOF_DSI0			(MT8195_MUTEX_SOF_DSI0 << 7)
 #define MT8195_MUTEX_EOF_DSI1			(MT8195_MUTEX_SOF_DSI1 << 7)
 #define MT8195_MUTEX_EOF_DP_INTF0		(MT8195_MUTEX_SOF_DP_INTF0 << 7)
@@ -445,6 +463,21 @@ static const unsigned int mt8188_mutex_mod[DDP_COMPONENT_ID_MAX] = {
 	[DDP_COMPONENT_DSI0] = MT8188_MUTEX_MOD_DISP_DSI0,
 	[DDP_COMPONENT_PWM0] = MT8188_MUTEX_MOD2_DISP_PWM0,
 	[DDP_COMPONENT_DP_INTF0] = MT8188_MUTEX_MOD_DISP_DP_INTF0,
+	[DDP_COMPONENT_DP_INTF1] = MT8188_MUTEX_MOD_DISP1_DP_INTF1,
+	[DDP_COMPONENT_ETHDR_MIXER] = MT8188_MUTEX_MOD_DISP1_DISP_MIXER,
+	[DDP_COMPONENT_MDP_RDMA0] = MT8188_MUTEX_MOD_DISP1_MDP_RDMA0,
+	[DDP_COMPONENT_MDP_RDMA1] = MT8188_MUTEX_MOD_DISP1_MDP_RDMA1,
+	[DDP_COMPONENT_MDP_RDMA2] = MT8188_MUTEX_MOD_DISP1_MDP_RDMA2,
+	[DDP_COMPONENT_MDP_RDMA3] = MT8188_MUTEX_MOD_DISP1_MDP_RDMA3,
+	[DDP_COMPONENT_MDP_RDMA4] = MT8188_MUTEX_MOD_DISP1_MDP_RDMA4,
+	[DDP_COMPONENT_MDP_RDMA5] = MT8188_MUTEX_MOD_DISP1_MDP_RDMA5,
+	[DDP_COMPONENT_MDP_RDMA6] = MT8188_MUTEX_MOD_DISP1_MDP_RDMA6,
+	[DDP_COMPONENT_MDP_RDMA7] = MT8188_MUTEX_MOD_DISP1_MDP_RDMA7,
+	[DDP_COMPONENT_MERGE1] = MT8188_MUTEX_MOD_DISP1_VPP_MERGE0,
+	[DDP_COMPONENT_MERGE2] = MT8188_MUTEX_MOD_DISP1_VPP_MERGE1,
+	[DDP_COMPONENT_MERGE3] = MT8188_MUTEX_MOD_DISP1_VPP_MERGE2,
+	[DDP_COMPONENT_MERGE4] = MT8188_MUTEX_MOD_DISP1_VPP_MERGE3,
+	[DDP_COMPONENT_MERGE5] = MT8188_MUTEX_MOD_DISP1_VPP_MERGE4,
 };
 
 static const unsigned int mt8192_mutex_mod[DDP_COMPONENT_ID_MAX] = {
@@ -605,6 +638,8 @@ static const unsigned int mt8188_mutex_sof[DDP_MUTEX_SOF_MAX] = {
 		MT8188_MUTEX_SOF_DSI0 | MT8188_MUTEX_EOF_DSI0,
 	[MUTEX_SOF_DP_INTF0] =
 		MT8188_MUTEX_SOF_DP_INTF0 | MT8188_MUTEX_EOF_DP_INTF0,
+	[MUTEX_SOF_DP_INTF1] =
+		MT8188_MUTEX_SOF_DP_INTF1 | MT8188_MUTEX_EOF_DP_INTF1,
 };
 
 static const unsigned int mt8195_mutex_sof[DDP_MUTEX_SOF_MAX] = {
-- 
2.18.0


