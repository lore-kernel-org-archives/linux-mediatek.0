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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B47BC43603
	for <linux-mediatek@archiver.kernel.org>; Sun, 15 Dec 2019 17:55:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 50B4E24679
	for <linux-mediatek@archiver.kernel.org>; Sun, 15 Dec 2019 17:55:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XX8ieV7B";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fBKZq3B+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 50B4E24679
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=4901Wi9WjiRrSfxO806Z1ycaua+kRNcfLpj+MKD+zDQ=; b=XX8ieV7BQgUwKN9rpEZaGL5jZk
	wKABnKJg4srfdNGXQLSKH4CtlQ643DECTgSUvvwAAXK3khmSyrHaOApMcFH86AmOIxRKITSQA6jbq
	qaig+p06gaP4RFugbxphpiW5omJsvKzygGLmgdPTpD1ETbEWwhIUVhcB75HwEXy28rogxjzG6hvoJ
	uA7sU4Jw1gfvhlRb6dlu+tEXlmx7O78tjh3h1HDApTu1KlkIMZdCMOvWb+mh+KeFogQYcsMteFqd/
	ep9YNkBC3a9FKyvyrPBfBn01w3oVlzpVeukAHA5AJaKdnoySaC9lhvK6qZLWmuPyq268Hvlw06/5U
	ONXSrF9A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1igY6f-0006YD-DK; Sun, 15 Dec 2019 17:55:01 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1igY3T-0003h7-15; Sun, 15 Dec 2019 17:51:44 +0000
Received: by mail-pf1-x442.google.com with SMTP id b19so4336600pfo.2;
 Sun, 15 Dec 2019 09:51:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=A8oziVX0OVPNw7lU9FI+EUt433jdMUM01Z2ORYeAVas=;
 b=fBKZq3B+UTdbWsi9+g8bdOFCHGpe7TR9sfAOlLy6zhHgToqYKI2okWlUO/wS9d6u+p
 QObETgFmagku6GU1FlRQNb5t/Y9dhG0vMyt6zn/KGXslbl4lHP+yyMILKeUnZCONpcFn
 nFk0ak5IMJLciJtTB9ij91nLomUhjmWlZ14uu6ohZjsqPZqXutI+9z1rnDlHxiPEPw6t
 7YZThJj7UCNgkM0r2R80yHDaLx7hfnKGgi8f/DRlmtx1GVhlgdgpoz3UYxNu9ZDMXFcK
 Yv+Xe0JZFl44GM/aIAmtJ/YQsFJ79OS2CDFVX3XxVQTVvTKoAvpv2bPHh+bVZJgQgtIs
 BI3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=A8oziVX0OVPNw7lU9FI+EUt433jdMUM01Z2ORYeAVas=;
 b=LbLnprmRqd8eW7jQT53q3jT1FVcG0UI+eMVUpo4JoUp9/oCpfiwDoriXUamaVFnHmG
 JZGM3ukPhuYboAFCPV/XEJuMtPNIKSHUwT+nRVQjWPcYbtifmMhy0dhlHlVAcxnwqVNY
 XGRgcHNqtDPGMouZSrIm0GLdtwYvlGjbfZ5dWzhPZN6lwkdvl2ZhIwm3TWB9eZiXagZ9
 PZWKRnyalSkkjeTRSR4wxfkkqBpEoFvQD1QSsrAmh3DXQy2yS9L/SoRHHsIXckFEr6o0
 nGYPPQnBDcD72y1mrCMWFFc68Nvt0Df5gm0KHWonAHtJ/r9taUWkXTZm3h8AkbKsjAHl
 gE+Q==
X-Gm-Message-State: APjAAAWBNfXye2zWlznhtQHYv9RNwTts6RkfYjFRoJG3EKGrRKe0o6Rq
 wjc+N/u7wRv7Ih28Hs5zw0g=
X-Google-Smtp-Source: APXvYqzRYb6wWnfYIhsx/jpaCv0k0FMwBhDH/4hA1EyERHMjQx3fHd7/IHnrk/B7nyDbivGMX1th5Q==
X-Received: by 2002:a63:ea4b:: with SMTP id l11mr13127641pgk.357.1576432302424; 
 Sun, 15 Dec 2019 09:51:42 -0800 (PST)
Received: from localhost ([2001:19f0:6001:12c8:5400:2ff:fe72:6403])
 by smtp.gmail.com with ESMTPSA id i4sm16309004pjd.19.2019.12.15.09.51.41
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 15 Dec 2019 09:51:42 -0800 (PST)
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
Subject: [PATCH 08/13] mmc: sdhci_am654: convert to
 devm_platform_ioremap_resource
Date: Sun, 15 Dec 2019 17:51:15 +0000
Message-Id: <20191215175120.3290-8-tiny.windzz@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191215175120.3290-1-tiny.windzz@gmail.com>
References: <20191215175120.3290-1-tiny.windzz@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191215_095143_188358_3590331A 
X-CRM114-Status: UNSURE (   9.70  )
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
 drivers/mmc/host/sdhci_am654.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/mmc/host/sdhci_am654.c b/drivers/mmc/host/sdhci_am654.c
index b8e897e31e2e..aa237f565e23 100644
--- a/drivers/mmc/host/sdhci_am654.c
+++ b/drivers/mmc/host/sdhci_am654.c
@@ -491,7 +491,6 @@ static int sdhci_am654_probe(struct platform_device *pdev)
 	struct sdhci_am654_data *sdhci_am654;
 	const struct of_device_id *match;
 	struct sdhci_host *host;
-	struct resource *res;
 	struct clk *clk_xin;
 	struct device *dev = &pdev->dev;
 	void __iomem *base;
@@ -524,8 +523,7 @@ static int sdhci_am654_probe(struct platform_device *pdev)
 		goto pm_runtime_disable;
 	}
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
-	base = devm_ioremap_resource(dev, res);
+	base = devm_platform_ioremap_resource(pdev, 1);
 	if (IS_ERR(base)) {
 		ret = PTR_ERR(base);
 		goto pm_runtime_put;
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
