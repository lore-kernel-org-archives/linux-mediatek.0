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
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2A08C43603
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Dec 2019 19:58:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5870C207FF
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Dec 2019 19:58:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Jr3oS8uq";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Msei64Fu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5870C207FF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=V42N0yPvk1+mO8tBeNTyyxRKKQpKKpSr1YY/5GJL8E0=; b=Jr3oS8uqlRLRVMK0Hk0sFlYK57
	FQU+p5kucsM8Zf2xA4rlq814bnORqG023J756PeKraEmzLxPfhqSORYxwXXYVvwk6izorjAb5elzU
	RcICFj+YUxblqF5VVnFGqT6115B+PXydPOEifFAvP17jAZ44ze0QEs7QoX6YARHAV0qmZ9C+1jWen
	v4pstzk4r6iCemljm5wxhZcM0OsryN+Lx2ramVVtziOeMxzLsVFo234aGn3jG13DxGEdSOPeIM9OI
	6T6ZAI4gHSu/43miSOVLz2H9IN4Lg9ueSPmg9MkYs2GR+2GyK0C/Ug/hQ0dskb+pQXSvddBXNG2Tq
	57SRQKAA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iePAZ-0001bp-Oq; Mon, 09 Dec 2019 19:58:11 +0000
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iePAS-0001WL-Nf; Mon, 09 Dec 2019 19:58:06 +0000
Received: by mail-pj1-x1041.google.com with SMTP id j11so5216268pjs.1;
 Mon, 09 Dec 2019 11:58:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=kQqkd4Go/fezV95dyLC3ywKvO+7ydWbuuW1GTA8ixyg=;
 b=Msei64Fu/8t2NFRncpq95gV/RuQA61hBHdK4sNALHPvBxrm37uRxeQuOKpTGMzXvsw
 uaS96um2tvLut0uD+CSYGN5+X8ra/ZDSxdwDYkhnA/g/vodCP+d0vzVSZf2Kft6r9Q4K
 Km1ofWiqOmT/VTJwwh46segleeWqzwxEerzW0QkJEfmOaBkhJotS8KeDBuNTvg+m7srJ
 ZibXDnmHmQQRuco5c1F85EkFBldhrB53KxMafhrAA6kiHmiOb2Xp4zEYbdLVZumxbfDX
 lCfyrMRXXdJ1AFwM5hWanmfYoUVWuiV7hnFgpvj1S0n+t3Thei5fDLW2F6h/yYKg030R
 k6yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=kQqkd4Go/fezV95dyLC3ywKvO+7ydWbuuW1GTA8ixyg=;
 b=MGSvu3O1wX2B2yd5STLq7V/ABVoMDT3hQw2VghLHeEXZXMtyvRq2ourpqMPTTc+Csg
 lcXzeR+3+fejVGzNhJKFxYcOTT1GNkM/DhEAC+Hmz1Qtkj/B3XlrN8QaeOWMApTyowFA
 Ks6m6JcgjWQmAjmypw6RuC2O2JSJLgHx7jT2psSlBBtG1vGi6Tdl8F7vQ4Hq9gREQ2xo
 IBbYJ2b5ohIISAg9qxjsZvy1baD2P6a9uiZhqEIIZJAXqWFNj8KWxqaFnqcDGaaInd2C
 SwXx1nRLvIJhFMEAXmSFjGZy/h3DEDvcE/1ZhKVOjPkZJx04ngYvs8BZH1mAZBdhfA1j
 WW7w==
X-Gm-Message-State: APjAAAW4coEIT40bp0ybmYxSnhc940xAHMHWkJdNA9ev63OPzth60r3p
 /MpRATQ5bWA6yBBxBDpVxvw=
X-Google-Smtp-Source: APXvYqxPkM9S+2BDxVhR/pd+pjvcvaNCiP57InFYKfnb/zDnE5wvpd64NLJQLnXBF/zs7qKdbOoEVw==
X-Received: by 2002:a17:90a:2521:: with SMTP id
 j30mr874681pje.98.1575921484132; 
 Mon, 09 Dec 2019 11:58:04 -0800 (PST)
