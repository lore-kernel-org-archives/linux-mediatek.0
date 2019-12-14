Return-Path: <SRS0=Zwng=2E=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEDDAC43603
	for <linux-mediatek@archiver.kernel.org>; Sat, 14 Dec 2019 17:57:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 84C4D214D8
	for <linux-mediatek@archiver.kernel.org>; Sat, 14 Dec 2019 17:57:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dV/AzIa6";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OCcdjtzd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 84C4D214D8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=FD/oyaq30wybYGEf5vsianFKTKKlWxpc3ve7kBl1xdc=; b=dV/AzIa6So9VlwQ6gXmyRX9zrA
	tqArHtZZTOGF3Jf96lEVwKJn7nf/ILyMdtqCpabw+94gDL7BBR1OnQLjxO1YvgO+cQcCENYnlBLHM
	fxIgRkdavwvii3h4VttUkNemxAKOfvtLytjNmJw70vvmbwbUJJHsjT2bAwxZH6a4say1uefJuKMbq
	5JeDweV7tkNLP519r+MzYoyFK/uAPCrvnApyYjUdJAPQXbWXhzFwE/PEDq6dsiUrfcJJ7iz1JWemB
	ICCNb1W/sEZIQ8ynp4LBxTYDdc2lVHMa+/lpZ08a+VHDuNKo6DRO+/yxXMW1ce6oP5W1bqcqOnpvO
	YV/zhgdg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1igBfV-0006q2-4v; Sat, 14 Dec 2019 17:57:29 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1igBdB-0003iX-Gq; Sat, 14 Dec 2019 17:55:07 +0000
Received: by mail-pg1-x544.google.com with SMTP id k25so1183682pgt.7;
 Sat, 14 Dec 2019 09:55:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=v6oAG/oclrFZaQCUj3wJrPoJgy8LLnv+ppI5zjGSg18=;
 b=OCcdjtzdFuDyzNdFRzdJGEK76qLV1wGwcTnhFwUzPrNIPhZ9jWkNZij8M6nrd2EqfQ
 xLdaVpLufWVdsT/JQCTm7lDYNoW5zbwtCZ3JNDX9PBDxZEeDrr4LM94ONhsxXiBoRYSD
 vwMSJnvm2XuH/yOd7dnU9xcj13rrYnxkxAdEB0sheLW1J/ap+GQdqZDSfv7y/fC3AO05
 q8jxfaZssVfvuKTZ5klKz3YaPLhO9FNqhKBHW9Zj8q9hcdEPxDNLOD88YHAJFHlAKzH3
 RmKZEcild3g8BPyIPHduEF8bqveRyYY24EdZfRKUZ+xRhqr4Sbmhg7f/o/Tu/c95uI1S
 whoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=v6oAG/oclrFZaQCUj3wJrPoJgy8LLnv+ppI5zjGSg18=;
 b=qq1IHkRwQYS6wsJKvsGu9MPXayg+t4Jso9xueFVyB1at/GxKLshZSpnGHqrd7AaZWD
 dl3KEHPLubOuE25c9G4opnKAFd8Q1lbTCTEfEqhN3ybJh0Ent4RqMxc/3ZExYxY+oABJ
 vI/q9rHQowq1lCzouN7UoT38wd+vtIKg2GOWsBLyE4AlFIhAAyvy7yEZzoy8GsIVrmPR
 RIzeVUKFqCiEt7s4dhQPfKosvDhabnphd4ekO9Trwmb29iuE37L9F2+hLA8Qsesd5o1A
 7L2D+HQJRrn09tXXQRnFePo91jBuxrTXpU7PZqpmuHsKE4CdgkTtY1OxbXErKIW9U5YW
 Z1bg==
X-Gm-Message-State: APjAAAUeKXHA5enNmmXd0wTm/h2kwYH7LeF9IRZUFgwvu3yz8af49MOZ
 vWWw2o66FB5by2nee7pDcoY=
