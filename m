Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03A27D41D6E
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Nov 2024 08:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9yQRQ1YMpsHYjVPXBs5cui/BYg5AqvlMAVHEJfqzNMU=; b=JdEik2MbSiYFR2PZ2Gtvd9oncl
	k9N8wtMWMSswEAiyH4dK1aS/aQENCMoj9fFX9QH/hiXxV4NyvHBghIgceWkIfR9UhaDfsMJ3bxL4S
	sKZL+SegLQTgEaoBAni9+/AVidRs2ry7wVqP1FBIBNLGlJWt+YlL2aAmtgjCYNt3EDSFDNi4xbxA0
	MW1PbhOT8FCTHCSk5J805PtfYPV0mrsCnB4/v4Hk1pkwiPLNjw4l4c450lQ20DZrSh0s21LVtaQfR
	pTPt1vwM6Fp7c+UTc0DQgBAvKT3smn4w1Fse6XkR/rxz1ATBSRxSRxzWkPLjv4YrGD/tY4PmjT7HK
	XFck2oXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAmY9-00000002h8s-04HB;
	Tue, 12 Nov 2024 08:47:01 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAmQl-00000002fKg-36KI
	for linux-mediatek@lists.infradead.org;
	Tue, 12 Nov 2024 08:39:25 +0000
X-UUID: 9b2fef1ea0d111ef82ff63e91e7eb18c-20241112
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=9yQRQ1YMpsHYjVPXBs5cui/BYg5AqvlMAVHEJfqzNMU=;
	b=usHQ2deB05xSWL1vycCXtG3O74TzNs4n5hkKwVE9z9Rzzh4ed8p7iT1B8q5Bbp29jTwx0srmxLiFrUQ6kOiOuC04OnqVYL6c3LyoW9VpePV4asl1d83+vZXJs5BhBg7lCQY36SY5JbNRB0+lgjXCXH0ZrRnPhBtR41pltS9pu20=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.42,REQID:32090e5d-9c5a-4f15-af30-f57b8903ae60,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:b0fcdc3,CLOUDID:bd93041c-4f51-4e1d-bb6a-1fd98b6b19d2,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_ULN,TF_CID_SPAM_SNR
X-UUID: 9b2fef1ea0d111ef82ff63e91e7eb18c-20241112
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <meichia.chiu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 615404004; Tue, 12 Nov 2024 01:39:18 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 12 Nov 2024 16:39:16 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 12 Nov 2024 16:39:16 +0800
From: MeiChia Chiu <MeiChia.Chiu@mediatek.com>
To: Johannes Berg <johannes@sipsolutions.net>
CC: Shayne Chen <shayne.chen@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, Money Wang <money.wang@mediatek.com>,
	<linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	MeiChia Chiu <MeiChia.Chiu@mediatek.com>, Peter Chiu
	<chui-hao.chiu@mediatek.com>
Subject: [PATCH v2] wifi: mac80211: Support EHT 1024 aggregation size in TX
Date: Tue, 12 Nov 2024 16:38:46 +0800
Message-ID: <20241112083846.32063-1-MeiChia.Chiu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_003923_814744_47547426 
X-CRM114-Status: GOOD (  21.57  )
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

Support EHT 1024 aggregation size in TX

The 1024 agg size for RX is supported but not for TX.
This patch adds this support and refactors common parsing logics for
addbaext in both process_addba_resp and process_addba_req into a
function.

Reviewed-by: Shayne Chen <shayne.chen@mediatek.com>
Reviewed-by: Money Wang <money.wang@mediatek.com>
Co-developed-by: Peter Chiu <chui-hao.chiu@mediatek.com>
Signed-off-by: Peter Chiu <chui-hao.chiu@mediatek.com>
Signed-off-by: MeiChia Chiu <MeiChia.Chiu@mediatek.com>

