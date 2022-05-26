Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51D50C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 May 2022 13:35:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0qweVt4rAa/shUVkksYFulU5rCk2bZo2wL5GgMhCdqo=; b=VKYSDeATJpalot
	dZY0d2Mtw8PYArQFyVgEMm4iDsXEn3GGiGwyR5p2TpWvyUte4t9PpEJ3fNUrgdtqYCs6XWZqyGbAQ
	AH/7Jgb4dlJ4z5LHVODZWXG/RX2mGiM3adywoqZO+lSWKyHCjOexzKGwHLY6e1AcUQl9l1l81wvrz
	pTfP6R9ypAca8qs++ouEg3wXvFSYKg1jT1dKsfy64ccbl9nQ/K+gjV4BCrwzDoTQm7aNFyCOmecpI
	755/vAH76XE9ZNVNs5plteyaDQXYWS2rJAf6D7iMbGbSYoHcEe3fYFerO0UBLUGAwmOekzNXfZ1bS
	tT5gcxwzOmb9b4yVAF9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nuDeT-00F2f2-QV; Thu, 26 May 2022 13:35:45 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nuDeR-00F2eY-Iy
	for linux-mediatek@lists.infradead.org; Thu, 26 May 2022 13:35:45 +0000
X-UUID: 2e2b24e439c74ac792879d758aaebecd-20220526
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5,REQID:0925ec76-62b7-4b7c-9dac-cf58af4abad9,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:2a19b09,CLOUDID:f5b99847-4fb1-496b-8f1d-39e733fed1ea,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:0,BEC:nil
X-UUID: 2e2b24e439c74ac792879d758aaebecd-20220526
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
	(envelope-from <ryder.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 1483376012; Thu, 26 May 2022 06:35:35 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 26 May 2022 06:35:33 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Thu, 26 May 2022 21:35:32 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Thu, 26 May 2022 21:35:32 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: <linux-wireless@vger.kernel.org>
CC: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
	<lorenzo.bianconi@redhat.com>, Shayne Chen <shayne.chen@mediatek.com>,
	"Evelyn Tsai" <evelyn.tsai@mediatek.com>,
	<linux-mediatek@lists.infradead.org>, "Ryder Lee" <ryder.lee@mediatek.com>
Subject: [PATCH v2] mac80211: check skb_shared in ieee80211_8023_xmit()
Date: Thu, 26 May 2022 21:35:32 +0800
Message-ID: <e7a73aaf7742b17e43421c56625646dfc5c4d2cb.1653571902.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220526_063543_671985_7AAEBB19 
X-CRM114-Status: GOOD (  13.28  )
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

Add a missing skb_shared check into 802.3 path to prevent potential
use-after-free from happening. This also uses skb_share_check()
instead of open-coding in tx path.

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
change since v2 - switch to use skb_share_check()
---
 net/mac80211/tx.c | 36 +++++++++++++-----------------------
 1 file changed, 13 insertions(+), 23 deletions(-)

diff --git a/net/mac80211/tx.c b/net/mac80211/tx.c
index 0e4efc08c762..c425f4fb7c2e 100644
--- a/net/mac80211/tx.c
+++ b/net/mac80211/tx.c
@@ -2818,19 +2818,10 @@ static struct sk_buff *ieee80211_build_hdr(struct ieee80211_sub_if_data *sdata,
 	/*
 	 * If the skb is shared we need to obtain our own copy.
 	 */
-	if (skb_shared(skb)) {
-		struct sk_buff *tmp_skb = skb;
-
-		/* can't happen -- skb is a clone if info_id != 0 */
-		WARN_ON(info_id);
-
-		skb = skb_clone(skb, GFP_ATOMIC);
-		kfree_skb(tmp_skb);
-
-		if (!skb) {
-			ret = -ENOMEM;
-			goto free;
-		}
+	skb = skb_share_check(skb, GFP_ATOMIC);
+	if (unlikely(!skb)) {
+		ret = -ENOMEM;
+		goto free;
 	}
 
 	hdr.frame_control = fc;
@@ -3539,15 +3530,9 @@ static bool ieee80211_xmit_fast(struct ieee80211_sub_if_data *sdata,
 
 	/* after this point (skb is modified) we cannot return false */
 
-	if (skb_shared(skb)) {
-		struct sk_buff *tmp_skb = skb;
-
-		skb = skb_clone(skb, GFP_ATOMIC);
-		kfree_skb(tmp_skb);
-
-		if (!skb)
-			return true;
-	}
+	skb = skb_share_check(skb, GFP_ATOMIC);
+	if (unlikely(!skb))
+		return true;
 
 	if ((hdr->frame_control & cpu_to_le16(IEEE80211_STYPE_QOS_DATA)) &&
 	    ieee80211_amsdu_aggregate(sdata, sta, fast_tx, skb))
@@ -4437,7 +4422,7 @@ static void ieee80211_8023_xmit(struct ieee80211_sub_if_data *sdata,
 				struct net_device *dev, struct sta_info *sta,
 				struct ieee80211_key *key, struct sk_buff *skb)
 {
-	struct ieee80211_tx_info *info = IEEE80211_SKB_CB(skb);
+	struct ieee80211_tx_info *info;
 	struct ieee80211_local *local = sdata->local;
 	struct tid_ampdu_tx *tid_tx;
 	u8 tid;
@@ -4452,6 +4437,11 @@ static void ieee80211_8023_xmit(struct ieee80211_sub_if_data *sdata,
 	    test_bit(SDATA_STATE_OFFCHANNEL, &sdata->state))
 		goto out_free;
 
+	skb = skb_share_check(skb, GFP_ATOMIC);
+	if (unlikely(!skb))
+		return;
+
+	info = IEEE80211_SKB_CB(skb);
 	memset(info, 0, sizeof(*info));
 
 	ieee80211_aggr_check(sdata, sta, skb);
-- 
2.29.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
