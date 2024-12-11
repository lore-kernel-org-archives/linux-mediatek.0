Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6776E7717F
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Dec 2024 01:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UEJ5kdrUNfjAy+icZnm1esu6rZ7qPtHroRsyBXfTsTs=; b=ZrKDWkNm9I5C98T0CpPNegxMJI
	yvaQzA1W64BBBHP+PsQwjdLGlbFbMzYy0vJsBfyJw71Xi9o7gHQt4/MsWmxCVCG1Ksd4Lcak5MKdJ
	3ALHcTL4CTqdX+O0j3tr1QIc1jO/S53dJJBW46B6kn6MHLBgeyKwQyOpMLqNeCE+0oZfU8x7FUgu2
	9uhyohO8w9PVjXSrjM7Haip08ePHte6apLmjPE0skPxa6VkxRsH0Rn2PtN75pHV3btj2xhWRqc75h
	ySVMmSZW/Lu8vx5zvZXohRIygWOZGN5Itxit31nmjvTykRIAMvg716OpOjNdAIrQaQcZxs2g6chmt
	PA1IGlcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLBOa-0000000DOn8-3XLO;
	Wed, 11 Dec 2024 01:20:08 +0000
Received: from mail-oo1-f49.google.com ([209.85.161.49])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLBOY-0000000DOmD-38yv
	for linux-mediatek@lists.infradead.org;
	Wed, 11 Dec 2024 01:20:07 +0000
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-5f2be1430d2so766028eaf.0
        for <linux-mediatek@lists.infradead.org>; Tue, 10 Dec 2024 17:20:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733880006; x=1734484806;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UEJ5kdrUNfjAy+icZnm1esu6rZ7qPtHroRsyBXfTsTs=;
        b=YAmWrCGyEtaA9MLXYSxQsRiHaLR/293RXrPmu8IFiVAutbnwA+poUUwqd0t1jGZ6HL
         llDXacPR7qvyEKBdpNCUJ4h012O3AaFYY+aDVXPznsePCz6gqOYYUtvoXicW0CobYUo0
         gMuLU4d6RaEYeJ4mFxhioo6kR/wqTqONaFYPoxuSEuE5vsc5EdFmA8sKFzPKuZYIfVll
         M7CB0t81N5jzVdWb5KEmdvHRA4I4Z1fGPJtXwAC89prRA8ApKjsQ4vvuIFynAaJ67VqW
         N7UM6As4Pe0WBJWqPVxiMZnDFLTEkSh+hETSXcR8imVISO8WQorXD/GDzwbZAbvfRoVp
         TxFw==
X-Forwarded-Encrypted: i=1; AJvYcCX70WJWEFmYdOgpQxprrrfXK7swM8lk9za+yXdOO3rHtDyq+0tLQ4hUe3JT5Lwy6Lk4j/zGys3wzPmCi3ow+w==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8XF+NEPBeY+DlZVPAfdKw35MEWjMIeerzFLMvL8e5J5CiMtnh
	SIe7Sqz4R3niK+gM3oJA5UN4ZoZG7dt+MOslMioYdxU2PSWXf7vy
X-Gm-Gg: ASbGncteX1VRaU4nxhlOjhg5gXhpI84EH3XonXrk1ZCcXA176hljHTuzR5wT5YeZDCY
	4h1bhMT9rooN9n57XVfUwBbv1UI8p6HgqGvvtuWkjZJ6r4rJ4QtsILMhpdfnwIqe7KcxxFg+PP/
	SlPISTefX5tNJVg5CwddHVx3t/wUi7JhzB4pWbWjq0twJqx4QiAt9RYWnt2OWarrTILbH7pjeg9
	Fa8oha5Uii+Q0nZBLHggKT1BsQdc/f4TQLz4zJBGq3AKEnpNHXzOt7xZhG9dImrOdFkXQQ=
X-Google-Smtp-Source: AGHT+IFcQ3gUsYitlfCkN5kLRyrQGJyfYcf884guORROPcDHh0Lvi4yEHkFTf9jFWu3U8jkQsLxilg==
X-Received: by 2002:a05:6870:4990:b0:29e:671b:6003 with SMTP id 586e51a60fabf-2a012dc69ddmr561652fac.32.1733880005778;
        Tue, 10 Dec 2024 17:20:05 -0800 (PST)
Received: from sean-ThinkPad-T450s.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-29f93552d34sm2705701fac.24.2024.12.10.17.20.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 17:20:04 -0800 (PST)
From: sean.wang@kernel.org
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: sean.wang@mediatek.com,
	deren.wu@mediatek.com,
	mingyen.hsieh@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 08/17] wifi: mt76: mt7925: Enhance mt7925_mac_link_bss_add to support MLO
Date: Tue, 10 Dec 2024 17:19:17 -0800
Message-Id: <20241211011926.5002-8-sean.wang@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241211011926.5002-1-sean.wang@kernel.org>
References: <20241211011926.5002-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_172006_786082_CF2552A2 
X-CRM114-Status: UNSURE (   9.49  )
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

From: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>

In mt7925_mac_link_bss_add(), the mt76_connac_mcu_uni_add_dev() function
must be executed only after all parameters have been properly initialized.

Fixes: 86c051f2c418 ("wifi: mt76: mt7925: enabling MLO when the firmware supports it")
Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/main.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index 97b48fda5595..93e00a3840fe 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -365,18 +365,14 @@ static int mt7925_mac_link_bss_add(struct mt792x_dev *dev,
 	mconf->mt76.omac_idx = ieee80211_vif_is_mld(vif) ?
 			       0 : mconf->mt76.idx;
 	mconf->mt76.band_idx = 0xff;
-	mconf->mt76.wmm_idx = mconf->mt76.idx % MT76_CONNAC_MAX_WMM_SETS;
+	mconf->mt76.wmm_idx = ieee80211_vif_is_mld(vif) ?
+			      0 : mconf->mt76.idx % MT76_CONNAC_MAX_WMM_SETS;
 
 	if (mvif->phy->mt76->chandef.chan->band != NL80211_BAND_2GHZ)
 		mconf->mt76.basic_rates_idx = MT792x_BASIC_RATES_TBL + 4;
 	else
 		mconf->mt76.basic_rates_idx = MT792x_BASIC_RATES_TBL;
 
-	ret = mt76_connac_mcu_uni_add_dev(&dev->mphy, link_conf, &mconf->mt76,
-					  &mlink->wcid, true);
-	if (ret)
-		goto out;
-
 	dev->mt76.vif_mask |= BIT_ULL(mconf->mt76.idx);
 	mvif->phy->omac_mask |= BIT_ULL(mconf->mt76.omac_idx);
 
@@ -395,6 +391,12 @@ static int mt7925_mac_link_bss_add(struct mt792x_dev *dev,
 	ewma_rssi_init(&mconf->rssi);
 
 	rcu_assign_pointer(dev->mt76.wcid[idx], &mlink->wcid);
+
+	ret = mt76_connac_mcu_uni_add_dev(&dev->mphy, link_conf, &mconf->mt76,
+					  &mlink->wcid, true);
+	if (ret)
+		goto out;
+
 	if (vif->txq) {
 		mtxq = (struct mt76_txq *)vif->txq->drv_priv;
 		mtxq->wcid = idx;
-- 
2.25.1


