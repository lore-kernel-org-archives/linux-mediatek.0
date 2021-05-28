Return-Path: <SRS0=JD7o=KX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07E68C4708C
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 May 2021 06:10:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C6D586135F
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 May 2021 06:09:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C6D586135F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+vcfV4tIiYiWaQZJrcGc437P9xg+vTuwtUgTF9/sAJA=; b=ZJh2o4B/FINiK4
	a29/WF6y6ZMsXKGH94xOLtd+FgWViqyxB9cyIDyEyo8cyFZfDBZFq5qzNfcu25umzY/Z7WuW2fnOo
	f8wuCNGPu2DUR2HxotN/Jjy4OmXHd+lXWzxBe5nvZtq4kAIjtM5vB2dF2CtLED9BCx8AF0j7/5+HU
	l3tojurVL/Jv4aMbGfABZdBGjQwiEhW8dU6a0CEcDjMnuCBZI7In1MM4TPlz4v/3lDdMzUplfWjnz
	jJETnj1xRlJK5evwCUdMWkFvQO5h1l80h0RaSeRcY3wS+yu7t9qc0MEZqyR3udlhYOJyG6nEe3KMI
	i3ot7YtSYMQos23DqW0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lmVgs-00CTN8-Ev; Fri, 28 May 2021 06:09:50 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lmVgp-00CTLr-NG
 for linux-mediatek@lists.infradead.org; Fri, 28 May 2021 06:09:48 +0000
X-UUID: ad56e6a95cd045f6ab26f22d5ff469d9-20210527
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=DGgAeHyhb42HxkqrehJVseAxkn2GK9qoE/xE6iNMLZU=; 
 b=P+WBlz4Flg1XsAS4asRwVi36d6iek6SiUvtEZYDdu6sOzI00IbyodLsloEt1S80Mhu7Z6SmLMv3TgxQiOAS1F8nofXVtZ6dLoCNOdiEIHqxqbmLPD9ED4S6gEe59rfh4Nqd5JwIPqST6pRaMoyLQIJJJa930Iv0OQ6gzgKpSqbA=;
X-UUID: ad56e6a95cd045f6ab26f22d5ff469d9-20210527
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 674702537; Thu, 27 May 2021 23:09:44 -0700
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 27 May 2021 23:09:43 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 28 May 2021 14:09:35 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 28 May 2021 14:09:35 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Johannes Berg <johannes.berg@intel.com>
CC: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Shayne Chen
 <shayne.chen@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>, Bo Jiao
 <bo.jiao@mediatek.com>, Sujuan Chen <sujuan.chen@mediatek.com>,
 <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 "Ryder Lee" <ryder.lee@mediatek.com>
Subject: [PATCH v2 2/4] mac80211: minstrel_ht: fix minstrel_aggr_check for
 encap offload
Date: Fri, 28 May 2021 14:05:42 +0800
Message-ID: <2b98f1d3f6fb9f2beb6d3458af3f0c25e863c191.1622164961.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <2176023d8f13d82d093452e1c105609396c30622.1622164961.git.ryder.lee@mediatek.com>
References: <2176023d8f13d82d093452e1c105609396c30622.1622164961.git.ryder.lee@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210527_230947_785464_1A7454BF 
X-CRM114-Status: GOOD (  10.53  )
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

Avoid checking ieee80211_hdr to support encap offload.

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
change since v2 - none
---
 net/mac80211/rc80211_minstrel_ht.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/net/mac80211/rc80211_minstrel_ht.c b/net/mac80211/rc80211_minstrel_ht.c
index 6487b05da6fa..55ff93c803ac 100644
--- a/net/mac80211/rc80211_minstrel_ht.c
+++ b/net/mac80211/rc80211_minstrel_ht.c
@@ -1179,19 +1179,24 @@ static void
 minstrel_aggr_check(struct ieee80211_sta *pubsta, struct sk_buff *skb)
 {
 	struct ieee80211_hdr *hdr = (struct ieee80211_hdr *) skb->data;
+	struct ieee80211_tx_info *info = IEEE80211_SKB_CB(skb);
 	struct sta_info *sta = container_of(pubsta, struct sta_info, sta);
 	u16 tid;
 
 	if (skb_get_queue_mapping(skb) == IEEE80211_AC_VO)
 		return;
 
-	if (unlikely(!ieee80211_is_data_qos(hdr->frame_control)))
+	if (unlikely(!pubsta->wme))
+		return;
+
+	if (!(info->flags & IEEE80211_TX_CTL_HW_80211_ENCAP) &&
+	    unlikely(!ieee80211_is_data_qos(hdr->frame_control)))
 		return;
 
 	if (unlikely(skb->protocol == cpu_to_be16(ETH_P_PAE)))
 		return;
 
-	tid = ieee80211_get_tid(hdr);
+	tid = skb->priority & IEEE80211_QOS_CTL_TID_MASK;
 	if (likely(sta->ampdu_mlme.tid_tx[tid]))
 		return;
 
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
