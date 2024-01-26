Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9685FC47422
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Jan 2024 09:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K0zyQKV5np2tMpTf/XlhiaVAYdwVNvNwKoQ+98xgoIM=; b=yGjYj2vctsf9i0hw6jjaUPgvPT
	TEsWXHokFhWmtM+LIipNF7IJWiC5t5IJC39IkzesPhOalbY7UhJdF0xK07ZHGqnrS3RwmQkutenUQ
	7JjqJifnxV1hUwd1i8tDDmCJcjiKSWtQvDx/ZCTqEvpOF+yHBqzUK0756T6IB4V0soyLgGa1TUHfb
	TmQPOnX9+kxF0Mo59ecGFgf4AnggMDc2b2e12YpN/sHgUy9Q4QwyjQYeVaPqiZqRoD0Ppg5QvmMAG
	70DmB61cU3mpOPNepjtKIKmAm7TJsEj5DVhUADUBKquNxI46TN3eJ3GDGTgCdW52yTyFzXzLNbXcM
	ZRLvZUJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTIEP-00000003aKK-0Wry;
	Fri, 26 Jan 2024 09:10:37 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTIEJ-00000003aEz-1yyS
	for linux-mediatek@lists.infradead.org;
	Fri, 26 Jan 2024 09:10:33 +0000
X-UUID: be5bd836bc2a11eea0bf134e88e6c2dc-20240126
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=K0zyQKV5np2tMpTf/XlhiaVAYdwVNvNwKoQ+98xgoIM=;
	b=Ux2gKJegJFNeZNkMilxoIwEBb1vNOol7V9G4TmlgVawsPlWa1d8Rv+NmhYn4D+vc0IucwvRKQy9DG1MsX25KujVh9OGYticfroJKIDmqGpeOu2SCmBrv5XlnTkZjoykObuX/RekivnP4GjxMZeoOXI3IyOM6zF/uYNJEWxuw/68=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.36,REQID:3667045c-2fb8-4acb-b851-ef120e56fd38,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6e16cf4,CLOUDID:42712efe-c16b-4159-a099-3b9d0558e447,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: be5bd836bc2a11eea0bf134e88e6c2dc-20240126
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <shayne.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1674056432; Fri, 26 Jan 2024 02:10:26 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 26 Jan 2024 17:09:50 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 26 Jan 2024 17:09:50 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
	<lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, Bo Jiao <Bo.Jiao@mediatek.com>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Shayne Chen <shayne.chen@mediatek.com>
Subject: [PATCH v2 10/12] wifi: mt76: mt7996: add locking for accessing mapped registers
Date: Fri, 26 Jan 2024 17:09:21 +0800
Message-ID: <20240126090923.6357-10-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240126090923.6357-1-shayne.chen@mediatek.com>
References: <20240126090923.6357-1-shayne.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--9.791100-8.000000
X-TMASE-MatchedRID: Pm0cQ+UdRa9viLFHxu+T9lz+axQLnAVBAG+WI8pfMRyBvwVs6Ueu3f9T
	oIqmlx19NJnt9TW/xwZX/sAhRmSCr+n7m7FfgPpP58dk5sbwmyhn+sA9+u1YLeL4oTiN0TCSa0I
	EkYOsokWrpyd+FagFheJu2PkJnsuuVCFefQRV3M4MH4SsGvRsAxQ6eQlzLFS/myiLZetSf8mfop
	0ytGwvXiq2rl3dzGQ1v22/FeMyuDroTQsmeDrbRRsVLzKdHV/H+TwjD08A0l8knmI4tbJ6pg==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--9.791100-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 2B8A9F85DB1A6F7693A2F3E9514F1324807B3C234BAFD76E36D086414A2CA4F42000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240126_011031_782548_1155EFF9 
X-CRM114-Status: GOOD (  13.69  )
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

A race condition was observed when accessing mapped registers, so add
locking to protect against concurrent access.

Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7996/mmio.c  | 64 ++++++++++++-------
 .../wireless/mediatek/mt76/mt7996/mt7996.h    |  3 +-
 2 files changed, 43 insertions(+), 24 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mmio.c b/drivers/net/wireless/mediatek/mt76/mt7996/mmio.c
index c50d89a445e9..ff6a335e1fa7 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mmio.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mmio.c
@@ -140,7 +140,6 @@ static u32 mt7996_reg_map_l1(struct mt7996_dev *dev, u32 addr)
 	u32 offset = FIELD_GET(MT_HIF_REMAP_L1_OFFSET, addr);
 	u32 base = FIELD_GET(MT_HIF_REMAP_L1_BASE, addr);
 
-	dev->reg_l1_backup = dev->bus_ops->rr(&dev->mt76, MT_HIF_REMAP_L1);
 	dev->bus_ops->rmw(&dev->mt76, MT_HIF_REMAP_L1,
 			  MT_HIF_REMAP_L1_MASK,
 			  FIELD_PREP(MT_HIF_REMAP_L1_MASK, base));
@@ -155,7 +154,6 @@ static u32 mt7996_reg_map_l2(struct mt7996_dev *dev, u32 addr)
 	u32 offset = FIELD_GET(MT_HIF_REMAP_L2_OFFSET, addr);
 	u32 base = FIELD_GET(MT_HIF_REMAP_L2_BASE, addr);
 
-	dev->reg_l2_backup = dev->bus_ops->rr(&dev->mt76, MT_HIF_REMAP_L2);
 	dev->bus_ops->rmw(&dev->mt76, MT_HIF_REMAP_L2,
 			  MT_HIF_REMAP_L2_MASK,
 			  FIELD_PREP(MT_HIF_REMAP_L2_MASK, base));
