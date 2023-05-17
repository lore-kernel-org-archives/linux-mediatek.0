Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE13EC77B75
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 May 2023 17:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mlHnmfMVWOkrXN2k6M2NNo4a/YNgR/yy93IFw7b3w8w=; b=iLTUuu5nrM/42gxXJWBWGYEAsl
	Pdu85QQB6sWSoU9dEb/uHBgVsEM8BL5l1HYHZ2ggvgtz7GL45FqBKF/Bo1G0uVMGbba5BPSM7dlsg
	VwzLvHzlHpk2dyu1pUKVhbnU42RMT5egElEpuBg/tJhlvutpo7TnDy+4nu+JVy8DT6sT9JigKz/ub
	7jcZPYpnutLlbJfdCxBQ10sg7QUgKMZZ7ttJ9qT6gO56jyB1I4OzllhH445yIaLTAzQkMosejob7S
	wGPXItRkIpCvvY3hi4zfsmxY0jitaIJ33efVwfJuxiWJmE/AOTQtcpYGrx4REtGDAHb8l3Hb6tDZL
	956r4SRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzLHm-00AeKA-1a;
	Wed, 17 May 2023 17:50:02 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzLHj-00AeIE-1d
	for linux-mediatek@lists.infradead.org;
	Wed, 17 May 2023 17:50:01 +0000
X-UUID: 1f7b5d90f4d911ed83ed1395ce914268-20230517
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=mlHnmfMVWOkrXN2k6M2NNo4a/YNgR/yy93IFw7b3w8w=;
	b=bot7BWp5FhsZvtzEZB6TOXkQVnW3dMSjz9bIhL9F4flbBaewQeCZHNRYybPAXhuNJamjpEnYvQPRgjjJUxcreMcU+WnygE+MKXhcoR7jECoqyragr+H+i8TDWbSa7c+q1YwVgqRJfvzdBx2peS63OPXVgcB13EYQkjz7V3jhDUc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.25,REQID:b97a9d46-1bd4-46c9-af24-bfb9d2ad2b1d,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:100
X-CID-INFO: VERSION:1.1.25,REQID:b97a9d46-1bd4-46c9-af24-bfb9d2ad2b1d,IP:0,URL
	:0,TC:0,Content:0,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTIO
	N:quarantine,TS:100
X-CID-META: VersionHash:d5b0ae3,CLOUDID:8121246c-2f20-4998-991c-3b78627e4938,B
	ulkID:230518013452BTBRPXC6,BulkQuantity:0,Recheck:0,SF:38|29|28|17|19|48,T
	C:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
	,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: 1f7b5d90f4d911ed83ed1395ce914268-20230517
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <ryder.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1607390674; Wed, 17 May 2023 10:34:49 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 18 May 2023 01:34:46 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 18 May 2023 01:34:46 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, <linux-wireless@vger.kernel.org>
CC: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Shayne Chen
	<shayne.chen@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>,
	<linux-mediatek@lists.infradead.org>, Ryder Lee <ryder.lee@mediatek.com>, Ben
 Greear <greearb@candelatech.com>
Subject: [PATCH v2 2/2] wifi: mt76: mt7915: accumulate mu-mimo ofdma muru stats
Date: Thu, 18 May 2023 01:34:43 +0800
Message-ID: <d09c5445911dfbd0cb14226265272872b665972f.1684344626.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <78ae2336a119f416eb970ee403f85db35af2ef09.1684344625.git.ryder.lee@mediatek.com>
References: <78ae2336a119f416eb970ee403f85db35af2ef09.1684344625.git.ryder.lee@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230517_104959_554185_15468B07 
X-CRM114-Status: GOOD (  14.55  )
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

The stats are clear-on-read, which makes it very difficult for tools
to adequately deal with wrapped stats and with keeping good totals.

So, accumulate these values when they are read from the firmware/radio
and present totals to user-space.

Signed-off-by: Ben Greear <greearb@candelatech.com>
Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
change since v2 - adjust __dl_u32 __ul_u32 position
---
 .../wireless/mediatek/mt76/mt7915/debugfs.c   | 124 ++++++++----------
 .../net/wireless/mediatek/mt76/mt7915/mac.c   |   3 +
 .../net/wireless/mediatek/mt76/mt7915/main.c  |  63 +++++++++
 .../net/wireless/mediatek/mt76/mt7915/mcu.c   |  43 +++++-
 .../wireless/mediatek/mt76/mt7915/mt7915.h    |  34 ++++-
 5 files changed, 196 insertions(+), 71 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c b/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c
