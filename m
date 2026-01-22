Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11AE3C44500
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Jan 2026 10:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5X6iiMUmZLOACCXhjBj6YrjxWy5enN+x6cw5T+zy8oY=; b=S78ZWDXKeWb9AoxaVQiQ/6BQU0
	x8R0YYppdhQyZMAIhy+gGzcs1i0myJOPQBlYYIm9ipylrHR86OEd89kMAnYFg8ngLXiWKHPJhKpHt
	S2bfLQilDnWOvY0FS68a7Y4Ejg6/yqD/PlAVx/tahkqF+amYIfqcNCQ6zFT/ImhsxPJOdmrwbyeGG
	Obz5MYZAliW1XLhJ037387KnzkXq50LiRqBLVLBTF8JxKbMhk7lejb/KbgNTGD89XdXl+bj6S7Cew
	aDxb/DBI7xWwqNWZahozX41MS7AlGI/hNZq5XEG67goYWp0eQw9yMLxmEdT7MW7z0dKzLY0JEijqH
	cx+dOPtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vis7I-00000006ru6-1bkH;
	Thu, 22 Jan 2026 10:40:44 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vis73-00000006reb-2uwV;
	Thu, 22 Jan 2026 10:40:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 241CF600C3;
	Thu, 22 Jan 2026 10:40:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7ADB4C16AAE;
	Thu, 22 Jan 2026 10:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769078428;
	bh=RUrGnd/oLpqhYB1Jjs8ZU9qWFxLXGaSg3bs4Yc1rsns=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=jgd6eg2T6AKiQWI0V6D75zpNb8Bp+d2IiKAqRcbTXrDOJhUQL40ZafGUsUnGzlw2c
	 pksXkuBpWdJRHgFiZ7oLr8jXRqO0sBZpUACwwB7l1US9CzVLb+i7mAD8izW9pj2ts9
	 3jQ8XFUTJvKYk2VRDBHS8zX/n97H3jiP6RxjpOTDQm939VbVzEwFZ1Fc3lSNvLucKc
	 7Nt2+aMD7F5Q3Xg+h6xBJmr0qjL+IQxiGl/nwxOxIP2NYRMsaXEmfpBLiHkiVgze3k
	 9gEOIf3iPAOSye0yKoIwxn+5mWUVO5TO7KcGen+fl2GMp4HdNjjXkeOe5YBjUCpyoi
	 gzRDBmHgPBg1w==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Thu, 22 Jan 2026 11:39:53 +0100
Subject: [PATCH mt76 v2 09/17] wifi: mt76: mt7996: Integrate NPU in RRO
 session management
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260122-mt76-npu-eagle-offload-v2-9-2374614c0de6@kernel.org>
References: <20260122-mt76-npu-eagle-offload-v2-0-2374614c0de6@kernel.org>
In-Reply-To: <20260122-mt76-npu-eagle-offload-v2-0-2374614c0de6@kernel.org>
To: Felix Fietkau <nbd@nbd.name>, Ryder Lee <ryder.lee@mediatek.com>, 
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-wireless@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Kang Yang <kang.yang@airoha.com>
X-Mailer: b4 0.14.2
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

Add NPU integration in RRO 3.0 session management.
This is a preliminary patch to enable NPU offload for MT7996 (Eagle)
chipset.

Tested-by: Kang Yang <kang.yang@airoha.com>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt76.h        | 10 ++++++++
 drivers/net/wireless/mediatek/mt76/mt7996/init.c | 16 ++++++++++++-
 drivers/net/wireless/mediatek/mt76/npu.c         | 30 ++++++++++++++++++++++++
 3 files changed, 55 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/wireless/mediatek/mt76/mt76.h
index d05e83ea1cacc43512f37743e1708390c3cb2f35..eefc3f555f8afea2af67517683d522b657e20b7b 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76.h
@@ -1649,6 +1649,9 @@ void mt76_npu_txdesc_cleanup(struct mt76_queue *q, int index);
 int mt76_npu_net_setup_tc(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 			  struct net_device *dev, enum tc_setup_type type,
 			  void *type_data);
+int mt76_npu_send_txrx_addr(struct mt76_dev *dev, int ifindex,
+			    u32 direction, u32 i_count_addr,
+			    u32 o_status_addr, u32 o_count_addr);
 #else
 static inline void mt76_npu_check_ppe(struct mt76_dev *dev,
 				      struct sk_buff *skb, u32 info)
