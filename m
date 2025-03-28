Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A962C36016
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Mar 2025 05:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NO/8kC52jO5K7X5WlueyKyCmE6RphgAvdD/ilcQoADw=; b=zfajwVl4R1R6OnfUh0KD6F3/bS
	/alZVMyuwghzcKxGwo/QfH0LQ02XWj0osRSjpP3DUR0ufeP3AlhtUvfW6jzrp+sSXGgyyQv9yEVp7
	zBTEG7GPuKs/GFEDRh62fUVq+A5qY1AETEBuEdUtMigxmxok/xzxz29Kf7vs85q6ijWRe2ozicTPe
	2oUa8fzc3E1WBg/ASYXtTExOCcN7n7KujD+OW0cvYqMpEGQkMN9PtJ4Q/VraG8SrTvo7u02OZZ/Wj
	4OS/D+bDqDoU6+6RCUxhuNgbiNyodJ3tCc7LXHX9bqld4x3NJb6LOyPuSs+UbvvUJGqP5gnIL//Vp
	LtIgiBrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty2fT-0000000CgDg-0ioB;
	Fri, 28 Mar 2025 05:54:11 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty2fO-0000000Cg8W-2vnv
	for linux-mediatek@lists.infradead.org;
	Fri, 28 Mar 2025 05:54:07 +0000
X-UUID: 0bbcf7720b9911f083f2a1c9db70dae0-20250327
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=NO/8kC52jO5K7X5WlueyKyCmE6RphgAvdD/ilcQoADw=;
	b=Kb+D9qR8OojoLn6gM+rqvILMJ6YhvN6lmQM9CyRGPkP/dI17puvVFmcVpB63BCkQRHvQqH8pJSjeueApW2ELnteEQAQNqZRI3bmIjeVpicxauIrrNjhX84nzxjyM9cdi238LAuJtYPzaTFqNn1dCd6JWrpRr1HKc4AsR5T66RmI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:63f9bf46-b6a3-4a47-92a8-1e59575a878b,IP:0,UR
	L:0,TC:0,Content:0,EDM:-30,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-30
X-CID-META: VersionHash:0ef645f,CLOUDID:ec64ab4a-a527-43d8-8af6-bc8b32d9f5e9,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:2,
	IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:
	0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 0bbcf7720b9911f083f2a1c9db70dae0-20250327
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <shayne.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1016570518; Thu, 27 Mar 2025 22:54:00 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Fri, 28 Mar 2025 13:53:57 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Fri, 28 Mar 2025 13:53:57 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
	<lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Shayne Chen <shayne.chen@mediatek.com>,
	StanleyYP Wang <StanleyYP.Wang@mediatek.com>, Benjamin Lin
	<benjamin-jw.lin@mediatek.com>, Peter Chiu <chui-hao.chiu@mediatek.com>
Subject: [PATCH 08/10] wifi: mt76: connac: rework TX descriptor and TX free for mt7990
Date: Fri, 28 Mar 2025 13:50:56 +0800
Message-ID: <20250328055058.1648755-9-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250328055058.1648755-1-shayne.chen@mediatek.com>
References: <20250328055058.1648755-1-shayne.chen@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250327_225406_756994_7CACC75E 
X-CRM114-Status: GOOD (  16.69  )
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

Adjust the TX descriptor and TX free for updated hardware fields.
This is a preliminary patch to support mt7990 chipset.

Co-developed-by: StanleyYP Wang <StanleyYP.Wang@mediatek.com>
Signed-off-by: StanleyYP Wang <StanleyYP.Wang@mediatek.com>
Co-developed-by: Benjamin Lin <benjamin-jw.lin@mediatek.com>
Signed-off-by: Benjamin Lin <benjamin-jw.lin@mediatek.com>
Co-developed-by: Peter Chiu <chui-hao.chiu@mediatek.com>
Signed-off-by: Peter Chiu <chui-hao.chiu@mediatek.com>
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 .../wireless/mediatek/mt76/mt76_connac3_mac.h |  1 +
 .../net/wireless/mediatek/mt76/mt7996/mac.c   | 42 ++++++++++++++++---
 2 files changed, 37 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac3_mac.h b/drivers/net/wireless/mediatek/mt76/mt76_connac3_mac.h
