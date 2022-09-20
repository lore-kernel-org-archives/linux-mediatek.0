Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C683DC54EE9
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Sep 2022 09:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OZ5yWCfCFGj0IW0poLVG9cmmP/rdObK0cz6uy/0pSIs=; b=stnXVzof5nZRl6Kh4BHS3Y33Af
	uumvksV2EaOCUHTntTEbQcIywT8wH+IGQal0ES4ot8ppMUvIzuRNClzwOLOyEQ8SSOI6qJZbXTb3b
	o6qID3yJLsrDLat3OydCGm7QnuBX8iah9jmFk/7vsOZT1p2m03eEevgfq8VyO+HMlwqb2/wdbrjot
	yMFxfqjBcAdWK/Wip7eewWh5jPOyoiX4/mMBoqwrlC5QfO/Y7umZkPxOWe9qH1oirR5Za70lTHOja
	vDQcHRyPdSbGoTp5CZocqzJRQWeAU+e2PlMPuayUIzRJLTZ1Tb/5FAivjeth1HTyIh5ii0BsDQw5N
	Y95xtPsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaZBy-002Axn-1U; Tue, 20 Sep 2022 09:05:22 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaZ8c-0028zl-0x; Tue, 20 Sep 2022 09:01:56 +0000
X-UUID: b94f4ba951804b31b32e77339b54c683-20220920
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=OZ5yWCfCFGj0IW0poLVG9cmmP/rdObK0cz6uy/0pSIs=;
	b=Yos6JtFoouAwMdECVuBOx145NcXRaKvI0/joRVQer+8hcWpoaP9Bo/96NmUJ0bDYDj3QGquEO9jM8Aab42BNNbwk1LQKaw1Ez+ZH03+BcA9oSYfWxQqyS8vyLriSYwJF9YyDlYdHDvcmhk/4OHJ5PLhj/qh5rd8wI9i0Rpv8ep4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:cd6fad84-1164-450e-bfef-79a6f9ade949,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:39a5ff1,CLOUDID:0ef2435e-5ed4-4e28-8b00-66ed9f042fbd,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: b94f4ba951804b31b32e77339b54c683-20220920
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2058200216; Tue, 20 Sep 2022 02:01:48 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Tue, 20 Sep 2022 17:00:51 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 20 Sep 2022 17:00:50 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Vinod Koul <vkoul@kernel.org>
CC: Philipp Zabel <p.zabel@pengutronix.de>, Chunfeng Yun
	<chunfeng.yun@mediatek.com>, Kishon Vijay Abraham I <kishon@ti.com>,
	"Matthias Brugger" <matthias.bgg@gmail.com>,
	<dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-phy@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Jitao Shi <jitao.shi@mediatek.com>, Stanley
 Chu <stanley.chu@mediatek.com>
Subject: [PATCH 14/18] phy: mediatek: mipi: mt8173: use FIELD_PREP to prepare bits field
Date: Tue, 20 Sep 2022 17:00:34 +0800
Message-ID: <20220920090038.15133-15-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220920090038.15133-1-chunfeng.yun@mediatek.com>
References: <20220920090038.15133-1-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220920_020154_168996_DCB4C45A 
X-CRM114-Status: UNSURE (   7.60  )
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

Use FIELD_PREP() macro to prepare bits field value, then no need define
macros of bits offset.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8173.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8173.c b/drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8173.c
index 5c257d67d7be..1e2ad617e8e3 100644
--- a/drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8173.c
+++ b/drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8173.c
@@ -153,15 +153,20 @@ static int mtk_mipi_tx_pll_prepare(struct clk_hw *hw)
 	mtk_mipi_tx_update_bits(mipi_tx, MIPITX_DSI_BG_CON,
 				RG_DSI_VOUT_MSK |
 				RG_DSI_BG_CKEN | RG_DSI_BG_CORE_EN,
-				(4 << 20) | (4 << 17) | (4 << 14) |
-				(4 << 11) | (4 << 8) | (4 << 5) |
+				FIELD_PREP(RG_DSI_V02_SEL, 4) |
+				FIELD_PREP(RG_DSI_V032_SEL, 4) |
+				FIELD_PREP(RG_DSI_V04_SEL, 4) |
+				FIELD_PREP(RG_DSI_V072_SEL, 4) |
+				FIELD_PREP(RG_DSI_V10_SEL, 4) |
+				FIELD_PREP(RG_DSI_V12_SEL, 4) |
 				RG_DSI_BG_CKEN | RG_DSI_BG_CORE_EN);
 
 	usleep_range(30, 100);
 
 	mtk_mipi_tx_update_bits(mipi_tx, MIPITX_DSI_TOP_CON,
 				RG_DSI_LNT_IMP_CAL_CODE | RG_DSI_LNT_HS_BIAS_EN,
-				(8 << 4) | RG_DSI_LNT_HS_BIAS_EN);
+				FIELD_PREP(RG_DSI_LNT_IMP_CAL_CODE, 8) |
+				RG_DSI_LNT_HS_BIAS_EN);
 
 	mtk_mipi_tx_set_bits(mipi_tx, MIPITX_DSI_CON,
 			     RG_DSI_CKG_LDOOUT_EN | RG_DSI_LDOCORE_EN);
@@ -177,7 +182,8 @@ static int mtk_mipi_tx_pll_prepare(struct clk_hw *hw)
 	mtk_mipi_tx_update_bits(mipi_tx, MIPITX_DSI_PLL_CON0,
 				RG_DSI_MPPLL_TXDIV0 | RG_DSI_MPPLL_TXDIV1 |
 				RG_DSI_MPPLL_PREDIV,
-				(txdiv0 << 3) | (txdiv1 << 5));
+				FIELD_PREP(RG_DSI_MPPLL_TXDIV0, txdiv0) |
+				FIELD_PREP(RG_DSI_MPPLL_TXDIV1, txdiv1));
 
 	/*
 	 * PLL PCW config
-- 
2.18.0