@@ -165,26 +163,10 @@ static u32 mt7996_reg_map_l2(struct mt7996_dev *dev, u32 addr)
 	return MT_HIF_REMAP_BASE_L2 + offset;
 }
 
-static void mt7996_reg_remap_restore(struct mt7996_dev *dev)
-{
-	/* remap to ori status */
-	if (unlikely(dev->reg_l1_backup)) {
-		dev->bus_ops->wr(&dev->mt76, MT_HIF_REMAP_L1, dev->reg_l1_backup);
-		dev->reg_l1_backup = 0;
-	}
-
-	if (dev->reg_l2_backup) {
-		dev->bus_ops->wr(&dev->mt76, MT_HIF_REMAP_L2, dev->reg_l2_backup);
-		dev->reg_l2_backup = 0;
-	}
-}
-
 static u32 __mt7996_reg_addr(struct mt7996_dev *dev, u32 addr)
 {
 	int i;
 
-	mt7996_reg_remap_restore(dev);
-
 	if (addr < 0x100000)
 		return addr;
 
@@ -201,6 +183,11 @@ static u32 __mt7996_reg_addr(struct mt7996_dev *dev, u32 addr)
 		return dev->reg.map[i].mapped + ofs;
 	}
 
+	return 0;
+}
+
+static u32 __mt7996_reg_remap_addr(struct mt7996_dev *dev, u32 addr)
+{
 	if ((addr >= MT_INFRA_BASE && addr < MT_WFSYS0_PHY_START) ||
 	    (addr >= MT_WFSYS0_PHY_START && addr < MT_WFSYS1_PHY_START) ||
 	    (addr >= MT_WFSYS1_PHY_START && addr <= MT_WFSYS1_PHY_END))
@@ -225,28 +212,60 @@ void mt7996_memcpy_fromio(struct mt7996_dev *dev, void *buf, u32 offset,
 {
 	u32 addr = __mt7996_reg_addr(dev, offset);
 
-	memcpy_fromio(buf, dev->mt76.mmio.regs + addr, len);
+	if (addr) {
+		memcpy_fromio(buf, dev->mt76.mmio.regs + addr, len);
+		return;
+	}
+
+	spin_lock_bh(&dev->reg_lock);
+	memcpy_fromio(buf, dev->mt76.mmio.regs +
+			   __mt7996_reg_remap_addr(dev, offset), len);
+	spin_unlock_bh(&dev->reg_lock);
 }
 
 static u32 mt7996_rr(struct mt76_dev *mdev, u32 offset)
 {
 	struct mt7996_dev *dev = container_of(mdev, struct mt7996_dev, mt76);
+	u32 addr = __mt7996_reg_addr(dev, offset), val;
+
+	if (addr)
+		return dev->bus_ops->rr(mdev, addr);
 
-	return dev->bus_ops->rr(mdev, __mt7996_reg_addr(dev, offset));
+	spin_lock_bh(&dev->reg_lock);
+	val = dev->bus_ops->rr(mdev, __mt7996_reg_remap_addr(dev, offset));
+	spin_unlock_bh(&dev->reg_lock);
+
+	return val;
 }
 
 static void mt7996_wr(struct mt76_dev *mdev, u32 offset, u32 val)
 {
 	struct mt7996_dev *dev = container_of(mdev, struct mt7996_dev, mt76);
+	u32 addr = __mt7996_reg_addr(dev, offset);
 
-	dev->bus_ops->wr(mdev, __mt7996_reg_addr(dev, offset), val);
+	if (addr) {
+		dev->bus_ops->wr(mdev, addr, val);
+		return;
+	}
+
+	spin_lock_bh(&dev->reg_lock);
+	dev->bus_ops->wr(mdev, __mt7996_reg_remap_addr(dev, offset), val);
+	spin_unlock_bh(&dev->reg_lock);
 }
 
 static u32 mt7996_rmw(struct mt76_dev *mdev, u32 offset, u32 mask, u32 val)
 {
 	struct mt7996_dev *dev = container_of(mdev, struct mt7996_dev, mt76);
+	u32 addr = __mt7996_reg_addr(dev, offset);
+
+	if (addr)
+		return dev->bus_ops->rmw(mdev, addr, mask, val);
+
+	spin_lock_bh(&dev->reg_lock);
+	val = dev->bus_ops->rmw(mdev, __mt7996_reg_remap_addr(dev, offset), mask, val);
+	spin_unlock_bh(&dev->reg_lock);
 
-	return dev->bus_ops->rmw(mdev, __mt7996_reg_addr(dev, offset), mask, val);
+	return val;
 }
 
 #ifdef CONFIG_NET_MEDIATEK_SOC_WED
@@ -421,6 +440,7 @@ static int mt7996_mmio_init(struct mt76_dev *mdev,
 
 	dev = container_of(mdev, struct mt7996_dev, mt76);
 	mt76_mmio_init(&dev->mt76, mem_base);
+	spin_lock_init(&dev->reg_lock);
 
 	switch (device_id) {
 	case 0x7990:
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h b/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
index 8154ad37827f..36d1f247d55a 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
@@ -325,8 +325,7 @@ struct mt7996_dev {
 		u8 n_agrt;
 	} twt;
 
-	u32 reg_l1_backup;
-	u32 reg_l2_backup;
+	spinlock_t reg_lock;
 
 	u8 wtbl_size_group;
 };
-- 
2.39.2


