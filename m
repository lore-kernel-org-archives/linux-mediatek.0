Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAD43C31D97
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Jul 2024 21:43:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P9X2Ept/O0sdVjyMsMVTI9tmtIsMoebdCU/+EmBDr+w=; b=SW6e+cXKua51NEJakM1sK8e7eu
	oroDZDXsCxqvLMCWikx4fiymz8fHZYNz13349aPpf/RKTTx2uTmsNFGJ/lNmwJKBhSyiAMcbEQWfm
	0PgaKdxnYIlrMGlakrbxOWPCEMFUEn4eRQXNC5Y8dnV7rBtpbXvvvrlA/lo+caXhiCRQ7N0Wrt0e3
	sGu40DcCNelbm6F2y4gUtEveLspAujcZROVPncjqOjbzM25zUqxxLR6Ge3WfR3zpMfSFIzUyvPT00
	MKTlF//pMNUuYvyB6e3NZVrQjvq6kBlq2vMsiiDXs3F6ya8hVjdP1fctf0Zd1x/KYLS7wV4jrynnl
	bWF2IK4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sP7l1-0000000BXAz-25yu;
	Wed, 03 Jul 2024 21:43:19 +0000
Received: from mail-ot1-f52.google.com ([209.85.210.52])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sP7ky-0000000BX8j-26Rh
	for linux-mediatek@lists.infradead.org;
	Wed, 03 Jul 2024 21:43:17 +0000
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-702021fba9bso113276a34.1
        for <linux-mediatek@lists.infradead.org>; Wed, 03 Jul 2024 14:43:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720042995; x=1720647795;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P9X2Ept/O0sdVjyMsMVTI9tmtIsMoebdCU/+EmBDr+w=;
        b=QJU12ELsMKMQ9ymhbfoLaSncFLSVj0F4PqnxymHba8QkHYODkaWeS1kAOD+Ivw/lAC
         YF6vKGulpJzv9bHPQgm3RTE6LA/VGHwkWtBE7EKxue444TSfRvVvkBKGO3257uaqU0/U
         HBFkz4Chw4c1JWAcMFR6ZtjvSq1cRPTvrKXH10ARpfVEssri1NyUi1a6tdkqcINfBGAr
         N3j2bvLQlgRzzeqY0nNWrd843oFWfZSSJqLG2yobfL2/+qotPQdql98f3pfnrrI48bbh
         iQ1+Wjt5B/yrkg61K1lMzXnmXo6DH2bJ14kk0lDzzh+uF/B+S+ont29LGQOrW3JC5yf2
         KDEQ==
X-Forwarded-Encrypted: i=1; AJvYcCXVESbbn4N62sQHILg/K6mXkg1/rMQm6zyGXXLTopUIebhtcUD/WkSZIAT/l4amdHmT+rg9HztvY3muW5kOISNQjXrlCByFMZqraknEoPsRe5iv
X-Gm-Message-State: AOJu0YwW0HkyA0CVD93loZFsFuiltziSHbu+xpW2Q43wQhLI68Fu+Jbh
	1/51d+Ff0bALggzYn4XPWdSL1HQdJYjvcMdvLyTEmcLY6iJGVne2
X-Google-Smtp-Source: AGHT+IGGHAjakzXvQuXS7WHahMXqf59L78wQDAu9H4Irc6qqb9rGmo15ve1Zm6DDdwZ7tNsGV/Gmdg==
X-Received: by 2002:a05:6830:68cd:b0:700:d697:6ca7 with SMTP id 46e09a7af769-70207554355mr12585002a34.0.1720042995442;
        Wed, 03 Jul 2024 14:43:15 -0700 (PDT)
Received: from sean-ThinkPad-T450s.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-701f7b20953sm2111417a34.54.2024.07.03.14.43.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 14:43:13 -0700 (PDT)
From: sean.wang@kernel.org
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: sean.wang@mediatek.com,
	deren.wu@mediatek.com,
	mingyen.hsieh@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 12/29] wifi: mt76: mt7925: add link handling in mt7925_set_key
Date: Wed,  3 Jul 2024 14:42:17 -0700
Message-Id: <dc2b3c8b0bc52902cc4b25ce8912f4f27159caa4.1720042294.git.sean.wang@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1720042294.git.sean.wang@kernel.org>
References: <cover.1720042294.git.sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240703_144316_623132_E1AC1BDC 
X-CRM114-Status: GOOD (  12.39  )
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

add link handling in mt7925_set_key to support MLO-enabled
firmware.

Co-developed-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Co-developed-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7925/main.c   | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index 5360f8a71655..f85f7ea01f67 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -610,6 +610,9 @@ static int mt7925_set_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
 			  struct ieee80211_key_conf *key)
 {
 	struct mt792x_dev *dev = mt792x_hw_dev(hw);
+	struct mt792x_vif *mvif = (struct mt792x_vif *)vif->drv_priv;
+	struct mt792x_sta *msta = sta ? (struct mt792x_sta *)sta->drv_priv :
+				  &mvif->sta;
 	int err;
 
 	/* The hardware does not support per-STA RX GTK, fallback
@@ -624,7 +627,20 @@ static int mt7925_set_key(struct ieee80211_hw *hw, enum set_key_cmd cmd,
 
 	mt792x_mutex_acquire(dev);
 
-	err = mt7925_set_link_key(hw, cmd, vif, sta, key, vif->bss_conf.link_id);
+	if (ieee80211_vif_is_mld(vif)) {
+		unsigned int link_id;
+		unsigned long add;
+
+		add = key->link_id != -1 ? BIT(key->link_id) : msta->valid_links;
+
+		for_each_set_bit(link_id, &add, IEEE80211_MLD_MAX_NUM_LINKS) {
+			err = mt7925_set_link_key(hw, cmd, vif, sta, key, link_id);
+			if (err < 0)
+				break;
+		}
+	} else {
+		err = mt7925_set_link_key(hw, cmd, vif, sta, key, vif->bss_conf.link_id);
+	}
 
 	mt792x_mutex_release(dev);
 
-- 
2.25.1


