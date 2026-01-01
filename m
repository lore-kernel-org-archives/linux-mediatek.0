Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 085DBEEB56F
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Jan 2026 06:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eSmHMTLFLYMPOGJAvXcJayrP61cSU9U9a7LGizFttZk=; b=CCpGD7RaWzF7VrGgz+tKqlL2dJ
	hyyPn9p4sTs7zP795gcxapke25EbNIVMRRyqLLg/VBl4T/BO8gdskBUtqESIzcXD50Gjn+LwLeQ1r
	W3oPOXUM02qsXn0EYU/StorF5dcDDgB+ZLipoqH95jxYaRSdJg5HlI2rww0f13k0L/dhm/Rgudt5/
	01CUuFsPdRKrP6wdDBcWyR9Pl4EeRuJluv4PPuAl31X1JVFNBI+5X230D2VMGz9b9YXfXbnChtzES
	rZgACAWBKZcQwFDAuqQ7EzIJ1hr5Px1Vjeaf8smNj1nX/AGgpv6m2Cy3x+MGCayHzZZHcf6H9EZ2x
	n/97DK7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbC7o-00000006dwF-0LPf;
	Thu, 01 Jan 2026 06:25:32 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbC7k-00000006duA-3ixE
	for linux-mediatek@lists.infradead.org;
	Thu, 01 Jan 2026 06:25:31 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-c2dc870e194so3970811a12.2
        for <linux-mediatek@lists.infradead.org>; Wed, 31 Dec 2025 22:25:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767248728; x=1767853528; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eSmHMTLFLYMPOGJAvXcJayrP61cSU9U9a7LGizFttZk=;
        b=THOtEZjKBEYhXEJVjXIYq41eSTGlkrg50El/D2m63+7/or1ty10kbQEMSWZ2gzEg5B
         vmXGxLg9hTAQCX4+3o9b6j3XLLnSPkMEI1FQmZf1WAPQNwOXhF7FJJkVph0y3EgI+HxL
         MPihfUi2ad+opKXExeHvitlAvEBT4UPM7NepTVhBm7CRKlwzNn2E0xNWCarJseGvSPu1
         GoVgseqI0WoSHVrMarJML22TOuXAtwQa3BIt/swjwrxnG0uXdMLHONhI13wtLHNzNpfJ
         Lh2ivQTLJFrYHNsamG1OawZ05oaxxAsMDaWK8lKV98PwhRzbsM+HMyMKMqifam0yn2i8
         u8IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767248728; x=1767853528;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eSmHMTLFLYMPOGJAvXcJayrP61cSU9U9a7LGizFttZk=;
        b=bpJr0cdT09QhP585JR9GBrmyj23WtJO5iCgW7xOfsi2ogOHFomzBSfu8w0wf6zvMY7
         ZxLINtcl4TMEBkGVqJ2mdU9TXMOKEP+IzzvN0EZP7ZUDgqFIO7d2FlhTw1ir78Cl7drI
         34vAjiGK/AH8KJUAnQWcCXsoEFzPawThO/RaGQKEl57yW9XlAl05Q5jwhuM8Sxspg3dP
         pjCou25qH2M/M5EfDDha9I8/8fB0lHPzscwLvcIknIJofZ4FdLS3Bh9ikDrcugrv7Gc2
         GtrT3QYzTuBQQeljrV4xzEHKRdoxO4NVwR5vL3AvhTAaVd1B8OCeC/irsCvpyaH3D2/+
         CXHw==
X-Gm-Message-State: AOJu0YwB+m5syNUPlC3rE+eVRQxz48MW065UrpNs1M9vNPdNYTFWgHGt
	kpD2qRg7a7QUVrUHZIe4/1Bt4xD4ECT6YSEKcW/QSmeQQELsApFD+3N+
