Return-Path: <SRS0=NTS1=G2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E51B7C433E0
	for <linux-mediatek@archiver.kernel.org>; Sat, 23 Jan 2021 08:46:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A3649239D4
	for <linux-mediatek@archiver.kernel.org>; Sat, 23 Jan 2021 08:46:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A3649239D4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+WVQz9ONPayCvyVh85PApyMVkmzMMJxuRLC2G3wzzmQ=; b=Je5V9jlq5beKzMZeWFtgG2eBB
	qjM31IVL3j9QccszAYwFM8/hahq3p45iz17P9EfLM2AHRLl6UfExaJQRP+erfJzFs2vzAW2o/br2b
	lR8hZ4AEUJ7VwYsyvjuMaKD6ct+wC8JswegITo69EwNd+PAa/ilT7BDDi9jSL891Wt60UbYaVy3kI
	h5ym6BQ6RrcBdcPlw/rciszbxlQp6xYY4HGjdohix4Kdu1w83XE8bBNDAWO9usCGwbWokY2fCd+jY
	OhChUDPmreRDuIdymkyb+2pBFxMcHWb8W4Jm6FpLp2xtT+P6VxqhgYpknBUaJZgXCP2cSCCD/yXRX
	iIUJQW4Kg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l3EYK-0005mz-N9; Sat, 23 Jan 2021 08:45:52 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l3EY7-0005Ym-6b
 for linux-mediatek@lists.infradead.org; Sat, 23 Jan 2021 08:45:42 +0000
X-UUID: cef7d24533e64314b6cd1e50f6c7704e-20210123
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=4mDlLPOo5OM6jmM4yZWKH23Zms8Zie/dK5qxRZxLytk=; 
 b=BlUuyl5R9EnmdHpEtc1oWv/cD2CBk7ko7Xe1gGrx1g0+COXBKppfHm5H1OuFeVHlhD5FQv1fkZsExH+PalzI1WCCQabhZ4n8qMK8spD68hdCCgYNZmwHfkes6XF5/SfKrO2kGiJ1v1C5y2KEO+aNLv0TFoYL1jOlPUNBVD6mqzs=;
X-UUID: cef7d24533e64314b6cd1e50f6c7704e-20210123
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 335002417; Sat, 23 Jan 2021 00:45:30 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 23 Jan 2021 00:35:29 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 23 Jan 2021 16:35:17 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sat, 23 Jan 2021 16:35:18 +0800
From: <sean.wang@mediatek.com>
To: <nbd@nbd.name>, <lorenzo.bianconi@redhat.com>
Subject: [PATCH -next v7 21/22] mt76: mt7663: introduce coredump support
Date: Sat, 23 Jan 2021 16:35:12 +0800
Message-ID: <6925913c0ae670e04075cc2139c018980499c13a.1611389300.git.objelf@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1611389300.git.objelf@gmail.com>
References: <cover.1611389300.git.objelf@gmail.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: BBD2290036675BA7C29E7E330820AC8FE62E7A3741D62CF9529E3B3490D5507D2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210123_034539_499374_19D0312A 
X-CRM114-Status: GOOD (  15.65  )
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
Cc: ryder.lee@mediatek.com, robin.chiu@mediatek.com, ch.yeh@mediatek.com,
 Eric.Liang@mediatek.com, sean.wang@mediatek.com,
 linux-wireless@vger.kernel.org, posh.sun@mediatek.com, YN.Chen@mediatek.com,
 linux-mediatek@lists.infradead.org, Soul.Huang@mediatek.com,
 Lorenzo Bianconi <lorenzo@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Lorenzo Bianconi <lorenzo@kernel.org>

Similar to mt7921 devices, introduce coredump support for mt7663 chipset

