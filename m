Return-Path: <SRS0=hvzu=52=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C425C2BB55
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Apr 2020 09:05:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2072E206F7
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Apr 2020 09:05:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VqsiLjnq";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="HCqn7IaA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2072E206F7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pAwQyaAr8Jib88YeMWvUJ5bO6U3EC4oF8xia0MNkY+g=; b=VqsiLjnqD7mtkH
	h/r4om2sE7d4FXACRG497WXo14x9HuSDt/yXqJ48g8FeYQWPwVqKrpriMAiPra8tEyU4Yi02F5okq
	D5KOqDzRNehiDQYg38fYXuRuQ2Uy1u5xq6F3V7LcUWdtpDwmSR6oUJsMVnqgTmfmW53TvDyGW1u8A
	MFFDOHHis7nwvhcLbG7l18tJQ+Zxen3Hm+gQc6mrcAELlcJDvlCW+IhQZqQB+M7VDzjd8fp3g2Bq+
	7gu28lQ+hJerAQZMh/HC2z9BFDTKETh27/KFZBM2EKT2EY5G6zupXvgObkp+ICko9eEa9eclnqu3L
	eRta0+XCLOizhhXMMhpA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jMpb7-0007zr-Vy; Fri, 10 Apr 2020 09:05:13 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jMpb5-0007Rt-5s
 for linux-mediatek@lists.infradead.org; Fri, 10 Apr 2020 09:05:12 +0000
X-UUID: 697f014d5ac346cd9bc1f3569b2b8651-20200410
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=qyWS56ORXuKTFt6R9fhAFtlmWFnqzyRElQ9sqHDEES4=; 
 b=HCqn7IaApwqct99UL5IiyjsjdGIoDpqMfS4xIZB5zlsaqvelEqU01GRhhW5tMyFos5sX595ObGtQDtvZXGO6moCn/TXrJD6zwgTjwqFTJMDpXPu61yFip0AH1HqhhNmGPNV9O5ARq9PUuZaK5iqPxE2i2zDKeGW4HOpCJvu3s1w=;
X-UUID: 697f014d5ac346cd9bc1f3569b2b8651-20200410
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1458590175; Fri, 10 Apr 2020 01:05:07 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 10 Apr 2020 01:55:05 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 10 Apr 2020 16:55:03 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 10 Apr 2020 16:55:03 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>
Subject: [PATCH 13/16] mt76: mt7915: add .sta_add_debugfs support
Date: Fri, 10 Apr 2020 16:54:50 +0800
Message-ID: <ac3d5091e6333bfad7d3fd9556e58902bdcd4a42.1586507878.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1586507878.git.ryder.lee@mediatek.com>
References: <cover.1586507878.git.ryder.lee@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: F75D78E250F33A7F3C578D9689882F6ABDDA2236168E85009C32C6F6C073B0942000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200410_020511_248790_41F2B6E7 
X-CRM114-Status: UNSURE (   8.54  )
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
