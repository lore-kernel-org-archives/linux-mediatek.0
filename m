Return-Path: <SRS0=tuDC=AH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C623DC433E0
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Jun 2020 21:26:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 95B7520B1F
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Jun 2020 21:26:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="P/3UmJB8";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="SilLbHrO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 95B7520B1F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1SplgNnV07E0j0lUon12a3UmkdlYTslh9mUQe/adKw8=; b=P/3UmJB8KuNNSB/cOn8yzlnR3
	DOPs5LTm6KB7JWJM2RjSr1KCjoU9a51VvpijQdzrkRKI8teEOekXzDQqeXktfhPs4jVu4qhWNwabX
	x6uUU04LdXoJgw1Le8Qr251fLR+063p0Ue7CBflW53OvS7PfGg1O2EfilISCk49OggVACicVn25Rd
	XnAkyAm19YA6ja8sAQ7NHa787omvGEaW8j9F1wDO+jHh3yKL+2Z87Igacrfugsl9gBg5I5A6t1tp6
	Tt8jEDMp1h/uzgiGU/nwIELGl8GeyIUF0n7pLwjQSAJdxdDtnIhJSso6QMc6nhJ36ee9xxBFv1mTK
	E90ogsTbQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jovrN-0002HJ-Bv; Fri, 26 Jun 2020 21:26:09 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jovrC-00027I-VG
 for linux-mediatek@lists.infradead.org; Fri, 26 Jun 2020 21:26:00 +0000
Received: from localhost.localdomain.com (unknown [151.48.138.186])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5C07D20B80;
 Fri, 26 Jun 2020 21:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593206757;
 bh=2Hmhq3wzP1gA0bSghnIl/mgLX+Tpgs8h4BrhEVV7eTY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=SilLbHrOdlYEw93QlkKcZmgpGXW5I0Mdkgy5N+AOzV6nl8d09K9EtLdxHQ+MZQaW1
 j1sGHCxpWhiUrKNL51SYNHzk92cNFNvBymKz7HTLwMu6KOc+ZTiXO6HZx/EhM40GMd
 RuK58r/afABlBHDDWSj5Z6MtoPcjeA4uhrgT9QdM=
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: nbd@nbd.name
Subject: [PATCH 14/17] mt76: mt7615: add runtime-pm knob in mt7615 debugfs
Date: Fri, 26 Jun 2020 23:25:14 +0200
Message-Id: <dae84ea915466ecc24cc74c77805cabdfc62dc17.1593204577.git.lorenzo@kernel.org>
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

Introduce runtime-pm knob in mt7615 debugfs in order to enable/disable
runtime pm available in offload firmware

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 .../wireless/mediatek/mt76/mt7615/debugfs.c   | 24 +++++++++++++++++++
 .../net/wireless/mediatek/mt76/mt7615/mac.c   | 22 ++++++++++++++++-
 .../wireless/mediatek/mt76/mt7615/mt7615.h    |  3 +++
 3 files changed, 48 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/debugfs.c b/drivers/net/wireless/mediatek/mt76/mt7615/debugfs.c
index b4c196005ebf..357b3c2fc3f9 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/debugfs.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/debugfs.c
@@ -46,6 +46,29 @@ mt7615_scs_get(void *data, u64 *val)
 DEFINE_DEBUGFS_ATTRIBUTE(fops_scs, mt7615_scs_get,
 			 mt7615_scs_set, "%lld\n");
 
+static int
+mt7615_pm_set(void *data, u64 val)
+{
+	struct mt7615_dev *dev = data;
+
+	if (!mt7615_wait_for_mcu_init(dev))
+		return 0;
+
+	return mt7615_pm_set_enable(dev, val);
+}
+
+static int
+mt7615_pm_get(void *data, u64 *val)
+{
+	struct mt7615_dev *dev = data;
+
+	*val = dev->pm.enable;
+
+	return 0;
+}
+
+DEFINE_DEBUGFS_ATTRIBUTE(fops_pm, mt7615_pm_get, mt7615_pm_set, "%lld\n");
+
 static int
 mt7615_dbdc_set(void *data, u64 val)
 {
@@ -336,6 +359,7 @@ int mt7615_init_debugfs(struct mt7615_dev *dev)
 	debugfs_create_file("scs", 0600, dir, dev, &fops_scs);
 	debugfs_create_file("dbdc", 0600, dir, dev, &fops_dbdc);
 	debugfs_create_file("fw_debug", 0600, dir, dev, &fops_fw_debug);
+	debugfs_create_file("runtime-pm", 0600, dir, dev, &fops_pm);
 	debugfs_create_devm_seqfile(dev->mt76.dev, "radio", dir,
 				    mt7615_radio_read);
 	debugfs_create_u32("dfs_hw_pattern", 0400, dir, &dev->hw_pattern);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mac.c b/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
index 8616bac97963..d3e3112359e8 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
@@ -1905,7 +1905,8 @@ void mt7615_pm_power_save_sched(struct mt7615_dev *dev)
 {
 	struct mt76_phy *mphy = dev->phy.mt76;
 
-	if (!mt7615_firmware_offload(dev) || !mt76_is_mmio(mphy->dev) ||
+	if (!mt7615_firmware_offload(dev) ||
+	    !dev->pm.enable || !mt76_is_mmio(mphy->dev) ||
 	    !test_bit(MT76_STATE_RUNNING, &mphy->state))
 		return;
 
@@ -1928,6 +1929,25 @@ void mt7615_pm_power_save_work(struct work_struct *work)
 				   MT7615_PM_TIMEOUT);
 }
 
+int mt7615_pm_set_enable(struct mt7615_dev *dev, bool enable)
+{
+	if (!mt7615_firmware_offload(dev) || !mt76_is_mmio(&dev->mt76))
+		return -EOPNOTSUPP;
+
+	mutex_lock(&dev->mt76.mutex);
+
+	if (dev->pm.enable == enable)
+		goto out;
+
+	dev->pm.enable = enable;
+	if (!enable)
+		cancel_delayed_work_sync(&dev->pm.ps_work);
+out:
+	mutex_unlock(&dev->mt76.mutex);
+
+	return 0;
+}
+
 void mt7615_mac_work(struct work_struct *work)
 {
 	struct mt7615_phy *phy;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h b/drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h
index 6da0af628c8d..02282b1a00b0 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h
@@ -300,6 +300,8 @@ struct mt7615_dev {
 #endif
 
 	struct {
+		bool enable;
+
 		spinlock_t txq_lock;
 		struct {
 			struct mt7615_sta *msta;
@@ -441,6 +443,7 @@ bool mt7615_wait_for_mcu_init(struct mt7615_dev *dev);
 void mt7615_mac_set_rates(struct mt7615_phy *phy, struct mt7615_sta *sta,
 			  struct ieee80211_tx_rate *probe_rate,
 			  struct ieee80211_tx_rate *rates);
+int mt7615_pm_set_enable(struct mt7615_dev *dev, bool enable);
 void mt7615_pm_wake_work(struct work_struct *work);
 int mt7615_pm_wake(struct mt7615_dev *dev);
 void mt7615_pm_power_save_sched(struct mt7615_dev *dev);
-- 
2.26.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
