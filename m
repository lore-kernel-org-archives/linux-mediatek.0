Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83767C54EE9
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Sep 2022 09:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kjnQc2ji9IfXYKqhoT4lS5DRBS4AWBjjlo3MSv41gGM=; b=U0xlP3wg2Sn5f27m2Ot5bTGsea
	DZohZxkvTxkFPjWy7LGI44QEQqOfdrZUsfFYbl5hO7i0cY9ZAnveBj9zznOqMJ7DNBfFbbADXXcra
	nigSUYcjVYrqN7OYMjLNeT5ZnUTrmQhHCtpctG+dvyfHg6PA0qKNi2WNVQ4FP0UnJBOlQmVrWYFkq
	zs1aqXrhZ1iqMqKPvB/a/9SR7ewuB0ezxPqjUwDviQEOybBta3hxyUG2jw2jxskXIl0D8UKCxoUBJ
	9CaBx4ZwCJfnhRUnVzirMzKlVOh+C5xpp7z9ek7mEmmNIVAFVOapFQhhU0m05CnEwih2uXczI1JTx
	KnlYvSSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaZEB-002CXV-VE; Tue, 20 Sep 2022 09:07:40 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaZ8c-00293T-Ue; Tue, 20 Sep 2022 09:01:58 +0000
X-UUID: 86ca0a0877eb4ff28716c0b8bec3550e-20220920
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=kjnQc2ji9IfXYKqhoT4lS5DRBS4AWBjjlo3MSv41gGM=;
	b=oUlPj6BWVrWWG2TiNG5Etoh2vQ7pb8C5dlTFtcMDUB4exdiH1HTokW6CnffxIMQgu2Xmu3iksWuX0oPoLsG6Q1yq7yUllHe482YIgIkkYQaBLg0NCjYxxAyyPryvaqBL7hjSwdoYazCiFCiDU27TCs98jHDHFkhgcEpnpLNG6wg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:611ae003-7d69-4049-aae8-3c6add13c901,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:39a5ff1,CLOUDID:0ff2435e-5ed4-4e28-8b00-66ed9f042fbd,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 86ca0a0877eb4ff28716c0b8bec3550e-20220920
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1358698519; Tue, 20 Sep 2022 02:01:47 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Tue, 20 Sep 2022 17:00:50 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 20 Sep 2022 17:00:49 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Vinod Koul <vkoul@kernel.org>
CC: Philipp Zabel <p.zabel@pengutronix.de>, Chunfeng Yun
	<chunfeng.yun@mediatek.com>, Kishon Vijay Abraham I <kishon@ti.com>,
	"Matthias Brugger" <matthias.bgg@gmail.com>,
	<dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-phy@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Jitao Shi <jitao.shi@mediatek.com>, Stanley
 Chu <stanley.chu@mediatek.com>
Subject: [PATCH 13/18] phy: mediatek: mipi: mt8173: use GENMASK to generate bits mask
Date: Tue, 20 Sep 2022 17:00:33 +0800
Message-ID: <20220920090038.15133-14-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220920090038.15133-1-chunfeng.yun@mediatek.com>
References: <20220920090038.15133-1-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220920_020155_068857_608F443A 
X-CRM114-Status: UNSURE (   7.57  )
X-CRM114-Notice: Please train this message.
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

Use GENMASK() macro to generate bits mask

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 .../phy/mediatek/phy-mtk-mipi-dsi-mt8173.c    | 53 ++++++++++---------
 1 file changed, 29 insertions(+), 24 deletions(-)

diff --git a/drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8173.c b/drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8173.c
index 7a847954594f..5c257d67d7be 100644
--- a/drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8173.c
+++ b/drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8173.c
@@ -9,9 +9,9 @@
 #define MIPITX_DSI_CON		0x00
 #define RG_DSI_LDOCORE_EN		BIT(0)
 #define RG_DSI_CKG_LDOOUT_EN		BIT(1)
-#define RG_DSI_BCLK_SEL			(3 << 2)
-#define RG_DSI_LD_IDX_SEL		(7 << 4)
-#define RG_DSI_PHYCLK_SEL		(2 << 8)
+#define RG_DSI_BCLK_SEL			GENMASK(3, 2)
+#define RG_DSI_LD_IDX_SEL		GENMASK(6, 4)
+#define RG_DSI_PHYCLK_SEL		GENMASK(9, 8)
 #define RG_DSI_DSICLK_FREQ_SEL		BIT(10)
 #define RG_DSI_LPTX_CLMP_EN		BIT(11)
 
@@ -27,41 +27,46 @@
 #define RG_DSI_LNTx_LPTX_IMINUS		BIT(4)
 #define RG_DSI_LNTx_LPCD_IPLUS		BIT(5)
 #define RG_DSI_LNTx_LPCD_IMINUS		BIT(6)
-#define RG_DSI_LNTx_RT_CODE		(0xf << 8)
+#define RG_DSI_LNTx_RT_CODE		GENMASK(11, 8)
 
 #define MIPITX_DSI_TOP_CON	0x40
 #define RG_DSI_LNT_INTR_EN		BIT(0)
 #define RG_DSI_LNT_HS_BIAS_EN		BIT(1)
 #define RG_DSI_LNT_IMP_CAL_EN		BIT(2)
 #define RG_DSI_LNT_TESTMODE_EN		BIT(3)
