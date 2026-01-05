Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BA93C2A077
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Jan 2026 00:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9Q69CcxdhkUBHE6WLrwVRfN6aM9r49U1wpvLGX5O/w0=; b=IRO/i41EZeKlZ7zs1Oc2k7ZtcC
	PXlzbY6SKLKSsjyL3b5T9tibH/CFeGCjYUXmaYdoFk3t6EDDzNfpSOehVIUzid6sctx6bWRMU46X2
	Fw+6QCsWQMS7fq+TKd+fnizKVoUxcoNDz6+aj+mKwCOGG25M4DyxTkwjf/5iLctwhe80BiRFkyXn4
	dUjr6uKhz1bhdH1WcWzpy1YoDpoOh/QBF7BwE5GXufRwv31NPVJ6ojPIUbuWLksOFqsllblTvUoqC
	s1wm1u01Z91sSbEs+ddANwlm73nOwiFPUvv1VD8oGwyNd96zD2hbuUtwsuXVhlzdsnyn/D/ZWe4tL
	BRG04CDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcYR3-0000000AZwR-0Ylm;
	Mon, 05 Jan 2026 00:27:01 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcYR1-0000000AZtA-0L0r
	for linux-mediatek@lists.infradead.org;
	Mon, 05 Jan 2026 00:27:00 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2a0a95200e8so113165035ad.0
        for <linux-mediatek@lists.infradead.org>; Sun, 04 Jan 2026 16:26:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767572818; x=1768177618; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9Q69CcxdhkUBHE6WLrwVRfN6aM9r49U1wpvLGX5O/w0=;
        b=JxCUuIC5eu7bjKsy1LanBzEkZk17oee3c3RhOGQUoDD6MsUCYvof8GuoVW2MPOxdj+
         esNIDOhGW6sOwIgymuJkR3AgGVExZMrQRyQMJjx2x+A8e5tmZTGEaUA79WY60EA5yxX/
         /+dUXZE7JLFGDenP54ttvkZGz2kbiBJzHaWucTiV/CXZxP+iRn+T5QglPyV0KHv3Ku0H
         /6vPRiVkDaEifEnj38TsQJDKV+BKST0PgqewWBsFWBYM7iGcf/E7uuT6lBLQQB6qHEto
         4HTUOObxeAMYcY1xGYFTq4Kx7LLN4qcoKOVwvm2Fb8kZ4uAp6WAA7TuhtBOFJoGHEZvJ
         mXng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767572818; x=1768177618;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9Q69CcxdhkUBHE6WLrwVRfN6aM9r49U1wpvLGX5O/w0=;
        b=quqI0DqKdPZ7f8v51MUVvjjdotW6DUZGKItuP7KBuI+TZYklG/o3NtnqW0q4536XCe
         wfxGlHpdnuOc47od6UC6gymeA3Wipf6Bb9mH8CdqVOArWRm3m5V1RzflcvUv5cor7E1S
         JCwF+EfZWQkcSMurTWOUf3prqug+0lNwTK70S6rUI3X+GSfdKbYLlXnspUpzbNLiudVR
         PkNDJeodTuDqr7YxsAYFAS4fJYqPGBTMuJSA7JH3+DSETVlU0X+01BOESWDYzsjnsjjT
         xXUd1ebjrAwVnNBCqd04/n0y7+PxmsqSY9nwkgS94DtkN6DDCmm0bVVzdSrrCp1SleM0
         JtPg==
X-Forwarded-Encrypted: i=1; AJvYcCVvp7wqs2HL19QmOw35IZ1Wo4bHPESSP64AYt1wb6ZKrLuA52BNb6aiSnZ6EK49Ga0lyATf/sSq5IIGG0P7dg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzRXrJSt5j0J3JYZm2c+9o/mIzOrzAlL+blTE+wWrgmk6sFEKyS
	ghFcaVR88OqD48uDNlpYL2UmgV7G7SIdyWa7hWwHRsJ0nsYpGHuKvKk3
X-Gm-Gg: AY/fxX7PUcVQWFVV6UAK/4hPSOmyKeiolwdhu1sZEpbI6S78EhvmdOeWmsLGaKGiSDl
	X6x1+rSDNMkY96cXRbSaebFNI/h++LJPo6QEF/K4JuDdSk/xT4kt0NbAc+4JrZF+ABiUgU9BWKa
	kjYYB7NOPNMydUkvs5/Q44tlH9kSAFGNI2T5eLH1U+Rr65ympMUgQlxaNmCk0/78Co0fiRL4YWe
	caUwxNAr9znnoG6KAiMA7bafUL+7EZPUl64WkzOD9YZkesjP3o5y/jWF94klUAV8TzSC1MLde3u
	2ABJcMxSUxnpYePNGvFenMYhDjTYrmvZAcWXpTf0YYbHJmYuQB4MMq//qgkYZ4smImjnIPp4Fu3
	W6i8Vhs04ezEbaZxBOd09nJ88kJ9yyHxpxqwjXWCo43UHEsNUgpzRN0l19ovVKpXEfwAwXIovL0
	NZ9DkvlxhHOP0HhWzhxYRcrs43jfCHY8D5OrH7dbNkG2RvFAnBvW/SRff5niOxg6c=
X-Google-Smtp-Source: AGHT+IH/HpfDxf451qZ290MLqPE8eNuLqEV5xYgUPjCo4qWea89lQLz9YeD33hrqDQkNgFdV0y3U8A==
X-Received: by 2002:a05:7022:6ab:b0:11b:c0db:a5ea with SMTP id a92af1059eb24-121722d3a98mr46215436c88.26.1767572818082;
        Sun, 04 Jan 2026 16:26:58 -0800 (PST)
Received: from zubuntu.bengal-mercat.ts.net ([2001:5a8:60d:bc9:9ebf:dff:fe00:f8f2])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121724de268sm133378109c88.8.2026.01.04.16.26.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jan 2026 16:26:57 -0800 (PST)
From: Zac Bowling <zbowling@gmail.com>
To: zbowling@gmail.com
Cc: deren.wu@mediatek.com,
	kvalo@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	lorenzo@kernel.org,
	nbd@nbd.name,
	ryder.lee@mediatek.com,
	sean.wang@mediatek.com
Subject: [PATCH 07/17] wifi: mt76: mt7925: add error handling for BSS info MCU command in sta_add
Date: Sun,  4 Jan 2026 16:26:28 -0800
Message-ID: <20260105002638.668723-8-zbowling@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260105002638.668723-1-zbowling@gmail.com>
References: <20260102200524.290779-1-zbowling@gmail.com>
 <20260105002638.668723-1-zbowling@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260104_162659_129573_7BCA17B1 
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

Check return value of mt7925_mcu_add_bss_info() in mt7925_mac_link_sta_add()
and propagate errors to the caller.

BSS info must be set up before adding a station record. If this MCU
command fails, continuing with station add would leave the firmware in
an inconsistent state with a station but no BSS configuration.

This can cause undefined behavior in the firmware, particularly during
MLO link setup where multiple BSS configurations are being programmed.

Reported-by: Zac Bowling <zac@zacbowling.com>
Fixes: c948b5da6bbe ("wifi: mt76: mt7925: add Mediatek Wi-Fi7 driver for mt7925 chips")
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