@@ -1707,6 +1710,13 @@ static inline int mt76_npu_net_setup_tc(struct ieee80211_hw *hw,
 {
 	return -EOPNOTSUPP;
 }
+
+static inline int mt76_npu_send_txrx_addr(struct mt76_dev *dev, int ifindex,
+					  u32 direction, u32 i_count_addr,
+					  u32 o_status_addr, u32 o_count_addr)
+{
+	return -EOPNOTSUPP;
+}
 #endif /* CONFIG_MT76_NPU */
 
 static inline bool mt76_npu_device_active(struct mt76_dev *dev)
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/init.c b/drivers/net/wireless/mediatek/mt76/mt7996/init.c
index 9fbe4235de0d0d42776d5661fa1c297e431b8d27..03c1ccb49ef02ebe9c2ae91db836593e680ee2c0 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/init.c
@@ -941,6 +941,12 @@ static int mt7996_wed_rro_init(struct mt7996_dev *dev)
 			addr++;
 		}
 
+		if (is_mt7996(&dev->mt76) &&
+		    mt76_npu_device_active(&dev->mt76))
+			mt76_npu_send_txrx_addr(&dev->mt76, 0, i,
+					dev->wed_rro.addr_elem[i].phy_addr,
+					0, 0);
+
 #ifdef CONFIG_NET_MEDIATEK_SOC_WED
 		if (mtk_wed_device_active(&dev->mt76.mmio.wed) &&
 		    mtk_wed_get_rx_capa(&dev->mt76.mmio.wed)) {
@@ -1001,6 +1007,10 @@ static int mt7996_wed_rro_init(struct mt7996_dev *dev)
 		addr++;
 	}
 
+	if (is_mt7996(&dev->mt76) && mt76_npu_device_active(&dev->mt76))
+		mt76_npu_send_txrx_addr(&dev->mt76, 1, 0,
+					dev->wed_rro.session.phy_addr, 0, 0);
+
 	mt7996_rro_hw_init(dev);
 
 	return mt7996_dma_rro_init(dev);
@@ -1087,8 +1097,12 @@ static void mt7996_wed_rro_work(struct work_struct *work)
 				     list);
 		list_del_init(&e->list);
 
-		if (mt76_npu_device_active(&dev->mt76))
+		if (mt76_npu_device_active(&dev->mt76)) {
+			if (is_mt7996(&dev->mt76))
+				mt76_npu_send_txrx_addr(&dev->mt76, 3, e->id,
+							0, 0, 0);
 			goto reset_session;
+		}
 
 		for (i = 0; i < MT7996_RRO_WINDOW_MAX_LEN; i++) {
 			void *ptr = dev->wed_rro.session.ptr;
diff --git a/drivers/net/wireless/mediatek/mt76/npu.c b/drivers/net/wireless/mediatek/mt76/npu.c
index 9679237f739842bd44497e0b1022a868cb3a0d6c..bc8f2012be9dbe2c7fc1fc885b6135d796d8c0d6 100644
--- a/drivers/net/wireless/mediatek/mt76/npu.c
+++ b/drivers/net/wireless/mediatek/mt76/npu.c
@@ -390,6 +390,36 @@ int mt76_npu_net_setup_tc(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 }
 EXPORT_SYMBOL_GPL(mt76_npu_net_setup_tc);
 
+int mt76_npu_send_txrx_addr(struct mt76_dev *dev, int ifindex,
+			    u32 direction, u32 i_count_addr,
+			    u32 o_status_addr, u32 o_count_addr)
+{
+	struct {
+		__le32 dir;
+		__le32 in_count_addr;
+		__le32 out_status_addr;
+		__le32 out_count_addr;
+	} info = {
+		.dir = cpu_to_le32(direction),
+		.in_count_addr = cpu_to_le32(i_count_addr),
+		.out_status_addr = cpu_to_le32(o_status_addr),
+		.out_count_addr = cpu_to_le32(o_count_addr),
+	};
+	struct airoha_npu *npu;
+	int err = -ENODEV;
+
+	rcu_read_lock();
+	npu = rcu_dereference(dev->mmio.npu);
+	if (npu)
+		err = airoha_npu_wlan_send_msg(npu, ifindex,
+				WLAN_FUNC_SET_WAIT_INODE_TXRX_REG_ADDR,
+				&info, sizeof(info), GFP_ATOMIC);
+	rcu_read_unlock();
+
+	return err;
+}
+EXPORT_SYMBOL_GPL(mt76_npu_send_txrx_addr);
+
 void mt76_npu_disable_irqs(struct mt76_dev *dev)
 {
 	struct airoha_npu *npu;

-- 
2.52.0


