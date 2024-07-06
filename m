Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66A3FC2BD09
	for <linux-mediatek@archiver.kernel.org>; Sat,  6 Jul 2024 08:29:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0SdoXLXIu+HvSjVwv2ngUt5gbyZnRN7Gqj36N7mgsJo=; b=mxI8bpqIhdUpJ0LjQ5s+YSI0Xs
	MSUq0xk/gAsUJwZIANgCpriYGjpcEaA7D0o3C9GNSaezqQQvES8P4eiGJrWj+z+ICxKpd44gJGTSo
	JFUMGyeILToUe1siboo1dmYCUjDAdelTXXE8IMIVPM6JTFNfH8Qm39sWWqilofttny4Lj2K1LVoFA
	Dj80AW+6ITg0Vljq3Bt7qJnecaRYPL+lY+SBc2PERY2x5YkHLBtg6XVb4cHQIU7L7bbS9Xu8Euu6g
	LIhxiCNpoJRulQZvxWvaeIsg7yArRuJuH+JvbLHtzEyDGEYkelXzj29yAYOOpT0bk9SiDuNP9pzjB
	Z+J8cxbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQ0nB-0000000HYBz-0GX1;
	Sat, 06 Jul 2024 08:29:13 +0000
Received: from mail-oo1-f53.google.com ([209.85.161.53])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQ0n7-0000000HY9K-243A
	for linux-mediatek@lists.infradead.org;
	Sat, 06 Jul 2024 08:29:11 +0000
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-5c66c4c30bfso4137eaf.2
        for <linux-mediatek@lists.infradead.org>; Sat, 06 Jul 2024 01:29:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720254548; x=1720859348;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0SdoXLXIu+HvSjVwv2ngUt5gbyZnRN7Gqj36N7mgsJo=;
        b=f63tVS3OmXGrR6/jC03bshdbMeZwLV44MsqZs3AUab2RwivBQRLXYVFNg7g1L8RAQ7
         fCG5EngcY0srjhHlHOAZvNNvrKibJ8Yk6iQKgdzgy763C6cM5dYI8GX/0B+zZgvqRr7p
         DeQX6dsP9kIrQPD809E/sV1HFic/rtLk+VplxXoSvTIIaRBSSfaIHTofuJ1qULKBMWwp
         89UMCKYEbOiOchWJEANRCJOYKzfZ1I5n+SlcSiUvRX0RcjywAG3Ma/3DfxmhlTanm6Bh
         S/+ojwvqyGIoIwoG8ylGoCPh445r42HNuYCSoWzVpBnU6OmpqEIfxemKI5RSGxLY4WSu
         1UAA==
X-Forwarded-Encrypted: i=1; AJvYcCUdQ99Pnb/amxWsRloOS1MZ6TW6rp5er2rKuT4CAkmUHRhOeYokU4gEVuOkIP4kc0GzU9EIseGfUvKlQj29A+b5E2KyEemPbBuK1IgvsWqiN1Z/
X-Gm-Message-State: AOJu0YxSdAxgEF3Op4ikfnkiXtyTAiHbxoqIuuW5Fb/3VHYgsetsmzNn
	7af9HICb8Jm9YauLK/ie/Aa8Uy55KtYbwjdx9q5c5vznSHUfPdeQ
X-Google-Smtp-Source: AGHT+IFSM1KejwThfKI59psSqbCJd8hsVG0T4rGP3gosGe/XsVKfdWxA91fA4LN2yCedSML9ivzIVA==
X-Received: by 2002:a4a:ead8:0:b0:5c6:6aae:b5f5 with SMTP id 006d021491bc7-5c66aaeb9e2mr305319eaf.0.1720254548387;
        Sat, 06 Jul 2024 01:29:08 -0700 (PDT)
Received: from sean-ThinkPad-T450s.attlocal.net ([2600:1702:5083:7610:1e13:57ab:ecc5:1fd4])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-25e71070ba1sm10744fac.34.2024.07.06.01.29.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jul 2024 01:29:06 -0700 (PDT)
From: sean.wang@kernel.org
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: sean.wang@mediatek.com,
	deren.wu@mediatek.com,
	mingyen.hsieh@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 27/37] wifi: mt76: mt7925: update mt7925_mcu_bss_mld_tlv for MLO
