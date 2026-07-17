Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 370C4C44524
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Jul 2026 16:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5y+pF9Ye8xkl7BWvjPqf+44InrvFLLZAoR3RziMb21c=; b=VJqii+C//q9PnhxD78HNQCqk3R
	SsMX11keEfPCB4q4eytabb8xPfXaZU5QL5Sri1C11QN6u6f6j5Tmh7mWt4RzY1g40O6z4vahy6HXl
	B1Zn0VnCwOK4x9ag5rMAx9yOWmTWWPJJ0TOFTH09QuZjLDlZbC8xzX1P0ofFvL+2Oyv5VIUNbIEz3
	1kxXaMBfMNtZ5FXxJPav47sUgtdamjoUETVjTcYpZL6raTOTDwSou9wMVaSN6UG+Je8vmFDnqMAIM
	EN/8Xy/678Q4NA5sYokjnObAfNbjwZw+radDt5Y6ZgbVcyif/0t/XrVf/NrBYu1Leoj7A8lAPIiLa
	Eh5EgsNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkldX-00000002lLV-0TvG;
	Fri, 17 Jul 2026 16:42:07 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkldU-00000002lH4-1avf
	for linux-mediatek@lists.infradead.org;
	Fri, 17 Jul 2026 16:42:05 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-c15ba5b151dso630786866b.3
        for <linux-mediatek@lists.infradead.org>; Fri, 17 Jul 2026 09:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784306523; x=1784911323; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5y+pF9Ye8xkl7BWvjPqf+44InrvFLLZAoR3RziMb21c=;
        b=HrQfKNYU8cArHm1bp4DAQf1/i3IVPG9zJ0WHcd97ydK4EjSzgCud3USUCXbNy89kNq
         QKzARc/RMsdfETieXWwVObUUmYlwHTPIMDJwTycJzD66vnjtQMiszGm9QK3ROthG6DOV
         pT8/FuPU8shnqjK0xA4gucR6njWaBJ8/qdcejeMV/FcdKF/Z6DhPYkIHzDgeqjOnS2bm
         Z9/LLVekZjnRmEEFSt/SyKFx71L4rVU9PDepxPUOWX1Hne/r9fG2FDulcFFJ8+E4c+y3
         QOqXItPnBo+4PqCarWQWsFRZVMU9guMM54+NRWP/XWOuw1SYDxJGrEz3C7GSt2RP9yLf
         8bzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784306523; x=1784911323;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5y+pF9Ye8xkl7BWvjPqf+44InrvFLLZAoR3RziMb21c=;
        b=UNQr59EbajUeXT8rYGQtGwpnfBYc/YyLivr2I5U1Ty8OatwqcA5whXmhBppFK5J6e5
         HxIwGd6hRQv1tAr4bH67qzEahmjUYMrrqIl7WaWwu3bAClIj6a8Wu+LTPhtACTereATg
         eTmi022JjUeTTjVn6qMMAJGBdXvfOQKe1exI0oczmYpdea2TuubGx3AZoOCX6QueLjxl
         hK1y6jvPLgEIvy+2ZaDU5g4PdVWaAP3Uyx8e1TlirDXTmIOJOm7guEhHNXM25T4JA9Q2
         uiIdNh/ZbobspFVCuOlAgWUWuvqf+/teMM7dexA0QPSJbXfynv8YbNobP4g1JjDIGTRF
         wh5g==
X-Gm-Message-State: AOJu0YyyFD5teckLfeUly9c8ePzy3NlWIH5ufu6CUv5Sv6c1m132cWuh
	lbBho8x8l0BButySORZDfNSfx84OeB9jyWgImCvwNScCaPrl2WIvP2kzMS1I3K/+
X-Gm-Gg: AfdE7cm1tlfV861Kf3CtFFFixUbIK6zbk/ag1+bWLBV7YswVAz+iXsPQFBLr3/9oesc
	+4HRh+RtIsrLFTKAAYDBMsDRPObusjs4jv9VQFk+NajCpOXkQ6o2SmuraRmGKvtKZCZ8auW6pWr
	cL2gWPJgqJHnxgfvLb1G8eC9dyBezkU05lqUTwyKOGGAx/ZzKJ++yXaKpRrp4/nLK8hUugvcKV3
	VHGz4X3C8SyPumqPZoZlPVBKKzR3Ogs5zZMAkOJ+Yog/ipjLW8jgL8iCqVX5Ilu62gn2TY8z7gQ
	c32fgCpmuJRgJic/4E9ig61jMbzbjkWQrcKB7M86Anp8QWfLVBDjxIxUtz1rn2fcSwL8+v6Tu4n
	xhOoj0ymCLqD8mt7NomW9mrLhPgnjRQgqAJRTnMxSUSxUSuCdZbemu4K6R7p7Xm3S6IDTCSz3mg
	==
X-Received: by 2002:a17:907:707:b0:c16:5dbd:820c with SMTP id a640c23a62f3a-c16b47807e7mr158904666b.33.1784306522585;
        Fri, 17 Jul 2026 09:42:02 -0700 (PDT)
Received: from luca-vm.. ([109.52.116.145])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1705912972sm105880366b.14.2026.07.17.09.42.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 09:42:02 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 5/7] watchdog: mediatek: Add support for mt8167 TOPRGU/WDT
Date: Fri, 17 Jul 2026 18:39:16 +0200
Message-ID: <20260717163959.714561-6-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260717163959.714561-1-l.scorcia@gmail.com>
References: <20260717163959.714561-1-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_094204_429539_C5153115 
X-CRM114-Status: GOOD (  10.84  )
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

Add support for the Top Reset Generation Unit/Watchdog Timer found on
mt8167.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 drivers/watchdog/mtk_wdt.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
index e61f6ae74327..10a3d4b5ee30 100644
--- a/drivers/watchdog/mtk_wdt.c
+++ b/drivers/watchdog/mtk_wdt.c
@@ -13,6 +13,7 @@
 #include <dt-bindings/reset/mediatek,mt6589-resets.h>
 #include <dt-bindings/reset/mediatek,mt6735-wdt.h>
 #include <dt-bindings/reset/mediatek,mt6795-resets.h>
+#include <dt-bindings/reset/mediatek,mt8167-resets.h>
 #include <dt-bindings/reset/mt7986-resets.h>
 #include <dt-bindings/reset/mt8183-resets.h>
 #include <dt-bindings/reset/mt8186-resets.h>
@@ -110,6 +111,10 @@ static const struct mtk_wdt_data mt7988_data = {
 	.has_swsysrst_en = true,
 };
 
+static const struct mtk_wdt_data mt8167_data = {
+	.toprgu_sw_rst_num = MT8167_TOPRGU_SW_RST_NUM,
+};
+
 static const struct mtk_wdt_data mt8183_data = {
 	.toprgu_sw_rst_num = MT8183_TOPRGU_SW_RST_NUM,
 };
@@ -503,6 +508,7 @@ static const struct of_device_id mtk_wdt_dt_ids[] = {
 	{ .compatible = "mediatek,mt6795-wdt", .data = &mt6795_data },
 	{ .compatible = "mediatek,mt7986-wdt", .data = &mt7986_data },
 	{ .compatible = "mediatek,mt7988-wdt", .data = &mt7988_data },
+	{ .compatible = "mediatek,mt8167-wdt", .data = &mt8167_data },
 	{ .compatible = "mediatek,mt8183-wdt", .data = &mt8183_data },
 	{ .compatible = "mediatek,mt8186-wdt", .data = &mt8186_data },
 	{ .compatible = "mediatek,mt8188-wdt", .data = &mt8188_data },
-- 
2.43.0