index 879884ead660..48099284ba89 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c
@@ -251,7 +251,6 @@ static int mt7915_muru_stats_show(struct seq_file *file, void *data)
 {
 	struct mt7915_phy *phy = file->private;
 	struct mt7915_dev *dev = phy->dev;
-	struct mt7915_mcu_muru_stats mu_stats = {};
 	static const char * const dl_non_he_type[] = {
 		"CCK", "OFDM", "HT MIX", "HT GF",
 		"VHT SU", "VHT 2MU", "VHT 3MU", "VHT 4MU"
@@ -275,7 +274,7 @@ static int mt7915_muru_stats_show(struct seq_file *file, void *data)
 
 	mutex_lock(&dev->mt76.mutex);
 
-	ret = mt7915_mcu_muru_debug_get(phy, &mu_stats);
+	ret = mt7915_mcu_muru_debug_get(phy);
 	if (ret)
 		goto exit;
 
@@ -285,14 +284,13 @@ static int mt7915_muru_stats_show(struct seq_file *file, void *data)
 	for (i = 0; i < 5; i++)
 		seq_printf(file, "%8s | ", dl_non_he_type[i]);
 
-#define __dl_u32(s)     le32_to_cpu(mu_stats.dl.s)
 	seq_puts(file, "\nTotal Count:");
 	seq_printf(file, "%8u | %8u | %8u | %8u | %8u | ",
-		   __dl_u32(cck_cnt),
-		   __dl_u32(ofdm_cnt),
-		   __dl_u32(htmix_cnt),
-		   __dl_u32(htgf_cnt),
-		   __dl_u32(vht_su_cnt));
+		   phy->mib.dl_cck_cnt,
+		   phy->mib.dl_ofdm_cnt,
+		   phy->mib.dl_htmix_cnt,
+		   phy->mib.dl_htgf_cnt,
+		   phy->mib.dl_vht_su_cnt);
 
 	seq_puts(file, "\nDownlink MU-MIMO\nData Type:  ");
 
@@ -301,23 +299,23 @@ static int mt7915_muru_stats_show(struct seq_file *file, void *data)
 
 	seq_puts(file, "\nTotal Count:");
 	seq_printf(file, "%8u | %8u | %8u | ",
-		   __dl_u32(vht_2mu_cnt),
-		   __dl_u32(vht_3mu_cnt),
-		   __dl_u32(vht_4mu_cnt));
+		   phy->mib.dl_vht_2mu_cnt,
+		   phy->mib.dl_vht_3mu_cnt,
+		   phy->mib.dl_vht_4mu_cnt);
 
-	sub_total_cnt = __dl_u32(vht_2mu_cnt) +
-		__dl_u32(vht_3mu_cnt) +
-		__dl_u32(vht_4mu_cnt);
+	sub_total_cnt = phy->mib.dl_vht_2mu_cnt +
+			phy->mib.dl_vht_3mu_cnt +
+			phy->mib.dl_vht_4mu_cnt;
 
 	seq_printf(file, "\nTotal non-HE MU-MIMO DL PPDU count: %lld",
 		   sub_total_cnt);
 
 	total_ppdu_cnt = sub_total_cnt +
-		__dl_u32(cck_cnt) +
-		__dl_u32(ofdm_cnt) +
-		__dl_u32(htmix_cnt) +
-		__dl_u32(htgf_cnt) +
-		__dl_u32(vht_su_cnt);
+			 phy->mib.dl_cck_cnt +
+			 phy->mib.dl_ofdm_cnt +
+			 phy->mib.dl_htmix_cnt +
+			 phy->mib.dl_htgf_cnt +
+			 phy->mib.dl_vht_su_cnt;
 
 	seq_printf(file, "\nAll non-HE DL PPDU count: %lld", total_ppdu_cnt);
 
@@ -329,8 +327,7 @@ static int mt7915_muru_stats_show(struct seq_file *file, void *data)
 
 	seq_puts(file, "\nTotal Count:");
 	seq_printf(file, "%8u | %8u | ",
-		   __dl_u32(he_su_cnt),
-		   __dl_u32(he_ext_su_cnt));
+		   phy->mib.dl_he_su_cnt, phy->mib.dl_he_ext_su_cnt);
 
 	seq_puts(file, "\nDownlink MU-MIMO\nData Type:  ");
 
