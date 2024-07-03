Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5BAEC31D97
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Jul 2024 21:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4B3iA/wt292iPzlQ3NlN/3BkJe4Kss6jwJQvuDphHUk=; b=JpOnqffYX1Ep89fUi2l79kie6i
	n/U0++vKf3+IUcqNWKibzM8pL67arqDzcsrWwca0iUxa87qOcEddtKdkFywFRWJkAZCG55PxtBDAV
	dfHPT6TBEf46z4IW/WEACyuqLvxZkY4PzmOIahpUGR6CX2a04QOcUtWLpAPxRYQt0k9RGxvsfv7aT
	RbVOS/Hm2Sl1JGSmD58btfLvoGZNHuV6eof/ewrg43j8PGm+wcfnCTRQy4ouFOKNXW6ll4PwkVhEt
	f8YhXbwAoxnsRiAnVsTXtfjpp+9R/4bIzNF+cvT9CRrff6xCZn4JUJnU8gkWjJc4V0mxfGA4DH7jF
	1UHPhjkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sP7l4-0000000BXD0-1EtD;
	Wed, 03 Jul 2024 21:43:22 +0000
Received: from mail-oa1-f42.google.com ([209.85.160.42])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sP7l2-0000000BXBI-0yX4
	for linux-mediatek@lists.infradead.org;
	Wed, 03 Jul 2024 21:43:21 +0000
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-25d0f8d79ebso8136fac.0
        for <linux-mediatek@lists.infradead.org>; Wed, 03 Jul 2024 14:43:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720042999; x=1720647799;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4B3iA/wt292iPzlQ3NlN/3BkJe4Kss6jwJQvuDphHUk=;
        b=aawHtXiWV27hoOum2vjXCl8p6zKaW3FfSjDM9yQiA0CsKRLkbUvJMzMQ0MjItoLYs+
         0ZgOd9TDkamr7iG4pltO8Dx3yc0+tg73GyAYXJ+Z4Ak1bfgbpGdumqm+q1fx+wlx23DF
         I0gschFQz6dAWvv9kRxngbV1Zzl1y2ftnwAz976bUuI2Q4OWcH7oJqDmr3rKOGR2SGMK
         NIq3lvvEwsQCVsNdcGpys6jEWesRHYas+OC6SoFPJ0PIVcLTmgWBrE+tnM1Rc+LWl8wp
         GupIb17zos/aQDLJ00egHVsqG1LE+akBLP8sH0verjNwJEfagcwj+jb/FV7QgmPkJlUj
         LSOQ==
X-Forwarded-Encrypted: i=1; AJvYcCUu6UWA91L+yEydAHSeJJ7cVKvhmM41JDWBGn5Bhz6DBm+cuJzMI0VvUE5jIgVFYzirdJi8Bni8hmRKimyYQNTMGSCz2wYiN2xGJWpuHyGbmydR
X-Gm-Message-State: AOJu0Yzx5EXmRi8BdeY440XNHpsuqCdM7WRu88RrRnO/rhu7h6HGUUWD
	Kz9+WUdBanM9a/lER4dgguFqUEjkMj7zQt7WS0+2Fmynvcg/4G/2
X-Google-Smtp-Source: AGHT+IGagnQr9R2SqTk/ttCi+flx1eUf6vzlrnRL8I6wKE/xqEuIlzcLpsgBjl1PvNgCgA3Equ378w==
X-Received: by 2002:a05:6870:55d4:b0:25e:dce:491b with SMTP id 586e51a60fabf-25e0dce4b4amr2524158fac.1.1720042999249;
        Wed, 03 Jul 2024 14:43:19 -0700 (PDT)
Received: from sean-ThinkPad-T450s.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-701f7b20953sm2111417a34.54.2024.07.03.14.43.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 14:43:18 -0700 (PDT)
From: sean.wang@kernel.org
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: sean.wang@mediatek.com,
	deren.wu@mediatek.com,
	mingyen.hsieh@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 14/29] wifi: mt76: mt7925: add link handling in the BSS_CHANGED_PS handler
Date: Wed,  3 Jul 2024 14:42:19 -0700
Message-Id: <4e072a7ac17d2f7c97569ba724b74434ac414db3.1720042294.git.sean.wang@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1720042294.git.sean.wang@kernel.org>
References: <cover.1720042294.git.sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240703_144320_310443_79227F26 
X-CRM114-Status: GOOD (  10.81  )
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

Added link handling in the BSS_CHANGED_PS handler.

Co-developed-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Co-developed-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/main.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index 69849146610e..46ce23c7ec27 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -1635,6 +1635,7 @@ static void mt7925_vif_cfg_changed(struct ieee80211_hw *hw,
 				   struct ieee80211_vif *vif,
 				   u64 changed)
 {
+	struct mt792x_vif *mvif = (struct mt792x_vif *)vif->drv_priv;
 	struct mt792x_dev *dev = mt792x_hw_dev(hw);
 
 	mt792x_mutex_acquire(dev);
@@ -1651,8 +1652,17 @@ static void mt7925_vif_cfg_changed(struct ieee80211_hw *hw,
 		mt7925_mcu_update_arp_filter(&dev->mt76, &mvif->bss_conf.mt76);
 	}
 
-	if (changed & BSS_CHANGED_PS)
-		mt7925_mcu_uni_bss_ps(dev, &vif->bss_conf);
+	if (changed & BSS_CHANGED_PS) {
+		unsigned long valid = ieee80211_vif_is_mld(vif) ?
+					      mvif->valid_links : BIT(0);
+		struct ieee80211_bss_conf *bss_conf;
+		int i;
+
+		for_each_set_bit(i, &valid, IEEE80211_MLD_MAX_NUM_LINKS) {
+			bss_conf = mt792x_vif_to_bss_conf(vif, i);
+			mt7925_mcu_uni_bss_ps(dev, bss_conf);
+		}
+	}
 
 	mt792x_mutex_release(dev);
 }
-- 
2.25.1


