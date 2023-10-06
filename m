Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7E3CE92FF1
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Oct 2023 07:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NwWcuE3w5mCP3+3R1Z65kcNA5ib/gJuuDT9Nzn3ye5w=; b=1ATh1LF83gx/fehtfvuY8VsLOK
	7+LEtQipV4js4WFwV3t7g1Fup7kX3JjA1Zq574bQ54b2Z90UZ0jl2cgATdxpLOC7BvKM35VzHkboz
	NlOdJF9AhK8eOOUbRX/aRjumjiZ+W9DzeYmketIUV9namvuFm6zBh5dxbLaXUpT0MhzLkERSkCiqg
	l4T8PHxJ5JrbPw4hjMwCRpmnf0awVBhx1UA5dfWCJjz1x7pqN74C9qsV7Vt4Cxf7cqawPk5iEp29c
	WWlHWbtbSlb5QxU0HNa+ihJVnuLjY5F6aC8DiOc7qBWSi3C+XmqY68bOXj6SunA3WYndnTCC1CX+8
	8lCV96ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qofQT-005AOQ-27;
	Fri, 06 Oct 2023 07:39:09 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qofQO-005AIK-1U;
	Fri, 06 Oct 2023 07:39:08 +0000
X-UUID: 699b3e7a641b11ee9b7791016c24628a-20231006
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=NwWcuE3w5mCP3+3R1Z65kcNA5ib/gJuuDT9Nzn3ye5w=;
	b=MTggJV6RMxAiGl2oGsfKzGsBElMhnYdMIwkWHxX5PvR7LGi6P3LogD2cv3nQs5+YCS709el/stXC8+XVl7DkKXn4Z1JInerfYvMLpp9+JAtXhlwevTD+FYspcXFStZszmj4xIh87lgB33v0mDKhiZlXxOP7rFcWPUKaRcNTz4e0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32,REQID:469d8df7-c64c-42ec-b00f-216fa5a48016,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:5f78ec9,CLOUDID:e76ba6bf-14cc-44ca-b657-2d2783296e72,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 699b3e7a641b11ee9b7791016c24628a-20231006
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <shawn.sung@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 340959489; Fri, 06 Oct 2023 00:38:59 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 6 Oct 2023 15:38:35 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 6 Oct 2023 15:38:35 +0800
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
Subject: [PATCH v7 10/23] soc: mediatek: Add MT8188 VDOSYS reset bit map
Date: Fri, 6 Oct 2023 15:38:18 +0800
Message-ID: <20231006073831.10402-11-shawn.sung@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20231006073831.10402-1-shawn.sung@mediatek.com>
References: <20231006073831.10402-1-shawn.sung@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231006_003904_521186_76C25576 
X-CRM114-Status: GOOD (  10.77  )
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

Add MT8188 reset bit map for VDOSYS0 and VDOSYS1.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
---
 drivers/soc/mediatek/mt8188-mmsys.h | 84 +++++++++++++++++++++++++++++
 drivers/soc/mediatek/mtk-mmsys.c    |  7 ++-
 2 files changed, 90 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/mediatek/mt8188-mmsys.h b/drivers/soc/mediatek/mt8188-mmsys.h
index a9490c3c4256..6bebf1a69fc0 100644
--- a/drivers/soc/mediatek/mt8188-mmsys.h
+++ b/drivers/soc/mediatek/mt8188-mmsys.h
@@ -3,6 +3,10 @@
 #ifndef __SOC_MEDIATEK_MT8188_MMSYS_H
 #define __SOC_MEDIATEK_MT8188_MMSYS_H
 
+#include <linux/soc/mediatek/mtk-mmsys.h>
+#include <dt-bindings/reset/mt8188-resets.h>
+
+#define MT8188_VDO0_SW0_RST_B				0x190
 #define MT8188_VDO0_OVL_MOUT_EN				0xf14
 #define MT8188_MOUT_DISP_OVL0_TO_DISP_RDMA0		BIT(0)
 #define MT8188_MOUT_DISP_OVL0_TO_DISP_WDMA0		BIT(1)
@@ -67,6 +71,7 @@
 #define MT8188_SOUT_DSC_WRAP0_OUT_TO_VPP_MERGE		BIT(18)
 #define MT8188_SOUT_DSC_WRAP0_OUT_TO_DISP_WDMA0		BIT(19)
 
+#define MT8188_VDO1_SW0_RST_B					0x1d0
 #define MT8188_VDO1_HDR_TOP_CFG					0xd00
 #define MT8188_VDO1_MIXER_IN1_ALPHA				0xd30
 #define MT8188_VDO1_MIXER_IN1_PAD				0xd40
@@ -117,6 +122,85 @@
 #define MT8188_VDO1_MIXER_SOUT_SEL_IN				0xf68
 #define MT8188_MIXER_SOUT_SEL_IN_FROM_DISP_MIXER		0
 
