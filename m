Return-Path: <SRS0=PXBb=2F=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EC0EC43603
	for <linux-mediatek@archiver.kernel.org>; Sun, 15 Dec 2019 17:56:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0A99824679
	for <linux-mediatek@archiver.kernel.org>; Sun, 15 Dec 2019 17:56:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="u2TBitpn";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vs9JBuJN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0A99824679
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=ODyC08bNAtNWfcJyEbBrYbj+OB8qcT9U5wtZwATtKhk=; b=u2TBitpnN6cQcrgxcWP/OPK+1b
	bSDSp8AkRwJupFotiwOm7CTws6k6Ort89JhAzcF4VXXXMQ1dfNj+Ni4QmZ23qe8ozuYXVxOORj5DR
	U32fvzqI+V6w8NIYOcUcL7RD3mTK2/UjKPAV0sTYAZgxM+jFlvYFGJykPdKvgTc5OS9COyxWNh55C
	EZZGw2S1uo57H45x0/W92P4gGkd0P2N6jP6PXRlyLZxnR/0Tvtl7IKyqdllrRRDEpz+aUaTI2BKxj
	njJu9c4tKvauoe9SbD62daXWfnWRGltW+jpW2OWkK5673LYI0wcpj76S6UtFjXC/5++PXYvEJvh9x
	kgQTq/FA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1igY7V-0008Og-3S; Sun, 15 Dec 2019 17:55:53 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1igY3V-0003if-Rl; Sun, 15 Dec 2019 17:51:47 +0000
Received: by mail-pl1-x641.google.com with SMTP id x13so3450987plr.9;
 Sun, 15 Dec 2019 09:51:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=szqF6wBatd141DYcdeo2AKZKHAndczMcysoH1ninemU=;
 b=Vs9JBuJNJgoOVxp/KSDwEkQIgdPDJROFyC0pjCA6tSN96Gz2QLnZcxrIZftP/0vpOz
 1XRwerz7LUlFA7m7JVRVEYTBhus+FTcNU5oI0GcZKEu28b6bhaRGFeR4UFmyztTAIUsN
 EWfCjHjr0axlnC5vKyu64QiMI/2mzM3bxyhO/CWxAbfoWrJJ3ihzzUkhYUhagoj0nX0S
 a1nUV6UUaWC+yy6bYjA9QctSoc6BiMC3BgFRegMkY03eDkw8o8TGZ5GS+l1mos4+XpVN
 u0rn8oHp6l56e/IojaMT2NqW9UzxqLNcOxntYNN7ZPeRrgnfujsJrFOKPyS7lYMI1cyh
 eLyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=szqF6wBatd141DYcdeo2AKZKHAndczMcysoH1ninemU=;
 b=AG0sRroQfVyJjA7c2yPPQjBnxtUKQrtPUnQQWpq1styBvPN8J50XlDD18uJkc6x3ON
 /Yb+qRfTGXJeSxLzFaW+6LhGa91ok892zaVbe6i2NFtA8a1WEhgJj6TpIMArzeh3C3xM
 E54HlDYEjzeVcgjlQSPjy/RjUYS2FGtSjBkPDfAhBpzZkOGP9VoA6lYSnVERrChrhpdX
 WQSAXqg5PA2zETFj3+qmDCX87KP0zFjui0+pMD3/UpCc1HVD1rjJIJ9krTM10TODWw7q
 P9DG7tfcVy90EiU8zj6LUVFnp8XAi8IYTtbUubemRyhJKRGuvUbA43Fy2N4kmm/MPkb7
 v3Xw==
X-Gm-Message-State: APjAAAVQ/HyOWmkxPHzXJBRXI93GMGnqZXPFOBcsvpQuZLKTA5dohYes
 bLtPTwSGnv6f3rt7hca5TKA=
X-Google-Smtp-Source: APXvYqxLXCEA1K+SbpDYjjsq3TkaS0vAO6JjXHILJhQBtbuyekHgkxOcbQ0IvpAcBqayQz3nTOHFsA==
X-Received: by 2002:a17:90a:b010:: with SMTP id
 x16mr13570307pjq.130.1576432304351; 
 Sun, 15 Dec 2019 09:51:44 -0800 (PST)
Received: from localhost ([2001:19f0:6001:12c8:5400:2ff:fe72:6403])
 by smtp.gmail.com with ESMTPSA id 133sm18872446pfy.14.2019.12.15.09.51.43
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 15 Dec 2019 09:51:43 -0800 (PST)
From: Yangtao Li <tiny.windzz@gmail.com>
To: manuel.lauss@gmail.com, ulf.hansson@linaro.org, khilman@baylibre.com,
 chaotian.jing@mediatek.com, matthias.bgg@gmail.com, nico@fluxnic.net,
 adrian.hunter@intel.com, agross@kernel.org, bjorn.andersson@linaro.org,
 ben-linux@fluff.org, jh80.chung@samsung.com, vireshk@kernel.org,
 mripard@kernel.org, wens@csie.org, wsa+renesas@sang-engineering.com,
 gregkh@linuxfoundation.org, kstewart@linuxfoundation.org,
 yamada.masahiro@socionext.com, tglx@linutronix.de, allison@lohutok.net,
 yoshihiro.shimoda.uh@renesas.com, geert+renesas@glider.be,
 linus.walleij@linaro.org
Subject: [PATCH 09/13] mmc: sdhci-milbeaut: convert to
 devm_platform_ioremap_resource
Date: Sun, 15 Dec 2019 17:51:16 +0000
Message-Id: <20191215175120.3290-9-tiny.windzz@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191215175120.3290-1-tiny.windzz@gmail.com>
References: <20191215175120.3290-1-tiny.windzz@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191215_095145_995956_34AB0C05 
X-CRM114-Status: UNSURE (   9.66  )
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
Cc: Yangtao Li <tiny.windzz@gmail.com>, linux-arm-msm@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Use devm_platform_ioremap_resource() to simplify code.

Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
---
 drivers/mmc/host/sdhci-milbeaut.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/mmc/host/sdhci-milbeaut.c b/drivers/mmc/host/sdhci-milbeaut.c
index a1aa21b9ae1c..e6245b7bda21 100644
--- a/drivers/mmc/host/sdhci-milbeaut.c
+++ b/drivers/mmc/host/sdhci-milbeaut.c
@@ -242,7 +242,6 @@ static int sdhci_milbeaut_probe(struct platform_device *pdev)
 {
 	struct sdhci_host *host;
 	struct device *dev = &pdev->dev;
-	struct resource *res;
 	int irq, ret = 0;
 	struct f_sdhost_priv *priv;
 
@@ -280,8 +279,7 @@ static int sdhci_milbeaut_probe(struct platform_device *pdev)
 	host->ops = &sdhci_milbeaut_ops;
 	host->irq = irq;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	host->ioaddr = devm_ioremap_resource(&pdev->dev, res);
+	host->ioaddr = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(host->ioaddr)) {
 		ret = PTR_ERR(host->ioaddr);
 		goto err;
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