index 487ad716f872..1013cad57a7f 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac3_mac.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac3_mac.h
@@ -273,6 +273,7 @@ enum tx_frag_idx {
 #define MT_TXD6_TX_RATE			GENMASK(21, 16)
 #define MT_TXD6_TIMESTAMP_OFS_EN	BIT(15)
 #define MT_TXD6_TIMESTAMP_OFS_IDX	GENMASK(14, 10)
+#define MT_TXD6_TID_ADDBA		GENMASK(10, 8)
 #define MT_TXD6_MSDU_CNT		GENMASK(9, 4)
 #define MT_TXD6_MSDU_CNT_V2		GENMASK(15, 10)
 #define MT_TXD6_DIS_MAT			BIT(3)
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
index baa4aea109bc..95f5532971eb 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
@@ -789,10 +789,13 @@ mt7996_mac_write_txwi_80211(struct mt7996_dev *dev, __le32 *txwi,
 
 	if (ieee80211_is_action(fc) &&
 	    mgmt->u.action.category == WLAN_CATEGORY_BACK &&
-	    mgmt->u.action.u.addba_req.action_code == WLAN_ACTION_ADDBA_REQ)
+	    mgmt->u.action.u.addba_req.action_code == WLAN_ACTION_ADDBA_REQ) {
+		if (is_mt7990(&dev->mt76))
+			txwi[6] |= cpu_to_le32(FIELD_PREP(MT_TXD6_TID_ADDBA, tid));
 		tid = MT_TX_ADDBA;
-	else if (ieee80211_is_mgmt(hdr->frame_control))
+	} else if (ieee80211_is_mgmt(hdr->frame_control)) {
 		tid = MT_TX_NORMAL;
+	}
 
 	val = FIELD_PREP(MT_TXD1_HDR_FORMAT, MT_HDR_FORMAT_802_11) |
 	      FIELD_PREP(MT_TXD1_HDR_INFO,
@@ -987,12 +990,32 @@ void mt7996_mac_write_txwi(struct mt7996_dev *dev, __le32 *txwi,
 	}
 }
 
+static bool
+mt7996_tx_use_mgmt(struct mt7996_dev *dev, struct sk_buff *skb)
+{
+	struct ieee80211_hdr *hdr = (struct ieee80211_hdr *)skb->data;
+
+	if (ieee80211_is_mgmt(hdr->frame_control))
+		return true;
+
+	/* for SDO to bypass specific data frame */
+	if (!mt7996_has_wa(dev)) {
+		if (unlikely(skb->protocol == cpu_to_be16(ETH_P_PAE)))
+			return true;
+
+		if (ieee80211_has_a4(hdr->frame_control) &&
+		    !ieee80211_is_data_present(hdr->frame_control))
+			return true;
+	}
+
+	return false;
+}
+
 int mt7996_tx_prepare_skb(struct mt76_dev *mdev, void *txwi_ptr,
 			  enum mt76_txq_id qid, struct mt76_wcid *wcid,
 			  struct ieee80211_sta *sta,
 			  struct mt76_tx_info *tx_info)
 {
-	struct ieee80211_hdr *hdr = (struct ieee80211_hdr *)tx_info->skb->data;
 	struct mt7996_dev *dev = container_of(mdev, struct mt7996_dev, mt76);
 	struct ieee80211_tx_info *info = IEEE80211_SKB_CB(tx_info->skb);
 	struct ieee80211_key_conf *key = info->control.hw_key;
@@ -1046,7 +1069,7 @@ int mt7996_tx_prepare_skb(struct mt76_dev *mdev, void *txwi_ptr,
 	if (!key)
 		txp->fw.flags |= cpu_to_le16(MT_CT_INFO_NONE_CIPHER_FRAME);
 
-	if (!is_8023 && ieee80211_is_mgmt(hdr->frame_control))
+	if (!is_8023 && mt7996_tx_use_mgmt(dev, tx_info->skb))
 		txp->fw.flags |= cpu_to_le16(MT_CT_INFO_MGMT_FRAME);
 
 	if (vif) {
@@ -1184,6 +1207,7 @@ mt7996_mac_tx_free(struct mt7996_dev *dev, void *data, int len)
 	void *end = data + len;
 	bool wake = false;
 	u16 total, count = 0;
+	u8 ver;
 
 	/* clean DMA queues and unmap buffers first */
 	mt76_queue_tx_cleanup(dev, dev->mphy.q_tx[MT_TXQ_PSD], false);
@@ -1197,7 +1221,8 @@ mt7996_mac_tx_free(struct mt7996_dev *dev, void *data, int len)
 		mt76_queue_tx_cleanup(dev, phy3->q_tx[MT_TXQ_BE], false);
 	}
 
-	if (WARN_ON_ONCE(le32_get_bits(tx_free[1], MT_TXFREE1_VER) < 5))
+	ver = le32_get_bits(tx_free[1], MT_TXFREE1_VER);
+	if (WARN_ON_ONCE(ver < 5))
 		return;
 
 	total = le32_get_bits(tx_free[0], MT_TXFREE0_MSDU_CNT);
@@ -1219,11 +1244,16 @@ mt7996_mac_tx_free(struct mt7996_dev *dev, void *data, int len)
 			wcid = rcu_dereference(dev->mt76.wcid[idx]);
 			sta = wcid_to_sta(wcid);
 			if (!sta)
-				continue;
+				goto next;
 
 			msta_link = container_of(wcid, struct mt7996_sta_link,
 						 wcid);
 			mt76_wcid_add_poll(&dev->mt76, &msta_link->wcid);
+next:
+			/* ver 7 has a new DW with pair = 1, skip it */
+			if (ver == 7 && ((void *)(cur_info + 1) < end) &&
+			    (le32_to_cpu(*(cur_info + 1)) & MT_TXFREE_INFO_PAIR))
+				cur_info++;
 			continue;
 		} else if (info & MT_TXFREE_INFO_HEADER) {
 			u32 tx_retries = 0, tx_failed = 0;
-- 
2.39.2


