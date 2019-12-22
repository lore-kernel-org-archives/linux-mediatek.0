Return-Path: <SRS0=fxQu=2M=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D63DC2D0C8
	for <linux-mediatek@archiver.kernel.org>; Sun, 22 Dec 2019 18:53:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 504C6206D3
	for <linux-mediatek@archiver.kernel.org>; Sun, 22 Dec 2019 18:53:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="p90W4deC";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZpEDu81z"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 504C6206D3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=8bzRfxgemwEoQAm0tNDV+gR81eQLkCBhJ914Bx1Gn1U=; b=p90W4deCYLoBxQs96LT/A/3J8T
	ddDG/aaetiGT5D6qV1w3WwWpDr377Xu0YBOwp7JLnHSh5OPjsO9+0LNIfqzCuosrBpQXK74EP948X
	2EQMdJFoY0d8TxrCIgrXA/aKd2Nly5RpLp/vb6SH3HoaVvjGcBFj5/MKj0Qiz561cdNxXaTHZdyBf
	dPhRfxdDEBeQEFkwSPe/vFYbITnM9YQ0w9gKKMo5M98y6Lya4uYWwhX2WrB/JGBQkEj4Ws0lQAwk7
	KklSLMTGbUFH0NA/f4C4Z5nGS6YPCsVtv63MrcAZ58UQV7uIBAbBH5vq2QrYCEACjj6aAL5vtUY5d
	JOC6V3Ug==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ij6M4-0005fn-Im; Sun, 22 Dec 2019 18:53:28 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ij6JV-0003K9-TC; Sun, 22 Dec 2019 18:50:51 +0000
Received: by mail-pf1-x441.google.com with SMTP id x185so8083806pfc.5;
 Sun, 22 Dec 2019 10:50:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=2mMsPo8M3x876TJIPv/V9kMTnJlbEepMVzpgXqdmw0I=;
 b=ZpEDu81zRHBqo3RV+PuHNZpFGIZ0wGCPWy0hCPcLUTHwoe6j+6Tx2+RBVyksDlngTK
 myaP/2Gs758aoeYWPfu+UwIVsRkdRh2WRHJJyVIsT7SjBgdU7nrLOVzdkap7wePcNF65
 51ANI8s4JJowIaPkgDAgKgcHJxo9wbPnrF7Ym5oE7or4f8qY7FDW17B4k+Dlz5gzBAsB
 4an4A++rTJeqU75iqy9JoNdAXj+vCb4XLdhvt7NKIL26hxzEjqKLOa1p5Kg3Ia1AUxMB
 Vnq+ZdjHbajAsFP/w/hTbmnry1R/ur7tTeDdaXUVtwEWnLybI/lMITQ/Ostu/yvnJ7TJ
 OGbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=2mMsPo8M3x876TJIPv/V9kMTnJlbEepMVzpgXqdmw0I=;
 b=VDHVYwm2LwbJxQ6Kza/cGEU0H5twCAZB6vL9xLXk5aq6RmFpXHRNX22JFKAvt/fE+1
 30OVaUuuqAi6yXcmkJEZ3hW8EudZSCOUxioXxE01kws2uV1a0gzD+mT6ptxNup+iFrSz
 RoEKDFfox1pgWA2ZcWjQWTD63p3O4ANFOI0Pq0yrBZMrPSJSuGana9oU8emLfL5hLNle
 jKvoVKCLGC+bV8rmB2sM2AngeDGEWkOTPZ3iTwKPoYtmZ/4wRIN5RwdB9HSgGIQQlgOS
 qOt4lTe77AcbJELG/xiI3dka20D6QTU2ZxnDLknPD2E6mEc0XdxL1NRrOiH7P+aWtiyC
 isxw==
X-Gm-Message-State: APjAAAVw8fmzMZNcnbgE9Lh3S3hVPcIQ4j8EvlIY3Dw38+ymF5FVmgtZ
 pGHYLzWMFl9FGYrnErreJyM=
