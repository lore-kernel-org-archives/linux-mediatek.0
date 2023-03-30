Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD165C6FD1D
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Mar 2023 22:11:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dzcXFIe6xfhgc1APTrTG7JZEbQeJT6UjUj8mcefKjNI=; b=bmyoqI1epnA825r1tsfBYbVZr+
	rW6+I2LHoDCAbmK7hzfD+xlo88U6YAcohWZGADyIDH40fpIHcCAuTYJGTxZ64Io494UF3m6XtyUnw
	3HFX+QlXsZTORcvVLjpb9dgsB7AOrozx3CKlgq93dibZG/qDBR4gTXeiuu+YRMsXCJvEkHRJV91MI
	ZT+ohTNtfzP/aXNmGTo9ySBWmHUecxcw9rVQ8hcp4daQeSfQ73kF4Cn28sXwlGztoyzMgvDw18CV+
	ZkEl6e/s6pZNkqIv/ibtCivol9WdwBhqDOTTrF9PR58kJ1ZEeWRgFLIc7mT0lW9T04J3EjMBH7AiM
	6/GDV8Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pi0U6-005Bwf-39;
	Thu, 30 Mar 2023 22:11:06 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pi0U3-005BvR-2w
	for linux-mediatek@lists.infradead.org;
	Thu, 30 Mar 2023 22:11:05 +0000
X-UUID: bd75553acf4711ed8687db9d93187ff1-20230330
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=dzcXFIe6xfhgc1APTrTG7JZEbQeJT6UjUj8mcefKjNI=;
	b=pmM9WXHCIeJJRtspyhketl5J/sJj9MtlPiGJjh5rBQx6B12PbmpgaCQkxXgGiP1sGYtozJA1+cZOMK3/5TkkYOgY6/kZyH4aePBDURQp3bMq1EuU1TxGK6dFA34ervHPPG3d84VEiPeLHqYh1NE2nHLKqY9DPKLTIlK3JvaJfjM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22,REQID:f6ad5769-abdb-4aca-8d5e-d6101b46cb3f,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:120426c,CLOUDID:456d022a-564d-42d9-9875-7c868ee415ec,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-UUID: bd75553acf4711ed8687db9d93187ff1-20230330
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <ryder.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 108836200; Thu, 30 Mar 2023 15:10:54 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Fri, 31 Mar 2023 06:10:19 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Fri, 31 Mar 2023 06:10:19 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, <linux-wireless@vger.kernel.org>
CC: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Shayne Chen
	<shayne.chen@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>,
	<linux-mediatek@lists.infradead.org>, Ryder Lee <ryder.lee@mediatek.com>
