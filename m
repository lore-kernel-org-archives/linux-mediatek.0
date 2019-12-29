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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B321C2D0D1
	for <linux-mediatek@archiver.kernel.org>; Sun, 29 Dec 2019 08:07:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1247E208E4
	for <linux-mediatek@archiver.kernel.org>; Sun, 29 Dec 2019 08:07:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="U6ePAQsY";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HP8//w3m"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1247E208E4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=/DRZGo1ipblEX0jNiu2614nClBuYmVmLDb/TUJ7ZUPw=; b=U6ePAQsYhsyR4SkICWh7EZQcAA
	GIcQLAajbFmAUXV+R3dlKWRSLcqJnQO+i5//Yh3YAoiSysjExc0tn1cgecXid6x95/6Jq1gjrl2IC
	MaAbcgLzW2UjVObbVjCDQkrJYP5vqrizgMqwGuDZSld3Gw7rIohjFj+9C87dizajFk9BvQA76Dzka
	paK27xcBRhakReOMgBznb25B36HJEE9Hlj2cBcgjQ98OjLXkFW9zmg6ffakqC/1kBenvv2XAjoGZs
	KmDfNlDrSopd0ws5XI624GBBdmClXxvyhKmIDPPVPhP6wTZrGVV8uYG33qp3ohx2X7+3eXsJs+kQ+
	WGfW9qVQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ilTbo-0001ki-Mo; Sun, 29 Dec 2019 08:07:32 +0000
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ilTaa-0000mJ-FM; Sun, 29 Dec 2019 08:06:17 +0000
Received: by mail-pj1-x1041.google.com with SMTP id bg7so6881918pjb.5;
 Sun, 29 Dec 2019 00:06:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=7MOyAvsl7hLR/NAAZrg0Tl8RxNJ8Thj3NWHXJac8tOY=;
 b=HP8//w3mq738Q5i6Q/DrOq/tt/pMGuyna/50i2l4s22Wp5mSV/k2J7Lw+zUpJlKOrs
 x+XWIYzJOmeQL8ZlkFtfkeDNPjOYMJLS9zSLk96rUNqyhp9COeYjn8Bao0nb7z85XBfW
 l4aEeA/eo5p5eVD6913J6G/q+3T2K2hTIjnRZc47vG8eDe71vh5wTVJ50hB6pG3lE6Rg
 gjrRHZ1PqFZVuFh1Ut/d7YLLeNggOcsedUutRgUmvVrwJeURTw10shPjYshyoI1HfWKh
 7W0+4PPCk+U6TwrVcLh35ENDH0pdw0m6Ag11Jx51+trV1pGjZbjlMVgiQJx6l2rJeRRc
 YXmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=7MOyAvsl7hLR/NAAZrg0Tl8RxNJ8Thj3NWHXJac8tOY=;
 b=YTq4FiZo7AnFACZoeETX0Wkp306ztGJkhBSEcRvHyShh04yV/rToTMaVR8zoQuI8tQ
 ASA1QKQNGhHJ1BOn33d9mi/8Rk2bcC2cEf4LnZqxkstzvYb4D+Mwmd5shd57lChZIM7K
 2nAub6VnIbQgILeT/xKGr4rQ2nc27Q5Hc4fmza7UMDqSQq/sbg5ZoHe9FdBclT1YT7hq
 Cp6nu95xo1GfT9VMVCmFlgqhPj3l+LHCVmMzeZzDxMZZqsnrtr50kY7j3WfTGnx6xH/b
 dUldbhP8CMDqKHCqwwc38UK8uVDh3OBKQqUCVhcyFcV0+TaWDRNSWRsXkFo1/OGlZh8p
 JUXg==
X-Gm-Message-State: APjAAAUT/IB/1RqPAeAztmrbGEozAHh6ZSoifQg/4z057tiEj0gX6QWY
 70QiAmNdrXl5EkioEv3LquQ=
X-Google-Smtp-Source: APXvYqy1wTVcUu2x5AnMvZHhJ0jjpIHWbLntN+XhT5/06mRyCVTdV4J50yCposjgMKZ8TFMY1wyN4A==
X-Received: by 2002:a17:902:ff13:: with SMTP id
 f19mr7303920plj.306.1577606775718; 
 Sun, 29 Dec 2019 00:06:15 -0800 (PST)
Received: from localhost ([2001:19f0:6001:12c8:5400:2ff:fe72:6403])
 by smtp.gmail.com with ESMTPSA id r30sm45735077pfl.162.2019.12.29.00.06.15
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 29 Dec 2019 00:06:15 -0800 (PST)
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
Subject: [PATCH 02/32] pwm: fsl-ftm: convert to devm_platform_ioremap_resource
Date: Sun, 29 Dec 2019 08:05:40 +0000
Message-Id: <20191229080610.7597-2-tiny.windzz@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191229080610.7597-1-tiny.windzz@gmail.com>
References: <20191229080610.7597-1-tiny.windzz@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191229_000616_513482_A12E7B38 
X-CRM114-Status: UNSURE (   9.77  )
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
 drivers/pwm/pwm-fsl-ftm.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/pwm/pwm-fsl-ftm.c b/drivers/pwm/pwm-fsl-ftm.c
index 59272a920479..2a6801226aba 100644
--- a/drivers/pwm/pwm-fsl-ftm.c
+++ b/drivers/pwm/pwm-fsl-ftm.c
@@ -399,7 +399,6 @@ static const struct regmap_config fsl_pwm_regmap_config = {
 static int fsl_pwm_probe(struct platform_device *pdev)
 {
 	struct fsl_pwm_chip *fpc;
-	struct resource *res;
 	void __iomem *base;
 	int ret;
 
@@ -412,8 +411,7 @@ static int fsl_pwm_probe(struct platform_device *pdev)
 	fpc->soc = of_device_get_match_data(&pdev->dev);
 	fpc->chip.dev = &pdev->dev;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	base = devm_ioremap_resource(&pdev->dev, res);
+	base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(base))
 		return PTR_ERR(base);
 
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
