Return-Path: <SRS0=8MWw=JJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1924C433ED
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Apr 2021 05:41:03 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 10D296120F
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Apr 2021 05:41:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 10D296120F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=l4nS/n+Ii6hj+NpW1hd2ri22yDs7NO2WZeMh0oqrruM=; b=btWdAvvE3ilhR3+j2Wuat2n37u
	BhXO27/J0iEL801IprM4HNtrh7cA9bz+KEwiE7BxdHZdv3vIUxBSLV+SFto225bAZ43ug7WRjOT95
	lJP+qz/jSaubLkidcufFs8DgFAo30iIb9gP8B/UY71zvGBg1lVwWJDh3JXqVWkf+sVEcyHsFKptQo
	3LxEbGbp0ymHkJ11cVWq8jebw/UN/m/F2XPc0wljqa2/2dYsrM0G6Hz5F9JYhTsmxxFMJhfzfatsq
	IVzXEHvnsnooO6M2AFmFKYWWu26e/sml3AN4IiFE6AiuvKQN6X79blIs12bHuM7zI8bI7qNCjtW6u
	yOE7I5TA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lVpJd-005kMh-3T; Mon, 12 Apr 2021 05:40:53 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVpJX-005kMC-Tf
 for linux-mediatek@desiato.infradead.org; Mon, 12 Apr 2021 05:40:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=Y7hZbmEkHe9XX70xuJXNKEeMPCYfKwCBF9bJW21BuMM=; b=wW7adZo39/tPKa4U+oG3j1VuSH
 bdhyoThRJP4aJPeeXGjFKhcOURnOm1R0Jscw5g0mEiZoKHnt1zexCpoANer7AxjLoiDAAwcllWu+1
 waa/AsEXmZilJj50C1xR+Z04cgWaChPZzk9yB6dLMGEN9nZpK2tIV5vn6R9/2WS149YSQ3tG/FUwU
 PJry5XPhVlg/DRUE+AGNWBZDmJlxzdF25KaM+ia+whAVOxFuDptMpVFukviAGAMIprOMos2xphYcN
 qwIZKA9McMa+2cfpb0jhfe02QDX4uG3mT2e0WsI8zAsg1T9Gfd84w1n4ySGw7vGsqFwEX706WarpE
 9iwGzGBA==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVpJT-005t9Z-Cc
 for linux-mediatek@lists.infradead.org; Mon, 12 Apr 2021 05:40:45 +0000
X-UUID: 7be9094783b24c05bd54ff5dec063e2d-20210411
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=Y7hZbmEkHe9XX70xuJXNKEeMPCYfKwCBF9bJW21BuMM=; 
 b=sBaUkmOqIOQjUYPVGTRPevpbSWmABPXz9g52fSBRbuIBa5EU8WxE9vZ10ki+cRJuew+5QmMu42NBYK27WlHkNsj1WkI5a1+TavJqP03AuENPdcHL+t9z4UNFpmIPRY6mumlClXwhhzUwLHArXNckuOD8B25iQjhxnRcF/Qt5ywA=;
X-UUID: 7be9094783b24c05bd54ff5dec063e2d-20210411
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <shayne.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1703118608; Sun, 11 Apr 2021 22:40:37 -0700
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 11 Apr 2021 22:40:35 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 12 Apr 2021 13:40:33 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 12 Apr 2021 13:40:33 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>, Ryder Lee <ryder.lee@mediatek.com>, "Evelyn
 Tsai" <evelyn.tsai@mediatek.com>, linux-mediatek
 <linux-mediatek@lists.infradead.org>, Shayne Chen <shayne.chen@mediatek.com>
Subject: [PATCH 1/3] mt76: testmode: add support to send larger packet
Date: Mon, 12 Apr 2021 13:39:52 +0800
Message-ID: <20210412053954.23544-1-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-TM-SNTS-SMTP: B06D6AABF5C66E688E12ADA12917E35FAD1AD601A5712D22514C95723DE744E62000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210411_224043_469515_A5223E66 
X-CRM114-Status: GOOD (  19.24  )
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

Add support to send larger packet in testmode to meet requirements
of some test cases.
The limit of max packet size is determined based on tx rate mode setting.

Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt76.h     |   3 +-
 drivers/net/wireless/mediatek/mt76/testmode.c | 159 ++++++++++++++----
 drivers/net/wireless/mediatek/mt76/testmode.h |   2 +-
 drivers/net/wireless/mediatek/mt76/tx.c       |   2 +-
 4 files changed, 131 insertions(+), 35 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76.h b/drivers/net/wireless/mediatek/mt76/mt76.h