X-Google-Smtp-Source: APXvYqy/rBMV+0mmOMQ2OMs4KFh2sPHwhPOhJ+NSHNisuaZbPxtgXlTivp/vRnvcVVkI8GuQChVzcg==
X-Received: by 2002:a63:f64a:: with SMTP id u10mr26539866pgj.16.1577040649079; 
 Sun, 22 Dec 2019 10:50:49 -0800 (PST)
Received: from localhost ([2001:19f0:6001:12c8:5400:2ff:fe72:6403])
 by smtp.gmail.com with ESMTPSA id a12sm18584043pga.11.2019.12.22.10.50.48
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 22 Dec 2019 10:50:48 -0800 (PST)
From: Yangtao Li <tiny.windzz@gmail.com>
To: ssantosh@kernel.org, paul@crapouillou.net, matthias.bgg@gmail.com,
 rogerq@ti.com, tony@atomide.com, lukasz.luba@arm.com, kgene@kernel.org,
 krzk@kernel.org, thierry.reding@gmail.com, jonathanh@nvidia.com,
 allison@lohutok.net, tglx@linutronix.de, yong.wu@mediatek.com,
 jroedel@suse.de, evgreen@chromium.org, rfontana@redhat.com,
 digetx@gmail.com, pdeschrijver@nvidia.com, john@phrozen.org,
 alexios.zavras@intel.com, sboyd@kernel.org, kstewart@linuxfoundation.org,
 info@metux.net, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-omap@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH 8/9] memory: mtk-smi: convert to devm_platform_ioremap_resource
Date: Sun, 22 Dec 2019 18:50:33 +0000
Message-Id: <20191222185034.4665-8-tiny.windzz@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191222185034.4665-1-tiny.windzz@gmail.com>
References: <20191222185034.4665-1-tiny.windzz@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191222_105049_978820_F43350B2 
X-CRM114-Status: GOOD (  10.72  )
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
 drivers/memory/mtk-smi.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/memory/mtk-smi.c b/drivers/memory/mtk-smi.c
index a113e811faab..1cc5d94036a2 100644
--- a/drivers/memory/mtk-smi.c
+++ b/drivers/memory/mtk-smi.c
@@ -269,7 +269,6 @@ static const struct of_device_id mtk_smi_larb_of_ids[] = {
 static int mtk_smi_larb_probe(struct platform_device *pdev)
 {
 	struct mtk_smi_larb *larb;
-	struct resource *res;
 	struct device *dev = &pdev->dev;
 	struct device_node *smi_node;
 	struct platform_device *smi_pdev;
@@ -279,8 +278,7 @@ static int mtk_smi_larb_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	larb->larb_gen = of_device_get_match_data(dev);
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	larb->base = devm_ioremap_resource(dev, res);
+	larb->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(larb->base))
 		return PTR_ERR(larb->base);
 
@@ -419,7 +417,6 @@ static int mtk_smi_common_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct mtk_smi *common;
-	struct resource *res;
 	int ret;
 
 	common = devm_kzalloc(dev, sizeof(*common), GFP_KERNEL);
@@ -453,8 +450,7 @@ static int mtk_smi_common_probe(struct platform_device *pdev)
 	 * base.
 	 */
 	if (common->plat->gen == MTK_SMI_GEN1) {
-		res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-		common->smi_ao_base = devm_ioremap_resource(dev, res);
+		common->smi_ao_base = devm_platform_ioremap_resource(pdev, 0);
 		if (IS_ERR(common->smi_ao_base))
 			return PTR_ERR(common->smi_ao_base);
 
@@ -466,8 +462,7 @@ static int mtk_smi_common_probe(struct platform_device *pdev)
 		if (ret)
 			return ret;
 	} else {
-		res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-		common->base = devm_ioremap_resource(dev, res);
+		common->base = devm_platform_ioremap_resource(pdev, 0);
 		if (IS_ERR(common->base))
 			return PTR_ERR(common->base);
 	}
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
