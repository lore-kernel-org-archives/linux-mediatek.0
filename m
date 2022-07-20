Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B6B4C43334
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Jul 2022 01:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fBPtijTijNhBRBq0kSXHXvxYQhJdnqcQxp2OCBGhHUU=; b=FM3H/EcP3MoilKpcNUTaDXOVYI
	Jq9UlwVhuYgXodGmRLF0mpAbZLtEVXdpcxjF1YmPUL+pstbWCBAA/jGsLOX43HYVocYtLCwWOLJ6O
	SFsrEI0TzxWD8Imng2FUP0wG/wM0guyEjc+XWLrTI9cjxO0x6dj8f6R/vhrJ36JyXBeIdvPj3fnP3
	Rqukl7/rBdVRtBUa+DI63XL+x9FreZ2CGw/sXYjmIgBVQOByX8YLYEbws8QXJ334BUjOBTqb62vue
	rK0UudgTi5EcnpwVqdCiUl/CuXHYNILaKEzl3G1hZAuXH1fkcM296oaoTOBSYG1uIO4m/vbiij0pL
	G5fVyTiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDyJX-00FTA2-1y; Wed, 20 Jul 2022 01:15:47 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDyJI-00FStu-Ii; Wed, 20 Jul 2022 01:15:34 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 230A3617B4;
	Wed, 20 Jul 2022 01:15:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F1BDC341CA;
	Wed, 20 Jul 2022 01:15:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658279731;
	bh=z7iBJy5Yjy8zO9n/ZqopUEeBf43/XBe9Ivswdo0nPyw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Q2g0ojDrqdhFo0BL0G/qBSBlH6cHkhc7yV675gb4JOF53fX8KELauC+toz8KKaBAL
	 TKT9aIy9zxam4MQoDETqjO7yQIR99GBHRquJ62CV/S8/HXti2SngzFGsFvJlb3nzBm
	 rro30V9WxOJSlR0i0KzcPTNo4wgMd4W+p/LMfF4Dd364RZu4NlWi5XXiOOtGNBGF0x
	 /Rvx7/8WSWtz7ALhWCwNAFibv469x/e6Wu1L277zd0d5Qbhe7R+8k+1nUDJRADkN0v
	 Zk1LE0eN5wefgYZRHkIyOpYfc2gpcVjeLsw+8F6CxzfCwtL/Ad2Jcmz/J9nX0jr55j
	 Yx47MrTVBsN4Q==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Ryder Lee <ryder.lee@mediatek.com>,
	Johannes Berg <johannes.berg@intel.com>,
	Sasha Levin <sashal@kernel.org>,
	johannes@sipsolutions.net,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	matthias.bgg@gmail.com,
	linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 5.15 23/42] wifi: mac80211: check skb_shared in ieee80211_8023_xmit()
Date: Tue, 19 Jul 2022 21:13:31 -0400
Message-Id: <20220720011350.1024134-23-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220720011350.1024134-1-sashal@kernel.org>
References: <20220720011350.1024134-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220719_181532_731410_5F6A50E7 
X-CRM114-Status: GOOD (  14.94  )
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

From: Ryder Lee <ryder.lee@mediatek.com>

[ Upstream commit a4926abb787e2ef3ee2997e6ca8844d859478647 ]

Add a missing skb_shared check into 802.3 path to prevent potential
use-after-free from happening. This also uses skb_share_check()
instead of open-coding in tx path.

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
Link: https://lore.kernel.org/r/e7a73aaf7742b17e43421c56625646dfc5c4d2cb.1653571902.git.ryder.lee@mediatek.com
Signed-off-by: Johannes Berg <johannes.berg@intel.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 net/mac80211/tx.c | 36 +++++++++++++-----------------------
 1 file changed, 13 insertions(+), 23 deletions(-)

diff --git a/net/mac80211/tx.c b/net/mac80211/tx.c
index a499b07fee33..717698ff5a37 100644
--- a/net/mac80211/tx.c
+++ b/net/mac80211/tx.c
@@ -2817,19 +2817,10 @@ static struct sk_buff *ieee80211_build_hdr(struct ieee80211_sub_if_data *sdata,
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
@@ -3540,15 +3531,9 @@ static bool ieee80211_xmit_fast(struct ieee80211_sub_if_data *sdata,
 
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
@@ -4438,7 +4423,7 @@ static void ieee80211_8023_xmit(struct ieee80211_sub_if_data *sdata,
 				struct net_device *dev, struct sta_info *sta,
 				struct ieee80211_key *key, struct sk_buff *skb)
 {
-	struct ieee80211_tx_info *info = IEEE80211_SKB_CB(skb);
+	struct ieee80211_tx_info *info;
 	struct ieee80211_local *local = sdata->local;
 	struct tid_ampdu_tx *tid_tx;
 	u8 tid;
@@ -4453,6 +4438,11 @@ static void ieee80211_8023_xmit(struct ieee80211_sub_if_data *sdata,
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
2.35.1


