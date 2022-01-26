Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B30A6C5AC75
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Jan 2022 02:05:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+YXNcNRQ/N2cTmiZacVZoP/LJIB/E8j3mRPi16W1HjM=; b=cE7TQ/daZqqCuv
	X45tNAj21wwmmzX8TczUPUBky7g+9E7+kDwRXfI0Rbx8RQ0vqSHRAxUXl4w3pc01JAYu9jrCY+GxH
	kTKlQnhEbuC3xhFqLs7nLPY75diFv6RSaXhFU3+E3M/e3SIpWP5nesDVu+ltNqEQTIDZx+yV6+nhF
	xv8vf+teGjTwuGdfmDkVkyKM+BLNoDuQf8msIBjVbk8HLV3rcBC1+0UOe9QxrhP3ymAAEI4qY/rGs
	7emoCnNWz65F7vgllmTFoJWHg/dJghBCvUf7EhuFST0JfQ7bL1jOlGVUGiSkTVeYHZ/ZQWdib6mrH
	t1IkmBQdRiPZi7rcIhnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCXgq-009rMd-UV; Wed, 26 Jan 2022 02:05:40 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCXgm-009rLk-PY
 for linux-mediatek@lists.infradead.org; Wed, 26 Jan 2022 02:05:39 +0000
X-UUID: 0cbd423edc874f6e91d1e9b050145af9-20220125
X-UUID: 0cbd423edc874f6e91d1e9b050145af9-20220125
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <chui-hao.chiu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1969111173; Tue, 25 Jan 2022 19:05:33 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 25 Jan 2022 18:05:31 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Wed, 26 Jan 2022 10:05:30 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 26 Jan 2022 10:05:30 +0800
From: Peter Chiu <chui-hao.chiu@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Ryder Lee
 <ryder.Lee@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>, Shayne Chen
 <shayne.chen@mediatek.com>, <linux-wireless@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, Peter Chiu <chui-hao.chiu@mediatek.com>
Subject: [PATCH] mt76: mt7915: fix max_mpdu_size in mt7915_mcu_sta_amsdu_tlv()
Date: Wed, 26 Jan 2022 10:05:28 +0800
Message-ID: <20220126020529.12000-1-chui-hao.chiu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220125_180536_858802_8DAA007C 
X-CRM114-Status: GOOD (  12.20  )
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

The maximum max_mpdu_size of mt7915 is 7991, whereas mt7916 can
support 11454.

Fixes: b443e55fb5b37 ("mt76: mt7915: add Tx A-MSDU offloading support")
Signed-off-by: Peter Chiu <chui-hao.chiu@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7915/mcu.c   | 26 +++++++++++++++----
 1 file changed, 21 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
index 66f8daf3168c..f218b1540c00 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
@@ -986,8 +986,8 @@ mt7915_mcu_sta_vht_tlv(struct sk_buff *skb, struct ieee80211_sta *sta)
 }
 
 static void
-mt7915_mcu_sta_amsdu_tlv(struct sk_buff *skb, struct ieee80211_vif *vif,
-			 struct ieee80211_sta *sta)
+mt7915_mcu_sta_amsdu_tlv(struct mt7915_dev *dev, struct sk_buff *skb,
+			 struct ieee80211_vif *vif, struct ieee80211_sta *sta)
 {
 	struct mt7915_sta *msta = (struct mt7915_sta *)sta->drv_priv;
 	struct sta_rec_amsdu *amsdu;
@@ -1004,9 +1004,25 @@ mt7915_mcu_sta_amsdu_tlv(struct sk_buff *skb, struct ieee80211_vif *vif,
 	amsdu = (struct sta_rec_amsdu *)tlv;
 	amsdu->max_amsdu_num = 8;
 	amsdu->amsdu_en = true;
-	amsdu->max_mpdu_size = sta->max_amsdu_len >=
-			       IEEE80211_MAX_MPDU_LEN_VHT_7991;
 	msta->wcid.amsdu = true;
+
+	switch (sta->max_amsdu_len) {
+	case IEEE80211_MAX_MPDU_LEN_VHT_11454:
+		if (!is_mt7915(&dev->mt76)) {
+			amsdu->max_mpdu_size =
+				IEEE80211_VHT_CAP_MAX_MPDU_LENGTH_11454;
+			return;
+		}
+		fallthrough;
+	case IEEE80211_MAX_MPDU_LEN_HT_7935:
+	case IEEE80211_MAX_MPDU_LEN_VHT_7991:
+		amsdu->max_mpdu_size = IEEE80211_VHT_CAP_MAX_MPDU_LENGTH_7991;
+		return;
+	default:
+		amsdu->max_mpdu_size = IEEE80211_VHT_CAP_MAX_MPDU_LENGTH_3895;
+		return;
+	}
+
 }
 
 static int
@@ -1686,7 +1702,7 @@ int mt7915_mcu_add_sta(struct mt7915_dev *dev, struct ieee80211_vif *vif,
 
 	if (sta && sta->ht_cap.ht_supported) {
 		/* starec amsdu */
-		mt7915_mcu_sta_amsdu_tlv(skb, vif, sta);
+		mt7915_mcu_sta_amsdu_tlv(dev, skb, vif, sta);
 		/* starec he */
 		mt7915_mcu_sta_he_tlv(skb, sta, vif);
 		/* starec muru */
-- 
2.29.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
