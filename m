Return-Path: <SRS0=tuDC=AH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9526BC433E1
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Jun 2020 21:25:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3C23A20B1F
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Jun 2020 21:25:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YXthqcHY";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="uoyNicgh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3C23A20B1F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=OuvhmnBsodkbfF2WoODOi+ujTerHCOgO5jifZRdGsLE=; b=YXthqcHYOziEb3k9A+RCSJCqH
	r63CC3FjBda3L7Yq7rzB1CApuvBgmflcQ0iUuOdB+v0szyaIQFfygUMSispcpqA6vMcfqEVttYauk
	fr/p39sRNU4e5cUZ1TaVcizc7qwtbv//T45tLAYjeB+hF6Kl2N559CupVwK8/qke2BPLUE9Mqq1Tn
	Djm69u2X0opqUGJ7z2mzuKFmqxg+DmWVwyudRZrPuxzd66kGh6IcBqKSy7SP1xbKZX3kax9oAVfN2
	+H+ctG1xfCGA9ROIsGR+Su82E5ZhuGVCxHKs/l0RteOTZOt5Uq/UNb+3VeIbtjpcW7dq2sGis76ZS
	7xNea6AHA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jovr3-000218-Gb; Fri, 26 Jun 2020 21:25:49 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jovqz-0001yt-Ny
 for linux-mediatek@lists.infradead.org; Fri, 26 Jun 2020 21:25:46 +0000
Received: from localhost.localdomain.com (unknown [151.48.138.186])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D201020C09;
 Fri, 26 Jun 2020 21:25:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593206745;
 bh=kBAulE3bhjicakuCpN7TZOggj/jChwDBf1S+e69ngyU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=uoyNicgh3cs+K6DUViKAaSYBS1Kf+iP8a4hPki0Zr3iDXP6+fMTkRnuNCDlFmpLrb
 mT34nj4+Oy3DWosSgPrgNgyPwqUJy120JPNLjyDT9PVFAuEG73hew+WQ+odM/ZHpWT
 uUeeVB6z3HdZyTft033Mn7uT7erDNTEZqX7bK+ig=
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: nbd@nbd.name
Subject: [PATCH 07/17] mt76: mt7615: introduce pm_power_save delayed work
Date: Fri, 26 Jun 2020 23:25:07 +0200
Message-Id: <ac3849b399f7e28eea1faeb59884159a515d0984.1593204577.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1593204577.git.lorenzo@kernel.org>
References: <cover.1593204577.git.lorenzo@kernel.org>
MIME-Version: 1.0
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
 sean.wang@mediatek.com, linux-wireless@vger.kernel.org, ryder.lee@mediatek.com
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
index 8910604719b1..7804928f54d8 100644
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
index 8ac63ea7cbb8..e63c2584b326 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/main.c
@@ -74,6 +74,7 @@ static void mt7615_stop(struct ieee80211_hw *hw)
 	del_timer_sync(&phy->roc_timer);
 	cancel_work_sync(&phy->roc_work);
 
+	cancel_delayed_work_sync(&dev->pm.ps_work);
 	cancel_work_sync(&dev->pm.wake_work);
 
 	mt7615_mutex_acquire(dev, &dev->mt76.mutex);
@@ -1006,6 +1007,8 @@ static int mt7615_suspend(struct ieee80211_hw *hw,
 	bool ext_phy = phy != &dev->phy;
 	int err = 0;
 
+	cancel_delayed_work_sync(&dev->pm.ps_work);
+
 	mt7615_mutex_acquire(dev, &dev->mt76.mutex);
 
 	clear_bit(MT76_STATE_RUNNING, &phy->mt76->state);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h b/drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h
index 8e473bb41a5d..a93ddb1a3def 100644
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
@@ -501,7 +505,7 @@ static inline void
 mt7615_mutex_release(struct mt7615_dev *dev, struct mutex *mutex)
 	__releases(mutex)
 {
-	dev->pm.last_activity = jiffies;
+	mt7615_pm_power_save_sched(dev);
 	mutex_unlock(mutex);
 }
 
-- 
2.26.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
