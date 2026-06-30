Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C20B8C43327
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jun 2026 15:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bhvDY45MSy6G6g9L6tyWvHlT65On3gQKFm/j/jxjGrE=; b=E61QVjeVTIWtndbOlM1S2yt1cd
	QrZsPgonqjUR8YIEbPEFjklkUaacsqD1l7lwtX5tl6A0Kbz23FEmvqZWOAAjlOfjfVbnOhawq8Agg
	zlwp/WFTzsEn2LLDKV1STgjMiXFVC9tgTUDq2seihVAfTcYaHlUlsJCIiZPc0jiRxMOLXy/S6F9MS
	sFcU/UVWxu/CymbrH7gBTNXVJMGo/KZFhKW158it+c2/ObyMy8SwqdSdVV9Uzkl8M+bb7H6Q2eAmv
	pj8tJlwYSRHSjbBy5QRT6qTPkzNM6WZX9bew8hY0Gyy3PAcru6lvpk0nNP+qIQv1Il+4YPutn9lZ0
	cLYiwWAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wea3O-0000000HL57-3Evs;
	Tue, 30 Jun 2026 15:07:14 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wea3M-0000000HL4T-3Bef
	for linux-mediatek@lists.infradead.org;
	Tue, 30 Jun 2026 15:07:13 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-37f72212544so4381571a91.0
        for <linux-mediatek@lists.infradead.org>; Tue, 30 Jun 2026 08:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782832032; x=1783436832; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bhvDY45MSy6G6g9L6tyWvHlT65On3gQKFm/j/jxjGrE=;
        b=X2mS28lm6Jc00SiVUg8Puir3vW5ntsYzxbfYpesWpApqnPsTmElzOLkD5XE4oDXmnF
         Mj/vy80Xqh5DFz26hPDqZ/Fg7p77t97tLFAbPACFcDneqBogmBjdZBHgceP6SmS94FUh
         /U29w1JZVGx1nlzntsrl56lJvPahc664KECvti2hsLmdZYG3g9KNcEymRQFlKvZXgu0N
         9uLzzHFU4ChuNBbIvhWUX693F6x1vXhOKvTuf0wWVUg/KcIb+72uv3keASxvNMF36ftw
         +9/t0h4OGMoHZi7AoY3JZhbicasPfWVnl3vXwFNPPJPVk6TN/cAfuT3GNBoJTwk0NPLv
         MMSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782832032; x=1783436832;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bhvDY45MSy6G6g9L6tyWvHlT65On3gQKFm/j/jxjGrE=;
        b=ileU3tZsm11PxEAoIL1C3/qFvSSHlPL+eXKCnXWD196XAU211CUBxMHqksB9xP/6y0
         tVEAnfEWDcYyIheC3GZwsHUfUE5eUym28IYb8uCrqllm/j0FwHOrONvAq5+96kmPw8zV
         syNGw8ip52BfyEsMNGBRXoMaRFIV9zBZw20csv3sZpBu3Drf/3p4SbWNoGXFlvSh9Jov
         i/KvF/njUNMzz3WqP3E1L573FtEzdgE8qxmcweZT6JA51aaiDez4+OkHKpO+t2m0o1t/
         vNdaBur0V2geo8aHcWlwDS7vVDPvX4Lls4lEp4m1oMwzOC9UP7go1sk+l4T3z6bYruBb
         W/jQ==
X-Forwarded-Encrypted: i=1; AHgh+RpnPjaKVK3SvO7CAxDT7qwYvju3eKYliTIw5qOcqJ0G+xxwu+6LsMk4/K2YGmThMC8McD/v23KIJGTJeqmLpw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxcEmzDogF75tLcawr5+PfoyjOujZ5WqPT8Nc8aEpVDts+kpENh
	dshZ3wQikQbuuLC/fYApE1JcktPPr4INyaB5iRL6dOVqUuN8i/fKJy08
X-Gm-Gg: AfdE7cmPm3dk+jd9f1SqwXIHPRzOTSTV4reVuhTv4ihoacVUTlp42wXpcZ5oHKY2q28
	yDx3YUqQGsvARC1bJ3wPx8mKvLpg9Rk4pi324vtpLxeu75eb6tWulwkP3Zcvn2j2aLJmAadW4Xk
	grBSeh+tY/VyLN7DIhAYSCC7+5cBF40bIAHz/mPqSofv+I+SkoCd79TkZxPbvdQa4LuWp3lh9+Y
	NPH+pIIUxoyTECBjw3Yt7I+XPbAzes46gpj3waTxGMhrNdNDBmMhirSZF4r265Pl379bK4PwsCS
	DLmU+C4IjfslYJVy1kgtnj8qdOdR0C4GVPDM+zOoO9/xt/eIUCdVm/Y3OM6FYjdXWzKxBnSPMPK
	yXH7HthACLgBJJskFMxhUVURYVCwZlJiXeh9PsVnSEkHVN0eUftIAsdBgb4KUwW/KciJTFj5+bB
	0ARKzPCaOFv4YvIYt7X0Xn/akF4FJQbS4BZ+tc7EERNIdPVqVQeQlZjQ==
