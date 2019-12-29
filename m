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
	by smtp.lore.kernel.org (Postfix) with ESMTP id C93DBC2D0C6
	for <linux-mediatek@archiver.kernel.org>; Sun, 29 Dec 2019 08:20:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9E1B720722
	for <linux-mediatek@archiver.kernel.org>; Sun, 29 Dec 2019 08:20:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RdVj/QM2";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MIXP/grZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9E1B720722
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=pVNmTDW1y/xTdu68tRIaXTQ5f1CBAL7d+Qo75fnNvro=; b=RdVj/QM2h6TmL5xTbg8FPD9l6X
	NbTAhEQdJDMW88xcYAN4gDEe9JCmIPO0EC25t3r35AJsqnfuTo9E7xFKp0D/gsfmMGFjeA+MrU5ZZ
	t63jUGDa7i3Ycr5jul5JJyJfhQrl1ATdDN9P9wuPEWpYA4AKHw4B6mnx5NG2xZBqO3vD7PYXUwhHl
	KgGFlVE4Ewn4brRWqVXoJICfMrGpZGoJz0lJUtX+jLHNshFmE7ObzGlW0NlwthhU8DrzSt3vuh9bO
	Iwt+slER3WpFJ/O9n51gWAxPFie0zCOv7BSPslrZkZ6mTEyAqhk2+iIDNWE9fkah5ZDsGGCgWfJDk
	i3do82bg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ilTo6-00007i-3R; Sun, 29 Dec 2019 08:20:14 +0000
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ilTbB-0001Ij-OH; Sun, 29 Dec 2019 08:06:55 +0000
Received: by mail-pl1-x642.google.com with SMTP id g6so10550008plp.6;
 Sun, 29 Dec 2019 00:06:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=47el5Owup02YUbMebGEaPI3XvpkPXD+FFtHlPrEyxFA=;
 b=MIXP/grZx6mWbEPfFXoqRs3JDVjT04SNhSSWru67t/m2eIdF2cqFP0yxHw3B0ADWzA
 Mj3R/G2Hv0hE88wKCIVgrmJUyZU1RwbGy8FRZe4fVCKonv6vI4DRiJPdpxqydIsjM3Ll
 MCKmGePOPt3QMQPqZx5luh3T2jxYbH9ahKrCYeSs4sO6/eCjeQcZxqD6zWnTnfkm1VFm
 4VeDCHj74to92KPKBIPeT1p5Tr6sWXUDo8dBqmrioiHBkpdcY169L96miePLUYBE4YgA
 TCVBtRbuC058Y/EY2qJFGEXH571X/xpG8vWrH0jA9cQoeT147Yy9P95L7fSgzdeip8Gu
 i2pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=47el5Owup02YUbMebGEaPI3XvpkPXD+FFtHlPrEyxFA=;
 b=qI00ozP1u6vG0yMhOl8KHV1gZj4yKUX0Jfkjwr2sQ6gpSIhxYpUDga0E+zTaO1r4Mi
 M54ckxN0uQ+vXGTO+vkHuL0nLyMUeEwTdnoeOvsQjV1hlHWFXWHLSGWjpuOmERqp4lzj
 svxJdk3G0Ky8RN6bU1vpxSagPzddkG3RdyKyKKG20BHOfIAk/gJiOJcKrBxkZrBNodrF
 EGTyKH2MJbouLrd7l+B4Lo05qfX2P6HNrRStNjop3GspIM/7RkQJSSYvFmRO7TAYSY5L
 EeQ7rySzON6uCNZyckPu835AqplauWj2604p3S5GkkS6DKSWX1tcQTAjAyuwqI0ambw8
 y5HA==
X-Gm-Message-State: APjAAAWZx06IMoMsROZ0dHuKdKDtTqQlZId50M4hi+OZFnLstbSDiDGa
 5h7tRB6Ufiqnrv+hjNoECF8=
X-Google-Smtp-Source: APXvYqx0/m9vcRiiE8VyrTjc7rP0/kHdHXJwPeS5Tef1XK44wL7jcNW0xwmNSTXH2Pe6rwcBvhW0LA==
X-Received: by 2002:a17:90a:3763:: with SMTP id
 u90mr38493406pjb.107.1577606811634; 
 Sun, 29 Dec 2019 00:06:51 -0800 (PST)
Received: from localhost ([2001:19f0:6001:12c8:5400:2ff:fe72:6403])
 by smtp.gmail.com with ESMTPSA id a26sm37945389pfo.27.2019.12.29.00.06.50
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 29 Dec 2019 00:06:51 -0800 (PST)
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
Subject: [PATCH 32/32] pwm: atmel: convert to devm_platform_ioremap_resource
Date: Sun, 29 Dec 2019 08:06:10 +0000
Message-Id: <20191229080610.7597-32-tiny.windzz@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191229080610.7597-1-tiny.windzz@gmail.com>
References: <20191229080610.7597-1-tiny.windzz@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191229_000653_882537_02EB2D0E 
X-CRM114-Status: UNSURE (   9.54  )
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
 drivers/pwm/pwm-atmel.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/pwm/pwm-atmel.c b/drivers/pwm/pwm-atmel.c
index 9ba733467e26..86cc5ccaa46c 100644
--- a/drivers/pwm/pwm-atmel.c
+++ b/drivers/pwm/pwm-atmel.c
@@ -340,7 +340,6 @@ MODULE_DEVICE_TABLE(of, atmel_pwm_dt_ids);
 static int atmel_pwm_probe(struct platform_device *pdev)
 {
 	struct atmel_pwm_chip *atmel_pwm;
-	struct resource *res;
 	int ret;
 
 	atmel_pwm = devm_kzalloc(&pdev->dev, sizeof(*atmel_pwm), GFP_KERNEL);
@@ -351,8 +350,7 @@ static int atmel_pwm_probe(struct platform_device *pdev)
 	atmel_pwm->data = of_device_get_match_data(&pdev->dev);
 	atmel_pwm->updated_pwms = 0;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	atmel_pwm->base = devm_ioremap_resource(&pdev->dev, res);
+	atmel_pwm->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(atmel_pwm->base))
 		return PTR_ERR(atmel_pwm->base);
 
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
