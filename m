Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26D6ACD11DD
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Mar 2024 12:32:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GEHaIKqs77W4BXwuUEFDXtjDpMahA5wIgCAuNm14ng4=; b=4IjNNngLfZgZPa8sBRIk9dQ1nE
	sOfqrlXk7h4W4oOtaPv6A3jwiGMiSWT0T9/Trb9NxXpjKIyK5Q5kpAwA8Q1lT+TPqhNKnQkqoc9wB
	3T8/FNjViqDNoHmGfRsy1eBoCdvgVod4yvZsdBJbJgqpT0MSDsxDClWyFdoYIv8ohBgFIrQNnlYvv
	8h+oeBfV7kAeQcUEAuo0r0F5ugLflkHOQe0oL3NtKOw59fYiBqFRdqeTAHgOnVohKAfWKqkKCOkUQ
	gLR3+DTbQ3t3FDAlXVDBbMgHQE/tOnb/gZuiA8vTfb0D5Ir1bgHdq9Ql/nSY+svWA4p/1+hCG8wXu
	Seohcxpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqBPf-00000000NEP-33Gf;
	Fri, 29 Mar 2024 12:32:51 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqBNy-00000000Mc0-2C2T;
	Fri, 29 Mar 2024 12:31:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E1C776192D;
	Fri, 29 Mar 2024 12:31:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAF5BC433C7;
	Fri, 29 Mar 2024 12:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711715464;
	bh=stxHu6pI1fcoaaqP0eCQiyofsD9mvoGqeUnr0btWNTk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YJP8u4U0kuoOQgZmGQ3q3FWAMdtqOSK22+xrcVYfW4CG2EzUZXTCVa7u1AM5E3+0Y
	 ozZ423FjAjAWpWyKhRJrf3EiDVVu4zxzfCLd41Lv6O6Bc3lfjSHM9K6wtD6yLiNF4v
	 m5ayl7iGAXzrUVPts40xhqxeishzzqCV622dv77f4SKUMfgxi/omABo8gh+9+9iydl
	 wkN137WB3POoonoiP4Y1gnIMF7fhAzNbbGLF7W8YOfzjqpEtDLzUtodZAftkzevjA+
	 w/dcaCf/1V/6QuoBkMLX15PQPkj9gawwyp0sTsxGC1xPgcpupRtim7biqLrjuF256Z
	 rEqShGwhtYEuQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Shayne Chen <shayne.chen@mediatek.com>,
	Felix Fietkau <nbd@nbd.name>,
	Sasha Levin <sashal@kernel.org>,
	lorenzo@kernel.org,
	ryder.lee@mediatek.com,
	kvalo@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	sujuan.chen@mediatek.com,
	Bo.Jiao@mediatek.com,
	leitao@debian.org,
	StanleyYP.Wang@mediatek.com,
	chui-hao.chiu@mediatek.com,
	howard-yh.hsu@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 6.6 31/52] wifi: mt76: mt7996: add locking for accessing mapped registers
Date: Fri, 29 Mar 2024 08:29:01 -0400
Message-ID: <20240329122956.3083859-31-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240329122956.3083859-1-sashal@kernel.org>
References: <20240329122956.3083859-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.23
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240329_053106_833154_69D6E32F 
X-CRM114-Status: GOOD (  13.85  )
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

From: Shayne Chen <shayne.chen@mediatek.com>

[ Upstream commit 3687854d3e7e7fd760d939dd9e5a3520d5ab60fe ]

A race condition was observed when accessing mapped registers, so add
locking to protect against concurrent access.

Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
Signed-off-by: Felix Fietkau <nbd@nbd.name>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../net/wireless/mediatek/mt76/mt7996/mmio.c  | 64 ++++++++++++-------
 .../wireless/mediatek/mt76/mt7996/mt7996.h    |  3 +-
 2 files changed, 43 insertions(+), 24 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mmio.c b/drivers/net/wireless/mediatek/mt76/mt7996/mmio.c
index 3a591a7b47ae6..e75becadc2e54 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mmio.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mmio.c
@@ -82,7 +82,6 @@ static u32 mt7996_reg_map_l1(struct mt7996_dev *dev, u32 addr)
 	u32 offset = FIELD_GET(MT_HIF_REMAP_L1_OFFSET, addr);
 	u32 base = FIELD_GET(MT_HIF_REMAP_L1_BASE, addr);
 
-	dev->reg_l1_backup = dev->bus_ops->rr(&dev->mt76, MT_HIF_REMAP_L1);
 	dev->bus_ops->rmw(&dev->mt76, MT_HIF_REMAP_L1,
 			  MT_HIF_REMAP_L1_MASK,
 			  FIELD_PREP(MT_HIF_REMAP_L1_MASK, base));
@@ -97,7 +96,6 @@ static u32 mt7996_reg_map_l2(struct mt7996_dev *dev, u32 addr)
 	u32 offset = FIELD_GET(MT_HIF_REMAP_L2_OFFSET, addr);
 	u32 base = FIELD_GET(MT_HIF_REMAP_L2_BASE, addr);
 
-	dev->reg_l2_backup = dev->bus_ops->rr(&dev->mt76, MT_HIF_REMAP_L2);
 	dev->bus_ops->rmw(&dev->mt76, MT_HIF_REMAP_L2,
 			  MT_HIF_REMAP_L2_MASK,
 			  FIELD_PREP(MT_HIF_REMAP_L2_MASK, base));
@@ -107,26 +105,10 @@ static u32 mt7996_reg_map_l2(struct mt7996_dev *dev, u32 addr)
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
 
@@ -143,6 +125,11 @@ static u32 __mt7996_reg_addr(struct mt7996_dev *dev, u32 addr)
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
@@ -167,28 +154,60 @@ void mt7996_memcpy_fromio(struct mt7996_dev *dev, void *buf, u32 offset,
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
 
 static int mt7996_mmio_init(struct mt76_dev *mdev,
@@ -200,6 +219,7 @@ static int mt7996_mmio_init(struct mt76_dev *mdev,
 
 	dev = container_of(mdev, struct mt7996_dev, mt76);
 	mt76_mmio_init(&dev->mt76, mem_base);
+	spin_lock_init(&dev->reg_lock);
 
 	switch (device_id) {
 	case 0x7990:
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h b/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
index 7354e5cf8e674..7c374fbc674f3 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mt7996.h
@@ -241,8 +241,7 @@ struct mt7996_dev {
 		u8 n_agrt;
 	} twt;
 
-	u32 reg_l1_backup;
-	u32 reg_l2_backup;
+	spinlock_t reg_lock;
 
 	u8 wtbl_size_group;
 };
-- 
2.43.0


