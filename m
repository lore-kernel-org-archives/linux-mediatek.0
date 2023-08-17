Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 718DCC2FC1C
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Aug 2023 08:02:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ud6IPe0NTEue6T8QSv+t8vOB+aNXxYWB2ZW4J6nU80g=; b=rdCn3iEvf3tow//QAPcv9KRIrE
	cGi/8EMQH4SRgM2UPqqMQA105/1niTt8n9YLWe3+eBdK8rxnMqZ1AdVozz9NrCJ91ULskLARb68ll
	Eh34XDKpYb6Ep4UXR31ooXzBruHMEa5o8fovkrTYiHBZUWwNzQSsBGCaN1WcqXIQA1NQStDLozWVy
	0eAaP7nEsGSjVvN16CAn+VPBPGRFLRRBo3zMhfXGYevX5uEC114m57392vH4ioojK0KTlBSznQ3BS
	cp1b6X5hcxNwc0SSQx7rsjOEQiqGQRkIBQXLjH3fGwP3o3mheBUvIYR8PO8OEQbo+ZEQ+6Kps1xeP
	x7EV7fPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWXxd-005mLf-2A;
	Thu, 17 Aug 2023 08:02:29 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWXxX-005mH6-2Z
	for linux-mediatek@lists.infradead.org;
	Thu, 17 Aug 2023 08:02:26 +0000
X-UUID: 6062e5ec3cd411ee83ed1395ce914268-20230817
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=Ud6IPe0NTEue6T8QSv+t8vOB+aNXxYWB2ZW4J6nU80g=;
	b=Tm5nnPcDGl1W6MdpBwwJyu456qDo7G10HjHY9nUzff1YPesrwNG4Fmd8Wi6xgLoS26I8Q9aVaLdWrmwJdNKOU5pqYRsMNquwBqMqdlsKKORvob/wePh6elNVnY0j7EyVierGfRGu+U1S4YxYXKmDMLI1UbfFpwN8kVmR2PakBUA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.31,REQID:b20f23a4-61da-4039-b67a-85c1b891d569,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:100
X-CID-INFO: VERSION:1.1.31,REQID:b20f23a4-61da-4039-b67a-85c1b891d569,IP:0,URL
	:0,TC:0,Content:0,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTIO
	N:quarantine,TS:100
X-CID-META: VersionHash:0ad78a4,CLOUDID:444ddf12-4929-4845-9571-38c601e9c3c9,B
	ulkID:230817160217RS87TT1W,BulkQuantity:0,Recheck:0,SF:19|48|29|28|17,TC:n
	il,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OS
	I:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_ASC,TF_CID_SPAM_FAS,TF_CID_SPAM_FSD,TF_CID_SPAM_SNR,
	TF_CID_SPAM_SDM
X-UUID: 6062e5ec3cd411ee83ed1395ce914268-20230817
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <shayne.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 375535797; Thu, 17 Aug 2023 01:02:14 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 17 Aug 2023 16:02:11 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 17 Aug 2023 16:02:11 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
	<lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, Bo Jiao <Bo.Jiao@mediatek.com>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Shayne Chen <shayne.chen@mediatek.com>
Subject: [PATCH 7/9] wifi: mt76: mt7996: only set vif teardown cmds at remove interface
Date: Thu, 17 Aug 2023 16:01:52 +0800
Message-ID: <20230817080154.16475-7-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230817080154.16475-1-shayne.chen@mediatek.com>
References: <20230817080154.16475-1-shayne.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230817_010223_848879_ABAEBDB7 
X-CRM114-Status: GOOD (  10.69  )
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

Only send commands that disable vif when removing interface, this
reduces some unnecessary bss_info and sta_rec commands, especially for
station interface.

Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7996/main.c  | 21 ++++++-------------
 1 file changed, 6 insertions(+), 15 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/main.c b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
index 600010cdb94e..6068e009c408 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/main.c
@@ -248,8 +248,8 @@ static void mt7996_remove_interface(struct ieee80211_hw *hw,
 	struct mt7996_phy *phy = mt7996_hw_phy(hw);
 	int idx = msta->wcid.idx;
 
-	mt7996_mcu_add_bss_info(phy, vif, false);
 	mt7996_mcu_add_sta(dev, vif, NULL, false);
+	mt7996_mcu_add_bss_info(phy, vif, false);
 
 	if (vif == phy->monitor_vif)
 		phy->monitor_vif = NULL;
@@ -570,17 +570,13 @@ static void mt7996_bss_info_changed(struct ieee80211_hw *hw,
 	/* station mode uses BSSID to map the wlan entry to a peer,
 	 * and then peer references bss_info_rfch to set bandwidth cap.
 	 */
-	if (changed & BSS_CHANGED_BSSID &&
-	    vif->type == NL80211_IFTYPE_STATION) {
-		bool join = !is_zero_ether_addr(info->bssid);
-
-		mt7996_mcu_add_bss_info(phy, vif, join);
-		mt7996_mcu_add_sta(dev, vif, NULL, join);
+	if ((changed & BSS_CHANGED_BSSID && !is_zero_ether_addr(info->bssid)) ||
+	    (changed & BSS_CHANGED_ASSOC && vif->cfg.assoc) ||
+	    (changed & BSS_CHANGED_BEACON_ENABLED && info->enable_beacon)) {
+		mt7996_mcu_add_bss_info(phy, vif, true);
+		mt7996_mcu_add_sta(dev, vif, NULL, true);
 	}
 
-	if (changed & BSS_CHANGED_ASSOC)
-		mt7996_mcu_add_bss_info(phy, vif, vif->cfg.assoc);
-
 	if (changed & BSS_CHANGED_ERP_CTS_PROT)
 		mt7996_mac_enable_rtscts(dev, vif, info->use_cts_prot);
 
@@ -601,11 +597,6 @@ static void mt7996_bss_info_changed(struct ieee80211_hw *hw,
 		mvif->basic_rates_idx =
 			mt7996_get_rates_table(hw, vif, false, false);
 
-	if (changed & BSS_CHANGED_BEACON_ENABLED && info->enable_beacon) {
-		mt7996_mcu_add_bss_info(phy, vif, true);
-		mt7996_mcu_add_sta(dev, vif, NULL, true);
-	}
-
 	/* ensure that enable txcmd_mode after bss_info */
 	if (changed & (BSS_CHANGED_QOS | BSS_CHANGED_BEACON_ENABLED))
 		mt7996_mcu_set_tx(dev, vif);
-- 
2.39.2


