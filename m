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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81924C2D0C6
	for <linux-mediatek@archiver.kernel.org>; Sun, 29 Dec 2019 08:20:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 162AF20748
	for <linux-mediatek@archiver.kernel.org>; Sun, 29 Dec 2019 08:20:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WgYh+KWd";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LeTIqEBW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 162AF20748
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Mq7P3amJhdEhbixsIjDvcW5VqlJ7EUEtq+gxIA2cS8A=; b=WgYh+KWdgISmKOPWU40xxmu+p2
	08ajz6U3m8Oe8GpduykxKl7kGUukpx9GCOxxT+xe34Wd6bczFwHFFIkW+AmB0+ipBT8GccQKZPD9E
	oN4gBL8hA5vtT+JS/bSDg/Cs8Ki5DADUH6QP5zJQKHsnV41paCwoYNHfoxxjSTTbZK27IeB+rI4cv
	/LemeL3oLMfb4fXaYJV+AZ9lpzVIq02EEtbhxMmksqZ9/8083TATIE8jXohDpa9dU2c8o5tKMtFxf
	BUTiyoWg604K+JcFtKfjvwOML+Gw/19CeC/kS0H6jjYqvXs9UV/F0Ow/kl3IdjVWc+v6zSPThM8AS
	4tCxRp/Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ilTnl-0006w3-GX; Sun, 29 Dec 2019 08:19:53 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ilTb6-0001Ef-TN; Sun, 29 Dec 2019 08:06:50 +0000
Received: by mail-pg1-x544.google.com with SMTP id a33so16617845pgm.5;
 Sun, 29 Dec 2019 00:06:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=yOZESLDf3NMQl2AQzpvlA7k5qk3OCi4YGKummQOrFs8=;
 b=LeTIqEBW8Zs2cVWvHu0MnAMgs+gLcpWeH0KGWJgyv0M4pne784SNrN22qVKM9VxLGg
 VkIgrhxEQ30CzrwesG7m0kyxQNTtuJIREZP5mbsuT7kI006XW457m7zpP8wcDJdtf5wW
 rG7IArpjXRiHApgleitFu/5xtZnNb60rGHKkteyiSyxzEIOgHYKziuHHCk9148gX35M7
 ZtYqBDU5ew/TJi2rPABaXhvcIm1UZ5jSuJkS5NlSH35OEiGzFXbzdok6V3FbwW8o4qn1
 UQJCAjR5+JG3n7x1sg+c1vg1x6XfsOhyp98ZNaT0SlitZqjGC6W+QrI2xtcqSAPOGZB4
 nCYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=yOZESLDf3NMQl2AQzpvlA7k5qk3OCi4YGKummQOrFs8=;
 b=g4I8v6Y+xy8q+gSoBEJT63KayA5I33fvTJYxngt7XF6AkjxnwBgtDH2BPCme1mAQ3U
 9g3t4pVts+M8Cpw3QEIrw9gWrz8l+oJ2W+Nd31DhsFQMsMp4TqDIIWb+CVOuqgYGgqYE
 jSunLM1gD5ZuAh9HVcDuQOlTIpC5OfEWOdioyg/41nl/a1b1/7etHqo8qR9eIk9FHRnw
 DD1kEC+jK0rny/egfbpjwNanzDhdSolCKFz+JzwMl9dGRxZ8MpAKK6NgB1fXt+h8Cjyy
 9txQN6JzEB5eZ8+kwVRCnZVHIXTE4q1xS/0Gehx1BX6CI1Ohgt2LfFohlcrImjs+zU1N
 xRdQ==
X-Gm-Message-State: APjAAAXBIMISmd4m6r2TM2WtqeiV11UQxIXvgB2Im6m/8meEVT2D7BZU
 B4T0g+jGvjwuFXD9gIRRgEM=
X-Google-Smtp-Source: APXvYqy3I9nbiiPsy5usJiGTqqOxXYQdFH9OZhOVBLvhOhgfJN5S0H2k5R3G4H5O1kb/UplcTjBTuA==
X-Received: by 2002:aa7:82c9:: with SMTP id f9mr65137704pfn.168.1577606807243; 
 Sun, 29 Dec 2019 00:06:47 -0800 (PST)
Received: from localhost ([2001:19f0:6001:12c8:5400:2ff:fe72:6403])
 by smtp.gmail.com with ESMTPSA id a69sm45429777pfa.129.2019.12.29.00.06.46
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 29 Dec 2019 00:06:46 -0800 (PST)
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
Subject: [PATCH 28/32] pwm: img: convert to devm_platform_ioremap_resource
Date: Sun, 29 Dec 2019 08:06:06 +0000
Message-Id: <20191229080610.7597-28-tiny.windzz@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191229080610.7597-1-tiny.windzz@gmail.com>
References: <20191229080610.7597-1-tiny.windzz@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191229_000649_048934_1DEFBB07 
X-CRM114-Status: UNSURE (   9.50  )
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
 drivers/pwm/pwm-img.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/pwm/pwm-img.c b/drivers/pwm/pwm-img.c
index c9e57bd109fb..e9b25440b808 100644
--- a/drivers/pwm/pwm-img.c
+++ b/drivers/pwm/pwm-img.c
@@ -238,7 +238,6 @@ static int img_pwm_probe(struct platform_device *pdev)
 	int ret;
 	u64 val;
 	unsigned long clk_rate;
-	struct resource *res;
 	struct img_pwm_chip *pwm;
 	const struct of_device_id *of_dev_id;
 
@@ -248,8 +247,7 @@ static int img_pwm_probe(struct platform_device *pdev)
 
 	pwm->dev = &pdev->dev;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	pwm->base = devm_ioremap_resource(&pdev->dev, res);
+	pwm->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(pwm->base))
 		return PTR_ERR(pwm->base);
 
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
