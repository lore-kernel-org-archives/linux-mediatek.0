Return-Path: <SRS0=QBiq=PI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33A00C433FE
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Oct 2021 20:58:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E7742611ED
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Oct 2021 20:58:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E7742611ED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CoHNnxg8mfA9WJX5npzSoato4MoWMExkrrTjmA7laAQ=; b=oQYNLWtY2CL2uc
	LTa/k8/HLstHJKEMygK6paRc7BQCyeYoHNXQd6YG7uRx95f4kiYfjPyfL2buwXowQKn+ARJLDA9CM
	dvhkaCwFZhrlFtmk+Sht9ivzhRnudAt2j8bIxH0RXyHv2yTO/gFszLizUpbjsx7M1Tf2G35vwx5GE
	UBO5jE0SRZU6al7Zb+cPumompcAJT9LTvGQ/JYQqBoyxjZ81KYAGQnQf9aRQQcECWYwKcSoJ7tMrD
	O1XuJpCmgCxq2xWZUz6hPleuUkPig5wuQJz83hINCPr2rhsOAbITT7d92ccGz6c6fEnA2Gccxes9z
	6JBQuSROy2AFRkvtp9NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdIf6-005mr1-88; Wed, 20 Oct 2021 20:58:12 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdIf2-005mnZ-Vy
 for linux-mediatek@lists.infradead.org; Wed, 20 Oct 2021 20:58:10 +0000
X-UUID: 66f5f1bb9104457da68eb1b9565db7e4-20211020
X-UUID: 66f5f1bb9104457da68eb1b9565db7e4-20211020
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 946944089; Wed, 20 Oct 2021 13:58:03 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 20 Oct 2021 13:58:01 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Thu, 21 Oct 2021 04:58:00 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 21 Oct 2021 04:57:59 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Shayne Chen
 <shayne.chen@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>,
 <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>, Ryder
 Lee <ryder.lee@mediatek.com>
Subject: [PATCH v4 3/3] mt76: mt7915: rework debugfs fixed-rate knob
Date: Thu, 21 Oct 2021 04:57:56 +0800
Message-ID: <73ca239e7da0dd6d6dbf7d0f215ba770e472c1dd.1634755282.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <142086982cd0a7d701e1b6d8891865113d019349.1634755281.git.ryder.lee@mediatek.com>
References: <142086982cd0a7d701e1b6d8891865113d019349.1634755281.git.ryder.lee@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211020_135809_056371_28F13AEA 
X-CRM114-Status: GOOD (  14.00  )
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

Switch to use new mt7915_mcu_set_fixed_rate_ctrl().

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
v4 - rebase.
---
 .../wireless/mediatek/mt76/mt7915/debugfs.c   | 68 ++++++++++++++++---
 .../net/wireless/mediatek/mt76/mt7915/mcu.c   |  1 +
 .../wireless/mediatek/mt76/mt7915/mt7915.h    |  2 -
 3 files changed, 61 insertions(+), 10 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c b/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c
index 4b7f38fcbe64..4bd2a5c7f72d 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c
@@ -481,19 +481,71 @@ int mt7915_init_debugfs(struct mt7915_phy *phy)
 #ifdef CONFIG_MAC80211_DEBUGFS
 /** per-station debugfs **/
 
