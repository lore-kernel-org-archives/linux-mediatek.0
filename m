Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B83AC44515
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Jul 2026 16:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yubyZWrL+JQMdwCEigycr7CQmraB7luNnkV3xuug/Lc=; b=PJ++TY75NoOZxvECaxB89UqLxr
	1JSmFD3yGjqGQy9rnUngr3//D6lHL8wrzDFKuZZSp+6sfsslKMHXhGHILT20GeW6nfXHvvlNJUeOM
	grSHEjojZn3E4SMMHygua+Xe2z4P5/J/jEgPc1g0AlHWtvv4vV1EkojboP4clBxAyyFzudjlgqH/N
	ju5sLEOgv9AgEaL2DbUWlpAmLEVWAZBznLOAepnpbDf45yJumpjsTzHg5Pdk7aKDIUOTzy2qsjwjb
	ws9MqzZ05PTFR4PrVfSWHRQ2yAA5FFteMKhUcYuRq3JLoKyDsqeKcy5UjWTnjekxHzi3v4MPt+P7+
	wwBaYAyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkOos-000000008NK-1fX9;
	Thu, 16 Jul 2026 16:20:18 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkOoa-0000000085e-3I1c
	for linux-mediatek@lists.infradead.org;
	Thu, 16 Jul 2026 16:20:01 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-8487b7b3fc8so6613875b3a.3
        for <linux-mediatek@lists.infradead.org>; Thu, 16 Jul 2026 09:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784218800; x=1784823600; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yubyZWrL+JQMdwCEigycr7CQmraB7luNnkV3xuug/Lc=;
        b=poK8QhmkmfYVuwixY9Ia3scXOR6zUcAm3Uzxg9TWNqjLbSASduFMrnErzy+26lVvZZ
         nK1GyEiayWN5yyPeP184cL59WudqFwGXlZoCMGyKKo70euNowwE3DwPycrdgSTG6a4lG
         H3wx7S6U/sKqOoeRkOnmBt0DskBSKqMQk5vec1KMwnUil8pRKrdapD1KAY5FRulvL2MR
         0CKQ4t37oIAH4x9F+OmVqU8LSrpTWcWyIGc/9F1xZt98fs3zH7y55Raf4RwU+zI8Jz9y
         m8iO9/vrAQ0lQZGOa/xeqba7vo0S5ljGZYDE+7y+XnC0wi56kkBQy/GYa7lM6ZsctEyV
         CXSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784218800; x=1784823600;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yubyZWrL+JQMdwCEigycr7CQmraB7luNnkV3xuug/Lc=;
        b=pNk2sbRYWAU4QyMMj5kEQ8r8FcP7H5csKTlUgxqAzK/zz/HT91rk5lbWFpzLNC3FfR
         sOcHgcmZZlMTWGu2WYU3OA3pmAmVkkv4i7UpmqPMFGMtaFrCjkbyMBfvhz4RDBDQ+8S+
         myHJ2h6XHCITv25EbKX3Py9yMzwiFHMNhcsvRd2toGL0zFvKBHwtIFGsdQKBl6cGVeep
         f0xUP8cHI266nu4ZyZO/YKgsRZ2iX3bcxbPwIbWaooVas1xiltfFei9wiWEVt/FSrCBu
         PfZda4AvKat5aoAu1dW0HdsT4z5yeCB4Y0V8C6cMQLf7ul5WRT67S9GnaxL7twzuICCc
         JeJw==
X-Forwarded-Encrypted: i=1; AHgh+Rruu3Asq8dO1I99/fXpXmYN6o81NdZxUgeGCCHnVCGFvzsyMfhysRPOymMp0XCd/tg1xI8AISAt+X4DbqtMiA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzwd90WJXh5VRkrPOXAUh2rGFLiUBwCD+ovyiPwwYS0yXxMXS0U
	T02aXd9dtV7hdz4PZDwTjpjtd7O8/AvTD8+t7v1qW+ozx4jkn5hCExbg
