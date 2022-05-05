Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75873C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 May 2022 08:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5nuhEhwdbE1z+SKSDBzhdZNKqBoYW0seK9rEo3k29T4=; b=oQHKY9QiC5Tx1o
	RSFj2IWmg0WK3zndkSRtJqE5+DbI3zUn5jUVHWqlyhe6v/8s0GkYvkWBsb2vUQvtDH4W4gMR5TpyE
	YAx2NegQZ2GjyAOeppzp4sH0ct489oE8aDyZqhPB6nRYbeL9j319AIT4kExtjvzKcA+YgfRbrxFS9
	kp34z5zHsE2c/uk3sKWoKnqOh1ZHHQjS4S9zqBVJJDg+HXBHP/irXj8zaBHMyeEm9hyH3JJI7T7XN
	+GedbuZn81NEjKZBSOQ2o3wNcPjhpJqHhf4raU6XsDrr1YvX7GZ8l8FiwDiK26GD6y8afW8zHvUxj
	JOrVktXR5l2rLn2FRkMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmWuF-00Eirg-37; Thu, 05 May 2022 08:32:15 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmWuB-00Eipb-9Z
 for linux-mediatek@lists.infradead.org; Thu, 05 May 2022 08:32:13 +0000
X-UUID: becc277c492a48f08fda13cb95708a20-20220505
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:852c1a4c-94a6-4f78-938a-4f55d07a9c50, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:faefae9, CLOUDID:2c60abb2-56b5-4c9e-8d83-0070b288eb6a,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: becc277c492a48f08fda13cb95708a20-20220505
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chui-hao.chiu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 756798316; Thu, 05 May 2022 01:32:07 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 5 May 2022 01:25:58 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 5 May 2022 16:25:56 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 5 May 2022 16:25:56 +0800
From: Peter Chiu <chui-hao.chiu@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Ryder Lee
 <ryder.Lee@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>, Shayne Chen
 <shayne.chen@mediatek.com>, <linux-wireless@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, Peter Chiu <chui-hao.chiu@mediatek.com>
Subject: [PATCH 3/4] mt76: mt7915: reject duplicated twt flows
Date: Thu, 5 May 2022 16:25:53 +0800
Message-ID: <20220505082554.16656-3-chui-hao.chiu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220505082554.16656-1-chui-hao.chiu@mediatek.com>
References: <20220505082554.16656-1-chui-hao.chiu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220505_013211_371904_5D2ED545 
X-CRM114-Status: GOOD (  11.35  )
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

Reject twt flows with the same parameters to prevent some potential issues
causing by duplicated establishment.

Reviewed-by: Ryder Lee <ryder.lee@mediatek.com>
Reviewed-by: Shayne Chen <shayne.chen@mediatek.com>
Signed-off-by: Peter Chiu <chui-hao.chiu@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7915/mac.c   | 31 +++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
index 94a1871fbf43..ff60a3d2d26d 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
@@ -2601,6 +2601,34 @@ static int mt7915_mac_check_twt_req(struct ieee80211_twt_setup *twt)
 	return 0;
 }
 
+static inline bool
+mt7915_mac_twt_param_equal(struct mt7915_sta *msta,
+			   struct ieee80211_twt_params *twt_agrt)
+{
+	u16 type = le16_to_cpu(twt_agrt->req_type);
+	u8 exp;
+	int i;
+
+	exp = FIELD_GET(IEEE80211_TWT_REQTYPE_WAKE_INT_EXP, type);
+	for (i = 0; i < MT7915_MAX_STA_TWT_AGRT; i++) {
+		struct mt7915_twt_flow *f;
+
+		if (!(msta->twt.flowid_mask & BIT(i)))
+			continue;
+
+		f = &msta->twt.flow[i];
+		if (f->duration == twt_agrt->min_twt_dur &&
+		    f->mantissa == twt_agrt->mantissa &&
+		    f->exp == exp &&
+		    f->protection == !!(type & IEEE80211_TWT_REQTYPE_PROTECTION) &&
+		    f->flowtype == !!(type & IEEE80211_TWT_REQTYPE_FLOWTYPE) &&
+		    f->trigger == !!(type & IEEE80211_TWT_REQTYPE_TRIGGER))
+			return true;
+	}
+
+	return false;
+}
+
 void mt7915_mac_add_twt_setup(struct ieee80211_hw *hw,
 			      struct ieee80211_sta *sta,
 			      struct ieee80211_twt_setup *twt)
@@ -2634,6 +2662,9 @@ void mt7915_mac_add_twt_setup(struct ieee80211_hw *hw,
 	exp = FIELD_GET(IEEE80211_TWT_REQTYPE_WAKE_INT_EXP, req_type);
 	sta_setup_cmd = FIELD_GET(IEEE80211_TWT_REQTYPE_SETUP_CMD, req_type);
 
+	if (mt7915_mac_twt_param_equal(msta, twt_agrt))
+		goto unlock;
+
 	flow = &msta->twt.flow[flowid];
 	memset(flow, 0, sizeof(*flow));
 	INIT_LIST_HEAD(&flow->list);
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
