Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E222AC27C53
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Jun 2024 03:03:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v5C4HXZ5Qn+NC0fHMwJmteg0sATZeShS/Ir1vuk6irI=; b=b9vaq+rCDzIu+9BdDgM+sMOwIy
	O/yt/hHCAPwl2EkWRGRo5qiuzuNOr/c+KN+vaf4jt8icPKgBfnNTmO5g4sms83728xGERgS6eokyZ
	7zrr7EhBLGSlv+K7lnOpWBGk4F7CQe3cuAcwHj841fxoZ1is2GBraSFO0PuKjV7KDfYlraz4oKgEE
	XjXdcJ04OCsa9EvZxDQSnZrRWztXm2b+ehRxYvPE+Fbi/MKLa0E7Em9C8CGQlXK+u5jDeyHqXA2N4
	WokIXlWiJUI6G96YbJ/CBi1k/QK2qd9ohTZCLR4t2ZBPf8v3vowTqL/HjaGqlcoA1yYpgrKIozlJF
	ucOeoH3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHakR-0000000EvsP-0Iy2;
	Thu, 13 Jun 2024 03:03:35 +0000
Received: from mail-oo1-f49.google.com ([209.85.161.49])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHakM-0000000EvpA-2VAb
	for linux-mediatek@lists.infradead.org;
	Thu, 13 Jun 2024 03:03:32 +0000
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-5bae827df63so40145eaf.3
        for <linux-mediatek@lists.infradead.org>; Wed, 12 Jun 2024 20:03:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718247809; x=1718852609;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v5C4HXZ5Qn+NC0fHMwJmteg0sATZeShS/Ir1vuk6irI=;
        b=nh9yc1AwtjJiknZhfPABDIFUNvusx/RRcxEJYdBVv5xJ6bnDXJPeRRTxCOzGn+j6e6
         an735uHd+xINfue8TIkjqFLXtk6G9SFSh4xLvRoKC7OKg4fLG5D1ioIgHuu+JGr7MZ/O
         opF72NaDi7UqgjXNtaV5OeYG8tAgHu1RDnBqbzB2PsWVleM32ILrUekMdMCrjpEjNy0f
         cI6vKJhyzX6wdhc3P4XYu6jBzX7x/ps5W3QWzACm3RsAU14JD2moHyYpXNmM0PoE6MlK
         xugNWS2AqD6f2XaIMU//75EdCKSU5dVNjmfEqqpkfjunSFdNZbamj7tRpZuxBmtTYvKu
         AKew==
X-Forwarded-Encrypted: i=1; AJvYcCXH9ze8aW7V7Us+ahiBJFZepLov3nDlZQQ+79L7Kq9JqSIg68OYgFhxUBwf9tTjcgHH7X5L42w0tWEZKi4yNUOhIAe5fHuC03fDcYS8SnRuz19H
X-Gm-Message-State: AOJu0Yy2voXo2ard6BB3SYnfvQ1i3ZcnlSKsyrptnFQjjp3GFAU+bH/y
	6N9xuGrmWPWlC2mlSfC/FJdrZsQr9QWPMSaKF2dUsdmdRsigsqtJKNnH1vOSRiU=
X-Google-Smtp-Source: AGHT+IEe4P0VHMNgBu8piViehq/J0PqaKqHtNs+BhhWQq35+u9yyXiLnME99TrmCwao0gjU3BjWkig==
X-Received: by 2002:a4a:a5ca:0:b0:5ba:e11d:a2ae with SMTP id 006d021491bc7-5bb3b9f4ef7mr3671748eaf.1.1718247809367;
        Wed, 12 Jun 2024 20:03:29 -0700 (PDT)
Received: from sean-ThinkPad-T450s.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5bd629263c5sm67685eaf.46.2024.06.12.20.03.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 20:03:28 -0700 (PDT)
From: sean.wang@kernel.org
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: sean.wang@mediatek.com,
	deren.wu@mediatek.com,
	mingyen.hsieh@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 20/47] wifi: mt76: mt7925: extend mt7925_mcu_uni_bss_bcnft for per-link BSS
Date: Wed, 12 Jun 2024 20:02:14 -0700
Message-Id: <20240613030241.5771-21-sean.wang@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240613030241.5771-1-sean.wang@kernel.org>
References: <20240613030241.5771-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240612_200330_780679_30EBEF08 
X-CRM114-Status: GOOD (  13.43  )
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

Extend mt7925_mcu_uni_bss_bcnft with per-link BSS configuration.

The patch we created is a prerequisite to enable the MLO function in the
driver. It is purely a refactoring patch so the functionality should
remain unchanged.

Co-developed-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/mcu.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index a40ad1578212..8950df09a025 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -1281,10 +1281,10 @@ int mt7925_mcu_uni_bss_ps(struct mt792x_dev *dev, struct ieee80211_vif *vif)
 }
 
 static int
-mt7925_mcu_uni_bss_bcnft(struct mt792x_dev *dev, struct ieee80211_vif *vif,
-			 bool enable)
+mt7925_mcu_uni_bss_bcnft(struct mt792x_dev *dev,
+			 struct ieee80211_bss_conf *link_conf, bool enable)
 {
-	struct mt792x_vif *mvif = (struct mt792x_vif *)vif->drv_priv;
+	struct mt792x_bss_conf *mconf = mt792x_link_conf_to_mconf(link_conf);
 	struct {
 		struct {
 			u8 bss_idx;
@@ -1301,17 +1301,17 @@ mt7925_mcu_uni_bss_bcnft(struct mt792x_dev *dev, struct ieee80211_vif *vif,
 		} __packed bcnft;
 	} __packed bcnft_req = {
 		.hdr = {
-			.bss_idx = mvif->bss_conf.mt76.idx,
+			.bss_idx = mconf->mt76.idx,
 		},
 		.bcnft = {
 			.tag = cpu_to_le16(UNI_BSS_INFO_BCNFT),
 			.len = cpu_to_le16(sizeof(struct bcnft_tlv)),
-			.bcn_interval = cpu_to_le16(vif->bss_conf.beacon_int),
-			.dtim_period = vif->bss_conf.dtim_period,
+			.bcn_interval = cpu_to_le16(link_conf->beacon_int),
+			.dtim_period = link_conf->dtim_period,
 		},
 	};
 
-	if (vif->type != NL80211_IFTYPE_STATION)
+	if (link_conf->vif->type != NL80211_IFTYPE_STATION)
 		return 0;
 
 	return mt76_mcu_send_msg(&dev->mt76, MCU_UNI_CMD(BSS_INFO_UPDATE),
@@ -1685,7 +1685,7 @@ int mt7925_mcu_set_beacon_filter(struct mt792x_dev *dev,
 	int err = 0;
 
 	if (enable) {
-		err = mt7925_mcu_uni_bss_bcnft(dev, vif, true);
+		err = mt7925_mcu_uni_bss_bcnft(dev, &vif->bss_conf, true);
 		if (err)
 			return err;
 
-- 
2.34.1


