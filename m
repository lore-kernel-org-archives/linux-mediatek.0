Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10A94C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Feb 2022 08:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IPw5nJlckNU1SuvxuTIzCdZKfoKwyY2WDv5jxlUjV0Y=; b=dNp2el9bvP7GrQ
	4h1MWeUCiInoTje5CrtJ1x6zd04lvTwkSVVAna7WZwT3EyB5jPXAvyvIjsWR+LFMsZ5edIFbMqCyd
	3dOTEU1YfOOAWP4VIzILOAXyTVlLtWN6iT7Mh/21KJD+ICpsPEKD87uesmm+kRDFIQzPb1e9XdZMy
	wW1nIMhDhGEs2+ffqjBnUE+/1iPRaLz/wQQ3a+wt3L7lQjf1ajh2LEmaAGJi9VuHm1G4XZXEqYCi8
	Jlv7Z7kOTk1DCRVBx3PJLllqgIrzDKj3cz2XVjuY28d0FtDYhIBebr4s3CaCcinIVlkdVVsLFvDHm
	ZCLxJutEg+L2BAU4Zozg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJtWQ-001oTs-DV; Tue, 15 Feb 2022 08:49:18 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJtWN-001oSO-6Z
 for linux-mediatek@lists.infradead.org; Tue, 15 Feb 2022 08:49:16 +0000
X-UUID: c503e66021df405293718f63c67c8301-20220215
X-UUID: c503e66021df405293718f63c67c8301-20220215
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <meichia.chiu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1373411706; Tue, 15 Feb 2022 01:49:09 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 15 Feb 2022 00:49:08 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 15 Feb 2022 16:49:00 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 15 Feb 2022 16:49:00 +0800
From: MeiChia Chiu <MeiChia.Chiu@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: Lorenzo Bianconi <lorenzo.bianconi@redhat.com>, Shayne Chen
 <shayne.chen@mediatek.com>, Evelyn Tsai <evelyn.tsai@mediatek.com>, Ryder Lee
 <ryder.lee@mediatek.com>, <linux-wireless@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, MeiChia Chiu
 <meichia.chiu@mediatek.com>
Subject: [PATCH] mt76: mt7915: fix the muru tlv issue
Date: Tue, 15 Feb 2022 16:48:58 +0800
Message-ID: <20220215084858.3429-1-MeiChia.Chiu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220215_004915_250874_23B7DEF3 
X-CRM114-Status: UNSURE (   9.45  )
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

From: MeiChia Chiu <meichia.chiu@mediatek.com>

The muru enable/disable are only set after the first station connection.
Without this patch, the firmware couldn't enable muru
if the first connected station is non-HE type.

Fixes: 16bff457dd33a ("mt76: mt7915: rework mt7915_mcu_sta_muru_tlv()")

Reviewed-by: Ryder Lee <ryder.lee@mediatek.com>
Signed-off-by: MeiChia Chiu <meichia.chiu@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7915/mcu.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
index 02f93189370e..0addb5a112d9 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
@@ -924,9 +924,6 @@ mt7915_mcu_sta_muru_tlv(struct sk_buff *skb, struct ieee80211_sta *sta,
 	    vif->type != NL80211_IFTYPE_AP)
 		return;
 
-	if (!sta->vht_cap.vht_supported)
-		return;
-
 	tlv = mt76_connac_mcu_add_tlv(skb, STA_REC_MURU, sizeof(*muru));
 
 	muru = (struct sta_rec_muru *)tlv;
@@ -934,9 +931,12 @@ mt7915_mcu_sta_muru_tlv(struct sk_buff *skb, struct ieee80211_sta *sta,
 	muru->cfg.mimo_dl_en = mvif->cap.he_mu_ebfer ||
 			       mvif->cap.vht_mu_ebfer ||
 			       mvif->cap.vht_mu_ebfee;
+	muru->cfg.mimo_ul_en = true;
+	muru->cfg.ofdma_dl_en = true;
 
-	muru->mimo_dl.vht_mu_bfee =
-		!!(sta->vht_cap.cap & IEEE80211_VHT_CAP_MU_BEAMFORMEE_CAPABLE);
+	if (sta->vht_cap.vht_supported)
+		muru->mimo_dl.vht_mu_bfee =
+			!!(sta->vht_cap.cap & IEEE80211_VHT_CAP_MU_BEAMFORMEE_CAPABLE);
 
 	if (!sta->he_cap.has_he)
 		return;
@@ -944,13 +944,11 @@ mt7915_mcu_sta_muru_tlv(struct sk_buff *skb, struct ieee80211_sta *sta,
 	muru->mimo_dl.partial_bw_dl_mimo =
 		HE_PHY(CAP6_PARTIAL_BANDWIDTH_DL_MUMIMO, elem->phy_cap_info[6]);
 
-	muru->cfg.mimo_ul_en = true;
 	muru->mimo_ul.full_ul_mimo =
 		HE_PHY(CAP2_UL_MU_FULL_MU_MIMO, elem->phy_cap_info[2]);
 	muru->mimo_ul.partial_ul_mimo =
 		HE_PHY(CAP2_UL_MU_PARTIAL_MU_MIMO, elem->phy_cap_info[2]);
 
-	muru->cfg.ofdma_dl_en = true;
 	muru->ofdma_dl.punc_pream_rx =
 		HE_PHY(CAP1_PREAMBLE_PUNC_RX_MASK, elem->phy_cap_info[1]);
 	muru->ofdma_dl.he_20m_in_40m_2g =
-- 
2.29.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
