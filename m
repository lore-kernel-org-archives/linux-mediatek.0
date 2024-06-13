Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B074BC27C6E
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Jun 2024 03:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UGRn4/Wgu/vGKDWZbS0IzrBOwXTYDZC60PiS/4b5DP4=; b=T2B7NTkdakxUd4Sj9y05U/Wtpt
	NiAqcIGvVVbNelE3Z1DIi0iz1IYq59ZCLoMXqCe7fENsK4blUc9aK8qioEqB9QM5i8d9cIIDn+joF
	/r1e0T6eIWMcCYUIkekLn0bK9PjQ4FEDJzaeBBrUSmUfelkJqE5ih41VKPaFMK/dtrEbVi0AAEqVs
	04ftdLefqyBoCqkhztZUtt6p9qahNm3Yk/6S8lORnxMrFLMbPUaGbW+cnND7N6Q+Lj02UfLTBKe0N
	7qSrHBMO0JGy1dlj0WNQhf4mAMgvMK5Sotfo41XPRaeFVM22rGdDX45AraLwwOOZJ16gc5vOtkOk0
	/D8dkxag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHakV-0000000EvvS-0QxI;
	Thu, 13 Jun 2024 03:03:39 +0000
Received: from mail-oo1-f45.google.com ([209.85.161.45])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHakQ-0000000Evrm-3ipr
	for linux-mediatek@lists.infradead.org;
	Thu, 13 Jun 2024 03:03:37 +0000
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-5b99ba97d89so25552eaf.1
        for <linux-mediatek@lists.infradead.org>; Wed, 12 Jun 2024 20:03:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718247813; x=1718852613;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UGRn4/Wgu/vGKDWZbS0IzrBOwXTYDZC60PiS/4b5DP4=;
        b=n0CfJP/gHQfQwaAxJvticn7dY+bg6KtV0Psujo+7960f6Zp2eJArv/6y8pLqEk+kjA
         p7gt6rLW2n3uRVCzAwm3wcalJuqc9/xSbNPzINHhXTJJFz2Rf+NcAarv7mZaGDprxSxe
         QvEr9Qx2fYXv96qqj0P1cC/hkrlAj9Afnhjh8GUeZWyAtQ9NEtXSg2sTAPOs1QBSaDC0
         9N9ivfrSIHrjbl5viwypK9ZvSNmBmFgmUWmQ8yJ6TeNhViQZ8/ML2jx9YiKb34cd5f/t
         Y7FPv/Xozj/0rHwl74pGxOI3daUuZIVRt0jj4pyJ4i6DyyQ84Sq8PP7DaWAWe8IppW3+
         PMJw==
X-Forwarded-Encrypted: i=1; AJvYcCU/XKXJd+urKkpwzQOoxHNyk8nlSkzYSPAh5MFCRPCLqaKIDaHe1OL2UJs9ENBMYz2DpJS1fcIU18UJug5lh4Tbh0y8iSQ7oPHI+LDzCXJqkP84
X-Gm-Message-State: AOJu0YyGkHXOPbXnPY+DDO/Za76DRFve9jn37iUjxGOxEuMGmwh3DbSb
	HU3Tl4E6zI+z1YFTB7mbbaAsBDZ3giI5dBZa7hFYrQOqWuefQbxW
X-Google-Smtp-Source: AGHT+IGZZIXSuAtLjTNDDqH8OylfxsZpnDgIc8G0PeqfW+LZ2/hJmFbjT3WLNdavwiiSKTjmqDC1FA==
X-Received: by 2002:a05:6820:d88:b0:5ba:ead2:c742 with SMTP id 006d021491bc7-5bb3b7a3d2bmr3671924eaf.0.1718247813511;
        Wed, 12 Jun 2024 20:03:33 -0700 (PDT)
Received: from sean-ThinkPad-T450s.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5bd629263c5sm67685eaf.46.2024.06.12.20.03.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 20:03:31 -0700 (PDT)
From: sean.wang@kernel.org
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: sean.wang@mediatek.com,
	deren.wu@mediatek.com,
	mingyen.hsieh@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 22/47] wifi: mt76: mt7925: add mt7925_mcu_bss_rlm_tlv to constitue the RLM TLV
Date: Wed, 12 Jun 2024 20:02:16 -0700
Message-Id: <20240613030241.5771-23-sean.wang@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240613030241.5771-1-sean.wang@kernel.org>
References: <20240613030241.5771-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240612_200335_101522_A32B75B3 
X-CRM114-Status: GOOD (  14.73  )
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

From: Sean Wang <sean.wang@mediatek.com>

add mt7925_mcu_bss_rlm_tlv to maintain consistency with the other TLVs that
constitute the command for creating the per-link BSS.

Co-developed-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7925/mcu.c   | 64 +++++++++++++++++--
 .../net/wireless/mediatek/mt76/mt7925/mcu.h   | 16 +++++
 2 files changed, 74 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index 7624ec23e064..96b7a9df17d8 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -1921,6 +1921,59 @@ mt7925_mcu_uni_add_beacon_offload(struct mt792x_dev *dev,
 				 &req, sizeof(req), true);
 }
 
