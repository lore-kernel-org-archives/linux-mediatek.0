Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73D65C001E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Oct 2023 15:42:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=stmi25xuVDzWXRhvXZrk+UdqX0tsHpkAhcr5H2PGC9A=; b=KGxsxnPyZoFOiCmIVgvBZrAS2q
	nGE21FalpsiZCK6OKNNaDEpcf0tiwCfkLOdkmDmY7mcLVIcTkbvsPcxpoTMLRdigpcAh78f1ZiK+V
	Kew7GJSQ/yVN6FsMVbB8RdbyvE78PH+oR6q1ku6xYiwntUF19qrzz5DyrW94pnpTwK0g6WI8wNHto
	ttlLfd3/cw+BbM2wS7I8PecNp4NxIwr6km7p8E4SqPRtSxANrTEa5YV4tkkBzX7SRfYH3clhbVGA0
	6dwONrzqkBfeZN3FOoXfXYJza0e53IejS8y38nk+gk+HaFRUiDeOkHqId4wTo1EgsO21yB96Yn1hc
	B5vdxD1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qux4n-007ied-17;
	Mon, 23 Oct 2023 15:42:45 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qux4i-007idG-0E
	for linux-mediatek@lists.infradead.org;
	Mon, 23 Oct 2023 15:42:41 +0000
X-UUID: c94cc23871ba11ee9b7791016c24628a-20231023
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=stmi25xuVDzWXRhvXZrk+UdqX0tsHpkAhcr5H2PGC9A=;
	b=dEwdPB8uMJDn5h3Q18ySuA68j8ESzD0FBZyunXnuWB0iU6Kz7seSQmwubHnJCyPegkCDFY1Y1O64jc6NgClHFgosFHKZys6n4m4IheZopn/rPlJUZQCIrcOyqy9TMfMJur9YzyPH1rMajDrTwnlNHQIJa61LihJxWwRHUPPulxA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32,REQID:a8895c4a-bb58-47eb-ba79-c644d1a9df46,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:5f78ec9,CLOUDID:d2ac37d7-04a0-4e50-8742-3543eab8cb8e,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: c94cc23871ba11ee9b7791016c24628a-20231023
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <shayne.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1011467824; Mon, 23 Oct 2023 08:42:35 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 23 Oct 2023 23:41:59 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 23 Oct 2023 23:41:59 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
	<lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, Bo Jiao <Bo.Jiao@mediatek.com>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Peter Chiu
	<chui-hao.chiu@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>
Subject: [PATCH 07/11] wifi: mt76: mt7996: adjust WFDMA settings to improve performance
Date: Mon, 23 Oct 2023 23:38:50 +0800
Message-ID: <20231023153854.10708-7-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20231023153854.10708-1-shayne.chen@mediatek.com>
References: <20231023153854.10708-1-shayne.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231023_084240_115103_CCA5B120 
X-CRM114-Status: GOOD (  11.61  )
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

From: Peter Chiu <chui-hao.chiu@mediatek.com>

Refactor and update dma prefetch parts and also split band 1 traffic to
PCIe 1 to enhance throughput.

Signed-off-by: Peter Chiu <chui-hao.chiu@mediatek.com>
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7996/dma.c   | 70 +++++++++++++------
 .../net/wireless/mediatek/mt76/mt7996/regs.h  |  9 +++
 2 files changed, 58 insertions(+), 21 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/dma.c b/drivers/net/wireless/mediatek/mt76/mt7996/dma.c
index 373cc84893d6..3514f395a017 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/dma.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/dma.c
@@ -99,38 +99,49 @@ static void mt7996_dma_config(struct mt7996_dev *dev)
 	MCUQ_CONFIG(MT_MCUQ_FWDL, WFDMA0, MT_INT_TX_DONE_FWDL, MT7996_TXQ_FWDL);
 }
 
