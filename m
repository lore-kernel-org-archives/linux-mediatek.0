Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C807C77B7A
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 May 2023 03:33:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mTVM1Iv6lrP+o0UbclLwEhF8i+LhIcip7dA/UGfzKpI=; b=npfCKT3FL4t1zkJ6WM+QgGj95E
	MMjCUzF8CsyIDCZPH4PPO11H7oO/h1RJHjsy8QMzHogWDk0h9gPnHmCdYTZYa/T1wtJcdshfbZP6q
	8uoDWZYQIoVKyI4Bxi+xpYGG/4AC7/56d0/9BWFNzNfxccHIkyPV7bODjgVFPbpDXXZlscCT/s59S
	YMo7+tiFmvQ3l0ZJP0sl+TaPGsO3Ej9JbKuivBqF5tG9N99AsmATpWaeYH0Bj/EJFGdrsFy6WSC8H
	jO4HLtNeF6bPagd8VEc7Ox7mQwpO0/MNbGvdmWt2ofq5rYP86Z87Uxbu9MxF4pmpl875+GcyTmPvp
	UeG87KEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pz7ua-007z3Y-13;
	Wed, 17 May 2023 03:33:12 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pz7uX-007z2W-09
	for linux-mediatek@lists.infradead.org;
	Wed, 17 May 2023 03:33:10 +0000
X-UUID: 87c77030f46311ed83ed1395ce914268-20230516
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=mTVM1Iv6lrP+o0UbclLwEhF8i+LhIcip7dA/UGfzKpI=;
	b=SIimIB2BQGI01gHdJcKUWQ694MPnGHuo8eFaYr8WP7w1wWNUhopP5XLqKYJ9IdcVaHzLoEgkcWM7H+Xba1UdcnJSr7Y7o+ZFsyJrfA8YJQfkYZQGyMwZeC1lj5OAuLXhybeHyueZD6tgzDGUpxUEsaijH7/vFCFJEqVSi/PM2Zo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.25,REQID:c40abb8b-1e91-4335-8b0d-cfb4c8f27d3d,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:d5b0ae3,CLOUDID:fa4f0f6c-2f20-4998-991c-3b78627e4938,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: 87c77030f46311ed83ed1395ce914268-20230516
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <ryder.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 660470716; Tue, 16 May 2023 20:33:03 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 17 May 2023 11:23:01 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 17 May 2023 11:23:01 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, <linux-wireless@vger.kernel.org>
CC: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Shayne Chen
	<shayne.chen@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>,
	<linux-mediatek@lists.infradead.org>, Ryder Lee <ryder.lee@mediatek.com>, Ben
 Greear <greearb@candelatech.com>
Subject: [PATCH 1/2] wifi: mt76: add tx_nss histogram to ethtool stats
Date: Wed, 17 May 2023 11:22:58 +0800
Message-ID: <78ae2336a119f416eb970ee403f85db35af2ef09.1684280458.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230516_203309_111322_2103508D 
X-CRM114-Status: GOOD (  10.70  )
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

mt76_connac2_mac_fill_txs() counts tx_nss but ethtool doesn't show
stats. Add missing histogram accordingly.

Signed-off-by: Ben Greear <greearb@candelatech.com>
Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mac80211.c    | 3 +++
 drivers/net/wireless/mediatek/mt76/mt7915/main.c | 4 ++++
 drivers/net/wireless/mediatek/mt76/mt7921/main.c | 4 ++++
 drivers/net/wireless/mediatek/mt76/mt7996/main.c | 4 ++++
 4 files changed, 15 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mac80211.c b/drivers/net/wireless/mediatek/mt76/mac80211.c
index 467afef98ba2..9d3b38c2af7e 100644
--- a/drivers/net/wireless/mediatek/mt76/mac80211.c
+++ b/drivers/net/wireless/mediatek/mt76/mac80211.c
@@ -1743,6 +1743,9 @@ void mt76_ethtool_worker(struct mt76_ethtool_worker_info *wi,
 	for (i = 0; i < (eht ? 14 : 12); i++)
 		data[ei++] += stats->tx_mcs[i];
 
+	for (i = 0; i < 4; i++)
+		data[ei++] += stats->tx_nss[i];
+
 	wi->worker_stat_count = ei - wi->initial_stat_idx;
 }
 EXPORT_SYMBOL_GPL(mt76_ethtool_worker);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/main.c b/drivers/net/wireless/mediatek/mt76/mt7915/main.c
index d899bc2d0a84..bf87aa4cc630 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/main.c
@@ -1281,6 +1281,10 @@ static const char mt7915_gstrings_stats[][ETH_GSTRING_LEN] = {
 	"v_tx_mcs_9",
 	"v_tx_mcs_10",
 	"v_tx_mcs_11",
+	"v_tx_nss_1",
+	"v_tx_nss_2",
+	"v_tx_nss_3",
+	"v_tx_nss_4",
 };
 
 #define MT7915_SSTATS_LEN ARRAY_SIZE(mt7915_gstrings_stats)
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/main.c b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
index 0c9a472bc81a..ad267afb493c 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/main.c
@@ -1078,6 +1078,10 @@ static const char mt7921_gstrings_stats[][ETH_GSTRING_LEN] = {
 	"v_tx_mcs_9",
 	"v_tx_mcs_10",
 	"v_tx_mcs_11",
+	"v_tx_nss_1",
+	"v_tx_nss_2",
+	"v_tx_nss_3",
+	"v_tx_nss_4",
 };
 
 static void
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/main.c b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
index 8e1b7cc48146..56818c7ac08e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
@@ -1155,6 +1155,10 @@ static const char mt7996_gstrings_stats[][ETH_GSTRING_LEN] = {
 	"v_tx_mcs_11",
 	"v_tx_mcs_12",
 	"v_tx_mcs_13",
+	"v_tx_nss_1",
+	"v_tx_nss_2",
+	"v_tx_nss_3",
+	"v_tx_nss_4",
 };
 
 #define MT7996_SSTATS_LEN ARRAY_SIZE(mt7996_gstrings_stats)
-- 
2.18.0


