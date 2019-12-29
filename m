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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 657EAC2D0C6
	for <linux-mediatek@archiver.kernel.org>; Sun, 29 Dec 2019 08:18:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3AB1220748
	for <linux-mediatek@archiver.kernel.org>; Sun, 29 Dec 2019 08:18:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Gyumsq3u";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qsr3Kkvd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3AB1220748
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=/EzKr0xaBewjQLUzhVbeUFvrViDufzKPOT8gldO1LMg=; b=Gyumsq3um60YOSkE32zAgW1+4i
	egMkwN2lUiQqkHVmaBhdmyj7mcIHSBwdMJryqdR5vjf9w3BH8GdeF/W04MM7LwEphSDOR1PhzaxVE
	doCmpHVJXqNi92mebHYFTE7+jOS19KjjPdMeuDPnG9vonciMN3bfS5PR3VSi1NJ0NjYGr5e4L0FIz
	qvwP029JUPMsUqu6PH+4c1xu8DzNYWa4ARj3oDDw612S89N3YA0tEZ99n/tVtT8wQPmLuvMQSjv0T
	sQMMhjasgUYVt2JqA5u+t5jn4LmHomW70+LPVl/8KTmPa4TAKJC9cTFOLprORaLsHYIoyPp5thNzB
	RM0OQ1aQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ilTmD-00054F-TV; Sun, 29 Dec 2019 08:18:17 +0000
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ilTas-00011Z-2e; Sun, 29 Dec 2019 08:06:36 +0000
Received: by mail-pj1-x1044.google.com with SMTP id t101so6880934pjb.4;
 Sun, 29 Dec 2019 00:06:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=VEfrDAiEU6puBWVOShtptTtgoJrswidYAzst42qjsaY=;
 b=Qsr3Kkvd2v3PEQksW5trlFa57gOt31oanuDX8xjzJnSkDTsvRTdAhKl4OfBzNezOMv
 Ow9aPhfGSSomPOY0Jup87/Ma/c6mHDM7yC4BSoWseZ2UiyDALgLiR0tiDw3SirV4R0W/
 jBu21GGrggpBKnKRm+d/8oBUzIF4HxYHoceWxB29sW5S/XVLu25/Zhclz2mRCBIdVNOs
 u0vnDLIeftmYJaO5I+itHESPbjGZO+WpTgXO2jlMdp+LOwPs8xclGL9UWelx7pgK/huh
 z3OZuXuW43OrJnf1lVt4h6YMJIT0IcyLc3s9FkpUhkGSRoLPYRaTka6LI91scoTk4PVE
 Dmuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=VEfrDAiEU6puBWVOShtptTtgoJrswidYAzst42qjsaY=;
 b=h6cNCVPU3Ieoxf2Ob8fZpQHqLQtUYIuwMYE9/QBbod/DDWUKOXqE7ybdzOWZ6rMGWb
 fGaAJcqmgJNRW5eG8q1JJYXQPWYFPkS6cEpZsXgrn+tAnQl8AhD/CE5vYrBeraGmpPHi
 EKXYbQebeHC1SosWB4Abl7Ba0Qr7oG/M8A7jTnCkgQoxgXxd2Ng5u+Qcp9ZEnOuGe/sG
 Pd4HN6GiQze4pzN9cETuh1iWr/JodqEeOEqupcwwWE+o6EaeWDhzGcYmQuxA5bSZnFwK
 4xkRcs0wZ2NC2fZoArb8pX97LUW9Q1HZNceyowi9WoOLer4+nYrqbrRLCnvZjj4prlEo
 I2cQ==
X-Gm-Message-State: APjAAAVeUTWA9/qKV6Pg0ngc5Vb4s5nipVr8g9i3jZQ+bmYUZ4x1FEDF
 uVKIvRes/XA1IEzO9dr6zNg=
X-Google-Smtp-Source: APXvYqyJegZ4rhA8xxafUEqt+eJi/AxqJgGXb+jAX6THH+3qtTSC1H1OzKTzXAkU221EAUpiMT0Rcw==
X-Received: by 2002:a17:902:6b8a:: with SMTP id
 p10mr47058988plk.47.1577606791415; 
 Sun, 29 Dec 2019 00:06:31 -0800 (PST)
Received: from localhost ([2001:19f0:6001:12c8:5400:2ff:fe72:6403])
 by smtp.gmail.com with ESMTPSA id g9sm47637627pfm.150.2019.12.29.00.06.30
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 29 Dec 2019 00:06:31 -0800 (PST)
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
Subject: [PATCH 14/32] pwm: meson: convert to devm_platform_ioremap_resource
Date: Sun, 29 Dec 2019 08:05:52 +0000
Message-Id: <20191229080610.7597-14-tiny.windzz@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191229080610.7597-1-tiny.windzz@gmail.com>
References: <20191229080610.7597-1-tiny.windzz@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191229_000634_243579_51AA1079 
X-CRM114-Status: UNSURE (   9.31  )
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
 drivers/pwm/pwm-meson.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/pwm/pwm-meson.c b/drivers/pwm/pwm-meson.c
index 6245bbdb6e6c..62fc79092038 100644
--- a/drivers/pwm/pwm-meson.c
+++ b/drivers/pwm/pwm-meson.c
@@ -537,15 +537,13 @@ static int meson_pwm_init_channels(struct meson_pwm *meson)
 static int meson_pwm_probe(struct platform_device *pdev)
 {
 	struct meson_pwm *meson;
-	struct resource *regs;
 	int err;
 
 	meson = devm_kzalloc(&pdev->dev, sizeof(*meson), GFP_KERNEL);
 	if (!meson)
 		return -ENOMEM;
 
-	regs = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	meson->base = devm_ioremap_resource(&pdev->dev, regs);
+	meson->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(meson->base))
 		return PTR_ERR(meson->base);
 
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
