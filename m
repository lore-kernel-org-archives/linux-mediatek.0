Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4EB2CD6E75
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Jun 2026 02:42:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nQRT4mJ1HgdsNx44mOqyA+8emUgDAkQ/qj+2hj+KmJw=; b=ytSuTViIm3gSOQBG43ETPQVeUe
	wu40cyvGCsZ7y1f3BsoMbMjjBLdLBSBVmti8doj5oZAj6hw8xiSt1BAwOyWA77LY3XBLmUIZE3eIA
	Qlilrn07HnFxwk1AcDNBW3ppFKWv29w+efxsRtCD/uozphSMq4+pdN8Bc1Shp6ymzZ3zBIOdbOHqr
	vjYbT5mpUJAqhE7apZYVSe2sv7OEI7K4QuNpslgvkFiTqVzBAkGADPuhjkPQL6LjtweSynl/rF9W/
	TDU6A4B037cC//pXssuX/eJWmLzmHboQL0w+Gcyx0Mvo0OBJFRmvM/Wa4bdtKeI0kHvBlt3eY79Nz
	W/cq67Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVKWF-0000000Haoo-1Yu4;
	Fri, 05 Jun 2026 02:42:47 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVKWC-0000000HaoB-38qD
	for linux-mediatek@lists.infradead.org;
	Fri, 05 Jun 2026 02:42:45 +0000
X-UUID: 30fd1c7a608811f1afed4741b24580c9-20260604
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=nQRT4mJ1HgdsNx44mOqyA+8emUgDAkQ/qj+2hj+KmJw=;
	b=E77qREhmIwi4yNofggsHQ50S1W1TGgE51v2rQand0j8RgMedlli/OAUXASXZdx5TrvlzJjRyYmssSfiq0Pt5TIK5WZOBhlxLwYVfbo0fHHcLUi7WZujpThK1KtoNF4aAN9B2WDIkiETmRiXz66mWeV7zk+kJLFQfF5FxyNWfWuQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.15,REQID:075f85dc-de7e-4007-94ab-a4a84d0666de,IP:0,U
	RL:0,TC:0,Content:-32768,EDM:0,RT:0,SF:-32768,FILE:0,BULK:-32768,RULE:Rele
	ase_Ham,ACTION:release,TS:0
X-CID-META: VersionHash:e276073,CLOUDID:bad3939b-c398-4479-aea6-536e296bbbcb,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:nil,TC:-5,Content:nil,EDM:-3,IP:nil,
	URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI:0,OSA:0,AV:0,LES:1,SP
	R:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 30fd1c7a608811f1afed4741b24580c9-20260604
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw01.mediatek.com
	(envelope-from <ryder.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 295252633; Thu, 04 Jun 2026 19:42:27 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 5 Jun 2026 10:42:25 +0800
Received: from mussdccf250.eus.mediatek.inc (10.73.250.250) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Fri, 5 Jun 2026 10:42:24 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: <linux-mediatek@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
	Shayne Chen <shayne.chen@mediatek.com>, Ryder Lee <ryder.lee@mediatek.com>
Subject: [PATCH] wifi: mt76: fix potential tx_retries underflow
Date: Thu, 4 Jun 2026 19:42:22 -0700
Message-ID: <20260605024222.3388222-1-ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_194244_819543_A3A35541 
X-CRM114-Status: GOOD (  10.80  )
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

When FIELD_GET returns 0 for the retry count, subtracting 1 causes
an unsigned integer underflow, resulting in tx_retries becoming a
very large value (0xFFFFFFFF for u32 or 255 for u8).

Fix by checking if count is non-zero before subtracting 1.

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7915/mac.c | 10 +++++-----
 drivers/net/wireless/mediatek/mt76/mt7921/mac.c |  5 +++--
 drivers/net/wireless/mediatek/mt76/mt7925/mac.c |  5 +++--
 drivers/net/wireless/mediatek/mt76/mt7996/mac.c |  6 +++---
 4 files changed, 14 insertions(+), 12 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
index cec2c4208..334c19ab2 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
@@ -912,16 +912,16 @@ mt7915_mac_tx_free(struct mt7915_dev *dev, void *data, int len)
 		}
 
 		if (!mtk_wed_device_active(&mdev->mmio.wed) && wcid) {
-			u32 tx_retries = 0, tx_failed = 0;
+			u32 tx_retries = 0, tx_failed = 0, count;
 
 			if (v3 && (info & MT_TX_FREE_MPDU_HEADER_V3)) {
-				tx_retries =
-					FIELD_GET(MT_TX_FREE_COUNT_V3, info) - 1;
+				count = FIELD_GET(MT_TX_FREE_COUNT_V3, info);
+				tx_retries = count ? count - 1 : 0;
 				tx_failed = tx_retries +
 					!!FIELD_GET(MT_TX_FREE_STAT_V3, info);
 			} else if (!v3 && (info & MT_TX_FREE_MPDU_HEADER)) {
-				tx_retries =
-					FIELD_GET(MT_TX_FREE_COUNT, info) - 1;
+				count = FIELD_GET(MT_TX_FREE_COUNT, info);
+				tx_retries = count ? count - 1 : 0;
 				tx_failed = tx_retries +
 					!!FIELD_GET(MT_TX_FREE_STAT, info);
 			}
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mac.c b/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
index 03b4960db..668bfa195 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mac.c
@@ -530,8 +530,9 @@ static void mt7921_mac_tx_free(struct mt792x_dev *dev, void *data, int len)
 		stat = FIELD_GET(MT_TX_FREE_STATUS, info);
 
 		if (wcid) {
-			wcid->stats.tx_retries +=
-				FIELD_GET(MT_TX_FREE_COUNT, info) - 1;
+			u32 count = FIELD_GET(MT_TX_FREE_COUNT, info);
+
+			wcid->stats.tx_retries += count ? count - 1 : 0;
 			wcid->stats.tx_failed += !!stat;
 		}
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mac.c b/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
index c47bd812b..c56a9e530 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mac.c
@@ -1141,8 +1141,9 @@ mt7925_mac_tx_free(struct mt792x_dev *dev, void *data, int len)
 
 		if (info & MT_TXFREE_INFO_HEADER) {
 			if (wcid) {
-				wcid->stats.tx_retries +=
-					FIELD_GET(MT_TXFREE_INFO_COUNT, info) - 1;
+				u32 count = FIELD_GET(MT_TXFREE_INFO_COUNT, info);
+
+				wcid->stats.tx_retries += count ? count - 1 : 0;
 				wcid->stats.tx_failed +=
 					!!FIELD_GET(MT_TXFREE_INFO_STAT, info);
 			}
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
index a59c14c8f..3fad977ba 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
@@ -1361,13 +1361,13 @@ mt7996_mac_tx_free(struct mt7996_dev *dev, void *data, int len)
 				cur_info++;
 			continue;
 		} else if (info & MT_TXFREE_INFO_HEADER) {
-			u32 tx_retries = 0, tx_failed = 0;
+			u32 tx_retries = 0, tx_failed = 0, count;
 
 			if (!wcid)
 				continue;
 
-			tx_retries =
-				FIELD_GET(MT_TXFREE_INFO_COUNT, info) - 1;
+			count = FIELD_GET(MT_TXFREE_INFO_COUNT, info);
+			tx_retries = count ? count - 1 : 0;
 			tx_failed = tx_retries +
 				!!FIELD_GET(MT_TXFREE_INFO_STAT, info);
 
-- 
2.45.2


