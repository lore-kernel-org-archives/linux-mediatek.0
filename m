Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05EDFC4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Nov 2022 08:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VV4GF9zrWU8gBAwS33wonuL3SQpN8NvUflDSStA3bDU=; b=OyQC5/paO+SbC1JHYzQKL89YH+
	GfXoEbRGKFKLhLetwFTs1er+rtKk6c+bC/kEFV3HdTdAce8JDjFmUa7VV2ScA6XqS1fCgTwVFB+hB
	ODjzsEzj0YYzdrpEb9KnDOr2EKUHQ7SVCZT8kv51A4kam7zhqTPSMREw5RlMxjEtJ85wxmchLFPmY
	zRHRomes2eWmX3C0WNDr3F9ROmNbLze7veefNFYzkV9GI1W5C36+YMdiSf83VeoVLWpffz1p6W1y3
	8zdGxeW+uE9rfqmpP5WieI2PHLoPkZoiZSfssGpGHlET4h2390PAtr8F0Q5h1mqtnLPAs4LKwuyPY
	o2bZYP7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxOG3-00638x-Fq; Tue, 22 Nov 2022 08:03:55 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxOG1-00635b-2j
	for linux-mediatek@lists.infradead.org; Tue, 22 Nov 2022 08:03:54 +0000
X-UUID: 45c2e3876f504125a48ec739cbb786e2-20221122
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=VV4GF9zrWU8gBAwS33wonuL3SQpN8NvUflDSStA3bDU=;
	b=gvpZmsuBdWALj0gzCn2v/9QPl0sQDcPtM3F6P2Sh2x5GVm6qWs50fjhlsF60Z/2dcBjzQyPCQ8hYvuqUFKaOoUX5IpGo4+1/PiKeHlF5ZTsF2zSd9j0M/NEb4GrJae6mWzz1ApG8+/Fvt5wVEe31pPx2+MpNqd6OyWDS7mgk/CU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.12,REQID:ecdd20f7-84f3-42ca-8e9b-bf840dccb46d,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:62cd327,CLOUDID:b4d1f5f8-3a34-4838-abcf-dfedf9dd068e,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 45c2e3876f504125a48ec739cbb786e2-20221122
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <ryder.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 336369022; Tue, 22 Nov 2022 01:03:47 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Tue, 22 Nov 2022 15:53:13 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Tue, 22 Nov 2022 15:53:13 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, <linux-wireless@vger.kernel.org>
CC: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Shayne Chen
	<shayne.chen@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>,
	<linux-mediatek@lists.infradead.org>, Ryder Lee <ryder.lee@mediatek.com>
Subject: [PATCH v3 1/3] wifi: mt76: mt7915: add basedband Txpower info into debugfs
Date: Tue, 22 Nov 2022 15:53:10 +0800
Message-ID: <b8a621999a1b5171e031c2a207965976fbc793f0.1669097067.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221122_000353_190492_CAA627D6 
X-CRM114-Status: GOOD (  10.92  )
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

This helps user to debug Txpower propagation path easily.

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
change since v2: fix phy1 offset
---
 .../wireless/mediatek/mt76/mt7915/debugfs.c   | 19 ++++++++++++++++---
 .../net/wireless/mediatek/mt76/mt7915/regs.h  |  4 ++++
 2 files changed, 20 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c b/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c
index 096cb8a4db3d..c322fcc19d67 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c
@@ -967,11 +967,18 @@ mt7915_rate_txpower_show(struct seq_file *file, void *data)
 		"RU484/SU40", "RU996/SU80", "RU2x996/SU160"
 	};
 	struct mt7915_phy *phy = file->private;
+	struct mt7915_dev *dev = phy->dev;
 	s8 txpower[MT7915_SKU_RATE_NUM], *buf;
-	int i;
+	u32 reg;
+	int i, ret;
+
+	ret = mt7915_mcu_get_txpower_sku(phy, txpower, sizeof(txpower));
+	if (ret)
+		return ret;
+
+	/* Txpower propagation path: TMAC -> TXV -> BBP */
+	seq_printf(file, "\nPhy %d\n", phy != &dev->phy);
 
-	seq_printf(file, "\nBand %d\n", phy != &phy->dev->phy);
-	mt7915_mcu_get_txpower_sku(phy, txpower, sizeof(txpower));
 	for (i = 0, buf = txpower; i < ARRAY_SIZE(mt7915_sku_group_len); i++) {
 		u8 mcs_num = mt7915_sku_group_len[i];
 
@@ -982,6 +989,12 @@ mt7915_rate_txpower_show(struct seq_file *file, void *data)
 		buf += mt7915_sku_group_len[i];
 	}
 
+	reg = is_mt7915(&dev->mt76) ? MT_WF_PHY_TPC_CTRL_STAT(phy->band_idx) :
+	      MT_WF_PHY_TPC_CTRL_STAT_MT7916(phy->band_idx);
+
+	seq_printf(file, "\nBaseband transmit power %ld\n",
+		   mt76_get_field(dev, reg, MT_WF_PHY_TPC_POWER));
+
 	return 0;
 }
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/regs.h b/drivers/net/wireless/mediatek/mt76/mt7915/regs.h
index 0c61f1256f3b..5f8e728f048b 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/regs.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/regs.h
@@ -1179,6 +1179,10 @@ enum offs_rev {
 #define MT_WF_PHY_RXTD12_IRPI_SW_CLR_ONLY	BIT(18)
 #define MT_WF_PHY_RXTD12_IRPI_SW_CLR		BIT(29)
 
+#define MT_WF_PHY_TPC_CTRL_STAT(_phy)		MT_WF_PHY(0xe7a0 + ((_phy) << 16))
+#define MT_WF_PHY_TPC_CTRL_STAT_MT7916(_phy)	MT_WF_PHY(0xe7a0 + ((_phy) << 20))
+#define MT_WF_PHY_TPC_POWER			GENMASK(15, 8)
+
 #define MT_MCU_WM_CIRQ_BASE			0x89010000
 #define MT_MCU_WM_CIRQ(ofs)			(MT_MCU_WM_CIRQ_BASE + (ofs))
 #define MT_MCU_WM_CIRQ_IRQ_MASK_CLR_ADDR	MT_MCU_WM_CIRQ(0x80)
-- 
2.36.1


