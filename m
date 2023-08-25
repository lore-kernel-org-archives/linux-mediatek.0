Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9350EC6787B
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Aug 2023 17:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0VVH//pGmVRKMA5Gdd+iwu1PDBmKKjfZrzLiMf175fA=; b=qk2SMiMQfDfxNp0dmJf1CLRXDL
	ZkR5jgVGi+L3wKLJi1KYcT1TrIG3mypucZXfAqsvan/wfW5Kfqu2F8ZE41wdcSXZ/l+PAqJiRmE1o
	1YShIQmrgJVupjTNu0fLwKHaW0EmadEWP/SYSCQCTFzrb4UijolGKpGOl7VDNteWho45TwKkyd8fY
	WEyyWAiG4KPBICDloxcfzlFH8d3bibNPaae5DVXuNDPmSWG4833qNfRrzH/C5EeELZ5gbKKRyVlWh
	8sbux3+XqBTll/stDvDar6AkMeiKsp616+/jDwz3tIJi45V7iybkNOB/IbHwpnCqSuoYyKjsLGYLw
	t1nXyybw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZaum-005ob8-1o;
	Fri, 25 Aug 2023 17:48:08 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZauj-005oaV-2S
	for linux-mediatek@lists.infradead.org;
	Fri, 25 Aug 2023 17:48:07 +0000
X-UUID: 8a78f780436f11ee912e1518a6540028-20230825
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=0VVH//pGmVRKMA5Gdd+iwu1PDBmKKjfZrzLiMf175fA=;
	b=RWGTGcJmhV0THTr0FmTSowAL6f74pjqV7NA00WoCwyIS5QokMEfUuR5T1/clCxt1G2L3gUVMoeMU0wMEqMHVH4ivaSep5DKzgajy3gIQdkAnty8iQcdZPVJXWqZpB531WwILyjR+UBCiN+tP5LtL1k4gUeTyujgg1+n4SJ/HG2A=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31,REQID:91972248-9382-4303-857d-956ef1c3c491,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:100
X-CID-INFO: VERSION:1.1.31,REQID:91972248-9382-4303-857d-956ef1c3c491,IP:0,URL
	:0,TC:0,Content:0,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTIO
	N:quarantine,TS:100
X-CID-META: VersionHash:0ad78a4,CLOUDID:25d6c11f-33fd-4aaa-bb43-d3fd68d9d5ae,B
	ulkID:23082601472963LQX1KA,BulkQuantity:6,Recheck:0,SF:29|28|17|19|48|38,T
	C:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:40,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_FSD,TF_CID_SPAM_SNR,TF_CID_SPAM_SDM,TF_CID_SPAM_ASC,
	TF_CID_SPAM_FAS
X-UUID: 8a78f780436f11ee912e1518a6540028-20230825
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <yi-chia.hsieh@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1341012582; Fri, 25 Aug 2023 10:48:03 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Sat, 26 Aug 2023 01:47:27 +0800
Received: from mussdccf250.mussds.eus.mediatek.inc (10.73.250.250) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Sat, 26 Aug 2023 01:47:25 +0800
From: Yi-Chia Hsieh <yi-chia.hsieh@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Johannes Berg <johannes.berg@intel.com>
CC: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Ryder Lee
	<ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, Money Wang <money.wang@mediatek.com>, Peter Chiu
	<chui-hao.chiu@mediatek.com>, Benjamin Lin <benjamin-jw.lin@mediatek.com>,
	<linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	Yi-Chia Hsieh <yi-chia.hsieh@mediatek.com>
Subject: [PATCH 5/6] mac80211: export ieee80211_tpt_led_trig_tx/rx for driver
Date: Fri, 25 Aug 2023 10:47:07 -0700
Message-ID: <57cbeffc86f0cd03374feb061436771f16e5a225.1692924589.git.yi-chia.hsieh@mediatek.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <09f0cb7f314a08eddb77298411d965ad30a847bb.1692924589.git.yi-chia.hsieh@mediatek.com>
References: <09f0cb7f314a08eddb77298411d965ad30a847bb.1692924589.git.yi-chia.hsieh@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230825_104805_807335_35FC2FD7 
X-CRM114-Status: GOOD (  13.08  )
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

Whenever the H/W path is enabled and traffic is in the binding state,
mac80211 is not aware of the traffic. Consequently, the LED does not
blink for that reason.

The ieee80211_tpt_led_trig_tx/rx functions are exported for the driver
so that we can report the tx and rx bytes from the driver when
the H/W path is being used.

Signed-off-by: Yi-Chia Hsieh <yi-chia.hsieh@mediatek.com>
---
 include/net/mac80211.h | 17 +++++++++++++++++
 net/mac80211/led.c     | 18 ++++++++++++++++++
 net/mac80211/led.h     | 18 ------------------
 net/mac80211/rx.c      |  2 +-
 net/mac80211/tx.c      |  4 ++--
 5 files changed, 38 insertions(+), 21 deletions(-)

diff --git a/include/net/mac80211.h b/include/net/mac80211.h
index 3a8a2d2c58c3..53804822dc8d 100644
--- a/include/net/mac80211.h
+++ b/include/net/mac80211.h
@@ -4729,6 +4729,8 @@ __ieee80211_create_tpt_led_trigger(struct ieee80211_hw *hw,
 				   unsigned int flags,
 				   const struct ieee80211_tpt_blink *blink_table,
 				   unsigned int blink_table_len);
