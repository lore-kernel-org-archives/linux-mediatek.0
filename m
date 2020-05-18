Return-Path: <SRS0=JQKK=7A=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A53D7C433E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 May 2020 18:11:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F04D20671
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 May 2020 18:11:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LGM2kzxg";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="dOr7V5ps"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7F04D20671
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=oihnqG4RqsjxzAMc4cp14Tbj/rFRA3p+xWqTvlp4Iu0=; b=LGM2kzxgYrmDkO
	tsUUt48jWuAB6DIUKz1C5Zh7QWDe/jknJmx+H/lClf2V6kE0cx0D8+72JRUeHiz64xzXEoKfpKWN2
	ybZBSXtiZQh91dMlsAgODynl9kPHg1vEtDNQpjbAl2OilUZ4fW77mvPoSRhQz0+LK0pk+iab8zN+K
	r5NqCFoYqCwUu1V5D7vv+TR6Y8JV0hXcoHEt8XMOQD8MnBN+x986TLug7aWUUVG/Sp/qcpmbwLB9b
	r6MSK6YDCZEeEXXSFUy0sIWI6pUwGRr6qUTgABEYFtkB/J0R4ltWJaf0Leujls95OTcB7AQyi8n5a
	jk8rqfU2M/Wyev1L4Rqw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jakED-0006ZF-Bq; Mon, 18 May 2020 18:11:05 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jakBF-0001Lh-0t
 for linux-mediatek@lists.infradead.org; Mon, 18 May 2020 18:08:10 +0000
X-UUID: 67e831ef2ccd4763a8b1a55849b5ee66-20200518
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=QI/loMP2VToOSyHyl11M4kud5QzGX96YAIJFStf1DNc=; 
 b=dOr7V5psWni+BxA76oDJhValHXXEXbnKzsCXcSSs5/wwZR8nN7DlaKcy0h37MBQCdG3r1bqwBy2pFS6mR+NTjqgq4Bs8kW71aw0ZZajPRWP+VzcRCzBfRjbohiWfc+I74SuC9lb4eMorB06SdX+oeUhRnp+aoZX/23J1tDPJLtA=;
X-UUID: 67e831ef2ccd4763a8b1a55849b5ee66-20200518
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1443393829; Mon, 18 May 2020 10:07:27 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 18 May 2020 11:07:50 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 19 May 2020 02:07:47 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 19 May 2020 02:07:47 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>
Subject: [PATCH] mt76: mt7915: fix some sparse warnings
Date: Tue, 19 May 2020 02:07:38 +0800
Message-ID: <6efa759a84f6662443fbb52362f0d803796d8cdd.1589824684.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-TM-SNTS-SMTP: EF4C687C787AE45E9FF14781D1D65BDC6408EDA5EB491AF174DE1B3E532485062000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200518_110801_127710_1AC5CCAF 
X-CRM114-Status: UNSURE (   9.05  )
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
Cc: linux-mediatek@lists.infradead.org, Sean Wang <sean.wang@mediatek.com>,
 linux-wireless@vger.kernel.org, Ryder Lee <ryder.lee@mediatek.com>,
 Shayne Chen <shayne.chen@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

drivers/net/wireless/mediatek/mt76/mt7915/main.c:694:1: sparse:
sparse: context imbalance in 'mt7915_sta_rc_update' - wrong count at exit
drivers/net/wireless/mediatek/mt76/mt7915/mac.c:303:43: sparse: sparse: cast to restricted __le32
drivers/net/wireless/mediatek/mt76/mt7915/mac.c:304:43: sparse: sparse: cast to restricted __le32
drivers/net/wireless/mediatek/mt76/mt7915/mac.c:305:43: sparse: sparse: cast to restricted __le32
drivers/net/wireless/mediatek/mt76/mt7915/mac.c:319:35: sparse: sparse: cast to restricted __le32
drivers/net/wireless/mediatek/mt76/mt7915/mac.c:327:35: sparse: sparse: cast to restricted __le32
drivers/net/wireless/mediatek/mt76/mt7915/mac.c:345:41: sparse: sparse: cast to restricted __le32
drivers/net/wireless/mediatek/mt76/mt7915/mac.c:355:33: sparse: sparse: cast to restricted __le32
drivers/net/wireless/mediatek/mt76/mt7915/mac.c:451:21: sparse: sparse: invalid assignment: |=
drivers/net/wireless/mediatek/mt76/mt7915/mac.c:451:21: sparse:    left side has type unsigned int
drivers/net/wireless/mediatek/mt76/mt7915/mac.c:451:21: sparse:    right side has type restricted __le32

Fixes: e57b790 ("mt76: add mac80211 driver for MT7915 PCIe-based chipsets")
Reported-by: kbuild test robot <lkp@intel.com>
Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7915/mac.c   | 32 +++++++++++--------
 .../net/wireless/mediatek/mt76/mt7915/main.c  |  2 +-
 2 files changed, 20 insertions(+), 14 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
