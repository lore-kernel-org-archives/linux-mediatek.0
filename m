Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA0B3C4451C
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Jul 2026 15:15:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5y+pF9Ye8xkl7BWvjPqf+44InrvFLLZAoR3RziMb21c=; b=bOH35PjwxtQKNWwDIwJkPTZoTw
	0Em1UuIZ5oUFkjMflG9Samwam3m9a5tpkQptJFRz9wcOg8M3NdcgMrvBaWRf1AB3ztNyLNogYkUc8
	yl4g1ou+12Vh6JTyD48HMTfcCkSCXjSul3TF5REP9YEkHQr49NrJrMLMl+jf0vYDxN6ROwzMgDiqp
	VWg0Y4kKbzQ8Ym2zAEknKFBWCCTgL+DzmxkH4mS01AJetO56ZWQCYn3XSJbN8JUrv/jWQZSlQ/wew
	j7aNR6+COq9TdglUgDhK8XvN4j7CtRM8CbYeFgL2NxT1pOvFN3Mt+6FSu4Yj7MvnTJnzAZ2FCbvmQ
	ZeDasXeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkkHW-00000002Zpb-0JZL;
	Fri, 17 Jul 2026 15:15:18 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkkHQ-00000002Zhx-170V
	for linux-mediatek@lists.infradead.org;
	Fri, 17 Jul 2026 15:15:13 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-6983f20a8bfso12791152a12.1
        for <linux-mediatek@lists.infradead.org>; Fri, 17 Jul 2026 08:15:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784301310; x=1784906110; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5y+pF9Ye8xkl7BWvjPqf+44InrvFLLZAoR3RziMb21c=;
        b=GNJwyNA/PiJ922XVl3KXt8kSAcs9XH7TMs5OhyKSONd5EPFhZ3+s9X9FWqch4PPVz0
         Rr2vPs/qEd8wQQrCvFkAHoklfBDUbjUz4BTsB1FNnHsNCFDecmcgMBNiR/KFDFTi0xuP
         nTn3l6OrXGPaMBSjSPSs/vKuRRE6Bhx2wiYNuddonzN0HRMgUbVclYdwBVa/uB1vt/Xa
         hL2bySvrrt7rxO1IAAPsqTfYknxlmoVvaaP9TKzgxfl9hSFF+5u6Kk9VVSzeqBF8KInU
         GKJj1kLUx5SVtUR24QTZ05OhYnJl74hdMiALHjFOLAxjOauzOF5MP861/Q5tdAEAB7LI
         APVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784301311; x=1784906111;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5y+pF9Ye8xkl7BWvjPqf+44InrvFLLZAoR3RziMb21c=;
        b=TDi59CvPeQl/Z+Mzj9WDBbGy8T8F/PX+hBjT7wQO0JQTjjsWLfT7vix6uiBMgIfnbM
         kMKa7en5kbJML29LLYCwU8U8PPTMeeb+QeOGJaKsa55rSMqyvcqQI7p/uf/M5fOW2puG
         AKacTE0YyM/B46G+UMSYlZz0WUG6SaPfoXtmzfATXX4IbdXY7ap9H7Xi4MQHnWwpNBzL
         aUwtJcT4Xkg7NcUzkWtJ52YIacULo7WEbIGgYWM0Y/A4Pqupt+Zeu5HI0KGlR8rRPJIy
         0XDy2WGwI8tmwrkPr/Gwa7JAFvLkew6u8qWPmZ8zLhxYL0NyQGVE3NT1ozQxt/8WOqc5
         tNJQ==
X-Gm-Message-State: AOJu0YzpqVRYGQk8J5ROyTSJGZdnAMbE5jhyVomaG3rnmD+NutUvp4RJ
	umvdwec/4NhSwb7JFl6pDufA/AvO57qIw5Q1oub+wnELz6JO5i4sOY+/oOqnZ2SY
X-Gm-Gg: AfdE7ck8w/xFbKxDqd+sPH79MRwvoyD3k0LEPtf0HPyuIz6GlTPzG/O8iJY8Qqg20Ob
	OWyLBKJVP3vV3qvb8bZaBvl7J1Z0V16LEp668K/DRSl2njrinVhVp3gy0MtebWPodWHgu0U+rNL
	CziGaPTJ4wLLZiukGc8Yjd9fyALvfZBdncXnBpK66V/umOb56loAIpXhatxQyxs3eAnDtA6OHur
	qStM6tcUg808N6FUUfwWW0km2KAgKC0p4W8sE+IhP0H4XNcXeeVN1g46pU6xP6x2Kzji7adhGbe
	eDzzSDf2grf3mG8YqHlUdBXXUNe3duJsfoYolN8gFYwxf/aTVhVnilIDpU+uMkHFZtZbpK7vu81
	XzTLow+Ne4U36u4aIbVi4uwvj3hLRZCWmo2fkS8BqjkTlYOFFnpWSWh5yeR5ewkAD1sDbriBCiQ
	==
X-Received: by 2002:a05:6402:528e:b0:69c:7406:9492 with SMTP id 4fb4d7f45d1cf-69e652e1111mr1154154a12.39.1784301310590;
        Fri, 17 Jul 2026 08:15:10 -0700 (PDT)
Received: from luca-vm.. ([109.52.116.145])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69e6ffbab34sm931684a12.14.2026.07.17.08.15.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 08:15:10 -0700 (PDT)
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
Subject: [PATCH 5/7] watchdog: mediatek: Add support for mt8167 TOPRGU/WDT
Date: Fri, 17 Jul 2026 17:11:12 +0200
Message-ID: <20260717151134.678839-6-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260717151134.678839-1-l.scorcia@gmail.com>
References: <20260717151134.678839-1-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_081512_331220_14E420EA 
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