+static u32 __mt7996_dma_prefetch_base(u16 *base, u8 depth)
+{
+	u32 ret = *base << 16 | depth;
+
+	*base = *base + (depth << 4);
+
+	return ret;
+}
+
 static void __mt7996_dma_prefetch(struct mt7996_dev *dev, u32 ofs)
 {
-#define PREFETCH(_base, _depth)	((_base) << 16 | (_depth))
+	u16 base = 0;
+
+#define PREFETCH(_depth)	(__mt7996_dma_prefetch_base(&base, (_depth)))
 	/* prefetch SRAM wrapping boundary for tx/rx ring. */
-	mt76_wr(dev, MT_MCUQ_EXT_CTRL(MT_MCUQ_FWDL) + ofs, PREFETCH(0x0, 0x2));
-	mt76_wr(dev, MT_MCUQ_EXT_CTRL(MT_MCUQ_WM) + ofs, PREFETCH(0x20, 0x2));
-	mt76_wr(dev, MT_TXQ_EXT_CTRL(0) + ofs, PREFETCH(0x40, 0x4));
-	mt76_wr(dev, MT_TXQ_EXT_CTRL(1) + ofs, PREFETCH(0x80, 0x4));
-	mt76_wr(dev, MT_MCUQ_EXT_CTRL(MT_MCUQ_WA) + ofs, PREFETCH(0xc0, 0x2));
-	mt76_wr(dev, MT_TXQ_EXT_CTRL(2) + ofs, PREFETCH(0xe0, 0x4));
-	mt76_wr(dev, MT_RXQ_BAND1_CTRL(MT_RXQ_MCU) + ofs, PREFETCH(0x120, 0x2));
-	mt76_wr(dev, MT_RXQ_BAND1_CTRL(MT_RXQ_MCU_WA) + ofs, PREFETCH(0x140, 0x2));
-	mt76_wr(dev, MT_RXQ_BAND1_CTRL(MT_RXQ_MAIN_WA) + ofs, PREFETCH(0x160, 0x2));
-	mt76_wr(dev, MT_RXQ_BAND1_CTRL(MT_RXQ_BAND2_WA) + ofs, PREFETCH(0x180, 0x2));
-	mt76_wr(dev, MT_RXQ_BAND1_CTRL(MT_RXQ_MAIN) + ofs, PREFETCH(0x1a0, 0x10));
-	mt76_wr(dev, MT_RXQ_BAND1_CTRL(MT_RXQ_BAND2) + ofs, PREFETCH(0x2a0, 0x10));
+	mt76_wr(dev, MT_MCUQ_EXT_CTRL(MT_MCUQ_FWDL) + ofs, PREFETCH(0x2));
+	mt76_wr(dev, MT_MCUQ_EXT_CTRL(MT_MCUQ_WM) + ofs, PREFETCH(0x2));
+	mt76_wr(dev, MT_TXQ_EXT_CTRL(0) + ofs, PREFETCH(0x8));
+	mt76_wr(dev, MT_TXQ_EXT_CTRL(1) + ofs, PREFETCH(0x8));
+	mt76_wr(dev, MT_MCUQ_EXT_CTRL(MT_MCUQ_WA) + ofs, PREFETCH(0x2));
+	mt76_wr(dev, MT_TXQ_EXT_CTRL(2) + ofs, PREFETCH(0x8));
+	mt76_wr(dev, MT_RXQ_BAND1_CTRL(MT_RXQ_MCU) + ofs, PREFETCH(0x2));
+	mt76_wr(dev, MT_RXQ_BAND1_CTRL(MT_RXQ_MCU_WA) + ofs, PREFETCH(0x2));
+	mt76_wr(dev, MT_RXQ_BAND1_CTRL(MT_RXQ_MAIN_WA) + ofs, PREFETCH(0x2));
+	mt76_wr(dev, MT_RXQ_BAND1_CTRL(MT_RXQ_BAND2_WA) + ofs, PREFETCH(0x2));
+	mt76_wr(dev, MT_RXQ_BAND1_CTRL(MT_RXQ_MAIN) + ofs, PREFETCH(0x10));
+	mt76_wr(dev, MT_RXQ_BAND1_CTRL(MT_RXQ_BAND2) + ofs, PREFETCH(0x10));
 
 	if (dev->has_rro) {
 		mt76_wr(dev, MT_RXQ_BAND1_CTRL(MT_RXQ_RRO_BAND0) + ofs,
-			PREFETCH(0x3a0, 0x10));
+			PREFETCH(0x10));
 		mt76_wr(dev, MT_RXQ_BAND1_CTRL(MT_RXQ_RRO_BAND2) + ofs,
-			PREFETCH(0x4a0, 0x10));
+			PREFETCH(0x10));
 		mt76_wr(dev, MT_RXQ_BAND1_CTRL(MT_RXQ_MSDU_PAGE_BAND0) + ofs,
-			PREFETCH(0x5a0, 0x4));
+			PREFETCH(0x4));
 		mt76_wr(dev, MT_RXQ_BAND1_CTRL(MT_RXQ_MSDU_PAGE_BAND1) + ofs,
-			PREFETCH(0x5e0, 0x4));
+			PREFETCH(0x4));
 		mt76_wr(dev, MT_RXQ_BAND1_CTRL(MT_RXQ_MSDU_PAGE_BAND2) + ofs,
-			PREFETCH(0x620, 0x4));
+			PREFETCH(0x4));
 		mt76_wr(dev, MT_RXQ_BAND1_CTRL(MT_RXQ_TXFREE_BAND0) + ofs,
-			PREFETCH(0x660, 0x4));
+			PREFETCH(0x4));
 		mt76_wr(dev, MT_RXQ_BAND1_CTRL(MT_RXQ_TXFREE_BAND2) + ofs,
-			PREFETCH(0x6a0, 0x4));
+			PREFETCH(0x4));
 	}
 #undef PREFETCH
 
