Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FFB4D358D1
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Jan 2026 08:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UKrm2KEh+DPYHiCEU3ivvoqMw474gqaI6xe0hQwvxHI=; b=trnYTfevjWRPOIiUQTEhHtubcK
	+7egiWnPoS5oqHLUwR7Ux22nQ+cUpaSI45QDV+nbhLRlIypKMC1hMxsJit/2tSqeYj9llsmWVDM0u
	8iX+lY922b5VTR20dAvCY9URoqdOkhzRi2P8AD7c80KVGyoO9x8C+aYOYLU540tz4K7G1Gv5pAgD6
	BXlcUW64IvCkPGVWLFPgzA8Z9lfnc9xqRm4twQg/wJim1enaKBbscbf/eTwbmSbJtsGa5i+X2Me60
	RgTcaKLmQfPWjDNXRB2mUA7FMhBVBhjfuXDmCUptv7+bDVZ+YdVdD8ZUGwA3mB2PMlJYyZSPhzDfZ
	ly0drqgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlNF0-0000000HRtX-2efA;
	Thu, 29 Jan 2026 08:19:02 +0000
Received: from mail-dl1-x1242.google.com ([2607:f8b0:4864:20::1242])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlNEs-0000000HRpb-1rOQ
	for linux-mediatek@lists.infradead.org;
	Thu, 29 Jan 2026 08:18:55 +0000
Received: by mail-dl1-x1242.google.com with SMTP id a92af1059eb24-124a635476fso976263c88.0
        for <linux-mediatek@lists.infradead.org>; Thu, 29 Jan 2026 00:18:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769674733; x=1770279533; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UKrm2KEh+DPYHiCEU3ivvoqMw474gqaI6xe0hQwvxHI=;
        b=LZsw0urBHGmNKlrTjFmkjEgAJKcHw0tmN5kM4T9UxB4uAsGfQZ5vZ02YmP6jsOfigC
         EMv3dfet/DgseiQ4AhZ6dcDjoztkKL4d/A+RdrXbxqap4J3OqWVsXl6smI9p6luyro6O
         vJ3gaLwUEqexFs4pCG+g69xgXIsHGgfDIPc7eIBLZ6RXkihLyIgk3JEZ+/gUIyTf9aZ8
         4JQEBporxHauH9SAM+SSpi63HzKET/Mqjk6FEHGwrmDNOvY90ugweltqcrUiURaJY8SY
         GzSGZXqolPA4/mjqge7U67VrAIsQmCki9EzgSwbJp9fTgr21qHBZfuXzs+KMubbpo0Qa
         S/nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769674733; x=1770279533;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UKrm2KEh+DPYHiCEU3ivvoqMw474gqaI6xe0hQwvxHI=;
        b=BDFM0BAYm9unZseiLGgQouFP/CtDQSCRDa3DAw0mO9n+0dVu3YatHxhXfghzstB7c5
         sizsxRX1zZDBDFtkJGFzhQ/slBdk3Thk7AQpLvavmTYRp3D9pH44XbbfmL+7O1jfkgvk
         tW2h6XD/vf561h13tB4iV/LXp3AsxI/fonMOEVli39WSc0laFZF90DTMtXxTXYSOQIqC
         rqF9PBDkjt+uhOooRurOTV//zmcvZCmjKzavQc1uLVY8WlmyfKBPoDT+bZQMJkTFcJ6M
         SX1rgN28EEaBA6MX99BKgwbFr25+CCaaPdRnF3tirQExn+htP0wqMMO1XQMqCBtxgj9X
         bdJw==
X-Forwarded-Encrypted: i=1; AJvYcCXbAgykH+EkOyLyo1VeZinSpOHYPuCgG/xjwkJlY1S90wLGtmiHn4hoRpjyGOvuBBrsSd4pUuiFFOrISkrUdA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwaOQyncKlXZouj6RSe9TT7Emvl5YAmKTx+PzmJ58TJfeVW3Gzc
	4aEA5VHwusqFV6d5GNrJkLujsTpDoBBjdu293451P15c/NNXQt7TzD97
X-Gm-Gg: AZuq6aLrKHlYGbQ0v/5ZtNbv8gP39Pj92B6dLZ4osQY0XO16bOBWGSTJCZTDUHCUPfp
	FZZsGYSyQPq8t8SlwQRMs4zhiADHTFkOIjEnPm0CBzqecr/xx62350q/t8s/1rhbKqtLlEg1AB8
	T5o4rJD1ajA0MLI+5vU2aM3j1+85c3Q06E1UOXXXdd9pQ9k27qYtQkD+Gj5e2gkG3a55icfHSk8
	CRMeZnhw/ApJXo6s++BCPcivjIxGWNRbOYf9AmAIybpG5NyaNIzI8XSKlXNcHR0X+Gm3bNCq8KI
	ms8u9jS8EZ8gFlNfp/bZwi8HDnKRHt2nyyYsqzXgGzBXzn7xLfN5XFkjOHHUl7c5fD8PclA1AcR
	5x+0VrUbQtBOQu6OFxCqq9P6pM9l0nBLZO/4rqe/YrysduTe0OCvX7cGud4kD8oidYfxSSzq/xg
	yBim3oJgWPdKmxVVCILyZX1HaoK0amzho3JaKha/b9QTYJ8okTj6i3CuHNUsI6
