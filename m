Return-Path: <SRS0=jJra=56=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B351C2BB1D
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Apr 2020 21:11:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DA3ED2076A
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Apr 2020 21:11:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jBHBowO/";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="V4uUnRB/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DA3ED2076A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y9FBIpqf20WpZNfpnLzRVQnSF7bznVUXQ2At9rixiic=; b=jBHBowO/V86mAk
	GtbkPlTDnOx5aYagfHQcznJOIYgkMtLBIMsl3kMK53WJ5i9PXs7nlHD8X4KS690tUlW8htpKCCrdB
	RdT3eTrArCE5Tq4X3d7ehdtVJ8c8a7p53zsvEvZLHV3MTrKdsJ7I+bhHeSKZB1TBqXEfiw2jg2bSr
	OeGACcAa/noSgtdl/Ur6KlzK9VNAOr0zQGbic04u3JiJrF47WAoU8HSrHoiZZjpIhxyuYXRnGrKzN
	0N+q4Bkpaxr3WJFWaV6b04XzMpPEtnfOklSKWHZ6cngvEMiLy3dKff4dCLw4vXFzgfZygPh9mIv7A
	g7qmCYivqx8pCGTb3FFA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jOSqT-0005Tb-8y; Tue, 14 Apr 2020 21:11:49 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jOSqN-0005GL-JR
 for linux-mediatek@lists.infradead.org; Tue, 14 Apr 2020 21:11:45 +0000
X-UUID: a0f84d98c8fd4c68a44800c556f1b276-20200414
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=FU4fnFK6FjATZkPgOccxNKSpbEJPY03LnfTBWhP01rs=; 
 b=V4uUnRB/aJn1xvjCfZX15XCOE2pJavLn60RI45q7KuFJJmPV7jPV71bSr2gwtb0G+5UeHUtJLUXiVaS9vrc0qfYawBEZJ0a3hc5/Zt64CVeriN9asE3WI9unH3mckdDBZ25jmnWlZrtlrur7XPAY4ngUINTIBEkt+ZdKrvLrwCc=;
X-UUID: a0f84d98c8fd4c68a44800c556f1b276-20200414
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 147170057; Tue, 14 Apr 2020 13:11:40 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 14 Apr 2020 14:01:33 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 15 Apr 2020 05:01:35 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 15 Apr 2020 05:01:33 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>
Subject: [PATCH v2 13/18] mt76: mt7915: add .sta_add_debugfs support
Date: Wed, 15 Apr 2020 05:01:11 +0800
Message-ID: <14ea40af9346cbd3964d56756e298e2dde172b2d.1586895593.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1586895593.git.ryder.lee@mediatek.com>
References: <cover.1586895593.git.ryder.lee@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200414_141143_690131_7E6588E1 
X-CRM114-Status: UNSURE (   9.29  )
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
index 2e3f05f73697..7f67a1a8013b 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c
@@ -302,3 +302,68 @@ int mt7915_init_debugfs(struct mt7915_dev *dev)
 
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
index 097225692026..6cb69ae6cb0e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/main.c
@@ -746,4 +746,7 @@ const struct ieee80211_ops mt7915_ops = {
 	.get_antenna = mt76_get_antenna,
 	.set_antenna = mt7915_set_antenna,
 	.set_coverage_class = mt7915_set_coverage_class,
+#ifdef CONFIG_MAC80211_DEBUGFS
+	.sta_add_debugfs = mt7915_sta_add_debugfs,
+#endif
 };
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h b/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
index 92a6bf746d73..35e34d270c15 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
@@ -448,5 +448,9 @@ int mt7915_dfs_init_radar_detector(struct mt7915_phy *phy);
 void mt7915_set_stream_he_caps(struct mt7915_phy *phy);
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
