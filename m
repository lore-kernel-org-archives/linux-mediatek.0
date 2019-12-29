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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 307FEC2D0C6
	for <linux-mediatek@archiver.kernel.org>; Sun, 29 Dec 2019 08:20:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 062A820722
	for <linux-mediatek@archiver.kernel.org>; Sun, 29 Dec 2019 08:20:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IFzNm4jm";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cWon9UkM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 062A820722
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=t+2pzoqOg92DZrBzu//PN89xk7jZlKn265dJijtaTD4=; b=IFzNm4jmPVmy4I/OMM4RDfoi3E
	cyuNMHjOnXvYTLoWTytG3ncySAEvNQA/YAhrzSSlarQ63794MIa8jhcv5N7aJV3BTZyptZzNeoRfO
	dYYIJ9/2VDnJOg5cssloHfAdsewRNJDo9T1vcR23bd2zcpaLASicE0VxtRpInPPaSNUQkyIEe9vIR
	dMUG24R3IT3Xn0xI0B08M89Kdx1mKsmcofdcjc4Km/BExXevDLhGfg29PUpSWtCawUZrY04OcpPly
	zGZzh8v5mV9JBaD9veLUYnybWQKix8kek1nHrczPMGCIn4mHEoEM7x15HQlISbHqCtQhnxINpYNfu
	O9CcpllQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ilToB-0000Eb-6Y; Sun, 29 Dec 2019 08:20:19 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ilTb8-0001Fj-51; Sun, 29 Dec 2019 08:06:52 +0000
Received: by mail-pl1-x641.google.com with SMTP id g6so10549981plp.6;
 Sun, 29 Dec 2019 00:06:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Pl5/ypnEUmA451pFNc43UKrN7kyhgo1Ved2+kQ4+IY0=;
 b=cWon9UkMcCmmLeOLXR9B0CAkyVOBUp7OQ8MfWjO30F2+Xl1jtlZJEok57OqGinqc+i
 8KvJ9vEKlxQQXcsU4kH30zYvwdvAcS9ZWNJ8ibH7jZWt/G1am6NNRdsywq8h701cqRT5
 3yTv8jSX05LlV4dsDijXUetlUobD2j53u7o32Mp3c5LJiuuc7xVopVwFbIYKNXE5RahS
 71G/5+S/sXJHca09kq3sTPofi0XZLZSVBR1/nP9R0E75WYSe4C30bBtoxKydZg1f2bFQ
 QecEg+2Ff9ttpTxuRny4cuWo3Yua+stntPd8qR89Fs8JdTrxDudDX12CoRi4yZSMtMHL
 Va0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Pl5/ypnEUmA451pFNc43UKrN7kyhgo1Ved2+kQ4+IY0=;
 b=trVrpYVMR/MGWbtFcsECy3dWb3HB4qTmpUdMqGJvAQugxx8ZCCLLmgP1QyXRaepnl6
 kZnAo0pBqm+izTTNuV7IW72xX/5gxDN80bzFZg0/EfLQX6n6+s8vgifjX/ECRFaEz0o6
 i/3ew8LYQhWvv8KPXoB7fxvfe44PSXNBlg0ty8O3gW1oSHThMiepCvn2gZ9z8yag1HFe
 04lHI/s8e+3q1bU9SjM6x1uxOe4+asPj8f1x9rFWFrrnwN+PGMsNXn3Ae/gW9tQU+hUO
 DuEL5WzOhaq3n3QsiWcIczw33cjPc2+MAX9NX2cErb7p+qSSkrFDeMW2tufnV6RVzbCe
 dR8Q==
X-Gm-Message-State: APjAAAUlV1zJyv3Lo8vJRPuTdXFNxab1/sxDf5lc5v5xh8SrBLyJ1cC5
 cD2bSQyMBkq4hval43Quew7uMtrk/E4=
X-Google-Smtp-Source: APXvYqwRk8Zu1KG7W120dptdC4raXyTAI77dRTGemuH4wbDX11kc28Uj499JtLjOduAOgIaf5Pw1+w==
X-Received: by 2002:a17:90a:21a7:: with SMTP id
 q36mr37784222pjc.140.1577606808394; 
 Sun, 29 Dec 2019 00:06:48 -0800 (PST)
Received: from localhost ([2001:19f0:6001:12c8:5400:2ff:fe72:6403])
 by smtp.gmail.com with ESMTPSA id m6sm19962023pjv.23.2019.12.29.00.06.47
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 29 Dec 2019 00:06:47 -0800 (PST)
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
Subject: [PATCH 29/32] pwm: lpc18xx-sct: convert to
 devm_platform_ioremap_resource
Date: Sun, 29 Dec 2019 08:06:07 +0000
Message-Id: <20191229080610.7597-29-tiny.windzz@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191229080610.7597-1-tiny.windzz@gmail.com>
References: <20191229080610.7597-1-tiny.windzz@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191229_000650_292925_9C742D1A 
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
 drivers/pwm/pwm-lpc18xx-sct.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/pwm/pwm-lpc18xx-sct.c b/drivers/pwm/pwm-lpc18xx-sct.c
index 5ff11145c1a3..dc5133bec3e7 100644
--- a/drivers/pwm/pwm-lpc18xx-sct.c
+++ b/drivers/pwm/pwm-lpc18xx-sct.c
@@ -325,7 +325,6 @@ static int lpc18xx_pwm_probe(struct platform_device *pdev)
 {
 	struct lpc18xx_pwm_chip *lpc18xx_pwm;
 	struct pwm_device *pwm;
-	struct resource *res;
 	int ret, i;
 	u64 val;
 
@@ -336,8 +335,7 @@ static int lpc18xx_pwm_probe(struct platform_device *pdev)
 
 	lpc18xx_pwm->dev = &pdev->dev;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	lpc18xx_pwm->base = devm_ioremap_resource(&pdev->dev, res);
+	lpc18xx_pwm->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(lpc18xx_pwm->base))
 		return PTR_ERR(lpc18xx_pwm->base);
 
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