-static int mt7915_sta_fixed_rate_set(void *data, u64 rate)
+static ssize_t mt7915_sta_fixed_rate_set(struct file *file,
+					 const char __user *user_buf,
+					 size_t count, loff_t *ppos)
 {
-	struct ieee80211_sta *sta = data;
+	struct ieee80211_sta *sta = file->private_data;
 	struct mt7915_sta *msta = (struct mt7915_sta *)sta->drv_priv;
-
-	/* usage: <he ltf> <tx mode> <ldpc> <stbc> <bw> <gi> <nss> <mcs>
-	 * <tx mode>: see enum mt76_phy_type
+	struct mt7915_dev *dev = msta->vif->phy->dev;
+	struct ieee80211_vif *vif;
+	struct sta_phy phy = {};
+	char buf[100];
+	int ret;
+	u32 field;
+	u8 i, gi, he_ltf;
+
+	if (count >= sizeof(buf))
+		return -EINVAL;
+
+	if (copy_from_user(buf, user_buf, count))
+		return -EFAULT;
+
+	if (count && buf[count - 1] == '\n')
+		buf[count - 1] = '\0';
+	else
+		buf[count] = '\0';
+
+	/* mode - cck: 0, ofdm: 1, ht: 2, gf: 3, vht: 4, he_su: 8, he_er: 9
+	 * bw - bw20: 0, bw40: 1, bw80: 2, bw160: 3
+	 * nss - vht: 1~4, he: 1~4, others: ignore
+	 * mcs - cck: 0~4, ofdm: 0~7, ht: 0~32, vht: 0~9, he_su: 0~11, he_er: 0~2
+	 * gi - (ht/vht) lgi: 0, sgi: 1; (he) 0.8us: 0, 1.6us: 1, 3.2us: 2
+	 * ldpc - off: 0, on: 1
+	 * stbc - off: 0, on: 1
+	 * he_ltf - 1xltf: 0, 2xltf: 1, 4xltf: 2
 	 */
-	return mt7915_mcu_set_fixed_rate(msta->vif->phy->dev, sta, rate);
+	if (sscanf(buf, "%hhu %hhu %hhu %hhu %hhu %hhu %hhu %hhu",
+		   &phy.type, &phy.bw, &phy.nss, &phy.mcs, &gi,
+		   &phy.ldpc, &phy.stbc, &he_ltf) != 8) {
+		dev_warn(dev->mt76.dev,
+			 "format: Mode BW NSS MCS (HE)GI LDPC STBC HE_LTF\n");
+		field = RATE_PARAM_AUTO;
+		goto out;
+	}
+
+	phy.ldpc = (phy.bw || phy.ldpc) * GENMASK(2, 0);
+	for (i = 0; i <= phy.bw; i++) {
+		phy.sgi |= gi << (i << sta->he_cap.has_he);
+		phy.he_ltf |= he_ltf << (i << sta->he_cap.has_he);
+	}
+	field = RATE_PARAM_FIXED;
+
+out:
+	vif = container_of((void *)msta->vif, struct ieee80211_vif, drv_priv);
+	ret = mt7915_mcu_set_fixed_rate_ctrl(dev, vif, sta, &phy, field);
+	if (ret)
+		return -EFAULT;
+
+	return count;
 }
 
-DEFINE_DEBUGFS_ATTRIBUTE(fops_fixed_rate, NULL,
-			 mt7915_sta_fixed_rate_set, "%llx\n");
+static const struct file_operations fops_fixed_rate = {
+	.write = mt7915_sta_fixed_rate_set,
+	.open = simple_open,
+	.owner = THIS_MODULE,
+	.llseek = default_llseek,
+};
 
 static int
 mt7915_queues_show(struct seq_file *s, void *data)
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
index aa7964788a1c..6c93ca24307f 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
@@ -2073,6 +2073,7 @@ int mt7915_mcu_set_fixed_rate_ctrl(struct mt7915_dev *dev,
 	switch (field) {
 	case RATE_PARAM_AUTO:
 		break;
+	case RATE_PARAM_FIXED:
 	case RATE_PARAM_FIXED_MCS:
 	case RATE_PARAM_FIXED_GI:
 	case RATE_PARAM_FIXED_HE_LTF:
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h b/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
index 7a328fc774a7..d11b87d47ca1 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
@@ -416,8 +416,6 @@ int mt7915_set_channel(struct mt7915_phy *phy);
 int mt7915_mcu_set_chan_info(struct mt7915_phy *phy, int cmd);
 int mt7915_mcu_set_tx(struct mt7915_dev *dev, struct ieee80211_vif *vif);
 int mt7915_mcu_update_edca(struct mt7915_dev *dev, void *req);
-int mt7915_mcu_set_fixed_rate(struct mt7915_dev *dev,
-			      struct ieee80211_sta *sta, u32 rate);
 int mt7915_mcu_set_fixed_rate_ctrl(struct mt7915_dev *dev,
 				   struct ieee80211_vif *vif,
 				   struct ieee80211_sta *sta,
-- 
2.29.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
