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
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1876C2D0D1
	for <linux-mediatek@archiver.kernel.org>; Sun, 29 Dec 2019 08:18:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7121C20722
	for <linux-mediatek@archiver.kernel.org>; Sun, 29 Dec 2019 08:18:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qVitrcLs";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m0R5ZbYC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7121C20722
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=tgav4Fj4TNnRb1BqWecmADxKMriq61vG21oGL2thPa4=; b=qVitrcLsi3yShd4jY/US/4EuH8
	Tcg9Vqa/3OWueFMwW08MJt7FMeqrBT97vsrBOQLSlTLvnXNvVaWRxNac0H1DZcSvEdpJXXnL9YWeX
	YYur8ZYKcSMbslWznGQ6YrMbVZmsHrBshz3Wob4Ve0jd+hbsvFaNaBNPEnT727LWITWAehn9dnOvc
	t5xk21pTglvymeKW8s9WXj3BmKYVflbPW/RNrIpFnM4DcTKGIKy2+Wv+EYr7VgJnNJ+MxIfGK4aRw
	Wn7R4BS/PB9ntwFNaBmyH5iu6Z3sCI77qb+QygLD02M2L2nMUzcJFqAd+PbNAfaHxjZs9JjJMePEe
	3g7WpTTQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ilTmm-0005iQ-Jk; Sun, 29 Dec 2019 08:18:52 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ilTav-000145-4T; Sun, 29 Dec 2019 08:06:39 +0000
Received: by mail-pl1-x641.google.com with SMTP id c13so13506825pls.0;
 Sun, 29 Dec 2019 00:06:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=kZ3gmHLUn932Pv1n9lSS5iGXVKswSoxR5qJ685cV264=;
 b=m0R5ZbYCE1rG+sD3REAsSdJJL8DRTOORWN1u8isuPUFHT6tlqKeKggD5nojJvcFeBW
 1Qu/2GPoQHU+fY4k0k2Gk+9/uiPU+ftFNHS1jdmTSeWon3aGBQMOw97pxWDhx2JGl6oL
 cGd39h70HMWU76jCNBM15zRMxSjk3FQM93x7tBOe2+aehplSX/we2SB60+idhNEfSU6F
 bl7rDhk8OkNWeYnMwtw2nY6ektkLJzpUCXjLIBOwHJNN8SeSKjTZ/3ATuYPNrnc2Bqdd
 nLfTfEo+A2FeL+QicRgv/WBt8JOVlBSGVNNlRj7dBSK4ZMXkpUleuxvWigumpFjy3Eu6
 5knA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=kZ3gmHLUn932Pv1n9lSS5iGXVKswSoxR5qJ685cV264=;
 b=QyPq+d0fkTG8U6Q2gTJGvGlHmapDUyIVMkuAxdL3WltAwcxWz8tDu/mBYD3X9yFvho
 fXNP8D/nI7H3sjns+XHafCBG/5wgu+/G0AcoWk4P7GapM+3N6IYCScARt6grt7m7DlaE
 N+aaRCzUzRfAnwmK/tVT3flAOStqzgiRd/9Y61P6D+Fd1odao2vst6csUtuY36JqtX7u
 SPeof4eho4A3jdtYnR3Y82BaH7DzHLlh75MRQkvXtFnjO5MfNQWUr1JsqiVosGNbchTa
 l1LSPPH9bz3yXKHLNQTpGVSLaGOgUIjLwPxhcT+/+yFbhwmumOTvsujBVRMPy7+udQc+
 bOog==
X-Gm-Message-State: APjAAAWBFNJEG/KWCNqcRsnPRRI1NHRZt/b6X4iMafvwM0z8EjHsh9n2
 xk5bswy2oPRsQU3XmpaJCWY=
X-Google-Smtp-Source: APXvYqwa7GnQSwppTBhuTNZ+erZiDBVrdnZa+AqBJPOHWUFyiar+lBUxG2VdqlQ3rau3CwmRIvIfQQ==
X-Received: by 2002:a17:90a:f314:: with SMTP id
 ca20mr36411362pjb.112.1577606794577; 
 Sun, 29 Dec 2019 00:06:34 -0800 (PST)
Received: from localhost ([2001:19f0:6001:12c8:5400:2ff:fe72:6403])
 by smtp.gmail.com with ESMTPSA id c18sm22189390pfr.40.2019.12.29.00.06.34
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 29 Dec 2019 00:06:34 -0800 (PST)
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
Subject: [PATCH 17/32] pwm: samsung: convert to devm_platform_ioremap_resource
Date: Sun, 29 Dec 2019 08:05:55 +0000
Message-Id: <20191229080610.7597-17-tiny.windzz@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191229080610.7597-1-tiny.windzz@gmail.com>
References: <20191229080610.7597-1-tiny.windzz@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191229_000637_259838_CD7A6088 
X-CRM114-Status: UNSURE (   9.69  )
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
 drivers/pwm/pwm-samsung.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/pwm/pwm-samsung.c b/drivers/pwm/pwm-samsung.c
index 87a886f7dc2f..645d0066ff0a 100644
--- a/drivers/pwm/pwm-samsung.c
+++ b/drivers/pwm/pwm-samsung.c
@@ -510,7 +510,6 @@ static int pwm_samsung_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct samsung_pwm_chip *chip;
-	struct resource *res;
 	unsigned int chan;
 	int ret;
 
@@ -541,8 +540,7 @@ static int pwm_samsung_probe(struct platform_device *pdev)
 							sizeof(chip->variant));
 	}
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	chip->base = devm_ioremap_resource(&pdev->dev, res);
+	chip->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(chip->base))
 		return PTR_ERR(chip->base);
 
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
