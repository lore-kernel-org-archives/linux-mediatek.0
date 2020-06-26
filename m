Return-Path: <SRS0=tuDC=AH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70547C433E1
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Jun 2020 21:26:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3D6C920B1F
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Jun 2020 21:26:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AR7qk5I6";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="rZUMEIVD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3D6C920B1F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=p4lkACMVkzunJNyEAMx9ABJyvNrNRfCZ3Lf5FJELia0=; b=AR7qk5I6kjsoHkgKnOavT/iKR
	lqG6Sif97yxSHsxdgWUlKhW11OtIRgQ7BYNXRpqrbMSzqf/cZYp6kXjxpdiiehRCL33sZls5kSWS7
	SpOKN6fuBi3Ly2DYO2vK3sBKe1giW006XQlSlikpkOlG/HNblgz2/5CXAgaW/lJCT0Hd6f7wJcI9b
	2MqTqLpfb8DlznHaOoEPk9IMWWGPoBbz8/JGChRHc/ClOpYzKTLmExDkid4vWg7POdsnDqHzynFWx
	qrO3G+xYHpVtXx1kLOIm0DT4+aRGkiR9La8f8qPt+/A0M8X+kgzd4P69KEb5wf5CNbOV18RtZ7jxl
	YciXcIOcw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jovrR-0002Mm-4E; Fri, 26 Jun 2020 21:26:13 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jovrG-0002AG-1K
 for linux-mediatek@lists.infradead.org; Fri, 26 Jun 2020 21:26:03 +0000
Received: from localhost.localdomain.com (unknown [151.48.138.186])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EF32520B1F;
 Fri, 26 Jun 2020 21:25:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593206761;
 bh=rs/tThQUT0zyXGwo/wQ1egLkcyTxG+blDV3R49QluiE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=rZUMEIVDc2FmBIokQo+jjsSViDOYhTS5QY0LXVaS/3tLr/MBWUzNp8RzJuz0McGC4
 nvTTOPHB291WstMT4WdQPZFbpiUCw9mKiQvhEk/TfqXGjDGCMY/vAMDwk/SbRHzz9w
 j2QK7k6OlNnJSuD+sIDPSSxxmpNiNPmRHSfb3K74=
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: nbd@nbd.name
Subject: [PATCH 16/17] mt76: mt7615: add idle-timeout knob in mt7615 debugfs
Date: Fri, 26 Jun 2020 23:25:16 +0200
Message-Id: <ec71634b8fcfb3f85c2e9ba07b65421e10d3e68c.1593204577.git.lorenzo@kernel.org>
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

Introduce idle-timeout knob in mt7615 debugfs in order to configure the
idle time to switch to low-power state

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 .../wireless/mediatek/mt76/mt7615/debugfs.c   | 25 +++++++++++++++++++
 .../net/wireless/mediatek/mt76/mt7615/init.c  |  1 +
 .../net/wireless/mediatek/mt76/mt7615/mac.c   |  4 +--
 .../wireless/mediatek/mt76/mt7615/mt7615.h    |  1 +
 4 files changed, 29 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/debugfs.c b/drivers/net/wireless/mediatek/mt76/mt7615/debugfs.c
index 357b3c2fc3f9..9d58ddae0338 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/debugfs.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/debugfs.c
@@ -69,6 +69,29 @@ mt7615_pm_get(void *data, u64 *val)
 
 DEFINE_DEBUGFS_ATTRIBUTE(fops_pm, mt7615_pm_get, mt7615_pm_set, "%lld\n");
 
+static int
+mt7615_pm_idle_timeout_set(void *data, u64 val)
+{
+	struct mt7615_dev *dev = data;
+
+	dev->pm.idle_timeout = msecs_to_jiffies(val);
+
+	return 0;
+}
+
+static int
+mt7615_pm_idle_timeout_get(void *data, u64 *val)
+{
+	struct mt7615_dev *dev = data;
+
+	*val = jiffies_to_msecs(dev->pm.idle_timeout);
+
+	return 0;
+}
+
+DEFINE_DEBUGFS_ATTRIBUTE(fops_pm_idle_timeout, mt7615_pm_idle_timeout_get,
+			 mt7615_pm_idle_timeout_set, "%lld\n");
+
 static int
 mt7615_dbdc_set(void *data, u64 val)
 {
@@ -360,6 +383,8 @@ int mt7615_init_debugfs(struct mt7615_dev *dev)
 	debugfs_create_file("dbdc", 0600, dir, dev, &fops_dbdc);
 	debugfs_create_file("fw_debug", 0600, dir, dev, &fops_fw_debug);
 	debugfs_create_file("runtime-pm", 0600, dir, dev, &fops_pm);
+	debugfs_create_file("idle-timeout", 0600, dir, dev,
+			    &fops_pm_idle_timeout);
 	debugfs_create_devm_seqfile(dev->mt76.dev, "radio", dir,
 				    mt7615_radio_read);
 	debugfs_create_u32("dfs_hw_pattern", 0400, dir, &dev->hw_pattern);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/init.c b/drivers/net/wireless/mediatek/mt76/mt7615/init.c
index e799f93be510..e26cf762e416 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/init.c
@@ -463,6 +463,7 @@ void mt7615_init_device(struct mt7615_dev *dev)
 	timer_setup(&dev->phy.roc_timer, mt7615_roc_timer, 0);
 
 	mt7615_init_wiphy(hw);
+	dev->pm.idle_timeout = MT7615_PM_TIMEOUT;
 	dev->mphy.sband_2g.sband.ht_cap.cap |= IEEE80211_HT_CAP_LDPC_CODING;
 	dev->mphy.sband_5g.sband.ht_cap.cap |= IEEE80211_HT_CAP_LDPC_CODING;
 	dev->mphy.sband_5g.sband.vht_cap.cap |=
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mac.c b/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
index e93d229a7887..cb61a19bc7ce 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
@@ -1913,7 +1913,7 @@ void mt7615_pm_power_save_sched(struct mt7615_dev *dev)
 	dev->pm.last_activity = jiffies;
 	if (!test_bit(MT76_STATE_PM, &mphy->state))
 		queue_delayed_work(dev->mt76.wq, &dev->pm.ps_work,
-				   MT7615_PM_TIMEOUT);
+				   dev->pm.idle_timeout);
 }
 EXPORT_SYMBOL_GPL(mt7615_pm_power_save_sched);
 
@@ -1926,7 +1926,7 @@ void mt7615_pm_power_save_work(struct work_struct *work)
 
 	if (mt7615_firmware_own(dev))
 		queue_delayed_work(dev->mt76.wq, &dev->pm.ps_work,
-				   MT7615_PM_TIMEOUT);
+				   dev->pm.idle_timeout);
 }
 
 static void
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h b/drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h
index 9591dedee416..d3360196c76a 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/mt7615.h
@@ -313,6 +313,7 @@ struct mt7615_dev {
 
 		struct delayed_work ps_work;
 		unsigned long last_activity;
+		unsigned long idle_timeout;
 	} pm;
 };
 
-- 
2.26.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
