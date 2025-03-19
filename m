Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDD89C28B28
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Mar 2025 07:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2gyZ8dTDMLYrhbdwhG6wGf4ZKTkdbgImwNwmoxmwBAU=; b=s5+M/duTx9NiBwHSzC3z+RnFNM
	BRaEN9OI/qv8AUT/ih2zimD6zCNQj1uJoCRPGfITDYTsfSQh1KkA8eYBSMzcPf9R071Fu1qWHTtfu
	++JfV1TlNzFy7D/0Q+DXpQ0ECiUMQqjjHrbIfqlAEDLVQTRDPDbbzfxcHGJefE/n0W0YHA0Ev8w0f
	ucXpWD4oOBaN//gAAc6ebVFfcKuDSKQsx7bIbJt1Wov3kh4DTISgJbEz0/ZOCC+IIdBQBYcTVp5N0
	LBZgipsdXdfwZQGVKFFm1v+UMALp8q5N7t3VZiGuxUZmRT9CGkemaOGTALxf0gr6ATKcwkKEVhb3U
	qZIQi96A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuo8B-00000008GAr-3NoV;
	Wed, 19 Mar 2025 07:46:27 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuo6V-00000008Frz-1DSh
	for linux-mediatek@lists.infradead.org;
	Wed, 19 Mar 2025 07:44:44 +0000
