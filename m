Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB021CE7A8C
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Sep 2023 08:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aJTpnXuNUyYxFQxaLTywEBmMeu5lkW5KD0n38e8Uv0I=; b=KyiQlTCt4NJIUnTYVl4ToQFj0Q
	+OkBYZWN4Wo7+bCcgYPQj4+aWSw7WbYKh6E/6FgOkS3+umS2Erbg1iqwEOzWZIzqOOQskK+F89mBI
	HnoRz4BgWoHcap4KJ76CcCMyPjN6I9cvAFlb05epAoa7jvMQ5wl0Wu6u//qYIYgF/ANWrxU5meLGO
	8bdtRebRNlFcQ9Lblx033+XMF/N3uzB/IwMGHpMu3YOlOwOcLD0YlE35TGEOZ95JqlR+yqUajgyMJ
	5DJtKUJ88jL5Xe3y6QFMXVErduyp5mhMDn70ppkhv3Xxatkm7dF0+CBLWPJFFzyzZmUKSZ/uuDFAn
	adTKwmqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qkggR-00DhfE-0C;
	Mon, 25 Sep 2023 08:11:11 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qkggM-00DhcZ-0j
	for linux-mediatek@lists.infradead.org;
	Mon, 25 Sep 2023 08:11:10 +0000
X-UUID: 0e26e8a85b7b11ee9b7791016c24628a-20230925
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=aJTpnXuNUyYxFQxaLTywEBmMeu5lkW5KD0n38e8Uv0I=;
	b=GRM+7aFHdSWRhXZEtbMnuYV2kGUuS1VOMUxH1xFafqTkmr3R4yT3xBi2JoexOXozG/8SieoOslpZf60ZSNySNoeJczRQU33OyBYxhPos/2W+d+b+p3RE2H3d2Mhd1LtV3bBUzZmFuefij0OFZltCi1VCg7UAYsaMcwmuPGLk1dU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.32,REQID:7c8955a6-7308-467e-8d72-2c492353c619,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:5f78ec9,CLOUDID:a8173dbf-14cc-44ca-b657-2d2783296e72,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,
	DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 0e26e8a85b7b11ee9b7791016c24628a-20230925
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <deren.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 748609793; Mon, 25 Sep 2023 01:10:57 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 25 Sep 2023 16:10:54 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 25 Sep 2023 16:10:54 +0800
From: Deren Wu <deren.wu@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>
CC: Sean Wang <sean.wang@mediatek.com>, Soul Huang <Soul.Huang@mediatek.com>,
	Ming Yen Hsieh <mingyen.hsieh@mediatek.com>, Leon Yen
	<Leon.Yen@mediatek.com>, Eric-SY Chang <Eric-SY.Chang@mediatek.com>, KM Lin
	<km.lin@mediatek.com>, Robin Chiu <robin.chiu@mediatek.com>, CH Yeh
	<ch.yeh@mediatek.com>, Posh Sun <posh.sun@mediatek.com>, Stella Chang
	<Stella.Chang@mediatek.com>, Quan Zhou <quan.zhou@mediatek.com>, Ryder Lee
	<ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>,
	linux-wireless <linux-wireless@vger.kernel.org>, linux-mediatek
	<linux-mediatek@lists.infradead.org>, Deren Wu <deren.wu@mediatek.com>
Subject: [PATCH 1/6] wifi: mt76: mt7921: move connac nic capability handling to mt7921
Date: Mon, 25 Sep 2023 16:10:33 +0800
Message-ID: <5d35532f0b8435f89d824cccedb2a62b75b8d149.1695627867.git.deren.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1695627867.git.deren.wu@mediatek.com>
References: <cover.1695627867.git.deren.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230925_011106_276554_94459296 
X-CRM114-Status: GOOD (  16.98  )
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

mt76_connac_mcu_get_nic_capability() is used by mt7921 only. It
would be better to put the code in chip folder. And we can provide
more chip capability information in mt792x_phy without making
mt76_phy much bigger.

The three functions would be moved to mt7921 folder and renamed.
mt76_connac_mcu_parse_tx_resource()
mt76_connac_mcu_parse_phy_cap()
mt76_connac_mcu_get_nic_capability()

Signed-off-by: Deren Wu <deren.wu@mediatek.com>
---
 .../wireless/mediatek/mt76/mt76_connac_mcu.c  | 120 -----------------
 .../wireless/mediatek/mt76/mt76_connac_mcu.h  |   1 -
 .../net/wireless/mediatek/mt76/mt7921/mcu.c   | 122 +++++++++++++++++-
 3 files changed, 121 insertions(+), 122 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
index bcd6c20f37ad..83cf2e2b2868 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
@@ -1941,126 +1941,6 @@ void mt76_connac_mcu_coredump_event(struct mt76_dev *dev, struct sk_buff *skb,
 }
 EXPORT_SYMBOL_GPL(mt76_connac_mcu_coredump_event);
 
