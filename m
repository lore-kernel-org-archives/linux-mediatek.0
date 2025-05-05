Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 097F6C3ABB6
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 May 2025 08:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=h4P39E1QGiODNj6DPGFAGPEV/IZtN/MIkl9xBL7KDoI=; b=KmmBVSzqL9DDeS2UlPDS8RXg8I
	yTZSF08/ETtAqK/xSELm63kzGgBZ2QkrzvnsJ5eCxiTBHBnC+ATqOBF7wu+XJE/8ZJnonxFxogpzk
	laZLXMIT4jv3LFjvtw3zKSOlVqutNMobXHNuqD/DUlXHIyG/IPv5rpaUK9Do5sLXWm5gYYS1cI422
	0tOZG/+B87WO2CpEY5y2dcheulgCXkBW7gOYopnMP3cc8235XVG5JkSAF/FwHk9yXTOcckpFGpwjN
	uNrWUygV/d00FWpkeVtXO48ZrA2f+MfVzosSra/V9x1E6TFOzM5cVkiO5qipdw8cL4vK41s92h+zZ
	gHSt8H4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBr4U-00000006lm5-3etL;
	Mon, 05 May 2025 08:21:06 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBr3g-00000006ldq-2nGv
	for linux-mediatek@lists.infradead.org;
	Mon, 05 May 2025 08:20:17 +0000
X-UUID: c38f194e298911f0bed96b30c12bc3d6-20250505
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=h4P39E1QGiODNj6DPGFAGPEV/IZtN/MIkl9xBL7KDoI=;
	b=dH5jH/7LdDaV11OU/48hhSmt6jTMSXFv0Tex16A0uNfV7o3w+6tWaSMrVL00xA+FhQZH9vGdCvTHM0y4t6zire5PLWllpbMOuSqinl2ap8xG2bzdFqhtfhqMe/OvOt+xk7fi9WzObeJt36EL0AqODY9SWr/ttgmGY8pBmylZ/x4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:2888156b-7368-4298-994f-0954dc662202,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:f254c42b-be47-4281-8f30-e6479b5e1210,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0|50,EDM:-3,IP:ni
	l,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES
	:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: c38f194e298911f0bed96b30c12bc3d6-20250505
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <michael-cy.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1411322854; Mon, 05 May 2025 01:20:11 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Mon, 5 May 2025 16:20:09 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Mon, 5 May 2025 16:20:09 +0800
From: Michael-CY Lee <michael-cy.lee@mediatek.com>
To: linux-wireless <linux-wireless@vger.kernel.org>
CC: Johannes Berg <johannes@sipsolutions.net>, Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, Money Wang <money.wang@mediatek.com>,
	linux-mediatek <linux-mediatek@lists.infradead.org>, Michael-CY Lee
	<michael-cy.lee@mediatek.com>
Subject: [PATCH] wifi: mac80211: fix the type of status_code for negotiated TID to Link Mapping
Date: Mon, 5 May 2025 16:19:46 +0800
Message-ID: <20250505081946.3927214-1-michael-cy.lee@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_012016_712285_1EE37B3B 
X-CRM114-Status: GOOD (  11.96  )
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

The status code should be type of __le16.

Fixes: 83e897a961b8 ("wifi: ieee80211: add definitions for negotiated TID to Link map")
Fixes: 8f500fbc6c65 ("wifi: mac80211: process and save negotiated TID to Link mapping request")
Signed-off-by: Michael-CY Lee <michael-cy.lee@mediatek.com>
---
 include/linux/ieee80211.h |  2 +-
 net/mac80211/mlme.c       | 13 +++++++------
 2 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/include/linux/ieee80211.h b/include/linux/ieee80211.h
index 508d466de1cc..457b4fba88bd 100644
--- a/include/linux/ieee80211.h
+++ b/include/linux/ieee80211.h
@@ -1526,7 +1526,7 @@ struct ieee80211_mgmt {
 				struct {
 					u8 action_code;
 					u8 dialog_token;
-					u8 status_code;
+					__le16 status_code;
 					u8 variable[];
 				} __packed ttlm_res;
 				struct {
diff --git a/net/mac80211/mlme.c b/net/mac80211/mlme.c
index c010bb3d24e3..5d1cd42160a0 100644
--- a/net/mac80211/mlme.c
+++ b/net/mac80211/mlme.c
@@ -7675,6 +7675,7 @@ ieee80211_send_neg_ttlm_res(struct ieee80211_sub_if_data *sdata,
 	int hdr_len = offsetofend(struct ieee80211_mgmt, u.action.u.ttlm_res);
 	int ttlm_max_len = 2 + 1 + sizeof(struct ieee80211_ttlm_elem) + 1 +
 		2 * 2 * IEEE80211_TTLM_NUM_TIDS;
+	u16 status_code;
 
 	skb = dev_alloc_skb(local->tx_headroom + hdr_len + ttlm_max_len);
 	if (!skb)
@@ -7697,19 +7698,18 @@ ieee80211_send_neg_ttlm_res(struct ieee80211_sub_if_data *sdata,
 		WARN_ON(1);
 		fallthrough;
 	case NEG_TTLM_RES_REJECT:
-		mgmt->u.action.u.ttlm_res.status_code =
-			WLAN_STATUS_DENIED_TID_TO_LINK_MAPPING;
+		status_code = WLAN_STATUS_DENIED_TID_TO_LINK_MAPPING;
 		break;
 	case NEG_TTLM_RES_ACCEPT:
-		mgmt->u.action.u.ttlm_res.status_code = WLAN_STATUS_SUCCESS;
+		status_code = WLAN_STATUS_SUCCESS;
 		break;
 	case NEG_TTLM_RES_SUGGEST_PREFERRED:
-		mgmt->u.action.u.ttlm_res.status_code =
-			WLAN_STATUS_PREF_TID_TO_LINK_MAPPING_SUGGESTED;
+		status_code = WLAN_STATUS_PREF_TID_TO_LINK_MAPPING_SUGGESTED;
 		ieee80211_neg_ttlm_add_suggested_map(skb, neg_ttlm);
 		break;
 	}
 
+	mgmt->u.action.u.ttlm_res.status_code = cpu_to_le16(status_code);
 	ieee80211_tx_skb(sdata, skb);
 }
 
@@ -7875,7 +7875,8 @@ void ieee80211_process_neg_ttlm_res(struct ieee80211_sub_if_data *sdata,
 	 * This can be better implemented in the future, to handle request
 	 * rejections.
 	 */
-	if (mgmt->u.action.u.ttlm_res.status_code != WLAN_STATUS_SUCCESS)
+	if (le16_to_cpu(mgmt->u.action.u.ttlm_res.status_code) !=
+	    WLAN_STATUS_SUCCESS)
 		__ieee80211_disconnect(sdata);
 }
 
-- 
2.25.1


