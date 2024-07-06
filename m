Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46B48C38150
	for <linux-mediatek@archiver.kernel.org>; Sat,  6 Jul 2024 08:29:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qhnUBU60MyvNT6yMvKJrua9PvBBIIll209q9635BY68=; b=gperTmJuoYecQ0BZPcr4Rlu0x4
	aGlOFW6pDsh5gE2Bio9id7W1yobPhxfKYhFTAJxueHXkQMNhejj1P7KIekraJcLN1ulT4kf7l3K/R
	QgXSRwNPx7ZPH5/m3FiqoUp4bQYo0pq3bTcK46fiydy1GwyDLvhYjNEhxlowVisxHTTfgfvGsIfKD
	asX7ayF9UoR80M/OTIEZXprGSh4sPUILSk8tArODk1AdH+P6w6opeq0FZoKtTzOeXW9sflFhYD7Zt
	qDv7oSowdcx3Wg4dIA7JtHZaIXVjZA6leK2i2bTo0JQzLCsg7y4Fbs/q8qKWFEqVsPlfO8uXskdRM
	2eSSVhow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQ0n8-0000000HYAF-2Loq;
	Sat, 06 Jul 2024 08:29:10 +0000
Received: from mail-oa1-f48.google.com ([209.85.160.48])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQ0n5-0000000HY7Y-0wwu
	for linux-mediatek@lists.infradead.org;
	Sat, 06 Jul 2024 08:29:08 +0000
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-25075f3f472so367205fac.2
        for <linux-mediatek@lists.infradead.org>; Sat, 06 Jul 2024 01:29:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720254546; x=1720859346;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qhnUBU60MyvNT6yMvKJrua9PvBBIIll209q9635BY68=;
        b=rS/OcCz8aBCMYUcOBjN7OZQcJmFhNuGQD0+tM9FO0prUe5/vQ3uaaCuF87qwdUVy5P
         lEQ2IcsqG9vAoPWDGkbIxAeuEeYVo86yWtqtb20AVrBfccEuC82tL+h4NArDrRURF++s
         sAzSuz4HbDS5tEIPM0/ay3KoqrM4O0joiflK0GRFdt01UIsLZacwVYeg7NVGwZURRGtD
         /FCiFTnxOXcIXy0pPVrbGhUTbJcQQqKg25SLUgiog5eUkddihlmdH6VuMOeffyxfqHnt
         qHjdNytLGywz5NcCcnGs1vXEzVC4STSKL0iNr/NZDSXJpVGD8tU8AgZxbXMHWPZyYjus
         3G9w==
X-Forwarded-Encrypted: i=1; AJvYcCUnEKja4O0XE4EhLW0EztAYs6Tj/8eAnnW+I5M1DmtoV7WSzoprHgquwZj7BlCXpJtMKkOI+4x7QmyybXlMCstAt+jCmLCZRlP/4K3ZpNxqM0WT
X-Gm-Message-State: AOJu0Yz/EuLoCDXEBjJCGhkhhDt4FJP5MToINTTqX8SZ7zWZefoJlVDG
	nupF94TXUu9AG96Bda+UppMrU7pTE/R2jH0/cFr0rXgvGH4j2dxx
X-Google-Smtp-Source: AGHT+IEyOyEgiWCFYHlQ8tMVIY3cVVU0h6WFWzQMhDKRCO3slBlIGxIzEP3u1EdVxFniuPB4ilWljg==
X-Received: by 2002:a05:6871:798e:b0:25e:15e1:35c6 with SMTP id 586e51a60fabf-25e2b5af44dmr6351944fac.0.1720254546253;
        Sat, 06 Jul 2024 01:29:06 -0700 (PDT)
Received: from sean-ThinkPad-T450s.attlocal.net ([2600:1702:5083:7610:1e13:57ab:ecc5:1fd4])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-25e71070ba1sm10744fac.34.2024.07.06.01.29.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jul 2024 01:29:05 -0700 (PDT)
From: sean.wang@kernel.org
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: sean.wang@mediatek.com,
	deren.wu@mediatek.com,
	mingyen.hsieh@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 26/37] wifi: mt76: mt7925: update mt7925_mcu_sta_mld_tlv for MLO
Date: Sat,  6 Jul 2024 01:28:06 -0700
Message-Id: <25ea3ffd3875083577ab440ec63f3dcd9dc233f4.1720248331.git.sean.wang@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1720248331.git.sean.wang@kernel.org>
References: <cover.1720248331.git.sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240706_012907_355364_1C02087F 
X-CRM114-Status: GOOD (  11.17  )
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

Update mt7925_mcu_sta_mld_tlv for the MLO-enabled firmware.

Co-developed-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Co-developed-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7925/mcu.c   | 29 ++++++++++++++-----
 1 file changed, 22 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index 5979e47ec142..38e2ac5efb6b 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -1742,19 +1742,34 @@ static void
 mt7925_mcu_sta_mld_tlv(struct sk_buff *skb,
 		       struct ieee80211_vif *vif, struct ieee80211_sta *sta)
 {
-	struct mt76_wcid *wcid = (struct mt76_wcid *)sta->drv_priv;
+	struct mt792x_vif *mvif = (struct mt792x_vif *)vif->drv_priv;
+	struct mt792x_sta *msta = (struct mt792x_sta *)sta->drv_priv;
+	unsigned long valid = mvif->valid_links;
+	struct mt792x_bss_conf *mconf;
+	struct mt792x_link_sta *mlink;
 	struct sta_rec_mld *mld;
 	struct tlv *tlv;
+	int i, cnt = 0;
 
 	tlv = mt76_connac_mcu_add_tlv(skb, STA_REC_MLD, sizeof(*mld));
 	mld = (struct sta_rec_mld *)tlv;
-	memcpy(mld->mac_addr, vif->addr, ETH_ALEN);
-	mld->primary_id = cpu_to_le16(wcid->idx);
-	mld->wlan_id = cpu_to_le16(wcid->idx);
+	memcpy(mld->mac_addr, sta->addr, ETH_ALEN);
+	mld->primary_id = cpu_to_le16(msta->deflink.wcid.idx);
+	mld->wlan_id = cpu_to_le16(msta->deflink.wcid.idx);
+	mld->link_num = min_t(u8, hweight16(mvif->valid_links), 2);
+
+	for_each_set_bit(i, &valid, IEEE80211_MLD_MAX_NUM_LINKS) {
+		if (cnt == mld->link_num)
+			break;
 
-	/* TODO: 0 means deflink only, add secondary link(1) later */
-	mld->link_num = !!(hweight8(vif->active_links) > 1);
-	WARN_ON_ONCE(mld->link_num);
+		mconf = mt792x_vif_to_link(mvif, i);
+		mlink = mt792x_sta_to_link(msta, i);
+		mld->link[cnt].wlan_id = cpu_to_le16(mlink->wcid.idx);
+		mld->link[cnt++].bss_idx = cpu_to_le16(mconf->mt76.idx);
+
+		if (mlink != &msta->deflink)
+			mld->secondary_id = cpu_to_le16(mlink->wcid.idx);
+	}
 }
 
 static int
-- 
2.25.1


