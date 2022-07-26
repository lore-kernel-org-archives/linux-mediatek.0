Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 735EDC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Jul 2022 06:21:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Hxj6DGJEQ9eVglc2HFvoWbvN2rjJ5YG5R2YUt0W282Y=; b=unt2tjce4LfHlI3HBOOYXyJf8d
	l0DUCT0wILGdiS71KtQI6fhLRYI0qzX3Nsx4b50YMxOo6S64oIRhlwNP2dNMrVR4ATHmL9G6AgdGe
	lNLs1x9432LPYzeAhZXAPulBOFDiPPdBejoEEWqegafhgb4pXPPioYPKw/2Egq/Pq6Xsr0Mqe0esQ
	7Ao/Lao7yv+ycIMjALXVekcI9N5bSALhmW1/2ugUlYOgistHSeXm7V7PHxcPTRAsYxyzPIayNtj5F
	mCiN3+PJH16EAB7kmNUoGPR2Oo8YH9XgLH1ecIhRw906MyaL685166nPpYIFAbJqPbsWlRHXJBDl/
	PqhFxc8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGDwp-008mrs-05; Tue, 26 Jul 2022 06:21:39 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGDwL-008mUJ-6X
	for linux-mediatek@lists.infradead.org; Tue, 26 Jul 2022 06:21:11 +0000
Received: by mail-pj1-x102f.google.com with SMTP id jw17so136996pjb.0
        for <linux-mediatek@lists.infradead.org>; Mon, 25 Jul 2022 23:21:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Hxj6DGJEQ9eVglc2HFvoWbvN2rjJ5YG5R2YUt0W282Y=;
        b=HPHbw9Lrg8q9567laPcDSY/SW4aD237sQpcOnBJSqECQPjBwHhLg6mf0gurPJlVsrB
         tnq/ObRJb6ohjohjtB7YyzN7Cf20Z/cakGZGcTESH/NXp/ehxuf+7HgD7bXjGSeLEBKA
         LUqunAZXMfGpiwyV4fLv1ZB9HqOujHcH2jRn4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Hxj6DGJEQ9eVglc2HFvoWbvN2rjJ5YG5R2YUt0W282Y=;
        b=d5YTaMn4BOaOtgKlCN71dzpfILZ6J8T/E+S6D5zr5ivQoMg3EsG7SXaJYzkCh89t68
         KinVLeggI2foL3gdYfuvtJRMQAxslSwAHhUmj3fDSqBLdwh/KFeKI5/Fa7dS8drTej9U
         vHtOaotLgHfT3CUTRppX86lwhsH2+7g3BOG29BaRJ6lGOHf4P6Cx+FWZmN1gUfWk6yLJ
         sMOl31I4KG827UfNGQ0kERtYQiOABXLv14XmUfTh9F2d6/Kv1pWFoFJzYC5if33GNw0t
         zPP4Nt1gX+cO+tTVhkZZyHSnGubAF0nV0lPDKjlJAxuLc1YjXSTvVWBWHKbZutFFavkv
         zInQ==
X-Gm-Message-State: AJIora+XOfIaQAEV7DxZayye8WOcwDr65eK1hJRyC41heInEFpgQ7qgc
	mGAStXrmAmr1uTEZF2wI3k0xlQ==
X-Google-Smtp-Source: AGRyM1uE4OVpcWRiVc98XsCir285Y0UIRjf0zgaXuN4UfatJFerdJtqDgZPPv36oHAirLgGuyaN4Ig==
X-Received: by 2002:a17:903:cd:b0:16d:22c0:2efe with SMTP id x13-20020a17090300cd00b0016d22c02efemr15171222plc.61.1658816466607;
        Mon, 25 Jul 2022 23:21:06 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:8fa:d08f:848b:ad7d])
        by smtp.gmail.com with ESMTPSA id d5-20020a170902cec500b0016cbb46806asm2694632plg.278.2022.07.25.23.21.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jul 2022 23:21:06 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	linux-watchdog@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] watchdog: mtk_wdt: Move mt6589-wdt fallback compatible to end of list
Date: Tue, 26 Jul 2022 14:20:57 +0800
Message-Id: <20220726062057.320342-1-wenst@chromium.org>
X-Mailer: git-send-email 2.37.1.359.gd136c6c3e2-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220725_232109_337304_5323E9CE 
X-CRM114-Status: GOOD (  14.41  )
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

The watchdog facility in the MediaTek SoCs are all the same, but the
hardware block also contains a reset controller, which differs in the
number of resets used between different SoCs. This difference is
supported with of_device_get_match_data() supplying the number of reset
lines for the newer compatible strings. The original mt6589-wdt only
covers the watchdog facility.

of_device_is_compatible(), and by extension of_device_get_match_data(),
works by going through the given list of compatible strings sequentially,
and checks if any of the device node's compatible strings match.

To avoid early matching on the "mediatek,mt6589-wdt" fallback compatible,
which only provides watchdog functionality and no reset controller, move
the fallback entry to the end of the list, so that other, more specific
compatible strings have a chance at getting matched.

Fixes: c254e103082b ("watchdog: mtk_wdt: mt8183: Add reset controller")
Fixes: adc318a34066 ("watchdog: mt8192: add wdt support")
Fixes: 8c6b5ea6ac68 ("watchdog: mediatek: mt8195: add wdt support")
Fixes: 4dbabc4d9e8c ("watchdog: mediatek: mt8186: add wdt support")
Fixes: 711a5b25bac9 ("watchdog: mtk_wdt: mt7986: Add toprgu reset controller support")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---

This change complements the removal of the fallback compatible from the
bindings and DTSI files [1].

[1] https://lore.kernel.org/linux-mediatek/20220721014845.19044-1-allen-kh.cheng@mediatek.com/

 drivers/watchdog/mtk_wdt.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
index e97787536792..3d5a239b93ba 100644
--- a/drivers/watchdog/mtk_wdt.c
+++ b/drivers/watchdog/mtk_wdt.c
@@ -425,12 +425,13 @@ static int mtk_wdt_resume(struct device *dev)
 
 static const struct of_device_id mtk_wdt_dt_ids[] = {
 	{ .compatible = "mediatek,mt2712-wdt", .data = &mt2712_data },
-	{ .compatible = "mediatek,mt6589-wdt" },
 	{ .compatible = "mediatek,mt7986-wdt", .data = &mt7986_data },
 	{ .compatible = "mediatek,mt8183-wdt", .data = &mt8183_data },
 	{ .compatible = "mediatek,mt8186-wdt", .data = &mt8186_data },
 	{ .compatible = "mediatek,mt8192-wdt", .data = &mt8192_data },
 	{ .compatible = "mediatek,mt8195-wdt", .data = &mt8195_data },
+	/* Fallback compatible string must be last entry */
+	{ .compatible = "mediatek,mt6589-wdt" },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, mtk_wdt_dt_ids);
-- 
2.37.1.359.gd136c6c3e2-goog


