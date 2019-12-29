Return-Path: <SRS0=5MtA=2T=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C103CC2D0C6
	for <linux-mediatek@archiver.kernel.org>; Sun, 29 Dec 2019 08:16:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9449B20722
	for <linux-mediatek@archiver.kernel.org>; Sun, 29 Dec 2019 08:16:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MMLcyEUn";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b9hb0mvr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9449B20722
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=yJfSi+zpuYg5XIIH4eGAMMuV6jbrIH6KmwDJ/pxzeBw=; b=MMLcyEUnEZP8RJtZl8L5Vd3xXl
	GDwg+Fz8iiez+cZOMX0C3Hk2bZpTKnoBd2EbDZQudS9vuVAIxFhtPpDSJ/5lJRDb7KtZROoGpcO1O
	XiavtYBV7pf0IV38RToYmwG4ZA0Tv2Xiu/M6zQjUvXybTrtt2ltkI0S4+ER96xzsRFI1yi2me7ODS
	JTwuYm8v3SUW0d9UAMfgbmQyjlBD1I/yQsVopalAvghj1MD7fRE0e08OC7pYf3zCkokbmReUyoW8C
	dJu6Nkvxs5claS/HqK61/J9p5EpJye85cy5HbAtgixkEiMXrz00RJpwOsoxiwU1H9ijTcB6tKSc7U
	0WojMbKw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ilTk8-0002xZ-M8; Sun, 29 Dec 2019 08:16:08 +0000
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ilTal-0000vb-BY; Sun, 29 Dec 2019 08:06:28 +0000
Received: by mail-pj1-x1044.google.com with SMTP id bg7so6881996pjb.5;
 Sun, 29 Dec 2019 00:06:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=ixbpgZkfNGAKCOr0lEPoSYVoWXPtjLRNZNzpPO1U1MA=;
 b=b9hb0mvrVhTd0TFON/cY4jJeydT/P7lXvGuK137ZrT3sGB72vyWzVXVjaECXZs2pIw
 WPY449C9wwvFqPrG3Qa1ezCsPXXPFs2RmsgxU9ZntgkrPMrbqLvDOGMtRJJxYxOyvsra
 VV+UBrDbyqvaGIwi1XxasEEnq5hYltcEl3EojwVF8PP1GC+vIftFjqW/gALodDDdVKbp
 3aOvC8ETRdUlTQNbSQi9POQ+g4SE8mMEdOf4DbCWK4jWrEjpYPl93PF7r616xrMlvR/Q
 VmI9M4VbsPF3TG2zRzy3OSA/paeHh1zowJrP4V0XERdgK6UkAKR8tLLhfLuOd52S53/x
 XN2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=ixbpgZkfNGAKCOr0lEPoSYVoWXPtjLRNZNzpPO1U1MA=;
 b=XKrETZEW/e29wy2MtFZXgcj3QaFYeOP7J2DXAteuTEoHELEOSIsds9akbmok8VScPD
 qS5sB01Yd8fNxBEjI0T+VAWTd9JDqadV9SMJVugRtVBdJEsAt7aqpyrxw9IvlemnVXyN
 DZllAlFdgIONRZSpN7qYXZo6DAGwRrZaFB/fEIjR8bYVK0NfynmytPpRFBprI0BXNWGr
 grpHXVC9NNOVE+3AiSEcdjbh610q1ndo9zCsOfFl5VebZKdNfnwBZNc21Sx0q+z/Znau
 DCaDb9+lbEi+Pma8NgkJ1OW9AThTbpuoQQOr0Lkhu/BS11rCpmigU7w3j/5/BqZaTMDh
 WoDg==
X-Gm-Message-State: APjAAAWhcTjtieY/87aFSiq50WrMtAIwls4EWYzA7eg3Eo9nSIl/VjDY
 ZC2ynUGm8X+4wwUl038ZnWM=
X-Google-Smtp-Source: APXvYqyDkPiBHYfCdoCXLDgoh2qk/Ypift8UAhqFU0bdxV2l2xmLFYvYYcF0WaO5Y76DoV6YInaAnw==
X-Received: by 2002:a17:902:d694:: with SMTP id
 v20mr22004925ply.127.1577606785450; 
 Sun, 29 Dec 2019 00:06:25 -0800 (PST)
Received: from localhost ([2001:19f0:6001:12c8:5400:2ff:fe72:6403])
 by smtp.gmail.com with ESMTPSA id k1sm43874410pgk.90.2019.12.29.00.06.24
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 29 Dec 2019 00:06:25 -0800 (PST)
From: Yangtao Li <tiny.windzz@gmail.com>
To: claudiu.beznea@microchip.com, thierry.reding@gmail.com,
 u.kleine-koenig@pengutronix.de, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, ludovic.desroches@microchip.com,
 rjui@broadcom.com, sbranden@broadcom.com,
 bcm-kernel-feedback-list@broadcom.com, f.fainelli@gmail.com,
 nsaenzjulienne@suse.de, shc_work@mail.ru, shawnguo@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 linux-imx@nxp.com, vz@mleia.com, slemieux.tyco@gmail.com,
 khilman@baylibre.com, matthias.bgg@gmail.com, heiko@sntech.de,
 palmer@dabbelt.com, paul.walmsley@sifive.com, mripard@kernel.org,
 wens@csie.org, jonathanh@nvidia.com, linux@prisktech.co.nz,
 linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-tegra@vger.kernel.org
Subject: [PATCH 09/32] pwm: pxa: convert to devm_platform_ioremap_resource
Date: Sun, 29 Dec 2019 08:05:47 +0000
Message-Id: <20191229080610.7597-9-tiny.windzz@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191229080610.7597-1-tiny.windzz@gmail.com>
References: <20191229080610.7597-1-tiny.windzz@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191229_000627_450629_05FA4DA5 
X-CRM114-Status: GOOD (  10.28  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Yangtao Li <tiny.windzz@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Use devm_platform_ioremap_resource() to simplify code.

Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
---
 drivers/pwm/pwm-pxa.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/pwm/pwm-pxa.c b/drivers/pwm/pwm-pxa.c
index a2a0912c2dcd..d06cf60e6575 100644
--- a/drivers/pwm/pwm-pxa.c
+++ b/drivers/pwm/pwm-pxa.c
@@ -166,7 +166,6 @@ static int pwm_probe(struct platform_device *pdev)
 {
 	const struct platform_device_id *id = platform_get_device_id(pdev);
 	struct pxa_pwm_chip *pwm;
-	struct resource *r;
 	int ret = 0;
 
 	if (IS_ENABLED(CONFIG_OF) && id == NULL)
@@ -193,8 +192,7 @@ static int pwm_probe(struct platform_device *pdev)
 		pwm->chip.of_pwm_n_cells = 1;
 	}
 
-	r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	pwm->mmio_base = devm_ioremap_resource(&pdev->dev, r);
+	pwm->mmio_base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(pwm->mmio_base))
 		return PTR_ERR(pwm->mmio_base);
 
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
