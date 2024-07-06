Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 429B6C2BD09
	for <linux-mediatek@archiver.kernel.org>; Sat,  6 Jul 2024 08:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DqUVQrvv47c1itp+tRv4q6cRbFuGM81+0GzeLk9XrrU=; b=Sk10UrYjNfPx2PMaS3lwq+1TMe
	p4VrjlRGoX1JgE690HbqRmJPvPgm0LtAkGB3Ed0bOgHVGEj9DlSJRUs3puTC8qBOIzm3TVPvjv0LZ
	Gbvr7Rvy0VMBKcGF7K81juc+r8ah+ivnpdXEFVSgtrbATHmc3IawO29GRZ8SkDqRLeUXb0BWhT82i
	Txqb2G+x6IeIPlnuNT0oBpXHpu6Yp4yZS6CtLia9yZ/3pA6E84TkHSjGE5wZHau7uNylcua4m8x6Y
	SVdW+nk3/9AS2CN3bW5tI0TSpmI8DfsEtsR4qB45msKwsc1N4gnbjKZ9CqMnirVb/ai9hKja0UQlS
	rcNG+6Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQ0mx-0000000HY2W-3yk0;
	Sat, 06 Jul 2024 08:28:59 +0000
Received: from mail-oi1-f181.google.com ([209.85.167.181])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQ0mv-0000000HXzk-0tQ2
	for linux-mediatek@lists.infradead.org;
	Sat, 06 Jul 2024 08:28:58 +0000
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-3d1b5f32065so140336b6e.2
        for <linux-mediatek@lists.infradead.org>; Sat, 06 Jul 2024 01:28:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720254536; x=1720859336;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DqUVQrvv47c1itp+tRv4q6cRbFuGM81+0GzeLk9XrrU=;
        b=MqN3fEs85+GJwZLXb3aALGhU9QNKxJpSNAd/gbaQ/yYXRYz3+zPwHMJJ0nbEmUOhlm
         cn6BTp3vsjbXCAmjHlcVQW44rS7Skz7ES1rR9s6h8vX/8RgLWJyyO2Op5jKIt3UUjLi/
         6TEGl/RR4EgV6AxTDuAlEU2lBF9KVoGfVtOfJ303ydL57QuyvRaXYQ9hUL0HQ1ry1d82
         0U71K+KEwBnE5NBD9BjQPaR0QFA1BgOYXtApClt8V17gNQp8yiKaeSkZLtyBTKnBbh12
         LPnI1I0mIud1IwchlWKZuZJF+ymfeeF+GPEcIPe5nQoR/GO/ddnF+zNACOr7BmHriQRd
         EdJg==
X-Forwarded-Encrypted: i=1; AJvYcCU/mXHZ+7vFQObBoEzA8QtsUWrvhU1rqL5PMCci4+MJmfpDZ1ZqRNsU1/GheNWDB5Y1gRBrPUswfvKW6kw6Nqte2bmnUkZT5hGDBqdoivNkVarJ
X-Gm-Message-State: AOJu0Yyp6JXJfimfk12DQJQ34liBT4wuPfXyKrg25nE+hkMM3y/UHoEt
	lEGeMGhk6hw3SygJxpXuWps/I/D4mmwkUHJXGYMROL24JPxUCM1W
X-Google-Smtp-Source: AGHT+IHe1Y1PPxOR2nKL9g+jjNvFWNPedzbzTVhQiKhUAQYU+OXCr46RR8IQejk8rRcZT0GyuhU2lQ==
X-Received: by 2002:a05:6870:eca3:b0:25e:c0b:82c5 with SMTP id 586e51a60fabf-25e2bf101admr6656181fac.3.1720254535992;
        Sat, 06 Jul 2024 01:28:55 -0700 (PDT)
Received: from sean-ThinkPad-T450s.attlocal.net ([2600:1702:5083:7610:1e13:57ab:ecc5:1fd4])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-25e71070ba1sm10744fac.34.2024.07.06.01.28.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jul 2024 01:28:54 -0700 (PDT)
From: sean.wang@kernel.org
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: sean.wang@mediatek.com,
	deren.wu@mediatek.com,
	mingyen.hsieh@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 20/37] wifi: mt76: mt7925: add link handling in the BSS_CHANGED_ARP_FILTER handler
