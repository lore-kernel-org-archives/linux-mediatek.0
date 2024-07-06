Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1B3AC38150
	for <linux-mediatek@archiver.kernel.org>; Sat,  6 Jul 2024 08:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KwoTDp/PU6KVvsRx+iiZe0E2Jl8hFt5E3KQe6+2m5U4=; b=l5EyOTaXHOz0bzb2mDgXw50ret
	aczJoFZQe+d028bHATCDj5/UWd5G86HHqbLBxOHRh44uRYcTZFeP0v7LXaR8gFvvGm2GfqEIttoZL
	kbJJSl/FFYknRNBul3DAh9aNQYCC/PpQdbEZLvQBXdU820JS5C3VyFDZhnc8cX/Ec1BCZjEW187v+
	lrRICzGbvaUrj82941yva4nJko/Bk5yOJGS+XRDnxqk65MLQdF2l9I7h3MoZ6pnbt/p053thk7TuQ
	aRI9gILwgDF+IF9KN9t7kOh9kaexi9A6cba2yyuwOm3XtMZ7mRKHn8xmoz043KC47ylF1gPrjH/vE
	Cou+7GsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQ0nJ-0000000HYHV-20WM;
	Sat, 06 Jul 2024 08:29:21 +0000
Received: from mail-oi1-f181.google.com ([209.85.167.181])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQ0nE-0000000HYDw-05gS
	for linux-mediatek@lists.infradead.org;
	Sat, 06 Jul 2024 08:29:17 +0000
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-3d56754a4ceso322086b6e.1
        for <linux-mediatek@lists.infradead.org>; Sat, 06 Jul 2024 01:29:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720254555; x=1720859355;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KwoTDp/PU6KVvsRx+iiZe0E2Jl8hFt5E3KQe6+2m5U4=;
        b=RKecNYGSj+1aT/OiczYVvodW4DkGflR9p53/5iR5mVKOQ9eHcCHbquJONZ/bsN/grr
         ba/laoirNuu1TlrZiFlRR0k39/DFEH7cdKniGiITuXCR0M/MikCppIhSrIapCIjB3+bg
         zRe1pG1pN2dA2kf1aEm7NWhvpSpvzVlrfTpOc6COkUw+qOJsmlq7qC4gDX7Oc8VIlDNP
         RTTNVQdLgOjpofra5A3yB6nviGscDW5XvUHJ2/27J95J0SijQKyQkbZ6x22GPIgsHVf2
         i3UUtAMJAPrySCwi/LT5S2QRe2FWsiEN5x+mJgVy6KCCYUfX8NWlEo1iiArCkJo6dsQP
         NQ6Q==
X-Forwarded-Encrypted: i=1; AJvYcCUiIeRXxrNn5BYhA4LLp4cWmZJRp9D+do8Gi/mGDyav7D49/e86huAl4r58zhIwptbNsj3yccnYUwtGnx7cz11+cuqJ9Mm9WxN5QQyWXLuOXHAI
X-Gm-Message-State: AOJu0YzzW/wsRgA5gwwyivPVXe3NU78URA9Is6LlKoTJPMn1KhH5l4JR
	8IQWL2JqAK7j4fKbcVUf7Q67pcE7BQxg9leCDJK6t7YsfaXWM/Y4
X-Google-Smtp-Source: AGHT+IFTMYR43GUbUUITrkSqP8yZGJMr9ngdJS6LdwW1lPHqmU+a7d3M3ltpxe9UxYBsSyTGUHu0jA==
X-Received: by 2002:a05:6871:24ca:b0:254:ecbd:1815 with SMTP id 586e51a60fabf-25e2bffce48mr6347004fac.5.1720254555137;
        Sat, 06 Jul 2024 01:29:15 -0700 (PDT)
Received: from sean-ThinkPad-T450s.attlocal.net ([2600:1702:5083:7610:1e13:57ab:ecc5:1fd4])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-25e71070ba1sm10744fac.34.2024.07.06.01.29.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jul 2024 01:29:13 -0700 (PDT)
From: sean.wang@kernel.org
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: sean.wang@mediatek.com,
	deren.wu@mediatek.com,
	mingyen.hsieh@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 31/37] wifi: mt76: mt7925: update mt7925_mcu_sta_rate_ctrl_tlv for MLO
Date: Sat,  6 Jul 2024 01:28:11 -0700
Message-Id: <4f6ca2d082627bb93f79d5a4df80dc08998ee5d2.1720248331.git.sean.wang@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1720248331.git.sean.wang@kernel.org>
References: <cover.1720248331.git.sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240706_012916_092061_C13024F2 
X-CRM114-Status: UNSURE (   9.42  )
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

Get band information from the per-link BSS.

Co-developed-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Co-developed-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Deren Wu <deren.wu@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/mcu.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index e6e57d11daf6..8fc75f9002d1 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -1714,12 +1714,20 @@ mt7925_mcu_sta_rate_ctrl_tlv(struct sk_buff *skb,
 			     struct ieee80211_link_sta *link_sta)
 {
 	struct mt792x_vif *mvif = (struct mt792x_vif *)vif->drv_priv;
-	struct cfg80211_chan_def *chandef = &mvif->bss_conf.mt76.ctx->def;
-	enum nl80211_band band = chandef->chan->band;
+	struct ieee80211_bss_conf *link_conf;
+	struct cfg80211_chan_def *chandef;
 	struct sta_rec_ra_info *ra_info;
+	struct mt792x_bss_conf *mconf;
+	enum nl80211_band band;
 	struct tlv *tlv;
 	u16 supp_rates;
 
+	link_conf = mt792x_vif_to_bss_conf(vif, link_sta->link_id);
+	mconf = mt792x_vif_to_link(mvif, link_sta->link_id);
+	chandef = mconf->mt76.ctx ? &mconf->mt76.ctx->def :
+				    &link_conf->chanreq.oper;
+	band = chandef->chan->band;
+
 	tlv = mt76_connac_mcu_add_tlv(skb, STA_REC_RA, sizeof(*ra_info));
 	ra_info = (struct sta_rec_ra_info *)tlv;
 
-- 
2.25.1


