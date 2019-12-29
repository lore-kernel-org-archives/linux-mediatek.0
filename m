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
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0AFAC2D0C6
	for <linux-mediatek@archiver.kernel.org>; Sun, 29 Dec 2019 08:20:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B3F6420722
	for <linux-mediatek@archiver.kernel.org>; Sun, 29 Dec 2019 08:20:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="C9qedKpm";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PKcxSuP+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B3F6420722
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=2iZzG6knKj/doOUm40mrvSNui/KFrpimlMMrDxmtCc8=; b=C9qedKpm+XN5UM2WPyozW7PbnU
	4xA1uMIvEnHn6Vk5HnEJvNQ7It4G6m2mYsqyC0ftDLYACFsC9GPTEwEBP6GfjLTHlFYlhDhrTLTCz
	ANKkQ+m72fJxu3LP2ozTZ1CuAcy7tLeUVZfz+d+ydvaSpF93frzdq5q5SGxU994vPG94bjgVzR+Nz
	AKcRvnbAn9MsfoDpDKY0ikMw7CNUwNcwx+uCx7agL1w8SndfWtdR9IcpQh5Jt8EmVGHvKBMs+cHEh
	IVDwIiIUDckcekWX1PTD9sGQg1KG5eeo6v9QasMGQnDhJ5M2AjCKxKLyNG5Iq7NqUTqiQCUmTP2AD
	21NSnJNA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ilTnq-000724-43; Sun, 29 Dec 2019 08:19:58 +0000
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ilTb5-0001CS-6g; Sun, 29 Dec 2019 08:06:48 +0000
Received: by mail-pg1-x543.google.com with SMTP id x7so16607671pgl.11;
 Sun, 29 Dec 2019 00:06:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=ubisCHSwqc2s7xWWzDTAHcgrFyxa0/se1FgLzXqSzJU=;
 b=PKcxSuP+TIR6RR+D+3utUn4UDdebt73BcNOcvFjEXOWOtUQu8RnoetjVEuy/iZFDYn
 vt/3TgUmGBbAP+K+PitpTtb8Q7MAYoNV6DAi/fLCia9ZK6l+a2JMsR0iH9zlWebHPTKF
 AdhaRsImVy430lM/LsLIRsYC80w5uy0ExwCN7Dg9FjZViWyETX4OuLWuvPBkqm4wuWJF
 uPSeSiNAL9LHX01Rcfkj3Pkb+3Lkfa559mQdT/a9Cof2zrN4XNI9n7hq4yAjws9GZG9L
 pW15SKC+iTmp0vPJclmBLQF+Ays9MUsuArhvroKiAfSUM5JvvK3yTjdJLYoOVwzQPi5A
 e2NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=ubisCHSwqc2s7xWWzDTAHcgrFyxa0/se1FgLzXqSzJU=;
 b=ZOyc3CBN3YalVkNqhNAOW5JsvbP9YV3CoEuWbu1tKBLgn0CriatJyzEc5Az0SlB93c
 H8I0knReacAbc8Ifacg9e3+a5/2DhqUFT9dbbk108xaashc2EAfwJqVAnjWoCioTi4j2
 JY4vQivbUvMOA7d+SqC49dlv/7LaNeyDpZTz1j9J/vZL9lFQ/yuzd6i2teyTPJg59gbr
 VWovspx17RSGjNT05s27vmX5qXA0SIQ4T+A7OL/prABnVDrCmBB9MkxwhST5Nr1H8hM0
 lopkxePD4gPifYY/mLkNSQ9JW9FamA6ijynPApEcu13o02JCOnsxfRbzDX2r0KO4Qztu
 4s4w==
X-Gm-Message-State: APjAAAVdbcYHydgd92kx/bDKSeVKjeqbKp7p3Lrq3poqUMHnnOsMj2lU
 nYdnmyNLb6lioLfuOLQGcdc=
X-Google-Smtp-Source: APXvYqztgO51q2M7dpEWvqnOl+OuEOll/cXfvrXPmRpn+n/ZTTV0hJfK8S/d9jsZVGZMHeU4/SfnIg==
X-Received: by 2002:a63:6787:: with SMTP id
 b129mr64849725pgc.103.1577606805089; 
 Sun, 29 Dec 2019 00:06:45 -0800 (PST)
Received: from localhost ([2001:19f0:6001:12c8:5400:2ff:fe72:6403])
 by smtp.gmail.com with ESMTPSA id r7sm47674721pfg.34.2019.12.29.00.06.44
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 29 Dec 2019 00:06:44 -0800 (PST)
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
Subject: [PATCH 26/32] pwm: mtk-disp: convert to devm_platform_ioremap_resource
Date: Sun, 29 Dec 2019 08:06:04 +0000
Message-Id: <20191229080610.7597-26-tiny.windzz@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191229080610.7597-1-tiny.windzz@gmail.com>
References: <20191229080610.7597-1-tiny.windzz@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191229_000647_328256_3DD92814 
X-CRM114-Status: UNSURE (   9.98  )
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
 drivers/pwm/pwm-mtk-disp.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/pwm/pwm-mtk-disp.c b/drivers/pwm/pwm-mtk-disp.c
index 83b8be0209b7..87c6b4bc5d43 100644
--- a/drivers/pwm/pwm-mtk-disp.c
+++ b/drivers/pwm/pwm-mtk-disp.c
@@ -172,7 +172,6 @@ static const struct pwm_ops mtk_disp_pwm_ops = {
 static int mtk_disp_pwm_probe(struct platform_device *pdev)
 {
 	struct mtk_disp_pwm *mdp;
-	struct resource *r;
 	int ret;
 
 	mdp = devm_kzalloc(&pdev->dev, sizeof(*mdp), GFP_KERNEL);
@@ -181,8 +180,7 @@ static int mtk_disp_pwm_probe(struct platform_device *pdev)
 
 	mdp->data = of_device_get_match_data(&pdev->dev);
 
-	r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	mdp->base = devm_ioremap_resource(&pdev->dev, r);
+	mdp->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(mdp->base))
 		return PTR_ERR(mdp->base);
 
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
