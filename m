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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24759C2D0C6
	for <linux-mediatek@archiver.kernel.org>; Sun, 29 Dec 2019 08:17:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EAF7820722
	for <linux-mediatek@archiver.kernel.org>; Sun, 29 Dec 2019 08:17:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GETuyeDY";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lP3Ek33x"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EAF7820722
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=/Yi/j1iNj/Ju/CuZEuCrwuXrYRog18ezQVcT0sBGX/k=; b=GETuyeDYqfhBmzPhUk6Cmpuwz4
	LI/1gYZBnhyLKVkue3yisZGA9KGE383ugl9a5HnmN2OZFCUNzxTIj6qrgBYlW7zed/zcabJ5jQv0w
	0VrV6xOIT1z8RjWtYJ8jaaEcWHrGYAhTKPjCYSOaVYfJFWqtsHYRh6stGpMgHI+ZCsAXA95g+dwCs
	+hMRTZX/S6GieLRnyLW+eS0y7VvCTE87Z1i/Jifq5/ZoVjEvGxaqqw0oeFRlbmupEE6d7XMRBtDCo
	+GG32oerDXyrpCUKC1tFx6uozXQTR4n4wgQJrrM0kTiYOU0aEmd77jmUH+PlJvulTVzVHLSCZaEoe
	kTzKsYzQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ilTkr-0003gp-BY; Sun, 29 Dec 2019 08:16:53 +0000
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ilTap-00010p-NM; Sun, 29 Dec 2019 08:06:34 +0000
Received: by mail-pl1-x644.google.com with SMTP id s21so10760817plr.7;
 Sun, 29 Dec 2019 00:06:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=tcDW0aXcY/G/MxwpM2Ci/sP4tj8rJe2hKMdbyakIxjI=;
 b=lP3Ek33xUHHbth9me5q6mLUex5a8dg8mEKxuccWfGhU8cqf2fmgCzVh6pJqCkREdLv
 6wYlaQCiC6Typ9k3VpPn6E7s5k5FMmPfRzQPwYSyQH81f3hMDjlXels8X25fMpPzQDxv
 0BlYwydSo9J+R+tcFE1V5YApFPd3UmWDUOM/IYUfUV7frbaLlA6ANnZCy+u6eG9KQcY0
 NILqNQM8yVLHkLd95Cq4uekIt89NG7zj5jTZqLM/vfbhtX0xmNF2pUtLWWL7WU3lV/gH
 /NEHDpjcpXJbcyDCti6h/Iq99QrQpbQd5Vf0fuguebONJYSdQ99fOqu3ydK3N4POZ/7s
 6aFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=tcDW0aXcY/G/MxwpM2Ci/sP4tj8rJe2hKMdbyakIxjI=;
 b=mm0VknGPWpBRRKo89JiF24YfkPQuPELw0A6CErHplTWRbjTfnkm5+TQzu2d4zh0Q7z
 GQZruI2q3de00A2wPFiUhhTlAsYxjJts2G0Kyb2WUMFB/jB9Ps+gVrjtMigdiJtxIHTx
 TN90OW6D3fCpD/9QjIDIAR34hRKdSzGW6WO8n6X/SYd3RhTxGhKtrApnYrUG9n58rZzx
 fmMIban1AcrVkg4Ex4HWGdXv56YYDxQ2gIWWaKyl5+dVWupI59bsAvYNcKQOgVKitfuj
 bSzAf4gW7zL9y8ouXq5bjryWXShcu5z+61f42cgtH2yw/M6ZU0Eq7RCj5v2GOloN+Tu9
 NGBw==
X-Gm-Message-State: APjAAAX4+vkfHwBrHH0bVC55HXyuuv99lAlUnVb79i8wrgxtxWI7Dva2
 u6tU4Vcg9Qzo+ADbhy8R6lU=
X-Google-Smtp-Source: APXvYqwCNlBbQKUL/ySdfCHC6bpgHo4q8fuG0jQjaVQkALInNO0iEWsgrT9VDjuqiaUmhZN/qUezYA==
X-Received: by 2002:a17:90b:3011:: with SMTP id
 hg17mr37812404pjb.90.1577606790432; 
 Sun, 29 Dec 2019 00:06:30 -0800 (PST)
Received: from localhost ([2001:19f0:6001:12c8:5400:2ff:fe72:6403])
 by smtp.gmail.com with ESMTPSA id n7sm20169871pjq.8.2019.12.29.00.06.29
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 29 Dec 2019 00:06:29 -0800 (PST)
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
Subject: [PATCH 13/32] pwm: lpc32xx: convert to devm_platform_ioremap_resource
Date: Sun, 29 Dec 2019 08:05:51 +0000
Message-Id: <20191229080610.7597-13-tiny.windzz@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191229080610.7597-1-tiny.windzz@gmail.com>
References: <20191229080610.7597-1-tiny.windzz@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191229_000631_989219_D2EA2410 
X-CRM114-Status: UNSURE (   9.85  )
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
 drivers/pwm/pwm-lpc32xx.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/pwm/pwm-lpc32xx.c b/drivers/pwm/pwm-lpc32xx.c
index 710d9a207d2b..6b4090436c06 100644
--- a/drivers/pwm/pwm-lpc32xx.c
+++ b/drivers/pwm/pwm-lpc32xx.c
@@ -98,7 +98,6 @@ static const struct pwm_ops lpc32xx_pwm_ops = {
 static int lpc32xx_pwm_probe(struct platform_device *pdev)
 {
 	struct lpc32xx_pwm_chip *lpc32xx;
-	struct resource *res;
 	int ret;
 	u32 val;
 
@@ -106,8 +105,7 @@ static int lpc32xx_pwm_probe(struct platform_device *pdev)
 	if (!lpc32xx)
 		return -ENOMEM;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	lpc32xx->base = devm_ioremap_resource(&pdev->dev, res);
+	lpc32xx->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(lpc32xx->base))
 		return PTR_ERR(lpc32xx->base);
 
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
