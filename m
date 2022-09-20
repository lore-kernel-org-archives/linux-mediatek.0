Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5FE0ECAAD8
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Sep 2022 09:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VNtpF+pXlyEDUuZOw+4+I8vvd6HvIy7daYhRNlFOdz4=; b=rp61g5EbUxZyVFS03UiFhUlkq7
	MnYZebeupXnlq5AU5ciQbf3q68P+xj59Uc0wGmiUOUczQlciU3SoIY+LwB/28GxV8x5RQ1HYlPjZk
	GCOA3//K13NonvuWmuHFt63rdK5I+2BXRxwSGI7w6bBQJC6nPrHFmcz48VT3ULGx7JkddaiLZGLI0
	hSLKqh/pcSYsDtPuZ14IwZvjAjkkgv4YvH0lkpbNm578NjaagDMqgTNoKMdNou3PeB9LMMt63gJUp
	fq9covtydyZVojgPx7+gu1oe2s0ZAwnmU0v1Djw/HDb1VDu7Yt2xaIMsM8YFmMn+wZdvFkxLFKOW+
	kFs71YjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaZhl-002Tqj-8a; Tue, 20 Sep 2022 09:38:13 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaZb8-002Pzf-76; Tue, 20 Sep 2022 09:31:24 +0000
X-UUID: 23bbfd01694943f496ad1cce54e86646-20220920
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=VNtpF+pXlyEDUuZOw+4+I8vvd6HvIy7daYhRNlFOdz4=;
	b=LMdEYKmS5sJdhigbz3/Sbd02kMQMbNs9f0Y6bqmwIWoTJHXFbi51vw0sQVNnmZW+9bKSb22Cff29hTS5XoM5ck8qdfVFO4TF0pFzlnP+jssJyezryy8Jd2j/qkiXw5jNQtSawT1KNOhFLyq1454c42sLTiyBwEu5e3x51/SyrFw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:bd3010cb-a36e-4a50-87f5-af6c764b5ebb,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:39a5ff1,CLOUDID:6056455e-5ed4-4e28-8b00-66ed9f042fbd,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 23bbfd01694943f496ad1cce54e86646-20220920
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1109363449; Tue, 20 Sep 2022 02:31:18 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Tue, 20 Sep 2022 17:00:44 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 20 Sep 2022 17:00:43 +0800
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Vinod Koul <vkoul@kernel.org>
CC: Philipp Zabel <p.zabel@pengutronix.de>, Chunfeng Yun
	<chunfeng.yun@mediatek.com>, Kishon Vijay Abraham I <kishon@ti.com>, Matthias
 Brugger <matthias.bgg@gmail.com>, <dri-devel@lists.freedesktop.org>,
	<linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-phy@lists.infradead.org>, <linux-kernel@vger.kernel.org>, Jitao Shi
	<jitao.shi@mediatek.com>, Stanley Chu <stanley.chu@mediatek.com>
Subject: [PATCH 05/18] phy: mediatek: pcie: use new helper to update register bits
Date: Tue, 20 Sep 2022 17:00:25 +0800
Message-ID: <20220920090038.15133-6-chunfeng.yun@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220920090038.15133-1-chunfeng.yun@mediatek.com>
References: <20220920090038.15133-1-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220920_023122_954096_3C4384CB 
X-CRM114-Status: UNSURE (   9.84  )
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

The new helper will use FIELD_PREP() macro to prepare bits value
according to mask, then we no need do it anymore.

Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
---
 drivers/phy/mediatek/phy-mtk-pcie.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/phy/mediatek/phy-mtk-pcie.c b/drivers/phy/mediatek/phy-mtk-pcie.c
index 7f29d43442bf..25dbd6e35722 100644
--- a/drivers/phy/mediatek/phy-mtk-pcie.c
+++ b/drivers/phy/mediatek/phy-mtk-pcie.c
@@ -89,14 +89,14 @@ static void mtk_pcie_efuse_set_lane(struct mtk_pcie_phy *pcie_phy,
 	addr = pcie_phy->sif_base + PEXTP_ANA_LN0_TRX_REG +
 	       lane * PEXTP_ANA_LANE_OFFSET;
 
-	mtk_phy_update_bits(addr + PEXTP_ANA_TX_REG, EFUSE_LN_TX_PMOS_SEL,
-			    FIELD_PREP(EFUSE_LN_TX_PMOS_SEL, data->tx_pmos));
+	mtk_phy_update_field(addr + PEXTP_ANA_TX_REG, EFUSE_LN_TX_PMOS_SEL,
+			     data->tx_pmos);
 
-	mtk_phy_update_bits(addr + PEXTP_ANA_TX_REG, EFUSE_LN_TX_NMOS_SEL,
-			    FIELD_PREP(EFUSE_LN_TX_NMOS_SEL, data->tx_nmos));
+	mtk_phy_update_field(addr + PEXTP_ANA_TX_REG, EFUSE_LN_TX_NMOS_SEL,
+			     data->tx_nmos);
 
-	mtk_phy_update_bits(addr + PEXTP_ANA_RX_REG, EFUSE_LN_RX_SEL,
-			    FIELD_PREP(EFUSE_LN_RX_SEL, data->rx_data));
+	mtk_phy_update_field(addr + PEXTP_ANA_RX_REG, EFUSE_LN_RX_SEL,
+			     data->rx_data);
 }
 
 /**
@@ -116,9 +116,8 @@ static int mtk_pcie_phy_init(struct phy *phy)
 		return 0;
 
 	/* Set global data */
-	mtk_phy_update_bits(pcie_phy->sif_base + PEXTP_ANA_GLB_00_REG,
-			    EFUSE_GLB_INTR_SEL,
-			    FIELD_PREP(EFUSE_GLB_INTR_SEL, pcie_phy->efuse_glb_intr));
+	mtk_phy_update_field(pcie_phy->sif_base + PEXTP_ANA_GLB_00_REG,
+			     EFUSE_GLB_INTR_SEL, pcie_phy->efuse_glb_intr);
 
 	for (i = 0; i < pcie_phy->data->num_lanes; i++)
 		mtk_pcie_efuse_set_lane(pcie_phy, i);
-- 
2.18.0