index bf96b389c813..ab20dfde94af 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
@@ -425,20 +425,26 @@ int mt7915_mac_fill_rx(struct mt7915_dev *dev, struct sk_buff *skb)
 
 	/* RXD Group 3 - P-RXV */
 	if (rxd1 & MT_RXD1_NORMAL_GROUP_3) {
+		u32 v0, v1, v2;
+
 		memcpy(rxv.v, rxd, sizeof(rxv.v));
 
 		rxd += 2;
 		if ((u8 *)rxd - skb->data >= skb->len)
 			return -EINVAL;
 
-		if (rxv.v[0] & MT_PRXV_HT_AD_CODE)
+		v0 = le32_to_cpu(rxv.v[0]);
+		v1 = le32_to_cpu(rxv.v[1]);
+		v2 = le32_to_cpu(rxv.v[2]);
+
+		if (v0 & MT_PRXV_HT_AD_CODE)
 			status->enc_flags |= RX_ENC_FLAG_LDPC;
 
 		status->chains = mphy->antenna_mask;
-		status->chain_signal[0] = to_rssi(MT_PRXV_RCPI0, rxv.v[1]);
-		status->chain_signal[1] = to_rssi(MT_PRXV_RCPI1, rxv.v[1]);
-		status->chain_signal[2] = to_rssi(MT_PRXV_RCPI2, rxv.v[1]);
-		status->chain_signal[3] = to_rssi(MT_PRXV_RCPI3, rxv.v[1]);
+		status->chain_signal[0] = to_rssi(MT_PRXV_RCPI0, v1);
+		status->chain_signal[1] = to_rssi(MT_PRXV_RCPI1, v1);
+		status->chain_signal[2] = to_rssi(MT_PRXV_RCPI2, v1);
+		status->chain_signal[3] = to_rssi(MT_PRXV_RCPI3, v1);
 		status->signal = status->chain_signal[0];
 
 		for (i = 1; i < hweight8(mphy->antenna_mask); i++) {
@@ -451,16 +457,16 @@ int mt7915_mac_fill_rx(struct mt7915_dev *dev, struct sk_buff *skb)
 
 		/* RXD Group 5 - C-RXV */
 		if (rxd1 & MT_RXD1_NORMAL_GROUP_5) {
-			u8 stbc = FIELD_GET(MT_CRXV_HT_STBC, rxv.v[2]);
-			u8 gi = FIELD_GET(MT_CRXV_HT_SHORT_GI, rxv.v[2]);
+			u8 stbc = FIELD_GET(MT_CRXV_HT_STBC, v2);
+			u8 gi = FIELD_GET(MT_CRXV_HT_SHORT_GI, v2);
 			bool cck = false;
 
 			rxd += 18;
 			if ((u8 *)rxd - skb->data >= skb->len)
 				return -EINVAL;
 
-			idx = i = FIELD_GET(MT_PRXV_TX_RATE, rxv.v[0]);
-			rxv.phy = FIELD_GET(MT_CRXV_TX_MODE, rxv.v[2]);
+			idx = i = FIELD_GET(MT_PRXV_TX_RATE, v0);
+			rxv.phy = FIELD_GET(MT_CRXV_TX_MODE, v2);
 
 			switch (rxv.phy) {
 			case MT_PHY_TYPE_CCK:
@@ -477,7 +483,7 @@ int mt7915_mac_fill_rx(struct mt7915_dev *dev, struct sk_buff *skb)
 				break;
 			case MT_PHY_TYPE_VHT:
 				status->nss =
-					FIELD_GET(MT_PRXV_NSTS, rxv.v[0]) + 1;
+					FIELD_GET(MT_PRXV_NSTS, v0) + 1;
 				status->encoding = RX_ENC_VHT;
 				if (i > 9)
 					return -EINVAL;
@@ -489,7 +495,7 @@ int mt7915_mac_fill_rx(struct mt7915_dev *dev, struct sk_buff *skb)
 			case MT_PHY_TYPE_HE_EXT_SU:
 			case MT_PHY_TYPE_HE_TB:
 				status->nss =
-					FIELD_GET(MT_PRXV_NSTS, rxv.v[0]) + 1;
+					FIELD_GET(MT_PRXV_NSTS, v0) + 1;
 				status->encoding = RX_ENC_HE;
 				status->flag |= RX_FLAG_RADIOTAP_HE;
 				i &= GENMASK(3, 0);
@@ -505,7 +511,7 @@ int mt7915_mac_fill_rx(struct mt7915_dev *dev, struct sk_buff *skb)
 			}
 			status->rate_idx = i;
 
-			switch (FIELD_GET(MT_CRXV_FRAME_MODE, rxv.v[2])) {
+			switch (FIELD_GET(MT_CRXV_FRAME_MODE, v2)) {
 			case IEEE80211_STA_RX_BW_20:
 				break;
 			case IEEE80211_STA_RX_BW_40:
@@ -611,7 +617,7 @@ void mt7915_mac_write_txwi(struct mt7915_dev *dev, __le32 *txwi,
 			 skb->priority & IEEE80211_QOS_CTL_TID_MASK) |
 	      FIELD_PREP(MT_TXD1_OWN_MAC, omac_idx);
 	if (ext_phy && q_idx >= MT_LMAC_ALTX0 && q_idx <= MT_LMAC_BCN0)
-		val |= cpu_to_le32(MT_TXD1_TGID);
+		val |= MT_TXD1_TGID;
 
 	txwi[1] = cpu_to_le32(val);
 
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/main.c b/drivers/net/wireless/mediatek/mt76/mt7915/main.c
index e045dc234100..0575c259f245 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/main.c
@@ -795,7 +795,7 @@ mt7915_sta_rc_update(struct ieee80211_hw *hw,
 		rcu_read_unlock();
 		return;
 	}
-	rcu_read_lock();
+	rcu_read_unlock();
 
 	set_bit(changed, &msta->stats.changed);
 	ieee80211_queue_work(hw, &msta->stats_work);
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
