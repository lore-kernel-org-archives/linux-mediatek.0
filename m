Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0E73ECAAD8
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Sep 2022 09:02:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VyahJL+MfWqllq63TY1YFqUJAezoEPsb3Sn9XQWCiVQ=; b=r0eXbUwg01GoehMV/2Laoi3RSR
	++9ZbuobRGyjGW9dVLf2qN7wBU2/+WPBKGdDQrhgYvGa9Kx96/q3PIwh18e/ulYrvJpUOkCLXwqak
	tb+ew6+OSCwwzu7AeiZIndwkmFPVAcp43HfBp/CmA3hbSP2QYB4zDYxB+ksF9c8yn8ym1DlRBhNFN
	sb3aBOY0C6YPZVwB7p9A/eMxrEDyRAE/qXW+Zk7LksUeI4F/kP6PnGQckBSobNb4JAo8gxLWZ6UcU
	H0dhho4ZvMpNWgV7p06DHB6DU+F8yZnOEnJyEjqxMYivEyz81YTR/B//I4drekCCEiSD7izE/GFTD
	IRVViGCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaZ8y-0029Gt-Jn; Tue, 20 Sep 2022 09:02:16 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaZ8H-0028rF-1A; Tue, 20 Sep 2022 09:01:34 +0000
X-UUID: 63ab54ac2ac14f5290cd0235a19b27af-20220920
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=VyahJL+MfWqllq63TY1YFqUJAezoEPsb3Sn9XQWCiVQ=;
	b=troxGkZ0iG/myN5EDF1Br+HavFuAFisWpR4zSTMbuHfDSuQEq4rFAUggTFrKSkpO2P4zIFp3N/0H+yl7zPiG68JecDyRH5IvAnj+bgE7cv2CtoJYswNlH8HU7R4umpVtnRxX9rgJzaT9zbRbNk64jzWseLDUeZXrUSvgvVos77w=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:3fb9c199-d332-4dbe-8658-046e3f7fd43c,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:39a5ff1,CLOUDID:36ed435e-5ed4-4e28-8b00-66ed9f042fbd,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 63ab54ac2ac14f5290cd0235a19b27af-20220920
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 351741511; Tue, 20 Sep 2022 02:01:25 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Tue, 20 Sep 2022 17:00:54 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 20 Sep 2022 17:00:54 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Vinod Koul <vkoul@kernel.org>
CC: Philipp Zabel <p.zabel@pengutronix.de>, Chunfeng Yun
	<chunfeng.yun@mediatek.com>, Kishon Vijay Abraham I <kishon@ti.com>, Matthias
 Brugger <matthias.bgg@gmail.com>, <dri-devel@lists.freedesktop.org>,
	<linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-phy@lists.infradead.org>, <linux-kernel@vger.kernel.org>, Jitao Shi
	<jitao.shi@mediatek.com>, Stanley Chu <stanley.chu@mediatek.com>
Subject: [PATCH 18/18] phy: mediatek: mipi: remove register access helpers
Date: Tue, 20 Sep 2022 17:00:38 +0800
Message-ID: <20220920090038.15133-19-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220920090038.15133-1-chunfeng.yun@mediatek.com>
References: <20220920090038.15133-1-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220920_020133_118436_0BF05260 
X-CRM114-Status: UNSURE (   8.81  )
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

Remove private register access helpers, use the common ones instead.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 drivers/phy/mediatek/phy-mtk-mipi-dsi.c | 24 ------------------------
 drivers/phy/mediatek/phy-mtk-mipi-dsi.h |  5 -----
 2 files changed, 29 deletions(-)

diff --git a/drivers/phy/mediatek/phy-mtk-mipi-dsi.c b/drivers/phy/mediatek/phy-mtk-mipi-dsi.c
index 28506932bd91..cf9c386385bb 100644
--- a/drivers/phy/mediatek/phy-mtk-mipi-dsi.c
+++ b/drivers/phy/mediatek/phy-mtk-mipi-dsi.c
@@ -10,30 +10,6 @@ inline struct mtk_mipi_tx *mtk_mipi_tx_from_clk_hw(struct clk_hw *hw)
 	return container_of(hw, struct mtk_mipi_tx, pll_hw);
 }
 
-void mtk_mipi_tx_clear_bits(struct mtk_mipi_tx *mipi_tx, u32 offset,
-			    u32 bits)
-{
-	u32 temp = readl(mipi_tx->regs + offset);
-
-	writel(temp & ~bits, mipi_tx->regs + offset);
-}
-
-void mtk_mipi_tx_set_bits(struct mtk_mipi_tx *mipi_tx, u32 offset,
-			  u32 bits)
-{
-	u32 temp = readl(mipi_tx->regs + offset);
-
-	writel(temp | bits, mipi_tx->regs + offset);
-}
-
-void mtk_mipi_tx_update_bits(struct mtk_mipi_tx *mipi_tx, u32 offset,
-			     u32 mask, u32 data)
-{
-	u32 temp = readl(mipi_tx->regs + offset);
-
-	writel((temp & ~mask) | (data & mask), mipi_tx->regs + offset);
-}
-
 int mtk_mipi_tx_pll_set_rate(struct clk_hw *hw, unsigned long rate,
 			     unsigned long parent_rate)
 {
diff --git a/drivers/phy/mediatek/phy-mtk-mipi-dsi.h b/drivers/phy/mediatek/phy-mtk-mipi-dsi.h
index c76f07c3fdeb..47b60b1a7226 100644
--- a/drivers/phy/mediatek/phy-mtk-mipi-dsi.h
+++ b/drivers/phy/mediatek/phy-mtk-mipi-dsi.h
@@ -10,7 +10,6 @@
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/delay.h>
-#include <linux/io.h>
 #include <linux/module.h>
 #include <linux/nvmem-consumer.h>
 #include <linux/of_device.h>
@@ -37,10 +36,6 @@ struct mtk_mipi_tx {
 };
 
 struct mtk_mipi_tx *mtk_mipi_tx_from_clk_hw(struct clk_hw *hw);
-void mtk_mipi_tx_clear_bits(struct mtk_mipi_tx *mipi_tx, u32 offset, u32 bits);
-void mtk_mipi_tx_set_bits(struct mtk_mipi_tx *mipi_tx, u32 offset, u32 bits);
-void mtk_mipi_tx_update_bits(struct mtk_mipi_tx *mipi_tx, u32 offset, u32 mask,
-			     u32 data);
 int mtk_mipi_tx_pll_set_rate(struct clk_hw *hw, unsigned long rate,
 			     unsigned long parent_rate);
 unsigned long mtk_mipi_tx_pll_recalc_rate(struct clk_hw *hw,
-- 
2.18.0