-#define RG_DSI_LNT_IMP_CAL_CODE		(0xf << 4)
-#define RG_DSI_LNT_AIO_SEL		(7 << 8)
+#define RG_DSI_LNT_IMP_CAL_CODE		GENMASK(7, 4)
+#define RG_DSI_LNT_AIO_SEL		GENMASK(10, 8)
 #define RG_DSI_PAD_TIE_LOW_EN		BIT(11)
 #define RG_DSI_DEBUG_INPUT_EN		BIT(12)
-#define RG_DSI_PRESERVE			(7 << 13)
+#define RG_DSI_PRESERVE			GENMASK(15, 13)
 
 #define MIPITX_DSI_BG_CON	0x44
 #define RG_DSI_BG_CORE_EN		BIT(0)
 #define RG_DSI_BG_CKEN			BIT(1)
-#define RG_DSI_BG_DIV			(0x3 << 2)
+#define RG_DSI_BG_DIV			GENMASK(3, 2)
 #define RG_DSI_BG_FAST_CHARGE		BIT(4)
-#define RG_DSI_VOUT_MSK			(0x3ffff << 5)
-#define RG_DSI_V12_SEL			(7 << 5)
-#define RG_DSI_V10_SEL			(7 << 8)
-#define RG_DSI_V072_SEL			(7 << 11)
-#define RG_DSI_V04_SEL			(7 << 14)
-#define RG_DSI_V032_SEL			(7 << 17)
-#define RG_DSI_V02_SEL			(7 << 20)
-#define RG_DSI_BG_R1_TRIM		(0xf << 24)
-#define RG_DSI_BG_R2_TRIM		(0xf << 28)
+
+#define RG_DSI_V12_SEL			GENMASK(7, 5)
+#define RG_DSI_V10_SEL			GENMASK(10, 8)
+#define RG_DSI_V072_SEL			GENMASK(13, 11)
+#define RG_DSI_V04_SEL			GENMASK(16, 14)
+#define RG_DSI_V032_SEL			GENMASK(19, 17)
+#define RG_DSI_V02_SEL			GENMASK(22, 20)
+#define RG_DSI_VOUT_MSK			\
+		(RG_DSI_V12_SEL | RG_DSI_V10_SEL | RG_DSI_V072_SEL | \
+		 RG_DSI_V04_SEL | RG_DSI_V032_SEL | RG_DSI_V02_SEL)
+#define RG_DSI_BG_R1_TRIM		GENMASK(27, 24)
+#define RG_DSI_BG_R2_TRIM		GENMASK(31, 28)
 
 #define MIPITX_DSI_PLL_CON0	0x50
 #define RG_DSI_MPPLL_PLL_EN		BIT(0)
-#define RG_DSI_MPPLL_DIV_MSK		(0x1ff << 1)
-#define RG_DSI_MPPLL_PREDIV		(3 << 1)
-#define RG_DSI_MPPLL_TXDIV0		(3 << 3)
-#define RG_DSI_MPPLL_TXDIV1		(3 << 5)
-#define RG_DSI_MPPLL_POSDIV		(7 << 7)
+#define RG_DSI_MPPLL_PREDIV		GENMASK(2, 1)
+#define RG_DSI_MPPLL_TXDIV0		GENMASK(4, 3)
+#define RG_DSI_MPPLL_TXDIV1		GENMASK(6, 5)
+#define RG_DSI_MPPLL_POSDIV		GENMASK(9, 7)
+#define RG_DSI_MPPLL_DIV_MSK		\
+		(RG_DSI_MPPLL_PREDIV | RG_DSI_MPPLL_TXDIV0 | \
+		 RG_DSI_MPPLL_TXDIV1 | RG_DSI_MPPLL_POSDIV)
 #define RG_DSI_MPPLL_MONVC_EN		BIT(10)
 #define RG_DSI_MPPLL_MONREF_EN		BIT(11)
 #define RG_DSI_MPPLL_VOD_EN		BIT(12)
@@ -70,12 +75,12 @@
 #define RG_DSI_MPPLL_SDM_FRA_EN		BIT(0)
 #define RG_DSI_MPPLL_SDM_SSC_PH_INIT	BIT(1)
 #define RG_DSI_MPPLL_SDM_SSC_EN		BIT(2)
-#define RG_DSI_MPPLL_SDM_SSC_PRD	(0xffff << 16)
+#define RG_DSI_MPPLL_SDM_SSC_PRD	GENMASK(31, 16)
 
 #define MIPITX_DSI_PLL_CON2	0x58
 
 #define MIPITX_DSI_PLL_TOP	0x64
-#define RG_DSI_MPPLL_PRESERVE		(0xff << 8)
+#define RG_DSI_MPPLL_PRESERVE		GENMASK(15, 8)
 
 #define MIPITX_DSI_PLL_PWR	0x68
 #define RG_DSI_MPPLL_SDM_PWR_ON		BIT(0)
-- 
2.18.0


