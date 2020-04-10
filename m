Return-Path: <SRS0=hvzu=52=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1D75C2D0EC
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Apr 2020 23:02:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8561120801
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Apr 2020 23:02:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QpwJsFca";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="FykfxpXh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8561120801
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pAwQyaAr8Jib88YeMWvUJ5bO6U3EC4oF8xia0MNkY+g=; b=QpwJsFca+/P1eV
	DQHSHASFTFGpnHzaC3ob5aEBAY5sTBca93r5yH+7eaWjBfOWi7idfI8jH069GmhpaE/36yK1dxFTU
	k9pkpTudKhJf/pMxzSpqsrzuTMmsMxi6mKsE/y6AlcpRlmHEzzU7LTTRAkEzEGQO3zFVe2EdFkxoF
	Q8TTLnlj3fyLIEt6P4BOVxenvmcQw764qPPp4j32XkhEmdYz8uKRItN71IwrzTQiPkX3WryHKQk6K
	O+rp/mN24m8hURHxgKvf98tvUW5NzjCbkIDAXJ9r/zhGIEPHWbOqrfgy6Rij7+KALlhc7oJdkiy29
	B9f2O3L5rWgWRZFYmSnA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jN2et-0000Da-EV; Fri, 10 Apr 2020 23:01:59 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jN2er-0000Cc-3D
 for linux-mediatek@lists.infradead.org; Fri, 10 Apr 2020 23:01:58 +0000
X-UUID: aff3e4e25dde41e3bd2c260c024a7e0b-20200410
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=qyWS56ORXuKTFt6R9fhAFtlmWFnqzyRElQ9sqHDEES4=; 
 b=FykfxpXhu9YIrsWB119m5iUebq4gmRjQgQm0+vQ8YzmDUQB83uIR7HAV8HAhddFmvcMwSoQD35IGYqQJTzSmoKWLGu9uZGNtEb0SCnrKk61LcKM8H0sJyunaTYzlhKbEuuHqtoT+w596ZjpMcfaQetb7Lo7fjTMr4aeuSmm4vzE=;
X-UUID: aff3e4e25dde41e3bd2c260c024a7e0b-20200410
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 970883851; Fri, 10 Apr 2020 15:01:56 -0800
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 10 Apr 2020 15:51:56 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 11 Apr 2020 06:51:55 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sat, 11 Apr 2020 06:51:50 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>
Subject: [PATCH v1 13/16] mt76: mt7915: add .sta_add_debugfs support
Date: Sat, 11 Apr 2020 06:51:28 +0800
Message-ID: <69e27b40a6fcff8cb705455d7a9ed57cdb0983cf.1586558901.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1586558901.git.ryder.lee@mediatek.com>
References: <cover.1586558901.git.ryder.lee@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: A3AC37CD68751AB5FD974D295ECFCDA46AA5F5B330282B601BFF88250786632E2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200410_160157_147362_D77826F3 
X-CRM114-Status: UNSURE (   8.79  )
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
Cc: YF Luo <yf.luo@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>,
 linux-wireless@vger.kernel.org, Sean
 Wang <sean.wang@mediatek.com>, Chih-Min Chen <chih-min.chen@mediatek.com>,
 Ryder Lee <ryder.lee@mediatek.com>, Yiwei Chung <yiwei.chung@mediatek.com>,
 linux-mediatek@lists.infradead.org, Shayne Chen <shayne.chen@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This generation supports much more per-peer statistics than legacy ones,
so add .sta_add_debugfs accordingly.

This is convenient to set/get more settings/counters in the long run.

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 .../wireless/mediatek/mt76/mt7915/debugfs.c   | 65 +++++++++++++++++++
 .../net/wireless/mediatek/mt76/mt7915/main.c  |  3 +
 .../wireless/mediatek/mt76/mt7915/mt7915.h    |  4 ++
 3 files changed, 72 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c b/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c
index 34df2d8cdb8f..27f523d69618 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c
@@ -299,3 +299,68 @@ int mt7915_init_debugfs(struct mt7915_dev *dev)
 
 	return 0;
 }
+
+/** per-station debugfs **/
+
+static int
+mt7915_sta_stats_read(struct seq_file *s, void *data)
+{
+	struct ieee80211_sta *sta = s->private;
+	struct mt7915_sta *msta = (struct mt7915_sta *)sta->drv_priv;
+	struct mt7915_sta_stats *stats = &msta->stats;
+	struct rate_info *rate = &stats->prob_rate;
+	static const char * const bw[] = {
+		"BW20", "BW5", "BW10", "BW40",
+		"BW80", "BW160", "BW_HE_RU"
+	};
+
+	if (!rate->legacy && !rate->flags)
+		return 0;
+
+	seq_puts(s, "Probing rate - ");
+	if (rate->flags & RATE_INFO_FLAGS_MCS)
+		seq_puts(s, "HT ");
+	else if (rate->flags & RATE_INFO_FLAGS_VHT_MCS)
+		seq_puts(s, "VHT ");
+	else if (rate->flags & RATE_INFO_FLAGS_HE_MCS)
+		seq_puts(s, "HE ");
+	else
+		seq_printf(s, "Bitrate %d\n", rate->legacy);
+
+	if (rate->flags) {
+		seq_printf(s, "%s NSS%d MCS%d ",
+			   bw[rate->bw], rate->nss, rate->mcs);
+
+		if (rate->flags & RATE_INFO_FLAGS_SHORT_GI)
+			seq_puts(s, "SGI ");
+		else if (rate->he_gi)
+			seq_puts(s, "HE GI ");
+
+		if (rate->he_dcm)
+			seq_puts(s, "DCM ");
+	}
+
+	seq_printf(s, "\nPPDU PER: %ld.%1ld%%\n",
+		   stats->per / 10, stats->per % 10);
+
+	return 0;
+}
+
+static int
+mt7915_sta_stats_open(struct inode *inode, struct file *f)
+{
+	return single_open(f, mt7915_sta_stats_read, inode->i_private);
+}
+
+static const struct file_operations fops_sta_stats = {
+	.open = mt7915_sta_stats_open,
+	.read = seq_read,
+	.llseek = seq_lseek,
+	.release = single_release,
+};
+
+void mt7915_sta_add_debugfs(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
+			    struct ieee80211_sta *sta, struct dentry *dir)
+{
+	debugfs_create_file("stats", 0400, dir, sta, &fops_sta_stats);
+}
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/main.c b/drivers/net/wireless/mediatek/mt76/mt7915/main.c
index 78e792ad782e..801c93aa0bd8 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/main.c
@@ -748,4 +748,7 @@ const struct ieee80211_ops mt7915_ops = {
 	.get_antenna = mt76_get_antenna,
 	.set_antenna = mt7915_set_antenna,
 	.set_coverage_class = mt7915_set_coverage_class,
+#ifdef CONFIG_MAC80211_DEBUGFS
+	.sta_add_debugfs = mt7915_sta_add_debugfs,
+#endif
 };
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h b/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
index 694519836014..ae3866d0a47a 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
@@ -447,5 +447,9 @@ int mt7915_dfs_init_radar_detector(struct mt7915_phy *phy);
 void mt7915_set_stream_he_caps(struct mt7915_dev *dev);
 void mt7915_update_channel(struct mt76_dev *mdev);
 int mt7915_init_debugfs(struct mt7915_dev *dev);
+#ifdef CONFIG_MAC80211_DEBUGFS
+void mt7915_sta_add_debugfs(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
+			    struct ieee80211_sta *sta, struct dentry *dir);
+#endif
 
 #endif
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