@@ -339,9 +336,8 @@ static int mt7915_muru_stats_show(struct seq_file *file, void *data)
 
 	seq_puts(file, "\nTotal Count:");
 	seq_printf(file, "%8u | %8u | %8u | ",
-		   __dl_u32(he_2mu_cnt),
-		   __dl_u32(he_3mu_cnt),
-		   __dl_u32(he_4mu_cnt));
+		   phy->mib.dl_he_2mu_cnt, phy->mib.dl_he_3mu_cnt,
+		   phy->mib.dl_he_4mu_cnt);
 
 	seq_puts(file, "\nDownlink OFDMA\nData Type:  ");
 
@@ -350,37 +346,35 @@ static int mt7915_muru_stats_show(struct seq_file *file, void *data)
 
 	seq_puts(file, "\nTotal Count:");
 	seq_printf(file, "%8u | %8u | %8u | %8u | %9u | %8u | ",
-		   __dl_u32(he_2ru_cnt),
-		   __dl_u32(he_3ru_cnt),
-		   __dl_u32(he_4ru_cnt),
-		   __dl_u32(he_5to8ru_cnt),
-		   __dl_u32(he_9to16ru_cnt),
-		   __dl_u32(he_gtr16ru_cnt));
-
-	sub_total_cnt = __dl_u32(he_2mu_cnt) +
-		__dl_u32(he_3mu_cnt) +
-		__dl_u32(he_4mu_cnt);
+		   phy->mib.dl_he_2ru_cnt,
+		   phy->mib.dl_he_3ru_cnt,
+		   phy->mib.dl_he_4ru_cnt,
+		   phy->mib.dl_he_5to8ru_cnt,
+		   phy->mib.dl_he_9to16ru_cnt,
+		   phy->mib.dl_he_gtr16ru_cnt);
+
+	sub_total_cnt = phy->mib.dl_he_2mu_cnt +
+			phy->mib.dl_he_3mu_cnt +
+			phy->mib.dl_he_4mu_cnt;
 	total_ppdu_cnt = sub_total_cnt;
 
 	seq_printf(file, "\nTotal HE MU-MIMO DL PPDU count: %lld",
 		   sub_total_cnt);
 
-	sub_total_cnt = __dl_u32(he_2ru_cnt) +
-		__dl_u32(he_3ru_cnt) +
-		__dl_u32(he_4ru_cnt) +
-		__dl_u32(he_5to8ru_cnt) +
-		__dl_u32(he_9to16ru_cnt) +
-		__dl_u32(he_gtr16ru_cnt);
+	sub_total_cnt = phy->mib.dl_he_2ru_cnt +
+			phy->mib.dl_he_3ru_cnt +
+			phy->mib.dl_he_4ru_cnt +
+			phy->mib.dl_he_5to8ru_cnt +
+			phy->mib.dl_he_9to16ru_cnt +
+			phy->mib.dl_he_gtr16ru_cnt;
 	total_ppdu_cnt += sub_total_cnt;
 
 	seq_printf(file, "\nTotal HE OFDMA DL PPDU count: %lld",
 		   sub_total_cnt);
 
-	total_ppdu_cnt += __dl_u32(he_su_cnt) +
-		__dl_u32(he_ext_su_cnt);
+	total_ppdu_cnt += phy->mib.dl_he_su_cnt + phy->mib.dl_he_ext_su_cnt;
 
 	seq_printf(file, "\nAll HE DL PPDU count: %lld", total_ppdu_cnt);
-#undef __dl_u32
 
 	/* HE Uplink */
 	seq_puts(file, "\n\nUplink");
@@ -389,12 +383,11 @@ static int mt7915_muru_stats_show(struct seq_file *file, void *data)
 	for (i = 0; i < 3; i++)
 		seq_printf(file, "%8s | ", ul_he_type[i]);
 
-#define __ul_u32(s)     le32_to_cpu(mu_stats.ul.s)
 	seq_puts(file, "\nTotal Count:");
 	seq_printf(file, "%8u | %8u | %8u | ",
-		   __ul_u32(hetrig_2mu_cnt),
-		   __ul_u32(hetrig_3mu_cnt),
-		   __ul_u32(hetrig_4mu_cnt));
+		   phy->mib.ul_hetrig_2mu_cnt,
+		   phy->mib.ul_hetrig_3mu_cnt,
+		   phy->mib.ul_hetrig_4mu_cnt);
 
 	seq_puts(file, "\nTrigger-based Uplink OFDMA\nData Type:  ");
 
