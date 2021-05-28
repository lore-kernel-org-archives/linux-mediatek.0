Return-Path: <SRS0=JD7o=KX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	UNWANTED_LANGUAGE_BODY,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBC6EC4708C
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 May 2021 06:09:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8D05D613D1
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 May 2021 06:09:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8D05D613D1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dXw4wbE5L4y3YXdYE/7tutzqcS8M8tIosIaaUKHE4j0=; b=SAwFlv+Cl70jMF
	CTdAwdBTyQ8R0FVLQMNAIaKRUsUG3SFahI6jpAaYbg7gjIqzqJzJOK6IrUzOWov+DTAEA17cg0N7i
	UC1nxAFSK2H7rYs/qHIAUyDK7YbfA/As7bz0dYXGl86ftoouuIgh3zs38gcVmUkO465xyRVmP0E9P
	1Xk4ldj7JlJxP5oN/y5qi/SCaSub9DR3qTEnpbcAz6/BjzIvOC6IH3uzHV6FweIy/+o/3rnYzEjl7
	QKd75YmHMIvCKrsKdh4VYtUVlmu1xr3cpPgp/qNNiQ3ohHd/+ARvfNVx1B3YXFQijmsLViaUTOiQe
	xRe9pSoA14B0SMiQBKVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lmVgl-00CTK5-Hx; Fri, 28 May 2021 06:09:43 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lmVgh-00CTHz-5D
 for linux-mediatek@lists.infradead.org; Fri, 28 May 2021 06:09:42 +0000
X-UUID: ea27c8e4223e4b85a7c1a4045ac70fbc-20210527
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=fUR7YMsf9bRnubEFEMkV9o3Tw3T7U4Qgtl0clv4ZGlk=; 
 b=Mk9GYMooWVcBt3e1vpuufkeYLkAnasl6dZeEVKavtt8FuEBvnfSqs2XOETB2Zdw4bz3SMCUewz+0DnLXGM5WNeS6OKFA48hnX7+HtBqbUaBV4by08QiTnRNlXppTRswF65Gg3jUSpeI6L23sWv1Qg03IV94JIud7HJj+WEFwfF8=;
X-UUID: ea27c8e4223e4b85a7c1a4045ac70fbc-20210527
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 731502008; Thu, 27 May 2021 23:09:37 -0700
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 27 May 2021 23:09:36 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 28 May 2021 14:09:34 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 28 May 2021 14:09:34 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Johannes Berg <johannes.berg@intel.com>
CC: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Shayne Chen
 <shayne.chen@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>, Bo Jiao
 <bo.jiao@mediatek.com>, Sujuan Chen <sujuan.chen@mediatek.com>,
 <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 "Ryder Lee" <ryder.lee@mediatek.com>
Subject: [PATCH v2 1/4] mac80211: call ieee80211_tx_h_rate_ctrl() when dequeue
Date: Fri, 28 May 2021 14:05:41 +0800
Message-ID: <2176023d8f13d82d093452e1c105609396c30622.1622164961.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210527_230939_575502_AC611FCF 
X-CRM114-Status: GOOD (  13.25  )
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
change since v2 - roll ieee80211_tx_h_rate_ctrl checks into one condition
---
 net/mac80211/tx.c | 52 ++++++++++++++++++++++++++---------------------
 1 file changed, 29 insertions(+), 23 deletions(-)

diff --git a/net/mac80211/tx.c b/net/mac80211/tx.c
index 0b719f3d2dec..d3016c3a3069 100644
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
 
+	if (!ieee80211_hw_check(&tx->local->hw, HAS_RATE_CONTROL) &&
+	    ieee80211_tx_h_rate_ctrl(tx) != TX_CONTINUE)
+		return TX_DROP;
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
