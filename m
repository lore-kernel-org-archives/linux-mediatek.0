Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90922C5DF88
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Aug 2026 10:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BNNHoWdgT2CrEfPiTooQfwweAtxpbzmh3UlJhmBHMrM=; b=Oz6T7PT091yYkILH6TPWijKsJx
	NcUZ4QiH42tvoYn47EC2gjIDIkBZAc/GW3BudkccsU+qBddVRKbTBcTX1AI1zlrJwRDymhUKIGWXk
	OcyWgndRGQpr5dfRYuCPNkl9AXmgPuPpD/IP+9u7dFhEozo+UbrcevRpJ27lpnCrc1v4u26pVXX+i
	FHXLOCZd7iA2tGq0SGMtwfDKjX014oGWrK47sx3lkgAnILqufBiamLVwECxQQ4s5IHx0wGaZ3A2tm
	IJw98iJ3izfCqEocbmE/JJ6CSHSqKYuwhwyYIZ+bnLr2Kh+6/6ELwnj0GTgxMVDzZwGPu3yxnP5lb
	upe/xGZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwdOH-00000009Vw3-07g4;
	Wed, 19 Aug 2026 10:19:25 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwdO6-00000009VnH-0eEZ
	for linux-mediatek@lists.infradead.org;
	Wed, 19 Aug 2026 10:19:17 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4996f1ee4a4so6792075e9.2
        for <linux-mediatek@lists.infradead.org>; Wed, 19 Aug 2026 03:19:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787134752; x=1787739552; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BNNHoWdgT2CrEfPiTooQfwweAtxpbzmh3UlJhmBHMrM=;
        b=T/5GKaE9iu+a0TB/pVH2+ja/lMzjT5NpKx4ibm8syUyrAQ/7AW9X3UyLq85UxDUkC4
         /HCc0Wl1HHbgtENrBbDmaIBkGq3aSoXoqvi7yi4+jvLcu+2+BAdkeMv78KlejhxyZw4M
         xAi+hJ7hctMik58pO2bepdVXno20dYs/eStZxU6sSQhFFli7Yf2IHdFD/aWkt/GzYD2W
         cCzsR9w6TiOUQ9Bn90teSvBJDX4t/NB53ssJXZf6Y0lu6htOAXoBoQN1UiEDMF67oPSs
         YfLYnDI9E7/EGkO+Jx0z1T3TYb62hKq9w3BMRPvt//3Xmo+DA8nGkyyfoqP9zle6oAoC
         0Giw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787134752; x=1787739552;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BNNHoWdgT2CrEfPiTooQfwweAtxpbzmh3UlJhmBHMrM=;
        b=LVHA7gAajFyHG/kGFL3LtcRwVBLuvhMxDhk3c9CRA62b/LQyb+GtUofBkcHXiNjJe1
         pNz8DqtQdLvJc/96nt4+hoQWlGrutahxymR7Fws2Yt1FlVLefhBTnEijHYuxog9/vRAe
         phOKn3yfPKkGCVBdTxUa+Jd3hEeEhtigQxM4C2ZaKtLDIyMdvAZpCaXpWVIsL3n2hLu7
         zssdhtWQ95l9Rkv3W8bRzH/pcYGO/NJHCORdIDPsbV4sz0a3XKRWjCaTVOPe3kN9D/NA
         uN1WKBIVVnZ9UCtSeyGIpJz9R1yvagiIh4c0VQpfHqHbVeG31Ofr9yRUEKJ79wsriUTM
         i/hw==
X-Gm-Message-State: AOJu0YwgduGw15WqXvoEWOq2oL6CgZJAfH7IrLlDjLxoTsVXz1kUH7Bv
	/NRaPXryrtv2qpH2oQGQlymPixDlBmXak/rwGClMsMIae6S8BjB8ywRRjik83jLW
