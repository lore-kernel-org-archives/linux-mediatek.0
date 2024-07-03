Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1305C2BD09
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Jul 2024 21:43:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a5jt3ki0dxujpF+hrHkEF4OlQEJHlnIToDmNgU6Pwh8=; b=ZSUVCXYKfqX0A385yuFYR5ynMY
	w8IdLnlFinstjkGYANS/n+1emfBMhsmeY5HraoDJCMBCQO87Mh2iXUcUsvDVKlIUqrPfTxwfCF7lB
	cfh9sFwGdnr/QHZrnF4nOr+qLE1Cl+J8xeaOvuO/ZbEZ3xadAjjSCJiZvXjT6cJy962j+x6pEiIE0
	dwjpPq0x0gmhZp6n5rsHPFZ7pCGoNuBGthQre4So5oXkPhSyr3ijzOyvFHAIzlBsXSzG39/mgo3Mf
	IBwlhX4ucBWlkQiOKZnE6MwZRcOuGIZwr/PU46B4waTubesRT7YdT40BKxhw0cpCt4DbZVDAVkA6k
	SCnfdF0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sP7kv-0000000BX7W-1dU5;
	Wed, 03 Jul 2024 21:43:13 +0000
Received: from mail-ot1-f45.google.com ([209.85.210.45])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sP7ks-0000000BX5O-2MIG
	for linux-mediatek@lists.infradead.org;
	Wed, 03 Jul 2024 21:43:11 +0000
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-70218c133adso134074a34.2
        for <linux-mediatek@lists.infradead.org>; Wed, 03 Jul 2024 14:43:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720042989; x=1720647789;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a5jt3ki0dxujpF+hrHkEF4OlQEJHlnIToDmNgU6Pwh8=;
        b=mQYRiGB4UoYBUjJzegXFN1m2HwWZ6zruMvXzF7SCERaxhqoU13YAEdeic68qQKUReH
         9oJnkjBnlaMJAZXUslY4ubp8IiTpq37YWcea7rOc3QXQH2OslGhpcaIHBwR5pbwQ4NlN
         DjEhUgUa4iG+F9MtsAKrBPFtVMNjYpS/bU8d27gjOj0nljdgz6L1/ymOoSEPn9ZJbtWN
         o0zmDM+u8IHD/rwLL/Wmc9+u1wwS95DG4sssZR6tSkmlkcn5IUBtb5IP0Eub8L1LDk12
         JPu3b0QDRa5rw3q9UNO80AweWpwClCNlzwrGVR0HbC+Hf3NTJbHfWFt/3nwSeLfiwDUt
         AN6A==
X-Forwarded-Encrypted: i=1; AJvYcCUB+H3FmR2IePrewuSIy//EtBx1/4oAtb27L41IvTvpRBaTHMWnDWj0SngdyxOvPGqk2PQERaeNzMfnM5aGBN1fP/IK0jh5qHP226eHCM73KrP6
X-Gm-Message-State: AOJu0YwUkPar0+t64ShXSSXXEH0anuW9UiXkB87P7rfWI85lM3CCBaqh
	6tqURGUvc3ubRd+u6u603FbxxxMEdIGKV198z3Gftkr20HZajPkptQvRT8Az
X-Google-Smtp-Source: AGHT+IH+yhvRJNPDLOf155UX4LN+InGILwsLbUzzyWl2sYHJHsM69Z5/iy6EGQ/+WKVapU70TMpjBw==
X-Received: by 2002:a05:6830:4623:b0:700:ce5f:968c with SMTP id 46e09a7af769-702077496d6mr11310220a34.3.1720042989603;
        Wed, 03 Jul 2024 14:43:09 -0700 (PDT)
Received: from sean-ThinkPad-T450s.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-701f7b20953sm2111417a34.54.2024.07.03.14.43.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 14:43:07 -0700 (PDT)
From: sean.wang@kernel.org
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: sean.wang@mediatek.com,
	deren.wu@mediatek.com,
	mingyen.hsieh@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 09/29] wifi: mt76: mt7925: add link handling in mt7925_mac_sta_add
Date: Wed,  3 Jul 2024 14:42:14 -0700
Message-Id: <e2e45fa0d66e86fb5fe07b085998a384c53b429e.1720042294.git.sean.wang@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1720042294.git.sean.wang@kernel.org>
References: <cover.1720042294.git.sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240703_144310_634397_D33FD609 
X-CRM114-Status: GOOD (  11.75  )
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

Added link handling to mt7925_mac_sta_add to support MLD devices.

Co-developed-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Co-developed-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/main.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index 0e554b21692e..82d16208764f 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -887,15 +887,25 @@ mt7925_mac_sta_add_links(struct mt792x_dev *dev, struct ieee80211_vif *vif,
 int mt7925_mac_sta_add(struct mt76_dev *mdev, struct ieee80211_vif *vif,
 		       struct ieee80211_sta *sta)
 {
+	struct mt792x_dev *dev = container_of(mdev, struct mt792x_dev, mt76);
 	struct mt792x_vif *mvif = (struct mt792x_vif *)vif->drv_priv;
 	struct mt792x_sta *msta = (struct mt792x_sta *)sta->drv_priv;
+	int err;
 
 	msta->vif = mvif;
 
 	if (vif->type == NL80211_IFTYPE_STATION)
 		mvif->wep_sta = msta;
 
-	return mt7925_mac_link_sta_add(mdev, vif, &sta->deflink);
+	if (ieee80211_vif_is_mld(vif)) {
+		msta->deflink_id = IEEE80211_LINK_UNSPECIFIED;
+
+		err = mt7925_mac_sta_add_links(dev, vif, sta, sta->valid_links);
+	} else {
+		err = mt7925_mac_link_sta_add(mdev, vif, &sta->deflink);
+	}
+
+	return err;
 }
 EXPORT_SYMBOL_GPL(mt7925_mac_sta_add);
 
-- 
2.25.1


