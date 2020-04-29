Return-Path: <SRS0=pTuV=6N=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17F6DC83006
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Apr 2020 17:52:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E16C821BE5
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Apr 2020 17:52:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dlG55HHR";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="0CaqTFVk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E16C821BE5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IgxJvRpE38i0vHg5t9lvIGbE9YSemj+SfgrCIzJ7vnw=; b=dlG55HHRwnKrl0
	55RP3JpgDy2APyR/7fJSoe2k5dEdEANQlyyI2rWUv7fjpwV11//VdWt1ikD5DTQZQOZVEP4UP/ot9
	BM8G57tHn2YjyYXpebA9R5ywaGFdYXBFornbrLkYvJMfawh/DwQ5eViyod7Z5yLdu7PB86yJlHUyW
	oZJiw4tgpQaDDD+ysGVcJQ6nMikGJtohN0bXXDAa+yg5conVJ+OPKr8ZNcOdcjC0xwarS6K5owt8j
	MEQS5crUZW7Uv2LcYkW+qXNw1OH08c/w6hh7KXzZ3NkknXX6IenrMXoSOGkTeJpBpAVZ1Z9Vmzux9
	5AJXvSHxzs25oNlnwF/A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jTqsq-0006Vb-3T; Wed, 29 Apr 2020 17:52:32 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jTqsn-0006Ty-7K
 for linux-mediatek@lists.infradead.org; Wed, 29 Apr 2020 17:52:30 +0000
Received: from localhost.localdomain.com (unknown [151.66.196.206])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A0C8D21BE5;
 Wed, 29 Apr 2020 17:52:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588182748;
 bh=VO5hheXNVNOEpG4EtuMOBb3zy5nHCqE9xPxQDXNbwLw=;
 h=From:To:Cc:Subject:Date:From;
 b=0CaqTFVkdcZtdg0ADEzDLSWMQfwAMc/mDBLZQ1SMLipAHexXdLWEmczAxItuwtpcM
 +YvboQ45jvX38W6fzwnbqQyTLUvtczY4v+cjz0S2TID7bprcw826aAtkb9RwOzViFT
 8rQD0zB9U1wlnBUsajJn5dukipcEC1V9ylwN3W3g=
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: nbd@nbd.name
Subject: [PATCH] mt76: mt7615: introduce mt7615_check_offload_capability
 routine
Date: Wed, 29 Apr 2020 19:52:15 +0200
Message-Id: <5d8ba8de8fbd384eabf48eb1899bba82e1acc80e.1588182688.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200429_105229_312953_9D4320DE 
X-CRM114-Status: GOOD (  10.99  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: linux-mediatek@lists.infradead.org, lorenzo.bianconi@redhat.com,
 sean.wang@mediatek.com, linux-wireless@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Introduce mt7615_check_offload_capability routine to set hw/wiphy
offload capabilities according to the running firmware

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 .../net/wireless/mediatek/mt76/mt7615/init.c  | 26 +++++++++++++++++++
 .../wireless/mediatek/mt76/mt7615/mt7615.h    |  1 +
 .../wireless/mediatek/mt76/mt7615/pci_init.c  | 21 +--------------
 .../wireless/mediatek/mt76/mt7615/usb_init.c  |  4 +--
 4 files changed, 29 insertions(+), 23 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/init.c b/drivers/net/wireless/mediatek/mt76/mt7615/init.c
index 9880643888ba..7da0bf425061 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/init.c
@@ -130,6 +130,32 @@ void mt7615_mac_init(struct mt7615_dev *dev)
 }
 EXPORT_SYMBOL_GPL(mt7615_mac_init);
 
