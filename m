Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0949E7719B
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Jan 2025 02:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9stJebzoNziG0WiLpxtOlGj1x2TuJPr5flN8guCLCsI=; b=DKSERDxHZsZ+mgQZ8EmYK3X7Aa
	EpU2pLqtHpULr7jGEW3qF/h6fsRfb+PnZmoKGbuQZ5UalvmXMqK7NtLG3U2T/RMzxsyTZRd+pgpku
	vEQWke3pENRt1C5fvlUEtnCHrLwYsDZYLV/ZUTnKsHffiK06DVbiNRKZDTLRyc9NdzYMcq2WXgtLJ
	MKku3DY/XTgZNkIlhiVpV7YxECZOAoWpJDHAdeQC1h7ZKf/nc1n1UalOZ7R/9ns+ZVRRiMPA5HtfG
	Ht/7QpSIgIYHYlLb5IZrMvFU3HmhrtJwPAo4IFpzmhSKINy/8h2fHGYwiHH5n2phiQXEnDhqhrpOX
	35Xs9wqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVLqy-00000006utw-2DXA;
	Wed, 08 Jan 2025 02:31:28 +0000
Received: from mail-oa1-f43.google.com ([209.85.160.43])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVLlC-00000006tKs-2JND
	for linux-mediatek@lists.infradead.org;
	Wed, 08 Jan 2025 02:25:31 +0000
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-29fb5257e05so5044818fac.0
        for <linux-mediatek@lists.infradead.org>; Tue, 07 Jan 2025 18:25:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736303129; x=1736907929;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9stJebzoNziG0WiLpxtOlGj1x2TuJPr5flN8guCLCsI=;
        b=FSww1dw18xfgb8dT55dHweS7wIs9HShUnbcKuMn5QJSPxc7di9Jo9LdDO3vcpL13A3
         RDBunNwLw/SgRcfzPbZ2LaFqKyaxSR38bTlKbQ77ztDrElQemj+DCpTK9yvZyesvwLmW
         ID/PYqKTeU6tNQqmoZF140GTJi5gZaFs+V6BQ8IMc2SW4uyyFy/htVZUWxEwOfIzmwbd
         4MWMWDCDPlVhkMMjpAD/qSXXajdheeCtT2Z6zcBlEGzA6lyE76n7GeERxj8u4sCySi8j
         +7Y4uXYhcSQwuqgCPPiM4uDO4BGuf+VgjeoEvxzGOpMpw0aU+cg6fkDrPArT9ZMVoLbB
         T9cg==
X-Forwarded-Encrypted: i=1; AJvYcCWP4sKvKaw1qYIceZAjDuvNxXk0y72BU2HTiz/Gd/DxTbBrXtSdr1nRiAY3P1i82aXrFTim/QOQQdOasR2CmQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwH1M7Qp68gpBu09Y9hJ4azHeM7YyGYiKwMktBS9roMA6vGv0+k
	WQMu65h5ml0aTDqAdhMzd5ec/Y5O0nXUCK3WcnNpKoEwuddEqE+T
X-Gm-Gg: ASbGncu4w5hs1z5ODugre85Cg1QFHhNo8Txm4sNWSrBomOQK5x1CPxM817RQDTXhVvO
	QbnCj4yalY1Bd+PTcnoCxvqSj4ZQHe10aud+P1QV4CLxmMTkL2RUOyxAD6PByLpL3CH+Pxoe0Mo
	rGOzI27yGpiKjGixpidxwpO5SOkqhPXXDyDY0qOa0+RitFl3EaX3IHmepWABKWIB/c0TjbAg826
	hLM/bq0iJKIvOwc5Vda/+crgHqXlRvQFrNQJdE0SDx3CtGt/+ckoSFJj7tEP3HsvYusfYTUXg==
X-Google-Smtp-Source: AGHT+IF7R/DBuJXSH1eYBsGIosh+Urgb9KslzXHh+w0QlXaYbxMxDbthj6GNEsubQTP51gSeFHxYOQ==
X-Received: by 2002:a05:6870:9c83:b0:259:88b4:976 with SMTP id 586e51a60fabf-2aa069c9598mr557803fac.43.1736303129588;
        Tue, 07 Jan 2025 18:25:29 -0800 (PST)
Received: from sean-ThinkPad-T450s.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2a7d77f6340sm13072862fac.48.2025.01.07.18.25.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 18:25:28 -0800 (PST)
From: sean.wang@kernel.org
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: sean.wang@mediatek.com,
	deren.wu@mediatek.com,
	mingyen.hsieh@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 5/6] wifi: mt76: mt7925: integrate *mlo_sta_cmd and *sta_cmd
Date: Tue,  7 Jan 2025 18:25:08 -0800
Message-Id: <20250108022509.217803-5-sean.wang@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250108022509.217803-1-sean.wang@kernel.org>
References: <20250108022509.217803-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_182530_599742_D3D19F14 
X-CRM114-Status: GOOD (  11.15  )
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

Integrate *mlo_sta_cmd and *sta_cmd for the MLO firmware.

