Return-Path: <SRS0=1Iba=AO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37513C433E3
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Jul 2020 08:16:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0718E207FF
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Jul 2020 08:16:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Wc/Y8fgJ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="ezhgCNRs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0718E207FF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=LvRmRYAOjhZxjSSIjHUIEmomXYYQUcid+A2qK0QaX6Y=; b=Wc/Y8fgJq9ErmvuIIbb8NRTBz
	96dAteRKhOTDyPtEARCyOMHax9UEIcKMNpIMQLfj1Eg36a9mgUpxX+rDXtlNgLJxGJW9kAU4coYfj
	o+0qDlHHRTrR+PfBkJfkp9nSI+cnJn6OJ4UUWyS4pK7NvXTeIqIF9HRm0vTD7AY6h3L5Wm9HaUXeh
	KAKUPwo39PCH38EXKOAql5KsLH/a9YCkze2nYJpoqdqOV8KddYkM/jz0/G0zsM1+/450YwsRjBW0M
	O6FM4Q0tWbHMs6pjIqcWwlx5u28bTAQMQToj9lFBo8LBgCAoFJ53asC2mvQ7IqSANaUIlDVHSVru+
	BTSTzYAlA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jrGsG-00065V-0S; Fri, 03 Jul 2020 08:16:44 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jrGs6-0005w9-4d
 for linux-mediatek@lists.infradead.org; Fri, 03 Jul 2020 08:16:35 +0000
Received: from lore-desk.lan (unknown [151.48.138.186])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1687A207DA;
 Fri,  3 Jul 2020 08:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593764193;
 bh=J2HKYlWAdVNjzo40ILzO779e4Ddusi+K8CWl1leSDMA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ezhgCNRsj9F0dtq4no8KKc09tvRyiS0lJUnODAgtfrY88z2I/IuxXLu9iJlCf/Jws
 6d7rJxEHSTaQ/ZpUbbc4SpACIEaWquPYFlOfisEFor5Mip+3txtYSySb1FSGBMkPXK
 ErR9OQ1Lxa9FuS1pex8N8GP7uhPTo7OoHTXYBahA=
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: nbd@nbd.name
Subject: [PATCH v2 07/22] mt76: mt7615: introduce pm_power_save delayed work
Date: Fri,  3 Jul 2020 10:15:46 +0200
Message-Id: <1541fada74751e380097bbbba3b1c9b589f89a7e.1593763584.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1593763584.git.lorenzo@kernel.org>
References: <cover.1593763584.git.lorenzo@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200703_041634_414822_D7130309 
X-CRM114-Status: GOOD (  12.64  )
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

Introduce runtime-pm power_save delayed work used to enable
low-power after an inactivity period

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 .../net/wireless/mediatek/mt76/mt7615/init.c  |  1 +
 .../net/wireless/mediatek/mt76/mt7615/mac.c   | 27 +++++++++++++++++++
 .../net/wireless/mediatek/mt76/mt7615/main.c  |  3 +++
 .../wireless/mediatek/mt76/mt7615/mt7615.h    |  6 ++++-
 4 files changed, 36 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/init.c b/drivers/net/wireless/mediatek/mt76/mt7615/init.c
index b5632c71cbbd..c22878b82540 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/init.c
@@ -445,6 +445,7 @@ void mt7615_init_device(struct mt7615_dev *dev)
 	dev->phy.mt76 = &dev->mt76.phy;
 	dev->mt76.phy.priv = &dev->phy;
 
+	INIT_DELAYED_WORK(&dev->pm.ps_work, mt7615_pm_power_save_work);
 	INIT_WORK(&dev->pm.wake_work, mt7615_pm_wake_work);
 	init_completion(&dev->pm.wake_cmpl);
 	INIT_DELAYED_WORK(&dev->phy.mac_work, mt7615_mac_work);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mac.c b/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
index eb56a7819070..2411fa66efa3 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
@@ -1850,6 +1850,33 @@ int mt7615_pm_wake(struct mt7615_dev *dev)
 }
 EXPORT_SYMBOL_GPL(mt7615_pm_wake);
 
