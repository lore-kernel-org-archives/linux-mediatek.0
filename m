Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE514C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Dec 2021 09:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Mime-Version:
	Message-Id:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=ONQsvDErmNAsMuHUk8h0UBH9tkvfut/6dyM86nevzzM=; b=hiB
	8LOPTfmL4e9TUX0VmwSKspF8skiuK9jPtDSxUFE60/4+aaEjZZm+mOlfkLDNrHIOHSqo9qxG6IPlJ
	6l1CZp4cb42vNf7SbT+xUP0y/qvbIW4CIyDZDKe7GF69flc/dU8/0g4PLJ9z1PiQZddLAhBWrz2CP
	Eu3dpbvJnodnf1XzrnX7uv89RlO8S8jxbhLmzPalAyOY6QJeIZwp7h8NRzK3fs41KcNM7uxpC2CTc
	xpP3lE3mybmOwHAzLJVl7E+Ls3lHeLu9a5uMMhTYez7YJ/7lfNXgbnSY3CFxBXKEm7kDdk3GA0hp2
	3uar3kUADqYZ7nPZnV1SYNDIv1QAfHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mutgW-00C0ij-8G; Wed, 08 Dec 2021 09:56:24 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mutgI-00C0du-AY
 for linux-mediatek@lists.infradead.org; Wed, 08 Dec 2021 09:56:12 +0000
Received: by mail-yb1-xb49.google.com with SMTP id
 t184-20020a2546c1000000b006008b13c80bso3717372yba.1
 for <linux-mediatek@lists.infradead.org>; Wed, 08 Dec 2021 01:56:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=VEUso1iUERxMrhDAGJGVXME2Ba4vBEfYFLFN/9mCKOc=;
 b=bs2suS3oNU/TKeJh0arlrk0SgYqcFtn1C+mdVQnTI8h509F58G7tqpdxbLwaSZ9Tbt
 sEH2s1rzzgjruiRRuiCJUJ08FOq8261V2ew9SKWwlxOfA0UPBIQTCh5ewDkMzlTMxUN8
 fweOd+jiB/4uqL/v/3RgxuZ1UiL5B3H68bbFFhDc0HoMBAvW+eKMy3mJbYoNGnK3orOP
 wPMdlT3lA7JvjbBMYUZfS5vApOVJO7bDUa4Ts5ZCS/8m49kVmXtbwc8R4iOxPJtdhZuI
 jC8b++71n6LmHVrxRpo7KDXNgOqs4DLZ78CenE0vPOnpellV21wZVbgcjB/t+YFon3FK
 QHfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=VEUso1iUERxMrhDAGJGVXME2Ba4vBEfYFLFN/9mCKOc=;
 b=BDXKNxSgQUkH+UKBRkOrcncRsWxRm1sMSTvD4HWp0K6xau9zQhANYF0YwwM1A7V3zg
 ymsA9Jro9xtJula8rYDFiAnRFVrtnqN3X/JMzQFQ0LjUPAVM08XGPGA0EW5uERX7ayw2
 jnbeFTZeDBPOoV8H/SHsQeJhbau8NRwxAqhItNkz22vl3cksvLmDQ3ivYWcVYZvTTCgQ
 D4E4gADqi/U9llVe0QLU+YASS5tgJMWKGdUwcuUheFf6e0GAGbRdVv5wyv6tj0KxFI4W
 h6DjVd8SmFpJsLva8BnIwmQcbAn4DZo+lb+ThyWGGrucP01g73yWKzNRCH3AKGEMTQW8
 MnFw==
X-Gm-Message-State: AOAM533MH7MCG/t3UVXF7L33Z62TGvWseO5hlh0/xEI4NoWborHM8E87
 cMTpM8HF4BBAxt+hH4+7KF9eXxrTkPTN
X-Google-Smtp-Source: ABdhPJyn5dZSZVoFoykeFQu48j08P80ghWTxCrEKFgd83B9L5HQ4wLohelQrfF7Jl0G85kr0JXoTKG+lgAX6
X-Received: from tzungbi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:63d3:57e9:34c:bf63])
 (user=tzungbi job=sendgmr) by 2002:a25:3154:: with SMTP id
 x81mr57516600ybx.16.1638957368406; Wed, 08 Dec 2021 01:56:08 -0800 (PST)
Date: Wed,  8 Dec 2021 17:55:55 +0800
Message-Id: <20211208095555.4099551-1-tzungbi@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.34.1.173.g76aa8bc2d0-goog
Subject: [PATCH] watchdog: mtk_wdt: use platform_get_irq_optional
From: Tzung-Bi Shih <tzungbi@google.com>
To: wim@linux-watchdog.org, linux@roeck-us.net, matthias.bgg@gmail.com
Cc: linux-watchdog@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, wangqing@vivo.com, tzungbi@google.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211208_015610_399138_A0273B13 
X-CRM114-Status: GOOD (  10.64  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The watchdog pre-timeout (bark) interrupt is optional.  Use
platform_get_irq_optional() to avoid seeing such following
error message:
>>> mtk-wdt 10007000.watchdog: IRQ index 0 not found

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
The patch bases on linux-next next-20211208.

 drivers/watchdog/mtk_wdt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
index 543cf38bd04e..4577a76dd464 100644
--- a/drivers/watchdog/mtk_wdt.c
+++ b/drivers/watchdog/mtk_wdt.c
@@ -339,7 +339,7 @@ static int mtk_wdt_probe(struct platform_device *pdev)
 	if (IS_ERR(mtk_wdt->wdt_base))
 		return PTR_ERR(mtk_wdt->wdt_base);
 
-	irq = platform_get_irq(pdev, 0);
+	irq = platform_get_irq_optional(pdev, 0);
 	if (irq > 0) {
 		err = devm_request_irq(&pdev->dev, irq, mtk_wdt_isr, 0, "wdt_bark",
 				       &mtk_wdt->wdt_dev);
-- 
2.34.1.173.g76aa8bc2d0-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
