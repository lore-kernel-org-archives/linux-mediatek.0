Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3677DC3DA42
	for <linux-mediatek@archiver.kernel.org>; Sat,  6 Jul 2024 08:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YHGyXk+WAR8WXx4VibOug2pcg/d+aFy2gVyJKaP8IFg=; b=YAg4EuKTS3XIG1Wr21FfsTfCmS
	Sh8CCpBd5/X5+aiRy3Mwe2qkrQLrj4R0axzGlDvnza8mtis9utyJuWxw4itJ/Uq9RaaGBOvQox/87
	GMoz7TwQMTeXMxFtL3tnoC1uvuXObvEtiqiHM5bDxMXZGE2s+fi8ByWBXEHy3fq8BJ3mxtimcv16p
	I+Bfe9174GrjUkqIfl/qUlrrPZMW4z8x99NhjOd7Wj9n4gu5ebv43AMXHb98RC3YVefj/J1WnB2Rx
	luFg+VegQ6e+zofuNb9eSORri+/H28hvSuU3yuOVX7T5wwmAkuKcfiiB8msIwAaKNDsKeXuK2oioW
	6yaQpWCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQ0mu-0000000HXzt-302P;
	Sat, 06 Jul 2024 08:28:56 +0000
Received: from mail-oa1-f51.google.com ([209.85.160.51])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQ0mr-0000000HXxI-2odP
	for linux-mediatek@lists.infradead.org;
	Sat, 06 Jul 2024 08:28:55 +0000
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-25075f3f472so367194fac.2
        for <linux-mediatek@lists.infradead.org>; Sat, 06 Jul 2024 01:28:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720254533; x=1720859333;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YHGyXk+WAR8WXx4VibOug2pcg/d+aFy2gVyJKaP8IFg=;
        b=fUI/7Wn7Z+nqNrhkoAznaydnlXXqRBVvyRsEW5qQ856w9wJTPwsOkIsupS4Fkhi0S/
         2ELUORZ5GhjZN3dedaHxnmFAP2yZksS9VQ9vw6ahPdaTdf4a77TKi2LREy3Ah/S2Vad6
         gYjIL2DOJNN/039ehNFqqNG/NUAsvtof1+WGuFo85RQH9cg6vdKUSiI2IgjhN543HbO2
         wkcKthUBDkBStCNHNKkwbLh0svIgLy/e8jZZ7DoPgdPwhlOnnm/1dsPPw4EEpU/0isCV
         bemAMzCC25uwyi+NdPzplCC4HB2TxKaPBW244ExdR1KFlBhaNS+4fCXV+3e01Sm8bOCx
         MRRQ==
X-Forwarded-Encrypted: i=1; AJvYcCWz4STAAaTlKEVZgeCp8PMOqvP33I5nMmrc/gmbh1G/1fvy7gJNjal1OTGRlRmvNx9vrusr6sDg9rYvruUY5pRYhAMHXMTj5/tRwCcMC5PS0Jnq
X-Gm-Message-State: AOJu0YyVFBC4ZXx1rd5ijmNYVHNHo2NnEXYw5d0Blsaf3a+igRtW9/dB
	+iVWhEEGPjZXJO9G2uf8PmLmzpsIMQjIxH52x5wwHt0a/OYDELPLpv46vGbo
X-Google-Smtp-Source: AGHT+IFDLJSexFdKlH1kAQdK5WdFbGIt4Pp8bOhD5gqac9cia3oXrg+IFO5ZRDdOCGyTsNIUUu4nHw==
X-Received: by 2002:a05:6871:798e:b0:25e:15e1:35c6 with SMTP id 586e51a60fabf-25e2b5af44dmr6351746fac.0.1720254532685;
        Sat, 06 Jul 2024 01:28:52 -0700 (PDT)
Received: from sean-ThinkPad-T450s.attlocal.net ([2600:1702:5083:7610:1e13:57ab:ecc5:1fd4])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-25e71070ba1sm10744fac.34.2024.07.06.01.28.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jul 2024 01:28:51 -0700 (PDT)
From: sean.wang@kernel.org
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: sean.wang@mediatek.com,
	deren.wu@mediatek.com,
	mingyen.hsieh@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 18/37] wifi: mt76: mt7925: add link handling in mt7925_sta_set_decap_offload
Date: Sat,  6 Jul 2024 01:27:58 -0700
Message-Id: <df2524e3a63a93699bde441e4ab70a70bbac53ef.1720248331.git.sean.wang@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1720248331.git.sean.wang@kernel.org>
References: <cover.1720248331.git.sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240706_012853_759445_08E196F2 
X-CRM114-Status: GOOD (  12.33  )
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

add link handling in mt7925_sta_set_decap_offload

