Return-Path: <SRS0=SGDP=Z7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20AA7C43603
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Dec 2019 19:59:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E52F7207FF
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Dec 2019 19:59:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ho1bgt0l";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ql1idqnF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E52F7207FF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=+KUEsR4Ak2z7zy6UNhJ9ZPsJFQH8hcyNCW4emVgfIjI=; b=ho1bgt0lt4w6MGI/UkQ6g+tMMB
	Q0V0pVgxeU487nw1zV9d9rDcolNdebcnrUy5+xyWgdQA+zGaYJMaurdbI7QYoGstzDRr2KWlwT+OH
	MolPwyMSYSLuB9afqy+4OQ4rZ6APSqJDtUAiwzzQyORoaztqVPHagL5s5IJqIPfXOB8ggw80MEjRI
	VD7vVyQ6Vy4TOaFPuGPlfN9hSbZ8x2dBjhX2fM0F3TBXv562oNyCcn97ebeYeMkv/9F9YrOxhxEeM
	4BjJ/4FQ5RRSBM6StZtpkznWKD5VBI+M4Ec8GJUzlV4w2QYUo8cYy5i7x7E2gtV8ebxR7gsET5N2v
	9S8KPS3g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iePBY-00030k-S0; Mon, 09 Dec 2019 19:59:12 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iePAp-0001tu-EA; Mon, 09 Dec 2019 19:58:28 +0000
Received: by mail-pl1-x643.google.com with SMTP id o9so6234659plk.6;
 Mon, 09 Dec 2019 11:58:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Rh0bnLPUtx+tPcJ7oCSjUFbyV7d1BipJo6LPETVaXJc=;
 b=Ql1idqnFkeOA1b2ibaJk1lP2UsH/b2TD0BILC3fV3jIWbO6hOXSrjUaYvsFKb84JtS
 s6YZZ4GWy0d+u0x82WVYr3eyDLh2FJTWL5ABfs+z4V0q8cwbuATv9EHOY2Poa6e0YqRk
 7uNOluhmhtg4XC1xGIyRPFwvn1VP64F56d4gZzQ+08CJKJ4bR8ZoPrnMEcLpi3NdhqlW
 3Rk0Cp24NqoNVHhL27o1FoM87UpuMvKiEAgj3ME1e/Uiu602SGAV7YWjBsmARtVOjgZ3
 WcYhoM0cIeckI9/dvRc8hmoc84F1JMCdxHEUQTZhA1eZqcAywBsuDW39KOXb1iDtuqtI
 lq/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Rh0bnLPUtx+tPcJ7oCSjUFbyV7d1BipJo6LPETVaXJc=;
 b=EsyAMi/fC89se96c+mvUHkSDPUjZ1yjZfFsk+ydvtxjWElM6XJPTDlow/PNXZH5fTY
 FH8qmbnyQVxyp7w9nqdCKGq4zCtPvteNyCgQ3wGgAwDWgb0RNDiUGS3DhM6R3vwhNVN4
 ayKxEJ5w6y4wDK9AIvStxrGuiCSSpHES+ZGwEjAU5+P8PGMN3nulRk4KuZ6/kzfL0Pyr
 DLjnwUQbqAOG5XUW06ts/LJy8nEVXNu6ZEmkHhc3mIqcHUMs7Y//xpYyICVAfYDH76DW
 1dV7WaTjmTijNmQHA63GIniQIMVra1GOxxQDMhHrCVozRsPD+dqLAQo1AZO4YFdgVx9s
 U3rA==
X-Gm-Message-State: APjAAAUlNWg3lKOgdwo+uGoPSGB3N3Kswy3BMLImMso+quirh9x+Xe2K
 gXyHv8thJ3v2EKnn2XDK7XA=
X-Google-Smtp-Source: APXvYqw0rvrrMAD8BKloCopu8xC3C8Rdw1NB+NEIqLAqNAoIW5lOeisBjjvEUWp1r84TMZN7X6Ltgw==
X-Received: by 2002:a17:902:b701:: with SMTP id
 d1mr3560003pls.144.1575921506316; 
 Mon, 09 Dec 2019 11:58:26 -0800 (PST)
Received: from localhost ([2001:19f0:6001:12c8:5400:2ff:fe72:6403])
 by smtp.gmail.com with ESMTPSA id m34sm378688pgb.26.2019.12.09.11.58.25
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 09 Dec 2019 11:58:25 -0800 (PST)
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
Subject: [PATCH 15/17] clk: bm1880: convert to devm_platform_ioremap_resource
Date: Mon,  9 Dec 2019 19:57:47 +0000
Message-Id: <20191209195749.868-15-tiny.windzz@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191209195749.868-1-tiny.windzz@gmail.com>
References: <20191209195749.868-1-tiny.windzz@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191209_115827_546116_A0322272 
X-CRM114-Status: UNSURE (   9.45  )
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
 drivers/clk/clk-bm1880.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/clk-bm1880.c b/drivers/clk/clk-bm1880.c
index 4cd175afce9b..9fa0ca1fe833 100644
--- a/drivers/clk/clk-bm1880.c
+++ b/drivers/clk/clk-bm1880.c
@@ -893,16 +893,13 @@ static int bm1880_clk_probe(struct platform_device *pdev)
 	struct bm1880_clock_data *clk_data;
 	void __iomem *pll_base, *sys_base;
 	struct device *dev = &pdev->dev;
-	struct resource *res;
 	int num_clks, i;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	pll_base = devm_ioremap_resource(&pdev->dev, res);
+	pll_base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(pll_base))
 		return PTR_ERR(pll_base);
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
-	sys_base = devm_ioremap_resource(&pdev->dev, res);
+	sys_base = devm_platform_ioremap_resource(pdev, 1);
 	if (IS_ERR(sys_base))
 		return PTR_ERR(sys_base);
 
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
