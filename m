Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EE40C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 May 2022 09:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=t0cyfEdOzG/UjQ9a1Xogc9cV67tLdUSyuywRKHELW2I=; b=WY+sFnq6SeONxG
	s6K3gyv2RUEhu3WeYRbA1bSbxK5T2AYyQXiwATH1gSvSQGVI7aRTdvdBEUO9nG+22I0Z+FHWoLCJM
	M4BbUwtC7JmLlIl5UcWGrQ/ypymdMzcHwrEMVVJIL/B3LXhlF0lgOMlCMQl4Ji7WIAYTJq6RAyTUj
	HQ31KliuujQ6pGGnqhKO8N+Mi7Vs2ScOH9r7wQEaqkq80BOJV/6DBZQseA2+LPCd1bS3Im/rBgZUr
	8B6xXBMey7+HxuDm5iZSfET1hn5vwUxV5TqrKWNxWhDFb1oxcfbFW74QVmuG4QxPdQn6lOmL8n8w4
	eNZ8M9jewTqzWiGsxQiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nu9eA-00ECLN-As; Thu, 26 May 2022 09:19:10 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nu9e6-00ECJp-UK
	for linux-mediatek@lists.infradead.org; Thu, 26 May 2022 09:19:08 +0000
X-UUID: 80800014c26e4669ba3b20e84736537b-20220526
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5,REQID:d830e4b4-ee0c-4ead-a0fc-28be6290cd55,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:2a19b09,CLOUDID:c74e9247-4fb1-496b-8f1d-39e733fed1ea,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:0,BEC:nil
X-UUID: 80800014c26e4669ba3b20e84736537b-20220526
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
	(envelope-from <ryder.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 194519693; Thu, 26 May 2022 02:18:59 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 26 May 2022 02:08:57 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 26 May 2022 17:08:55 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Thu, 26 May 2022 17:08:56 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: <linux-wireless@vger.kernel.org>
CC: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
	<lorenzo.bianconi@redhat.com>, Shayne Chen <shayne.chen@mediatek.com>,
	"Evelyn Tsai" <evelyn.tsai@mediatek.com>,
	<linux-mediatek@lists.infradead.org>, "Ryder Lee" <ryder.lee@mediatek.com>
Subject: [PATCH] mac80211: check skb_shared in ieee80211_8023_xmit()
Date: Thu, 26 May 2022 17:08:53 +0800
Message-ID: <1ef9b892cc93a36b1e62a6dda0e2e0a019f4e5f7.1653555361.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220526_021907_018897_B139C99A 
X-CRM114-Status: UNSURE (   9.92  )
X-CRM114-Notice: Please train this message.
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

Add missing skb_shared check into 802.3 path as 802.11 path does
to prevent potential use-after-free from happening.

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 net/mac80211/tx.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/net/mac80211/tx.c b/net/mac80211/tx.c
index 0e4efc08c762..b026e746ac5b 100644
--- a/net/mac80211/tx.c
+++ b/net/mac80211/tx.c
@@ -4437,7 +4437,7 @@ static void ieee80211_8023_xmit(struct ieee80211_sub_if_data *sdata,
 				struct net_device *dev, struct sta_info *sta,
 				struct ieee80211_key *key, struct sk_buff *skb)
 {
-	struct ieee80211_tx_info *info = IEEE80211_SKB_CB(skb);
+	struct ieee80211_tx_info *info;
 	struct ieee80211_local *local = sdata->local;
 	struct tid_ampdu_tx *tid_tx;
 	u8 tid;
@@ -4452,6 +4452,17 @@ static void ieee80211_8023_xmit(struct ieee80211_sub_if_data *sdata,
 	    test_bit(SDATA_STATE_OFFCHANNEL, &sdata->state))
 		goto out_free;
 
+	if (skb_shared(skb)) {
+		struct sk_buff *tmp_skb = skb;
+
+		skb = skb_clone(skb, GFP_ATOMIC);
+		kfree_skb(tmp_skb);
+
+		if (!skb)
+			return;
+	}
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
