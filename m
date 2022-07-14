Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20F74C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Jul 2022 09:57:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ladbonBGOhrN4wvVvtFY3jJbJmlF2sAitpXebD2y1zw=; b=L0AJukqxQJAo3wBcp6FKj9uLW/
	FonehBk/VjAZnTuki3HhufOkkqQ6Zs3VFEqlfapDkPYHp2GYBts5mEHiB9wO3snpEpm6ZHHbLjgrp
	hWds+E4kLaezEUAZrH4WMIXfgrremz6ZCR2GBseTP0aqawOhbsKocMdsa6xaaz5CkyrFj9qSxZOwn
	H80nYGxg5rUG94XNB1h7ty7HrZYgoQYVju1fFD/3gDHjefLTgYVTWN+prebo49GZNTJZTLqKoaD3a
	K6ZrVvpeWeXetLNEv5qPNmM29zdXzuJThOfnE3RwiFb8AWgV/5tyARrhJhv1zka0uZRApxqz84bSC
	c7hn+WEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBvbJ-00D72P-Tk; Thu, 14 Jul 2022 09:57:41 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBvb1-00D6og-0O
	for linux-mediatek@lists.infradead.org; Thu, 14 Jul 2022 09:57:24 +0000
X-UUID: b8c82780736143b8a20875270930bff2-20220714
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:60cef2d8-3921-453d-b6b7-88d4d7620406,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:0f94e32,CLOUDID:15a0fa32-b9e4-42b8-b28a-6364427c76bb,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: b8c82780736143b8a20875270930bff2-20220714
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <lian.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1983641472; Thu, 14 Jul 2022 02:57:16 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Thu, 14 Jul 2022 17:16:39 +0800
Received: from mcddlt001.gcn.mediatek.inc (10.19.240.15) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Thu, 14 Jul 2022 17:16:38 +0800
From: Lian Chen <lian.chen@mediatek.com>
To: Johannes Berg <johannes@sipsolutions.net>, Felix Fietkau <nbd@nbd.name>
CC: Bo Jiao <bo.jiao@mediatek.com>, Sujuan Chen <sujuan.chen@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>, Ryder Lee <ryder.lee@mediatek.com>,
	Evelyn Tsai <evelyn.tsai@mediatek.com>, <linux-wireless@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, Lian Chen <lian.chen@mediatek.com>
Subject: [PATCH] wifi: mac80211: make 4addr null frames using min_rate for WDS
Date: Thu, 14 Jul 2022 17:16:36 +0800
Message-ID: <20220714091636.59107-1-lian.chen@mediatek.com>
X-Mailer: git-send-email 2.17.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220714_025723_088325_810CA257 
X-CRM114-Status: UNSURE (   7.49  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

WDS needs 4addr packets to trigger AP for wlan0.sta creation.
However, the 4addr null frame is sent at a high rate
so that AP can't receive it.
This PATCHES switches to use min_rate.

Signed-off-by: Lian Chen <lian.chen@mediatek.com>
---
 net/mac80211/mlme.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/net/mac80211/mlme.c b/net/mac80211/mlme.c
index c833245..09f54be 100644
--- a/net/mac80211/mlme.c
+++ b/net/mac80211/mlme.c
@@ -1133,6 +1133,7 @@ void ieee80211_send_4addr_nullfunc(struct ieee80211_local *local,
 	memcpy(nullfunc->addr4, sdata->vif.addr, ETH_ALEN);
 
 	IEEE80211_SKB_CB(skb)->flags |= IEEE80211_TX_INTFL_DONT_ENCRYPT;
+	IEEE80211_SKB_CB(skb)->flags |= IEEE80211_TX_CTL_USE_MINRATE;
 	ieee80211_tx_skb(sdata, skb);
 }
 
-- 
2.18.0


