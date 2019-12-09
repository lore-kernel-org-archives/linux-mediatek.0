Return-Path: <SRS0=SGDP=Z7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86F99C47409
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Dec 2019 19:58:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 53FA520836
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Dec 2019 19:58:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DFWCH5zp";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fTOm1kOh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 53FA520836
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=dWYBemHJdHM2XuFEhM73D71G46xoRgK3Fw/MYR/h0qA=; b=DFWCH5zpbQTeZNwGVWw3G1HBLR
	y33tkDjksCVd1xJiDCUo+kifnuvExsDEBn+24g/5s5S10eJi5bzt1fV0ENsm1I5TfHGC8+2Eiz7X3
	7y7WMSBtJJzyPHL78E1mlxCUmiBViy1Db17TWQVWD0ImDsixffU35yITdVRg2jr87mQJ39hDXeIvS
	tgrJ7QfJn6s9+nqDH78fD7ly1cCzSicwJaUZT3MSI9fJDAGN4B19nYUcY1X2T2OZzcpyjBPjogZdz
	iGjxNhs9WgWrIQCKWOlU5Zfk7EHNiLLKzKEm8qEph+AhQuQ1qmv92psyc5H77GzUBV6FWrhfV+MUc
	RF2hE6FQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iePAg-0001jb-JC; Mon, 09 Dec 2019 19:58:18 +0000
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iePAU-0001VR-Ig; Mon, 09 Dec 2019 19:58:08 +0000
Received: by mail-pl1-x644.google.com with SMTP id s10so6245285plp.2;
 Mon, 09 Dec 2019 11:58:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=oFak+0J7ythKfPAlMM6BlHsXOZpfWhjFtYhFdd8JGAU=;
 b=fTOm1kOhKLvzJHC0AAqUb2/p0TvDJgwfmvnY3lHowW7c+48yFQB6XDVPnKvWLsFxoJ
 8+qJLxmjP0fWQPJFjWjrzeKdmr7HCcvUPvupXLrSiUy+v9Xm/2K0P4PcQJxly8qcGPCT
 BZANJxsD9diLPPIp8TWbnOz5lnrhf195tMiXAMYWOceS/lA0pRyYJPDmU/jaMZth8IfN
 JqAS64c3uyTNUvVI4njUfbds4hdw1XR9X31FhizZGxy80cDDrI5aZ8b0q895feKvjQ+B
 Ic5kPESbJnMbBdfonlBK5KqGSgrPk5e5jgkhxoFwB5eQGA5OUimVoap56TL4+5rhG0lU
 jDuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=oFak+0J7ythKfPAlMM6BlHsXOZpfWhjFtYhFdd8JGAU=;
 b=S5XPr5DRw58jbJ12opS9FfXBGNmk1bCIDDrahBHrtKFGASJQr5fs3Ab8UWz4GbhoJM
 vtno93xuYq9KYgjS6grHvkQIOqIdgsvyREwibe4I9HNP3rQ3re7LqRB2AwLqynWDCsZF
 U+VYzzlCxrpcsd+DN6X69btJxRNJyVaNaG6wPlkc3gfCnzum3k0/9dmw8WBnMdrcGPwC
 2hqTT/CKuK/pphACRZLNmPi9P6HkzlBMXboB4esE0gGpLz9VCiVUQYHl7j6d6qgEduxi
 L90a0BjndbYGU9x8Op4IG+faK9jXWIixDu1ZcL24frAXzkdMCwcfiUVhu4KODnj+GqK/
 ihZg==
X-Gm-Message-State: APjAAAVKjSljeCO+3C6dGWNt/G44V7RGE6pVDjvQPUUuWiS4P/qVGgHS
 HEjFmp6ZjSUmbB6+qXNd3Ug=
X-Google-Smtp-Source: APXvYqw8p9qnWyQgULg4OsrlEke+jE9I3hGNN9t0otHZ2EhBJwliK/uGLJQ+ngat7SZpVpL4h+AdQg==
X-Received: by 2002:a17:90a:6484:: with SMTP id h4mr863042pjj.84.1575921482018; 
 Mon, 09 Dec 2019 11:58:02 -0800 (PST)
Received: from localhost ([2001:19f0:6001:12c8:5400:2ff:fe72:6403])
 by smtp.gmail.com with ESMTPSA id k12sm358411pgm.65.2019.12.09.11.58.01
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 09 Dec 2019 11:58:01 -0800 (PST)
From: Yangtao Li <tiny.windzz@gmail.com>
To: afaerber@suse.de, manivannan.sadhasivam@linaro.org,
 mturquette@baylibre.com, sboyd@kernel.org, Eugeniy.Paltsev@synopsys.com,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, linux-imx@nxp.com, agross@kernel.org,
 s.nawrocki@samsung.com, tomasz.figa@gmail.com, cw00.choi@samsung.com,
 kgene@kernel.org, krzk@kernel.org, palmer@sifive.com,
 paul.walmsley@sifive.com, dinguyen@kernel.org, mripard@kernel.org,
 wens@csie.org, emilio@elopez.com.ar, pdeschrijver@nvidia.com,
 pgaikwad@nvidia.com, thierry.reding@gmail.com, jonathanh@nvidia.com,
 matthias.bgg@gmail.com, rfontana@redhat.com, gregkh@linuxfoundation.org,
 t-kristo@ti.com, john@phrozen.org, tglx@linutronix.de, allison@lohutok.net,
 kstewart@linuxfoundation.org, swinslow@gmail.com, aisheng.dong@nxp.com,
 robh@kernel.org, daniel.baluta@nxp.com, weiyongjun1@huawei.com,
 wangyan.wang@mediatek.com, chunhui.dai@mediatek.com,
 miquel.raynal@bootlin.com, heiko@sntech.de, jcmvbkbc@gmail.com,
 nsekhar@ti.com, geert+renesas@glider.be
