Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 423FEF5141C
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Mar 2026 23:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FI6lFbqNcjlnv2/DDmdSeyH5dGNHoKeIYxDgvbGzpSI=; b=CeA/pypAB+uRuEH5wDV9ud+v/u
	ibRow1CIv2A8CYFwUvKK95+iHfwm2InyLhh9pF5rvvygFB8t2NDlM7j5DyOXfjiIlMCNkKG8ZG4KK
	7gQOdX3I6K5YRBxJP08OdfZMw0aoGIzWbMs0/jK6c1c0au62BYQP+hIeHz/LMG1Y8lt0z/lV8d8pT
	3TD8MlBXMBsghJOjWT+gUuhLLinyXk6ZSb2RV/ngYG/qRS07m7u5EoWzJ0Uo5huBys09R+8XbBBDR
	ANSQnFqvkzG2qhTMeMxOaMPog3f1cDo+Pj2NTgldURpTj4c08kYG9n0AU49UonneWiPSK5CfS0UXs
	0Ag6gEyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyeVs-00000004dRL-1Z5E;
	Fri, 06 Mar 2026 23:23:20 +0000
Received: from mail-oa1-f41.google.com ([209.85.160.41])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyeVn-00000004dQW-12GE
	for linux-mediatek@lists.infradead.org;
	Fri, 06 Mar 2026 23:23:18 +0000
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-4042905015cso3005797fac.0
        for <linux-mediatek@lists.infradead.org>; Fri, 06 Mar 2026 15:23:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772839394; x=1773444194;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FI6lFbqNcjlnv2/DDmdSeyH5dGNHoKeIYxDgvbGzpSI=;
        b=exZPFQceY9Zpi4+HM0U7UhRTl6sZx+y2q+EOR+v73+dhAiXtIRHSMPpS4sJ9sPAeCA
         c3Xut3Vmn1ClopAt3VvQDe6nqsNlmpuZK25mqmEOHc+zeDRWTTg9xn9WCPZ0MyKkjRoR
         rN66rkc1jN8zQbVH6VKWaS/EkUzJi4Eh4dVXUImTrqEw0i3wYeg/rd+L4y2U80IVlz17
         2F+jgJ64GiqBa+frxBiaEhrr0KLr021lDN0OY19TgEhm0WE6CIePn+smZJgKBUbQig1Y
         vUkPM3HK3Hecui6EgRKQQ9RtfOXiqRSvVQrFvkqPtDrueG2Tj6bjHSOVFWFIRmP5/Ewc
         OvAQ==
X-Forwarded-Encrypted: i=1; AJvYcCUPG3ios+HeaDtpMwStDeJgHry1goAoJWozpD8MlDZurfCPgMTelKMKgpr1yvgUE9YpnHYJdySadHI7iWqLZA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxrjG8zJj7V+lW8kOMEHXLl0Aiein/IPberWCYi/Zq6RSlXAp8d
	gnOucZPGjgDU+I/UdoK101kav70Vffl9bgbYnKd/70fM50NUdrQFxnv8
X-Gm-Gg: ATEYQzxay+Bz5e1IOB3X51SwlnwLw+6fjI2H26dx748+XkSb2VpRs0+STa7S9ESkIG1
	Cew5K5NovdIBFyCyMEowA0ql6PjuhFLq/o/Z9qFK2fjXEmmZ2523RqLd371KTEpcZy+HAG2x5vq
	dc3x7t34kee30aEtE6V+H1Y6J7xiz1afzO+PjQfDltiF4gLkz9/JjHGQ0mf8aXT+GQcok3eV+QQ
	a1uTXmbhboMy83KqOsnQ0SBMN8Yr69sVhSz9Nembwx09mV1SjgKKoF09KPOmshtbgodoYkItzqy
	8dbxD2ti9Bqop3JP9DQXziDUmKAOtYfKKzja9zQAQZQm8928aJMKNX4t+x709fNvMDpdM88KsMA
	ysTuy3WWgLjOY47dtL9oTzUHBl7aRt6xiWGF+bVg8fJNo8/bPOoPS2YqoOT8q8MIl1nYfUOJ9t8
	eOttVm568mdjbCJrMsLYeA9govNYfuIHK+D5CVv84QiL1iXYU=