@@ -295,6 +306,12 @@ static void mt7996_dma_enable(struct mt7996_dev *dev, bool reset)
 	mt76_set(dev, WF_WFDMA0_GLO_CFG_EXT1,
 		 WF_WFDMA0_GLO_CFG_EXT1_TX_FCTRL_MODE);
 
+	/* WFDMA rx threshold */
+	mt76_wr(dev, MT_WFDMA0_PAUSE_RX_Q_45_TH, 0xc000c);
+	mt76_wr(dev, MT_WFDMA0_PAUSE_RX_Q_67_TH, 0x10008);
+	mt76_wr(dev, MT_WFDMA0_PAUSE_RX_Q_89_TH, 0x10008);
+	mt76_wr(dev, MT_WFDMA0_PAUSE_RX_Q_RRO_TH, 0x20);
+
 	if (dev->hif2) {
 		/* GLO_CFG_EXT0 */
 		mt76_set(dev, WF_WFDMA0_GLO_CFG_EXT0 + hif1_ofs,
@@ -306,7 +323,18 @@ static void mt7996_dma_enable(struct mt7996_dev *dev, bool reset)
 			 WF_WFDMA0_GLO_CFG_EXT1_TX_FCTRL_MODE);
 
 		mt76_set(dev, MT_WFDMA_HOST_CONFIG,
-			 MT_WFDMA_HOST_CONFIG_PDMA_BAND);
+			 MT_WFDMA_HOST_CONFIG_PDMA_BAND |
+			 MT_WFDMA_HOST_CONFIG_BAND2_PCIE1);
+
+		/* AXI read outstanding number */
+		mt76_rmw(dev, MT_WFDMA_AXI_R2A_CTRL,
+			 MT_WFDMA_AXI_R2A_CTRL_OUTSTAND_MASK, 0x14);
+
+		/* WFDMA rx threshold */
+		mt76_wr(dev, MT_WFDMA0_PAUSE_RX_Q_45_TH + hif1_ofs, 0xc000c);
+		mt76_wr(dev, MT_WFDMA0_PAUSE_RX_Q_67_TH + hif1_ofs, 0x10008);
+		mt76_wr(dev, MT_WFDMA0_PAUSE_RX_Q_89_TH + hif1_ofs, 0x10008);
+		mt76_wr(dev, MT_WFDMA0_PAUSE_RX_Q_RRO_TH + hif1_ofs, 0x20);
 	}
 
 	if (dev->hif2) {
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/regs.h b/drivers/net/wireless/mediatek/mt76/mt7996/regs.h
index e9edba830aff..6102df912741 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/regs.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/regs.h
@@ -379,6 +379,11 @@ enum base_rev {
 #define MT_WFDMA0_GLO_CFG_OMIT_RX_INFO		BIT(27)
 #define MT_WFDMA0_GLO_CFG_OMIT_RX_INFO_PFET2	BIT(21)
 
+#define MT_WFDMA0_PAUSE_RX_Q_45_TH		MT_WFDMA0(0x268)
+#define MT_WFDMA0_PAUSE_RX_Q_67_TH		MT_WFDMA0(0x26c)
+#define MT_WFDMA0_PAUSE_RX_Q_89_TH		MT_WFDMA0(0x270)
+#define MT_WFDMA0_PAUSE_RX_Q_RRO_TH		MT_WFDMA0(0x27c)
+
 #define WF_WFDMA0_GLO_CFG_EXT0			MT_WFDMA0(0x2b0)
 #define WF_WFDMA0_GLO_CFG_EXT0_RX_WB_RXD	BIT(18)
 #define WF_WFDMA0_GLO_CFG_EXT0_WED_MERGE_MODE	BIT(14)
@@ -401,10 +406,14 @@ enum base_rev {
 
 #define MT_WFDMA_HOST_CONFIG			MT_WFDMA_EXT_CSR(0x30)
 #define MT_WFDMA_HOST_CONFIG_PDMA_BAND		BIT(0)
+#define MT_WFDMA_HOST_CONFIG_BAND2_PCIE1	BIT(22)
 
 #define MT_WFDMA_EXT_CSR_HIF_MISC		MT_WFDMA_EXT_CSR(0x44)
 #define MT_WFDMA_EXT_CSR_HIF_MISC_BUSY		BIT(0)
 
+#define MT_WFDMA_AXI_R2A_CTRL			MT_WFDMA_EXT_CSR(0x500)
+#define MT_WFDMA_AXI_R2A_CTRL_OUTSTAND_MASK	GENMASK(4, 0)
+
 #define MT_PCIE_RECOG_ID			0xd7090
 #define MT_PCIE_RECOG_ID_MASK			GENMASK(30, 0)
 #define MT_PCIE_RECOG_ID_SEM			BIT(31)
-- 
2.39.2


