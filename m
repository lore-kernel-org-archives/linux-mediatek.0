Return-Path: <SRS0=GdzH=KO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82963C433ED
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 May 2021 19:57:09 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0284D61059
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 May 2021 19:57:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0284D61059
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/87+N9ruxsAOLjLF0YaHj6IJcDQjxAWOAPmQWpDvduE=; b=FjJQQCZTDvPCYWcRkqvJtzG5o3
	ylgwu/I1T+IP1rnCYwKFOblS7z6b9WGRFRKz2huKp9PsLJf15eCfgeVh+5qPvv8mmtbhFu1pt6k7X
	nofDYP5fzovh4odjCiDDG+u936FdmIA0iOKwLzowJsFbQTkAMaMad3skVrKmYtAmOl1h02oogsE8A
	vfv1Y7+ucatbW2cJp9QbgwAmiKFw8l2qNA9vTjPRHCXhNPTpLzMWqZ+pl6oSisG1zVelQkcFNWFv1
	7+N7m6Kt9GPCBpko7oPlPN0sdbOMqTYiqNf1TATwN3jgIWVvujjOdJb6QS6artFkXhcbzPNkwjjej
	RrlfJ8ng==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ljSJG-004xUd-6B; Wed, 19 May 2021 19:56:50 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljSJD-004xTg-RE
 for linux-mediatek@desiato.infradead.org; Wed, 19 May 2021 19:56:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=669gyTozh3mbMoOIJQYYqqnokhQ1EJuF5kINvOHwPM4=; b=UaOQP8BVHyg5uSts5LQzpMggRg
 GrULwHhi3m0vSjOM5gV0dRAVHqkC0aT9wp1QmJBpXBp58L/1ZAuk14Eh/9CVOS2iRyXRvRdeyoIJA
 9uWpSiY2SLZZ9E9NXJR60jFLY2Lz7P2TNP8uNIL1YmVnlyJcrSs3rp1WqmBCAecN+Xr8gLSotow5Z
 6wYMbs/mCrP26b1XJMj3g5f9w13SsJKRakCa/Kjk7tCqIBwV2ow+DuLyjjOSy4T1cAsYeQCZXS+0o
 303G5kXGTCT3COtKEDwJqaYzGziNPFlpNBRgTK1ol4B73oIoqfLycqLQX+X4seLnhesdS5jA2qpoI
 ASehqlEA==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljSJ7-00FkgD-V5
 for linux-mediatek@lists.infradead.org; Wed, 19 May 2021 19:56:44 +0000
X-UUID: 3c5946d7490a4eeb9f5cf606524a3f50-20210519
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=669gyTozh3mbMoOIJQYYqqnokhQ1EJuF5kINvOHwPM4=; 
 b=dM9Ggmep1mI7kWS0gnPo7q86f3i4ctJYmAQwPZT3qAFke1X1Om8ZA0Jfbh4+K5spCnfrWJjIuEqq39otzJJmFNvEKsL+bHMxDgxOJFoTgBXOatPl3eqXe234/kPohA4CE+aA7uifix6kLQReDkR7YKopjLN7AguCrEDFNMDewvA=;
X-UUID: 3c5946d7490a4eeb9f5cf606524a3f50-20210519
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1383200674; Wed, 19 May 2021 12:56:35 -0700
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 19 May 2021 12:56:33 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 20 May 2021 03:56:25 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 20 May 2021 03:56:25 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Johannes Berg <johannes.berg@intel.com>
CC: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Shayne Chen
 <shayne.chen@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>, Bo Jiao
 <bo.jiao@mediatek.com>, Sujuan Chen <sujuan.chen@mediatek.com>,
 <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 "Ryder Lee" <ryder.lee@mediatek.com>
Subject: [RFC PATCH 1/4] mac80211: call ieee80211_tx_h_rate_ctrl() when dequeue
Date: Thu, 20 May 2021 03:56:21 +0800
Message-ID: <a959135d3fe21118f38c33fc9ffb18124c1ef7ce.1621453091.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210519_125643_426334_2AE0B585 
X-CRM114-Status: GOOD (  14.02  )
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

Make ieee80211_tx_h_rate_ctrl() get called on dequeue to improve
performance since it reduces the turnaround time for rate control.

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 net/mac80211/tx.c | 52 ++++++++++++++++++++++++++---------------------
 1 file changed, 29 insertions(+), 23 deletions(-)

diff --git a/net/mac80211/tx.c b/net/mac80211/tx.c
index 0b719f3d2dec..b3ef6aaece31 100644
--- a/net/mac80211/tx.c
+++ b/net/mac80211/tx.c
@@ -1768,8 +1768,6 @@ static int invoke_tx_handlers_early(struct ieee80211_tx_data *tx)
 	CALL_TXH(ieee80211_tx_h_ps_buf);
 	CALL_TXH(ieee80211_tx_h_check_control_port_protocol);
 	CALL_TXH(ieee80211_tx_h_select_key);