@@ -403,37 +396,36 @@ static int mt7915_muru_stats_show(struct seq_file *file, void *data)
 
 	seq_puts(file, "\nTotal Count:");
 	seq_printf(file, "%8u | %8u | %8u | %8u | %8u | %9u |  %7u | ",
-		   __ul_u32(hetrig_su_cnt),
-		   __ul_u32(hetrig_2ru_cnt),
-		   __ul_u32(hetrig_3ru_cnt),
-		   __ul_u32(hetrig_4ru_cnt),
-		   __ul_u32(hetrig_5to8ru_cnt),
-		   __ul_u32(hetrig_9to16ru_cnt),
-		   __ul_u32(hetrig_gtr16ru_cnt));
-
-	sub_total_cnt = __ul_u32(hetrig_2mu_cnt) +
-		__ul_u32(hetrig_3mu_cnt) +
-		__ul_u32(hetrig_4mu_cnt);
+		   phy->mib.ul_hetrig_su_cnt,
+		   phy->mib.ul_hetrig_2ru_cnt,
+		   phy->mib.ul_hetrig_3ru_cnt,
+		   phy->mib.ul_hetrig_4ru_cnt,
+		   phy->mib.ul_hetrig_5to8ru_cnt,
+		   phy->mib.ul_hetrig_9to16ru_cnt,
+		   phy->mib.ul_hetrig_gtr16ru_cnt);
+
+	sub_total_cnt = phy->mib.ul_hetrig_2mu_cnt +
+			phy->mib.ul_hetrig_3mu_cnt +
+			phy->mib.ul_hetrig_4mu_cnt;
 	total_ppdu_cnt = sub_total_cnt;
 
 	seq_printf(file, "\nTotal HE MU-MIMO UL TB PPDU count: %lld",
 		   sub_total_cnt);
 
-	sub_total_cnt = __ul_u32(hetrig_2ru_cnt) +
-		__ul_u32(hetrig_3ru_cnt) +
-		__ul_u32(hetrig_4ru_cnt) +
-		__ul_u32(hetrig_5to8ru_cnt) +
-		__ul_u32(hetrig_9to16ru_cnt) +
-		__ul_u32(hetrig_gtr16ru_cnt);
+	sub_total_cnt = phy->mib.ul_hetrig_2ru_cnt +
+			phy->mib.ul_hetrig_3ru_cnt +
+			phy->mib.ul_hetrig_4ru_cnt +
+			phy->mib.ul_hetrig_5to8ru_cnt +
+			phy->mib.ul_hetrig_9to16ru_cnt +
+			phy->mib.ul_hetrig_gtr16ru_cnt;
 	total_ppdu_cnt += sub_total_cnt;
 
 	seq_printf(file, "\nTotal HE OFDMA UL TB PPDU count: %lld",
 		   sub_total_cnt);
 
-	total_ppdu_cnt += __ul_u32(hetrig_su_cnt);
+	total_ppdu_cnt += phy->mib.ul_hetrig_su_cnt;
 
 	seq_printf(file, "\nAll HE UL TB PPDU count: %lld\n", total_ppdu_cnt);
-#undef __ul_u32
 
 exit:
 	mutex_unlock(&dev->mt76.mutex);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
index dfe42af6dc97..e06bfa4288b7 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
@@ -2075,6 +2075,9 @@ void mt7915_mac_work(struct work_struct *work)
 
 		mt7915_mac_update_stats(phy);
 		mt7915_mac_severe_check(phy);
+
+		if (phy->dev->muru_debug)
+			mt7915_mcu_muru_debug_get(phy);
 	}
 
 	mutex_unlock(&mphy->dev->mutex);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/main.c b/drivers/net/wireless/mediatek/mt76/mt7915/main.c
