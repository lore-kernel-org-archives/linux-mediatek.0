Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD0CACDB465
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Oct 2023 06:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d+LzXIKA/zBp7PUzjcKv+Ltc19EYgBayeljoDsVzf8s=; b=RSmUrqEYjYrQ0yCIetlTj9RKgz
	sEmQ0z0hlKt/h3KtSgl5lfcxWaAqVXWez526mNc6joXOSDaBRYoAJOEFoJM+Gbjz8OHpNDtV0Ukcy
	7XZop8XzLdL8Y72konPtrw19yH7BPE3j1ZsPES3N0F0P5241kPZe0p7MV11TJo68Cv5NktITXCcdj
	iSyxdmZRnSSRiYb9CdeWilIonJajDJwpy7F7c/87MjjMuHb7Mtkyv1ms6t48CIZ/WsgAxrYFWNxjE
	U4jTZqhxiUE7Pj8HNFMimefoouhw4BYdmMVXY/Q1URRtVeFcDL+DJaoi13O3Anno0zTKSkq9o94/S
	qgzXtP0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtMBV-00GSqT-2l;
	Thu, 19 Oct 2023 06:07:05 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtMBS-00GSoy-0O;
	Thu, 19 Oct 2023 06:07:03 +0000
X-UUID: b68fef586e4511ee86758d4a7c00f3a0-20231018
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=d+LzXIKA/zBp7PUzjcKv+Ltc19EYgBayeljoDsVzf8s=;
	b=BWlELdLYMUOSEgK4LdwZ56vssjYjJd0Pj9qh5ehAMoJs+54976zrFohQN8KnHjaXQAnmcRkpluBBg6+PFO8wEfAfUO6Zti80+g1nita57UX72ewaiYEm7Kk4E0F7d7mD/oW34V/FWYKfNqLm5GAuKCwYuLQZZO4WxBxxFrZ7xLI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32,REQID:6f9745ab-d7a4-45a5-b96c-ba9c2437c82b,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:5f78ec9,CLOUDID:17ca4dc4-1e57-4345-9d31-31ad9818b39f,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: b68fef586e4511ee86758d4a7c00f3a0-20231018
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <shawn.sung@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 881112489; Wed, 18 Oct 2023 23:06:58 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 19 Oct 2023 13:56:22 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 19 Oct 2023 13:56:22 +0800
From: Hsiao Chien Sung <shawn.sung@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, "CK
 Hu" <ck.hu@mediatek.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v10 10/24] soc: mediatek: Add MT8188 VDOSYS reset bit map
Date: Thu, 19 Oct 2023 13:56:05 +0800
Message-ID: <20231019055619.19358-11-shawn.sung@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20231019055619.19358-1-shawn.sung@mediatek.com>
References: <20231019055619.19358-1-shawn.sung@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--6.042400-8.000000
X-TMASE-MatchedRID: 9DomuZeNnSapk9YSiEd5IufHZObG8Jso6SXuwUgGH0hbKBBN5zqG8EiO
	7+wNDdeYRHLRFcKKZXfbCHv011Gy9VSU1d+VJ4IjtG07VELUSnRfohHCqSnabgTozVi1xfq8MJK
	6qaU5tN00ULOv9iNOM0q+cX2jmfqvmxh0gY/o+VmiAZ3zAhQYgn0tCKdnhB589yM15V5aWpj6C0
	ePs7A07fyjtizU0rhjVyJ6Rrqx+FNSRMjv86A6CPVU14ep5TZkqBHnAYeJC8o=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--6.042400-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 188A89F13DDF63D1A274BBDA24C7C7D5733F423B67BC252BC9FEFAFCCAF5BD102000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231018_230702_191565_16D845C9 
X-CRM114-Status: GOOD (  10.98  )
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
Cc: Nathan Lu <nathan.lu@mediatek.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, Moudy Ho <moudy.ho@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Johnson Wang <johnson.wang@mediatek.corp-partner.google.com>, "Nancy . Lin" <nancy.lin@mediatek.com>, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>, "Jason-JH . Lin" <jason-jh.lin@mediatek.com>, Hsiao Chien Sung <shawn.sung@mediatek.com>, Sean Paul <sean@poorly.run>, devicetree@vger.kernel.org
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
index 3a7108eefe9d..a456c3e0aee7 100644
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