---
v2:
1. Update the commit message and title
2. Refactor the common parts into a function
---
 include/linux/ieee80211.h  |   2 +
 net/mac80211/agg-rx.c      | 102 ++++++++++++++++++++++++-------------
 net/mac80211/agg-tx.c      |  27 ++++++----
 net/mac80211/ht.c          |   2 +-
 net/mac80211/ieee80211_i.h |  10 +++-
 5 files changed, 95 insertions(+), 48 deletions(-)

diff --git a/include/linux/ieee80211.h b/include/linux/ieee80211.h
index 456bca45ff05..05dedc45505c 100644
--- a/include/linux/ieee80211.h
+++ b/include/linux/ieee80211.h
@@ -1445,6 +1445,8 @@ struct ieee80211_mgmt {
 					__le16 status;
 					__le16 capab;
 					__le16 timeout;
+					/* followed by BA Extension */
+					u8 variable[];
 				} __packed addba_resp;
 				struct{
 					u8 action_code;
diff --git a/net/mac80211/agg-rx.c b/net/mac80211/agg-rx.c
index fe7eab4b681b..2e2408774e88 100644
--- a/net/mac80211/agg-rx.c
+++ b/net/mac80211/agg-rx.c
@@ -170,28 +170,75 @@ static void sta_rx_agg_reorder_timer_expired(struct timer_list *t)
 	rcu_read_unlock();
 }
 