Date: Sat,  6 Jul 2024 01:28:07 -0700
Message-Id: <2d89b93bcfd92e7c6987aaa0a3c4637e605ac154.1720248331.git.sean.wang@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1720248331.git.sean.wang@kernel.org>
References: <cover.1720248331.git.sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240706_012909_653813_51CB6F75 
X-CRM114-Status: GOOD (  11.86  )
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

update mt7925_mcu_bss_mld_tlv for the MLO-enabled firmware,
the change remains compatible with the non-MLO mode and the
older firmware.

Co-developed-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Co-developed-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7925/mcu.c   | 22 +++++++++++--------
 .../net/wireless/mediatek/mt76/mt7925/mcu.h   |  5 ++++-
 2 files changed, 17 insertions(+), 10 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index 38e2ac5efb6b..53228bbed2c6 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -2393,24 +2393,29 @@ mt7925_mcu_bss_bmc_tlv(struct sk_buff *skb, struct mt792x_phy *phy,
 
 static void
 mt7925_mcu_bss_mld_tlv(struct sk_buff *skb,
-		       struct ieee80211_bss_conf *link_conf,
-		       struct ieee80211_link_sta *link_sta)
+		       struct ieee80211_bss_conf *link_conf)
 {
 	struct mt792x_bss_conf *mconf = mt792x_link_conf_to_mconf(link_conf);
-	bool is_mld = ieee80211_vif_is_mld(link_conf->vif);
+	struct mt792x_vif *mvif = (struct mt792x_vif *)link_conf->vif->drv_priv;
 	struct bss_mld_tlv *mld;
 	struct tlv *tlv;
+	bool is_mld;
+
+	is_mld = ieee80211_vif_is_mld(link_conf->vif) ||
+		 (hweight16(mvif->valid_links) > 1);
 
 	tlv = mt76_connac_mcu_add_tlv(skb, UNI_BSS_INFO_MLD, sizeof(*mld));
 	mld = (struct bss_mld_tlv *)tlv;
 
-	mld->link_id = link_sta ? (is_mld ? link_conf->link_id : 0) : 0xff;
-	mld->group_mld_id = is_mld ? mconf->mt76.idx : 0xff;
+	mld->link_id = is_mld ? link_conf->link_id : 0xff;
+	/* apply the index of the primary link */
+	mld->group_mld_id = is_mld ? mvif->bss_conf.mt76.idx : 0xff;
 	mld->own_mld_id = mconf->mt76.idx + 32;
 	mld->remap_idx = 0xff;
+	mld->eml_enable = !!(link_conf->vif->cfg.eml_cap &
+			     IEEE80211_EML_CAP_EMLSR_SUPP);
 
-	if (link_sta)
-		memcpy(mld->mac_addr, link_sta->addr, ETH_ALEN);
+	memcpy(mld->mac_addr, link_conf->addr, ETH_ALEN);
 }
 
 static void
@@ -2520,10 +2525,9 @@ int mt7925_mcu_add_bss_info(struct mt792x_phy *phy,
 	mt7925_mcu_bss_basic_tlv(skb, link_conf, link_sta, ctx, phy->mt76,
 				 mvif->sta.deflink.wcid.idx, enable);
 	mt7925_mcu_bss_sec_tlv(skb, link_conf);
-
 	mt7925_mcu_bss_bmc_tlv(skb, phy, ctx, link_conf);
 	mt7925_mcu_bss_qos_tlv(skb, link_conf);
-	mt7925_mcu_bss_mld_tlv(skb, link_conf, link_sta);
+	mt7925_mcu_bss_mld_tlv(skb, link_conf);
 	mt7925_mcu_bss_ifs_tlv(skb, link_conf);
 
 	if (link_conf->he_support) {
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.h b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.h
index 6ae5286385d9..7b0c6937f918 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.h
@@ -366,7 +366,10 @@ struct bss_mld_tlv {
 	u8 mac_addr[ETH_ALEN];
 	u8 remap_idx;
 	u8 link_id;
-	u8 __rsv[2];
+	u8 eml_enable;
+	u8 max_link_num;
+	u8 hybrid_mode;
+	u8 __rsv[3];
 } __packed;
 
 struct sta_rec_ba_uni {
-- 
2.25.1


