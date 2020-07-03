Return-Path: <SRS0=1Iba=AO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6D20C433E0
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Jul 2020 08:17:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A976B206A1
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Jul 2020 08:17:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hG53pELR";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="jhwDQ4SQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A976B206A1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ItofSsIaOYY8pBItwHoW+DVLpRlc1j64aCFkL/A+kRI=; b=hG53pELROLavMUQZpbjMjJ17v
	TshKVw2f8wvjiODKxuuWEISh67dBmmRsHC1CVbnOrT8CE4VZwTr9y4mkvoF5cjXjuVgGrXHyMDcTA
	oskP/bZfKfKlFHV5r5qEtzP3veZFxEReyt8agppyP7kXWTWcI7QVc2hUz9XBmwxyPLKSjjU9hA5E6
	6WUtqZh8d8Rxi89ctgT4MZl6wApmcyuLxsD/dWgULEV2idvuxrOmh/f/3R2FDuPrvLvuoBC0n6aJk
	LQ4B1tW5DjWWez7Ir/7zIRmq5UpEgeQQJjX728p2W6gdYU01Wtpisg6Mhmvdim7taeyC9qj50ttnM
	Q3evEGIIw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jrGsc-0006SZ-C3; Fri, 03 Jul 2020 08:17:06 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jrGsR-0006GY-K6
 for linux-mediatek@lists.infradead.org; Fri, 03 Jul 2020 08:16:56 +0000
Received: from lore-desk.lan (unknown [151.48.138.186])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 95196207DA;
 Fri,  3 Jul 2020 08:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593764215;
 bh=jvULFGAvrmSfB33dGGiPYjm6+SjE8fc6AELIQa1FfAA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jhwDQ4SQmHlldq05CVgCdnMKAAxpnUiTVeUnDyJvswkJnOfkF0+eozxMLQvz2Yfp/
 qlivvLi4W3EM7795KBaxIRME5PHlDdcLLyCVK4NQIar0m1O3rFibwlCDCFTQM7+n3a
 mtWLTQfuftNUQJm1IhtbVAugXLMFKKsH1mkawdJg=
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: nbd@nbd.name
Subject: [PATCH v2 19/22] mt76: mt7615: add runtime-pm knob in mt7615 debugfs
Date: Fri,  3 Jul 2020 10:15:58 +0200
Message-Id: <70ed3986f368584bb739a4c87460a5332b74804a.1593763584.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1593763584.git.lorenzo@kernel.org>
References: <cover.1593763584.git.lorenzo@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200703_041655_826504_734EB4B2 
X-CRM114-Status: GOOD (  13.03  )
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

Introduce runtime-pm knob in mt7615 debugfs in order to enable/disable
runtime pm available in offload firmware

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 .../wireless/mediatek/mt76/mt7615/debugfs.c   | 24 +++++++++++++++++++
 .../net/wireless/mediatek/mt76/mt7615/mac.c   | 20 +++++++++++++++-
 .../wireless/mediatek/mt76/mt7615/mt7615.h    |  3 +++
 3 files changed, 46 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/debugfs.c b/drivers/net/wireless/mediatek/mt76/mt7615/debugfs.c
index 8894a0ab407b..77889becf22e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/debugfs.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/debugfs.c
@@ -51,6 +51,29 @@ mt7615_scs_get(void *data, u64 *val)
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
@@ -351,6 +374,7 @@ int mt7615_init_debugfs(struct mt7615_dev *dev)
 	debugfs_create_file("scs", 0600, dir, dev, &fops_scs);
 	debugfs_create_file("dbdc", 0600, dir, dev, &fops_dbdc);
 	debugfs_create_file("fw_debug", 0600, dir, dev, &fops_fw_debug);
+	debugfs_create_file("runtime-pm", 0600, dir, dev, &fops_pm);
 	debugfs_create_devm_seqfile(dev->mt76.dev, "radio", dir,
 				    mt7615_radio_read);
 	debugfs_create_u32("dfs_hw_pattern", 0400, dir, &dev->hw_pattern);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mac.c b/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
index 76751117592b..d7c2c08da3c7 100644
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
 
@@ -1928,6 +1929,23 @@ void mt7615_pm_power_save_work(struct work_struct *work)
 				   MT7615_PM_TIMEOUT);
 }
 
+int mt7615_pm_set_enable(struct mt7615_dev *dev, bool enable)
+{
+	if (!mt7615_firmware_offload(dev) || !mt76_is_mmio(&dev->mt76))
+		return -EOPNOTSUPP;
+
+	mt7615_mutex_acquire(dev);
+
+	if (dev->pm.enable == enable)
+		goto out;
+
+	dev->pm.enable = enable;
+out:
+	mt7615_mutex_release(dev);
+
+	return 0;
+}
+
 void mt7615_mac_work(struct work_struct *work)
 {
 	struct mt7615_phy *phy;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h b/drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h
index 66489f44c1a9..b80bf79e4849 100644
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
