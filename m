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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8940CC2D0C6
	for <linux-mediatek@archiver.kernel.org>; Sun, 29 Dec 2019 08:19:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5AEE420722
	for <linux-mediatek@archiver.kernel.org>; Sun, 29 Dec 2019 08:19:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="n3mIkjj6";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dFCyuXUE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5AEE420722
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=maBWObVVY7U98VTUBdEGkoGtn1kYtbRjBlK+wg/0RP0=; b=n3mIkjj6QOdMIwwfzOCGR8GWMu
	BagO6JS0od2s12PWOLlDQkJ22mviPZFSs4LhGEsIGOf0nyEffn8nWshw1cAGGNQycMrD2A0Epe0Ag
	vl5bfWr4C+v/eTOrodoAbztHnsGY+WVaQkW9qCYDcJ6CV6sagVGKQmqiElQ8/DfNRU4XeuWkFbk2u
	M3YDvyAT06Px1HjVGtwz5xsd+G4MGmzipoG2uIIbupjIAhZ5M2COj+pSF3UCv0yrgWXR+q/7UqnVG
	rmWS96uFNAOIHEx/mquChJZhgU7BzV0Q6T9YlzE5cQ5Y7a8w62dQHNSKNNPzHRg1xJ6ZIsa2esZXr
	Q/GvR1Xg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ilTnm-0006xs-KN; Sun, 29 Dec 2019 08:19:54 +0000
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ilTb3-0001Ax-4b; Sun, 29 Dec 2019 08:06:46 +0000
Received: by mail-pg1-x543.google.com with SMTP id q127so16624897pga.4;
 Sun, 29 Dec 2019 00:06:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=SoWTkdw08fKNkZI7zecO4kgB8x71qLQgBx6zKThBhe0=;
 b=dFCyuXUEKl8LsO/sXPvZkU+TvC3B0fKFaEg+Xuhq2RsKStgue7QzNd3+v2m1LIj1Q6
 GyT8nsgIoiS5paCLvOprfNHhJJf8ILKkc1PsH61+Yfw00WIDxzhdQUKm1/xl2DPGONBG
 rQGX+aJSInwpHrshCpyLqFzdlKYyCkP5ur+TESDgxTKjfpjCiHwLZsVxeB6SnhQfzXTW
 n0cB7pAoxLs+cG1rdlAMhZ0U7ZHPNS0hdpS7eppQErPMN22+CyxKdZJaG4dMb4xncATj
 ROSFyclMBn6fqhjWus5OZnzNVho2v4s+xwQhpjokIZlG4sZdW6hTJha2E/9YXEVem8Kf
 LMIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=SoWTkdw08fKNkZI7zecO4kgB8x71qLQgBx6zKThBhe0=;
 b=igbqqk6CEeiigf3Sb/AojFV0F0n/9AKCZxUAPpXF9G8OHJvWQwzlwvH3+4ApT8Wz8M
 CDxsjP4KO6rtRKbKamZbsKsRhiwfxhel7o7SpfEnb8O6eCnOsvtROFJEkUHPyBcguz2w
 Moo3LGdAIWRfCY+vEcD+VIlgeI1GoerLEMXBEdE63F4ZyBOn1WMeibsV5aQTT/N3ImBw
 9mhPZmMq9OjUf28mBX7FG59gIRvk+pX9/mFJojY5gHKF5XuDb1Ho3f85BdVSYjKPw9d/
 RLfZyyPiuQ07Td/xqCyZ8qyTuCbc7pcRDz16HK82xhowSe8jMZdG3hsCkHpF/Le7XQQI
 os4Q==
X-Gm-Message-State: APjAAAWB5KHoadN17b8e6E8dDo7OGWdAHJLdd7tkOLNJwN4zztSZ55+W
 O5OFAroKJevkVi6fxoAYoe4=
X-Google-Smtp-Source: APXvYqxFPMe29+XLuDvoRw+OYUFI9Ar/T8F4eKcB2m7F1vCONUQP69zaPfgygh+KUiIyWo1JSp3mCA==
X-Received: by 2002:a63:6507:: with SMTP id z7mr66588518pgb.322.1577606802890; 
 Sun, 29 Dec 2019 00:06:42 -0800 (PST)
Received: from localhost ([2001:19f0:6001:12c8:5400:2ff:fe72:6403])
 by smtp.gmail.com with ESMTPSA id s1sm42817428pgv.87.2019.12.29.00.06.42
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 29 Dec 2019 00:06:42 -0800 (PST)
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
Subject: [PATCH 24/32] pwm: vt8500: convert to devm_platform_ioremap_resource
Date: Sun, 29 Dec 2019 08:06:02 +0000
Message-Id: <20191229080610.7597-24-tiny.windzz@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191229080610.7597-1-tiny.windzz@gmail.com>
References: <20191229080610.7597-1-tiny.windzz@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191229_000645_319365_F284B4DA 
X-CRM114-Status: UNSURE (   9.83  )
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
 drivers/pwm/pwm-vt8500.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/pwm/pwm-vt8500.c b/drivers/pwm/pwm-vt8500.c
index 11d45e56a923..6e36851a22bb 100644
--- a/drivers/pwm/pwm-vt8500.c
+++ b/drivers/pwm/pwm-vt8500.c
@@ -193,7 +193,6 @@ MODULE_DEVICE_TABLE(of, vt8500_pwm_dt_ids);
 static int vt8500_pwm_probe(struct platform_device *pdev)
 {
 	struct vt8500_chip *chip;
-	struct resource *r;
 	struct device_node *np = pdev->dev.of_node;
 	int ret;
 
@@ -219,8 +218,7 @@ static int vt8500_pwm_probe(struct platform_device *pdev)
 		return PTR_ERR(chip->clk);
 	}
 
-	r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	chip->base = devm_ioremap_resource(&pdev->dev, r);
+	chip->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(chip->base))
 		return PTR_ERR(chip->base);
 
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
