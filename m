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
	by smtp.lore.kernel.org (Postfix) with ESMTP id C48A3C2D0C6
	for <linux-mediatek@archiver.kernel.org>; Sun, 29 Dec 2019 08:17:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9B3D020748
	for <linux-mediatek@archiver.kernel.org>; Sun, 29 Dec 2019 08:17:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EEhN6TH/";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BxA3Ez5Y"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9B3D020748
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=UV5FLBCWnNAdVtDBVbARLWm4hpJ7ehNDQ/P2yWI0SKI=; b=EEhN6TH///lOn0bU4WJOjX21JF
	woqlp0RkkVVmm5F39fzou20NKMCG5dNB7pnyMeFtS4iU0zrz+DaeFKWx6I1/LKA+faNYYpbBWTQa5
	m86qg5wPQFRq2bajJxcwxhHWHuh1sR5P1wdsbHqesPCVMDsI15OSmezIK493NobNC+cGmQjAnSPK0
	TTxpZ6wXidjTTfTYh/AdlQymcl2QIVp+QweBfM1TwG3iGiFK7j7lNPehODnG1S4aGzDMYgS8MIfAu
	Q7i/EKpByVpv0Lzp4Rzp5YeT0DHCO1rfvEmA+DVSDf4FhlwIHUdB7/mbYgQhPB1BwXGXdiOam3/Fe
	BZKpZxOQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ilTl0-0003pL-As; Sun, 29 Dec 2019 08:17:02 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ilTan-0000z5-SA; Sun, 29 Dec 2019 08:06:31 +0000
Received: by mail-pg1-x541.google.com with SMTP id r11so16639375pgf.1;
 Sun, 29 Dec 2019 00:06:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=JOrbhl6IL9Xtkt4/H1upFbUIrsfJCt9ywKKgbdx1WNA=;
 b=BxA3Ez5YIasVGvi3UGfkdAUd//NlNCFLqRQVB2ADrdQ6RDYwTGf63G6m1UEUOfCyy1
 aU5A65CSSNzUUgglcwAt0sHmc8zFkJbfszp9ozgsNJBGQ7XH3kFbdFsx4lTz4Wd9i37D
 3a7WSxYIhW0PPXWwiZjUsnZYPIB8Kgghe7GhR3IEufB4lfv5UkDoGiiE0QaI7DrA3Uef
 twewN+wG5QU9mPjQSBOj11zMOnUM6QEpOHXInLeLuyhVRr9wSinry/1czxgiqQSwRfLn
 yYgGZshaAjsHfEkWDjd1gjIHLiG+WYAIYWTRPylCeWKygsHab6d9E2QmsRe4j9Ja48YX
 HHqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=JOrbhl6IL9Xtkt4/H1upFbUIrsfJCt9ywKKgbdx1WNA=;
 b=R0VE8adZakWUcekGsn2d1A7B5AOK++H2vU6FIGce1m7d2LkCg8UUKiGrTKSUvd/SgJ
 gmfBG74OsekLFAh7ERZ5hL8OCiyafio2tTDXlqv8E0yjBGUVT0SjTSFRnRJCZU2Iku2y
 jL4fXngRCy+QrQG5Ydp6wkKiP47p9lDVLyooAMojRQRCBk8nCEXaNweRCnAJZISU8s9G
 Cbj3pLcPgxRLibtBRYjW3y7LpcqBuDXxu/JUG9NymUEj5V2Y53sj+LiTwgQgCyYGiK0m
 2fKUS3Fpz2qvVHPsU7gL3dRl4bHtQsda5K+/T+BrkDx7e/yKA0azd+tepp9g9ZpJLhul
 i2hQ==
X-Gm-Message-State: APjAAAWt7FhLjcHh1QXUEQsxniH2TSdjw/l4Y++Eppus/n+XGIh3ZYWd
 wd75FqvXUQiuPgiIn3VD9uM=
X-Google-Smtp-Source: APXvYqydhPEDBMxSQE0/HZ63X75/QdJ5GVtnhDA3lmRMQohFFvjGMaMMOQSxxNsnPfc3KGxBTNkC7g==
X-Received: by 2002:a63:1756:: with SMTP id 22mr65995274pgx.109.1577606788653; 
 Sun, 29 Dec 2019 00:06:28 -0800 (PST)
Received: from localhost ([2001:19f0:6001:12c8:5400:2ff:fe72:6403])
 by smtp.gmail.com with ESMTPSA id j14sm42485645pgs.57.2019.12.29.00.06.28
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 29 Dec 2019 00:06:28 -0800 (PST)
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
Subject: [PATCH 12/32] pwm: bcm-kona: convert to devm_platform_ioremap_resource
Date: Sun, 29 Dec 2019 08:05:50 +0000
Message-Id: <20191229080610.7597-12-tiny.windzz@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191229080610.7597-1-tiny.windzz@gmail.com>
References: <20191229080610.7597-1-tiny.windzz@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191229_000629_967787_71AABD73 
X-CRM114-Status: GOOD (  10.21  )
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
 drivers/pwm/pwm-bcm-kona.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/pwm/pwm-bcm-kona.c b/drivers/pwm/pwm-bcm-kona.c
index 81da91df2529..aa451987733b 100644
--- a/drivers/pwm/pwm-bcm-kona.c
+++ b/drivers/pwm/pwm-bcm-kona.c
@@ -259,7 +259,6 @@ static const struct pwm_ops kona_pwm_ops = {
 static int kona_pwmc_probe(struct platform_device *pdev)
 {
 	struct kona_pwmc *kp;
-	struct resource *res;
 	unsigned int chan;
 	unsigned int value = 0;
 	int ret = 0;
@@ -277,8 +276,7 @@ static int kona_pwmc_probe(struct platform_device *pdev)
 	kp->chip.of_xlate = of_pwm_xlate_with_flags;
 	kp->chip.of_pwm_n_cells = 3;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	kp->base = devm_ioremap_resource(&pdev->dev, res);
+	kp->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(kp->base))
 		return PTR_ERR(kp->base);
 
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
