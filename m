Return-Path: <SRS0=zq7C=LL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0330C48BE5
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Jun 2021 18:53:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6EBED60C3D
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Jun 2021 18:53:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6EBED60C3D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sMp++4lhxznjYaru7ws+YN+xnH/dzNLf+cfxm6lxMic=; b=AAhgqECICtzbJ1
	Sk9HsD8+tQqLEVJidkIg7IFjyBCijwCg9ciGMSFvoGccnPp/EGlZNNuz5ud5K6V49FOb/vMtHeMTy
	5SRkMpc8Gm+nem42RZnDyQznaFrnMgJRdQ7V/Gta+9PpU4fJ6RHrrrq9zIC4yMNN/qGWKVArEdlgS
	lLaPliLj/7Qj5dRPjrzM9CKRTrpstDr/WZjSGqxr8i4Jvsq+WnEBKYGgXZZE+ezRmVNA5+iX2fDcK
	gNPQSAAbUDgrsEUG80AJLuONWtZloIm+qVKyJRKbkh4LVcAgQgb/5XeGabUYeIoyqaQRguL6tR2nY
	rWmneYldY2q8y4M+ga7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltx8g-00BRgu-8U; Thu, 17 Jun 2021 18:53:18 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltx8b-00BRft-HI
 for linux-mediatek@lists.infradead.org; Thu, 17 Jun 2021 18:53:16 +0000
X-UUID: f7d34d095fe64e3daa03431566719539-20210617
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=/mlxP4ImfdSGnOolb3WV5t/kpKp+nCeKoUMoTb2+juw=; 
 b=FtvZf5gcIh5nqmPZAhdleuoZ1L4pqCjBbN4dMSuhlNUTW+JS4O2kgiIovZcMwLssAOd4Eoa1eSaoca5KiAXR/u3ag/t/xkOpPKs2IHYWUCUlZ1dx+bLcttQTL9m2pgSVCDwiD6usAw6TX2rpbahq4eKVb4c7kew/OB6+9w3sjIk=;
X-UUID: f7d34d095fe64e3daa03431566719539-20210617
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1818839244; Thu, 17 Jun 2021 11:53:09 -0700
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 17 Jun 2021 11:53:08 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 18 Jun 2021 02:53:06 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 18 Jun 2021 02:53:06 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Shayne Chen
 <shayne.chen@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>,
 <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 "Ryder Lee" <ryder.lee@mediatek.com>
Subject: [PATCH 1/4] mac80211: check per vif offload_flags in Tx path
Date: Fri, 18 Jun 2021 02:53:02 +0800
Message-ID: <4718d8041f908cb3249ec68c59a6854919f00752.1623955182.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210617_115315_039619_A0725EC8 
X-CRM114-Status: GOOD (  10.08  )
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

offload_flags has been introduced to indicate encap status of each interface.
An interface can encap offload at runtime, or if it has some extra limitations
it can simply override the flags, so it's more flexible to check offload_flags
in Tx path.

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 net/mac80211/tx.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/net/mac80211/tx.c b/net/mac80211/tx.c
index 0a4bc9e08637..8cb1289c704a 100644
--- a/net/mac80211/tx.c
+++ b/net/mac80211/tx.c
@@ -3267,6 +3267,9 @@ static bool ieee80211_amsdu_aggregate(struct ieee80211_sub_if_data *sdata,
 	if (!ieee80211_hw_check(&local->hw, TX_AMSDU))
 		return false;
 
+	if (sdata->vif.offload_flags & IEEE80211_OFFLOAD_ENCAP_ENABLED)
+		return false;
+
 	if (skb_is_gso(skb))
 		return false;
 
@@ -3695,7 +3698,8 @@ struct sk_buff *ieee80211_tx_dequeue(struct ieee80211_hw *hw,
 	}
 
 	if (skb_has_frag_list(skb) &&
-	    !ieee80211_hw_check(&local->hw, TX_FRAG_LIST)) {
+	    (!ieee80211_hw_check(&local->hw, TX_FRAG_LIST) ||
+	     vif->offload_flags & IEEE80211_OFFLOAD_ENCAP_ENABLED)) {
 		if (skb_linearize(skb)) {
 			ieee80211_free_txskb(&local->hw, skb);
 			goto begin;
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
