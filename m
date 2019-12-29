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
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDE5FC2D0C6
	for <linux-mediatek@archiver.kernel.org>; Sun, 29 Dec 2019 08:14:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 904DF20718
	for <linux-mediatek@archiver.kernel.org>; Sun, 29 Dec 2019 08:14:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KHm9Fvlx";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="umiR4bpK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 904DF20718
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=bh+UyEER8ClP4zdtYJvx9+KrXMAp0l0Sr1Z7EY7NnPg=; b=KHm9FvlxTg9ASYU7pEJlOG8HHm
	la6uR7KGM/xphUyGXxgZR4tQC1fn3U0jKCmdGvVddujFKqK25pP5GEGrdgSDSo2SgBlxCJv7sGFL6
	gXbX21/VGJesQf6QZ6t8TAyUafHCM9yFDIrA9GW2lwZy/W4Frer47lAeiJfQBUp/424W0J01ANyX6
	5Fd2eTcRQwEz1LzCkya6MKGBHBxNA25/8R1N4ht/hsblrhOm6erk0CdFJk2EhIqaATYMoVR2+HHad
	Nhx1+FTtUAgcDxMKG7cR9uka8FBZT46EDv+t4HY6spxx398DTt51BPqMKjCGi9u0ZHPs9jF2xJDSO
	8reDZOhA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ilTi7-0008OR-Ge; Sun, 29 Dec 2019 08:14:03 +0000
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ilTah-0000rs-66; Sun, 29 Dec 2019 08:06:24 +0000
Received: by mail-pj1-x1043.google.com with SMTP id l35so6879221pje.3;
 Sun, 29 Dec 2019 00:06:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=kJfVG4855LhBX7Jw+HB9muJtnt8I3TC3RRe+0TTxvkY=;
 b=umiR4bpK+hFagVx6dNWyqvf2HnQxVYRc+CfETrcB5LcBwr69Xc0488XfW3mvNQeajv
 V5+uC4mZ/LETljSPKS5THFfFyESAS8zf6M1X2lnDCW4QT4CkCM1ZGloSk4CrGSjvBTnp
 jiz/7OHdTgY37G3qoHVp/zvxj3OXZFkPODp67sRLepgYxr6tWsxHFyy1+z8SZ77++Ar0
 jKe+fwWd2T4d08gwApoIv7abrDv9e0P9nBToofeg22m/XN9kaOeMe1dq8IJMMP4vho3H
 UVjOCwXyxCV5JHqac1suFyczet/TSosYz1Lpx1kuo0HbP933G9fXZF3Fb0XVZBYku5HG
 A7cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=kJfVG4855LhBX7Jw+HB9muJtnt8I3TC3RRe+0TTxvkY=;
 b=DuT25RrB5jJTyakWHVA58aPlLKVmxdlNL00jcK0vSW/IzS9cmRr4ccQbuofqol0OQQ
 OfxRq5+mMzBKtzV27j50IwnwYY2RZlyk9MkyjcrAcwXGt1bnw/s6+zo0dYTICizIYoke
 sFmdDd3VVINsYpfDQgK6IKQwSt6lsHgdpSLfGZD0GKNk/AT6LaBOBlX3653IKQHreIai
 V6EwiFnE52ayzqRhU6daejSshXJs4D674iMnF8CVk3aeKsaqzv+qKufFyL/RGiNILVLY
 zUxvk1nU/N67YXEkxGlRPwACTnhyjU2HgAKUpE4yW2FIz6LKT/ylGGj5QnSUWNJ6aNsf
 R3Fw==
X-Gm-Message-State: APjAAAUZ8dWM8qOTqbdl9tS5lLfNjN0Yp0NbJm1uRUQ5v0vVJ8uUp10o
 rQUa3yntZluLYIqDw+klklU=
X-Google-Smtp-Source: APXvYqyLokgFtS6K5K5ahwNAvTHcYw1xLsZBJ3HO5Dtzo8qyrhcyo5S3agmSaWbAPSTxojar7WTBpA==
X-Received: by 2002:a17:902:fe98:: with SMTP id
 x24mr62258889plm.155.1577606782293; 
 Sun, 29 Dec 2019 00:06:22 -0800 (PST)
Received: from localhost ([2001:19f0:6001:12c8:5400:2ff:fe72:6403])
 by smtp.gmail.com with ESMTPSA id o10sm42988345pgq.68.2019.12.29.00.06.21
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 29 Dec 2019 00:06:21 -0800 (PST)
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
Subject: [PATCH 06/32] pwm: tegra: convert to devm_platform_ioremap_resource
Date: Sun, 29 Dec 2019 08:05:44 +0000
Message-Id: <20191229080610.7597-6-tiny.windzz@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191229080610.7597-1-tiny.windzz@gmail.com>
References: <20191229080610.7597-1-tiny.windzz@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191229_000623_238416_C1FB228C 
X-CRM114-Status: UNSURE (   9.99  )
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
 drivers/pwm/pwm-tegra.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/pwm/pwm-tegra.c b/drivers/pwm/pwm-tegra.c
index aa12fb3ed92e..7f77a93eb4b5 100644
--- a/drivers/pwm/pwm-tegra.c
+++ b/drivers/pwm/pwm-tegra.c
@@ -170,7 +170,6 @@ static const struct pwm_ops tegra_pwm_ops = {
 static int tegra_pwm_probe(struct platform_device *pdev)
 {
 	struct tegra_pwm_chip *pwm;
-	struct resource *r;
 	int ret;
 
 	pwm = devm_kzalloc(&pdev->dev, sizeof(*pwm), GFP_KERNEL);
@@ -180,8 +179,7 @@ static int tegra_pwm_probe(struct platform_device *pdev)
 	pwm->soc = of_device_get_match_data(&pdev->dev);
 	pwm->dev = &pdev->dev;
 
-	r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	pwm->regs = devm_ioremap_resource(&pdev->dev, r);
+	pwm->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(pwm->regs))
 		return PTR_ERR(pwm->regs);
 
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