Co-developed-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 .../net/wireless/mediatek/mt76/mt7615/Kconfig |  1 +
 .../wireless/mediatek/mt76/mt7615/debugfs.c   | 17 ++++++++
 .../net/wireless/mediatek/mt76/mt7615/init.c  |  2 +
 .../net/wireless/mediatek/mt76/mt7615/mac.c   | 43 +++++++++++++++++++
 .../net/wireless/mediatek/mt76/mt7615/mcu.c   |  4 ++
 .../net/wireless/mediatek/mt76/mt7615/mcu.h   |  1 +
 .../wireless/mediatek/mt76/mt7615/mt7615.h    |  4 +-
 7 files changed, 71 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/Kconfig b/drivers/net/wireless/mediatek/mt76/mt7615/Kconfig
index 5418bc96ee3b..30fba36ff46b 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/Kconfig
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/Kconfig
@@ -2,6 +2,7 @@
 
 config MT7615_COMMON
 	tristate
+	select WANT_DEV_COREDUMP
 	select MT76_CONNAC_LIB
 
 config MT7615E
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/debugfs.c b/drivers/net/wireless/mediatek/mt76/mt7615/debugfs.c
index 4d5e3f8b2a62..7ae48b4fa564 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/debugfs.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/debugfs.c
@@ -21,6 +21,20 @@ mt7615_radar_pattern_set(void *data, u64 val)
 DEFINE_DEBUGFS_ATTRIBUTE(fops_radar_pattern, NULL,
 			 mt7615_radar_pattern_set, "%lld\n");
 
