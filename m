Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78FCEC27C6E
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Jun 2024 03:03:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uoEs7B6T1gVNEXMq3665UB7KgLCGFV0A9uQvetVLP78=; b=oho3W4sYFZ0BeydslgXOrERGi/
	PkbF9RpEUN3RYcs7ddd1Lfu9A50uwoePAB5La5nN/fI4Fm/NMgh8gV2w5B5fEipoMtgexO91qnDV9
	/pLu9s8uLqmCoWWA6DazpNO9tTHkHOSsaOZVgzZk7mUbfj4AZRcPloLS7w6ZYeqjLb+/NITo7a3ur
	ymd73FCxFfWwEhOZQ4URHRIv1zuCHbz53VSVUae1/cKX77FGpya/lHUUTUUgGutWgy2QuooJZHNpD
	2+hDGnDMlIYRtjCB4J/voKvg/az2H3bJGc6y1aA1E7OBxYQ0gT/czBIHi1UpyzjaNt4+HaP20q2kD
	eeKGgfRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHakh-0000000Ew2s-04jJ;
	Thu, 13 Jun 2024 03:03:51 +0000
Received: from mail-oo1-f41.google.com ([209.85.161.41])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHakc-0000000Ew00-2eQk
	for linux-mediatek@lists.infradead.org;
	Thu, 13 Jun 2024 03:03:49 +0000
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-5bb10cfe7daso36872eaf.2
        for <linux-mediatek@lists.infradead.org>; Wed, 12 Jun 2024 20:03:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718247826; x=1718852626;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uoEs7B6T1gVNEXMq3665UB7KgLCGFV0A9uQvetVLP78=;
        b=Jb7CG0fZXao1W6JvNRotvMO8D2Yjy/XfEKyDVkQUJdGxuuhlMmlm5XiYjQHRAfvlB/
         YFQyrvAikvvakXwZGA7zvZGa+v4g6goc8YwWVE8ut2Sn7FqY6YGvuSuN+aoJUA0rOXU4
         VMO9+McAdGMnK22BGmMitwUusUIi0FOFk5gMRNBDCtz4aE03HuHTuKK3EWDmMwDLmI9g
         WQ0b8izQvsjJqysCcc6v+ieV1PvEMPjX1jbz4kEuxxBjQTobQnmQxnuCMA2e/qWOHGuj
         TtXBIkNdPxjViIBrXi2YGKVVqgDkvj/NVfek1QF1kXemACHhPutOK3D7UPbHVhdojP6K
         02cQ==
X-Forwarded-Encrypted: i=1; AJvYcCUrTcNSbcs0ki294DFNTT8L2oCjlF2+sz80KYIDFRvePm0MacCUpTsVO5agrmFu8Wc+Tl2d/jjl2oyw2Q/94k6b8nJ2PZNt7ETL53yzJQVfknq8
X-Gm-Message-State: AOJu0Ywx49T3IC5AD4+VVoWP24VNHMXoXw7wF/60zUMeXpIoWJ6tTKRf
	5qInM4cFq/vJt0IWJva6YDlynj7Ta9OBbrUWsCSzgEXMxL7S6OLCOZw1jfLNHOk=
X-Google-Smtp-Source: AGHT+IEN8+hwX0caiHOXoNsbUeCYOepGoMV0RHhVHb9esDQ1cKY7FqH5AHqh3LPL9I2YtyitVrYS3A==
X-Received: by 2002:a4a:d196:0:b0:5bd:87a0:66d with SMTP id 006d021491bc7-5bd87a01b93mr286222eaf.1.1718247825880;
        Wed, 12 Jun 2024 20:03:45 -0700 (PDT)
Received: from sean-ThinkPad-T450s.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5bd629263c5sm67685eaf.46.2024.06.12.20.03.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 20:03:44 -0700 (PDT)
From: sean.wang@kernel.org
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: sean.wang@mediatek.com,
	deren.wu@mediatek.com,
	mingyen.hsieh@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 28/47] wifi: mt76: mt7925: extend mt7925_mcu_sta_he_6g_tlv for per-link STA
Date: Wed, 12 Jun 2024 20:02:22 -0700
Message-Id: <20240613030241.5771-29-sean.wang@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240613030241.5771-1-sean.wang@kernel.org>
References: <20240613030241.5771-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240612_200346_708052_B3E3D832 
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

Extend mt7925_mcu_sta_he_6g_tlv with the per-link STA configuration.

The patch we created is a prerequisite to enable the MLO function in the
driver. It is purely a refactoring patch so the functionality should
remain unchanged.

Co-developed-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Co-developed-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/mcu.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index 0c9cebd3ee71..e1dc8452468c 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -1389,18 +1389,19 @@ mt7925_mcu_sta_he_tlv(struct sk_buff *skb, struct ieee80211_sta *sta)
 }
 
 static void
-mt7925_mcu_sta_he_6g_tlv(struct sk_buff *skb, struct ieee80211_sta *sta)
+mt7925_mcu_sta_he_6g_tlv(struct sk_buff *skb,
+			 struct ieee80211_link_sta *link_sta)
 {
 	struct sta_rec_he_6g_capa *he_6g;
 	struct tlv *tlv;
 
-	if (!sta->deflink.he_6ghz_capa.capa)
+	if (!link_sta->he_6ghz_capa.capa)
 		return;
 
 	tlv = mt76_connac_mcu_add_tlv(skb, STA_REC_HE_6G, sizeof(*he_6g));
 
 	he_6g = (struct sta_rec_he_6g_capa *)tlv;
-	he_6g->capa = sta->deflink.he_6ghz_capa.capa;
+	he_6g->capa = link_sta->he_6ghz_capa.capa;
 }
 
 static void
@@ -1640,7 +1641,7 @@ mt7925_mcu_sta_cmd(struct mt76_phy *phy,
 		mt76_connac_mcu_sta_uapsd(skb, info->vif, info->link_sta->sta);
 		mt7925_mcu_sta_amsdu_tlv(skb, info->vif, info->link_sta->sta);
 		mt7925_mcu_sta_he_tlv(skb, info->link_sta->sta);
-		mt7925_mcu_sta_he_6g_tlv(skb, info->link_sta->sta);
+		mt7925_mcu_sta_he_6g_tlv(skb, info->link_sta);
 		mt7925_mcu_sta_eht_tlv(skb, info->link_sta);
 		mt7925_mcu_sta_rate_ctrl_tlv(skb, info->vif,
 					     info->link_sta);
-- 
2.34.1


