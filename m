Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36380CA0EDC
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Aug 2025 03:02:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0+vjVtEU7kNIlyL8VETxpczT/vmL9S8nShv9BwKQngw=; b=V6ZDZWaTTyXrEShlUR+DhAT7Z+
	itooC2t3CKDPg85rFPtmUfTlVqHyC+H/b61p2MoYI1XWzwQMSkT6UmE592zNqCiogFu/u4cyeH841
	18Ng5/bNKqrVckKC2YjCg7k6gReEafdQtER0rryKb4OKVRNL7GSYc7i+kMMcbctpBWzBYnAe7XVBW
	RE7eDrMZ/upwl1P+8VcSWkUZ/jq7bQQ4d2xKUaAVUGXyDyCAnHPQA45lyrQQVC9CX30y6ZIlK7cKx
	3mmJG8BDWOWWZWaw8NdQszZmxIZfhEE3Sv+nWm+r3AIc0IyrX1GcXpWg3uV8gGlGP726LN/QyWtRE
	JLJz8Z1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unq8S-00000006NCO-1Wd8;
	Mon, 18 Aug 2025 03:02:12 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unq8P-00000006NC3-4B6S
	for linux-mediatek@lists.infradead.org;
	Mon, 18 Aug 2025 03:02:11 +0000
X-UUID: b8c00a347bdf11f09eb0dd999d3936bf-20250817
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=0+vjVtEU7kNIlyL8VETxpczT/vmL9S8nShv9BwKQngw=;
	b=a7CRpqueaXSMCFVL1W6H1Lp5HwWf5WMEUTMdI49ZdEirtt2hzw9ja9H57emUd0kWkrbn4/bxrVBHC9SW3WgjS1HgAttLHL2ZV103tLGBJGDagx5NGcBXKcqE9YSuYvnTv2Do3npFHmbCjL85W38brmu2B/ZQh03CSQf0AsB1OPI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.3,REQID:94ef6e00-c28b-4aeb-921a-f31b4b40f3ec,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:f1326cf,CLOUDID:d2c2516d-c2f4-47a6-876f-59a53e9ecc6e,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:-5,Content:0|15|50,EDM:-3,IP:
	nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,L
	ES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: b8c00a347bdf11f09eb0dd999d3936bf-20250817
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw02.mediatek.com
	(envelope-from <mingyen.hsieh@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 928253450; Sun, 17 Aug 2025 20:02:05 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Mon, 18 Aug 2025 11:02:01 +0800
Received: from mtksitap99.mediatek.inc (10.233.130.16) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Mon, 18 Aug 2025 11:02:01 +0800
From: Mingyen Hsieh <mingyen.hsieh@mediatek.com>
To: <nbd@nbd.name>, <lorenzo@kernel.org>
CC: <deren.wu@mediatek.com>, <Sean.Wang@mediatek.com>,
	<Leon.Yen@mediatek.com>, <Michael.Lo@mediatek.com>,
	<allan.wang@mediatek.com>, <Eric-SY.Chang@mediatek.com>,
	<km.lin@mediatek.com>, <Quan.Zhou@mediatek.com>, <Ryder.Lee@mediatek.com>,
	<Shayne.Chen@mediatek.com>, <linux-wireless@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, Ming Yen Hsieh
	<mingyen.hsieh@mediatek.com>, <stable@vger.kernel.org>, Tal Inbar
	<inbartdev@gmail.com>
Subject: [PATCH] wifi: mt76: mt7925: skip EHT MLD TLV on non-MLD and pass conn_state for sta_cmd
Date: Mon, 18 Aug 2025 11:02:01 +0800
Message-ID: <20250818030201.997940-1-mingyen.hsieh@mediatek.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250817_200210_045416_8B263095 
X-CRM114-Status: UNSURE (   9.18  )
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

From: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>

Return early in mt7925_mcu_sta_eht_mld_tlv() for non-MLD vifs to avoid bogus
MLD TLVs, and pass the proper connection state to sta_basic TLV.

Cc: stable@vger.kernel.org
Fixes: cb1353ef3473 ("wifi: mt76: mt7925: integrate *mlo_sta_cmd and *sta_cmd")
Reported-by: Tal Inbar <inbartdev@gmail.com>
Tested-by: Tal Inbar <inbartdev@gmail.com>
Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/mcu.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index 01fee93c0aa9..de8c88cb8081 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -2089,13 +2089,13 @@ mt7925_mcu_sta_eht_mld_tlv(struct sk_buff *skb,
 	struct tlv *tlv;
 	u16 eml_cap;
 
+	if (!ieee80211_vif_is_mld(vif))
+		return;
+
 	tlv = mt76_connac_mcu_add_tlv(skb, STA_REC_EHT_MLD, sizeof(*eht_mld));
 	eht_mld = (struct sta_rec_eht_mld *)tlv;
 	eht_mld->mld_type = 0xff;
 
-	if (!ieee80211_vif_is_mld(vif))
-		return;
-
 	ext_capa = cfg80211_get_iftype_ext_capa(wiphy,
 						ieee80211_vif_type_p2p(vif));
 	if (!ext_capa)
@@ -2167,6 +2167,7 @@ mt7925_mcu_sta_cmd(struct mt76_phy *phy,
 	struct mt76_dev *dev = phy->dev;
 	struct mt792x_bss_conf *mconf;
 	struct sk_buff *skb;
+	int conn_state;
 
 	mconf = mt792x_vif_to_link(mvif, info->wcid->link_id);
 
@@ -2175,10 +2176,13 @@ mt7925_mcu_sta_cmd(struct mt76_phy *phy,
 	if (IS_ERR(skb))
 		return PTR_ERR(skb);
 
+	conn_state = info->enable ? CONN_STATE_PORT_SECURE :
+				    CONN_STATE_DISCONNECT;
+
 	if (info->enable && info->link_sta) {
 		mt76_connac_mcu_sta_basic_tlv(dev, skb, info->link_conf,
 					      info->link_sta,
-					      info->enable, info->newly);
+					      conn_state, info->newly);
 		mt7925_mcu_sta_phy_tlv(skb, info->vif, info->link_sta);
 		mt7925_mcu_sta_ht_tlv(skb, info->link_sta);
 		mt7925_mcu_sta_vht_tlv(skb, info->link_sta);
-- 
2.34.1


