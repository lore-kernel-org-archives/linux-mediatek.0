Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CFFEC48286
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Jan 2024 09:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QfBJh/G27e2/TM1jxbBhY/qC7WJr1g5LZzWtbcjgAfw=; b=ynxbrW6B7h8dczDa/U8sw459Ou
	nhMisRh7XfSXb7TNr0OxUfdr77n+A00nm6jXRflY6zIp7eq5ntGM1kH+iHiDmX/R3fuK0NENdT0HW
	NcDxDPG2iMeJiS5Gb6EtChMLDKh1lmHPRIcBe7FNEymdIV7SZA7PFbD3ghr42yBJNqKV8KV20FcSD
	nhU8QjGpPdaVGwZ/b94Vi5TGZKelvAqEk/lNrIonsWXl5px64oqeqkxP7uSsBzvhgCeRl84zqsSCo
	oBkmygnHoojWYb4V/h48ETFwxJ+Uyt/A1bn1hZV9qMvZPDDkKFhmY0+Ntv4jkponEn87etzz8rpGv
	ZbhkoAdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTIDr-00000003a0W-2qto;
	Fri, 26 Jan 2024 09:10:03 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTIDm-00000003ZvJ-1Auu
	for linux-mediatek@lists.infradead.org;
	Fri, 26 Jan 2024 09:10:00 +0000
X-UUID: a98a5298bc2a11eea0bf134e88e6c2dc-20240126
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=QfBJh/G27e2/TM1jxbBhY/qC7WJr1g5LZzWtbcjgAfw=;
	b=NUxXM2yKTIGA1dOxb+VVxoWpGltN8T0TXqBlW58phT4LrlMzqVvflIP4gyyi9OYv1n8o1Ta8BRLyf0Bz4ml7kbHm60A0ttu3sYARoPHSwOEXwOEF+gNm9V/KDSDYDmT5+CjpDBOsIoFxrkrEtsPeVGPmdhgl72O8p/CYbTzEaXI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.36,REQID:b624c3cc-2d51-415e-a47b-aabf7c585513,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6e16cf4,CLOUDID:f2404983-8d4f-477b-89d2-1e3bdbef96d1,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: a98a5298bc2a11eea0bf134e88e6c2dc-20240126
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <shayne.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 236963743; Fri, 26 Jan 2024 02:09:51 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 26 Jan 2024 17:09:49 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 26 Jan 2024 17:09:49 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
	<lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, Bo Jiao <Bo.Jiao@mediatek.com>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Peter Chiu
	<chui-hao.chiu@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>
Subject: [PATCH v2 01/12] wifi: mt76: mt7996: check txs format before getting skb by pid
Date: Fri, 26 Jan 2024 17:09:12 +0800
Message-ID: <20240126090923.6357-1-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240126_010958_389609_7C4C1D56 
X-CRM114-Status: GOOD (  13.00  )
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

From: Peter Chiu <chui-hao.chiu@mediatek.com>

The PPDU TXS does not include the error bit so it cannot use to report
status to mac80211. This patch fixes issue that STA wrongly detects if AP
is still alive.

Fixes: 2569ea5326e2 ("wifi: mt76: mt7996: enable PPDU-TxS to host")
Signed-off-by: Peter Chiu <chui-hao.chiu@mediatek.com>
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7996/mac.c   | 23 +++++++++++--------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
index 53258488d49f..a8414fbb07c8 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
@@ -1188,25 +1188,28 @@ mt7996_mac_add_txs_skb(struct mt7996_dev *dev, struct mt76_wcid *wcid,
 	struct ieee80211_tx_info *info;
 	struct sk_buff_head list;
 	struct rate_info rate = {};
-	struct sk_buff *skb;
+	struct sk_buff *skb = NULL;
 	bool cck = false;
 	u32 txrate, txs, mode, stbc;
 
 	txs = le32_to_cpu(txs_data[0]);
 
 	mt76_tx_status_lock(mdev, &list);
-	skb = mt76_tx_status_skb_get(mdev, wcid, pid, &list);
 
-	if (skb) {
-		info = IEEE80211_SKB_CB(skb);
-		if (!(txs & MT_TXS0_ACK_ERROR_MASK))
-			info->flags |= IEEE80211_TX_STAT_ACK;
+	/* only report MPDU TXS */
+	if (le32_get_bits(txs_data[0], MT_TXS0_TXS_FORMAT) == 0) {
+		skb = mt76_tx_status_skb_get(mdev, wcid, pid, &list);
+		if (skb) {
+			info = IEEE80211_SKB_CB(skb);
+			if (!(txs & MT_TXS0_ACK_ERROR_MASK))
+				info->flags |= IEEE80211_TX_STAT_ACK;
 
-		info->status.ampdu_len = 1;
-		info->status.ampdu_ack_len =
-			!!(info->flags & IEEE80211_TX_STAT_ACK);
+			info->status.ampdu_len = 1;
+			info->status.ampdu_ack_len =
+				!!(info->flags & IEEE80211_TX_STAT_ACK);
 
-		info->status.rates[0].idx = -1;
+			info->status.rates[0].idx = -1;
+		}
 	}
 
 	if (mtk_wed_device_active(&dev->mt76.mmio.wed) && wcid->sta) {
-- 
2.39.2