+void mt7615_pm_power_save_sched(struct mt7615_dev *dev)
+{
+	struct mt76_phy *mphy = dev->phy.mt76;
+
+	if (!mt7615_firmware_offload(dev) || !mt76_is_mmio(mphy->dev) ||
+	    !test_bit(MT76_STATE_RUNNING, &mphy->state))
+		return;
+
+	dev->pm.last_activity = jiffies;
+	if (!test_bit(MT76_STATE_PM, &mphy->state))
+		queue_delayed_work(dev->mt76.wq, &dev->pm.ps_work,
+				   MT7615_PM_TIMEOUT);
+}
+EXPORT_SYMBOL_GPL(mt7615_pm_power_save_sched);
+
+void mt7615_pm_power_save_work(struct work_struct *work)
+{
+	struct mt7615_dev *dev;
+
+	dev = (struct mt7615_dev *)container_of(work, struct mt7615_dev,
+						pm.ps_work.work);
+
+	if (mt7615_firmware_own(dev))
+		queue_delayed_work(dev->mt76.wq, &dev->pm.ps_work,
+				   MT7615_PM_TIMEOUT);
+}
+
 void mt7615_mac_work(struct work_struct *work)
 {
 	struct mt7615_phy *phy;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/main.c b/drivers/net/wireless/mediatek/mt76/mt7615/main.c
index 3c230479b36c..d1ddd5b15955 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/main.c
@@ -74,6 +74,7 @@ static void mt7615_stop(struct ieee80211_hw *hw)
 	del_timer_sync(&phy->roc_timer);
 	cancel_work_sync(&phy->roc_work);
 
+	cancel_delayed_work_sync(&dev->pm.ps_work);
 	cancel_work_sync(&dev->pm.wake_work);
 
 	mt7615_mutex_acquire(dev);
@@ -1003,6 +1004,8 @@ static int mt7615_suspend(struct ieee80211_hw *hw,
 	bool ext_phy = phy != &dev->phy;
 	int err = 0;
 
+	cancel_delayed_work_sync(&dev->pm.ps_work);
+
 	mt7615_mutex_acquire(dev);
 
 	clear_bit(MT76_STATE_RUNNING, &phy->mt76->state);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h b/drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h
index 599445d93562..ee02c45dfa9e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h
@@ -19,6 +19,7 @@
 #define MT7615_WTBL_STA			(MT7615_WTBL_RESERVED - \
 					 MT7615_MAX_INTERFACES)
 
+#define MT7615_PM_TIMEOUT		(HZ / 12)
 #define MT7615_WATCHDOG_TIME		(HZ / 10)
 #define MT7615_HW_SCAN_TIMEOUT		(HZ / 10)
 #define MT7615_RESET_TIMEOUT		(30 * HZ)
@@ -302,6 +303,7 @@ struct mt7615_dev {
 		struct work_struct wake_work;
 		struct completion wake_cmpl;
 
+		struct delayed_work ps_work;
 		unsigned long last_activity;
 	} pm;
 };
@@ -435,6 +437,8 @@ void mt7615_mac_set_rates(struct mt7615_phy *phy, struct mt7615_sta *sta,
 			  struct ieee80211_tx_rate *rates);
 void mt7615_pm_wake_work(struct work_struct *work);
 int mt7615_pm_wake(struct mt7615_dev *dev);
+void mt7615_pm_power_save_sched(struct mt7615_dev *dev);
+void mt7615_pm_power_save_work(struct work_struct *work);
 int mt7615_mcu_del_wtbl_all(struct mt7615_dev *dev);
 int mt7615_mcu_set_chan_info(struct mt7615_phy *phy, int cmd);
 int mt7615_mcu_set_wmm(struct mt7615_dev *dev, u8 queue,
@@ -499,7 +503,7 @@ static inline void mt7615_mutex_acquire(struct mt7615_dev *dev)
 static inline void mt7615_mutex_release(struct mt7615_dev *dev)
 	__releases(&dev->mt76.mutex)
 {
-	dev->pm.last_activity = jiffies;
+	mt7615_pm_power_save_sched(dev);
 	mutex_unlock(&dev->mt76.mutex);
 }
 
-- 
2.26.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
