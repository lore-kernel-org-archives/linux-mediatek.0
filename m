Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BE49C44512
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Jul 2026 16:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0XSWaTM1tBQVfHgrp4sw1lVesZlq79impBsPYXVNYsQ=; b=F32wpBPoCf6JzrP2MJVaubGCtp
	8QI3bAiPgb8MQlaBABS9iDt8G8Bm8O7m7+nDgitKmAAbmyKNuAcE+gCjx1HetJtVEmnxPJi0OOp3s
	4rV5hmBu9lBqtsjR9zr0QXbsvqO0TdrtF7Pn5vD4a/xKRPE+zNmv+pHnkNPW3kCtXaV7LscPACjsO
	gtkx25tK3fxKJjp+okZRfjwXCh5bat12RTfToqEzc2l3elc1VUyvhbgFAbyf9NwwPasW2eIKYNyaO
	+sK2FAGnr/Zuw48CBX+YEF/Ze64iZX10dEiZALXGOwx3XQnaXjuM+TJnOzUjYpbsrS/Y8pofDSdzF
	vOzdZjIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkOoU-00000000811-06w3;
	Thu, 16 Jul 2026 16:19:54 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkOoO-000000007xG-1zOe
	for linux-mediatek@lists.infradead.org;
	Thu, 16 Jul 2026 16:19:49 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-84874b52eabso4703824b3a.0
        for <linux-mediatek@lists.infradead.org>; Thu, 16 Jul 2026 09:19:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784218788; x=1784823588; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0XSWaTM1tBQVfHgrp4sw1lVesZlq79impBsPYXVNYsQ=;
        b=m4TA0o5QdrkKwc+t5z953vG10n/oH7w8EruGrDxFH/rV4nDVPDK4ecd4suJn0HcCPs
         +zefD5u9wbW7B4miQMs77K0JItxgh1GRdADuq6LOYtCMh5w/6EP5Ub1nCpkk+4s0GGzW
         fItFmiN+GmB4wIWd+K4PxgTMpsyAKuoO006n2rhcv6v7Z2OjtMWhyNIR/YAOPm6eGAte
         3M6htmu7vlvz8QsFA4LMhZjIBVkTmnspR2//ZWLlX2OMK5URVKmJvkofHtKcPwoSgSGN
         gyNus0vkpREzalxRpeIaKw7UJrE+d1ZaPjyGd8+LEZ+vo0mLl7VCOup5qrcKLqrKwdJz
         ifBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784218788; x=1784823588;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0XSWaTM1tBQVfHgrp4sw1lVesZlq79impBsPYXVNYsQ=;
        b=FJa4rSkLLl5YrJMreccTgekyxnCr8vDVEF+UeAoAMndJ/LRnF/uSDL75HBoPDsr9pg
         Lem3MvguorAwI/ivAY0rWLH5C9D3MUIypLH3MeD6l0Gnyc//uV/d7o2TzdrJXOog7/8n
         /vMHSE7mWLWzkD99y4pZGBzb7QpVqUNc/t3ehaSfAHz+V08mpueLRh8rlxLtUn+akRUr
         Po7wYUqm2BinXw5RGUZ0RlGxOtKvcpmFZZ5uW9rky62cjhgc8+McJCNekEIFfASPKAyt
         8xcYHd2E3sS+kblHY5Aw4YikaGEpABdH42kFIE3N7cj7HndgfTamV/dqiV4r+nutYUco
         eOaA==
X-Forwarded-Encrypted: i=1; AHgh+RpJFNfcOUp9nSHkVIQ8AB6A1B1YflNXSQwKHZyo7lLDWBFFsfX4QtWSDHEn9MNTIgq64XGq716DoMg4ahxx3w==@lists.infradead.org
X-Gm-Message-State: AOJu0YxYsOTk7gG7P+vU39hwfqa1ggi69kF3UwwWXBweDrBaQvVLVTGE
	61W5scIfo6edYhF+v1tTXmSTlzNBRTGGkKHeGLkMEJJGKPqB4fi/QRTe