X-Received: by 2002:a17:90b:2e47:b0:367:d850:6a5f with SMTP id 98e67ed59e1d1-3808c0e3eb2mr667892a91.25.1782832031701;
        Tue, 30 Jun 2026 08:07:11 -0700 (PDT)
Received: from DESKTOP-VNSSJ2S.lan (59-127-145-64.hinet-ip.hinet.net. [59.127.145.64])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38095b684basm41811a91.1.2026.06.30.08.07.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 08:07:11 -0700 (PDT)
From: Zhi-Jun You <hujy652@gmail.com>
To: nbd@nbd.name,
	lorenzo@kernel.org,
	ryder.lee@mediatek.com
Cc: shayne.chen@mediatek.com,
	sean.wang@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Zhi-Jun You <hujy652@gmail.com>,
	Benjamin Larsson <benjamin.larsson@genexis.eu>
Subject: [PATCH mt76 2/2] wifi: mt76: mt7915: fix net_fill_forward_path for non-DBDC mt7986
Date: Tue, 30 Jun 2026 23:06:49 +0800
Message-ID: <20260630150649.1629-2-hujy652@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260630150649.1629-1-hujy652@gmail.com>
References: <20260630150649.1629-1-hujy652@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_080712_826659_A8DB96D4 
X-CRM114-Status: GOOD (  10.74  )
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

Current implementation assumes that the hardware supports DBDC or single
band and binds to band0.

This causes net_fill_forward_path to select the wrong queue for non-DBDC
mt7986 because it binds to band1 and getting the following in dmesg:

ieee80211 phy2: WA: --> drop by reaseon:1, msdu id = 0xc002 but failed!
mtk_wed1: error status=00000002
ieee80211 phy2: WA: txblk
10324e00
len = 128
DW0 : 10 00 00 00
DW1 : 00 00 00 00
DW2 : 00 00 00 00
DW3 : 72 0f 94 68
DW4 : 00 00 00 00
DW5 : ff 03 00 00
DW6 : 00 00 3c 40
DW7 : 00 17 dd 14
DW8 : 79 6f 00 00
DW9 : 02 c0 00 00
DW10 : 58 c5 34 10
DW11 : 00 00 00 00
DW12 : 00 06 3e 00
DW13 : 00 00 00 80
DW14 : 10 8c 00 00
DW15 : 00 00 00 00
DW16 : 00 00 00 00
DW17 : 00 00 00 00
DW18 : 00 00 00 00
DW19 : 00 00 00 00
DW20 : 00 00 00 00
DW21 : 00 00 00 00
DW22 : 00 00 00 00
DW23 : 00 00 00 00
DW24 : 00 00 00 00
DW25 : 00 00 00 00
DW26 : 00 00 00 00
DW27 : 00 00 00 00
DW28 : 00 00 00 00
DW29 : 00 00 00 00
DW30 : 00 00 00 00
DW31 : 00 00 00 00

Fix it by using phy->mt76->band_idx for queue when it's non-DBDC and
mt7986.

Fixes: f68d67623dec ("mt76: mt7915: add Wireless Ethernet Dispatch support")
Suggested-by: Benjamin Larsson <benjamin.larsson@genexis.eu>
Signed-off-by: Zhi-Jun You <hujy652@gmail.com>
---
 drivers/net/wireless/mediatek/mt76/mt7915/main.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/main.c b/drivers/net/wireless/mediatek/mt76/mt7915/main.c
index 51643a48ed15..1b433733661c 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/main.c
@@ -1743,7 +1743,11 @@ mt7915_net_fill_forward_path(struct ieee80211_hw *hw,
 	path->mtk_wdma.wdma_idx = wed->wdma_idx;
 	path->mtk_wdma.bss = mvif->mt76.idx;
 	path->mtk_wdma.wcid = is_mt7915(&dev->mt76) ? msta->wcid.idx : 0x3ff;
-	path->mtk_wdma.queue = phy != &dev->phy;
+
+	if (!dev->dbdc_support && is_mt7986(&dev->mt76))
+		path->mtk_wdma.queue = phy->mt76->band_idx;
+	else
+		path->mtk_wdma.queue = phy != &dev->phy;
 
 	ctx->dev = NULL;
 
-- 
2.47.3