+static
+void mt7925_mcu_bss_rlm_tlv(struct sk_buff *skb, struct mt76_phy *phy,
+			    struct ieee80211_chanctx_conf *ctx)
+{
+	struct cfg80211_chan_def *chandef = ctx ? &ctx->def : &phy->chandef;
+	int freq1 = chandef->center_freq1, freq2 = chandef->center_freq2;
+	enum nl80211_band band = chandef->chan->band;
+	struct bss_rlm_tlv *req;
+	struct tlv *tlv;
+
+	tlv = mt76_connac_mcu_add_tlv(skb, UNI_BSS_INFO_RLM, sizeof(*req));
+	req = (struct bss_rlm_tlv *)tlv;
+	req->control_channel = chandef->chan->hw_value,
+	req->center_chan = ieee80211_frequency_to_channel(freq1),
+	req->center_chan2 = ieee80211_frequency_to_channel(freq2),
+	req->tx_streams = hweight8(phy->antenna_mask),
+	req->ht_op_info = 4, /* set HT 40M allowed */
+	req->rx_streams = hweight8(phy->antenna_mask),
+	req->band = band;
+
+	switch (chandef->width) {
+	case NL80211_CHAN_WIDTH_40:
+		req->bw = CMD_CBW_40MHZ;
+		break;
+	case NL80211_CHAN_WIDTH_80:
+		req->bw = CMD_CBW_80MHZ;
+		break;
+	case NL80211_CHAN_WIDTH_80P80:
+		req->bw = CMD_CBW_8080MHZ;
+		break;
+	case NL80211_CHAN_WIDTH_160:
+		req->bw = CMD_CBW_160MHZ;
+		break;
+	case NL80211_CHAN_WIDTH_5:
+		req->bw = CMD_CBW_5MHZ;
+		break;
+	case NL80211_CHAN_WIDTH_10:
+		req->bw = CMD_CBW_10MHZ;
+		break;
+	case NL80211_CHAN_WIDTH_20_NOHT:
+	case NL80211_CHAN_WIDTH_20:
+	default:
+		req->bw = CMD_CBW_20MHZ;
+		req->ht_op_info = 0;
+		break;
+	}
+
+	if (req->control_channel < req->center_chan)
+		req->sco = 1; /* SCA */
+	else if (req->control_channel > req->center_chan)
+		req->sco = 3; /* SCB */
+}
+
 int mt7925_mcu_set_chctx(struct mt76_phy *phy, struct mt76_vif *mvif,
 			 struct ieee80211_chanctx_conf *ctx)
 {
@@ -2326,9 +2379,10 @@ int mt7925_mcu_add_bss_info(struct mt792x_phy *phy,
 			    int enable)
 {
 	struct mt792x_vif *mvif = (struct mt792x_vif *)link_conf->vif->drv_priv;
+	struct mt792x_bss_conf *mconf = mt792x_vif_to_link(mvif,
+							   link_conf->link_id);
 	struct mt792x_dev *dev = phy->dev;
 	struct sk_buff *skb;
-	int err;
 
 	skb = __mt7925_mcu_alloc_bss_req(&dev->mt76, &mvif->bss_conf.mt76,
 					 MT7925_BSS_UPDATE_MAX_SIZE);
@@ -2350,12 +2404,10 @@ int mt7925_mcu_add_bss_info(struct mt792x_phy *phy,
 		mt7925_mcu_bss_color_tlv(skb, link_conf, enable);
 	}
 
-	err = mt76_mcu_skb_send_msg(&dev->mt76, skb,
-				    MCU_UNI_CMD(BSS_INFO_UPDATE), true);
-	if (err < 0)
-		return err;
+	mt7925_mcu_bss_rlm_tlv(skb, phy->mt76, mconf->mt76.ctx);
 
-	return mt7925_mcu_set_chctx(phy->mt76, &mvif->bss_conf.mt76, ctx);
+	return mt76_mcu_skb_send_msg(&dev->mt76, skb,
+				     MCU_UNI_CMD(BSS_INFO_UPDATE), true);
 }
 
 int mt7925_mcu_set_dbdc(struct mt76_phy *phy)
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.h b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.h
index d3584743c266..c5197577cdc8 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.h
@@ -456,6 +456,21 @@ struct bss_ifs_time_tlv {
 	__le16 eifs_cck_time;
 } __packed;
 
+struct bss_rlm_tlv {
+	__le16 tag;
+	__le16 len;
+	u8 control_channel;
+	u8 center_chan;
+	u8 center_chan2;
+	u8 bw;
+	u8 tx_streams;
+	u8 rx_streams;
+	u8 ht_op_info;
+	u8 sco;
+	u8 band;
+	u8 pad[3];
+} __packed;
+
 #define MT7925_STA_UPDATE_MAX_SIZE	(sizeof(struct sta_req_hdr) +		\
 					 sizeof(struct sta_rec_basic) +		\
 					 sizeof(struct sta_rec_bf) +		\
@@ -484,6 +499,7 @@ struct bss_ifs_time_tlv {
 					 sizeof(struct bss_info_uni_he) +		\
 					 sizeof(struct bss_info_uni_bss_color) +	\
 					 sizeof(struct bss_ifs_time_tlv) +		\
+					 sizeof(struct bss_rlm_tlv) +		\
 					 sizeof(struct tlv))
 
 #define MT_CONNAC3_SKU_POWER_LIMIT      449
-- 
2.34.1


