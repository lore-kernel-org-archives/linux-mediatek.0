Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C805FC27C53
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Jun 2024 03:03:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4OvuOb7g6PHWvVqmxVZoF3CYcis25XY+U2z4bDuSQW8=; b=R5jCUlfxC1mOOj2kLyPYs+oVtx
	Ai+FQjdQbh+d/0UoZNLAEXatDNG3vIytOoVtOTrP73xBSkVVcLBh0NmiCzzHwhJaVHP+Fx43rsMwi
	ldZs/oz1q1Vnp/OD2lAmdVPrSUHhtzvI/ev84fcM4x8ZFMoR+GAXVS2bfzq9I949RC8SR8B+AoHyv
	3IjRZNKP4N6xhtbdOWyw+fRnJx36MLN7w8ybnKQRVUY8BVN2AR2DqRFq5oAsbtDpoLNGcExBPqr+e
	e3jL1d9yPWK3OlDTT3bdJR8msb6xdFGKTYU7iWR5RzPWqSMUUEeBlq1SlPXxSaxJ6RdOoOmJkdAbM
	gjYTjGqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHakJ-0000000Evne-1Wer;
	Thu, 13 Jun 2024 03:03:27 +0000
Received: from mail-oa1-f45.google.com ([209.85.160.45])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHakD-0000000EvjW-2V9Y
	for linux-mediatek@lists.infradead.org;
	Thu, 13 Jun 2024 03:03:24 +0000
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-25075f3f472so76603fac.2
        for <linux-mediatek@lists.infradead.org>; Wed, 12 Jun 2024 20:03:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718247800; x=1718852600;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4OvuOb7g6PHWvVqmxVZoF3CYcis25XY+U2z4bDuSQW8=;
        b=jbSBjMP4wRzCR4dXCbJCeylhlTdEFmtmU33Yurz+UI1I7I1K+P6JnHY2B6bNHy2938
         +TifPNyecaCsO3M6ACyOE8YOrJUHa3D/ER5onCpN6tjoomTvMaETsPjnI14ZcqLV08IJ
         2MZqXn26FWDud5VAD3SfLUPsWNwAm5Oqfq+VxN0JKRZofKqvzVBgFYmiP1HBm2fTvwEP
         JSQw0BtI/FZPTd7M3qPlP01kosUaEHNJn+gUeI9VHLOIDwjUcnRq+zg/yKDXrXkjhb7N
         0OTMctQcT0lIqU+OwiV4hSexyTptuzrr1SkWeQ16FUa+ems12BL9yVNmEXPXsk9Gaxen
         IyIA==
X-Forwarded-Encrypted: i=1; AJvYcCVmK8P7FtXRN/qibHPBC0hsrSv+cD6x2+1MLOZOevBJ4Ndw3YjZHi3h5nZdBBH23ID1kH34GCxUdn1l4oGUUA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwGDWWO8w6HwpylOfpWjoETIeslJdfccJedtjWZYELhO6/ObvJp
	oYuYlStGsfqmGHnQS/Mll2a2ONsaOx3+kj5vQkGk9rN47xNd/inbWxuuWvkjIpI=
X-Google-Smtp-Source: AGHT+IHRrb4EIDm+nWVphSoixLDxx5BWiL1BA/EQfsBEJnVtg8ibFG8+4rJ23JbIbOgSAveW47ZePQ==
X-Received: by 2002:a05:6820:b0b:b0:5ba:c4ed:ee98 with SMTP id 006d021491bc7-5bb3b7a4c51mr3589617eaf.0.1718247800095;
        Wed, 12 Jun 2024 20:03:20 -0700 (PDT)
Received: from sean-ThinkPad-T450s.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5bd629263c5sm67685eaf.46.2024.06.12.20.03.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 20:03:18 -0700 (PDT)
From: sean.wang@kernel.org
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: sean.wang@mediatek.com,
	deren.wu@mediatek.com,
	mingyen.hsieh@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 15/47] wifi: mt76: mt7925: remove unused parameters in mt7925_mcu_bss_bmc_tlv
Date: Wed, 12 Jun 2024 20:02:09 -0700
Message-Id: <20240613030241.5771-16-sean.wang@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240613030241.5771-1-sean.wang@kernel.org>
References: <20240613030241.5771-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240612_200321_701978_3234BD1B 
X-CRM114-Status: UNSURE (   9.50  )
X-CRM114-Notice: Please train this message.
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

remove unused parameters in mt7925_mcu_bss_bmc_tlv

Co-developed-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/mcu.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index 48b157f42db9..797d4c936fec 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -2179,8 +2179,7 @@ mt7925_mcu_bss_sec_tlv(struct sk_buff *skb, struct ieee80211_vif *vif)
 static void
 mt7925_mcu_bss_bmc_tlv(struct sk_buff *skb, struct mt792x_phy *phy,
 		       struct ieee80211_chanctx_conf *ctx,
-		       struct ieee80211_bss_conf *link_conf,
-			   struct ieee80211_sta *sta)
+		       struct ieee80211_bss_conf *link_conf)
 {
 	struct cfg80211_chan_def *chandef = ctx ? &ctx->def : &phy->mt76->chandef;
 	struct mt792x_bss_conf *mconf = mt792x_link_conf_to_mconf(link_conf);
@@ -2336,7 +2335,7 @@ int mt7925_mcu_add_bss_info(struct mt792x_phy *phy,
 				 mvif->sta.deflink.wcid.idx, enable);
 	mt7925_mcu_bss_sec_tlv(skb, link_conf->vif);
 
-	mt7925_mcu_bss_bmc_tlv(skb, phy, ctx, link_conf, sta);
+	mt7925_mcu_bss_bmc_tlv(skb, phy, ctx, link_conf);
 	mt7925_mcu_bss_qos_tlv(skb, link_conf);
 	mt7925_mcu_bss_mld_tlv(skb, link_conf, sta);
 	mt7925_mcu_bss_ifs_tlv(skb, link_conf);
-- 
2.34.1


