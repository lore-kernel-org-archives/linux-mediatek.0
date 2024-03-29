Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D90ECD11DD
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Mar 2024 12:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mkzFSdmyYqskLIZ0S9WWjOt47OQph/TAQ/I4qb81N88=; b=GMoUqnyO2wzHNu6sIRkyRrRSKg
	U1Z98EmvsYuSBBrtHJE2xyCFz0e0kiq0XcoPcedcR5jvJNYrVJMHPKhNIwYOBjeqpbCL2QqbHAI3A
	XaxuhV9ucqe9Zyc/zEhziq/tm6vNJlLLENv7cqU1/pJadWC/12a+poZfVO8cDmBNZ7T/QSmZryqW8
	b3yqTfRGQ/XS7Z/qMHCoQ+ill6oKpEx+XGCCveJj61gMMdSvAADfRjbRJ8VZn16fFDvCRL18L6Zy+
	mnPsSFMI05DFGNOCtv9TkwvnTDQuzONonPvkxkhTNDqtSTJPcErPTi2Cv3PZl/oLdYHhqah8ymUon
	XBhpSQJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqBLi-00000000LFc-3g6E;
	Fri, 29 Mar 2024 12:28:46 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqBLJ-00000000Kug-16Pv;
	Fri, 29 Mar 2024 12:28:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 8280BCE2F8C;
	Fri, 29 Mar 2024 12:28:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F707C43390;
	Fri, 29 Mar 2024 12:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711715299;
	bh=fldpuLXo2p6gttLzplunPpMyuUgrKzCch/ucIDryDqo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OTjrGJ/dcu3D0iSh92g0sYMOw2N6DzYovI6TYp3kV6eTatI9mtwHawTghUrlBCN7p
	 dEKhhKCNGuOV5qragIHi0jzsZT2wMCduw6NIB+4PU/YV5XIyL7j0feJNe+b0tzhqW+
	 5BGr5aANMa297RKeoR4SR9qRFuKrhpmyjRE3Hhpqcy2f7DRXcm8tPZ0S7qdofNL+VB
	 KcQ7Etm44P4Koiz+KmX7YviAzKoPWb+OTY9nZuUtTeg5zw6VNglfhy5UmbxAQnIV4p
	 rqpeB+hC2+qTr4ZOk2cqFSkK9cwDWJq2g0HbRfc/f2QoHEDIL3dgm7yIB+kXvB6Zd7
	 BnYyLsh5CxfJQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Shayne Chen <shayne.chen@mediatek.com>,
	Peter Chiu <chui-hao.chiu@mediatek.com>,
	Felix Fietkau <nbd@nbd.name>,
	Sasha Levin <sashal@kernel.org>,
	lorenzo@kernel.org,
	ryder.lee@mediatek.com,
	kvalo@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	sujuan.chen@mediatek.com,
	leitao@debian.org,
	lynxis@fe80.eu,
	meichia.chiu@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 6.8 42/68] wifi: mt76: mt7915: add locking for accessing mapped registers
Date: Fri, 29 Mar 2024 08:25:38 -0400
Message-ID: <20240329122652.3082296-42-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240329122652.3082296-1-sashal@kernel.org>
References: <20240329122652.3082296-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.8.2
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240329_052822_163936_920325B7 
X-CRM114-Status: GOOD (  13.98  )
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

[ Upstream commit 0937f95ab07af6e663ae932d592f630d9eb591da ]

Sicne the mapping is global, mapped register access needs to be protected
against concurrent access, otherwise a race condition might cause the reads
or writes to go towards the wrong register

Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
Signed-off-by: Peter Chiu <chui-hao.chiu@mediatek.com>
Signed-off-by: Felix Fietkau <nbd@nbd.name>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../net/wireless/mediatek/mt76/mt7915/mmio.c  | 45 ++++++++++++++++---
 .../wireless/mediatek/mt76/mt7915/mt7915.h    |  1 +
 2 files changed, 41 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mmio.c b/drivers/net/wireless/mediatek/mt76/mt7915/mmio.c
index 3039f53e22454..dceb505987b19 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mmio.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mmio.c
@@ -490,6 +490,11 @@ static u32 __mt7915_reg_addr(struct mt7915_dev *dev, u32 addr)
 		return dev->reg.map[i].maps + ofs;
 	}
 