X-Google-Smtp-Source: APXvYqzpEedmt61YxQUSdB6sRDA3ehIRbG8Z9JBjQgmUFXEG8lTrpXVy3xxhvrG+pkjNaW8TwDq1eA==
X-Received: by 2002:a63:4f5c:: with SMTP id p28mr6565754pgl.409.1576346104392; 
 Sat, 14 Dec 2019 09:55:04 -0800 (PST)
Received: from localhost ([2001:19f0:6001:12c8:5400:2ff:fe72:6403])
 by smtp.gmail.com with ESMTPSA id b22sm16045885pfd.63.2019.12.14.09.55.03
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 14 Dec 2019 09:55:03 -0800 (PST)
From: Yangtao Li <tiny.windzz@gmail.com>
To: khilman@baylibre.com, leoyang.li@nxp.com, khalasa@piap.pl,
 john@phrozen.org, matthias.bgg@gmail.com, agross@kernel.org,
 bjorn.andersson@linaro.org, kgene@kernel.org, krzk@kernel.org,
 mripard@kernel.org, wens@csie.org, ssantosh@kernel.org, jun.nie@linaro.org,
 shawnguo@kernel.org
Subject: [PATCH 05/10] soc: fsl: convert to devm_platform_ioremap_resource
Date: Sat, 14 Dec 2019 17:54:42 +0000
Message-Id: <20191214175447.25482-5-tiny.windzz@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191214175447.25482-1-tiny.windzz@gmail.com>
References: <20191214175447.25482-1-tiny.windzz@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191214_095505_956582_1BA5CAD6 
X-CRM114-Status: GOOD (  10.77  )
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
Cc: linux-samsung-soc@vger.kernel.org, Yangtao Li <tiny.windzz@gmail.com>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Use devm_platform_ioremap_resource() to simplify code.

Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
---
 drivers/soc/fsl/guts.c | 4 +---
 drivers/soc/fsl/rcpm.c | 7 +------
 2 files changed, 2 insertions(+), 9 deletions(-)

diff --git a/drivers/soc/fsl/guts.c b/drivers/soc/fsl/guts.c
index 34810f9bb2ee..ebec06a22ab4 100644
--- a/drivers/soc/fsl/guts.c
+++ b/drivers/soc/fsl/guts.c
@@ -140,7 +140,6 @@ static int fsl_guts_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
 	struct device *dev = &pdev->dev;
-	struct resource *res;
 	const struct fsl_soc_die_attr *soc_die;
 	const char *machine;
 	u32 svr;
@@ -152,8 +151,7 @@ static int fsl_guts_probe(struct platform_device *pdev)
 
 	guts->little_endian = of_property_read_bool(np, "little-endian");
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	guts->regs = devm_ioremap_resource(dev, res);
+	guts->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(guts->regs))
 		return PTR_ERR(guts->regs);
 
diff --git a/drivers/soc/fsl/rcpm.c b/drivers/soc/fsl/rcpm.c
index a093dbe6d2cb..322fde95974b 100644
--- a/drivers/soc/fsl/rcpm.c
+++ b/drivers/soc/fsl/rcpm.c
@@ -102,7 +102,6 @@ static const struct dev_pm_ops rcpm_pm_ops = {
 static int rcpm_probe(struct platform_device *pdev)
 {
 	struct device	*dev = &pdev->dev;
-	struct resource *r;
 	struct rcpm	*rcpm;
 	int ret;
 
@@ -110,11 +109,7 @@ static int rcpm_probe(struct platform_device *pdev)
 	if (!rcpm)
 		return -ENOMEM;
 
-	r = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!r)
-		return -ENODEV;
-
-	rcpm->ippdexpcr_base = devm_ioremap_resource(&pdev->dev, r);
+	rcpm->ippdexpcr_base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(rcpm->ippdexpcr_base)) {
 		ret =  PTR_ERR(rcpm->ippdexpcr_base);
 		return ret;
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
