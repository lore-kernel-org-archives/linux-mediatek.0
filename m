Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04932C31D97
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Jul 2024 21:43:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sW7nAYSBD4glkIK9OSU6ZgZqDA0uvjteIHLwvRqU2zg=; b=1qllrxe0KWTO1GbaRxsMesZqGP
	GkNufRw89Px0s2ty+wp0KBXSPB0o0y/9ctrpliMHqsxeTd52DijyQYdXAqsYwEF+8ZmWHXpJNYmC9
	1M4CnHX29Ud036uNtN8PBN0lj3tlZCkAPZvw7sonV4nebiK7cQioFQocoygI8mGYE7hBsOumwlta0
	aYfXxPPz2PZ1LRmxxh7CtwlWPZR5RtNfMQUvF75WmG0mgluCXJgNljPbdwvFWG0+Gon2NJxk9C1cg
	we0Rg6HlI1F6TvmVA5z8WeJpAYOzINFhEJd7nhmL69n7AStmzgcfl5TfEAdtcPyojoaw4q94o7YQj
	s52scDeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sP7lN-0000000BXP0-2jOG;
	Wed, 03 Jul 2024 21:43:41 +0000
Received: from mail-oa1-f46.google.com ([209.85.160.46])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sP7lK-0000000BXMd-0hwJ
	for linux-mediatek@lists.infradead.org;
	Wed, 03 Jul 2024 21:43:41 +0000
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-25cb5ee9d2dso4951fac.1
        for <linux-mediatek@lists.infradead.org>; Wed, 03 Jul 2024 14:43:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720043017; x=1720647817;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sW7nAYSBD4glkIK9OSU6ZgZqDA0uvjteIHLwvRqU2zg=;
        b=phsmulIybN5I8Rz+LTOsCcx+f1pABxosmGzVUHYPoBMrDdKPdZmLjZTiR/Gzos9bc8
         tEtY4b9IitqR1QNOGdJzubr66wzmY0cvh80iFRETwPIipVgrZEA6Kne6kZ6NI3orsyYe
         QAqQ6GBlxBgXAp1oy2qEcbYmD0gDZiuyirnsaAfugWg5nYNlSagVxyiMWaYzZSIYOwOe
         PNn+O4IY+wQb97e1E982o5VTCb8mUkdgJ+dhJ4YPGtrj6/wQPOti5947s/dkoqsFdbPJ
         UfVHdfHT6katbP9JH/GsgyqzRYN/WaBRdT02pi5toneLesECuvngyz8V2oLyCLGwiP6D
         ZY3Q==
X-Forwarded-Encrypted: i=1; AJvYcCWe2tRkzMFG/+YIPJSne2gDX7USuqEDzy7h7OPrrf+uhHkvfz2aJbC1XPC75Vq8c9Cw0Zckmmp8DHm4pKpTRqAGexbaNp4YPUevJMcJxbIQyLQa
X-Gm-Message-State: AOJu0YzX3nuB088fLmNbmNwiLBzyWNEn4L1E+74TqA6c6noOXCdY8Bc6
	iDEZMj+onB3RsQXN8HW57U/iPfrce0VAp+c+U6Fku/KF3CiRVjQMgXN0yDml
X-Google-Smtp-Source: AGHT+IH4XOZT62iIvZhEGPj3+iU/gi4uuYHksxIRuTmMEG197w45CPTYhpsRRPAJv8JVvFwYI78Ckg==
X-Received: by 2002:a9d:6b12:0:b0:701:f9f0:73d8 with SMTP id 46e09a7af769-7020772bb17mr13165353a34.2.1720043017154;
        Wed, 03 Jul 2024 14:43:37 -0700 (PDT)
Received: from sean-ThinkPad-T450s.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-701f7b20953sm2111417a34.54.2024.07.03.14.43.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 14:43:35 -0700 (PDT)
From: sean.wang@kernel.org
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: sean.wang@mediatek.com,
	deren.wu@mediatek.com,
	mingyen.hsieh@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 24/29] wifi: mt76: mt7925: update mt7925_mcu_bss_mld_tlv for MLO
Date: Wed,  3 Jul 2024 14:42:29 -0700
Message-Id: <a1385a919fde52db93bdab67535d2ed4a95c82c3.1720042294.git.sean.wang@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1720042294.git.sean.wang@kernel.org>
References: <cover.1720042294.git.sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240703_144339_657299_70E9E45A 
X-CRM114-Status: GOOD (  11.55  )
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
 .../net/wireless/mediatek/mt76/mt7925/mcu.c   | 19 +++++++++++--------
 .../net/wireless/mediatek/mt76/mt7925/mcu.h   |  5 ++++-
 2 files changed, 15 insertions(+), 9 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index 71f1fb9fbe2f..8e36fb211dcc 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -2384,24 +2384,28 @@ mt7925_mcu_bss_bmc_tlv(struct sk_buff *skb, struct mt792x_phy *phy,
 
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
+	mld->link_id = is_mld ? link_conf->link_id : 0xff;
 	mld->group_mld_id = is_mld ? mconf->mt76.idx : 0xff;
 	mld->own_mld_id = mconf->mt76.idx + 32;
 	mld->remap_idx = 0xff;
+	mld->eml_enable = !!(link_conf->vif->cfg.eml_cap &
+			     IEEE80211_EML_CAP_EMLSR_SUPP);
 
-	if (link_sta)
-		memcpy(mld->mac_addr, link_sta->addr, ETH_ALEN);
+	memcpy(mld->mac_addr, link_conf->addr, ETH_ALEN);
 }
 
 static void
@@ -2511,10 +2515,9 @@ int mt7925_mcu_add_bss_info(struct mt792x_phy *phy,
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
index f0b890ad43e7..545f6b2d524c 100644
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


