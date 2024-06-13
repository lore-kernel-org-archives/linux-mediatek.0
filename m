Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CAC2C27C53
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Jun 2024 03:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o7fyLN2eTcT5yVDs+Za/KLYWdVcVwhKyVQJ642fwgMc=; b=Cr6GP6APtKjYopfU37IN5Wn7ti
	w5Lzio6qeVWVwp9QlgxJzsats1JtQdv817BsQkFQ1bmdZnh8TUbVf7BJwzGwDpS3+izcN6+aLqfH/
	rwttlUy+jjofbd4F2JlN5KWigRi0Dek/UiJHEwBJjVkLOo/7eBYUORoqGUgksrYUxLF06Nm9Pg+17
	Anu05KsYYhLQ8IM45W6LOiAwDvDQRr+cpQ1f87Kb1eWBX+i4APb0qmZe9nzbR41dS8B8ogmtqdVqq
	CkEsPltBOn/uNSC9BuJaeCw6MuwiQGWNuWYJ2ZWSQ+0wd9bABTnInkoLNdcgN62FVDJekwCUeqpb6
	prCsy9TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHakG-0000000Evlx-2tXL;
	Thu, 13 Jun 2024 03:03:24 +0000
Received: from mail-oo1-f54.google.com ([209.85.161.54])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHakD-0000000EviN-1LZI
	for linux-mediatek@lists.infradead.org;
	Thu, 13 Jun 2024 03:03:23 +0000
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-5b3356fd4f3so38460eaf.1
        for <linux-mediatek@lists.infradead.org>; Wed, 12 Jun 2024 20:03:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718247798; x=1718852598;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o7fyLN2eTcT5yVDs+Za/KLYWdVcVwhKyVQJ642fwgMc=;
        b=K+e81YwCxOl5SQxl6+heEUSUGQWkoGq/HEQnrNjUfZkZ5b2dLTWcekOFjUceXm+Drv
         92q46bZetr3GNi6x38Tw1JhZSn7mZxr4Fs3P3y5tCk4LhWMs7zROi85hqSL4WsjDuHjW
         HRRMPFauNb95UqPRvM/7iGFgXzD6Cfz47ic6TEDWT8xk7jZ61Ysf3gUNUfmi6xfz3MBx
         kHSNkK1SbA7KYSDFaf146AmRxuOUbMUMXVfEMl4wzNAUgpwIc8LFGiixhQ3nYC6eYUmE
         m7UbZybqCDRgknyjr6dU9UzAG0E+PRT0bVSJdA72vWuFyhT5d3cyee3tpRhRhtHmHYgt
         t5LA==
X-Forwarded-Encrypted: i=1; AJvYcCUGV42pudhNhidM23kAzVrJhOKfuDMfJ7UWQ5VnX+byTfiVcrlrZ10jbwVde681SBMlLWLZd/F3IqrPK12MUra3IzXMlnkG/jM/Pd6gzMvNYJ8d
X-Gm-Message-State: AOJu0Yz1XQVI/8QG5qkNh7FhJGYuKmS9d3ehwlKRe3WTuxtLrYGho8FU
	+yb3Hhtr31y0McPM+U7wb5bQLF0If0aUWsGv7eyidiTy/xoQB9X6
X-Google-Smtp-Source: AGHT+IF3tKvAO7O2wwRJgNy6xEVfg8yq+WFBOGurkxFmdxTHX8HN8CopPZp2U0FN7ExMmIvLd10M3Q==
X-Received: by 2002:a4a:8552:0:b0:5ba:ca86:a025 with SMTP id 006d021491bc7-5bb3b7a9135mr3996007eaf.0.1718247797718;
        Wed, 12 Jun 2024 20:03:17 -0700 (PDT)
Received: from sean-ThinkPad-T450s.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5bd629263c5sm67685eaf.46.2024.06.12.20.03.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 20:03:15 -0700 (PDT)
From: sean.wang@kernel.org
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: sean.wang@mediatek.com,
	deren.wu@mediatek.com,
	mingyen.hsieh@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 14/47] wifi: mt76: mt7925: extend mt7925_mcu_bss_bmc_tlv for per-link BSS
Date: Wed, 12 Jun 2024 20:02:08 -0700
Message-Id: <20240613030241.5771-15-sean.wang@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240613030241.5771-1-sean.wang@kernel.org>
References: <20240613030241.5771-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240612_200321_440756_8CC15A53 
X-CRM114-Status: GOOD (  11.29  )
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

Extend mt7925_mcu_bss_bmc_tlv with per-link BSS configuration.

The patch we created is a prerequisite to enable the MLO function in the
driver. It is purely a refactoring patch so the functionality should
remain unchanged.

Co-developed-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/mcu.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index 93ce018a0801..48b157f42db9 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -2179,12 +2179,13 @@ mt7925_mcu_bss_sec_tlv(struct sk_buff *skb, struct ieee80211_vif *vif)
 static void
 mt7925_mcu_bss_bmc_tlv(struct sk_buff *skb, struct mt792x_phy *phy,
 		       struct ieee80211_chanctx_conf *ctx,
-			   struct ieee80211_vif *vif,
+		       struct ieee80211_bss_conf *link_conf,
 			   struct ieee80211_sta *sta)
 {
 	struct cfg80211_chan_def *chandef = ctx ? &ctx->def : &phy->mt76->chandef;
-	struct mt76_vif *mvif = (struct mt76_vif *)vif->drv_priv;
+	struct mt792x_bss_conf *mconf = mt792x_link_conf_to_mconf(link_conf);
 	enum nl80211_band band = chandef->chan->band;
+	struct mt76_vif *mvif = &mconf->mt76;
 	struct bss_rate_tlv *bmc;
 	struct tlv *tlv;
 	u8 idx = mvif->mcast_rates_idx ?
@@ -2335,7 +2336,7 @@ int mt7925_mcu_add_bss_info(struct mt792x_phy *phy,
 				 mvif->sta.deflink.wcid.idx, enable);
 	mt7925_mcu_bss_sec_tlv(skb, link_conf->vif);
 
-	mt7925_mcu_bss_bmc_tlv(skb, phy, ctx, link_conf->vif, sta);
+	mt7925_mcu_bss_bmc_tlv(skb, phy, ctx, link_conf, sta);
 	mt7925_mcu_bss_qos_tlv(skb, link_conf);
 	mt7925_mcu_bss_mld_tlv(skb, link_conf, sta);
 	mt7925_mcu_bss_ifs_tlv(skb, link_conf);
-- 
2.34.1