X-UUID: 01b71c80049611f0a1e849db4cc18d44-20250319
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=2gyZ8dTDMLYrhbdwhG6wGf4ZKTkdbgImwNwmoxmwBAU=;
	b=Uw42rdVa/p1yrU/UWNRte3g4DeuABkCxG94PZpmvGoSzvZLwkziE6VGYBiN9dl9+WMyU8ujbNi759h/a0Jys667/u93L0SEBg4u9Tj/EqYyRUF9TJnhhNn/FYenyeKhRsHcKQZhhbzlw6PfKqYLyvP/WK3mAn8lcboaeQiP1Yjs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:59132869-3f9c-42e9-afc6-3f1e95bfbdf4,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:44c3908c-f5b8-47d5-8cf3-b68fe7530c9a,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 01b71c80049611f0a1e849db4cc18d44-20250319
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw02.mediatek.com
	(envelope-from <mingyen.hsieh@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1055894560; Wed, 19 Mar 2025 00:44:36 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS14N2.mediatek.inc (172.21.101.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Wed, 19 Mar 2025 15:44:34 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Wed, 19 Mar 2025 15:44:34 +0800
From: Mingyen Hsieh <mingyen.hsieh@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <deren.wu@mediatek.com>, <Sean.Wang@mediatek.com>,
	<Leon.Yen@mediatek.com>, <Michael.Lo@mediatek.com>,
	<allan.wang@mediatek.com>, <Eric-SY.Chang@mediatek.com>,
	<km.lin@mediatek.com>, <Quan.Zhou@mediatek.com>, <Ryder.Lee@mediatek.com>,
	<Shayne.Chen@mediatek.com>, <linux-wireless@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, Ming Yen Hsieh
	<mingyen.hsieh@mediatek.com>
Subject: [PATCH 1/2] wifi: mt76: add mt76_connac_mcu_build_rnr_scan_param routine
Date: Wed, 19 Mar 2025 15:44:25 +0800
Message-ID: <20250319074426.3782102-1-mingyen.hsieh@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_004443_343572_A70E17D1 
X-CRM114-Status: GOOD (  13.85  )
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

From: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>

Introduce mt76_connac_mcu_build_rnr_scan_param routine for handling
RNR scan. This is a preliminary patch to enable RNR scan in mt7921 and
mt7925 driver.

Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt76.h     | 12 ++++++
 .../wireless/mediatek/mt76/mt76_connac_mcu.c  | 38 +++++++++++++++++++
 .../wireless/mediatek/mt76/mt76_connac_mcu.h  |  3 ++
 3 files changed, 53 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/wireless/mediatek/mt76/mt76.h
index 2331097bccee..2095a7b04cee 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76.h
@@ -162,6 +162,16 @@ enum mt76_dfs_state {
 	MT_DFS_STATE_ACTIVE,
 };
 
+#define MT76_RNR_SCAN_MAX_BSSIDS       16
+struct mt76_scan_rnr_param {
+	u8 bssid[MT76_RNR_SCAN_MAX_BSSIDS][ETH_ALEN];
+	u8 channel[MT76_RNR_SCAN_MAX_BSSIDS];
+	u8 random_mac[ETH_ALEN];
+	u8 seq_num;
+	u8 bssid_num;
+	u32 sreq_flag;
+};
+
 struct mt76_queue_buf {
 	dma_addr_t addr;
 	u16 len:15,
@@ -941,6 +951,8 @@ struct mt76_dev {
 	char alpha2[3];
 	enum nl80211_dfs_regions region;
 
+	struct mt76_scan_rnr_param rnr;
+
 	u32 debugfs_reg;
 
 	u8 csa_complete;
diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
index 2276ef1b4370..97acb10d1eff 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
@@ -1667,6 +1667,44 @@ int mt76_connac_mcu_uni_add_bss(struct mt76_phy *phy,
 }
 EXPORT_SYMBOL_GPL(mt76_connac_mcu_uni_add_bss);
 
+void mt76_connac_mcu_build_rnr_scan_param(struct mt76_dev *mdev,
+					  struct cfg80211_scan_request *sreq)
+{
+	struct ieee80211_channel **scan_list = sreq->channels;
+	int i, bssid_index = 0;
+
+	/* clear 6G active Scan BSSID table */
+	memset(&mdev->rnr, 0, sizeof(mdev->rnr));
+
+	for (i = 0; i < sreq->n_6ghz_params; i++) {
+		u8 ch_idx = sreq->scan_6ghz_params[i].channel_idx;
+		int k = 0;
+
+		/* Remove the duplicated BSSID */
+		for (k = 0; k < bssid_index; k++) {
+			if (!memcmp(&mdev->rnr.bssid[k],
+				    sreq->scan_6ghz_params[i].bssid,
+				    ETH_ALEN))
+				break;
+		}
+
+		if (k == bssid_index &&
+		    bssid_index < MT76_RNR_SCAN_MAX_BSSIDS) {
+			memcpy(&mdev->rnr.bssid[bssid_index++],
+			       sreq->scan_6ghz_params[i].bssid, ETH_ALEN);
+			mdev->rnr.channel[k] = scan_list[ch_idx]->hw_value;
+		}
+	}
+
+	mdev->rnr.bssid_num = bssid_index;
+
+	if (sreq->flags & NL80211_SCAN_FLAG_RANDOM_ADDR) {
+		memcpy(mdev->rnr.random_mac, sreq->mac_addr, ETH_ALEN);
+		mdev->rnr.sreq_flag = sreq->flags;
+	}
+}
+EXPORT_SYMBOL_GPL(mt76_connac_mcu_build_rnr_scan_param);
+
 #define MT76_CONNAC_SCAN_CHANNEL_TIME		60
 int mt76_connac_mcu_hw_scan(struct mt76_phy *phy, struct ieee80211_vif *vif,
 			    struct ieee80211_scan_request *scan_req)
diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
index 2e865a731d05..34636cd4b42e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
@@ -869,6 +869,7 @@ enum {
 #define NETWORK_WDS			BIT(21)
 
 #define SCAN_FUNC_RANDOM_MAC		BIT(0)
+#define SCAN_FUNC_RNR_SCAN		BIT(3)
 #define SCAN_FUNC_SPLIT_SCAN		BIT(5)
 
 #define CONNECTION_INFRA_STA		(STA_TYPE_STA | NETWORK_INFRA)
@@ -1974,6 +1975,8 @@ int mt76_connac_mcu_start_patch(struct mt76_dev *dev);
 int mt76_connac_mcu_patch_sem_ctrl(struct mt76_dev *dev, bool get);
 int mt76_connac_mcu_start_firmware(struct mt76_dev *dev, u32 addr, u32 option);
 
+void mt76_connac_mcu_build_rnr_scan_param(struct mt76_dev *mdev,
+					  struct cfg80211_scan_request *sreq);
 int mt76_connac_mcu_hw_scan(struct mt76_phy *phy, struct ieee80211_vif *vif,
 			    struct ieee80211_scan_request *scan_req);
 int mt76_connac_mcu_cancel_hw_scan(struct mt76_phy *phy,
-- 
2.34.1


