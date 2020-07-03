Return-Path: <SRS0=1Iba=AO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EEF2C433DF
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Jul 2020 08:17:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5A54F206A1
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Jul 2020 08:17:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Pd0bxmZR";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="jLAnA30E"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5A54F206A1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=DUR7Nys+JzMf2ERJ7Ko9MMpoMVKd1Glzn+tk1GUp+jk=; b=Pd0bxmZRdyEHGemT3ATltW1PM
	udqyyTyFvP+Ahmbaq2EKcRtUrQTqduakvKbEm/SRs1LmbFp7NO/Xuwa2gk8ZGuaMb5mCTh7Kb8D/V
	MekLcRtWSJmxca/08dRAXarCW7LBtuEnXcqEUujc2Tgb/YCDhCZBvoQwRm7i050O4Hvb5AJ+RG/w+
	NA7DhjGJu0ZTyXotiF5tbVhK1xpNpwfT3UDXgQNpv7xjZEJWxVu0tgNy+3mNiNkfvhAkCYEs0QLPH
	nudrlVM0d0jC1LVbmn0xNArBnKAgxcE0/M6PUnG8BYxDe8LfJS9gKtAjE8K9n23Z5bKLrCVEHKxnZ
	Iy/3vpbgQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jrGsd-0006Tw-HC; Fri, 03 Jul 2020 08:17:07 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jrGsV-0006KH-Kt
 for linux-mediatek@lists.infradead.org; Fri, 03 Jul 2020 08:17:01 +0000
Received: from lore-desk.lan (unknown [151.48.138.186])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 34C41207DA;
 Fri,  3 Jul 2020 08:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593764218;
 bh=sVgBzaRXJyQbarGCE2r9eyGTKuI8Kk1vaXNIUmMHN04=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jLAnA30Efs0EFkYNFAMG45m3q0Wx6vwR9ufXQncN6JjrGConcvSNcS63AJ2zP2wbX
 2XMhqFErUJELaZUrYIBembM3coRT2L80OSnGYPUIRxBXCFrZTobJT8YDCIppgEnhtI
 IgoUz5cqaHODth4LuZTD/osCEnXuiuJuEveIaAsg=
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: nbd@nbd.name
Subject: [PATCH v2 21/22] mt76: mt7615: add idle-timeout knob in mt7615 debugfs
Date: Fri,  3 Jul 2020 10:16:00 +0200
Message-Id: <081a96d82990dfcf9625b0f3602921da7146d5b4.1593763584.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1593763584.git.lorenzo@kernel.org>
References: <cover.1593763584.git.lorenzo@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200703_041659_971557_96A43CF2 
X-CRM114-Status: GOOD (  11.52  )
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
index 77889becf22e..88931658a9fb 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/debugfs.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/debugfs.c
@@ -74,6 +74,29 @@ mt7615_pm_get(void *data, u64 *val)
 
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
@@ -375,6 +398,8 @@ int mt7615_init_debugfs(struct mt7615_dev *dev)
 	debugfs_create_file("dbdc", 0600, dir, dev, &fops_dbdc);
 	debugfs_create_file("fw_debug", 0600, dir, dev, &fops_fw_debug);
 	debugfs_create_file("runtime-pm", 0600, dir, dev, &fops_pm);
+	debugfs_create_file("idle-timeout", 0600, dir, dev,
+			    &fops_pm_idle_timeout);
 	debugfs_create_devm_seqfile(dev->mt76.dev, "radio", dir,
 				    mt7615_radio_read);
 	debugfs_create_u32("dfs_hw_pattern", 0400, dir, &dev->hw_pattern);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/init.c b/drivers/net/wireless/mediatek/mt76/mt7615/init.c
index 0b305c62bbbd..a147891953a1 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/init.c
@@ -465,6 +465,7 @@ void mt7615_init_device(struct mt7615_dev *dev)
 	timer_setup(&dev->phy.roc_timer, mt7615_roc_timer, 0);
 
 	mt7615_init_wiphy(hw);
+	dev->pm.idle_timeout = MT7615_PM_TIMEOUT;
 	dev->mphy.sband_2g.sband.ht_cap.cap |= IEEE80211_HT_CAP_LDPC_CODING;
 	dev->mphy.sband_5g.sband.ht_cap.cap |= IEEE80211_HT_CAP_LDPC_CODING;
 	dev->mphy.sband_5g.sband.vht_cap.cap |=
diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/mac.c b/drivers/net/wireless/mediatek/mt76/mt7615/mac.c
index bdd9b66ca47d..fa7a4148ab07 100644
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
index 46a2a38d0b1f..e60fb52ad1d2 100644
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
