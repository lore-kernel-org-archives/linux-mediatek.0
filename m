Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41FE7C4725D
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Jan 2024 08:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=epN7KJjCMnYrcOaasseqP03+HRXsNVjKd4ndmSsQ1BM=; b=qiGKPtgdVbRzhXLrDu62NROerM
	3Eiq5PVeemmmFpKLuTFCQNzTybABk0FKH/moMVLAcqPdeWzK6JEHYOnk4GLVaLIPVtb38osB2wWSl
	uRyPzpjSRvUxCmqSsXiBPhypdJyi7ee/e0oOw+p7+Unh+Vr4J7d4KbRxy26oBWTbPvRlRhraSCz93
	vii7Md/U9fS/DtKqswEiGQ+jnGFmAUyMGKxYzbqoTM94+3aN66SK1BLojieYCGAxDUM/CQBOiNcKq
	tt2+XXkhrmbKXfROKokZbdXB6tjCuyz9hngoFyktEAoXqFw052TDFppAceXeDj5a9MsZkr1Pn2A7S
	70Ul4YuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQkhc-004uGt-0B;
	Fri, 19 Jan 2024 08:58:16 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQkhZ-004uGE-11
	for linux-mediatek@lists.infradead.org;
	Fri, 19 Jan 2024 08:58:14 +0000
X-UUID: de5be234b6a811ee9a263b4415211400-20240119
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=epN7KJjCMnYrcOaasseqP03+HRXsNVjKd4ndmSsQ1BM=;
	b=XXTsTOKT5vW8XZE26oU9qKwA6L126NHPCHmzSSIcutBG6HfDQWT0vabmMGGSONSBJZ/kqn52aF7YkSXftbN7eqSSFOyq1dkBL74Crl7ysI2t9/twmfl3n9Y8MICJu34dAvuFQ7puxySpxq1f5i1U6Hh+cbjO6ZydPRqhqQ9MDOo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.36,REQID:06414b1c-58bb-4618-984d-fef8b87304e2,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6e16cf4,CLOUDID:e66c0783-8d4f-477b-89d2-1e3bdbef96d1,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: de5be234b6a811ee9a263b4415211400-20240119
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <shayne.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1634322996; Fri, 19 Jan 2024 01:58:09 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 19 Jan 2024 16:57:35 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 19 Jan 2024 16:57:35 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
	<lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, Bo Jiao <Bo.Jiao@mediatek.com>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Benjamin Lin
	<benjamin-jw.lin@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>
Subject: [PATCH 04/12] wifi: mt76: mt7996: fix incorrect interpretation of EHT MCS caps
Date: Fri, 19 Jan 2024 16:57:00 +0800
Message-ID: <20240119085708.23592-4-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240119085708.23592-1-shayne.chen@mediatek.com>
References: <20240119085708.23592-1-shayne.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10-1.739900-8.000000
X-TMASE-MatchedRID: /RWZlr+4p74zTh1BHqxnVY3NgkEqAN0Rsf4f4CxxueRz/u+TcH1U7P9T
	oIqmlx19ThbvLLI8RvOWLz7gHk2taUHQ/pYAwhs6R/j040fRFpJ9LQinZ4QefPcjNeVeWlqY+gt
	Hj7OwNO0A7WI2V4bLAuuk854hvA8+V+SwhFPhEoCx9buuJcLWGIg2O6s7GegS+cdfgsVbKhBSNA
	OKzF0tk5keeltQbbqsVMMzQNLWGsoHo6Gh2L5tQUma3zYT97IFAYfQIAUhBayZvmCbKVb49sZL6
	x5U/HriIk9sIzm5o6zAvpLE+mvX8g==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10-1.739900-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: A8EE4D743659859585BCB5302B51DA086E7514AD8E9A87E29D00C6623711E8842000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240119_005813_377904_0B91FE51 
X-CRM114-Status: GOOD (  12.06  )
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

From: Benjamin Lin <benjamin-jw.lin@mediatek.com>

The EHT MCS map subfield of 20 MHz-Only is not present in the EHT
capability of AP, so STA does not need to parse the subfield.
Moreover, AP should parse the subfield only if STA is 20 MHz-Only, which
can be confirmed by checking supported channel width in HE capability.

Fixes: 92aa2da9fa49 ("wifi: mt76: mt7996: enable EHT support in firmware")
Co-developed-by: Shayne Chen <shayne.chen@mediatek.com>
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
Signed-off-by: Benjamin Lin <benjamin-jw.lin@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7996/mcu.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
index 3c729b563edc..02d858fdc9fe 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
@@ -1240,6 +1240,9 @@ mt7996_mcu_sta_he_6g_tlv(struct sk_buff *skb, struct ieee80211_sta *sta)
 static void
 mt7996_mcu_sta_eht_tlv(struct sk_buff *skb, struct ieee80211_sta *sta)
 {
+	struct mt7996_sta *msta = (struct mt7996_sta *)sta->drv_priv;
+	struct ieee80211_vif *vif = container_of((void *)msta->vif,
+						 struct ieee80211_vif, drv_priv);
 	struct ieee80211_eht_mcs_nss_supp *mcs_map;
 	struct ieee80211_eht_cap_elem_fixed *elem;
 	struct sta_rec_eht *eht;
@@ -1259,8 +1262,17 @@ mt7996_mcu_sta_eht_tlv(struct sk_buff *skb, struct ieee80211_sta *sta)
 	eht->phy_cap = cpu_to_le64(*(u64 *)elem->phy_cap_info);
 	eht->phy_cap_ext = cpu_to_le64(elem->phy_cap_info[8]);
 
-	if (sta->deflink.bandwidth == IEEE80211_STA_RX_BW_20)
-		memcpy(eht->mcs_map_bw20, &mcs_map->only_20mhz, sizeof(eht->mcs_map_bw20));
+	if (vif->type != NL80211_IFTYPE_STATION &&
+	    (sta->deflink.he_cap.he_cap_elem.phy_cap_info[0] &
+	     (IEEE80211_HE_PHY_CAP0_CHANNEL_WIDTH_SET_40MHZ_IN_2G |
+	      IEEE80211_HE_PHY_CAP0_CHANNEL_WIDTH_SET_40MHZ_80MHZ_IN_5G |
+	      IEEE80211_HE_PHY_CAP0_CHANNEL_WIDTH_SET_160MHZ_IN_5G |
+	      IEEE80211_HE_PHY_CAP0_CHANNEL_WIDTH_SET_80PLUS80_MHZ_IN_5G)) == 0) {
+		memcpy(eht->mcs_map_bw20, &mcs_map->only_20mhz,
+		       sizeof(eht->mcs_map_bw20));
+		return;
+	}
+
 	memcpy(eht->mcs_map_bw80, &mcs_map->bw._80, sizeof(eht->mcs_map_bw80));
 	memcpy(eht->mcs_map_bw160, &mcs_map->bw._160, sizeof(eht->mcs_map_bw160));
 	memcpy(eht->mcs_map_bw320, &mcs_map->bw._320, sizeof(eht->mcs_map_bw320));
-- 
2.39.2


