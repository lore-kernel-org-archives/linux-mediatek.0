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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84093C2D0CE
	for <linux-mediatek@archiver.kernel.org>; Sun, 29 Dec 2019 08:18:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 55FC320722
	for <linux-mediatek@archiver.kernel.org>; Sun, 29 Dec 2019 08:18:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tYVEcq9Z";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ghyzqYvQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 55FC320722
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=nQcv72d5pMrKKZYARp4iUZHtD3jctrChlwuwP6AXG0s=; b=tYVEcq9ZpVnPP1mvzEMimu1i3M
	iFwth22+hg9uFQcKhy7/QesOoDNdg3w4cXmDJKAy5NTNc9rBUbRZq1FNKWmvyBpdP0/0uMHjhYLeZ
	r7BSDqlTWJrLkrVk50f9xcZoFYH9uu51GYS+K3EEltgu90iXkrP0GowZGArs3nZyMgP7oTf6MsuMw
	FWQXKWFEl7cpgT2DCI8nU4n/wF6eygDSk+/uRkoe2KPwS11fxqRya4XqhP195SxS+Kcku6rGRvCvi
	vsDuQEi92ihCfO2aXi0f5PC+Zqrvm8kGe0ip1z+KWmRSyeAIkMV+TDibCvkZ7pk4J//c3/R63J/Q6
	HsZ6L17A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ilTm2-0004qj-3O; Sun, 29 Dec 2019 08:18:06 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ilTas-00012M-7w; Sun, 29 Dec 2019 08:06:36 +0000
Received: by mail-pf1-x442.google.com with SMTP id x184so16889010pfb.3;
 Sun, 29 Dec 2019 00:06:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Ct3vgdS+UwOkSQiRdRBo4SJ7PUFYHZ+yjrMr0Puh11g=;
 b=ghyzqYvQARSfUYq5JSG2z28dc1azfEBMCfJFYqJnfOIxzXImq3oKdazr/DIyiK8dQo
 3qKoSyld1xuazbHlUQFIXHN/PWNOK21FoSxERfZ8HuBT2s3Omh87MYC8coVK8TRkkpT5
 ST4X0ALU+bDl6iEESe7BXYMFvjdbhvMvEurE7m/sGTwjjiYXqjTJIw0Jgcrqeub4Dua9
 EQaaDp4fxFs+93L1xxvPI3zrtTy5FxslMYx7y3DXrD+3SiEWebHOVtWcYZ7oPMTL+4V5
 a4BJudvlLECV9hf8qbedssmCdQmoxWnT0zSzHfTshtBY1vxk0awKbs7cGMlb9eQf88OX
 F+nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Ct3vgdS+UwOkSQiRdRBo4SJ7PUFYHZ+yjrMr0Puh11g=;
 b=kd/7Cgtdwcc/1Sn/fjbCheLBQW0clhefNGuHPFvd3iiXB7EXXF/s51DBDGYIuAbvi6
 dKGPNChwPU/XWVGLGsvDfSVtWj7O/YUJB0wsRzJ7+dUe6k9nHoP4dCB2y35Itxgikiyj
 bYHZ8mNuHXwuSAZsKUr/VJQoIKQgU+yDZoU2Ec6BmLJ1bFDp7lx8f/6p+LpcdAOcNsjb
 LMOqdhj76iUGqFhG7CjgsLun0dnyIJH02v+XGJCwsv+85P51nvrdWBH2gPiPQq5yfiBl
 BPSRrfBegCQmp854FSKtiXDzZBVI6dZYW46n3EuJ8WnYajnbRh/c6NWSglcfI1cvlBYF
 7BUg==
X-Gm-Message-State: APjAAAW37OcYJ1FsHLLl/MumVuqHTLCuYaqRin2s7ede/qHQfYupFI1W
 jylgJxiYKWZ1Co2HBEebJsI=
X-Google-Smtp-Source: APXvYqzSxw9K1ScWg6hnSPiOSt1jE5L5RXiPnGdbNgCdaOrvDG2u8O/0g4Yh8BqE+c8rgkeMZLKvlQ==
X-Received: by 2002:a63:2fc4:: with SMTP id v187mr63795754pgv.55.1577606792475; 
 Sun, 29 Dec 2019 00:06:32 -0800 (PST)
Received: from localhost ([2001:19f0:6001:12c8:5400:2ff:fe72:6403])
 by smtp.gmail.com with ESMTPSA id l2sm20053079pjt.31.2019.12.29.00.06.31
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 29 Dec 2019 00:06:32 -0800 (PST)
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
Subject: [PATCH 15/32] pwm: rockchip: convert to devm_platform_ioremap_resource
Date: Sun, 29 Dec 2019 08:05:53 +0000
Message-Id: <20191229080610.7597-15-tiny.windzz@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191229080610.7597-1-tiny.windzz@gmail.com>
References: <20191229080610.7597-1-tiny.windzz@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191229_000634_343991_8C697DE7 
X-CRM114-Status: UNSURE (   9.79  )
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
 drivers/pwm/pwm-rockchip.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/pwm/pwm-rockchip.c b/drivers/pwm/pwm-rockchip.c
index 73352e6fbccb..f0549b82338d 100644
--- a/drivers/pwm/pwm-rockchip.c
+++ b/drivers/pwm/pwm-rockchip.c
@@ -292,7 +292,6 @@ static int rockchip_pwm_probe(struct platform_device *pdev)
 {
 	const struct of_device_id *id;
 	struct rockchip_pwm_chip *pc;
-	struct resource *r;
 	int ret, count;
 
 	id = of_match_device(rockchip_pwm_dt_ids, &pdev->dev);
@@ -303,8 +302,7 @@ static int rockchip_pwm_probe(struct platform_device *pdev)
 	if (!pc)
 		return -ENOMEM;
 
-	r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	pc->base = devm_ioremap_resource(&pdev->dev, r);
+	pc->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(pc->base))
 		return PTR_ERR(pc->base);
 
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