X-Gm-Gg: AfdE7cmnShBsVBvB8pGrbH3UN0nn9Iuu8LWJj6SybXyT45bqik9sF/tz9BPuP1nqhkK
	ZUaJmqlUebgOQ2kptvwQPwVds0aNOZScBk7LA91nIDo6fRXZ7mkqH2qbkTAjFKpmBEpXRv8rb4N
	SZ55mJiy094SjzpRcSDOBl+eaJCwY+oMiI+/Y0HFBEk5RVFPxkSo5elnYBK+MYyYK0eWwYlK+AU
	d/DCOMKdSHDGR7dba4apyU1m2Tv0HYwwNvoCNy3/E1e8ABMPbSxyFPXw8Focf/PLOYj9F8LfRrO
	WUOSvTX7UJ/Mh18I1mxEUtgkjnS6KIVoXsIje+GfxQha4d6EUK88l+23Pj9kd7RyPhYFAi46Gbc
	iVcKxNxJQ1uxgWiMoOYelL8w+FxpzuVhjyTKuDYqBk4JWPche9ZcWac9Q+2566g4PwQ+B0vK41S
	S+AeBaTPF5SX2rJDngIu/k40O/nr+Pm3uIvA==
X-Received: by 2002:a05:6a00:9504:b0:848:6895:b754 with SMTP id d2e1a72fcca58-84889643b57mr24897638b3a.28.1784218787589;
        Thu, 16 Jul 2026 09:19:47 -0700 (PDT)
Received: from buffalo-ssd (M014013071096.v4.enabler.ne.jp. [14.13.71.96])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a4f23a600sm5092661b3a.6.2026.07.16.09.19.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 09:19:47 -0700 (PDT)
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
Subject: [PATCH 1/7] watchdog: mtk_wdt: add explicit compatibles for SoCs using mt6589 fallback
Date: Fri, 17 Jul 2026 01:19:17 +0900
Message-ID: <20260716161923.266315-2-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260716161923.266315-1-akkun11.open@gmail.com>
References: <20260716161923.266315-1-akkun11.open@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_091948_513992_12B0CBD6 
X-CRM114-Status: GOOD (  10.05  )
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

Several SoCs currently rely on matching "mediatek,mt6589-wdt" via the
fallback compatible. Add dedicated of_device_id entries for each of
them so that the driver can match directly on the SoC-specific string.

This is a prerequisite for DTS to safely drop the fallback string.

Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
 drivers/watchdog/mtk_wdt.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
index 91d110646e16..345d2e89f414 100644
--- a/drivers/watchdog/mtk_wdt.c
+++ b/drivers/watchdog/mtk_wdt.c
@@ -492,17 +492,28 @@ static int mtk_wdt_resume(struct device *dev)
 }
 
 static const struct of_device_id mtk_wdt_dt_ids[] = {
+	{ .compatible = "mediatek,mt2701-wdt" },
 	{ .compatible = "mediatek,mt2712-wdt", .data = &mt2712_data },
+	{ .compatible = "mediatek,mt6572-wdt" },
+	{ .compatible = "mediatek,mt6582-wdt" },
 	{ .compatible = "mediatek,mt6589-wdt" },
 	{ .compatible = "mediatek,mt6735-wdt", .data = &mt6735_data },
 	{ .compatible = "mediatek,mt6795-wdt", .data = &mt6795_data },
+	{ .compatible = "mediatek,mt6797-wdt" },
+	{ .compatible = "mediatek,mt7622-wdt" },
+	{ .compatible = "mediatek,mt7623-wdt" },
+	{ .compatible = "mediatek,mt7629-wdt" },
 	{ .compatible = "mediatek,mt7986-wdt", .data = &mt7986_data },
 	{ .compatible = "mediatek,mt7988-wdt", .data = &mt7988_data },
+	{ .compatible = "mediatek,mt8173-wdt" },
 	{ .compatible = "mediatek,mt8183-wdt", .data = &mt8183_data },
 	{ .compatible = "mediatek,mt8186-wdt", .data = &mt8186_data },
 	{ .compatible = "mediatek,mt8188-wdt", .data = &mt8188_data },
+	{ .compatible = "mediatek,mt8189-wdt" },
 	{ .compatible = "mediatek,mt8192-wdt", .data = &mt8192_data },
 	{ .compatible = "mediatek,mt8195-wdt", .data = &mt8195_data },
+	{ .compatible = "mediatek,mt8365-wdt" },
+	{ .compatible = "mediatek,mt8516-wdt" },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, mtk_wdt_dt_ids);
-- 
2.54.0


