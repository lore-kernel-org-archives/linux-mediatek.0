Return-Path: <SRS0=ytEc=GY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B455C433DB
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Jan 2021 06:04:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0959923884
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Jan 2021 06:04:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0959923884
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=163.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OISUk9VgUgsLWc4Zi2aB3geGWs9g3skIBDoJFFQhVMo=; b=FtslqHA2rihzocP0EkOdKpXoUC
	4Xm/kn3yRnWeZ0QqZFLkNrY/64CVLvkAHL2cIISRXogP2DRv/F8QmP5KNKjOKLj97m3nFX8+DOLC+
	fatjl1JTpEg+TAPSWGoRL6FVvFKIBhjJmjCMMRc7cf9pGBgYPIX1lDfQjursiQ1liL1MW48iEp+Wu
	JXq3dDNBO98PaT50t7u/kldnAQ+8eCdPTuI4xdjhQTcZBPlV3NNx4Dx+JEXB1DHyWSYU/f0GGczee
	6oiDDniNaqAtLEu9PG8nvtRE1qYH8p+HuLUDzdeNf2vrlVSYgGAMWpbSDLfNwH+U1y5LPFhRfgj+D
	UmxcHoWA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l2T4P-0007BI-Ld; Thu, 21 Jan 2021 06:03:49 +0000
Received: from m12-17.163.com ([220.181.12.17])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l2T4K-00077z-Lr; Thu, 21 Jan 2021 06:03:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=KtEXc
 ox0mT+oOokFE25ZYZEgpVo5HBdz4Th5NXAN7i8=; b=RsZEw0g021xQbcMXHC2HD
 widS1/cS1RwEsPkOZe2yizrz0S3jAfcU/J1ESDGKqb/DvqaMLxOHwozPPfPTKegn
 l5gfoBlD9UlALmklWBa4leTIibCKH+n9P4pLYKrAF44IjCa5Qf1D9LTsrsOg4aRl
 +qpcVZE78CFLGxYwVqkA4I=
Received: from COOL-20201222LC.ccdomain.com (unknown [218.94.48.178])
 by smtp13 (Coremail) with SMTP id EcCowABXCkIwGQlgfh6Mgw--.52708S2;
 Thu, 21 Jan 2021 14:03:31 +0800 (CST)
From: dingsenjie@163.com
To: linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] mt7915: Convert to DEFINE_SHOW_ATTRIBUTE
Date: Thu, 21 Jan 2021 14:03:24 +0800
Message-Id: <20210121060324.21124-1-dingsenjie@163.com>
X-Mailer: git-send-email 2.21.0.windows.1
MIME-Version: 1.0
X-CM-TRANSID: EcCowABXCkIwGQlgfh6Mgw--.52708S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxZrWrXw45Zw1rXw48AryftFb_yoW5ZF1fpa
 95uayjvr48Jr1kKrZ5JFWUZ3yrGanaq34UZr92934rCF4vqFn5tF4UGFWSvrW0y3y8Cr17
 X3W5Kry3J3yYvr7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jZEfOUUUUU=
X-Originating-IP: [218.94.48.178]
X-CM-SenderInfo: 5glqw25hqmxvi6rwjhhfrp/xtbBRRMhyFPAJqObPgAAsM
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210121_010345_204493_E0EABA15 
X-CRM114-Status: UNSURE (   9.89  )
X-CRM114-Notice: Please train this message.
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
Cc: netdev@vger.kernel.org, dingsenjie <dingsenjie@yulong.com>,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: dingsenjie <dingsenjie@yulong.com>

Use DEFINE_SHOW_ATTRIBUTE macro to simplify the code.

Signed-off-by: dingsenjie <dingsenjie@yulong.com>
---
 .../net/wireless/mediatek/mt76/mt7915/debugfs.c    | 36 ++++------------------
 1 file changed, 6 insertions(+), 30 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c b/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c
index 7d810fb..fa5ce4e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c
@@ -166,7 +166,7 @@ static int mt7915_ser_trigger_set(void *data, u64 val)
 }
 
 static int
-mt7915_tx_stats_read(struct seq_file *file, void *data)
+mt7915_tx_stats_show(struct seq_file *file, void *data)
 {
 	struct mt7915_dev *dev = file->private;
 	int stat[8], i, n;
@@ -196,19 +196,7 @@ static int mt7915_ser_trigger_set(void *data, u64 val)
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
@@ -353,7 +341,7 @@ int mt7915_init_debugfs(struct mt7915_dev *dev)
 				    mt7915_queues_read);
 	debugfs_create_devm_seqfile(dev->mt76.dev, "acq", dir,
 				    mt7915_queues_acq);
-	debugfs_create_file("tx_stats", 0400, dir, dev, &fops_tx_stats);
+	debugfs_create_file("tx_stats", 0400, dir, dev, &mt7915_tx_stats_fops);
 	debugfs_create_file("fw_debug", 0600, dir, dev, &fops_fw_debug);
 	debugfs_create_u32("dfs_hw_pattern", 0400, dir, &dev->hw_pattern);
 	/* test knobs */
@@ -384,7 +372,7 @@ static int mt7915_sta_fixed_rate_set(void *data, u64 rate)
 			 mt7915_sta_fixed_rate_set, "%llx\n");
 
 static int
-mt7915_sta_stats_read(struct seq_file *s, void *data)
+mt7915_sta_stats_show(struct seq_file *s, void *data)
 {
 	struct ieee80211_sta *sta = s->private;
 	struct mt7915_sta *msta = (struct mt7915_sta *)sta->drv_priv;
@@ -427,24 +415,12 @@ static int mt7915_sta_fixed_rate_set(void *data, u64 rate)
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
-- 
1.9.1



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