index 4571f0e..bf049fb 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76.h
@@ -539,7 +539,7 @@ struct mt76_testmode_data {
 	struct sk_buff *tx_skb;
 
 	u32 tx_count;
-	u16 tx_msdu_len;
+	u16 tx_mpdu_len;
 
 	u8 tx_rate_mode;
 	u8 tx_rate_idx;
@@ -1082,6 +1082,7 @@ int mt76_testmode_cmd(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 int mt76_testmode_dump(struct ieee80211_hw *hw, struct sk_buff *skb,
 		       struct netlink_callback *cb, void *data, int len);
 int mt76_testmode_set_state(struct mt76_phy *phy, enum mt76_testmode_state state);
+int mt76_testmode_alloc_skb(struct mt76_phy *phy, u32 len);
 
 static inline void mt76_testmode_reset(struct mt76_phy *phy, bool disable)
 {
diff --git a/drivers/net/wireless/mediatek/mt76/testmode.c b/drivers/net/wireless/mediatek/mt76/testmode.c
index cc76964..001d0ba 100644
--- a/drivers/net/wireless/mediatek/mt76/testmode.c
+++ b/drivers/net/wireless/mediatek/mt76/testmode.c
@@ -62,36 +62,83 @@ void mt76_testmode_tx_pending(struct mt76_phy *phy)
 	spin_unlock_bh(&q->lock);
 }
 
+static u32
+mt76_testmode_max_mpdu_len(struct mt76_phy *phy, u8 tx_rate_mode)
+{
+	switch (tx_rate_mode) {
+	case MT76_TM_TX_MODE_HT:
+		return IEEE80211_MAX_MPDU_LEN_HT_7935;
+	case MT76_TM_TX_MODE_VHT:
+	case MT76_TM_TX_MODE_HE_SU:
+	case MT76_TM_TX_MODE_HE_EXT_SU:
+	case MT76_TM_TX_MODE_HE_TB:
+	case MT76_TM_TX_MODE_HE_MU:
+		if (phy->sband_5g.sband.vht_cap.cap &
+		    IEEE80211_VHT_CAP_MAX_MPDU_LENGTH_7991)
+			return IEEE80211_MAX_MPDU_LEN_VHT_7991;
+		return IEEE80211_MAX_MPDU_LEN_VHT_11454;
+	case MT76_TM_TX_MODE_CCK:
+	case MT76_TM_TX_MODE_OFDM:
+	default:
+		return IEEE80211_MAX_FRAME_LEN;
+	}
+}
 
-static int
-mt76_testmode_tx_init(struct mt76_phy *phy)
+static void
+mt76_testmode_free_skb(struct mt76_phy *phy)
 {
 	struct mt76_testmode_data *td = &phy->test;
-	struct ieee80211_tx_info *info;
-	struct ieee80211_hdr *hdr;
-	struct sk_buff *skb;
+	struct sk_buff *skb = td->tx_skb;
+
+	if (!skb)
+		return;
+
+	if (skb_has_frag_list(skb)) {
+		kfree_skb_list(skb_shinfo(skb)->frag_list);
+		skb_shinfo(skb)->frag_list = NULL;
+	}
+
+	dev_kfree_skb(skb);
+	td->tx_skb = NULL;
+}
+
+int mt76_testmode_alloc_skb(struct mt76_phy *phy, u32 len)
+{
+#define MT_TXP_MAX_LEN	4095
 	u16 fc = IEEE80211_FTYPE_DATA | IEEE80211_STYPE_DATA |
 		 IEEE80211_FCTL_FROMDS;
-	struct ieee80211_tx_rate *rate;
-	u8 max_nss = hweight8(phy->antenna_mask);
+	struct mt76_testmode_data *td = &phy->test;
 	bool ext_phy = phy != &phy->dev->phy;
+	struct sk_buff **frag_tail, *head;
+	struct ieee80211_tx_info *info;
+	struct ieee80211_hdr *hdr;
+	u32 max_len, head_len;
+	int nfrags, i;
 
-	if (td->tx_antenna_mask)
-		max_nss = min_t(u8, max_nss, hweight8(td->tx_antenna_mask));
+	max_len = mt76_testmode_max_mpdu_len(phy, td->tx_rate_mode);
+	if (len > max_len)
+		len = max_len;
+	else if (len < sizeof(struct ieee80211_hdr))
+		len = sizeof(struct ieee80211_hdr);
 
-	skb = alloc_skb(td->tx_msdu_len, GFP_KERNEL);
-	if (!skb)
+	nfrags = len / MT_TXP_MAX_LEN;
+	head_len = nfrags ? MT_TXP_MAX_LEN : len;
+
+	if (len > IEEE80211_MAX_FRAME_LEN)
+		fc |= IEEE80211_STYPE_QOS_DATA;
+
+	head = alloc_skb(head_len, GFP_KERNEL);
+	if (!head)
 		return -ENOMEM;
 
-	dev_kfree_skb(td->tx_skb);
-	td->tx_skb = skb;
-	hdr = __skb_put_zero(skb, td->tx_msdu_len);
+	hdr = __skb_put_zero(head, head_len);
 	hdr->frame_control = cpu_to_le16(fc);
 	memcpy(hdr->addr1, phy->macaddr, sizeof(phy->macaddr));
 	memcpy(hdr->addr2, phy->macaddr, sizeof(phy->macaddr));
 	memcpy(hdr->addr3, phy->macaddr, sizeof(phy->macaddr));
+	skb_set_queue_mapping(head, IEEE80211_AC_BE);
 
-	info = IEEE80211_SKB_CB(skb);
+	info = IEEE80211_SKB_CB(head);
 	info->flags = IEEE80211_TX_CTL_INJECTED |
 		      IEEE80211_TX_CTL_NO_ACK |
 		      IEEE80211_TX_CTL_NO_PS_BUFFER;
@@ -99,9 +146,60 @@ mt76_testmode_tx_init(struct mt76_phy *phy)
 	if (ext_phy)
 		info->hw_queue |= MT_TX_HW_QUEUE_EXT_PHY;
 
+	frag_tail = &skb_shinfo(head)->frag_list;
+
+	for (i = 0; i < nfrags; i++) {
+		struct sk_buff *frag;
+		u16 frag_len;
+
+		if (i == nfrags - 1)
+			frag_len = len % MT_TXP_MAX_LEN;
+		else
+			frag_len = MT_TXP_MAX_LEN;
+
+		frag = alloc_skb(frag_len, GFP_KERNEL);
+		if (!frag)
+			return -ENOMEM;
+
+		__skb_put_zero(frag, frag_len);
+		head->len += frag->len;
+		head->data_len += frag->len;
+
+		if (*frag_tail) {
+			(*frag_tail)->next = frag;
+			frag_tail = &frag;
+		} else {
+			*frag_tail = frag;
+		}
+	}
+
+	mt76_testmode_free_skb(phy);
+	td->tx_skb = head;
+
+	return 0;
+}
+EXPORT_SYMBOL(mt76_testmode_alloc_skb);
+
+static int
+mt76_testmode_tx_init(struct mt76_phy *phy)
+{
+	struct mt76_testmode_data *td = &phy->test;
+	struct ieee80211_tx_info *info;
+	struct ieee80211_tx_rate *rate;
+	u8 max_nss = hweight8(phy->antenna_mask);
+	int ret;
+
+	ret = mt76_testmode_alloc_skb(phy, td->tx_mpdu_len);
+	if (ret)
+		return ret;
+
 	if (td->tx_rate_mode > MT76_TM_TX_MODE_VHT)
 		goto out;
 
+	if (td->tx_antenna_mask)
+		max_nss = min_t(u8, max_nss, hweight8(td->tx_antenna_mask));
+
+	info = IEEE80211_SKB_CB(td->tx_skb);
 	rate = &info->control.rates[0];
 	rate->count = 1;
 	rate->idx = td->tx_rate_idx;
@@ -171,8 +269,6 @@ mt76_testmode_tx_init(struct mt76_phy *phy)
 		}
 	}
 out:
-	skb_set_queue_mapping(skb, IEEE80211_AC_BE);
-
 	return 0;
 }
 
