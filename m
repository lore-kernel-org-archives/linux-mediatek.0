Return-Path: <SRS0=ZCae=DC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABD3EC4363D
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Sep 2020 06:56:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 55E9B21D91
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Sep 2020 06:56:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="O4oXDrJe";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="igrI5lat"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 55E9B21D91
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=K9g907En7E3906RFlFt4sempEmebrOT2ys39lrlCSvE=; b=O4oXDrJerEHc2BEHNH/weBLqM
	PAHCjjs5j3I1ZxQA8xtl/ghMFpZSqGRJm3cHHyO3LY1FRukmGlEOzSJh08hUF2NgJ0S1r6KKiPu9Y
	8DPjf0yOJ2Zz8qq/WujD7jLix7Rtw89wYJQP+VOyivvTGYNXmEDuFH+GPN5+1AMLi6tDk4h2q3k6J
	lORn1MnUM1YH4R2XT4DrppEyi7KK3rZ+sQxaRVJmrxvfEv5BSbU2C0YliySZ8sxrIIDuStmIQd+21
	fQRlcYOo8tn/gVD/q31gkDwkxs1QmnPJwzt1QwtyeBhbd9LfEK5hlq/UllQnJekR6BzzNLvtPj2KG
	5AfgH7gAQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kLhe5-0003wq-Sy; Fri, 25 Sep 2020 06:55:53 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLhcw-0003TW-4Q
 for linux-mediatek@lists.infradead.org; Fri, 25 Sep 2020 06:54:47 +0000
Received: by mail-pf1-x441.google.com with SMTP id l126so2253878pfd.5
 for <linux-mediatek@lists.infradead.org>; Thu, 24 Sep 2020 23:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Q1sjz1AOP3RHN+D2U3Yr0dC8Mgj3MJeltuBOhjJoHBE=;
 b=igrI5latvdPt4aE/Cq47rXBxO6po1rbw5Kx731skmFqpAxoNONI26r8BshXxGn08b5
 7rhWAUjAPpJpJmmlqioxbRerj0BO3MtHFX0r04U6ReyaNPpzPYR3EqTGYCkeWawahwEI
 y1+Eg2bUCBNsM2idfI5XtUqmHvNJFgM3c4qZA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Q1sjz1AOP3RHN+D2U3Yr0dC8Mgj3MJeltuBOhjJoHBE=;
 b=XGOxV7r4Mr3/R9SWz33CirViiOBDWAQrp194nJ81/A+EyoL/nksikdtxUa/rZ/i50Y
 UAojkM2CN03Wyvdpyo5z6IuRQSB09Sj56bzGymdODGcl+/EUyyiscfGVmg9+oPX7soCa
 iiamfFuEeCXI2mH9QHRaCCbYqzsKVWcSxor2rh1psTTIi9jKuBbdw5JTW2fM1usn21mE
 ACnaIxrXEPpausY+DxZFBphmkAD2OQe5KWoJX1l4Y+NUiJJbmzC01CyX/6FIztZnPqEW
 zYkAjJ8NQDAyR7+duJB7v/2auWPPyz5TWW+imPCTmbszJ8pSLkgB8uDAVcaPP4VRY9o9
 nHJw==
X-Gm-Message-State: AOAM531AZwP6JmGJeWfM3mSmWbjJzLCzQ63OxmRCN4Bl5Av7dYzoaxeq
 KSs6qZavGWSCZT8G579zuHFvrQ==
X-Google-Smtp-Source: ABdhPJwyB6XORjYiFS8uQ2wfeOioKyeLL0KFpbwVKrof6R1wEMQaX91jqXNpsA2X3ljJjbI6sOtfhg==
X-Received: by 2002:a62:fc06:0:b029:142:2501:397d with SMTP id
 e6-20020a62fc060000b02901422501397dmr2805467pfh.66.1601016880071; 
 Thu, 24 Sep 2020 23:54:40 -0700 (PDT)
Received: from ikjn-p920.tpe.corp.google.com
 ([2401:fa00:1:10:f693:9fff:fef4:a8fc])
 by smtp.gmail.com with ESMTPSA id x27sm1549612pfp.128.2020.09.24.23.54.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Sep 2020 23:54:39 -0700 (PDT)