Received: from localhost ([2001:19f0:6001:12c8:5400:2ff:fe72:6403])
 by smtp.gmail.com with ESMTPSA id 8sm306168pfu.21.2019.12.09.11.58.03
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 09 Dec 2019 11:58:03 -0800 (PST)
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
Subject: [PATCH 03/17] clk: samsung: convert to devm_platform_ioremap_resource
Date: Mon,  9 Dec 2019 19:57:35 +0000
Message-Id: <20191209195749.868-3-tiny.windzz@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191209195749.868-1-tiny.windzz@gmail.com>
References: <20191209195749.868-1-tiny.windzz@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191209_115804_793302_778F9988 
X-CRM114-Status: GOOD (  10.89  )
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
 drivers/clk/samsung/clk-exynos-audss.c   | 4 +---
 drivers/clk/samsung/clk-exynos4412-isp.c | 4 +---
 drivers/clk/samsung/clk-exynos5433.c     | 4 +---
 drivers/clk/samsung/clk-s5pv210-audss.c  | 4 +---
 4 files changed, 4 insertions(+), 12 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos-audss.c b/drivers/clk/samsung/clk-exynos-audss.c
index 42b5d32c6cc7..9cc127a162ad 100644
--- a/drivers/clk/samsung/clk-exynos-audss.c
+++ b/drivers/clk/samsung/clk-exynos-audss.c
@@ -129,7 +129,6 @@ static int exynos_audss_clk_probe(struct platform_device *pdev)
 	struct clk *pll_ref, *pll_in, *cdclk, *sclk_audio, *sclk_pcm_in;
 	const struct exynos_audss_clk_drvdata *variant;
 	struct clk_hw **clk_table;
-	struct resource *res;
 	struct device *dev = &pdev->dev;
 	int i, ret = 0;
 
@@ -137,8 +136,7 @@ static int exynos_audss_clk_probe(struct platform_device *pdev)
 	if (!variant)
 		return -EINVAL;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	reg_base = devm_ioremap_resource(dev, res);
+	reg_base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(reg_base))
 		return PTR_ERR(reg_base);
 
diff --git a/drivers/clk/samsung/clk-exynos4412-isp.c b/drivers/clk/samsung/clk-exynos4412-isp.c
index 4b9e73608c21..20f5129f7212 100644
--- a/drivers/clk/samsung/clk-exynos4412-isp.c
+++ b/drivers/clk/samsung/clk-exynos4412-isp.c
@@ -110,11 +110,9 @@ static int __init exynos4x12_isp_clk_probe(struct platform_device *pdev)
 	struct samsung_clk_provider *ctx;
 	struct device *dev = &pdev->dev;
 	struct device_node *np = dev->of_node;
-	struct resource *res;
 	void __iomem *reg_base;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	reg_base = devm_ioremap_resource(dev, res);
+	reg_base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(reg_base)) {
 		dev_err(dev, "failed to map registers\n");
 		return PTR_ERR(reg_base);
diff --git a/drivers/clk/samsung/clk-exynos5433.c b/drivers/clk/samsung/clk-exynos5433.c
index 4b1aa9382ad2..b0d48cddfd6e 100644
--- a/drivers/clk/samsung/clk-exynos5433.c
+++ b/drivers/clk/samsung/clk-exynos5433.c
@@ -5557,7 +5557,6 @@ static int __init exynos5433_cmu_probe(struct platform_device *pdev)
 	struct exynos5433_cmu_data *data;
 	struct samsung_clk_provider *ctx;
 	struct device *dev = &pdev->dev;
-	struct resource *res;
 	void __iomem *reg_base;
 	int i;
 
@@ -5570,8 +5569,7 @@ static int __init exynos5433_cmu_probe(struct platform_device *pdev)
 		return -ENOMEM;
 	ctx = &data->ctx;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	reg_base = devm_ioremap_resource(dev, res);
+	reg_base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(reg_base))
 		return PTR_ERR(reg_base);
 
diff --git a/drivers/clk/samsung/clk-s5pv210-audss.c b/drivers/clk/samsung/clk-s5pv210-audss.c
index 14985ebd043b..503bd8a10d8f 100644
--- a/drivers/clk/samsung/clk-s5pv210-audss.c
+++ b/drivers/clk/samsung/clk-s5pv210-audss.c
@@ -63,15 +63,13 @@ static struct syscore_ops s5pv210_audss_clk_syscore_ops = {
 static int s5pv210_audss_clk_probe(struct platform_device *pdev)
 {
 	int i, ret = 0;
-	struct resource *res;
 	const char *mout_audss_p[2];
 	const char *mout_i2s_p[3];
 	const char *hclk_p;
 	struct clk_hw **clk_table;
 	struct clk *hclk, *pll_ref, *pll_in, *cdclk, *sclk_audio;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	reg_base = devm_ioremap_resource(&pdev->dev, res);
+	reg_base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(reg_base)) {
 		dev_err(&pdev->dev, "failed to map audss registers\n");
 		return PTR_ERR(reg_base);
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