+static int mt7615_config(void *data, u64 val)
+{
+	struct mt7615_dev *dev = data;
+	int ret;
+
+	mt7615_mutex_acquire(dev);
+	ret = mt76_connac_mcu_chip_config(&dev->mt76);
+	mt7615_mutex_release(dev);
+
+	return ret;
+}
+
+DEFINE_DEBUGFS_ATTRIBUTE(fops_config, NULL, mt7615_config, "%lld\n");
+
 static int
 mt7615_scs_set(void *data, u64 val)
 {
@@ -525,6 +539,9 @@ int mt7615_init_debugfs(struct mt7615_dev *dev)
 	debugfs_create_u32("rf_regidx", 0600, dir, &dev->debugfs_rf_reg);
 	debugfs_create_file_unsafe("rf_regval", 0600, dir, dev,
 				   &fops_rf_reg);
+	if (is_mt7663(&dev->mt76))
+		debugfs_create_file("chip_config", 0600, dir, dev,
+				    &fops_config);
 	if (mt76_is_sdio(&dev->mt76))
 		debugfs_create_devm_seqfile(dev->mt76.dev, "sched-quota", dir,
 					    mt7663s_sched_quota_read);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/init.c b/drivers/net/wireless/mediatek/mt76/mt7615/init.c
index b994da51b48d..a10ba2377240 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/init.c
@@ -488,7 +488,9 @@ void mt7615_init_device(struct mt7615_dev *dev)
 	set_bit(MT76_STATE_PM, &dev->mphy.state);
 	INIT_DELAYED_WORK(&dev->mphy.mac_work, mt7615_mac_work);
 	INIT_DELAYED_WORK(&dev->phy.scan_work, mt7615_scan_work);
+	INIT_DELAYED_WORK(&dev->coredump.work, mt7615_coredump_work);
 	skb_queue_head_init(&dev->phy.scan_event_list);
+	skb_queue_head_init(&dev->coredump.msg_list);
 	INIT_LIST_HEAD(&dev->sta_poll_list);
 	spin_lock_init(&dev->sta_poll_lock);
 	init_waitqueue_head(&dev->reset_wait);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mac.c b/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
index 6a3e1a609852..59fdd0fc2ad4 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
@@ -7,6 +7,7 @@
  *         Lorenzo Bianconi <lorenzo@kernel.org>
  */
 
+#include <linux/devcoredump.h>
 #include <linux/etherdevice.h>
 #include <linux/timekeeping.h>
 #include "mt7615.h"
@@ -14,6 +15,7 @@
 #include "../dma.h"
 #include "mt7615_trace.h"
 #include "mac.h"
+#include "mcu.h"
 
 #define to_rssi(field, rxv)		((FIELD_GET(field, rxv) - 220) / 2)
 
@@ -2272,3 +2274,44 @@ int mt7615_mac_set_beacon_filter(struct mt7615_phy *phy,
 
 	return 0;
 }
+
+void mt7615_coredump_work(struct work_struct *work)
+{
+	struct mt7615_dev *dev;
+	char *dump, *data;
+
+	dev = (struct mt7615_dev *)container_of(work, struct mt7615_dev,
+						coredump.work.work);
+
+	if (time_is_after_jiffies(dev->coredump.last_activity +
+				  4 * MT76_CONNAC_COREDUMP_TIMEOUT)) {
+		queue_delayed_work(dev->mt76.wq, &dev->coredump.work,
+				   MT76_CONNAC_COREDUMP_TIMEOUT);
+		return;
+	}
+
+	dump = vzalloc(MT76_CONNAC_COREDUMP_SZ);
+	data = dump;
+
+	while (true) {
+		struct sk_buff *skb;
+
+		spin_lock_bh(&dev->mt76.lock);
+		skb = __skb_dequeue(&dev->coredump.msg_list);
+		spin_unlock_bh(&dev->mt76.lock);
+
+		if (!skb)
+			break;
+
+		skb_pull(skb, sizeof(struct mt7615_mcu_rxd));
+		if (data + skb->len - dump > MT76_CONNAC_COREDUMP_SZ)
+			break;
+
+		memcpy(data, skb->data, skb->len);
+		data += skb->len;
+
+		dev_kfree_skb(skb);
+	}
+	dev_coredumpv(dev->mt76.dev, dump, MT76_CONNAC_COREDUMP_SZ,
+		      GFP_KERNEL);
+}
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
index 71502b523609..65957f59d03a 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
@@ -543,6 +543,10 @@ mt7615_mcu_rx_unsolicited_event(struct mt7615_dev *dev, struct sk_buff *skb)
 	case MCU_EVENT_BSS_ABSENCE:
 		mt7615_mcu_bss_event(dev, skb);
 		break;
+	case MCU_EVENT_COREDUMP:
+		mt76_connac_mcu_coredump_event(&dev->mt76, skb,
+					       &dev->coredump);
+		return;
 	default:
 		break;
 	}
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.h b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.h
index 446c6abf44d8..3874f45da9eb 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.h
@@ -92,6 +92,7 @@ enum {
 	MCU_EVENT_SCHED_SCAN_DONE = 0x23,
 	MCU_EVENT_EXT = 0xed,
 	MCU_EVENT_RESTART_DL = 0xef,
+	MCU_EVENT_COREDUMP = 0xf0,
 };
 
 /* ext event table */
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h b/drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h
index 1bd79dae0171..491841bc6291 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h
@@ -8,7 +8,7 @@
 #include <linux/interrupt.h>
 #include <linux/ktime.h>
 #include <linux/regmap.h>
-#include "../mt76_connac.h"
+#include "../mt76_connac_mcu.h"
 #include "regs.h"
 
 #define MT7615_MAX_INTERFACES		16
@@ -277,6 +277,7 @@ struct mt7615_dev {
 	u32 muar_mask;
 
 	struct mt76_connac_pm pm;
+	struct mt76_connac_coredump coredump;
 };
 
 enum tx_pkt_queue_idx {
@@ -554,6 +555,7 @@ int mt7615_mcu_update_arp_filter(struct ieee80211_hw *hw,
 int __mt7663_load_firmware(struct mt7615_dev *dev);
 u32 mt7615_mcu_reg_rr(struct mt76_dev *dev, u32 offset);
 void mt7615_mcu_reg_wr(struct mt76_dev *dev, u32 offset, u32 val);
+void mt7615_coredump_work(struct work_struct *work);
 
 /* usb */
 int mt7663_usb_sdio_tx_prepare_skb(struct mt76_dev *mdev, void *txwi_ptr,
-- 
2.25.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
