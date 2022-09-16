Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6B2DECAAA1
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Sep 2022 14:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nb9JBq33ZCRn28wiFAPm6CoQ09k2CT8DYFJ015psmGk=; b=m+xNVEAAEFUPKcFSnCB2iHx+ar
	b2VEhJp1cTQH7bTa6nmbp4LdVUYKKG6Q1Zrq1uES3+4hAKaLbsAon8ioDst0+qS+/cci3q/4/XI7/
	a5Zz9+ihvU3peSvZNcryZRIhh05V+HMotLppQUK9c4hhlJA4oPF4SwokxhH9tIU0yp0vt0ogs1qkI
	yce5Cu4E31TP5QA7yDRSCng1O4EZ3xpmhrAKy/2xlVvpusgFvjFG/5Pqm1xpv50rB7j7vA/gb4hly
	4TjbwOrfuWs5ZIfZ91/O7W302jWmZZuqGX5fZhrJbxRE8yRzV5koNF56jbbpNe29F83sP0WI/ne4O
	DQWVHmnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZCnA-00EOoH-RZ; Fri, 16 Sep 2022 14:58:08 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZCn8-00EOjr-5s
	for linux-mediatek@lists.infradead.org; Fri, 16 Sep 2022 14:58:07 +0000
X-UUID: ab5a964d98284cddb14862893072e75b-20220916
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=nb9JBq33ZCRn28wiFAPm6CoQ09k2CT8DYFJ015psmGk=;
	b=B2ItNpGmjmp/QTLMoUgWWTXBg/5yNIbanKGeHORHFqiDj/UIpHILTY09TlZJu6S7LEfwXqSg3XsSrQIWHETQNWHIOhjbVSrXILo9NIJcemInN9RuFBzH5c5on8d1C9mn9bIZso+21FvdlYaBf0ascpNTTeQe3H8wG9xbukvOZgU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:e657eb2f-702b-421d-976f-86d2b9195a15,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:39a5ff1,CLOUDID:ef6c7f8a-35ad-4537-90e7-b56a69d5f8a4,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: ab5a964d98284cddb14862893072e75b-20220916
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <howard-yh.hsu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1604260904; Fri, 16 Sep 2022 07:57:54 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 16 Sep 2022 22:17:16 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Fri, 16 Sep 2022 22:17:16 +0800
From: Howard Hsu <howard-yh.hsu@mediatek.com>
To: Johannes Berg <johannes@sipsolutions.net>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Felix Fietkau
	<nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>, Ryder Lee
	<ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Howard Hsu <howard-yh.hsu@mediatek.com>
Subject: [PATCH] wifi: mac80211: Align with Draft P802.11be_D1.5
Date: Fri, 16 Sep 2022 22:17:00 +0800
Message-ID: <20220916141700.28378-1-howard-yh.hsu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220916_075806_277847_856E9B0B 
X-CRM114-Status: UNSURE (   9.77  )
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

Fix ieee80211_prep_channel to aligh with Draft P80211.be_D1.5. It shall
shift 4 byte to fetch EHT Operation information.

Signed-off-by: Howard Hsu <howard-yh.hsu@mediatek.com>
---
 net/mac80211/mlme.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/mac80211/mlme.c b/net/mac80211/mlme.c
index ff449e0c2e62..9bb085eab12a 100644
--- a/net/mac80211/mlme.c
+++ b/net/mac80211/mlme.c
@@ -4735,7 +4735,7 @@ static int ieee80211_prep_channel(struct ieee80211_sub_if_data *sdata,
 						   cbss_ies->data, cbss_ies->len);
 		if (eht_oper_ie && eht_oper_ie[1] >=
 		    1 + sizeof(struct ieee80211_eht_operation))
-			eht_oper = (void *)(eht_oper_ie + 3);
+			eht_oper = (void *)(eht_oper_ie + 4);
 		else
 			eht_oper = NULL;
 	}
-- 
2.18.0