-	if (!ieee80211_hw_check(&tx->local->hw, HAS_RATE_CONTROL))
-		CALL_TXH(ieee80211_tx_h_rate_ctrl);
 
  txh_done:
 	if (unlikely(res == TX_DROP)) {
@@ -1802,6 +1800,9 @@ static int invoke_tx_handlers_late(struct ieee80211_tx_data *tx)
 		goto txh_done;
 	}
 
+	if (!ieee80211_hw_check(&tx->local->hw, HAS_RATE_CONTROL))
+		CALL_TXH(ieee80211_tx_h_rate_ctrl);
+
 	CALL_TXH(ieee80211_tx_h_michael_mic_add);
 	CALL_TXH(ieee80211_tx_h_sequence);
 	CALL_TXH(ieee80211_tx_h_fragment);
@@ -3369,15 +3370,21 @@ static bool ieee80211_amsdu_aggregate(struct ieee80211_sub_if_data *sdata,
  * Can be called while the sta lock is held. Anything that can cause packets to
  * be generated will cause deadlock!
  */
-static void ieee80211_xmit_fast_finish(struct ieee80211_sub_if_data *sdata,
-				       struct sta_info *sta, u8 pn_offs,
-				       struct ieee80211_key *key,
-				       struct sk_buff *skb)
+static ieee80211_tx_result
+ieee80211_xmit_fast_finish(struct ieee80211_sub_if_data *sdata,
+			   struct sta_info *sta, u8 pn_offs,
+			   struct ieee80211_key *key,
+			   struct ieee80211_tx_data *tx)
 {
+	struct sk_buff *skb = tx->skb;
 	struct ieee80211_tx_info *info = IEEE80211_SKB_CB(skb);
 	struct ieee80211_hdr *hdr = (void *)skb->data;
 	u8 tid = IEEE80211_NUM_TIDS;
 
+	if (!ieee80211_hw_check(&tx->local->hw, HAS_RATE_CONTROL))
+		if (ieee80211_tx_h_rate_ctrl(tx) != TX_CONTINUE)
+			return TX_DROP;
+
 	if (key)
 		info->control.hw_key = &key->conf;
 
@@ -3426,6 +3433,8 @@ static void ieee80211_xmit_fast_finish(struct ieee80211_sub_if_data *sdata,
 			break;
 		}
 	}
+
+	return TX_CONTINUE;
 }
 
 static bool ieee80211_xmit_fast(struct ieee80211_sub_if_data *sdata,
@@ -3529,24 +3538,17 @@ static bool ieee80211_xmit_fast(struct ieee80211_sub_if_data *sdata,
 	tx.sta = sta;
 	tx.key = fast_tx->key;
 
-	if (!ieee80211_hw_check(&local->hw, HAS_RATE_CONTROL)) {
-		tx.skb = skb;
-		r = ieee80211_tx_h_rate_ctrl(&tx);
-		skb = tx.skb;
-		tx.skb = NULL;
-
-		if (r != TX_CONTINUE) {
-			if (r != TX_QUEUED)
-				kfree_skb(skb);
-			return true;
-		}
-	}
-
 	if (ieee80211_queue_skb(local, sdata, sta, skb))
 		return true;
 
-	ieee80211_xmit_fast_finish(sdata, sta, fast_tx->pn_offs,
-				   fast_tx->key, skb);
+	tx.skb = skb;
+	r = ieee80211_xmit_fast_finish(sdata, sta, fast_tx->pn_offs,
+				       fast_tx->key, &tx);
+	tx.skb = NULL;
+	if (r == TX_DROP) {
+		kfree_skb(skb);
+		return true;
+	}
 
 	if (sdata->vif.type == NL80211_IFTYPE_AP_VLAN)
 		sdata = container_of(sdata->bss,
@@ -3663,8 +3665,12 @@ struct sk_buff *ieee80211_tx_dequeue(struct ieee80211_hw *hw,
 		    (tx.key->conf.flags & IEEE80211_KEY_FLAG_GENERATE_IV))
 			pn_offs = ieee80211_hdrlen(hdr->frame_control);
 
-		ieee80211_xmit_fast_finish(sta->sdata, sta, pn_offs,
-					   tx.key, skb);
+		r = ieee80211_xmit_fast_finish(sta->sdata, sta, pn_offs,
+					       tx.key, &tx);
+		if (r != TX_CONTINUE) {
+			ieee80211_free_txskb(&local->hw, skb);
+			goto begin;
+		}
 	} else {
 		if (invoke_tx_handlers_late(&tx))
 			goto begin;
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