Date: Sat,  6 Jul 2024 01:28:00 -0700
Message-Id: <6e26e2ce253630ab29702693a7822f9961de6a18.1720248331.git.sean.wang@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1720248331.git.sean.wang@kernel.org>
References: <cover.1720248331.git.sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240706_012857_428517_6B010186 
X-CRM114-Status: GOOD (  12.69  )
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

add link handling in the BSS_CHANGED_ARP_FILTER handler.

Co-developed-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Co-developed-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/main.c | 16 ++++++++--------
 drivers/net/wireless/mediatek/mt76/mt7925/mcu.c  |  8 +++++---
 drivers/net/wireless/mediatek/mt76/mt7925/mcu.h  |  2 +-
 3 files changed, 14 insertions(+), 12 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index 791e90f5760f..8acce16d88d6 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -1749,6 +1749,10 @@ static void mt7925_vif_cfg_changed(struct ieee80211_hw *hw,
 {
 	struct mt792x_vif *mvif = (struct mt792x_vif *)vif->drv_priv;
 	struct mt792x_dev *dev = mt792x_hw_dev(hw);
+	unsigned long valid = ieee80211_vif_is_mld(vif) ?
+				      mvif->valid_links : BIT(0);
+	struct ieee80211_bss_conf *bss_conf;
+	int i;
 
 	mt792x_mutex_acquire(dev);
 
@@ -1759,17 +1763,13 @@ static void mt7925_vif_cfg_changed(struct ieee80211_hw *hw,
 	}
 
 	if (changed & BSS_CHANGED_ARP_FILTER) {
-		struct mt792x_vif *mvif = (struct mt792x_vif *)vif->drv_priv;
-
-		mt7925_mcu_update_arp_filter(&dev->mt76, &mvif->bss_conf.mt76);
+		for_each_set_bit(i, &valid, IEEE80211_MLD_MAX_NUM_LINKS) {
+			bss_conf = mt792x_vif_to_bss_conf(vif, i);
+			mt7925_mcu_update_arp_filter(&dev->mt76, bss_conf);
+		}
 	}
 
 	if (changed & BSS_CHANGED_PS) {
-		unsigned long valid = ieee80211_vif_is_mld(vif) ?
-					      mvif->valid_links : BIT(0);
-		struct ieee80211_bss_conf *bss_conf;
-		int i;
-
 		for_each_set_bit(i, &valid, IEEE80211_MLD_MAX_NUM_LINKS) {
 			bss_conf = mt792x_vif_to_bss_conf(vif, i);
 			mt7925_mcu_uni_bss_ps(dev, bss_conf);
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index 0991af877434..3d5eaeb96047 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -121,10 +121,12 @@ int mt7925_mcu_regval(struct mt792x_dev *dev, u32 regidx, u32 *val, bool set)
 EXPORT_SYMBOL_GPL(mt7925_mcu_regval);
 
 int mt7925_mcu_update_arp_filter(struct mt76_dev *dev,
-				 struct mt76_vif *vif)
+				 struct ieee80211_bss_conf *link_conf)
 {
-	struct ieee80211_vif *mvif = container_of((void *)vif, struct ieee80211_vif,
+	struct ieee80211_vif *mvif = container_of((void *)link_conf->vif,
+						  struct ieee80211_vif,
 						  drv_priv);
+	struct mt792x_bss_conf *mconf = mt792x_link_conf_to_mconf(link_conf);
 	struct sk_buff *skb;
 	int i, len = min_t(int, mvif->cfg.arp_addr_cnt,
 			   IEEE80211_BSS_ARP_ADDR_LIST_LEN);
@@ -136,7 +138,7 @@ int mt7925_mcu_update_arp_filter(struct mt76_dev *dev,
 		struct mt7925_arpns_tlv arp;
 	} req = {
 		.hdr = {
-			.bss_idx = vif->idx,
+			.bss_idx = mconf->mt76.idx,
 		},
 		.arp = {
 			.tag = cpu_to_le16(UNI_OFFLOAD_OFFLOAD_ARP),
diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.h b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.h
index fefb6ab384bb..7fb46cad9157 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.h
@@ -626,5 +626,5 @@ int mt7925_mcu_set_chctx(struct mt76_phy *phy, struct mt76_vif *mvif,
 			 struct ieee80211_chanctx_conf *ctx);
 int mt7925_mcu_set_rate_txpower(struct mt76_phy *phy);
 int mt7925_mcu_update_arp_filter(struct mt76_dev *dev,
-				 struct mt76_vif *vif);
+				 struct ieee80211_bss_conf *link_conf);
 #endif
-- 
2.25.1