Co-developed-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Co-developed-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7925/main.c  | 21 ++++++++++++----
 .../net/wireless/mediatek/mt76/mt7925/mcu.c   | 24 ++++++++++++++-----
 .../wireless/mediatek/mt76/mt7925/mt7925.h    |  3 ++-
 3 files changed, 36 insertions(+), 12 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index 669f28a916c5..791e90f5760f 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -1464,16 +1464,27 @@ static void mt7925_sta_set_decap_offload(struct ieee80211_hw *hw,
 					 bool enabled)
 {
 	struct mt792x_sta *msta = (struct mt792x_sta *)sta->drv_priv;
+	struct mt792x_vif *mvif = (struct mt792x_vif *)vif->drv_priv;
 	struct mt792x_dev *dev = mt792x_hw_dev(hw);
+	unsigned long valid = mvif->valid_links;
+	u8 i;
 
 	mt792x_mutex_acquire(dev);
 
-	if (enabled)
-		set_bit(MT_WCID_FLAG_HDR_TRANS, &msta->deflink.wcid.flags);
-	else
-		clear_bit(MT_WCID_FLAG_HDR_TRANS, &msta->deflink.wcid.flags);
+	valid = ieee80211_vif_is_mld(vif) ? mvif->valid_links : BIT(0);
+
+	for_each_set_bit(i, &valid, IEEE80211_MLD_MAX_NUM_LINKS) {
+		struct mt792x_link_sta *mlink;
 
-	mt7925_mcu_wtbl_update_hdr_trans(dev, vif, sta);
+		mlink = mt792x_sta_to_link(msta, i);
+
+		if (enabled)
+			set_bit(MT_WCID_FLAG_HDR_TRANS, &mlink->wcid.flags);
+		else
+			clear_bit(MT_WCID_FLAG_HDR_TRANS, &mlink->wcid.flags);
+
+		mt7925_mcu_wtbl_update_hdr_trans(dev, vif, sta, i);
+	}
 
 	mt792x_mutex_release(dev);
 }
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index 9a4dfe53da17..0991af877434 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -887,10 +887,15 @@ mt7925_mcu_sta_hdr_trans_tlv(struct sk_buff *skb,
 	else
 		hdr_trans->from_ds = true;
 
-	if (link_sta)
-		wcid = (struct mt76_wcid *)link_sta->sta->drv_priv;
-	else
+	if (link_sta) {
+		struct mt792x_sta *msta = (struct mt792x_sta *)link_sta->sta->drv_priv;
+		struct mt792x_link_sta *mlink;
+
+		mlink = mt792x_sta_to_link(msta, link_sta->link_id);
+		wcid = &mlink->wcid;
+	} else {
 		wcid = &mvif->sta.deflink.wcid;
+	}
 
 	if (!wcid)
 		return;
@@ -904,17 +909,24 @@ mt7925_mcu_sta_hdr_trans_tlv(struct sk_buff *skb,
 
 int mt7925_mcu_wtbl_update_hdr_trans(struct mt792x_dev *dev,
 				     struct ieee80211_vif *vif,
-				     struct ieee80211_sta *sta)
+				     struct ieee80211_sta *sta,
+				     int link_id)
 {
 	struct mt792x_vif *mvif = (struct mt792x_vif *)vif->drv_priv;
 	struct ieee80211_link_sta *link_sta = sta ? &sta->deflink : NULL;
+	struct mt792x_link_sta *mlink;
+	struct mt792x_bss_conf *mconf;
 	struct mt792x_sta *msta;
 	struct sk_buff *skb;
 
 	msta = sta ? (struct mt792x_sta *)sta->drv_priv : &mvif->sta;
 
-	skb = __mt76_connac_mcu_alloc_sta_req(&dev->mt76, &mvif->bss_conf.mt76,
-					      &msta->deflink.wcid,
+	mlink = mt792x_sta_to_link(msta, link_id);
+	link_sta = mt792x_sta_to_link_sta(vif, sta, link_id);
+	mconf = mt792x_vif_to_link(mvif, link_id);
+
+	skb = __mt76_connac_mcu_alloc_sta_req(&dev->mt76, &mconf->mt76,
+					      &mlink->wcid,
 					      MT7925_STA_UPDATE_MAX_SIZE);
 	if (IS_ERR(skb))
 		return PTR_ERR(skb);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mt7925.h b/drivers/net/wireless/mediatek/mt76/mt7925/mt7925.h
index bcf8541fa31d..1ae66629e39f 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mt7925.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mt7925.h
@@ -316,6 +316,7 @@ int mt7925_mcu_add_key(struct mt76_dev *dev, struct ieee80211_vif *vif,
 int mt7925_mcu_set_rts_thresh(struct mt792x_phy *phy, u32 val);
 int mt7925_mcu_wtbl_update_hdr_trans(struct mt792x_dev *dev,
 				     struct ieee80211_vif *vif,
-				     struct ieee80211_sta *sta);
+				     struct ieee80211_sta *sta,
+				     int link_id);
 
 #endif
-- 
2.25.1