-static void mt76_connac_mcu_parse_tx_resource(struct mt76_dev *dev,
-					      struct sk_buff *skb)
-{
-	struct mt76_sdio *sdio = &dev->sdio;
-	struct mt76_connac_tx_resource {
-		__le32 version;
-		__le32 pse_data_quota;
-		__le32 pse_mcu_quota;
-		__le32 ple_data_quota;
-		__le32 ple_mcu_quota;
-		__le16 pse_page_size;
-		__le16 ple_page_size;
-		u8 pp_padding;
-		u8 pad[3];
-	} __packed * tx_res;
-
-	tx_res = (struct mt76_connac_tx_resource *)skb->data;
-	sdio->sched.pse_data_quota = le32_to_cpu(tx_res->pse_data_quota);
-	sdio->sched.pse_mcu_quota = le32_to_cpu(tx_res->pse_mcu_quota);
-	sdio->sched.ple_data_quota = le32_to_cpu(tx_res->ple_data_quota);
-	sdio->sched.pse_page_size = le16_to_cpu(tx_res->pse_page_size);
-	sdio->sched.deficit = tx_res->pp_padding;
-}
-
-static void mt76_connac_mcu_parse_phy_cap(struct mt76_dev *dev,
-					  struct sk_buff *skb)
-{
-	struct mt76_connac_phy_cap {
-		u8 ht;
-		u8 vht;
-		u8 _5g;
-		u8 max_bw;
-		u8 nss;
-		u8 dbdc;
-		u8 tx_ldpc;
-		u8 rx_ldpc;
-		u8 tx_stbc;
-		u8 rx_stbc;
-		u8 hw_path;
-		u8 he;
-	} __packed * cap;
-
-	enum {
-		WF0_24G,
-		WF0_5G
-	};
-
-	cap = (struct mt76_connac_phy_cap *)skb->data;
-
-	dev->phy.antenna_mask = BIT(cap->nss) - 1;
-	dev->phy.chainmask = dev->phy.antenna_mask;
-	dev->phy.cap.has_2ghz = cap->hw_path & BIT(WF0_24G);
-	dev->phy.cap.has_5ghz = cap->hw_path & BIT(WF0_5G);
-}
-
-int mt76_connac_mcu_get_nic_capability(struct mt76_phy *phy)
-{
-	struct mt76_connac_cap_hdr {
-		__le16 n_element;
-		u8 rsv[2];
-	} __packed * hdr;
-	struct sk_buff *skb;
-	int ret, i;
-
-	ret = mt76_mcu_send_and_get_msg(phy->dev, MCU_CE_CMD(GET_NIC_CAPAB),
-					NULL, 0, true, &skb);
-	if (ret)
-		return ret;
-
-	hdr = (struct mt76_connac_cap_hdr *)skb->data;
-	if (skb->len < sizeof(*hdr)) {
-		ret = -EINVAL;
-		goto out;
-	}
-
-	skb_pull(skb, sizeof(*hdr));
-
-	for (i = 0; i < le16_to_cpu(hdr->n_element); i++) {
-		struct tlv_hdr {
-			__le32 type;
-			__le32 len;
-		} __packed * tlv = (struct tlv_hdr *)skb->data;
-		int len;
-
-		if (skb->len < sizeof(*tlv))
-			break;
-
-		skb_pull(skb, sizeof(*tlv));
-
-		len = le32_to_cpu(tlv->len);
-		if (skb->len < len)
-			break;
-
-		switch (le32_to_cpu(tlv->type)) {
-		case MT_NIC_CAP_6G:
-			phy->cap.has_6ghz = skb->data[0];
-			break;
-		case MT_NIC_CAP_MAC_ADDR:
-			memcpy(phy->macaddr, (void *)skb->data, ETH_ALEN);
-			break;
-		case MT_NIC_CAP_PHY:
-			mt76_connac_mcu_parse_phy_cap(phy->dev, skb);
-			break;
-		case MT_NIC_CAP_TX_RESOURCE:
-			if (mt76_is_sdio(phy->dev))
-				mt76_connac_mcu_parse_tx_resource(phy->dev,
-								  skb);
-			break;
-		default:
-			break;
-		}
-		skb_pull(skb, len);
-	}
-out:
-	dev_kfree_skb(skb);
-
-	return ret;
-}
-EXPORT_SYMBOL_GPL(mt76_connac_mcu_get_nic_capability);
-
 static void
 mt76_connac_mcu_build_sku(struct mt76_dev *dev, s8 *sku,
 			  struct mt76_power_limits *limits,
diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
index 9bc97a35fc1d..b73dbe1dbf3a 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.h
@@ -1881,7 +1881,6 @@ int mt76_connac_mcu_init_download(struct mt76_dev *dev, u32 addr, u32 len,
 int mt76_connac_mcu_start_patch(struct mt76_dev *dev);
 int mt76_connac_mcu_patch_sem_ctrl(struct mt76_dev *dev, bool get);
 int mt76_connac_mcu_start_firmware(struct mt76_dev *dev, u32 addr, u32 option);
-int mt76_connac_mcu_get_nic_capability(struct mt76_phy *phy);
 
 int mt76_connac_mcu_hw_scan(struct mt76_phy *phy, struct ieee80211_vif *vif,
 			    struct ieee80211_scan_request *scan_req);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
index 90c93970acab..8d9ebe34816a 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/mcu.c
@@ -448,6 +448,126 @@ static int mt7921_load_clc(struct mt792x_dev *dev, const char *fw_name)
 	return ret;
 }
 
+static void mt7921_mcu_parse_tx_resource(struct mt76_dev *dev,
+					 struct sk_buff *skb)
+{
+	struct mt76_sdio *sdio = &dev->sdio;
+	struct mt7921_tx_resource {
+		__le32 version;
+		__le32 pse_data_quota;
+		__le32 pse_mcu_quota;
+		__le32 ple_data_quota;
+		__le32 ple_mcu_quota;
+		__le16 pse_page_size;
+		__le16 ple_page_size;
+		u8 pp_padding;
+		u8 pad[3];
+	} __packed * tx_res;
+
+	tx_res = (struct mt7921_tx_resource *)skb->data;
+	sdio->sched.pse_data_quota = le32_to_cpu(tx_res->pse_data_quota);
+	sdio->sched.pse_mcu_quota = le32_to_cpu(tx_res->pse_mcu_quota);
+	sdio->sched.ple_data_quota = le32_to_cpu(tx_res->ple_data_quota);
+	sdio->sched.pse_page_size = le16_to_cpu(tx_res->pse_page_size);
+	sdio->sched.deficit = tx_res->pp_padding;
+}
+
+static void mt7921_mcu_parse_phy_cap(struct mt76_dev *dev,
+				     struct sk_buff *skb)
+{
+	struct mt7921_phy_cap {
+		u8 ht;
+		u8 vht;
+		u8 _5g;
+		u8 max_bw;
+		u8 nss;
+		u8 dbdc;
+		u8 tx_ldpc;
+		u8 rx_ldpc;
+		u8 tx_stbc;
+		u8 rx_stbc;
+		u8 hw_path;
+		u8 he;
+	} __packed * cap;
+
+	enum {
+		WF0_24G,
+		WF0_5G
+	};
+
+	cap = (struct mt7921_phy_cap *)skb->data;
+
+	dev->phy.antenna_mask = BIT(cap->nss) - 1;
+	dev->phy.chainmask = dev->phy.antenna_mask;
+	dev->phy.cap.has_2ghz = cap->hw_path & BIT(WF0_24G);
+	dev->phy.cap.has_5ghz = cap->hw_path & BIT(WF0_5G);
+}
+
+static int mt7921_mcu_get_nic_capability(struct mt792x_phy *mphy)
+{
+	struct mt76_connac_cap_hdr {
+		__le16 n_element;
+		u8 rsv[2];
+	} __packed * hdr;
+	struct sk_buff *skb;
+	struct mt76_phy *phy = mphy->mt76;
+	int ret, i;
+
+	ret = mt76_mcu_send_and_get_msg(phy->dev, MCU_CE_CMD(GET_NIC_CAPAB),
+					NULL, 0, true, &skb);
+	if (ret)
+		return ret;
+
+	hdr = (struct mt76_connac_cap_hdr *)skb->data;
+	if (skb->len < sizeof(*hdr)) {
+		ret = -EINVAL;
+		goto out;
+	}
+
+	skb_pull(skb, sizeof(*hdr));
+
+	for (i = 0; i < le16_to_cpu(hdr->n_element); i++) {
+		struct tlv_hdr {
+			__le32 type;
+			__le32 len;
+		} __packed * tlv = (struct tlv_hdr *)skb->data;
+		int len;
+
+		if (skb->len < sizeof(*tlv))
+			break;
+
+		skb_pull(skb, sizeof(*tlv));
+
+		len = le32_to_cpu(tlv->len);
+		if (skb->len < len)
+			break;
+
+		switch (le32_to_cpu(tlv->type)) {
+		case MT_NIC_CAP_6G:
+			phy->cap.has_6ghz = skb->data[0];
+			break;
+		case MT_NIC_CAP_MAC_ADDR:
+			memcpy(phy->macaddr, (void *)skb->data, ETH_ALEN);
+			break;
+		case MT_NIC_CAP_PHY:
+			mt7921_mcu_parse_phy_cap(phy->dev, skb);
+			break;
+		case MT_NIC_CAP_TX_RESOURCE:
+			if (mt76_is_sdio(phy->dev))
+				mt7921_mcu_parse_tx_resource(phy->dev,
+							     skb);
+			break;
+		default:
+			break;
+		}
+		skb_pull(skb, len);
+	}
+out:
+	dev_kfree_skb(skb);
+
+	return ret;
+}
+
 int mt7921_mcu_fw_log_2_host(struct mt792x_dev *dev, u8 ctrl)
 {
 	struct {
@@ -469,7 +589,7 @@ int mt7921_run_firmware(struct mt792x_dev *dev)
 	if (err)
 		return err;
 
-	err = mt76_connac_mcu_get_nic_capability(&dev->mphy);
+	err = mt7921_mcu_get_nic_capability(&dev->phy);
 	if (err)
 		return err;
 
-- 
2.18.0


