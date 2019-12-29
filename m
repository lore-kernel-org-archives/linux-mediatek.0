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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 135BAC3F68F
	for <linux-mediatek@archiver.kernel.org>; Sun, 29 Dec 2019 08:19:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D8D1F208E4
	for <linux-mediatek@archiver.kernel.org>; Sun, 29 Dec 2019 08:19:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Xq7olR6w";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bRiIae4r"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D8D1F208E4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=tMLieLnP08yST9j6Up3gKvBpMl7tp342c6pJO/ZXkpI=; b=Xq7olR6whQgtb1uFGto2muhWlB
	4cI2xL1rfwH2n1oPNs+bhAW4tY7TY3Zfi/NYbc1Db8II8Ex3ckd7IuYoU2vAR5iC3l7XFx41vUhSi
	KvBCTsdX3kFauaW7e9e0VP9VAVVJU4sfRL1FxyCpD/l1ICzuiy5axKnF+Saui/qtouyHo8zVtMAGk
	L9eZZ3Bn9BGD1REvNp9sxap4eOOHWc6uST1+xfC3LymXqainRu5TPhdwAO2G1nB1hLiVidfhXx7xf
	pMB1v1AIIpCi/LyTh6TF2xXeO6ZPh4HCfGqilZvm5yocqzI8WQdtByHCLy7nTZJQsQvi6bb0MJg9f
	QyeAj4Zw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ilTn7-00064z-Dc; Sun, 29 Dec 2019 08:19:13 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ilTb0-000191-M9; Sun, 29 Dec 2019 08:06:44 +0000
Received: by mail-pg1-x544.google.com with SMTP id x8so16611271pgk.8;
 Sun, 29 Dec 2019 00:06:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=QqO5VBiXqI5R/AkeosruSZfCprSjGDAM7LFQWexsUTE=;
 b=bRiIae4rFd4anfrYHa2h573t4PCyijpCdCIzqXN4J00te79dFDRkflXiaVWf9P/axv
 z+DsmrszTYuySWTdB6ULOta5nuNYsyR3uMXjYa/TrpX20GJDeDxZV9D6gFgpC5aB9jED
 elc3AbtukjTYhep55znmAuIrGhh5OuVF090UIpJaVxMb13YlyHeqcOpePr0Qxa5AGotr
 4mF1TMGUApsiYzXwC/OaIiKBB1yekSF9awgj4zKaIbT+7CGKAl7wqGu+s0RL+WlyRNlU
 bWuTj6WuXh846VITN/gmh9GRqv1SUvbd9Svau0W5uLjTjE4taI9XKDEZRS0H9L/nSooN
 ZLNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=QqO5VBiXqI5R/AkeosruSZfCprSjGDAM7LFQWexsUTE=;
 b=cpMyB6IQXYYNfcC6i/RhJPSF7bajXWmKO9EQwxrp/PtrFAB+8CfiUWE+5JDrk0YFDs
 eQJWK5IIpg7GNeX5OoxskPf6l+byweaiUB9ymGlzgBHKHWfyZo4s2aynqKlbUNCS0YKS
 QIWNll3yzVpy6qGvM+FCQGC7gNhDiCdyxOJKFi5p1voTxVwBOIFigjF0hCd5T1GHAUbB
 Vs4Fdtc+7L4osAADURdTXGAp9/3cX0q/dptc+Tt8WgUPtEay5mgPsJk10qKZSz7R6a80
 LtKYy1m7RYqebEPZyIn3qWnFNNbkX26raFMBwI4SvSXa4udxCMqofSCHMs8Q3FMpBsHz
 vPsQ==
X-Gm-Message-State: APjAAAXEg2X0T2AeLngfoXH3uMV8wZLi7siYbVKbbgKBXZA2MvsYMvuz
 e9SBGRgO+wl41MN4TBiBOvM=
X-Google-Smtp-Source: APXvYqwFZI+a++Hr3wqoZg0IjafXaKUi175/ltviuoWC/h18dtap63vpF4U0J7a3SLRMilBNfyFKcg==
X-Received: by 2002:a65:5a8f:: with SMTP id c15mr56634028pgt.259.1577606800818; 
 Sun, 29 Dec 2019 00:06:40 -0800 (PST)
Received: from localhost ([2001:19f0:6001:12c8:5400:2ff:fe72:6403])
 by smtp.gmail.com with ESMTPSA id z6sm32913761pfa.155.2019.12.29.00.06.40
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 29 Dec 2019 00:06:40 -0800 (PST)
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
Subject: [PATCH 22/32] pwm: bcm2835: convert to devm_platform_ioremap_resource
Date: Sun, 29 Dec 2019 08:06:00 +0000
Message-Id: <20191229080610.7597-22-tiny.windzz@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191229080610.7597-1-tiny.windzz@gmail.com>
References: <20191229080610.7597-1-tiny.windzz@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191229_000642_860501_11E1E317 
X-CRM114-Status: UNSURE (   9.97  )
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
 drivers/pwm/pwm-bcm2835.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/pwm/pwm-bcm2835.c b/drivers/pwm/pwm-bcm2835.c
index 91e24f01b54e..9923cd2f069e 100644
--- a/drivers/pwm/pwm-bcm2835.c
+++ b/drivers/pwm/pwm-bcm2835.c
@@ -137,7 +137,6 @@ static const struct pwm_ops bcm2835_pwm_ops = {
 static int bcm2835_pwm_probe(struct platform_device *pdev)
 {
 	struct bcm2835_pwm *pc;
-	struct resource *res;
 	int ret;
 
 	pc = devm_kzalloc(&pdev->dev, sizeof(*pc), GFP_KERNEL);
@@ -146,8 +145,7 @@ static int bcm2835_pwm_probe(struct platform_device *pdev)
 
 	pc->dev = &pdev->dev;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	pc->base = devm_ioremap_resource(&pdev->dev, res);
+	pc->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(pc->base))
 		return PTR_ERR(pc->base);
 
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
