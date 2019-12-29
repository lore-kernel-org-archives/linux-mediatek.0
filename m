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
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC95CC2D0C6
	for <linux-mediatek@archiver.kernel.org>; Sun, 29 Dec 2019 08:18:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A217620722
	for <linux-mediatek@archiver.kernel.org>; Sun, 29 Dec 2019 08:18:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HreNRZd3";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="knU0TWfN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A217620722
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=n2E0nED+WN8kmfFh/RvfEQOIq23VuspIpB+TBz/B3lY=; b=HreNRZd3BA1vQ9sDdS3Yp6vPa4
	XYlOlhmP/toBZU9Jp5UGhUbaukp0Jhs8X4lafemITBO0lnR88vF8kLnf6gj8isufcxyiN9Rt2jY24
	CBRn9PpHW/wxefNdUbidfeUCZFfu7GEp8+Pbv4iTMCxOl+A+0ZN2VnUZ2TF2gczRfbIEkHueheiJ3
	I0jyCyJwb4VzgW34SNtY233jD41Yy4Obmwk9Fj3Or7iRfzvzsqGLR+M6CHL4S3Hh8sNLElg5umtYp
	vJH60HZvDP8mTKCXdsHGH/u3h666grFjbKZtYcnfor+rXBjd113GQ8RD76w7yif3tkJa0Dron/Zp0
	Ddarb4HA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ilTmA-0004zs-R1; Sun, 29 Dec 2019 08:18:14 +0000
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ilTat-000134-M4; Sun, 29 Dec 2019 08:06:37 +0000
Received: by mail-pl1-x644.google.com with SMTP id a6so12765690plm.3;
 Sun, 29 Dec 2019 00:06:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=3FJLm6IHho2et3EaxiZvjeK2p/A2hG2XGbKwfQ5pkcI=;
 b=knU0TWfNlerRqeXVJfgPi3d6ipftwz6wCwagApjQURWF3pfFaxBu6OjFcHxBx7SrxB
 +Fzu2/vMjmjDtU5X4mP9AFRJAqqZs2dGxKIWHQZKJF3xgEj56+nFzScLvXqRCeFPr1cK
 Hd0vNqET9Ec6byhgNrg45Pt3QcZs1TSzQt54rcQ13qURFatO9zYNqqJcqgGrsB1ylYdd
 Sd0qk7Kr/2ipNksm3qTL2+IC53DMfr/ebs9RFuuro+F+/jUsU99R8ht5eyn++OewNdRq
 +ItlSNeEhECkhcopP1b2eQGKQc9gOZ7CxD8PCazMqv5ee69n7oFlviF1gQxS9vbySD96
 +o/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=3FJLm6IHho2et3EaxiZvjeK2p/A2hG2XGbKwfQ5pkcI=;
 b=Cv/rLs4LBsfty06QDcepEsS2VHM6FB0E0RAOSGql/y9mv4GqmlaAOD95pDkjChYXUj
 X+lC5jdYpgM0yrsDisfL5bK4JM1sSGE3L567WHjUzFFe14NuEP6W0+UXCX9n1Ghk4f5P
 Qw8E/4pd/JZMEhF6YvwGjUC+q4ntSafNwPZNSb6iwC/j0V35wADwGsrXmHCDVAMIrijx
 O4ofJW5X59WfPLF54+zcbuKhCxjKoWgkprF/9gJitPsEW2p76nQADovVW2m7ORuosMiJ
 /1DmxOfGt0HWYdr5TQSlufN2HwkciIghHboW+IScYMxMtkVk0w0fsm5aJsXA8Y0wjugy
 KxLw==
X-Gm-Message-State: APjAAAX6hC/W5f9uVWJQ3GXLW2mIYlkL9myr03uYKxjCrkyzufK82A2W
 LbDwLqA9Cq7fEGJywq1ncLk=
X-Google-Smtp-Source: APXvYqwFME942YugfhefjV5/NKgYnOPVb/hpAWbFUGH9q4MwS4lL8gn3kycg7FTsyyL3Sj3vd2zW8Q==
X-Received: by 2002:a17:90a:3763:: with SMTP id
 u90mr38491512pjb.107.1577606793562; 
 Sun, 29 Dec 2019 00:06:33 -0800 (PST)
Received: from localhost ([2001:19f0:6001:12c8:5400:2ff:fe72:6403])
 by smtp.gmail.com with ESMTPSA id e10sm48335950pfj.7.2019.12.29.00.06.33
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 29 Dec 2019 00:06:33 -0800 (PST)
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
Subject: [PATCH 16/32] pwm: bcm-iproc: convert to
 devm_platform_ioremap_resource
Date: Sun, 29 Dec 2019 08:05:54 +0000
Message-Id: <20191229080610.7597-16-tiny.windzz@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191229080610.7597-1-tiny.windzz@gmail.com>
References: <20191229080610.7597-1-tiny.windzz@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191229_000635_801725_5D1326FC 
X-CRM114-Status: UNSURE (   9.86  )
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
 drivers/pwm/pwm-bcm-iproc.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/pwm/pwm-bcm-iproc.c b/drivers/pwm/pwm-bcm-iproc.c
index 1f829edd8ee7..52860df7d9b7 100644
--- a/drivers/pwm/pwm-bcm-iproc.c
+++ b/drivers/pwm/pwm-bcm-iproc.c
@@ -193,7 +193,6 @@ static const struct pwm_ops iproc_pwm_ops = {
 static int iproc_pwmc_probe(struct platform_device *pdev)
 {
 	struct iproc_pwmc *ip;
-	struct resource *res;
 	unsigned int i;
 	u32 value;
 	int ret;
@@ -211,8 +210,7 @@ static int iproc_pwmc_probe(struct platform_device *pdev)
 	ip->chip.of_xlate = of_pwm_xlate_with_flags;
 	ip->chip.of_pwm_n_cells = 3;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	ip->base = devm_ioremap_resource(&pdev->dev, res);
+	ip->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(ip->base))
 		return PTR_ERR(ip->base);
 
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