Fixes: 86c051f2c418 ("wifi: mt76: mt7925: enabling MLO when the firmware supports it")
Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7925/mcu.c   | 64 ++-----------------
 1 file changed, 4 insertions(+), 60 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index ad6174c07fe5..2fb8a6a7d252 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -1771,49 +1771,6 @@ mt7925_mcu_sta_mld_tlv(struct sk_buff *skb,
 	}
 }
 
-static int
-mt7925_mcu_sta_cmd(struct mt76_phy *phy,
-		   struct mt76_sta_cmd_info *info)
-{
-	struct mt76_vif *mvif = (struct mt76_vif *)info->vif->drv_priv;
-	struct mt76_dev *dev = phy->dev;
-	struct sk_buff *skb;
-	int conn_state;
-
-	skb = __mt76_connac_mcu_alloc_sta_req(dev, mvif, info->wcid,
-					      MT7925_STA_UPDATE_MAX_SIZE);
-	if (IS_ERR(skb))
-		return PTR_ERR(skb);
-
-	conn_state = info->enable ? CONN_STATE_PORT_SECURE :
-				    CONN_STATE_DISCONNECT;
-	if (info->link_sta)
-		mt76_connac_mcu_sta_basic_tlv(dev, skb, info->vif,
-					      info->link_sta,
-					      conn_state, info->newly);
-	if (info->link_sta && info->enable) {
-		mt7925_mcu_sta_phy_tlv(skb, info->vif, info->link_sta);
-		mt7925_mcu_sta_ht_tlv(skb, info->link_sta);
-		mt7925_mcu_sta_vht_tlv(skb, info->link_sta);
-		mt76_connac_mcu_sta_uapsd(skb, info->vif, info->link_sta->sta);
-		mt7925_mcu_sta_amsdu_tlv(skb, info->vif, info->link_sta);
-		mt7925_mcu_sta_he_tlv(skb, info->link_sta);
-		mt7925_mcu_sta_he_6g_tlv(skb, info->link_sta);
-		mt7925_mcu_sta_eht_tlv(skb, info->link_sta);
-		mt7925_mcu_sta_rate_ctrl_tlv(skb, info->vif,
-					     info->link_sta);
-		mt7925_mcu_sta_state_v2_tlv(phy, skb, info->link_sta,
-					    info->vif, info->rcpi,
-					    info->state);
-		mt7925_mcu_sta_mld_tlv(skb, info->vif, info->link_sta->sta);
-	}
-
-	if (info->enable)
-		mt7925_mcu_sta_hdr_trans_tlv(skb, info->vif, info->link_sta);
-
-	return mt76_mcu_skb_send_msg(dev, skb, info->cmd, true);
-}
-
 static void
 mt7925_mcu_sta_remove_tlv(struct sk_buff *skb)
 {
@@ -1826,8 +1783,8 @@ mt7925_mcu_sta_remove_tlv(struct sk_buff *skb)
 }
 
 static int
-mt7925_mcu_mlo_sta_cmd(struct mt76_phy *phy,
-		       struct mt76_sta_cmd_info *info)
+mt7925_mcu_sta_cmd(struct mt76_phy *phy,
+		  struct mt76_sta_cmd_info *info)
 {
 	struct mt792x_vif *mvif = (struct mt792x_vif *)info->vif->drv_priv;
 	struct mt76_dev *dev = phy->dev;
@@ -1841,12 +1798,10 @@ mt7925_mcu_mlo_sta_cmd(struct mt76_phy *phy,
 	if (IS_ERR(skb))
 		return PTR_ERR(skb);
 
-	if (info->enable)
+	if (info->enable && info->link_sta) {
 		mt76_connac_mcu_sta_basic_tlv(dev, skb, info->vif,
 					      info->link_sta,
 					      info->enable, info->newly);
-
-	if (info->enable && info->link_sta) {
 		mt7925_mcu_sta_phy_tlv(skb, info->vif, info->link_sta);
 		mt7925_mcu_sta_ht_tlv(skb, info->link_sta);
 		mt7925_mcu_sta_vht_tlv(skb, info->link_sta);
@@ -1896,7 +1851,6 @@ int mt7925_mcu_sta_update(struct mt792x_dev *dev,
 	};
 	struct mt792x_sta *msta;
 	struct mt792x_link_sta *mlink;
-	int err;
 
 	if (link_sta) {
 		msta = (struct mt792x_sta *)link_sta->sta->drv_priv;
@@ -1904,17 +1858,7 @@ int mt7925_mcu_sta_update(struct mt792x_dev *dev,
 	}
 	info.wcid = link_sta ? &mlink->wcid : &mvif->sta.deflink.wcid;
 
-	if (link_sta)
-		info.newly = state != MT76_STA_INFO_STATE_ASSOC;
-	else
-		info.newly = state == MT76_STA_INFO_STATE_ASSOC ? false : true;
-
-	if (ieee80211_vif_is_mld(vif))
-		err = mt7925_mcu_mlo_sta_cmd(&dev->mphy, &info);
-	else
-		err = mt7925_mcu_sta_cmd(&dev->mphy, &info);
-
-	return err;
+	return mt7925_mcu_sta_cmd(&dev->mphy, &info);
 }
 
 int mt7925_mcu_set_beacon_filter(struct mt792x_dev *dev,
-- 
2.25.1


