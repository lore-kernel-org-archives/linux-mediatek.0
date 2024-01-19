Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEC56C47DB7
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Jan 2024 08:57:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=79BOp+QHnp/WxXVwhfhRQ9gIIlNiACRXFjaRcN9R2c8=; b=3JDN6RX0vM/y29qeI7E5r5qTbP
	2zjtSAcvPT5agz5/60CxcevLT6TaLBY5bQiHbJ6z0lbR9TbanAA3YeyCYA+UaKfSp9wGplGhSs9zO
	bwaoQlF2SaL01O/HZsmFSTvc1gRUWYl3BN8vIaB9BitewbDKORCwszQjwUwZgH5s7bHRVmZAPO2lE
	IxdOvACVrwqaZ41mAq881YJ4RNYdAFwNaiqmHega1tCKWculy5ne9h64ictzZVsurk+H9keuaonOo
	8uRrrrBnl7aN9z2vDBfUqJkKPO8GvxmGP8QG0onx/Pz3CveYHLsocGiLMpMcxrpC4V7qzFib+Ylsi
	74MWVLmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQkhC-004uC8-1w;
	Fri, 19 Jan 2024 08:57:50 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQkh8-004u9H-2f
	for linux-mediatek@lists.infradead.org;
	Fri, 19 Jan 2024 08:57:49 +0000
X-UUID: cbee811ab6a811eea0bf134e88e6c2dc-20240119
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=79BOp+QHnp/WxXVwhfhRQ9gIIlNiACRXFjaRcN9R2c8=;
	b=Y8qwCwFcIrdt+eQTftQPPMjWGdih6qDMcBE11VXo7CBWaAcu0brz5hBBC7pharLvSAn92gvAzMe3NVUI7yMsAsMjOazOG/znX7sx3PtT5F5Yb5y938rUbLAiolunKC/ODB3WvK/xIATSLB2whaPUiQoCFL75lBSkgsTU/GCO2Ys=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.36,REQID:9640c18c-1176-4bfc-a63d-efa66b79dd96,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:6e16cf4,CLOUDID:5bbd582f-1ab8-4133-9780-81938111c800,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: cbee811ab6a811eea0bf134e88e6c2dc-20240119
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <shayne.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1229494038; Fri, 19 Jan 2024 01:57:38 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 19 Jan 2024 16:57:36 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 19 Jan 2024 16:57:36 +0800
From: Shayne Chen <shayne.chen@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>
CC: linux-wireless <linux-wireless@vger.kernel.org>, Lorenzo Bianconi
	<lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, Evelyn Tsai
	<evelyn.tsai@mediatek.com>, Bo Jiao <Bo.Jiao@mediatek.com>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Benjamin Lin
	<benjamin-jw.lin@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>
Subject: [PATCH 05/12] wifi: mt76: mt7996: ensure 4-byte alignment for beacon commands
Date: Fri, 19 Jan 2024 16:57:01 +0800
Message-ID: <20240119085708.23592-5-shayne.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240119085708.23592-1-shayne.chen@mediatek.com>
References: <20240119085708.23592-1-shayne.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--7.804500-8.000000
X-TMASE-MatchedRID: Zok17GuDVgvTm7y7XCZFTx+WEMjoO9WWVBDQSDMig9HRLEyE6G4DRFox
	ssqv49ULvvJoxo0uTMRllySiYBqj+uhKL24lXrDJnu1HSadECDWH7D1bP/FcOpp5yGjWmTixpc2
	xgJAY6Lq463ONS2fYMqwnY0RVRjvrHxPMjOKY7A8LbigRnpKlKTpcQTtiHDgWGdlMygVSuKdKFh
	SceqvE0Zr5KEpDlo92xdYxpLkQ//+0nTThA/TZTg==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--7.804500-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 4BAEB2BEE94BDFD346D406AC53E4F62A38E620559B6013BE1A6E31E033C927162000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240119_005746_884139_7923CDF1 
X-CRM114-Status: GOOD (  11.74  )
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

If TLV includes beacon content, its length might not be 4-byte aligned.
Make sure the length is aligned before sending beacon commands to FW.

Signed-off-by: Benjamin Lin <benjamin-jw.lin@mediatek.com>
Signed-off-by: Shayne Chen <shayne.chen@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7996/mcu.c | 14 +++++---------
 drivers/net/wireless/mediatek/mt76/mt7996/mcu.h |  4 ++--
 2 files changed, 7 insertions(+), 11 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
index 02d858fdc9fe..55512e62f98b 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.c
@@ -732,13 +732,10 @@ void mt7996_mcu_rx_event(struct mt7996_dev *dev, struct sk_buff *skb)
 static struct tlv *
 mt7996_mcu_add_uni_tlv(struct sk_buff *skb, u16 tag, u16 len)
 {
-	struct tlv *ptlv, tlv = {
-		.tag = cpu_to_le16(tag),
-		.len = cpu_to_le16(len),
-	};
+	struct tlv *ptlv = skb_put(skb, len);
 
-	ptlv = skb_put(skb, len);
-	memcpy(ptlv, &tlv, sizeof(tlv));
+	ptlv->tag = cpu_to_le16(tag);
+	ptlv->len = cpu_to_le16(len);
 
 	return ptlv;
 }
@@ -2522,7 +2519,7 @@ int mt7996_mcu_add_beacon(struct ieee80211_hw *hw,
 	info = IEEE80211_SKB_CB(skb);
 	info->hw_queue |= FIELD_PREP(MT_TX_HW_QUEUE_PHY, phy->mt76->band_idx);
 
-	len = sizeof(*bcn) + MT_TXD_SIZE + skb->len;
+	len = ALIGN(sizeof(*bcn) + MT_TXD_SIZE + skb->len, 4);
 	tlv = mt7996_mcu_add_uni_tlv(rskb, UNI_BSS_INFO_BCN_CONTENT, len);
 	bcn = (struct bss_bcn_content_tlv *)tlv;
 	bcn->enable = en;
@@ -2591,8 +2588,7 @@ int mt7996_mcu_beacon_inband_discov(struct mt7996_dev *dev,
 	info->band = band;
 	info->hw_queue |= FIELD_PREP(MT_TX_HW_QUEUE_PHY, phy->mt76->band_idx);
 
-	len = sizeof(*discov) + MT_TXD_SIZE + skb->len;
-
+	len = ALIGN(sizeof(*discov) + MT_TXD_SIZE + skb->len, 4);
 	tlv = mt7996_mcu_add_uni_tlv(rskb, UNI_BSS_INFO_OFFLOAD, len);
 
 	discov = (struct bss_inband_discovery_tlv *)tlv;
diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.h b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.h
index 36cacc495c75..43468bcaffc6 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mcu.h
@@ -800,10 +800,10 @@ enum {
 					 sizeof(struct sta_rec_hdr_trans) +	\
 					 sizeof(struct tlv))
 
-#define MT7996_MAX_BEACON_SIZE		1342
+#define MT7996_MAX_BEACON_SIZE		1338
 #define MT7996_BEACON_UPDATE_SIZE	(sizeof(struct bss_req_hdr) +		\
 					 sizeof(struct bss_bcn_content_tlv) +	\
-					 MT_TXD_SIZE +				\
+					 4 + MT_TXD_SIZE +			\
 					 sizeof(struct bss_bcn_cntdwn_tlv) +	\
 					 sizeof(struct bss_bcn_mbss_tlv))
 #define MT7996_MAX_BSS_OFFLOAD_SIZE	(MT7996_MAX_BEACON_SIZE +		\
-- 
2.39.2