X-Received: by 2002:a05:6870:a919:b0:3ff:4ab4:774c with SMTP id 586e51a60fabf-416e4448983mr2367273fac.43.1772839394133;
        Fri, 06 Mar 2026 15:23:14 -0800 (PST)
Received: from sean-HP-EliteBook-830-G6.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-416e65b1c82sm2572344fac.5.2026.03.06.15.23.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 15:23:13 -0800 (PST)
From: Sean Wang <sean.wang@kernel.org>
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH 01/19] wifi: mt76: mt7925: pass mlink to sta_amsdu_tlv()
Date: Fri,  6 Mar 2026 17:22:20 -0600
Message-ID: <20260306232238.2039675-2-sean.wang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260306232238.2039675-1-sean.wang@kernel.org>
References: <20260306232238.2039675-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_152315_290211_332BA78D 
X-CRM114-Status: UNSURE (   9.51  )
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

From: Sean Wang <sean.wang@mediatek.com>

Drop the mt792x_sta_to_link() lookup in mt7925_mcu_sta_amsdu_tlv() and
pass mlink from the caller instead. The link context is already known
so the lookup is redundant.

This makes link ownership explicit and keeps the helper lookup-free.

No functional change intended.

Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/mcu.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index abcdd0e0b3b5..fa5f79004a6e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -1726,10 +1726,9 @@ mt7925_mcu_sta_vht_tlv(struct sk_buff *skb, struct ieee80211_link_sta *link_sta)
 static void
 mt7925_mcu_sta_amsdu_tlv(struct sk_buff *skb,
 			 struct ieee80211_vif *vif,
-			 struct ieee80211_link_sta *link_sta)
+			 struct ieee80211_link_sta *link_sta,
+			 struct mt792x_link_sta *mlink)
 {
-	struct mt792x_sta *msta = (struct mt792x_sta *)link_sta->sta->drv_priv;
-	struct mt792x_link_sta *mlink;
 	struct sta_rec_amsdu *amsdu;
 	struct tlv *tlv;
 
@@ -1745,7 +1744,6 @@ mt7925_mcu_sta_amsdu_tlv(struct sk_buff *skb,
 	amsdu->max_amsdu_num = 8;
 	amsdu->amsdu_en = true;
 
-	mlink = mt792x_sta_to_link(msta, link_sta->link_id);
 	mlink->wcid.amsdu = true;
 
 	switch (link_sta->agg.max_amsdu_len) {
@@ -1966,6 +1964,7 @@ mt7925_mcu_sta_cmd(struct mt76_phy *phy,
 	struct mt792x_vif *mvif = (struct mt792x_vif *)info->vif->drv_priv;
 	struct mt76_dev *dev = phy->dev;
 	struct mt792x_bss_conf *mconf;
+	struct mt792x_link_sta *mlink;
 	struct sk_buff *skb;
 	int conn_state;
 
@@ -1980,6 +1979,8 @@ mt7925_mcu_sta_cmd(struct mt76_phy *phy,
 				    CONN_STATE_DISCONNECT;
 
 	if (info->enable && info->link_sta) {
+		mlink = container_of(info->wcid, struct mt792x_link_sta, wcid);
+
 		mt76_connac_mcu_sta_basic_tlv(dev, skb, info->link_conf,
 					      info->link_sta,
 					      conn_state, info->newly);
@@ -1987,7 +1988,7 @@ mt7925_mcu_sta_cmd(struct mt76_phy *phy,
 		mt7925_mcu_sta_ht_tlv(skb, info->link_sta);
 		mt7925_mcu_sta_vht_tlv(skb, info->link_sta);
 		mt76_connac_mcu_sta_uapsd(skb, info->vif, info->link_sta->sta);
-		mt7925_mcu_sta_amsdu_tlv(skb, info->vif, info->link_sta);
+		mt7925_mcu_sta_amsdu_tlv(skb, info->vif, info->link_sta, mlink);
 		mt7925_mcu_sta_he_tlv(skb, info->link_sta);
 		mt7925_mcu_sta_he_6g_tlv(skb, info->link_sta);
 		mt7925_mcu_sta_eht_tlv(skb, info->link_sta);
-- 
2.43.0