X-Gm-Gg: AY/fxX7C2YsznRPtYa9FIwThU0PI64biMB1E005YdgE6BUj4a58V3RCkLkG4eZ6Csez
	l7P31JS/uvu40rra+CAmVXu5S88Obs8Tm3suC0RwdyCfDmt5S4uP3pyLzkLBaU+QUjgCIMuoNzm
	ocp8bYVVnwwQMa4+iTcxVaILVJ0ub5butV4nH4m4BOJ6ZMEvGHJjKtbCCLbFR3j3K8tYN3vpi1e
	YgZjQYc8bMkHUAybqXU0o0jEP2PE6FGMpVO3eo2ZrHdL5qV57KbkvngHliXPGg1szp8b90qABe/
	GSs/oK960DPDcpXlW/+PuBzaOnnmreWRsRU0KLuj1xcQvADVWpGqX55YlHvxYJu1FmWimcpVBYp
	092X1F/+F/NBVTrou76H5otd+XCt9J6A6LrKCA73lt0yrVBPOOWeYskXurNxoC8rLwpfJI4UoHk
	9NeXy+2caWAGKIyH5bV0a6zO2XwUS92BZvAgS5eWhROn1jtylvrrTRYxh527dvKQ==
X-Google-Smtp-Source: AGHT+IFh5Ad9Hf+dAEhjt2TJYJtae2RoTDAfQaXTCyF1NBh3Q++Urs2DK2jMl3q8CvHI8h3zssad6Q==
X-Received: by 2002:a05:7023:907:b0:119:e55a:9c06 with SMTP id a92af1059eb24-121722e89ddmr39548902c88.34.1767248727941;
        Wed, 31 Dec 2025 22:25:27 -0800 (PST)
Received: from zubuntu.home.zacbowling.com ([2001:5a8:60d:bc9:9ebf:dff:fe00:f8f2])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121724cfdd0sm144361662c88.4.2025.12.31.22.25.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Dec 2025 22:25:27 -0800 (PST)
From: Zac Bowling <zbowling@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvalo@kernel.org,
	lorenzo@kernel.org,
	nbd@nbd.name,
	sean.wang@mediatek.com,
	deren.wu@mediatek.com,
	ryder.lee@mediatek.com
Subject: [PATCH] wifi: mt76: mt7925: add error handling for BSS info MCU command in sta_add
Date: Wed, 31 Dec 2025 22:25:24 -0800
Message-ID: <20260101062525.186192-2-zbowling@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260101062525.186192-1-zbowling@gmail.com>
References: <CAOFcj8Sad3pLohFfRdj5jzK3Zs3FAjFVBuzH=80i_m1YqSbpfA@mail.gmail.com>
 <20260101062525.186192-1-zbowling@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251231_222530_327380_5B53E7D9 
X-CRM114-Status: GOOD (  10.44  )
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

From: Zac Bowling <zac@zacbowling.com>

Check return value of mt7925_mcu_add_bss_info() in mt7925_mac_link_sta_add()
and propagate errors to the caller.

BSS info must be set up before adding a station record. If this MCU
command fails, continuing with station add would leave the firmware in
an inconsistent state with a station but no BSS configuration.

Reported-by: Zac Bowling <zac@zacbowling.com>
Signed-off-by: Zac Bowling <zac@zacbowling.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/main.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index d966e5ab50ff..a7e1e673c4bc 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -899,11 +899,14 @@ static int mt7925_mac_link_sta_add(struct mt76_dev *mdev,
 	/* should update bss info before STA add */
 	if (vif->type == NL80211_IFTYPE_STATION && !link_sta->sta->tdls) {
 		if (ieee80211_vif_is_mld(vif))
-			mt7925_mcu_add_bss_info(&dev->phy, mconf->mt76.ctx,
-						link_conf, link_sta, link_sta != mlink->pri_link);
+			ret = mt7925_mcu_add_bss_info(&dev->phy, mconf->mt76.ctx,
+						      link_conf, link_sta,
+						      link_sta != mlink->pri_link);
 		else
-			mt7925_mcu_add_bss_info(&dev->phy, mconf->mt76.ctx,
-						link_conf, link_sta, false);
+			ret = mt7925_mcu_add_bss_info(&dev->phy, mconf->mt76.ctx,
+						      link_conf, link_sta, false);
+		if (ret)
+			return ret;
 	}
 
 	if (ieee80211_vif_is_mld(vif) &&
-- 
2.51.0