index bf87aa4cc630..226ec3755efd 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/main.c
@@ -1255,6 +1255,38 @@ static const char mt7915_gstrings_stats[][ETH_GSTRING_LEN] = {
 	"rx_vec_queue_overflow_drop_cnt",
 	"rx_ba_cnt",
 
+	/* muru mu-mimo and ofdma related stats */
+	"dl_cck_cnt",
+	"dl_ofdm_cnt",
+	"dl_htmix_cnt",
+	"dl_htgf_cnt",
+	"dl_vht_su_cnt",
+	"dl_vht_2mu_cnt",
+	"dl_vht_3mu_cnt",
+	"dl_vht_4mu_cnt",
+	"dl_he_su_cnt",
+	"dl_he_ext_su_cnt",
+	"dl_he_2ru_cnt",
+	"dl_he_2mu_cnt",
+	"dl_he_3ru_cnt",
+	"dl_he_3mu_cnt",
+	"dl_he_4ru_cnt",
+	"dl_he_4mu_cnt",
+	"dl_he_5to8ru_cnt",
+	"dl_he_9to16ru_cnt",
+	"dl_he_gtr16ru_cnt",
+
+	"ul_hetrig_su_cnt",
+	"ul_hetrig_2ru_cnt",
+	"ul_hetrig_3ru_cnt",
+	"ul_hetrig_4ru_cnt",
+	"ul_hetrig_5to8ru_cnt",
+	"ul_hetrig_9to16ru_cnt",
+	"ul_hetrig_gtr16ru_cnt",
+	"ul_hetrig_2mu_cnt",
+	"ul_hetrig_3mu_cnt",
+	"ul_hetrig_4mu_cnt",
+
 	/* per vif counters */
 	"v_tx_mode_cck",
 	"v_tx_mode_ofdm",
@@ -1409,6 +1441,37 @@ void mt7915_get_et_stats(struct ieee80211_hw *hw,
 	data[ei++] = mib->rx_vec_queue_overflow_drop_cnt;
 	data[ei++] = mib->rx_ba_cnt;
 
+	data[ei++] = mib->dl_cck_cnt;
+	data[ei++] = mib->dl_ofdm_cnt;
+	data[ei++] = mib->dl_htmix_cnt;
+	data[ei++] = mib->dl_htgf_cnt;
+	data[ei++] = mib->dl_vht_su_cnt;
+	data[ei++] = mib->dl_vht_2mu_cnt;
+	data[ei++] = mib->dl_vht_3mu_cnt;
+	data[ei++] = mib->dl_vht_4mu_cnt;
+	data[ei++] = mib->dl_he_su_cnt;
+	data[ei++] = mib->dl_he_ext_su_cnt;
+	data[ei++] = mib->dl_he_2ru_cnt;
+	data[ei++] = mib->dl_he_2mu_cnt;
+	data[ei++] = mib->dl_he_3ru_cnt;
+	data[ei++] = mib->dl_he_3mu_cnt;
+	data[ei++] = mib->dl_he_4ru_cnt;
+	data[ei++] = mib->dl_he_4mu_cnt;
+	data[ei++] = mib->dl_he_5to8ru_cnt;
+	data[ei++] = mib->dl_he_9to16ru_cnt;
+	data[ei++] = mib->dl_he_gtr16ru_cnt;
+
+	data[ei++] = mib->ul_hetrig_su_cnt;
+	data[ei++] = mib->ul_hetrig_2ru_cnt;
+	data[ei++] = mib->ul_hetrig_3ru_cnt;
+	data[ei++] = mib->ul_hetrig_4ru_cnt;
+	data[ei++] = mib->ul_hetrig_5to8ru_cnt;
+	data[ei++] = mib->ul_hetrig_9to16ru_cnt;
+	data[ei++] = mib->ul_hetrig_gtr16ru_cnt;
+	data[ei++] = mib->ul_hetrig_2mu_cnt;
+	data[ei++] = mib->ul_hetrig_3mu_cnt;
+	data[ei++] = mib->ul_hetrig_4mu_cnt;
+
 	/* Add values for all stations owned by this vif */
 	wi.initial_stat_idx = ei;
 	ieee80211_iterate_stations_atomic(hw, mt7915_ethtool_worker, &wi);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
index 5916dcaa8c7e..6d7d70ee0386 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
@@ -2116,12 +2116,11 @@ int mt7915_mcu_muru_debug_set(struct mt7915_dev *dev, bool enabled)
 				sizeof(data), false);
 }
 
