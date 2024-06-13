Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EF45C27C6E
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Jun 2024 03:03:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FKy4Q0CaWzGta6AQsmEkVzO4cC46jn6FmQGCDe6kxjc=; b=o0VxKd1W+oMSA3PV5jNTxrR9nr
	zcY3522yxe+c/7j5IcFUhrsck6wssA2M7yDlZ8s43eYfYmx3Ss8fx7cdk02ZFyBtKsA+EY1hWm/GF
	R29IztbJp+z+0ZCfrUOoxj6yZYqiwFMnhpxvLlw89kAF7iOE04V3rX6XqnN1gPv2M09oNzyQcCxrG
	yej1avJnVt3OL6a/yQ7DNYxyuk8px4ofBl7/0b3LZR//caDhdSQP0TQTe4z8YSIGPAHLJU1FL7uDz
	RxYyWo553V0Rh8oae9WqyH0GVajxlRIvllzXK8mTNuuLOr/Y4oy6dS1bHu7w3BW8HyaZHtnotrlwS
	MKZ24WFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHakD-0000000Evjf-0d5T;
	Thu, 13 Jun 2024 03:03:21 +0000
Received: from mail-oa1-f51.google.com ([209.85.160.51])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHak8-0000000Evgu-1RoB
	for linux-mediatek@lists.infradead.org;
	Thu, 13 Jun 2024 03:03:19 +0000
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-254976d3327so77652fac.1
        for <linux-mediatek@lists.infradead.org>; Wed, 12 Jun 2024 20:03:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718247795; x=1718852595;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FKy4Q0CaWzGta6AQsmEkVzO4cC46jn6FmQGCDe6kxjc=;
        b=juQq4PqFkXC8WV6ZvGXzFRKHofumLocUdp0ayqMSzZkpKAOFeO1qme9Coe1/9pkkRH
         M69ohbq66pzBvfhyWEeh06MvbNsKpx5Lw14Efs214Ha7b4oJyRXIzlAdw+QSS2fMStYc
         O8WvEDIgLEepyX+4gjJccVPaqCsFXMtJ2yu3l0Ky6U0kM0P404beBK7Dq3do4jt+bFHD
         Z0AT8UlDwnPDc0kFdBpjTPV3jeqbWeEJ6X48yY4U9f9BXN4HmFSe+cPL3/QIpZRA5+Op
         C5RdCmBQoe5Pp39N9X69JvEKenZQEitgcUllqJhRWKpuGCBfZvFHNRpF6uIVCbVPFfBz
         JHVQ==
X-Forwarded-Encrypted: i=1; AJvYcCVP6AouhissNZVL/D5QyEepsnA7W7PbdilTa0nl4mJtmPhKC5qXX7HT5fzPyXvYI78w15u2/P7EPuaH1lo3sH3w1xSccCX+r018uATWdzVbZha7
X-Gm-Message-State: AOJu0YxPj90WliZd1uteSR0P5FII3HWDbI2CloiOyZN4z9JuJloWA48O
	gEIZIsodTEQyPlJlJ5EofkCB0fknQVTevmJ1peekD3XcCCpP+OU1
X-Google-Smtp-Source: AGHT+IEXh4X1g1pv0SmYU/zclu0zjOlYL845YMFZJX7tNiyr8Vn0dBv54YcBpoycu/jPsHItinsd2w==
X-Received: by 2002:a4a:d196:0:b0:5bd:87a0:66d with SMTP id 006d021491bc7-5bd87a01b93mr285392eaf.1.1718247795013;
        Wed, 12 Jun 2024 20:03:15 -0700 (PDT)
Received: from sean-ThinkPad-T450s.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5bd629263c5sm67685eaf.46.2024.06.12.20.03.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 20:03:13 -0700 (PDT)
From: sean.wang@kernel.org
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: sean.wang@mediatek.com,
	deren.wu@mediatek.com,
	mingyen.hsieh@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 13/47] wifi: mt76: mt7925: extend mt7925_mcu_bss_mld_tlv for per-link BSS
Date: Wed, 12 Jun 2024 20:02:07 -0700
Message-Id: <20240613030241.5771-14-sean.wang@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240613030241.5771-1-sean.wang@kernel.org>
References: <20240613030241.5771-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240612_200316_566327_4B75D358 
X-CRM114-Status: GOOD (  11.78  )
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

Extend mt7925_mcu_bss_mld_tlv with per-link BSS configuration.

The patch we created is a prerequisite to enable the MLO function in the
driver. It is purely a refactoring patch so the functionality should
remain unchanged.

Co-developed-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/mcu.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index d6a590061e36..93ce018a0801 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -2206,20 +2206,20 @@ mt7925_mcu_bss_bmc_tlv(struct sk_buff *skb, struct mt792x_phy *phy,
 
 static void
 mt7925_mcu_bss_mld_tlv(struct sk_buff *skb,
-		       struct ieee80211_vif *vif,
+		       struct ieee80211_bss_conf *link_conf,
 		       struct ieee80211_sta *sta)
 {
-	struct mt792x_vif *mvif = (struct mt792x_vif *)vif->drv_priv;
-	bool is_mld = ieee80211_vif_is_mld(vif);
+	struct mt792x_bss_conf *mconf = mt792x_link_conf_to_mconf(link_conf);
+	bool is_mld = ieee80211_vif_is_mld(link_conf->vif);
 	struct bss_mld_tlv *mld;
 	struct tlv *tlv;
 
 	tlv = mt76_connac_mcu_add_tlv(skb, UNI_BSS_INFO_MLD, sizeof(*mld));
 	mld = (struct bss_mld_tlv *)tlv;
 
-	mld->link_id = sta ? (is_mld ? vif->bss_conf.link_id : 0) : 0xff;
-	mld->group_mld_id = is_mld ? mvif->bss_conf.mt76.idx : 0xff;
-	mld->own_mld_id = mvif->bss_conf.mt76.idx + 32;
+	mld->link_id = sta ? (is_mld ? link_conf->link_id : 0) : 0xff;
+	mld->group_mld_id = is_mld ? mconf->mt76.idx : 0xff;
+	mld->own_mld_id = mconf->mt76.idx + 32;
 	mld->remap_idx = 0xff;
 
 	if (sta)
@@ -2337,7 +2337,7 @@ int mt7925_mcu_add_bss_info(struct mt792x_phy *phy,
 
 	mt7925_mcu_bss_bmc_tlv(skb, phy, ctx, link_conf->vif, sta);
 	mt7925_mcu_bss_qos_tlv(skb, link_conf);
-	mt7925_mcu_bss_mld_tlv(skb, link_conf->vif, sta);
+	mt7925_mcu_bss_mld_tlv(skb, link_conf, sta);
 	mt7925_mcu_bss_ifs_tlv(skb, link_conf);
 
 	if (link_conf->he_support) {
-- 
2.34.1


