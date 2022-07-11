Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E346C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Jul 2022 14:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=d+Uj93nsGUepCzpFqgkcYdsDMX1N0qnOX/HtdGId/I4=; b=Khfr69HbubCPVBKcWJbxHLfiDJ
	+fMjH1RNDFBMsG/8a3rqQUU6amMSe7Jr91KYNEogQcH38hy+vU+p1o7hof7dpHOqsBP4APvXQxNzo
	XH/4Ae5bj2hcTggbY5wL3u2O0G5IcsY9U60rmH0+WUIQKWwRmmb4cPrBXBrfdhHeEOoFH4GX5bzFb
	LdxXp1J/US0jpnGnjidJB8x9yxT07jHlsQWQ8yDiE1FsmRpg6N+3UzqAlcdFTkUeN/S38LRHb31S0
	d3XFacEHMDU5fEckoqkEw7NZuOdyhmCPIOa7Xg4bbOBkc+a7xT3LEiQXtK0zDWad0Gm9cQlRyW4tS
	W/6UFrbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oAuQJ-002KHK-Cl; Mon, 11 Jul 2022 14:30:07 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oAuQG-002KEy-UY
	for linux-mediatek@lists.infradead.org; Mon, 11 Jul 2022 14:30:06 +0000
X-UUID: c4c6ec98e08142cb853a54f3079081e1-20220711
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:e21f048e-f898-4901-90c0-7625a15f77fd,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:0f94e32,CLOUDID:6418fa63-0b3f-4b2c-b3a6-ed5c044366a0,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: c4c6ec98e08142cb853a54f3079081e1-20220711
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <shayne.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 287891527; Mon, 11 Jul 2022 07:29:57 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Mon, 11 Jul 2022 22:19:23 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Mon, 11 Jul 2022 22:19:23 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
	<lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Shayne Chen <shayne.chen@mediatek.com>
Subject: [PATCH] mt76: testmode: use random payload for tx packets
Date: Mon, 11 Jul 2022 22:19:10 +0800
Message-ID: <20220711141910.17573-1-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220711_073005_008331_C65B5A83 
X-CRM114-Status: UNSURE (   9.68  )
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

Compared to fixed payload packets, random payload packets have better
measured EVM under the same txpower. Our tests show EVM becomes at least
2-3 dB better in test cases with high rate and long tx length, which also
aligns the testing results to proprietary driver.

Suggested-by: Jm Chen <jm.chen@mediatek.com>
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/testmode.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/testmode.c b/drivers/net/wireless/mediatek/mt76/testmode.c
index 47ac0ca1af32..fedc7a61ca37 100644
--- a/drivers/net/wireless/mediatek/mt76/testmode.c
+++ b/drivers/net/wireless/mediatek/mt76/testmode.c
@@ -1,5 +1,7 @@
 // SPDX-License-Identifier: ISC
 /* Copyright (C) 2020 Felix Fietkau <nbd@nbd.name> */
+
+#include <linux/random.h>
 #include "mt76.h"
 
 const struct nla_policy mt76_tm_policy[NUM_MT76_TM_ATTRS] = {
@@ -124,12 +126,14 @@ int mt76_testmode_alloc_skb(struct mt76_phy *phy, u32 len)
 	if (!head)
 		return -ENOMEM;
 
-	hdr = __skb_put_zero(head, head_len);
+	hdr = __skb_put_zero(head, sizeof(*hdr));
 	hdr->frame_control = cpu_to_le16(fc);
 	memcpy(hdr->addr1, td->addr[0], ETH_ALEN);
 	memcpy(hdr->addr2, td->addr[1], ETH_ALEN);
 	memcpy(hdr->addr3, td->addr[2], ETH_ALEN);
 	skb_set_queue_mapping(head, IEEE80211_AC_BE);
+	get_random_bytes(__skb_put(head, head_len - sizeof(*hdr)),
+			 head_len - sizeof(*hdr));
 
 	info = IEEE80211_SKB_CB(head);
 	info->flags = IEEE80211_TX_CTL_INJECTED |
@@ -157,7 +161,7 @@ int mt76_testmode_alloc_skb(struct mt76_phy *phy, u32 len)
 			return -ENOMEM;
 		}
 
-		__skb_put_zero(frag, frag_len);
+		get_random_bytes(__skb_put(frag, frag_len), frag_len);
 		head->len += frag->len;
 		head->data_len += frag->len;
 
-- 
2.25.1


