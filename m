Return-Path: <SRS0=NOVl=GJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAE37C433E0
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Jan 2021 01:02:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 80DF322838
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Jan 2021 01:02:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 80DF322838
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KNQw2csOKE7wyFcLuIlQkpCknPgbitcplKabxhK6IyE=; b=Cr3C2eMkqkHFuCnyMhNgbzcWOm
	yMVLizhr/aAy/yq0FXMHHjQ7VkR/9rpRJmFCNYsk01gmykFnO3Yd6wf96EAfgdoS9prRfWksH/0hK
	IE8yoammQWe5qhGKJXRQTQBrtxMmjBQV7ot4nzWNDvSzkygqt/Bt+CHlP3yDI95nfZAfN7u1CxhpV
	Jkvks8oRLn6NzRrkCqnVfEZNrSzcNfO/pWeFJmO+pDRoedfCYpfoVZ5g+haozFEneN5LqPuXVJv5y
	u5CBpquw/syOlFY2snhm+rmZYtYnDIINZuf3uqgTOOtfcAt1u4QjDaTW7gasoBJQrmoX+rZlJNSTZ
	0cxoI6ZA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kwxDU-0008KG-JW; Wed, 06 Jan 2021 01:02:24 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kwxDR-0008JR-TR
 for linux-mediatek@lists.infradead.org; Wed, 06 Jan 2021 01:02:23 +0000
X-UUID: c243c284b0c04a06a25b860a88c43c0c-20210105
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=3DDHISUDUwvwwMCwoRAdFxmjVS1YacWHMI6roE/SQ8I=; 
 b=ox9lTFA1DlEWhZ9Lqx/F8HrYZrrfrP9UcLcZ56iaND/orob8uDcl2M9JVpCjBkbQqLjjVGuKhG5ER/caStHMkvYGqQPjy4Zk04pFG8lST5z1trOpkMsS6txsKSyrKHPSqNhjyL+YfhyrTymDG+w/2YXL2EeGiD/p7qjKOmlOVHg=;
X-UUID: c243c284b0c04a06a25b860a88c43c0c-20210105
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1106274522; Tue, 05 Jan 2021 17:02:17 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 5 Jan 2021 17:02:15 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 6 Jan 2021 09:02:06 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 6 Jan 2021 09:02:06 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: =?UTF-8?q?Toke=20H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
Subject: [PATCH] mac80211: check ATF flag in ieee80211_next_txq()
Date: Wed, 6 Jan 2021 09:01:49 +0800
Message-ID: <d9aef825d186a91ff91f6a81045d49d375533b14.1609894402.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-TM-SNTS-SMTP: 24C95263E2E9892CB5D0A505E079E5294164C3DCAC765E6AEEA2609BA5AA4CA02000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210105_200222_401435_51C23E46 
X-CRM114-Status: UNSURE (   9.26  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Ryder Lee <ryder.lee@mediatek.com>, linux-wireless@vger.kernel.org,
 linux-mediatek@lists.infradead.org,
 Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Felix Fietkau <nbd@nbd.name>,
 Shayne Chen <shayne.chen@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The selected txq should be scheduled unconditionally if
NL80211_EXT_FEATURE_AIRTIME_FAIRNESS is not set by driver.

Also put the sta to the end of the active_txqs list if
deficit is negative then move on to the next txq.

Tested-by: Sujuan Chen <sujuan.chen@mediatek.com>
Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 net/mac80211/tx.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/net/mac80211/tx.c b/net/mac80211/tx.c
index 6422da6690f7..5640c9428596 100644
--- a/net/mac80211/tx.c
+++ b/net/mac80211/tx.c
@@ -3760,14 +3760,19 @@ struct ieee80211_txq *ieee80211_next_txq(struct ieee80211_hw *hw, u8 ac)
 		struct sta_info *sta = container_of(txqi->txq.sta,
 						    struct sta_info, sta);
 		bool aql_check = ieee80211_txq_airtime_check(hw, &txqi->txq);
-		s64 deficit = sta->airtime[txqi->txq.ac].deficit;
+		s64 deficit = 0;
 
 		if (aql_check)
 			found_eligible_txq = true;
 
-		if (deficit < 0)
-			sta->airtime[txqi->txq.ac].deficit +=
-				sta->airtime_weight;
+		if (wiphy_ext_feature_isset(local->hw.wiphy,
+					    NL80211_EXT_FEATURE_AIRTIME_FAIRNESS)) {
+			deficit = sta->airtime[txqi->txq.ac].deficit;
+
+			if (deficit < 0)
+				sta->airtime[txqi->txq.ac].deficit +=
+					sta->airtime_weight;
+		}
 
 		if (deficit < 0 || !aql_check) {
 			list_move_tail(&txqi->schedule_order,
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
