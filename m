Return-Path: <SRS0=FzvZ=IZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA2F3C433DB
	for <linux-mediatek@archiver.kernel.org>; Sat, 27 Mar 2021 10:01:07 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 50D77619FC
	for <linux-mediatek@archiver.kernel.org>; Sat, 27 Mar 2021 10:01:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 50D77619FC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=163.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=sva0Xo3tg+rwZ1p0Phho3dSbriEsxeykhOKh6tovnC0=; b=aWd6uBaflT290MVQciAQYyQVU7
	Qf2RdH/25QQnyCV6w+hZif1qPVK8r36lzbHdLpUmoD5fKHWa9zhR2Z5kdnE6IC8rVTk8TLjGHxRwe
	AVcYK8HPggtnPsNTegmgQECr4NQ9K7zkPe99AgJDztRnkW5H0sW7h33d4U+AFM5PknMCFjndrMJcs
	lIlgNGGiI402mSItRXENwPCAFymaMeCnjX3Z4x305477pqR4IqhGKS6JavgBcOWQ6hgkhwWGmISoP
	mfXbm79ySxh7Lma0pSGRqFeNvTh2jkXDMeEiHTeTebeRIfl3j9OFM1CLHz2TDHi67GK0VZA5cubKv
	lQiZdO0g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lQ5kX-004znG-0T; Sat, 27 Mar 2021 10:00:57 +0000
Received: from m12-12.163.com ([220.181.12.12])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lQ5kL-004zhm-Qn; Sat, 27 Mar 2021 10:00:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=/BhxQ
 Uwk2txft5OcNY5/+TGgju86XAdEU+w3D9UUn18=; b=Tb5KMjFkEX9ortqdiNHNb
 b+atZuiYgbU184k3bQ3N58oP9f5jI5ymermN9LK1b4nAlW0JMPGoC5Ri1bO6tfv3
 dQZC0uC8USyKxFVR8LCvkFGjNHBrfME0QOKXJ19G37yd28uLSA6PzBZtDlhJp80y
 gHMWr5txVmF2O8wd2JCCNc=
Received: from yangjunlin.ccdomain.com (unknown [218.17.89.92])
 by smtp8 (Coremail) with SMTP id DMCowABnb48EAl9gqMu5Wg--.45769S2;
 Sat, 27 Mar 2021 17:59:34 +0800 (CST)
From: angkery <angkery@163.com>
To: nbd@nbd.name, lorenzo.bianconi83@gmail.com, ryder.lee@mediatek.com,
 kvalo@codeaurora.org, davem@davemloft.net, kuba@kernel.org,
 matthias.bgg@gmail.com, shayne.chen@mediatek.com, yiwei.chung@mediatek.com,
 ap420073@gmail.com, sean.wang@mediatek.com, Soul.Huang@mediatek.com
Cc: linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, Junlin Yang <yangjunlin@yulong.com>
Subject: [PATCH] mt76: Convert to DEFINE_SHOW_ATTRIBUTE
Date: Sat, 27 Mar 2021 17:56:17 +0800
Message-Id: <20210327095617.1222-1-angkery@163.com>
X-Mailer: git-send-email 2.24.0.windows.2
MIME-Version: 1.0
X-CM-TRANSID: DMCowABnb48EAl9gqMu5Wg--.45769S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxAr43tr17ury8Zr18Cr1UGFg_yoWrKw1xpa
 95uayUAr48Jr1kKFWkAFWUZa4Skanaq347Zr92934ruF1ktrnYyF4UKFWSvrW0k3y8Cw1U
 Xa1Yyry7GrWYvr7anT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jLWrXUUUUU=
X-Originating-IP: [218.17.89.92]
X-CM-SenderInfo: 5dqjyvlu16il2tof0z/xtbBRgZiI13l-C9qnQAAsd
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210327_100046_286225_40702DF7 
X-CRM114-Status: UNSURE (   8.53  )
X-CRM114-Notice: Please train this message.
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Junlin Yang <yangjunlin@yulong.com>

Use DEFINE_SHOW_ATTRIBUTE macro to simplify the code.

Signed-off-by: Junlin Yang <yangjunlin@yulong.com>
---
 .../net/wireless/mediatek/mt76/mt7915/debugfs.c    | 36 ++++------------------
 .../net/wireless/mediatek/mt76/mt7921/debugfs.c    | 18 ++---------
 2 files changed, 9 insertions(+), 45 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c b/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c
index 77dcd71..7bef36f 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c
@@ -192,7 +192,7 @@ static int mt7915_ser_trigger_set(void *data, u64 val)
 }
 
 static int
-mt7915_tx_stats_read(struct seq_file *file, void *data)
+mt7915_tx_stats_show(struct seq_file *file, void *data)
 {
 	struct mt7915_dev *dev = file->private;
 	int stat[8], i, n;
@@ -222,19 +222,7 @@ static int mt7915_ser_trigger_set(void *data, u64 val)
 	return 0;
 }
 
