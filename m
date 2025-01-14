Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02ADAC02183
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Jan 2025 10:12:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UHzbOEmiqnQIkKhhSqNXU6yfTUCIaRQzxl1hYiaXUpA=; b=QL+zknPl+g0Q950SKOeoLIEpWf
	V9QcqI0am6x30sJ5CFDd6JGeE5GNHXXL6TmURg3nPjD3KWEkIRQhaf347MMeSZtfLR1/775zHXEQl
	tRuRfn9jq4p/U+AEHz6ho51Yr6dq/yn7nkdOzPqOG+oFpCC0EamjHgYEU5nq6+n8Bdf1E6wC7RfmP
	py2zH4qo6bkdBqHgRMJloqxBGIl7miw9aThp4Zup2EzHk8jzeAWejw/LaBV2XnGitTk2w24XwScyB
	kTaSsiUXyFCOfIAu6mMawpwoUTs15BOlYmouqgJnNd3c+AKMh3OzisVpaLEQAbw2IzXpmEo1HAIh0
	OzLR6iCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXdu4-0000000836B-0oBQ;
	Tue, 14 Jan 2025 10:12:08 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXdtm-000000082zS-0yK0
	for linux-mediatek@lists.infradead.org;
	Tue, 14 Jan 2025 10:11:52 +0000
X-UUID: f3ef191cd25f11ef9048ed6ed365623b-20250114
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=UHzbOEmiqnQIkKhhSqNXU6yfTUCIaRQzxl1hYiaXUpA=;
	b=LmiGfj2GYIDI3BSjHz5+EDyQS+LhhmmrFPt9FO45RLWN23nU4ygrioob20ynrAHPGNnd0XQhXlWIWzaf1gLZsZtsQNoVqYEgalCRFz+8uVc7m49rAvwY0DRATqhTukJgA/B0V/lE+OvGcmynr5s16zcC7kdfsiBHsYSCTpoeuK4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.46,REQID:90c0f6ef-46cb-4c0a-919b-1b9e8c36a7eb,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:60aa074,CLOUDID:40047b13-8831-4185-8e40-f83b1917e828,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
	,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: f3ef191cd25f11ef9048ed6ed365623b-20250114
Received: from mtkmbs10n2.mediatek.inc [(172.21.101.183)] by mailgw02.mediatek.com
	(envelope-from <shayne.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1035504595; Tue, 14 Jan 2025 03:11:42 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Tue, 14 Jan 2025 18:11:40 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Tue, 14 Jan 2025 18:11:40 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
	<lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Michael-CY Lee
	<michael-cy.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>
Subject: [PATCH 8/9] wifi: mt76: mt7996: fix beacon command during disabling
Date: Tue, 14 Jan 2025 18:10:25 +0800
Message-ID: <20250114101026.3587702-8-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250114101026.3587702-1-shayne.chen@mediatek.com>
References: <20250114101026.3587702-1-shayne.chen@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_021150_289258_E1F479E0 
X-CRM114-Status: GOOD (  10.80  )
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

From: Michael-CY Lee <michael-cy.lee@mediatek.com>

When stopping AP, mac80211 frees beacon template before it calls
driver's stop_ap operation. In other words, on the path of stopping
AP, ieee80211_beacon_get_template() must returns NULL in
mt7996_mcu_add_beacon(). In such case mt7996 immediately returns
-EINVAL without telling FW to disable the beacon.

This commit refactors mt7996_mcu_add_beacon() so that FW can be
correctly informed when disabling AP interface.

Co-developed-by: Shayne Chen <shayne.chen@mediatek.com>
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
Signed-off-by: Michael-CY Lee <michael-cy.lee@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7996/mcu.c   | 26 +++++++++++--------
 1 file changed, 15 insertions(+), 11 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
index 9879c108cd0e..dcca8b931237 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
@@ -2520,7 +2520,7 @@ int mt7996_mcu_add_beacon(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 	struct sk_buff *skb, *rskb;
 	struct tlv *tlv;
 	struct bss_bcn_content_tlv *bcn;
-	int len;
+	int len, extra_len = 0;
 
 	if (link_conf->nontransmitted)
 		return 0;
@@ -2534,28 +2534,32 @@ int mt7996_mcu_add_beacon(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 		return PTR_ERR(rskb);
 
 	skb = ieee80211_beacon_get_template(hw, vif, &offs, link_conf->link_id);
-	if (!skb) {
+	if (link_conf->enable_beacon && !skb) {
 		dev_kfree_skb(rskb);
 		return -EINVAL;
 	}
 
-	if (skb->len > MT7996_MAX_BEACON_SIZE) {
-		dev_err(dev->mt76.dev, "Bcn size limit exceed\n");
-		dev_kfree_skb(rskb);
-		dev_kfree_skb(skb);
-		return -EINVAL;
-	}
+	if (skb) {
+		if (skb->len > MT7996_MAX_BEACON_SIZE) {
+			dev_err(dev->mt76.dev, "Bcn size limit exceed\n");
+			dev_kfree_skb(rskb);
+			dev_kfree_skb(skb);
+			return -EINVAL;
+		}
 
-	info = IEEE80211_SKB_CB(skb);
-	info->hw_queue |= FIELD_PREP(MT_TX_HW_QUEUE_PHY, mlink->band_idx);
+		extra_len = skb->len;
+	}
 
-	len = ALIGN(sizeof(*bcn) + MT_TXD_SIZE + skb->len, 4);
+	len = ALIGN(sizeof(*bcn) + MT_TXD_SIZE + extra_len, 4);
 	tlv = mt7996_mcu_add_uni_tlv(rskb, UNI_BSS_INFO_BCN_CONTENT, len);
 	bcn = (struct bss_bcn_content_tlv *)tlv;
 	bcn->enable = link_conf->enable_beacon;
 	if (!bcn->enable)
 		goto out;
 
+	info = IEEE80211_SKB_CB(skb);
+	info->hw_queue |= FIELD_PREP(MT_TX_HW_QUEUE_PHY, mlink->band_idx);
+
 	mt7996_mcu_beacon_cont(dev, link_conf, rskb, skb, bcn, &offs);
 	if (link_conf->bssid_indicator)
 		mt7996_mcu_beacon_mbss(rskb, skb, bcn, &offs);
-- 
2.39.2