+static const u8 mmsys_mt8188_vdo0_rst_tb[] = {
+	[MT8188_VDO0_RST_DISP_OVL0]	= MMSYS_RST_NR(0, 0),
+	[MT8188_VDO0_RST_FAKE_ENG0]	= MMSYS_RST_NR(0, 2),
+	[MT8188_VDO0_RST_DISP_CCORR0]	= MMSYS_RST_NR(0, 4),
+	[MT8188_VDO0_RST_DISP_MUTEX0]	= MMSYS_RST_NR(0, 6),
+	[MT8188_VDO0_RST_DISP_GAMMA0]	= MMSYS_RST_NR(0, 8),
+	[MT8188_VDO0_RST_DISP_DITHER0]	= MMSYS_RST_NR(0, 10),
+	[MT8188_VDO0_RST_DISP_WDMA0]	= MMSYS_RST_NR(0, 17),
+	[MT8188_VDO0_RST_DISP_RDMA0]	= MMSYS_RST_NR(0, 19),
+	[MT8188_VDO0_RST_DSI0]		= MMSYS_RST_NR(0, 21),
+	[MT8188_VDO0_RST_DSI1]		= MMSYS_RST_NR(0, 22),
+	[MT8188_VDO0_RST_DSC_WRAP0]	= MMSYS_RST_NR(0, 23),
+	[MT8188_VDO0_RST_VPP_MERGE0]	= MMSYS_RST_NR(0, 24),
+	[MT8188_VDO0_RST_DP_INTF0]	= MMSYS_RST_NR(0, 25),
+	[MT8188_VDO0_RST_DISP_AAL0]	= MMSYS_RST_NR(0, 26),
+	[MT8188_VDO0_RST_INLINEROT0]	= MMSYS_RST_NR(0, 27),
+	[MT8188_VDO0_RST_APB_BUS]	= MMSYS_RST_NR(0, 28),
+	[MT8188_VDO0_RST_DISP_COLOR0]	= MMSYS_RST_NR(0, 29),
+	[MT8188_VDO0_RST_MDP_WROT0]	= MMSYS_RST_NR(0, 30),
+	[MT8188_VDO0_RST_DISP_RSZ0]	= MMSYS_RST_NR(0, 31),
+};
+
+static const u8 mmsys_mt8188_vdo1_rst_tb[] = {
+	[MT8188_VDO1_RST_SMI_LARB2]			= MMSYS_RST_NR(0, 0),
+	[MT8188_VDO1_RST_SMI_LARB3]			= MMSYS_RST_NR(0, 1),
+	[MT8188_VDO1_RST_GALS]				= MMSYS_RST_NR(0, 2),
+	[MT8188_VDO1_RST_FAKE_ENG0]			= MMSYS_RST_NR(0, 3),
+	[MT8188_VDO1_RST_FAKE_ENG1]			= MMSYS_RST_NR(0, 4),
+	[MT8188_VDO1_RST_MDP_RDMA0]			= MMSYS_RST_NR(0, 5),
+	[MT8188_VDO1_RST_MDP_RDMA1]			= MMSYS_RST_NR(0, 6),
+	[MT8188_VDO1_RST_MDP_RDMA2]			= MMSYS_RST_NR(0, 7),
+	[MT8188_VDO1_RST_MDP_RDMA3]			= MMSYS_RST_NR(0, 8),
+	[MT8188_VDO1_RST_VPP_MERGE0]			= MMSYS_RST_NR(0, 9),
+	[MT8188_VDO1_RST_VPP_MERGE1]			= MMSYS_RST_NR(0, 10),
+	[MT8188_VDO1_RST_VPP_MERGE2]			= MMSYS_RST_NR(0, 11),
+	[MT8188_VDO1_RST_VPP_MERGE3]			= MMSYS_RST_NR(1, 0),
+	[MT8188_VDO1_RST_VPP_MERGE4]			= MMSYS_RST_NR(1, 1),
+	[MT8188_VDO1_RST_VPP2_TO_VDO1_DL_ASYNC]		= MMSYS_RST_NR(1, 2),
+	[MT8188_VDO1_RST_VPP3_TO_VDO1_DL_ASYNC]		= MMSYS_RST_NR(1, 3),
+	[MT8188_VDO1_RST_DISP_MUTEX]			= MMSYS_RST_NR(1, 4),
+	[MT8188_VDO1_RST_MDP_RDMA4]			= MMSYS_RST_NR(1, 5),
+	[MT8188_VDO1_RST_MDP_RDMA5]			= MMSYS_RST_NR(1, 6),
+	[MT8188_VDO1_RST_MDP_RDMA6]			= MMSYS_RST_NR(1, 7),
+	[MT8188_VDO1_RST_MDP_RDMA7]			= MMSYS_RST_NR(1, 8),
+	[MT8188_VDO1_RST_DP_INTF1_MMCK]			= MMSYS_RST_NR(1, 9),
+	[MT8188_VDO1_RST_DPI0_MM_CK]			= MMSYS_RST_NR(1, 10),
+	[MT8188_VDO1_RST_DPI1_MM_CK]			= MMSYS_RST_NR(1, 11),
+	[MT8188_VDO1_RST_MERGE0_DL_ASYNC]		= MMSYS_RST_NR(1, 13),
+	[MT8188_VDO1_RST_MERGE1_DL_ASYNC]		= MMSYS_RST_NR(1, 14),
+	[MT8188_VDO1_RST_MERGE2_DL_ASYNC]		= MMSYS_RST_NR(1, 15),
+	[MT8188_VDO1_RST_MERGE3_DL_ASYNC]		= MMSYS_RST_NR(1, 16),
+	[MT8188_VDO1_RST_MERGE4_DL_ASYNC]		= MMSYS_RST_NR(1, 17),
+	[MT8188_VDO1_RST_VDO0_DSC_TO_VDO1_DL_ASYNC]	= MMSYS_RST_NR(1, 18),
+	[MT8188_VDO1_RST_VDO0_MERGE_TO_VDO1_DL_ASYNC]	= MMSYS_RST_NR(1, 19),
+	[MT8188_VDO1_RST_PADDING0]			= MMSYS_RST_NR(1, 20),
+	[MT8188_VDO1_RST_PADDING1]			= MMSYS_RST_NR(1, 21),
+	[MT8188_VDO1_RST_PADDING2]			= MMSYS_RST_NR(1, 22),
+	[MT8188_VDO1_RST_PADDING3]			= MMSYS_RST_NR(1, 23),
+	[MT8188_VDO1_RST_PADDING4]			= MMSYS_RST_NR(1, 24),
+	[MT8188_VDO1_RST_PADDING5]			= MMSYS_RST_NR(1, 25),
+	[MT8188_VDO1_RST_PADDING6]			= MMSYS_RST_NR(1, 26),
+	[MT8188_VDO1_RST_PADDING7]			= MMSYS_RST_NR(1, 27),
+	[MT8188_VDO1_RST_DISP_RSZ0]			= MMSYS_RST_NR(1, 28),
+	[MT8188_VDO1_RST_DISP_RSZ1]			= MMSYS_RST_NR(1, 29),
+	[MT8188_VDO1_RST_DISP_RSZ2]			= MMSYS_RST_NR(1, 30),
+	[MT8188_VDO1_RST_DISP_RSZ3]			= MMSYS_RST_NR(1, 31),
+	[MT8188_VDO1_RST_HDR_VDO_FE0]			= MMSYS_RST_NR(2, 0),
+	[MT8188_VDO1_RST_HDR_GFX_FE0]			= MMSYS_RST_NR(2, 1),
+	[MT8188_VDO1_RST_HDR_VDO_BE]			= MMSYS_RST_NR(2, 2),
+	[MT8188_VDO1_RST_HDR_VDO_FE1]			= MMSYS_RST_NR(2, 16),
+	[MT8188_VDO1_RST_HDR_GFX_FE1]			= MMSYS_RST_NR(2, 17),
+	[MT8188_VDO1_RST_DISP_MIXER]			= MMSYS_RST_NR(2, 18),
+	[MT8188_VDO1_RST_HDR_VDO_FE0_DL_ASYNC]		= MMSYS_RST_NR(2, 19),
+	[MT8188_VDO1_RST_HDR_VDO_FE1_DL_ASYNC]		= MMSYS_RST_NR(2, 20),
+	[MT8188_VDO1_RST_HDR_GFX_FE0_DL_ASYNC]		= MMSYS_RST_NR(2, 21),
+	[MT8188_VDO1_RST_HDR_GFX_FE1_DL_ASYNC]		= MMSYS_RST_NR(2, 22),
+	[MT8188_VDO1_RST_HDR_VDO_BE_DL_ASYNC]		= MMSYS_RST_NR(2, 23),
+};
+
 static const struct mtk_mmsys_routes mmsys_mt8188_routing_table[] = {
 	{
 		DDP_COMPONENT_OVL0, DDP_COMPONENT_RDMA0,
diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
index be061df8a39d..9e15eeaccc3d 100644
--- a/drivers/soc/mediatek/mtk-mmsys.c
+++ b/drivers/soc/mediatek/mtk-mmsys.c
@@ -87,13 +87,18 @@ static const struct mtk_mmsys_driver_data mt8188_vdosys0_driver_data = {
 	.clk_driver = "clk-mt8188-vdo0",
 	.routes = mmsys_mt8188_routing_table,
 	.num_routes = ARRAY_SIZE(mmsys_mt8188_routing_table),
+	.sw0_rst_offset = MT8188_VDO0_SW0_RST_B,
+	.rst_tb = mmsys_mt8188_vdo0_rst_tb,
+	.num_resets = ARRAY_SIZE(mmsys_mt8188_vdo0_rst_tb),
 };
 
 static const struct mtk_mmsys_driver_data mt8188_vdosys1_driver_data = {
 	.clk_driver = "clk-mt8188-vdo1",
 	.routes = mmsys_mt8188_vdo1_routing_table,
 	.num_routes = ARRAY_SIZE(mmsys_mt8188_vdo1_routing_table),
-	.num_resets = 96,
+	.sw0_rst_offset = MT8188_VDO1_SW0_RST_B,
+	.rst_tb = mmsys_mt8188_vdo1_rst_tb,
+	.num_resets = ARRAY_SIZE(mmsys_mt8188_vdo1_rst_tb),
 	.vsync_len = 1,
 };
 
-- 
2.18.0