Subject: [PATCH] wifi: mt76: mt7915: drop redundant prefix of mt7915_txpower_puts()
Date: Fri, 31 Mar 2023 06:10:17 +0800
Message-ID: <7354540481df61f7768a395c5ccb7859bdbc35e9.1680214066.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230330_151103_968801_9CDA80C6 
X-CRM114-Status: UNSURE (   9.23  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Just a cosmetic patch to drop redundant prefix for txpower ouput text.

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 .../wireless/mediatek/mt76/mt7915/debugfs.c   | 36 +++++++++----------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c b/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c
index 5a46813a59ea..879884ead660 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c
@@ -958,10 +958,10 @@ mt7915_xmit_queues_show(struct seq_file *file, void *data)
 
 DEFINE_SHOW_ATTRIBUTE(mt7915_xmit_queues);
 
-#define mt7915_txpower_puts(prefix, rate)					\
+#define mt7915_txpower_puts(rate)						\
 ({										\
-	len += scnprintf(buf + len, sz - len, "%-16s:", #prefix " (tmac)");	\
-	for (i = 0; i < mt7915_sku_group_len[rate]; i++, offs++)		\
+	len += scnprintf(buf + len, sz - len, "%-16s:", #rate " (TMAC)");	\
+	for (i = 0; i < mt7915_sku_group_len[SKU_##rate]; i++, offs++)		\
 		len += scnprintf(buf + len, sz - len, " %6d", txpwr[offs]);	\
 	len += scnprintf(buf + len, sz - len, "\n");				\
 })
@@ -1004,41 +1004,41 @@ mt7915_rate_txpower_get(struct file *file, char __user *user_buf,
 			 phy != &dev->phy, phy->mt76->chandef.chan->hw_value);
 	len += scnprintf(buf + len, sz - len, "%-16s  %6s %6s %6s %6s\n",
 			 " ", "1m", "2m", "5m", "11m");
-	mt7915_txpower_puts(CCK, SKU_CCK);
+	mt7915_txpower_puts(CCK);
 
 	len += scnprintf(buf + len, sz - len,
 			 "%-16s  %6s %6s %6s %6s %6s %6s %6s %6s\n",
 			 " ", "6m", "9m", "12m", "18m", "24m", "36m", "48m",
 			 "54m");
-	mt7915_txpower_puts(OFDM, SKU_OFDM);
+	mt7915_txpower_puts(OFDM);
 
 	len += scnprintf(buf + len, sz - len,
 			 "%-16s  %6s %6s %6s %6s %6s %6s %6s %6s\n",
 			 " ", "mcs0", "mcs1", "mcs2", "mcs3", "mcs4",
 			 "mcs5", "mcs6", "mcs7");
-	mt7915_txpower_puts(HT20, SKU_HT_BW20);
+	mt7915_txpower_puts(HT_BW20);
 
 	len += scnprintf(buf + len, sz - len,
 			 "%-16s  %6s %6s %6s %6s %6s %6s %6s %6s %6s\n",
 			 " ", "mcs0", "mcs1", "mcs2", "mcs3", "mcs4", "mcs5",
 			 "mcs6", "mcs7", "mcs32");
-	mt7915_txpower_puts(HT40, SKU_HT_BW40);
+	mt7915_txpower_puts(HT_BW40);
 
 	len += scnprintf(buf + len, sz - len,
 			 "%-16s  %6s %6s %6s %6s %6s %6s %6s %6s %6s %6s %6s %6s\n",
 			 " ", "mcs0", "mcs1", "mcs2", "mcs3", "mcs4", "mcs5",
 			 "mcs6", "mcs7", "mcs8", "mcs9", "mcs10", "mcs11");
-	mt7915_txpower_puts(VHT20, SKU_VHT_BW20);
-	mt7915_txpower_puts(VHT40, SKU_VHT_BW40);
-	mt7915_txpower_puts(VHT80, SKU_VHT_BW80);
-	mt7915_txpower_puts(VHT160, SKU_VHT_BW160);
-	mt7915_txpower_puts(HE26, SKU_HE_RU26);
-	mt7915_txpower_puts(HE52, SKU_HE_RU52);
-	mt7915_txpower_puts(HE106, SKU_HE_RU106);
-	mt7915_txpower_puts(HE242, SKU_HE_RU242);
-	mt7915_txpower_puts(HE484, SKU_HE_RU484);
-	mt7915_txpower_puts(HE996, SKU_HE_RU996);
-	mt7915_txpower_puts(HE996x2, SKU_HE_RU2x996);
+	mt7915_txpower_puts(VHT_BW20);
+	mt7915_txpower_puts(VHT_BW40);
+	mt7915_txpower_puts(VHT_BW80);
+	mt7915_txpower_puts(VHT_BW160);
+	mt7915_txpower_puts(HE_RU26);
+	mt7915_txpower_puts(HE_RU52);
+	mt7915_txpower_puts(HE_RU106);
+	mt7915_txpower_puts(HE_RU242);
+	mt7915_txpower_puts(HE_RU484);
+	mt7915_txpower_puts(HE_RU996);
+	mt7915_txpower_puts(HE_RU2x996);
 
 	reg = is_mt7915(&dev->mt76) ? MT_WF_PHY_TPC_CTRL_STAT(band) :
 	      MT_WF_PHY_TPC_CTRL_STAT_MT7916(band);
-- 
2.18.0