X-Gm-Gg: AfdE7cmjhV3luIRxr+5g6vsuf5nw6u3YPc7KXoaTbfVNqE+vSV5yNba5GzRnnqOK9wJ
	rOYRnVNoItHTPmHB8T4Q5++FigCnUUnN1nNdg9mK6/Hp34TKSy2EFbCva9gFzAAsJY6zFemy4gu
	v37lhJ/TyUGcHZb9zGVOY8qahOE+IDt2bqAITIi6DKmqwTf058812Nks6PDWsia1sxQCD0OaWTQ
	VocLx1kiwV+eMH86jTaFkDHhUjeb6398FvKQKSB4EQ7szPoSVm9+IQPYJhZprvWInKXhi0a/Zw9
	F3xKi/FX2xQXuhSLVeRjC5AcWNKuS6P7CPXRNYbwbL6Z5yNfyV4oxtmrFc5PrXPrx6ScPk2MZIK
	lFKNUfGapWPb603qBcb7+XdCpaBndbxomuFPgkd73iMa+teDbKp8fSRJcKr8sjYBJRTgb2TSQfN
	e5LZLAf4nAo7TmQxPkc+fXUG+IUjDo5crXzw==
X-Received: by 2002:a05:6a00:b93:b0:848:5f4f:289a with SMTP id d2e1a72fcca58-84a516062c7mr12626941b3a.49.1784218799765;
        Thu, 16 Jul 2026 09:19:59 -0700 (PDT)
Received: from buffalo-ssd (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a4f23a600sm5092661b3a.6.2026.07.16.09.19.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 09:19:59 -0700 (PDT)
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-watchdog@vger.kernel.org (open list:WATCHDOG DEVICE DRIVERS),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list:ARM/Mediatek SoC support),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	Roman Vivchar <rva333@protonmail.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>
Subject: [PATCH 6/7] watchdog: mtk_wdt: add reset controller support for MT6589
Date: Fri, 17 Jul 2026 01:19:22 +0900
Message-ID: <20260716161923.266315-7-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260716161923.266315-1-akkun11.open@gmail.com>
References: <20260716161923.266315-1-akkun11.open@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_092000_831499_EFD7A4AB 
X-CRM114-Status: GOOD (  11.50  )
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

Now that no other SoC depends on the mt6589 fallback, it is safe to
assign reset data to the mt6589 entry.

Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
 drivers/watchdog/mtk_wdt.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
index 345d2e89f414..c8ce45a59795 100644
--- a/drivers/watchdog/mtk_wdt.c
+++ b/drivers/watchdog/mtk_wdt.c
@@ -10,6 +10,7 @@
  */
 
 #include <dt-bindings/reset/mt2712-resets.h>
+#include <dt-bindings/reset/mt6589-resets.h>
 #include <dt-bindings/reset/mediatek,mt6735-wdt.h>
 #include <dt-bindings/reset/mediatek,mt6795-resets.h>
 #include <dt-bindings/reset/mt7986-resets.h>
@@ -88,6 +89,10 @@ static const struct mtk_wdt_data mt2712_data = {
 	.toprgu_sw_rst_num = MT2712_TOPRGU_SW_RST_NUM,
 };
 
+static const struct mtk_wdt_data mt6589_data = {
+	.toprgu_sw_rst_num = MT6589_TOPRGU_RST_NUM,
+};
+
 static const struct mtk_wdt_data mt6735_data = {
 	.toprgu_sw_rst_num = MT6735_TOPRGU_RST_NUM,
 };
@@ -496,7 +501,7 @@ static const struct of_device_id mtk_wdt_dt_ids[] = {
 	{ .compatible = "mediatek,mt2712-wdt", .data = &mt2712_data },
 	{ .compatible = "mediatek,mt6572-wdt" },
 	{ .compatible = "mediatek,mt6582-wdt" },
-	{ .compatible = "mediatek,mt6589-wdt" },
+	{ .compatible = "mediatek,mt6589-wdt", .data = &mt6589_data },
 	{ .compatible = "mediatek,mt6735-wdt", .data = &mt6735_data },
 	{ .compatible = "mediatek,mt6795-wdt", .data = &mt6795_data },
 	{ .compatible = "mediatek,mt6797-wdt" },
-- 
2.54.0


