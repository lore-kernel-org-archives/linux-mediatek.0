Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66329C31D97
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Jul 2024 21:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=peHtFkucpkPBpD5rHx4xIXV2z8XQ+Jk1EN6IvhoGfSo=; b=pq0mvKdYa/lcKjiXUu4oAjUOi+
	M9HdfrHEkqV/pmxdk++9Rs7Ol+SQ2Bb/ADEulUq5HjKKEduYKAGmJuvchnfOVmSiwFC2IE2GUa3PP
	v1fNKIMIqUgL1ubKD0QbJ29XulXgx160q+CDAR0G5YkkAk6+LwQdIFqcM9M4L/UeloypD2t8Z44Ww
	wPJfEMCT7HKepfGWPIi9AkGf2EzBMNmxDw2wGmYNVBgu2d7TE+ClhPFv6MiuiWH0tBiPW4YPgQpyu
	LbxhUlzvhT5ywCOmu/r+cx9jkjmXh60Aw2bflDN41UYCdjlxgYoewXh9L3lJF13Thn2y0NsDZ/cN1
	Y/lfWEBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sP7l8-0000000BXF2-08cF;
	Wed, 03 Jul 2024 21:43:26 +0000
Received: from mail-oa1-f42.google.com ([209.85.160.42])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sP7l3-0000000BXCQ-2lL4
	for linux-mediatek@lists.infradead.org;
	Wed, 03 Jul 2024 21:43:24 +0000
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-25cd49906aeso3966fac.2
        for <linux-mediatek@lists.infradead.org>; Wed, 03 Jul 2024 14:43:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720043001; x=1720647801;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=peHtFkucpkPBpD5rHx4xIXV2z8XQ+Jk1EN6IvhoGfSo=;
        b=p2G8RqWIvh2WMLhe6SmTQY+EXqx6v+FffYJxWqEOIR4UhIO0EjZ5bgFqMK1XBScaFt
         AllsWwJohfK4/jyXFWt7sd6bkXDxP6/PpWhU+Bcur3MtBJcuNCfGPITyJfgXssbZZtCS
         t8gtGhdKlV21ZmVzQyrCZwYRvVYEfUouphIvNovcvomD4H1xQX3OIQP1VSIHazoAPMJa
         3gudyhcCuYkq8hsQNx2yOH51WYkdsvyPPJFQehadP+NQROksFzsACiGQVI9t610xjSPM
         pG5AyfL9Wj8ulc21XTtUZuCc8UAQGRDw33O94BTG7GL3HJDDN9nZ3bymNRyrqd4SYOwq
         CXtA==
X-Forwarded-Encrypted: i=1; AJvYcCW02cYNji8GQptjw+4eXU/c3p4BOEOi0u6vIP46FeTUbYRhNA15ujAuXI2El+vd2mbJxhy+T13KY1sCKGJO+BiCb1VoYPSzB2QlJyi14PiBxpD+
X-Gm-Message-State: AOJu0Yxr06o/cgcwsEdVN/iEq4AnOM0zRt6VvcEwBRSonNlGczLeu1MR
	iSnhMCwkqec7UxcdV4keOv35Ii9OQdUGoXZFcg3GwG0R6Rd1wvBJ
X-Google-Smtp-Source: AGHT+IEqzeo8RoR6l2yEjD7P2xm5c7YuPu83j3lo5/VHbBcEZ6c8yqDGnp7kWYGmbvaY1rl3PlnIew==
X-Received: by 2002:a05:6830:68cd:b0:700:d697:6ca7 with SMTP id 46e09a7af769-70207554355mr12585180a34.0.1720043000855;
        Wed, 03 Jul 2024 14:43:20 -0700 (PDT)
Received: from sean-ThinkPad-T450s.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-701f7b20953sm2111417a34.54.2024.07.03.14.43.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 14:43:19 -0700 (PDT)
From: sean.wang@kernel.org
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: sean.wang@mediatek.com,
	deren.wu@mediatek.com,
	mingyen.hsieh@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 15/29] wifi: mt76: mt7925: add link handling in mt7925_mcu_set_beacon_filter
Date: Wed,  3 Jul 2024 14:42:20 -0700
Message-Id: <c0f8c37379b48e481652739484b746a434548737.1720042294.git.sean.wang@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1720042294.git.sean.wang@kernel.org>
References: <cover.1720042294.git.sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240703_144321_739188_5294B0BE 
X-CRM114-Status: GOOD (  10.67  )
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

add link handling in mt7925_mcu_set_beacon_filter

Co-developed-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Co-developed-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/mcu.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index b62153671350..cf0377d26752 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -1814,11 +1814,20 @@ int mt7925_mcu_set_beacon_filter(struct mt792x_dev *dev,
 #define MT7925_FIF_BIT_CLR		BIT(1)
 #define MT7925_FIF_BIT_SET		BIT(0)
 	int err = 0;
+	int i;
 
 	if (enable) {
-		err = mt7925_mcu_uni_bss_bcnft(dev, &vif->bss_conf, true);
-		if (err)
-			return err;
+		struct mt792x_vif *mvif = (struct mt792x_vif *)vif->drv_priv;
+		unsigned long valid = ieee80211_vif_is_mld(vif) ?
+				      mvif->valid_links : BIT(0);
+		struct ieee80211_bss_conf *bss_conf;
+
+		for_each_set_bit(i, &valid, IEEE80211_MLD_MAX_NUM_LINKS) {
+			bss_conf = mt792x_vif_to_bss_conf(vif, i);
+			err = mt7925_mcu_uni_bss_bcnft(dev, bss_conf, true);
+			if (err < 0)
+				return err;
+		}
 
 		return mt7925_mcu_set_rxfilter(dev, 0,
 					       MT7925_FIF_BIT_SET,
-- 
2.25.1