+void mt7615_check_offload_capability(struct mt7615_dev *dev)
+{
+	struct ieee80211_hw *hw = mt76_hw(dev);
+	struct wiphy *wiphy = hw->wiphy;
+
+	if (mt7615_firmware_offload(dev)) {
+		ieee80211_hw_set(hw, SUPPORTS_PS);
+		ieee80211_hw_set(hw, SUPPORTS_DYNAMIC_PS);
+
+		wiphy->features |= NL80211_FEATURE_SCAN_RANDOM_MAC_ADDR;
+	} else {
+		dev->ops->hw_scan = NULL;
+		dev->ops->cancel_hw_scan = NULL;
+		dev->ops->sched_scan_start = NULL;
+		dev->ops->sched_scan_stop = NULL;
+
+		wiphy->max_sched_scan_plan_interval = 0;
+		wiphy->max_sched_scan_ie_len = 0;
+		wiphy->max_scan_ie_len = IEEE80211_MAX_DATA_LEN;
+		wiphy->max_sched_scan_ssids = 0;
+		wiphy->max_match_sets = 0;
+		wiphy->max_sched_scan_reqs = 0;
+	}
+}
+EXPORT_SYMBOL_GPL(mt7615_check_offload_capability);
+
 bool mt7615_wait_for_mcu_init(struct mt7615_dev *dev)
 {
 	flush_work(&dev->mcu_work);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h b/drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h
index 0476b9426b03..2321a1f23ec8 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h
@@ -370,6 +370,7 @@ int mt7615_mmio_probe(struct device *pdev, void __iomem *mem_base,
 		      int irq, const u32 *map);
 u32 mt7615_reg_map(struct mt7615_dev *dev, u32 addr);
 
+void mt7615_check_offload_capability(struct mt7615_dev *dev);
 void mt7615_init_device(struct mt7615_dev *dev);
 int mt7615_register_device(struct mt7615_dev *dev);
 void mt7615_unregister_device(struct mt7615_dev *dev);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/pci_init.c b/drivers/net/wireless/mediatek/mt76/mt7615/pci_init.c
index cd3ccafa7d11..69cba8609edf 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/pci_init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/pci_init.c
@@ -16,7 +16,6 @@ static void mt7615_init_work(struct work_struct *work)
 {
 	struct mt7615_dev *dev = container_of(work, struct mt7615_dev,
 					      mcu_work);
-	struct ieee80211_hw *hw = mt76_hw(dev);
 
 	if (mt7615_mcu_init(dev))
 		return;
@@ -25,25 +24,7 @@ static void mt7615_init_work(struct work_struct *work)
 	mt7615_mac_init(dev);
 	mt7615_phy_init(dev);
 	mt7615_mcu_del_wtbl_all(dev);
-
-	if (mt7615_firmware_offload(dev)) {
-		ieee80211_hw_set(hw, SUPPORTS_PS);
-		ieee80211_hw_set(hw, SUPPORTS_DYNAMIC_PS);
-	} else {
-		struct wiphy *wiphy = hw->wiphy;
-
-		dev->ops->hw_scan = NULL;
-		dev->ops->cancel_hw_scan = NULL;
-		dev->ops->sched_scan_start = NULL;
-		dev->ops->sched_scan_stop = NULL;
-
-		wiphy->max_sched_scan_plan_interval = 0;
-		wiphy->max_sched_scan_ie_len = 0;
-		wiphy->max_scan_ie_len = IEEE80211_MAX_DATA_LEN;
-		wiphy->max_sched_scan_ssids = 0;
-		wiphy->max_match_sets = 0;
-		wiphy->max_sched_scan_reqs = 0;
-	}
+	mt7615_check_offload_capability(dev);
 }
 
 static int mt7615_init_hardware(struct mt7615_dev *dev)
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/usb_init.c b/drivers/net/wireless/mediatek/mt76/mt7615/usb_init.c
index 39642065531f..1fbc9601391d 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/usb_init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/usb_init.c
@@ -103,6 +103,7 @@ static void mt7663u_init_work(struct work_struct *work)
 	mt7615_mac_init(dev);
 	mt7615_phy_init(dev);
 	mt7615_mcu_del_wtbl_all(dev);
+	mt7615_check_offload_capability(dev);
 }
 
 int mt7663u_register_device(struct mt7615_dev *dev)
@@ -119,9 +120,6 @@ int mt7663u_register_device(struct mt7615_dev *dev)
 	if (err)
 		return err;
 
-	ieee80211_hw_set(hw, SUPPORTS_PS);
-	ieee80211_hw_set(hw, SUPPORTS_DYNAMIC_PS);
-
 	hw->extra_tx_headroom += MT_USB_HDR_SIZE + MT_USB_TXD_SIZE;
 	/* check hw sg support in order to enable AMSDU */
 	hw->max_tx_fragments = dev->mt76.usb.sg_en ? MT_HW_TXP_MAX_BUF_NUM : 1;
-- 
2.25.4


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