+	return 0;
+}
+
+static u32 __mt7915_reg_remap_addr(struct mt7915_dev *dev, u32 addr)
+{
 	if ((addr >= MT_INFRA_BASE && addr < MT_WFSYS0_PHY_START) ||
 	    (addr >= MT_WFSYS0_PHY_START && addr < MT_WFSYS1_PHY_START) ||
 	    (addr >= MT_WFSYS1_PHY_START && addr <= MT_WFSYS1_PHY_END))
@@ -514,15 +519,30 @@ void mt7915_memcpy_fromio(struct mt7915_dev *dev, void *buf, u32 offset,
 {
 	u32 addr = __mt7915_reg_addr(dev, offset);
 
-	memcpy_fromio(buf, dev->mt76.mmio.regs + addr, len);
+	if (addr) {
+		memcpy_fromio(buf, dev->mt76.mmio.regs + addr, len);
+		return;
+	}
+
+	spin_lock_bh(&dev->reg_lock);
+	memcpy_fromio(buf, dev->mt76.mmio.regs +
+			   __mt7915_reg_remap_addr(dev, offset), len);
+	spin_unlock_bh(&dev->reg_lock);
 }
 
 static u32 mt7915_rr(struct mt76_dev *mdev, u32 offset)
 {
 	struct mt7915_dev *dev = container_of(mdev, struct mt7915_dev, mt76);
-	u32 addr = __mt7915_reg_addr(dev, offset);
+	u32 addr = __mt7915_reg_addr(dev, offset), val;
 
-	return dev->bus_ops->rr(mdev, addr);
+	if (addr)
+		return dev->bus_ops->rr(mdev, addr);
+
+	spin_lock_bh(&dev->reg_lock);
+	val = dev->bus_ops->rr(mdev, __mt7915_reg_remap_addr(dev, offset));
+	spin_unlock_bh(&dev->reg_lock);
+
+	return val;
 }
 
 static void mt7915_wr(struct mt76_dev *mdev, u32 offset, u32 val)
@@ -530,7 +550,14 @@ static void mt7915_wr(struct mt76_dev *mdev, u32 offset, u32 val)
 	struct mt7915_dev *dev = container_of(mdev, struct mt7915_dev, mt76);
 	u32 addr = __mt7915_reg_addr(dev, offset);
 
-	dev->bus_ops->wr(mdev, addr, val);
+	if (addr) {
+		dev->bus_ops->wr(mdev, addr, val);
+		return;
+	}
+
+	spin_lock_bh(&dev->reg_lock);
+	dev->bus_ops->wr(mdev, __mt7915_reg_remap_addr(dev, offset), val);
+	spin_unlock_bh(&dev->reg_lock);
 }
 
 static u32 mt7915_rmw(struct mt76_dev *mdev, u32 offset, u32 mask, u32 val)
@@ -538,7 +565,14 @@ static u32 mt7915_rmw(struct mt76_dev *mdev, u32 offset, u32 mask, u32 val)
 	struct mt7915_dev *dev = container_of(mdev, struct mt7915_dev, mt76);
 	u32 addr = __mt7915_reg_addr(dev, offset);
 
-	return dev->bus_ops->rmw(mdev, addr, mask, val);
+	if (addr)
+		return dev->bus_ops->rmw(mdev, addr, mask, val);
+
+	spin_lock_bh(&dev->reg_lock);
+	val = dev->bus_ops->rmw(mdev, __mt7915_reg_remap_addr(dev, offset), mask, val);
+	spin_unlock_bh(&dev->reg_lock);
+
+	return val;
 }
 
 #ifdef CONFIG_NET_MEDIATEK_SOC_WED
@@ -707,6 +741,7 @@ static int mt7915_mmio_init(struct mt76_dev *mdev,
 
 	dev = container_of(mdev, struct mt7915_dev, mt76);
 	mt76_mmio_init(&dev->mt76, mem_base);
+	spin_lock_init(&dev->reg_lock);
 
 	switch (device_id) {
 	case 0x7915:
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h b/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
index 4727d9c7b11de..6e79bc65f5a51 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
@@ -287,6 +287,7 @@ struct mt7915_dev {
 
 	struct list_head sta_rc_list;
 	struct list_head twt_list;
+	spinlock_t reg_lock;
 
 	u32 hw_pattern;
 
-- 
2.43.0


