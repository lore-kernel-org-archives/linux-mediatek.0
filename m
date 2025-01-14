Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3957C02186
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Jan 2025 02:08:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IFXCH5TGHGDDGFUTwj/Hv5bd0CEyH7LmcN4nsFXhtFk=; b=VQwens93gVXeKBsCGxU4gZrsKf
	dqKbqe8HAPG1ngnBUGyB6A6jrk1bNt5mwrvDEgPbpTIJZFYpW1I5GGPEcBVG1qsLdT2F9GaD98irK
	4IN+x63UOFULvklajC+ARrAvYhONFaJFC9HRUFyKdBewICuH9Vw9jMSvVumb7hI+4K0tmv9OIaGuk
	uzcBO9qIXPdBsK6dH89wk3kn6xgTHPjyxor4lITL8c4vnMdWh/Fp5h/NbS1PxYy/BEVZdLnlVE2ZX
	QNturgaz2W/t0DQ09bWnEGINfk/bzJMc6yAsg1QCJXq2v2k8YruYqC7VIrWQZ4IJHs49YXHVeucw5
	aZy1WwaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXWLh-00000007D3z-44M1;
	Tue, 14 Jan 2025 02:08:09 +0000
Received: from mail-oo1-f41.google.com ([209.85.161.41])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXWL5-00000007Czj-1wZ9
	for linux-mediatek@lists.infradead.org;
	Tue, 14 Jan 2025 02:07:32 +0000
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-5f31841c6f6so2350835eaf.0
        for <linux-mediatek@lists.infradead.org>; Mon, 13 Jan 2025 18:07:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736820451; x=1737425251;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IFXCH5TGHGDDGFUTwj/Hv5bd0CEyH7LmcN4nsFXhtFk=;
        b=MmOsN5un7HTjvMqOYgzO6lbmT9S/RJQ0xXCm0dpb2ryzeuWVOlIVyK35ITdu7iZCSb
         59sA3ko/36ZDbyojIw5Q/qjwqY0q9DVkhdmP4hgUCrQAbIjFpEGSdXtrlBKzoad0zRQD
         N8Ze0O3qc64UFzA/KQ/EqvAk8KIwNK8Y8ZL7GaBuG53uDQD20at1pb8lRWVf3aoTGQ/Q
         o+egASjZmuIp0V3Eu1ORsC/JWdRbczb6sIqFB9lp1UrQCdh65+hHvSvMdP5QBDYM9lF7
         jdDPfvXWX7ZY1f85u2SzCKzFSkuKj4ZRsF05NppDRmNuzEqOfCKXMuQeJa449qUuF4FZ
         3t3A==
X-Forwarded-Encrypted: i=1; AJvYcCWdbPcDXHxu9sjMU3ng/Oj9ERFS2aq6tStxCawEs58r6kuHnBaXqwYyKIn+5wWuv5ZIsIpe+8SO/7/jK177zg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxlnJbBz9Kg78oepK+AtmpDYU3mUTW2NGHJKO84j4pi3znsY/E8
	bRMHfIUlCU20JVhxgoMA48oaHo32EZ9oScGe+NH8GzEpjE6RVpS1wbB2KBAU
X-Gm-Gg: ASbGnctnmhHrwY8F/hehYbcz0iDQI8eT45tuwc608UZiMglLG5VIL6keKTKvFS5sNvl
	bMcD3w1hM3WHrqjpSODsF+sGknpeRvialp2DordoqoKW29mWuNRDvABi6vxzgoPqyWnicXrjr4G
	n1Txrq6uhR1HK29yI8EIcccFsfUToEx26A5rUcQEcgkQntTVafWebIRnJtkqUedjTe5x1U78zYX
	6IxpqIzsmEVQ0OpZodD+BKaMvQGyMsg2x1fMMHnmVfWlZ5winCHOxo8j0uySQ2EVYnIoB3A1Q==
X-Google-Smtp-Source: AGHT+IHyBRGCjRrWK9gKiZPubfswmZcfYLk4XED6ZZc435DX/3BAuAAebMsGzbgjSLwJ+fCyZrcXjw==
X-Received: by 2002:a05:6820:1b0d:b0:5f8:8917:b6fc with SMTP id 006d021491bc7-5f88917b7e3mr10727061eaf.1.1736820450742;
        Mon, 13 Jan 2025 18:07:30 -0800 (PST)
Received: from sean-ThinkPad-T450s.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5f882755172sm3915340eaf.27.2025.01.13.18.07.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 18:07:29 -0800 (PST)
From: sean.wang@kernel.org
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: sean.wang@mediatek.com,
	deren.wu@mediatek.com,
	mingyen.hsieh@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 5/6] wifi: mt76: mt7925: integrate *mlo_sta_cmd and *sta_cmd
Date: Mon, 13 Jan 2025 18:07:11 -0800
Message-Id: <20250114020712.704254-5-sean.wang@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250114020712.704254-1-sean.wang@kernel.org>
References: <20250114020712.704254-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_180731_500994_ADD9575A 
X-CRM114-Status: GOOD (  11.22  )
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
igned-off-by: Sean Wang <sean.wang@mediatek.com>
---
v2: generate the patch based on the latest mt76 tree
---
 .../net/wireless/mediatek/mt76/mt7925/mcu.c   | 64 ++-----------------
 1 file changed, 4 insertions(+), 60 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index d1506ee977a4..38a29a1a1a66 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -1818,49 +1818,6 @@ mt7925_mcu_sta_mld_tlv(struct sk_buff *skb,
 	}
 }
 
-static int
-mt7925_mcu_sta_cmd(struct mt76_phy *phy,
-		   struct mt76_sta_cmd_info *info)
-{
-	struct mt76_vif_link *mvif = (struct mt76_vif_link *)info->vif->drv_priv;
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
-		mt76_connac_mcu_sta_basic_tlv(dev, skb, info->link_conf,
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
@@ -1873,8 +1830,8 @@ mt7925_mcu_sta_remove_tlv(struct sk_buff *skb)
 }
 
 static int
-mt7925_mcu_mlo_sta_cmd(struct mt76_phy *phy,
-		       struct mt76_sta_cmd_info *info)
+mt7925_mcu_sta_cmd(struct mt76_phy *phy,
+		   struct mt76_sta_cmd_info *info)
 {
 	struct mt792x_vif *mvif = (struct mt792x_vif *)info->vif->drv_priv;
 	struct mt76_dev *dev = phy->dev;
@@ -1888,12 +1845,10 @@ mt7925_mcu_mlo_sta_cmd(struct mt76_phy *phy,
 	if (IS_ERR(skb))
 		return PTR_ERR(skb);
 
-	if (info->enable)
+	if (info->enable && info->link_sta) {
 		mt76_connac_mcu_sta_basic_tlv(dev, skb, info->link_conf,
 					      info->link_sta,
 					      info->enable, info->newly);
-
-	if (info->enable && info->link_sta) {
 		mt7925_mcu_sta_phy_tlv(skb, info->vif, info->link_sta);
 		mt7925_mcu_sta_ht_tlv(skb, info->link_sta);
 		mt7925_mcu_sta_vht_tlv(skb, info->link_sta);
@@ -1944,7 +1899,6 @@ int mt7925_mcu_sta_update(struct mt792x_dev *dev,
 	};
 	struct mt792x_sta *msta;
 	struct mt792x_link_sta *mlink;
-	int err;
 
 	if (link_sta) {
 		msta = (struct mt792x_sta *)link_sta->sta->drv_priv;
@@ -1952,17 +1906,7 @@ int mt7925_mcu_sta_update(struct mt792x_dev *dev,
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