X-Gm-Gg: AR+sD104W3NZj0hotg6KANI0KBVUZIZDT86O1c5zB/0iZZesTO3DAmcYbl83MBvnlX5
	gTngoOo8VGnSEy43K3TF8tPD/Cb7e2+2BQtW851Q7O88P58IB1FAHhk6BpYrhyZcv6KWN8XkV2N
	0eE04yg3Ud0avJkxMRSwM+1Q6NE/KucToCBbXkx3zrAtXBPlcYUbxiXXbHDmbp8CeewRehqyxv+
	LH+r+zaAJvVG7+RFr/CzIUZDOIjZW4IYaYhrYarsR4ML8HQzPb02GRVNRHBDi8Zf77vZa9PxTv+
	V7b0YyVDbKNzPgkg9zL6bdgXiq8clnyrVktoTzY+FVOef26bArduv5TryhIKDv+xPIApEMaDV3Z
	8t72tgQViErIbrcNH+6j7TTxu2UEAJiR03mVYbC5O2TWeL9EZABBNvFSpwLSaRghAnw8ppunjqg
	YVzfM2mhhda/2W2cV2QNus6jRmJLZQPGf6HXOZbiH/a57eRrbcrdZH6w==
X-Received: by 2002:a05:600c:4e01:b0:493:e365:ace9 with SMTP id 5b1f17b1804b1-499aa1d0747mr66690555e9.11.1787134752059;
        Wed, 19 Aug 2026 03:19:12 -0700 (PDT)
Received: from luca-vm.. ([81.56.18.151])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499a9b7c987sm27316965e9.1.2026.08.19.03.19.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 03:19:11 -0700 (PDT)
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
Subject: [PATCH v4 2/7] watchdog: mediatek: Add wdt/toprgu resets for mt6589
Date: Wed, 19 Aug 2026 12:16:23 +0200
Message-ID: <20260819101853.44681-3-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260819101853.44681-1-l.scorcia@gmail.com>
References: <20260819101853.44681-1-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_031914_381083_0D40E5B0 
X-CRM114-Status: GOOD (  12.85  )
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

According to Android sources, mt6589 has 12 reset bits in the
WDT_SWSYSRST register. Populate toprgu_sw_rst_num to allow toprgu resets
in device trees of the many compatible devices.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 drivers/watchdog/mtk_wdt.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
index 91d110646e16..f8208fb0f723 100644
--- a/drivers/watchdog/mtk_wdt.c
+++ b/drivers/watchdog/mtk_wdt.c
@@ -10,6 +10,7 @@
  */
 
 #include <dt-bindings/reset/mt2712-resets.h>
+#include <dt-bindings/reset/mediatek,mt6589-wdt.h>
 #include <dt-bindings/reset/mediatek,mt6735-wdt.h>
 #include <dt-bindings/reset/mediatek,mt6795-resets.h>
 #include <dt-bindings/reset/mt7986-resets.h>
@@ -88,6 +89,10 @@ static const struct mtk_wdt_data mt2712_data = {
 	.toprgu_sw_rst_num = MT2712_TOPRGU_SW_RST_NUM,
 };
 
+static const struct mtk_wdt_data mt6589_data = {
+	.toprgu_sw_rst_num = MT6589_TOPRGU_SW_RST_NUM,
+};
+
 static const struct mtk_wdt_data mt6735_data = {
 	.toprgu_sw_rst_num = MT6735_TOPRGU_RST_NUM,
 };
@@ -493,7 +498,7 @@ static int mtk_wdt_resume(struct device *dev)
 
 static const struct of_device_id mtk_wdt_dt_ids[] = {
 	{ .compatible = "mediatek,mt2712-wdt", .data = &mt2712_data },
-	{ .compatible = "mediatek,mt6589-wdt" },
+	{ .compatible = "mediatek,mt6589-wdt", .data = &mt6589_data },
 	{ .compatible = "mediatek,mt6735-wdt", .data = &mt6735_data },
 	{ .compatible = "mediatek,mt6795-wdt", .data = &mt6795_data },
 	{ .compatible = "mediatek,mt7986-wdt", .data = &mt7986_data },
-- 
2.43.0