@@ -203,8 +299,7 @@ mt76_testmode_tx_stop(struct mt76_phy *phy)
 	wait_event_timeout(dev->tx_wait, td->tx_done == td->tx_queued,
 			   MT76_TM_TIMEOUT * HZ);
 
-	dev_kfree_skb(td->tx_skb);
-	td->tx_skb = NULL;
+	mt76_testmode_free_skb(phy);
 }
 
 static inline void
@@ -224,10 +319,10 @@ mt76_testmode_init_defaults(struct mt76_phy *phy)
 {
 	struct mt76_testmode_data *td = &phy->test;
 
-	if (td->tx_msdu_len > 0)
+	if (td->tx_mpdu_len > 0)
 		return;
 
-	td->tx_msdu_len = 1024;
+	td->tx_mpdu_len = 1024;
 	td->tx_count = 1;
 	td->tx_rate_mode = MT76_TM_TX_MODE_OFDM;
 	td->tx_rate_nss = 1;
@@ -345,16 +440,6 @@ int mt76_testmode_cmd(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 	if (tb[MT76_TM_ATTR_TX_COUNT])
 		td->tx_count = nla_get_u32(tb[MT76_TM_ATTR_TX_COUNT]);
 
-	if (tb[MT76_TM_ATTR_TX_LENGTH]) {
-		u32 val = nla_get_u32(tb[MT76_TM_ATTR_TX_LENGTH]);
-
-		if (val > IEEE80211_MAX_FRAME_LEN ||
-		    val < sizeof(struct ieee80211_hdr))
-			goto out;
-
-		td->tx_msdu_len = val;
-	}
-
 	if (tb[MT76_TM_ATTR_TX_RATE_IDX])
 		td->tx_rate_idx = nla_get_u8(tb[MT76_TM_ATTR_TX_RATE_IDX]);
 
@@ -375,6 +460,16 @@ int mt76_testmode_cmd(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 			   &td->tx_power_control, 0, 1))
 		goto out;
 
+	if (tb[MT76_TM_ATTR_TX_LENGTH]) {
+		u32 val = nla_get_u32(tb[MT76_TM_ATTR_TX_LENGTH]);
+
+		if (val > mt76_testmode_max_mpdu_len(phy, td->tx_rate_mode) ||
+		    val < sizeof(struct ieee80211_hdr))
+			goto out;
+
+		td->tx_mpdu_len = val;
+	}
+
 	if (tb[MT76_TM_ATTR_TX_IPG])
 		td->tx_ipg = nla_get_u32(tb[MT76_TM_ATTR_TX_IPG]);
 
@@ -506,7 +601,7 @@ int mt76_testmode_dump(struct ieee80211_hw *hw, struct sk_buff *msg,
 		goto out;
 
 	if (nla_put_u32(msg, MT76_TM_ATTR_TX_COUNT, td->tx_count) ||
-	    nla_put_u32(msg, MT76_TM_ATTR_TX_LENGTH, td->tx_msdu_len) ||
+	    nla_put_u32(msg, MT76_TM_ATTR_TX_LENGTH, td->tx_mpdu_len) ||
 	    nla_put_u8(msg, MT76_TM_ATTR_TX_RATE_MODE, td->tx_rate_mode) ||
 	    nla_put_u8(msg, MT76_TM_ATTR_TX_RATE_NSS, td->tx_rate_nss) ||
 	    nla_put_u8(msg, MT76_TM_ATTR_TX_RATE_IDX, td->tx_rate_idx) ||
diff --git a/drivers/net/wireless/mediatek/mt76/testmode.h b/drivers/net/wireless/mediatek/mt76/testmode.h
index e0c706c..d32a765 100644
--- a/drivers/net/wireless/mediatek/mt76/testmode.h
+++ b/drivers/net/wireless/mediatek/mt76/testmode.h
@@ -21,7 +21,7 @@
  * @MT76_TM_ATTR_TX_COUNT: configured number of frames to send when setting
  *	state to MT76_TM_STATE_TX_FRAMES (u32)
  * @MT76_TM_ATTR_TX_PENDING: pending frames during MT76_TM_STATE_TX_FRAMES (u32)
- * @MT76_TM_ATTR_TX_LENGTH: packet tx msdu length (u32)
+ * @MT76_TM_ATTR_TX_LENGTH: packet tx mpdu length (u32)
  * @MT76_TM_ATTR_TX_RATE_MODE: packet tx mode (u8, see &enum mt76_testmode_tx_mode)
  * @MT76_TM_ATTR_TX_RATE_NSS: packet tx number of spatial streams (u8)
  * @MT76_TM_ATTR_TX_RATE_IDX: packet tx rate/MCS index (u8)
diff --git a/drivers/net/wireless/mediatek/mt76/tx.c b/drivers/net/wireless/mediatek/mt76/tx.c
index 451ed60..04e4725 100644
--- a/drivers/net/wireless/mediatek/mt76/tx.c
+++ b/drivers/net/wireless/mediatek/mt76/tx.c
@@ -213,7 +213,7 @@ void mt76_tx_complete_skb(struct mt76_dev *dev, u16 wcid_idx, struct sk_buff *sk
 		if (phy->test.tx_queued == phy->test.tx_done)
 			wake_up(&dev->tx_wait);
 
-		ieee80211_free_txskb(hw, skb);
+		dev_kfree_skb_any(skb);
 		return;
 	}
 #endif
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