From: Ikjoon Jang <ikjn@chromium.org>
To: Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 devicetree@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-mtd@lists.infradead.org
Subject: [PATCH v3 5/6] spi: spi-mtk-nor: support 36bit dma addressing
Date: Fri, 25 Sep 2020 14:54:16 +0800
Message-Id: <20200925145255.v3.5.Id1cb208392928afc7ceed4de06924243c7858cd0@changeid>
X-Mailer: git-send-email 2.28.0.681.g6f77f65b4e-goog
In-Reply-To: <20200925065418.1077472-1-ikjn@chromium.org>
References: <20200925065418.1077472-1-ikjn@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200925_025442_264352_59A70D52 
X-CRM114-Status: GOOD (  17.79  )
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
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 linux-mediatek@lists.infradead.org, Ikjoon Jang <ikjn@chromium.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This patch enables 36bit dma address support to spi-mtk-nor.
Currently this is enabled only for mt8192-nor.

Signed-off-by: Ikjoon Jang <ikjn@chromium.org>
---

(no changes since v1)

 drivers/spi/spi-mtk-nor.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi-mtk-nor.c b/drivers/spi/spi-mtk-nor.c
index 8dbafee7f431..35205635ed42 100644
--- a/drivers/spi/spi-mtk-nor.c
+++ b/drivers/spi/spi-mtk-nor.c
@@ -78,6 +78,8 @@
 #define MTK_NOR_REG_DMA_FADR		0x71c
 #define MTK_NOR_REG_DMA_DADR		0x720
 #define MTK_NOR_REG_DMA_END_DADR	0x724
+#define MTK_NOR_REG_DMA_DADR_HB		0x738
+#define MTK_NOR_REG_DMA_END_DADR_HB	0x73c
 
 /* maximum bytes of TX in PRG mode */
 #define MTK_NOR_PRG_MAX_SIZE		6
@@ -106,6 +108,7 @@ struct mtk_nor {
 	unsigned int spi_freq;
 	bool wbuf_en;
 	bool has_irq;
+	bool high_dma;
 	struct completion op_done;
 };
 
@@ -305,6 +308,11 @@ static int mtk_nor_dma_exec(struct mtk_nor *sp, u32 from, unsigned int length,
 	writel(dma_addr, sp->base + MTK_NOR_REG_DMA_DADR);
 	writel(dma_addr + length, sp->base + MTK_NOR_REG_DMA_END_DADR);
 
+	if (sp->high_dma) {
+		writel(dma_addr >> 32, sp->base + MTK_NOR_REG_DMA_DADR_HB);
+		writel((dma_addr + length) >> 32, sp->base + MTK_NOR_REG_DMA_END_DADR_HB);
+	}
+
 	if (sp->has_irq) {
 		reinit_completion(&sp->op_done);
 		mtk_nor_rmw(sp, MTK_NOR_REG_IRQ_EN, MTK_NOR_IRQ_DMA, 0);
@@ -635,7 +643,8 @@ static const struct spi_controller_mem_ops mtk_nor_mem_ops = {
 };
 
 static const struct of_device_id mtk_nor_match[] = {
-	{ .compatible = "mediatek,mt8173-nor" },
+	{ .compatible = "mediatek,mt8192-nor", .data = (void *)36 },
+	{ .compatible = "mediatek,mt8173-nor", .data = (void *)32 },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, mtk_nor_match);
@@ -647,6 +656,7 @@ static int mtk_nor_probe(struct platform_device *pdev)
 	void __iomem *base;
 	struct clk *spi_clk, *ctlr_clk;
 	int ret, irq;
+	unsigned long dma_bits;
 
 	base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(base))
@@ -660,6 +670,12 @@ static int mtk_nor_probe(struct platform_device *pdev)
 	if (IS_ERR(ctlr_clk))
 		return PTR_ERR(ctlr_clk);
 
+	dma_bits = (unsigned long)of_device_get_match_data(&pdev->dev);
+	if (dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(dma_bits))) {
+		dev_err(&pdev->dev, "failed to set dma mask(%lu)\n", dma_bits);
+		return -EINVAL;
+	}
+
 	ctlr = spi_alloc_master(&pdev->dev, sizeof(*sp));
 	if (!ctlr) {
 		dev_err(&pdev->dev, "failed to allocate spi controller\n");
-- 
2.28.0.681.g6f77f65b4e-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
