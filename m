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
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2B6FC2D0D1
	for <linux-mediatek@archiver.kernel.org>; Sun, 29 Dec 2019 08:18:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8203E20722
	for <linux-mediatek@archiver.kernel.org>; Sun, 29 Dec 2019 08:18:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UL9gqEYt";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="t5ALQLYK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8203E20722
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=lmX1ptqS7jDKJsmAHcXFnes8Q/6/4EpENjbLE/7bO/k=; b=UL9gqEYtrd2fErH4ujOo0hEBoj
	P54HJpUK5z2xjRlFjAB7WuS1X0VmKJ3CTXcpTr47TR9o4K0GRqqjmN6WFzhjOTdX+LpUBUVnCHlIm
	rXU93R0iMKC6pFE8diV6KlGkHEM3uypFlEOFo36d+jGYzPCiyXohC8ATvMSpoCEr4KuvRXQ4n6qvF
	5UwpGaeI7tPdJCWBFIkPyXOyLqhZtWEf8hB7zlh+NfYRYx1kCVpoRF8IqCocTsgZoG44jVI4YJo3J
	8+5jBt7tI18x9nYfJ3NDBFRFtPR95PU0WbKffAyB1dPunIOy1pgZmkyRSUWdhQUBcb1N2J/j+ulo6
	m/nEjI4g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ilTmK-0005Dg-1m; Sun, 29 Dec 2019 08:18:24 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ilTav-00015A-WB; Sun, 29 Dec 2019 08:06:40 +0000
Received: by mail-pf1-x443.google.com with SMTP id x185so16883319pfc.5;
 Sun, 29 Dec 2019 00:06:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=svnvAUsqbEkFIoMGUER3OWtLIkClDeqzObpr+AXdZkw=;
 b=t5ALQLYK9lE9EF3GpK75tsx7VA2i2BuOPjCLKDo5sSqg3YRHpO7DWBok2eiPKH6Zsk
 F+4ncCiS70Pt5DR9KMI0QU6VZBnbwwi54ooU6QkGvSSaxpX+mqIbp8bHsLQX3uO1pv0X
 OkADBds8TVGjQwtYTls5YZYAaoeItIYmXN6CCE3t5G5fzBfNxf0nS/2zdluXKGdlPK6j
 Bdq+W9BMNPDJUElctI6Djq4w6tylgT0rlMuDv1+5QKJ6+GZufn33f3/0Iwo0fpr91o9c
 TTv9uClGVSbigvShKuRQMEvORpLdA6AB3Z6pDDh7u7vttBTxVgOK07T8IyGMQqWlDtpx
 +wjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=svnvAUsqbEkFIoMGUER3OWtLIkClDeqzObpr+AXdZkw=;
 b=DUORA5AKIR+b0XQlr2Hh5us52QtF9SX3KwVGFffFTai0GAlqrPulLHfCukZ99gUv2G
 f1+A5I8iyb6W2jlm3zGBADxNbMqCnOuI7cysx36M5DAgBV9egr4KXSk4wR8/16VIoxet
 oK42ZLSWeEzVPedDBnyncNNGOTNjK6/mYMIWhywdWUUEbSNEW2xPbitXVntQXgdG525i
 IrkdD/Fsrif2RbGm7yuIqEU85jrxVtJj+NAxtXZrr2COvX/WcqKr/esSn81o1do1KSGn
 JNoBYFYqGYgFjWb5iwqSSh/dS/+MymyEk1g7IrFKasq0cRx2GoJ2+vV0RUceks67HtgR
 oufQ==
X-Gm-Message-State: APjAAAVCnzr9UTIgjxbv5yIA0BNcDqcbmEGzkjxooEFl1TtOysWSiUq6
 51Vw33JhN8IvsMPcLk3aarI=
X-Google-Smtp-Source: APXvYqzgqbn3DN4K9PetwsZFudgp9eD/v8wQEKuWIqkJk6/RoGS49GaXiPsLXIZoq9tCD6gTE1NeEA==
X-Received: by 2002:a62:1a09:: with SMTP id a9mr64684599pfa.64.1577606795644; 
 Sun, 29 Dec 2019 00:06:35 -0800 (PST)
Received: from localhost ([2001:19f0:6001:12c8:5400:2ff:fe72:6403])
 by smtp.gmail.com with ESMTPSA id h12sm31640473pfo.12.2019.12.29.00.06.35
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 29 Dec 2019 00:06:35 -0800 (PST)
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
Subject: [PATCH 18/32] pwm: tiehrpwm: convert to devm_platform_ioremap_resource
Date: Sun, 29 Dec 2019 08:05:56 +0000
Message-Id: <20191229080610.7597-18-tiny.windzz@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191229080610.7597-1-tiny.windzz@gmail.com>
References: <20191229080610.7597-1-tiny.windzz@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191229_000638_191293_1C35D78B 
X-CRM114-Status: UNSURE (   9.63  )
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
 drivers/pwm/pwm-tiehrpwm.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/pwm/pwm-tiehrpwm.c b/drivers/pwm/pwm-tiehrpwm.c
index 7b4c770ce9d6..3a1313caa5fe 100644
--- a/drivers/pwm/pwm-tiehrpwm.c
+++ b/drivers/pwm/pwm-tiehrpwm.c
@@ -421,7 +421,6 @@ static int ehrpwm_pwm_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
 	struct ehrpwm_pwm_chip *pc;
-	struct resource *r;
 	struct clk *clk;
 	int ret;
 
@@ -455,8 +454,7 @@ static int ehrpwm_pwm_probe(struct platform_device *pdev)
 	pc->chip.base = -1;
 	pc->chip.npwm = NUM_PWM_CHANNEL;
 
-	r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	pc->mmio_base = devm_ioremap_resource(&pdev->dev, r);
+	pc->mmio_base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(pc->mmio_base))
 		return PTR_ERR(pc->mmio_base);
 
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
