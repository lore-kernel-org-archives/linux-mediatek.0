Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 397F6C2BD09
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Jul 2024 21:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sDQgeUMdcNQThv6Pb9X0Ecyn9jvt1k59yxEbX8sQC7Q=; b=Zpjys2OGFFEVzkaG72m9lMsEYa
	t4nCpB2QA+dJs9CuJWS2bBQWV0Jv03wAMX50kuS69VlhcYb/9pju+E07CwwvCYtLwMSQ/LuGxYczH
	s3pBR9Nd2he1URGz320kW7dNvsEYKsQl+0hAJhcSUpnYR3/vH6Wp7PGsshRc/PT2O/hrSClUz8gXe
	8oSBdat1x/owYEXHfnKD/fS78zv4QZzjS1rZLR7g8NbTNB2LndjGaHGkRRJL8cb2RUnPOOn4gGrLD
	wNtW0RIisqZcOOc9TzdL6hTIcfscPgcf7tzaKSbQlDoEUAGQWpoRHAh/ODwOWmYCjWfut1y2wfUfl
	rEF7JhMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sP7l2-0000000BXC4-3tbu;
	Wed, 03 Jul 2024 21:43:20 +0000
Received: from mail-oa1-f50.google.com ([209.85.160.50])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sP7l0-0000000BXAL-1BU7
	for linux-mediatek@lists.infradead.org;
	Wed, 03 Jul 2024 21:43:19 +0000
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-25cb5ee9d2dso4924fac.1
        for <linux-mediatek@lists.infradead.org>; Wed, 03 Jul 2024 14:43:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720042997; x=1720647797;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sDQgeUMdcNQThv6Pb9X0Ecyn9jvt1k59yxEbX8sQC7Q=;
        b=Buja6tJJ2FoO8EEMdgBoZJHCDnHag2F+rfnsEbisa+OhU1zQoTW8C+OCGPCJdBFdTF
         vsS8x1x/oT90WYDyUxg7SpEI06sbmVtjTaWYFDYlIVQjplJgyUcRrbeSVZiJuU7Uk2BF
         g/xEL7CGBS61+oxR9UAba4LkpnJh6r0A000NJEKK4jOflZGrmKyFOw8vOOJ3B5BDdVRC
         DO8TG0GSp6uaBqo/epHatS6Emmw6FX1e6Wo36olmuW98cv7mW144Qi4IUMH7mwe2YTpp
         1NM5LajBIgDBeQJViwNFLhyq/4stxINr5NBR6jm+WyToFrErod/JV/5vvg5RF/krF61/
         WcgQ==
X-Forwarded-Encrypted: i=1; AJvYcCWIYnV/HXxUYMO4Hisou7d7s+p13Xkiv0os11IJnRBc83Mbc+9wiqJQAcPT5DUI6VYZee4RhnlVf8cK4YJ/6pNX9heinCfgiZSOh4gvZTBrB0Tg
X-Gm-Message-State: AOJu0Yy9EBQUqmeV27iw2MIhPBnWk6qEAqPGDQUHv4qvmiX+JN9xX6RZ
	sUCh/Em76W4ieA+b7eZdfRMTOFniTpTZssZe/xOeLCaAq7STKJBd
X-Google-Smtp-Source: AGHT+IGyQO7IDv06Wu4jz/B8hpscCKFXRufWrE7Xm5ZF0rOGZnIDhXYzyXWDJbvg8U06ruakry8ojw==
X-Received: by 2002:a05:6870:8192:b0:24f:e599:9168 with SMTP id 586e51a60fabf-25db33732ffmr13537211fac.1.1720042997561;
        Wed, 03 Jul 2024 14:43:17 -0700 (PDT)
Received: from sean-ThinkPad-T450s.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-701f7b20953sm2111417a34.54.2024.07.03.14.43.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 14:43:15 -0700 (PDT)
From: sean.wang@kernel.org
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: sean.wang@mediatek.com,
	deren.wu@mediatek.com,
	mingyen.hsieh@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 13/29] wifi: mt76: mt7925: add link handling to mt7925_change_chanctx
Date: Wed,  3 Jul 2024 14:42:18 -0700
Message-Id: <88c5887954b04849adb0597d9a1ced7e976af897.1720042294.git.sean.wang@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1720042294.git.sean.wang@kernel.org>
References: <cover.1720042294.git.sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240703_144318_346727_749206A5 
X-CRM114-Status: GOOD (  11.16  )
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

add link handling to mt7925_change_chanctx

Co-developed-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Co-developed-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 .../net/wireless/mediatek/mt76/mt7925/main.c   | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index f85f7ea01f67..69849146610e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -1571,6 +1571,7 @@ mt7925_change_chanctx(struct ieee80211_hw *hw,
 {
 	struct mt792x_chanctx *mctx = (struct mt792x_chanctx *)ctx->drv_priv;
 	struct mt792x_phy *phy = mt792x_hw_phy(hw);
+	struct mt792x_bss_conf *mconf;
 	struct ieee80211_vif *vif;
 	struct mt792x_vif *mvif;
 
@@ -1585,7 +1586,22 @@ mt7925_change_chanctx(struct ieee80211_hw *hw,
 		mt7925_mcu_set_sniffer(mvif->phy->dev, vif, true);
 		mt7925_mcu_config_sniffer(mvif, ctx);
 	} else {
-		mt7925_mcu_set_chctx(mvif->phy->mt76, &mvif->bss_conf.mt76, ctx);
+		if (ieee80211_vif_is_mld(vif)) {
+			unsigned long valid = mvif->valid_links;
+			u8 i;
+
+			for_each_set_bit(i, &valid, IEEE80211_MLD_MAX_NUM_LINKS) {
+				mconf = mt792x_vif_to_link(mvif, i);
+				if (mconf && mconf->mt76.ctx == ctx)
+					break;
+			}
+
+		} else {
+			mconf = &mvif->bss_conf;
+		}
+
+		if (mconf)
+			mt7925_mcu_set_chctx(mvif->phy->mt76, &mconf->mt76, ctx);
 	}
 	mt792x_mutex_release(phy->dev);
 }
-- 
2.25.1