X-Received: by 2002:a05:7022:24a9:b0:122:345:a944 with SMTP id a92af1059eb24-124a00f4ecdmr3632733c88.29.1769674733341;
        Thu, 29 Jan 2026 00:18:53 -0800 (PST)
Received: from zcache.home.zacbowling.com ([2001:5a8:60d:bc9:f31e:1cb:296a:cc2a])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-124a9efb4casm5483508c88.16.2026.01.29.00.18.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 00:18:52 -0800 (PST)
From: Zac <zac@zacbowling.com>
To: nbd@nbd.name
Cc: deren.wu@mediatek.com,
	kvalo@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux@frame.work,
	lorenzo@kernel.org,
	ryder.lee@mediatek.com,
	sean.wang@kernel.org,
	sean.wang@mediatek.com,
	zac@zacbowling.com,
	zbowling@gmail.com
Subject: [PATCH v7 5/6] wifi: mt76: mt7925: add lockdep assertions for mutex verification
Date: Thu, 29 Jan 2026 00:18:38 -0800
Message-ID: <20260129081839.179709-6-zac@zacbowling.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260129081839.179709-1-zac@zacbowling.com>
References: <c9b81e89-cd29-44f2-b4e8-0179b2049c21@nbd.name>
 <20260129081839.179709-1-zac@zacbowling.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_001854_879351_D910896E 
X-CRM114-Status: GOOD (  11.46  )
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

Add lockdep_assert_held() calls to critical MCU functions to help catch
mutex violations during development and debugging. This follows the
pattern used in other mt76 drivers (mt7996, mt7915, mt7615).

Functions with new assertions:
- mt7925_mcu_add_bss_info(): Core BSS configuration MCU command
- mt7925_mcu_sta_update(): Station record update MCU command
- mt7925_mcu_uni_bss_ps(): Power save state MCU command

These functions modify firmware state and must be called with the
device mutex held to prevent race conditions. The lockdep assertions
will trigger warnings at runtime if code paths exist that call these
functions without proper mutex protection.

Also fixes a potential NULL pointer issue in mt7925_mcu_sta_update()
by initializing mlink to NULL and checking it before use.

Signed-off-by: Zac Bowling <zac@zacbowling.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/mcu.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index 1379bf6a26b5..2ed4af282120 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -1532,6 +1532,8 @@ int mt7925_mcu_uni_bss_ps(struct mt792x_dev *dev,
 		},
 	};
 
+	lockdep_assert_held(&dev->mt76.mutex);
+
 	if (link_conf->vif->type != NL80211_IFTYPE_STATION)
 		return -EOPNOTSUPP;
 
@@ -2032,13 +2034,15 @@ int mt7925_mcu_sta_update(struct mt792x_dev *dev,
 		.rcpi = to_rcpi(rssi),
 	};
 	struct mt792x_sta *msta;
-	struct mt792x_link_sta *mlink;
+	struct mt792x_link_sta *mlink = NULL;
+
+	lockdep_assert_held(&dev->mt76.mutex);
 
 	if (link_sta) {
 		msta = (struct mt792x_sta *)link_sta->sta->drv_priv;
 		mlink = mt792x_sta_to_link(msta, link_sta->link_id);
 	}
-	info.wcid = link_sta ? &mlink->wcid : &mvif->sta.deflink.wcid;
+	info.wcid = (link_sta && mlink) ? &mlink->wcid : &mvif->sta.deflink.wcid;
 	info.newly = state != MT76_STA_INFO_STATE_ASSOC;
 
 	return mt7925_mcu_sta_cmd(&dev->mphy, &info);
@@ -2840,6 +2844,8 @@ int mt7925_mcu_add_bss_info(struct mt792x_phy *phy,
 	struct mt792x_link_sta *mlink_bc;
 	struct sk_buff *skb;
 
+	lockdep_assert_held(&dev->mt76.mutex);
+
 	skb = __mt7925_mcu_alloc_bss_req(&dev->mt76, &mconf->mt76,
 					 MT7925_BSS_UPDATE_MAX_SIZE);
 	if (IS_ERR(skb))
-- 
2.52.0


