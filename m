Return-Path: <SRS0=1Iba=AO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04A7AC433E2
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Jul 2020 08:16:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C9C5D206A1
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Jul 2020 08:16:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Nal7LRTJ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="ND53uu0M"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C9C5D206A1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=NMJQwacHtir2C/tGscy0X+OKBhqe97MhCKqUdLDba0I=; b=Nal7LRTJ93ThUz1ObP6wKK6G6
	5zLtCHq7sJncGUylTkvIYRMU5+73TK7lgBSliVSX54Y3BwOvNXLIRyKlxrUdlMzOC9smMz9zdE5gT
	QRSU1nnQaNqKjRfAiG9xaUQs5g0i/rzpv8g7vtGmcMmp5DqfnK+emDjOSaiQauFUGkh+lzUCcFIy7
	U49xEtu4h9VMdCMoWHESQlcir1b4kQQPoJ4kLGOKRICQyWXsf2DP5Kp+n0A1qNioy2kd+42NGx1eb
	a5GmugQDEOT0zpb8iWMTz3cbpAZU63SMQNAj5QTgz9JaChS/NEqd1JbDqmGTxn83ra6yHKHDHD68w
	qK6LcOCqw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jrGs3-0005uN-92; Fri, 03 Jul 2020 08:16:31 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jrGry-0005rO-KG
 for linux-mediatek@lists.infradead.org; Fri, 03 Jul 2020 08:16:29 +0000
Received: from lore-desk.lan (unknown [151.48.138.186])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A6D95206A1;
 Fri,  3 Jul 2020 08:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593764186;
 bh=BiZERL4ReZj8xSnCihCITNO1DsQRIwcuC06sShjEOlU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ND53uu0M1tb1wuhFL6QMX0ntUBDC3luebY8z5reBsm9dt/EQI4lq9bd0jf0vrLoYo
 3wUKqu3BYJqcY+zarv3BoIb7LPoLkXmL63WhnUBgbIryYchCAiA9T5/gL06EN/yWCB
 f6YXqSbJkRZjl5uziM9/bNUB+BldJm6qSwsl+wqY=
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: nbd@nbd.name
Subject: [PATCH v2 03/22] mt76: mt7615: add mt7615_pm_wake utility routine
Date: Fri,  3 Jul 2020 10:15:42 +0200
Message-Id: <0bda930bba3b61477e9063779e7eff7c8c1a3463.1593763584.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1593763584.git.lorenzo@kernel.org>
References: <cover.1593763584.git.lorenzo@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200703_041626_887226_B695FBAB 
X-CRM114-Status: GOOD (  16.75  )
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
 ryder.lee@mediatek.com, linux-wireless@vger.kernel.org, sean.wang@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Introduce mt7615_pm_wake utility routine to wake the device from
runtime low-power state (lower-power state is currently supported by
offload firmware for pcie devices).

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/wireless/mediatek/mt76/mt76.h     |  1 +
 .../net/wireless/mediatek/mt76/mt7615/init.c  |  3 ++
 .../net/wireless/mediatek/mt76/mt7615/mac.c   | 42 +++++++++++++++++++
 .../net/wireless/mediatek/mt76/mt7615/main.c  |  2 +
 .../net/wireless/mediatek/mt76/mt7615/mcu.c   | 25 ++++++++---
 .../wireless/mediatek/mt76/mt7615/mt7615.h    |  8 ++++
 6 files changed, 75 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/wireless/mediatek/mt76/mt76.h
index f7be1d5f71a0..265ee55d22f1 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76.h
@@ -291,6 +291,7 @@ enum {
 	MT76_STATE_POWER_OFF,
 	MT76_STATE_SUSPEND,
 	MT76_STATE_ROC,
+	MT76_STATE_PM,
 };
 
 struct mt76_hw_cap {
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/init.c b/drivers/net/wireless/mediatek/mt76/mt7615/init.c
index 7daaab277b26..b5632c71cbbd 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/init.c
@@ -444,6 +444,9 @@ void mt7615_init_device(struct mt7615_dev *dev)
 	dev->phy.dev = dev;
 	dev->phy.mt76 = &dev->mt76.phy;
 	dev->mt76.phy.priv = &dev->phy;
+
+	INIT_WORK(&dev->pm.wake_work, mt7615_pm_wake_work);
+	init_completion(&dev->pm.wake_cmpl);
 	INIT_DELAYED_WORK(&dev->phy.mac_work, mt7615_mac_work);
 	INIT_DELAYED_WORK(&dev->phy.scan_work, mt7615_scan_work);
 	skb_queue_head_init(&dev->phy.scan_event_list);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mac.c b/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
index c1a802366172..4d8cd88473dd 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
@@ -1808,6 +1808,48 @@ mt7615_mac_update_mib_stats(struct mt7615_phy *phy)
 	}
 }
 
