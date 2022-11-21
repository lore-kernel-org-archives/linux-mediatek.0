Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 469EAC4332F
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Nov 2022 02:11:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PeqfZxLKUnLk1pziaV+m7BIw04gGZPPXIPIo9XSuRwo=; b=4qejkQ8fwYaz0zsN5OWKEzdYzk
	4ReXYOwdq+iDquJrlmp0U0j3DMC3F9o0GIcinEIm3zIYwgshMR9xr05y2U4EA5/Xi61BiO2A+uGgq
	hEHgzDNKZB/c/7ZO3D0V+I8T6X8BFZZD++eNJQRxJbG3iNvxg6MOfHhqI+eKh8ag3gdywhMwpLp03
	siMvzUz+j7wB9spX9+n5wfDNqbDP9Q+DapvQn8NVc6oY7/6Jv3cABALZ50W85JY2xelxy9/zv0z8O
	mTJ3XSQs485gTWJfVbPp5n00SH/BkJLJIMFgWvmwhRVipf8zpN5a1GQEATNB03azkZfZ8C0raq+HI
	X4rHRi6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1owwGu-008Q9v-LK; Mon, 21 Nov 2022 02:10:56 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1owwGs-008Q6e-1c
	for linux-mediatek@lists.infradead.org; Mon, 21 Nov 2022 02:10:55 +0000
X-UUID: 1f066b1f4e074f4d974eec9d0d5d00c6-20221120
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=PeqfZxLKUnLk1pziaV+m7BIw04gGZPPXIPIo9XSuRwo=;
	b=j/61jGu9HbrpVtVJI9mkbDGcnpLPDq4FVmgkz6Yh8iSck3DAt9/WzZron+FJxic3bg8rlFlG0LhJYa1fcgsGnucKAvPHsUiObeWPwdwuzZ8COTtME6Cqr36LynpEHaKfbdTshDEfWPAIUOZN++7grKv5mWSV/VBFfo8kVY3Ti88=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.12,REQID:bfca03e1-8ee5-4b02-95c8-7a4f56166ba6,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:62cd327,CLOUDID:6b5c4f2f-2938-482e-aafd-98d66723b8a9,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 1f066b1f4e074f4d974eec9d0d5d00c6-20221120
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <ryder.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 345778937; Sun, 20 Nov 2022 18:55:30 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Mon, 21 Nov 2022 09:14:52 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Mon, 21 Nov 2022 09:14:52 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, <linux-wireless@vger.kernel.org>
CC: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Shayne Chen
	<shayne.chen@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>,
	<linux-mediatek@lists.infradead.org>, Ryder Lee <ryder.lee@mediatek.com>
Subject: [PATCH v2 1/3] wifi: mt76: mt7915: add basedband Txpower info into debugfs
Date: Mon, 21 Nov 2022 09:14:49 +0800
Message-ID: <939ea87376523dbce05384f412cbbda4bbcb1998.1668992110.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221120_181054_233179_376E9BD2 
X-CRM114-Status: GOOD (  10.27  )
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
 .../wireless/mediatek/mt76/mt7915/debugfs.c    | 18 +++++++++++++++---
 .../net/wireless/mediatek/mt76/mt7915/regs.h   |  4 ++++
 2 files changed, 19 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c b/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c
index 096cb8a4db3d..de06bb6b971b 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c
@@ -967,11 +967,17 @@ mt7915_rate_txpower_show(struct seq_file *file, void *data)
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
+	seq_printf(file, "\nPhy %d\n", phy != &dev->phy);
 
-	seq_printf(file, "\nBand %d\n", phy != &phy->dev->phy);
-	mt7915_mcu_get_txpower_sku(phy, txpower, sizeof(txpower));
 	for (i = 0, buf = txpower; i < ARRAY_SIZE(mt7915_sku_group_len); i++) {
 		u8 mcs_num = mt7915_sku_group_len[i];
 
@@ -982,6 +988,12 @@ mt7915_rate_txpower_show(struct seq_file *file, void *data)
 		buf += mt7915_sku_group_len[i];
 	}
 
+	reg = is_mt7915(&dev->mt76) ? MT_WF_PHY_TPC_CTRL_STAT(phy->band_idx) :
+	      MT_WF_PHY_TPC_CTRL_STAT_MT7916(phy->band_idx);
+	/* Txpower propagation path: TMAC -> TXV -> BBP */
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