-static int
-mt7915_tx_stats_open(struct inode *inode, struct file *f)
-{
-	return single_open(f, mt7915_tx_stats_read, inode->i_private);
-}
-
-static const struct file_operations fops_tx_stats = {
-	.open = mt7915_tx_stats_open,
-	.read = seq_read,
-	.llseek = seq_lseek,
-	.release = single_release,
-	.owner = THIS_MODULE,
-};
+DEFINE_SHOW_ATTRIBUTE(mt7915_tx_stats);
 
 static int mt7915_read_temperature(struct seq_file *s, void *data)
 {
@@ -379,7 +367,7 @@ int mt7915_init_debugfs(struct mt7915_dev *dev)
 				    mt7915_queues_read);
 	debugfs_create_devm_seqfile(dev->mt76.dev, "acq", dir,
 				    mt7915_queues_acq);
-	debugfs_create_file("tx_stats", 0400, dir, dev, &fops_tx_stats);
+	debugfs_create_file("tx_stats", 0400, dir, dev, &mt7915_tx_stats_fops);
 	debugfs_create_file("fw_debug", 0600, dir, dev, &fops_fw_debug);
 	debugfs_create_file("implicit_txbf", 0600, dir, dev,
 			    &fops_implicit_txbf);
@@ -412,7 +400,7 @@ static int mt7915_sta_fixed_rate_set(void *data, u64 rate)
 			 mt7915_sta_fixed_rate_set, "%llx\n");
 
 static int
-mt7915_sta_stats_read(struct seq_file *s, void *data)
+mt7915_sta_stats_show(struct seq_file *s, void *data)
 {
 	struct ieee80211_sta *sta = s->private;
 	struct mt7915_sta *msta = (struct mt7915_sta *)sta->drv_priv;
@@ -455,24 +443,12 @@ static int mt7915_sta_fixed_rate_set(void *data, u64 rate)
 	return 0;
 }
 
-static int
-mt7915_sta_stats_open(struct inode *inode, struct file *f)
-{
-	return single_open(f, mt7915_sta_stats_read, inode->i_private);
-}
-
-static const struct file_operations fops_sta_stats = {
-	.open = mt7915_sta_stats_open,
-	.read = seq_read,
-	.llseek = seq_lseek,
-	.release = single_release,
-	.owner = THIS_MODULE,
-};
+DEFINE_SHOW_ATTRIBUTE(mt7915_sta_stats);
 
 void mt7915_sta_add_debugfs(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 			    struct ieee80211_sta *sta, struct dentry *dir)
 {
 	debugfs_create_file("fixed_rate", 0600, dir, sta, &fops_fixed_rate);
-	debugfs_create_file("stats", 0400, dir, sta, &fops_sta_stats);
+	debugfs_create_file("stats", 0400, dir, sta, &mt7915_sta_stats_fops);
 }
 #endif
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/debugfs.c b/drivers/net/wireless/mediatek/mt76/mt7921/debugfs.c
index 0dc8e25..c1a64ff 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/debugfs.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/debugfs.c
@@ -62,7 +62,7 @@
 }
 
 static int
-mt7921_tx_stats_read(struct seq_file *file, void *data)
+mt7921_tx_stats_show(struct seq_file *file, void *data)
 {
 	struct mt7921_dev *dev = file->private;
 	int stat[8], i, n;
@@ -88,19 +88,7 @@
 	return 0;
 }
 
-static int
-mt7921_tx_stats_open(struct inode *inode, struct file *f)
-{
-	return single_open(f, mt7921_tx_stats_read, inode->i_private);
-}
-
-static const struct file_operations fops_tx_stats = {
-	.open = mt7921_tx_stats_open,
-	.read = seq_read,
-	.llseek = seq_lseek,
-	.release = single_release,
-	.owner = THIS_MODULE,
-};
+DEFINE_SHOW_ATTRIBUTE(mt7921_tx_stats);
 
 static int
 mt7921_queues_acq(struct seq_file *s, void *data)
@@ -239,7 +227,7 @@ int mt7921_init_debugfs(struct mt7921_dev *dev)
 				    mt7921_queues_read);
 	debugfs_create_devm_seqfile(dev->mt76.dev, "acq", dir,
 				    mt7921_queues_acq);
-	debugfs_create_file("tx_stats", 0400, dir, dev, &fops_tx_stats);
+	debugfs_create_file("tx_stats", 0400, dir, dev, &mt7921_tx_stats_fops);
 	debugfs_create_file("fw_debug", 0600, dir, dev, &fops_fw_debug);
 	debugfs_create_file("runtime-pm", 0600, dir, dev, &fops_pm);
 	debugfs_create_file("idle-timeout", 0600, dir, dev,
-- 
1.9.1



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