+void mt7615_pm_wake_work(struct work_struct *work)
+{
+	struct mt7615_dev *dev;
+	struct mt76_phy *mphy;
+
+	dev = (struct mt7615_dev *)container_of(work, struct mt7615_dev,
+						pm.wake_work);
+	mphy = dev->phy.mt76;
+
+	if (mt7615_driver_own(dev))
+		dev_err(mphy->dev->dev, "failed to wake device\n");
+
+	complete_all(&dev->pm.wake_cmpl);
+}
+
+int mt7615_pm_wake(struct mt7615_dev *dev)
+{
+	struct mt76_phy *mphy = dev->phy.mt76;
+
+	if (!mt7615_firmware_offload(dev))
+		return 0;
+
+	if (!mt76_is_mmio(mphy->dev))
+		return 0;
+
+	if (!test_bit(MT76_STATE_PM, &mphy->state))
+		return 0;
+
+	if (test_bit(MT76_HW_SCANNING, &mphy->state) ||
+	    test_bit(MT76_HW_SCHED_SCANNING, &mphy->state))
+		return 0;
+
+	if (queue_work(dev->mt76.wq, &dev->pm.wake_work))
+		reinit_completion(&dev->pm.wake_cmpl);
+
+	if (!wait_for_completion_timeout(&dev->pm.wake_cmpl, 3 * HZ))
+		return -ETIMEDOUT;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(mt7615_pm_wake);
+
 void mt7615_mac_work(struct work_struct *work)
 {
 	struct mt7615_phy *phy;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/main.c b/drivers/net/wireless/mediatek/mt76/mt7615/main.c
index 3bcbd13c26d7..1e7f7b9b1388 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/main.c
@@ -74,6 +74,8 @@ static void mt7615_stop(struct ieee80211_hw *hw)
 	del_timer_sync(&phy->roc_timer);
 	cancel_work_sync(&phy->roc_work);
 
+	cancel_work_sync(&dev->pm.wake_work);
+
 	mutex_lock(&dev->mt76.mutex);
 
 	mt76_testmode_reset(&dev->mt76, true);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
index 89a09745df08..b72c824e5c15 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mcu.c
@@ -1916,28 +1916,36 @@ static void mt7622_trigger_hif_int(struct mt7615_dev *dev, bool en)
 
 int mt7615_driver_own(struct mt7615_dev *dev)
 {
+	struct mt76_phy *mphy = &dev->mt76.phy;
 	struct mt76_dev *mdev = &dev->mt76;
+	int err = 0;
 	u32 addr;
 
+	mt7622_trigger_hif_int(dev, true);
+
 	addr = is_mt7663(mdev) ? MT_PCIE_DOORBELL_PUSH : MT_CFG_LPCR_HOST;
 	mt76_wr(dev, addr, MT_CFG_LPCR_HOST_DRV_OWN);
 
-	mt7622_trigger_hif_int(dev, true);
-
 	addr = is_mt7663(mdev) ? MT_CONN_HIF_ON_LPCTL : MT_CFG_LPCR_HOST;
 	if (!mt76_poll_msec(dev, addr, MT_CFG_LPCR_HOST_FW_OWN, 0, 3000)) {
 		dev_err(dev->mt76.dev, "Timeout for driver own\n");
-		return -EIO;
+		err = -EIO;
+		goto out;
 	}
 
+	clear_bit(MT76_STATE_PM, &mphy->state);
+
+out:
 	mt7622_trigger_hif_int(dev, false);
 
-	return 0;
+	return err;
 }
 EXPORT_SYMBOL_GPL(mt7615_driver_own);
 
 int mt7615_firmware_own(struct mt7615_dev *dev)
 {
+	struct mt76_phy *mphy = &dev->mt76.phy;
+	int err = 0;
 	u32 addr;
 
 	addr = is_mt7663(&dev->mt76) ? MT_CONN_HIF_ON_LPCTL : MT_CFG_LPCR_HOST;
@@ -1949,11 +1957,16 @@ int mt7615_firmware_own(struct mt7615_dev *dev)
 	    !mt76_poll_msec(dev, addr, MT_CFG_LPCR_HOST_FW_OWN,
 			    MT_CFG_LPCR_HOST_FW_OWN, 300)) {
 		dev_err(dev->mt76.dev, "Timeout for firmware own\n");
-		return -EIO;
+		err = -EIO;
+		goto out;
 	}
+
+	set_bit(MT76_STATE_PM, &mphy->state);
+
+out:
 	mt7622_trigger_hif_int(dev, false);
 
-	return 0;
+	return err;
 }
 EXPORT_SYMBOL_GPL(mt7615_firmware_own);
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h b/drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h
index 1ae6ea5b4f16..194ae43091d6 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h
@@ -4,6 +4,7 @@
 #ifndef __MT7615_H
 #define __MT7615_H
 
+#include <linux/completion.h>
 #include <linux/interrupt.h>
 #include <linux/ktime.h>
 #include <linux/regmap.h>
@@ -296,6 +297,11 @@ struct mt7615_dev {
 		s8 last_wb_rssi;
 	} test;
 #endif
+
+	struct {
+		struct work_struct wake_work;
+		struct completion wake_cmpl;
+	} pm;
 };
 
 enum tx_pkt_queue_idx {
@@ -425,6 +431,8 @@ bool mt7615_wait_for_mcu_init(struct mt7615_dev *dev);
 void mt7615_mac_set_rates(struct mt7615_phy *phy, struct mt7615_sta *sta,
 			  struct ieee80211_tx_rate *probe_rate,
 			  struct ieee80211_tx_rate *rates);
+void mt7615_pm_wake_work(struct work_struct *work);
+int mt7615_pm_wake(struct mt7615_dev *dev);
 int mt7615_mcu_del_wtbl_all(struct mt7615_dev *dev);
 int mt7615_mcu_set_chan_info(struct mt7615_phy *phy, int cmd);
 int mt7615_mcu_set_wmm(struct mt7615_dev *dev, u8 queue,
-- 
2.26.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