Subject: [PATCH 02/17] clk: qcom: convert to devm_platform_ioremap_resource
Date: Mon,  9 Dec 2019 19:57:34 +0000
Message-Id: <20191209195749.868-2-tiny.windzz@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191209195749.868-1-tiny.windzz@gmail.com>
References: <20191209195749.868-1-tiny.windzz@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191209_115806_635342_7C08AA54 
X-CRM114-Status: GOOD (  10.85  )
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
 linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Use devm_platform_ioremap_resource() to simplify code.

Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
---
 drivers/clk/qcom/a53-pll.c  | 4 +---
 drivers/clk/qcom/common.c   | 8 ++------
 drivers/clk/qcom/hfpll.c    | 4 +---
 drivers/clk/qcom/kpss-xcc.c | 4 +---
 4 files changed, 5 insertions(+), 15 deletions(-)

diff --git a/drivers/clk/qcom/a53-pll.c b/drivers/clk/qcom/a53-pll.c
index 45cfc57bff92..42d14b6861d4 100644
--- a/drivers/clk/qcom/a53-pll.c
+++ b/drivers/clk/qcom/a53-pll.c
@@ -38,7 +38,6 @@ static int qcom_a53pll_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct regmap *regmap;
-	struct resource *res;
 	struct clk_pll *pll;
 	void __iomem *base;
 	struct clk_init_data init = { };
@@ -48,8 +47,7 @@ static int qcom_a53pll_probe(struct platform_device *pdev)
 	if (!pll)
 		return -ENOMEM;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	base = devm_ioremap_resource(dev, res);
+	base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(base))
 		return PTR_ERR(base);
 
diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
index 60d2a78d1395..0932e019dd12 100644
--- a/drivers/clk/qcom/common.c
+++ b/drivers/clk/qcom/common.c
@@ -73,11 +73,9 @@ struct regmap *
 qcom_cc_map(struct platform_device *pdev, const struct qcom_cc_desc *desc)
 {
 	void __iomem *base;
-	struct resource *res;
 	struct device *dev = &pdev->dev;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	base = devm_ioremap_resource(dev, res);
+	base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(base))
 		return ERR_CAST(base);
 
@@ -313,11 +311,9 @@ int qcom_cc_probe_by_index(struct platform_device *pdev, int index,
 			   const struct qcom_cc_desc *desc)
 {
 	struct regmap *regmap;
-	struct resource *res;
 	void __iomem *base;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, index);
-	base = devm_ioremap_resource(&pdev->dev, res);
+	base = devm_platform_ioremap_resource(pdev, index);
 	if (IS_ERR(base))
 		return -ENOMEM;
 
diff --git a/drivers/clk/qcom/hfpll.c b/drivers/clk/qcom/hfpll.c
index a6de7101430c..de7df848dcfb 100644
--- a/drivers/clk/qcom/hfpll.c
+++ b/drivers/clk/qcom/hfpll.c
@@ -47,7 +47,6 @@ static const struct regmap_config hfpll_regmap_config = {
 
 static int qcom_hfpll_probe(struct platform_device *pdev)
 {
-	struct resource *res;
 	struct device *dev = &pdev->dev;
 	void __iomem *base;
 	struct regmap *regmap;
@@ -62,8 +61,7 @@ static int qcom_hfpll_probe(struct platform_device *pdev)
 	if (!h)
 		return -ENOMEM;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	base = devm_ioremap_resource(dev, res);
+	base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(base))
 		return PTR_ERR(base);
 
diff --git a/drivers/clk/qcom/kpss-xcc.c b/drivers/clk/qcom/kpss-xcc.c
index 8590b5edd19d..4fec1f9142b8 100644
--- a/drivers/clk/qcom/kpss-xcc.c
+++ b/drivers/clk/qcom/kpss-xcc.c
@@ -33,7 +33,6 @@ static int kpss_xcc_driver_probe(struct platform_device *pdev)
 {
 	const struct of_device_id *id;
 	struct clk *clk;
-	struct resource *res;
 	void __iomem *base;
 	const char *name;
 
@@ -41,8 +40,7 @@ static int kpss_xcc_driver_probe(struct platform_device *pdev)
 	if (!id)
 		return -ENODEV;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	base = devm_ioremap_resource(&pdev->dev, res);
+	base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(base))
 		return PTR_ERR(base);
 
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
