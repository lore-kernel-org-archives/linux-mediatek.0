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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62606C2D0C6
	for <linux-mediatek@archiver.kernel.org>; Sun, 29 Dec 2019 08:07:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3115E20748
	for <linux-mediatek@archiver.kernel.org>; Sun, 29 Dec 2019 08:07:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UKOh1RPo";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JG6H1yvX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3115E20748
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=m6Zw2KLVsG6UE7M3+BZQz9HSc67FEdsmS43uo3IzaMo=; b=UKO
	h1RPoAsTWlphLezsyhyP6y0fMJ5t4WpK1JKbInH/zMu9R+VI1h3sJjdkLMo6O2RSxu7W/9HDAt/rW
	YXBnya+9x4HQ3AJwl2hKQaRrfwShtUUHuszG85urVqiNoXnj4FkUOcWYqYewgPce7MWiXTSdvhRVq
	ktDYTbmqdLeWcgAxq9LvMpZqV01y76W4dK0EX9WPxrEQYvZkq+E0TFg/N2Ve8GjucbhUJj+IL9Xsq
	49zsPH/ZWpiUiZLGkj4UGErgc0n7yrtJtcloDxAMxAcB3X53TPn3ioItuxs+mBI1DUPsJEqj3gsup
	oa1dMv3nhVG/cFjEdXtZEhWAf2VBRQw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ilTbe-0001bj-4P; Sun, 29 Dec 2019 08:07:22 +0000
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ilTaZ-0000m7-Oy; Sun, 29 Dec 2019 08:06:17 +0000
Received: by mail-pj1-x1042.google.com with SMTP id t101so6880795pjb.4;
 Sun, 29 Dec 2019 00:06:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=+3pBLd50yZ31QGDnQXQDHmLfpHXmqi0l43iIkO1V9Fk=;
 b=JG6H1yvXtza6zd1BLy2dsQbEIHwG3IcGFnYTmJb+HGx740diEoe5JAn+t24q8VoSuV
 5fbcviVM5CcY0TyjCuQXa6qCbooh7tfB+LrHt3/Ug6YFtCT5k5V2gwou5opqsGC6PwHc
 eurPwx50PDqmxEW1q+ynKJ0KnCQeyzQX7xW2SvY2itaOb+xiBEMYtX6IObjqWLKo9teF
 Q8zj04fwbhQU/UpdXgs6LRdOgn+M5RnZG84uXVM3HPgc9uiEjx0BMuG3GLmG4PD1Qm+A
 hyzMraA1AY+YuWSnreOvwjqLS2dumP9P/mjJBIQS5Ru3J260j9Ci2chSfkQQqO0ydswt
 R3SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=+3pBLd50yZ31QGDnQXQDHmLfpHXmqi0l43iIkO1V9Fk=;
 b=inmZwBahr4mNTuG+Zlk52De+YFn4n7zSVAqf4BkR5O1PKeXnMdiJahSGFClBmkmB+H
 9o/vVo+wU66tUto+FK2pupmiQTGkfztlqJ+ohzXWd+0tIs6Ye1yz2Rcq4UYvDpBFRQ/6
 dwoDZc3nhKXE+q+k6LO7rsJBCVcVmfEyCNgt+ENkC4tsV1p7OoEDnceWHAmIQW3e8euU
 rDD2VIQSTQHFxiEzCT4jCySoG8c4NglGREKutnRF/XXxlwYV29jcRQdpvb0CzsRG8vm0
 sMnNvbSNknyW5VgD90wx2F/aGH20oaMRyfxnJgDe/Kx25wLJK7BJzyc3ae26lGOYzMzM
 stxA==
X-Gm-Message-State: APjAAAU3A+AJhvTj4BD3QHpQ0w8vHnOEyjvHiN/S0lmxrMCar8lQF0P1
 Vbk55cp1e+UVIW/0R1Iblgk=
X-Google-Smtp-Source: APXvYqxnI5XBWy+NXM/GB41OB70ppiFg3j0a/LZfYu0PTXzqYRRbkm4zUSrtO9fzojgrIm7DOwlwvw==
X-Received: by 2002:a17:902:7296:: with SMTP id
 d22mr64069643pll.55.1577606774630; 
 Sun, 29 Dec 2019 00:06:14 -0800 (PST)
Received: from localhost ([2001:19f0:6001:12c8:5400:2ff:fe72:6403])
 by smtp.gmail.com with ESMTPSA id f127sm48271863pfa.112.2019.12.29.00.06.13
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 29 Dec 2019 00:06:13 -0800 (PST)
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
Subject: [PATCH 01/32] pwm: sun4i: convert to devm_platform_ioremap_resource
Date: Sun, 29 Dec 2019 08:05:39 +0000
Message-Id: <20191229080610.7597-1-tiny.windzz@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191229_000615_836436_63091427 
X-CRM114-Status: UNSURE (   8.30  )
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
 drivers/pwm/pwm-sun4i.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/pwm/pwm-sun4i.c b/drivers/pwm/pwm-sun4i.c
index 581d23287333..f2afd312f77c 100644
--- a/drivers/pwm/pwm-sun4i.c
+++ b/drivers/pwm/pwm-sun4i.c
@@ -344,7 +344,6 @@ MODULE_DEVICE_TABLE(of, sun4i_pwm_dt_ids);
 static int sun4i_pwm_probe(struct platform_device *pdev)
 {
 	struct sun4i_pwm_chip *pwm;
-	struct resource *res;
 	int ret;
 
 	pwm = devm_kzalloc(&pdev->dev, sizeof(*pwm), GFP_KERNEL);
@@ -355,8 +354,7 @@ static int sun4i_pwm_probe(struct platform_device *pdev)
 	if (!pwm->data)
 		return -ENODEV;
 
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
