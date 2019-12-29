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
	by smtp.lore.kernel.org (Postfix) with ESMTP id D89A6C2D0C6
	for <linux-mediatek@archiver.kernel.org>; Sun, 29 Dec 2019 08:18:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9B48820748
	for <linux-mediatek@archiver.kernel.org>; Sun, 29 Dec 2019 08:18:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QtVTFLC0";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E6kKDc1c"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9B48820748
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Q/uRkYmzfToR/8d5Tffw+DDJGyfv2ls28SDoPcKTxNQ=; b=QtVTFLC0J/5Rkogb/HyqcRyQ9X
	NhJSTmZKbevdIkbopJV43yAXVUg2T9Fz5A2M+wdw6OepjvzKVOVQ+xgt/Giw//XUXzySQ96b6bn9V
	qSgelZ3tbRuzAkt0kaKrtyuve+HHZ3vtn9719SCWF6vQDwAcVkE+RZEzsvVrJw25UciUnTgp/AN55
	9geyKzUf3aNRl+FJUuuwJTK1/PBF8XRUYHaseeE9xICategxOPFh/9i8P/U9bjgQZi9zXVTbR8bbm
	nZTIi0jAnYOeSKtHIn1ysyewoOakFNUBr+Yj8BAIcbrz9V3kjKfnIV5ilf9vrQ75XFXg+A8aU/6xM
	m9Lorx8w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ilTmZ-0005VK-CW; Sun, 29 Dec 2019 08:18:39 +0000
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ilTaz-00017Q-1Q; Sun, 29 Dec 2019 08:06:43 +0000
Received: by mail-pj1-x1041.google.com with SMTP id a6so6625726pjh.2;
 Sun, 29 Dec 2019 00:06:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Pe7z29fRNe5SM3JyqTcr+ajpELEpJ4s61Kvtp+b3jfk=;
 b=E6kKDc1ccDfUno5iuV2/36t1tRGyzcoCrbrGkA48JnmLme4WYttoT2natZ0DS1wKBy
 jQlL7uYK0gxMbTMdSW/ouKjGvg6uGzW4AACMSO73e89dnkNh/b+8vCGyVE6wHArrA4qg
 rZJ9hH3uoB9wDdCAPwZl3jfrY021ZsUga0LMCTHRNs2mMJ6/g/QHoWb9fxu0jB7+xZTd
 Z/kGz/BRPgLl6OIG9cjDx3g30glFXrSoW1KmlRnOJSWs7dfGvv3J1lgYNQWKvPJMKP5w
 0LVM9WywgdkNgbxEYjhxa05BF3g9PfZ5tsAKHZrLXeRxyEx3GOnbmeNcKzu61Se8a+ib
 KWlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Pe7z29fRNe5SM3JyqTcr+ajpELEpJ4s61Kvtp+b3jfk=;
 b=TtYC/hCzFhjWUV/JUNcmvl5cVJgOVDpZt9XHrVJb67OjEWGGnu2eJVL2/qvjsxBWwH
 8f8g/WLkbomp2ZYwoi4BXe/FVhHpeUyQQtG6pyJo1rsGDtfPXwtp5yGVn8+mQ38iB2Qd
 6laLTJCxaSfUIgfmPD1cDSfVOI18k75DObQgyPeWjEQ+76z7QBXwsVnUI3iGSHfy31LF
 pVnYHDX7rdUM8+NkvYMtcz7rLuEFgEiLw8HZU/cVcVWTMa/YYJ38ODevBBjTXus4Ljjh
 McRxM2tRKwX5wquyucUHISdDe/g6JoLeaVWeUVAbxr2IgRA6I/tZE2ZoTW20Dog+mOgb
 uytg==
X-Gm-Message-State: APjAAAUYaAH4sgsZJiN4d6DV1CdNkfamZaorj0YjUJQL1YCMXiQuN7MO
 P1P9BWSb1MkWlEQZNu3lGhQ=
X-Google-Smtp-Source: APXvYqxIMYpEGxMzLdsKYBj8rpDkpOr4YQd01fkuyPBNDQ089lxGYTs+RS+KP+qyyW8xims4wb9VOQ==
X-Received: by 2002:a17:90a:5d95:: with SMTP id
 t21mr38920834pji.31.1577606798522; 
 Sun, 29 Dec 2019 00:06:38 -0800 (PST)
Received: from localhost ([2001:19f0:6001:12c8:5400:2ff:fe72:6403])
 by smtp.gmail.com with ESMTPSA id q7sm20290229pjd.3.2019.12.29.00.06.37
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 29 Dec 2019 00:06:37 -0800 (PST)
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
Subject: [PATCH 20/32] pwm: imx: convert to devm_platform_ioremap_resource
Date: Sun, 29 Dec 2019 08:05:58 +0000
Message-Id: <20191229080610.7597-20-tiny.windzz@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191229080610.7597-1-tiny.windzz@gmail.com>
References: <20191229080610.7597-1-tiny.windzz@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191229_000641_235394_A72D9530 
X-CRM114-Status: UNSURE (   9.43  )
X-CRM114-Notice: Please train this message.
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
 drivers/pwm/pwm-imx1.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/pwm/pwm-imx1.c b/drivers/pwm/pwm-imx1.c
index f8b2c2e001a7..1a60bfd7d659 100644
--- a/drivers/pwm/pwm-imx1.c
+++ b/drivers/pwm/pwm-imx1.c
@@ -136,7 +136,6 @@ MODULE_DEVICE_TABLE(of, pwm_imx1_dt_ids);
 static int pwm_imx1_probe(struct platform_device *pdev)
 {
 	struct pwm_imx1_chip *imx;
-	struct resource *r;
 
 	imx = devm_kzalloc(&pdev->dev, sizeof(*imx), GFP_KERNEL);
 	if (!imx)
@@ -168,8 +167,7 @@ static int pwm_imx1_probe(struct platform_device *pdev)
 	imx->chip.base = -1;
 	imx->chip.npwm = 1;
 
-	r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	imx->mmio_base = devm_ioremap_resource(&pdev->dev, r);
+	imx->mmio_base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(imx->mmio_base))
 		return PTR_ERR(imx->mmio_base);
 
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