-int mt7915_mcu_muru_debug_get(struct mt7915_phy *phy, void *ms)
+int mt7915_mcu_muru_debug_get(struct mt7915_phy *phy)
 {
 	struct mt7915_dev *dev = phy->dev;
 	struct sk_buff *skb;
-	struct mt7915_mcu_muru_stats *mu_stats =
-				(struct mt7915_mcu_muru_stats *)ms;
+	struct mt7915_mcu_muru_stats *mu_stats;
 	int ret;
 
 	struct {
@@ -2137,7 +2136,43 @@ int mt7915_mcu_muru_debug_get(struct mt7915_phy *phy, void *ms)
 	if (ret)
 		return ret;
 
-	memcpy(mu_stats, skb->data, sizeof(struct mt7915_mcu_muru_stats));
+	mu_stats = (struct mt7915_mcu_muru_stats *)(skb->data);
+
+	/* accumulate stats, these are clear-on-read */
+#define __dl_u32(s)	 phy->mib.dl_##s += le32_to_cpu(mu_stats->dl.s)
+#define __ul_u32(s)	 phy->mib.ul_##s += le32_to_cpu(mu_stats->ul.s)
+	__dl_u32(cck_cnt);
+	__dl_u32(ofdm_cnt);
+	__dl_u32(htmix_cnt);
+	__dl_u32(htgf_cnt);
+	__dl_u32(vht_su_cnt);
+	__dl_u32(vht_2mu_cnt);
+	__dl_u32(vht_3mu_cnt);
+	__dl_u32(vht_4mu_cnt);
+	__dl_u32(he_su_cnt);
+	__dl_u32(he_2ru_cnt);
+	__dl_u32(he_2mu_cnt);
+	__dl_u32(he_3ru_cnt);
+	__dl_u32(he_3mu_cnt);
+	__dl_u32(he_4ru_cnt);
+	__dl_u32(he_4mu_cnt);
+	__dl_u32(he_5to8ru_cnt);
+	__dl_u32(he_9to16ru_cnt);
+	__dl_u32(he_gtr16ru_cnt);
+
+	__ul_u32(hetrig_su_cnt);
+	__ul_u32(hetrig_2ru_cnt);
+	__ul_u32(hetrig_3ru_cnt);
+	__ul_u32(hetrig_4ru_cnt);
+	__ul_u32(hetrig_5to8ru_cnt);
+	__ul_u32(hetrig_9to16ru_cnt);
+	__ul_u32(hetrig_gtr16ru_cnt);
+	__ul_u32(hetrig_2mu_cnt);
+	__ul_u32(hetrig_3mu_cnt);
+	__ul_u32(hetrig_4mu_cnt);
+#undef __dl_u32
+#undef __ul_u32
+
 	dev_kfree_skb(skb);
 
 	return 0;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h b/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
index 145f89a19443..929d49792a01 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mt7915.h
@@ -216,6 +216,38 @@ struct mib_stats {
 
 	u32 tx_amsdu[8];
 	u32 tx_amsdu_cnt;
+
+	/* mcu_muru_stats */
+	u32 dl_cck_cnt;
+	u32 dl_ofdm_cnt;
+	u32 dl_htmix_cnt;
+	u32 dl_htgf_cnt;
+	u32 dl_vht_su_cnt;
+	u32 dl_vht_2mu_cnt;
+	u32 dl_vht_3mu_cnt;
+	u32 dl_vht_4mu_cnt;
+	u32 dl_he_su_cnt;
+	u32 dl_he_ext_su_cnt;
+	u32 dl_he_2ru_cnt;
+	u32 dl_he_2mu_cnt;
+	u32 dl_he_3ru_cnt;
+	u32 dl_he_3mu_cnt;
+	u32 dl_he_4ru_cnt;
+	u32 dl_he_4mu_cnt;
+	u32 dl_he_5to8ru_cnt;
+	u32 dl_he_9to16ru_cnt;
+	u32 dl_he_gtr16ru_cnt;
+
+	u32 ul_hetrig_su_cnt;
+	u32 ul_hetrig_2ru_cnt;
+	u32 ul_hetrig_3ru_cnt;
+	u32 ul_hetrig_4ru_cnt;
+	u32 ul_hetrig_5to8ru_cnt;
+	u32 ul_hetrig_9to16ru_cnt;
+	u32 ul_hetrig_gtr16ru_cnt;
+	u32 ul_hetrig_2mu_cnt;
+	u32 ul_hetrig_3mu_cnt;
+	u32 ul_hetrig_4mu_cnt;
 };
 
 /* crash-dump */
@@ -625,7 +657,7 @@ void mt7915_set_stream_he_caps(struct mt7915_phy *phy);
 void mt7915_set_stream_vht_txbf_caps(struct mt7915_phy *phy);
 void mt7915_update_channel(struct mt76_phy *mphy);
 int mt7915_mcu_muru_debug_set(struct mt7915_dev *dev, bool enable);
-int mt7915_mcu_muru_debug_get(struct mt7915_phy *phy, void *ms);
+int mt7915_mcu_muru_debug_get(struct mt7915_phy *phy);
 int mt7915_mcu_wed_enable_rx_stats(struct mt7915_dev *dev);
 int mt7915_init_debugfs(struct mt7915_phy *phy);
 void mt7915_debugfs_rx_fw_monitor(struct mt7915_dev *dev, const void *data, int len);
-- 
2.18.0