+void __ieee80211_tpt_led_trig_tx(struct ieee80211_hw *hw, int bytes);
+void __ieee80211_tpt_led_trig_rx(struct ieee80211_hw *hw, int bytes);
 #endif
 /**
  * ieee80211_get_tx_led_name - get name of TX LED
@@ -4839,6 +4841,21 @@ ieee80211_create_tpt_led_trigger(struct ieee80211_hw *hw, unsigned int flags,
 #endif
 }
 
+static inline void
+ieee80211_tpt_led_trig_tx(struct ieee80211_hw *hw, int bytes)
+{
+#ifdef CPTCFG_MAC80211_LEDS
+	__ieee80211_tpt_led_trig_tx(hw, bytes);
+#endif
+}
+
+static inline void
+ieee80211_tpt_led_trig_rx(struct ieee80211_hw *hw, int bytes)
+{
+#ifdef CPTCFG_MAC80211_LEDS
+	__ieee80211_tpt_led_trig_rx(hw, bytes);
+#endif
+}
 /**
  * ieee80211_unregister_hw - Unregister a hardware device
  *
diff --git a/net/mac80211/led.c b/net/mac80211/led.c
index 2dc732147e85..af03a2ef5c6a 100644
--- a/net/mac80211/led.c
+++ b/net/mac80211/led.c
@@ -319,6 +319,24 @@ __ieee80211_create_tpt_led_trigger(struct ieee80211_hw *hw,
 }
 EXPORT_SYMBOL(__ieee80211_create_tpt_led_trigger);
 
+void __ieee80211_tpt_led_trig_tx(struct ieee80211_hw *hw, int bytes)
+{
+	struct ieee80211_local *local = hw_to_local(hw);
+
+	if (atomic_read(&local->tpt_led_active))
+		local->tpt_led_trigger->tx_bytes += bytes;
+}
+EXPORT_SYMBOL(__ieee80211_tpt_led_trig_tx);
+
+void __ieee80211_tpt_led_trig_rx(struct ieee80211_hw *hw, int bytes)
+{
+	struct ieee80211_local *local = hw_to_local(hw);
+
+	if (atomic_read(&local->tpt_led_active))
+		local->tpt_led_trigger->rx_bytes += bytes;
+}
+EXPORT_SYMBOL(__ieee80211_tpt_led_trig_rx);
+
 static void ieee80211_start_tpt_led_trig(struct ieee80211_local *local)
 {
 	struct tpt_led_trigger *tpt_trig = local->tpt_led_trigger;
diff --git a/net/mac80211/led.h b/net/mac80211/led.h
index d25f13346b82..98db4356d0de 100644
--- a/net/mac80211/led.h
+++ b/net/mac80211/led.h
@@ -66,21 +66,3 @@ static inline void ieee80211_mod_tpt_led_trig(struct ieee80211_local *local,
 {
 }
 #endif
-
-static inline void
-ieee80211_tpt_led_trig_tx(struct ieee80211_local *local, int bytes)
-{
-#ifdef CONFIG_MAC80211_LEDS
-	if (atomic_read(&local->tpt_led_active))
-		local->tpt_led_trigger->tx_bytes += bytes;
-#endif
-}
-
-static inline void
-ieee80211_tpt_led_trig_rx(struct ieee80211_local *local, int bytes)
-{
-#ifdef CONFIG_MAC80211_LEDS
-	if (atomic_read(&local->tpt_led_active))
-		local->tpt_led_trigger->rx_bytes += bytes;
-#endif
-}
diff --git a/net/mac80211/rx.c b/net/mac80211/rx.c
index 4f707d2a160f..5747d7dac4d7 100644
--- a/net/mac80211/rx.c
+++ b/net/mac80211/rx.c
@@ -5375,7 +5375,7 @@ void ieee80211_rx_list(struct ieee80211_hw *hw, struct ieee80211_sta *pubsta,
 	if (skb) {
 		if ((status->flag & RX_FLAG_8023) ||
 			ieee80211_is_data_present(hdr->frame_control))
-			ieee80211_tpt_led_trig_rx(local, skb->len);
+			ieee80211_tpt_led_trig_rx(&local->hw, skb->len);
 
 		if (status->flag & RX_FLAG_8023)
 			__ieee80211_rx_handle_8023(hw, pubsta, skb, list);
diff --git a/net/mac80211/tx.c b/net/mac80211/tx.c
index 7fe7280e8437..234de8d3b8bb 100644
--- a/net/mac80211/tx.c
+++ b/net/mac80211/tx.c
@@ -4320,7 +4320,7 @@ void __ieee80211_subif_start_xmit(struct sk_buff *skb,
 	len = 0;
  out:
 	if (len)
-		ieee80211_tpt_led_trig_tx(local, len);
+		ieee80211_tpt_led_trig_tx(&local->hw, len);
 	rcu_read_unlock();
 }
 
@@ -4646,7 +4646,7 @@ static void ieee80211_8023_xmit(struct ieee80211_sub_if_data *sdata,
 	sta->deflink.tx_stats.packets[queue] += skbs;
 	sta->deflink.tx_stats.bytes[queue] += len;
 
-	ieee80211_tpt_led_trig_tx(local, len);
+	ieee80211_tpt_led_trig_tx(&local->hw, len);
 
 	ieee80211_tx_8023(sdata, skb, sta, false);
 
-- 
2.39.0