-static void ieee80211_add_addbaext(struct ieee80211_sub_if_data *sdata,
-				   struct sk_buff *skb,
-				   const struct ieee80211_addba_ext_ie *req,
-				   u16 buf_size)
+void ieee80211_add_addbaext(struct sk_buff *skb,
+			    const u8 req_addba_ext_data,
+			    u16 buf_size)
 {
-	struct ieee80211_addba_ext_ie *resp;
+	struct ieee80211_addba_ext_ie *addba_ext;
 	u8 *pos;
 
 	pos = skb_put_zero(skb, 2 + sizeof(struct ieee80211_addba_ext_ie));
 	*pos++ = WLAN_EID_ADDBA_EXT;
 	*pos++ = sizeof(struct ieee80211_addba_ext_ie);
-	resp = (struct ieee80211_addba_ext_ie *)pos;
-	resp->data = req->data & IEEE80211_ADDBA_EXT_NO_FRAG;
+	addba_ext = (struct ieee80211_addba_ext_ie *)pos;
 
-	resp->data |= u8_encode_bits(buf_size >> IEEE80211_ADDBA_EXT_BUF_SIZE_SHIFT,
-				     IEEE80211_ADDBA_EXT_BUF_SIZE_MASK);
+	addba_ext->data = IEEE80211_ADDBA_EXT_NO_FRAG;
+	if (req_addba_ext_data)
+		addba_ext->data &= req_addba_ext_data;
+
+	addba_ext->data |=
+		u8_encode_bits(buf_size >> IEEE80211_ADDBA_EXT_BUF_SIZE_SHIFT,
+			       IEEE80211_ADDBA_EXT_BUF_SIZE_MASK);
+}
+
+u8 ieee80211_retrieve_addba_ext_data(struct sta_info *sta,
+				     struct ieee80211_mgmt *mgmt,
+				     size_t len, u16 *buf_size,
+				     bool is_req)
+{
+	struct ieee802_11_elems *elems;
+	int ext_elem_len;
+	u8 buf_size_1k, data = 0;
+
+	if (!sta->sta.deflink.he_cap.has_he)
+		return 0;
+
+	if (is_req)
+		ext_elem_len = len - offsetof(struct ieee80211_mgmt,
+			       u.action.u.addba_req.variable);
+	else
+		ext_elem_len = len - offsetof(struct ieee80211_mgmt,
+			       u.action.u.addba_resp.variable);
+
+	if (ext_elem_len <= 0)
+		return 0;
+
+	elems = ieee802_11_parse_elems(is_req ?
+				       mgmt->u.action.u.addba_req.variable :
+				       mgmt->u.action.u.addba_resp.variable,
+				       ext_elem_len, true, NULL);
+
+	if (elems && !elems->parse_error && elems->addba_ext_ie) {
+		data = elems->addba_ext_ie->data;
+
+		if (!sta->sta.deflink.eht_cap.has_eht || !buf_size)
+			goto free;
+
+		buf_size_1k = u8_get_bits(elems->addba_ext_ie->data,
+					  IEEE80211_ADDBA_EXT_BUF_SIZE_MASK);
+		*buf_size |= (u16)buf_size_1k <<
+			     IEEE80211_ADDBA_EXT_BUF_SIZE_SHIFT;
+	}
+free:
+	kfree(elems);
+
+	return data;
 }
 
 static void ieee80211_send_addba_resp(struct sta_info *sta, u8 *da, u16 tid,
 				      u8 dialog_token, u16 status, u16 policy,
 				      u16 buf_size, u16 timeout,
-				      const struct ieee80211_addba_ext_ie *addbaext)
+				      const u8 req_addba_ext_data)
 {
 	struct ieee80211_sub_if_data *sdata = sta->sdata;
 	struct ieee80211_local *local = sdata->local;
@@ -223,8 +270,8 @@ static void ieee80211_send_addba_resp(struct sta_info *sta, u8 *da, u16 tid,
 	mgmt->u.action.u.addba_resp.timeout = cpu_to_le16(timeout);
 	mgmt->u.action.u.addba_resp.status = cpu_to_le16(status);
 
-	if (sta->sta.deflink.he_cap.has_he && addbaext)
-		ieee80211_add_addbaext(sdata, skb, addbaext, buf_size);
+	if (sta->sta.deflink.he_cap.has_he)
+		ieee80211_add_addbaext(skb, req_addba_ext_data, buf_size);
 
 	ieee80211_tx_skb(sdata, skb);
 }
@@ -233,7 +280,7 @@ void __ieee80211_start_rx_ba_session(struct sta_info *sta,
 				     u8 dialog_token, u16 timeout,
 				     u16 start_seq_num, u16 ba_policy, u16 tid,
 				     u16 buf_size, bool tx, bool auto_seq,
-				     const struct ieee80211_addba_ext_ie *addbaext)
+				     const u8 addba_ext_data)
 {
 	struct ieee80211_local *local = sta->sdata->local;
 	struct tid_ampdu_rx *tid_agg_rx;
@@ -419,7 +466,7 @@ void __ieee80211_start_rx_ba_session(struct sta_info *sta,
 	if (tx)
 		ieee80211_send_addba_resp(sta, sta->sta.addr, tid,
 					  dialog_token, status, 1, buf_size,
-					  timeout, addbaext);
+					  timeout, addba_ext_data);
 }
 
 void ieee80211_process_addba_request(struct ieee80211_local *local,
@@ -428,9 +475,7 @@ void ieee80211_process_addba_request(struct ieee80211_local *local,
 				     size_t len)
 {
 	u16 capab, tid, timeout, ba_policy, buf_size, start_seq_num;
-	struct ieee802_11_elems *elems = NULL;
-	u8 dialog_token;
-	int ies_len;
+	u8 dialog_token, addba_ext_data;
 
 	/* extract session parameters from addba request frame */
 	dialog_token = mgmt->u.action.u.addba_req.dialog_token;
@@ -443,28 +488,13 @@ void ieee80211_process_addba_request(struct ieee80211_local *local,
 	tid = (capab & IEEE80211_ADDBA_PARAM_TID_MASK) >> 2;
 	buf_size = (capab & IEEE80211_ADDBA_PARAM_BUF_SIZE_MASK) >> 6;
 
-	ies_len = len - offsetof(struct ieee80211_mgmt,
-				 u.action.u.addba_req.variable);
-	if (ies_len) {
-		elems = ieee802_11_parse_elems(mgmt->u.action.u.addba_req.variable,
-					       ies_len, true, NULL);
-		if (!elems || elems->parse_error)
-			goto free;
-	}
-
-	if (sta->sta.deflink.eht_cap.has_eht && elems && elems->addba_ext_ie) {
-		u8 buf_size_1k = u8_get_bits(elems->addba_ext_ie->data,
-					     IEEE80211_ADDBA_EXT_BUF_SIZE_MASK);
-
-		buf_size |= buf_size_1k << IEEE80211_ADDBA_EXT_BUF_SIZE_SHIFT;
-	}
+	addba_ext_data = ieee80211_retrieve_addba_ext_data(sta, mgmt,
+							   len, &buf_size,
+							   true);
 
 	__ieee80211_start_rx_ba_session(sta, dialog_token, timeout,
 					start_seq_num, ba_policy, tid,
-					buf_size, true, false,
-					elems ? elems->addba_ext_ie : NULL);
-free:
-	kfree(elems);
+					buf_size, true, false, addba_ext_data);
 }
 
 void ieee80211_manage_rx_ba_offl(struct ieee80211_vif *vif,
diff --git a/net/mac80211/agg-tx.c b/net/mac80211/agg-tx.c
index 04cb45cfb310..775b3a2df9a5 100644
--- a/net/mac80211/agg-tx.c
+++ b/net/mac80211/agg-tx.c
@@ -58,23 +58,24 @@
  * complete.
  */
 
-static void ieee80211_send_addba_request(struct ieee80211_sub_if_data *sdata,
-					 const u8 *da, u16 tid,
+static void ieee80211_send_addba_request(struct sta_info *sta, u16 tid,
 					 u8 dialog_token, u16 start_seq_num,
 					 u16 agg_size, u16 timeout)
 {
+	struct ieee80211_sub_if_data *sdata = sta->sdata;
 	struct ieee80211_local *local = sdata->local;
 	struct sk_buff *skb;
 	struct ieee80211_mgmt *mgmt;
 	u16 capab;
 
-	skb = dev_alloc_skb(sizeof(*mgmt) + local->hw.extra_tx_headroom);
-
+	skb = dev_alloc_skb(sizeof(*mgmt) +
+			    2 + sizeof(struct ieee80211_addba_ext_ie) +
+			    local->hw.extra_tx_headroom);
 	if (!skb)
 		return;
 
 	skb_reserve(skb, local->hw.extra_tx_headroom);
-	mgmt = ieee80211_mgmt_ba(skb, da, sdata);
+	mgmt = ieee80211_mgmt_ba(skb, sta->sta.addr, sdata);
 
 	skb_put(skb, 1 + sizeof(mgmt->u.action.u.addba_req));
 
@@ -93,6 +94,9 @@ static void ieee80211_send_addba_request(struct ieee80211_sub_if_data *sdata,
 	mgmt->u.action.u.addba_req.start_seq_num =
 					cpu_to_le16(start_seq_num << 4);
 
+	if (sta->sta.deflink.he_cap.has_he)
+		ieee80211_add_addbaext(skb, 0, agg_size);
+
 	ieee80211_tx_skb_tid(sdata, skb, tid, -1);
 }
 
@@ -460,8 +464,11 @@ static void ieee80211_send_addba_with_timeout(struct sta_info *sta,
 	sta->ampdu_mlme.addba_req_num[tid]++;
 	spin_unlock_bh(&sta->lock);
 
-	if (sta->sta.deflink.he_cap.has_he) {
+	if (sta->sta.deflink.eht_cap.has_eht) {
 		buf_size = local->hw.max_tx_aggregation_subframes;
+	} else if (sta->sta.deflink.he_cap.has_he) {
+		buf_size = min_t(u16, local->hw.max_tx_aggregation_subframes,
+				 IEEE80211_MAX_AMPDU_BUF_HE);
 	} else {
 		/*
 		 * We really should use what the driver told us it will
@@ -473,9 +480,8 @@ static void ieee80211_send_addba_with_timeout(struct sta_info *sta,
 	}
 
 	/* send AddBA request */
-	ieee80211_send_addba_request(sdata, sta->sta.addr, tid,
-				     tid_tx->dialog_token, tid_tx->ssn,
-				     buf_size, tid_tx->timeout);
+	ieee80211_send_addba_request(sta, tid, tid_tx->dialog_token,
+				     tid_tx->ssn, buf_size, tid_tx->timeout);
 
 	WARN_ON(test_and_set_bit(HT_AGG_STATE_SENT_ADDBA, &tid_tx->state));
 }
@@ -970,6 +976,9 @@ void ieee80211_process_addba_resp(struct ieee80211_local *local,
 	amsdu = capab & IEEE80211_ADDBA_PARAM_AMSDU_MASK;
 	tid = u16_get_bits(capab, IEEE80211_ADDBA_PARAM_TID_MASK);
 	buf_size = u16_get_bits(capab, IEEE80211_ADDBA_PARAM_BUF_SIZE_MASK);
+
+	ieee80211_retrieve_addba_ext_data(sta, mgmt, len, &buf_size, false);
+
 	buf_size = min(buf_size, local->hw.max_tx_aggregation_subframes);
 
 	txq = sta->sta.txq[tid];
diff --git a/net/mac80211/ht.c b/net/mac80211/ht.c
index 1c2b7dd8976a..32390d8a9d75 100644
--- a/net/mac80211/ht.c
+++ b/net/mac80211/ht.c
@@ -379,7 +379,7 @@ void ieee80211_ba_session_work(struct wiphy *wiphy, struct wiphy_work *work)
 				       sta->ampdu_mlme.tid_rx_manage_offl))
 			__ieee80211_start_rx_ba_session(sta, 0, 0, 0, 1, tid,
 							IEEE80211_MAX_AMPDU_BUF_HT,
-							false, true, NULL);
+							false, true, 0);
 
 		if (test_and_clear_bit(tid + IEEE80211_NUM_TIDS,
 				       sta->ampdu_mlme.tid_rx_manage_offl))
diff --git a/net/mac80211/ieee80211_i.h b/net/mac80211/ieee80211_i.h
index 7dcb46120abc..22da0558389b 100644
--- a/net/mac80211/ieee80211_i.h
+++ b/net/mac80211/ieee80211_i.h
@@ -2111,14 +2111,20 @@ int ieee80211_send_smps_action(struct ieee80211_sub_if_data *sdata,
 			       const u8 *bssid, int link_id);
 bool ieee80211_smps_is_restrictive(enum ieee80211_smps_mode smps_mode_old,
 				   enum ieee80211_smps_mode smps_mode_new);
-
+void ieee80211_add_addbaext(struct sk_buff *skb,
+			    const u8 req_addba_ext_data,
+			    u16 buf_size);
+u8 ieee80211_retrieve_addba_ext_data(struct sta_info *sta,
+				     struct ieee80211_mgmt *mgmt,
+				     size_t len, u16 *buf_size,
+				     bool is_req);
 void __ieee80211_stop_rx_ba_session(struct sta_info *sta, u16 tid,
 				    u16 initiator, u16 reason, bool stop);
 void __ieee80211_start_rx_ba_session(struct sta_info *sta,
 				     u8 dialog_token, u16 timeout,
 				     u16 start_seq_num, u16 ba_policy, u16 tid,
 				     u16 buf_size, bool tx, bool auto_seq,
-				     const struct ieee80211_addba_ext_ie *addbaext);
+				     const u8 addba_ext_data);
 void ieee80211_sta_tear_down_BA_sessions(struct sta_info *sta,
 					 enum ieee80211_agg_stop_reason reason);
 void ieee80211_process_delba(struct ieee80211_sub_if_data *sdata,
-- 
2.45.2


