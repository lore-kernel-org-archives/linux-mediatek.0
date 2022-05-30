Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D5E0C433FE
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 May 2022 14:35:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mRRJpIC+CUp5ZBYoE+ieeIsfY69tJagDAwwCqy08MtQ=; b=vTXaFHipxxu4e6
	TBWFG9MiotEvqQNJETeS937tSc+MokylVFOBF02Xz4saO100pdq13A/hT2oJIjv6EmCPF1kxyQCox
	diAEhAozs37ezKSETGX3to8638JHira1n7xAvqre50sW4Hms7R7qkQ5LuElMfcvyJ0yzxDbZf7+Hm
	LXjiDp7xV+6p0mRAU2RwQh1MHOaRjwQuIcv8bGQtrPhg3jYYsHS0ed1J/nSaWQUQ+cGndxKgYjKqo
	tCyQQflQ66CH9f144TYGvUlsckbM+WBuooepwn3O0NPCZH4uqIE9i+jkVW9fiksU/dAR5ImvYgFMg
	s/R4esGU+u+M06pFr1YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvgUT-007GVc-UO; Mon, 30 May 2022 14:35:30 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvfs0-006xDf-QZ
	for linux-mediatek@lists.infradead.org; Mon, 30 May 2022 13:55:47 +0000
Received: by mail-wr1-x42c.google.com with SMTP id s24so7426299wrb.10
        for <linux-mediatek@lists.infradead.org>; Mon, 30 May 2022 06:55:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Xw66Rm/stx5LdYx2rVfwLOupkCkZYlXybZKzqQavPCw=;
        b=tcCeuGat82kxq/tRnolJqUxQecH9kOW5WFXPEM5DGqSbcF+ZnIHNmjfaZY7/UJTtoU
         E+s5JYjoWhMxM7k7Jjip+G26kUqlbZXkZa+XpHn6By8vKcycMQT3nvxt5CeEjyXR59om
         hXBEkp7JCEAJFfytoYtsnxxEv/J32OEIGXqHy/DYTpxaQnEteeVtOU5zIj0Slu2tWTo3
         SZvPX/X5iNoNSoDQVgYCsImovxymg1hBSmTFRfr5g7ZdeIyyun3UEYPuPXuNdiVATbc0
         XybcHs5DB/AW8/zTwWYDDe0KijSDUalJqoq4aM06KqKI3JShKSrG5xTDRmDsLr/QbNVg
         LX3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Xw66Rm/stx5LdYx2rVfwLOupkCkZYlXybZKzqQavPCw=;
        b=ZfbyjSqge1CNH60pgbWcSnIhZm+smJWSMnqL2+2V4b+azRzNOSy6XINSIpxbXmloKi
         kIljqWfsgpjXwhZca05oRCy35te8x4uNUbUZtn/B9icxRj9o2CxePgIMLEmNmi/XoWSi
         XZawoPi7Wg05dxJ64bpakEF7LnBRDVC05G3z9w35YGY7jW9lD1V0ccExSymYO1xS1p5V
         8/oNNBaDCOMJ9PygsjdIy4VdyWYWdB0Q3q0eyuEKgkVqzNUcDvaELAPKXCH55LnezHQt
         7z8D5jc7U1ium5bJSfZ6tGA6pXIu4rXJWEklzbYT1TGsgVvA77Gk6czhBjOrrP/dl7dG
         dDKA==
X-Gm-Message-State: AOAM533/A2TmkUYD1WmnYPpAWnUYb8WhEXuCVnRaoi+md60kft3QkeXC
	4ns1xp8Kfmk3rq/dwxKMFlPLsHrFW+LGeg==
X-Google-Smtp-Source: ABdhPJyZArKkXHwklacwoXIj8QPwSo171Bv6oYmc4UVF5gdv7tBrH85atnkzcmtB3PGbgTH3iciK+w==
X-Received: by 2002:a5d:5743:0:b0:210:dd:98c8 with SMTP id q3-20020a5d5743000000b0021000dd98c8mr20932592wrw.259.1653918943273;
        Mon, 30 May 2022 06:55:43 -0700 (PDT)
Received: from localhost.localdomain ([88.160.162.107])
        by smtp.gmail.com with ESMTPSA id w9-20020adfee49000000b0020cfed0bb7fsm9214856wro.53.2022.05.30.06.55.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 May 2022 06:55:42 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Fabien Parent <fparent@baylibre.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] soc: mediatek: pwrap: add support for sys & tmr clocks
Date: Mon, 30 May 2022 15:55:21 +0200
Message-Id: <20220530135522.762560-2-fparent@baylibre.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220530135522.762560-1-fparent@baylibre.com>
References: <20220530135522.762560-1-fparent@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220530_065545_140428_88E16AB5 
X-CRM114-Status: GOOD (  15.77  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

MT8365 requires an extra 2 clocks to be enabled to behave correctly.
Add support these 2 clocks, they are made optional since they seem to
be present only on MT8365.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
 drivers/soc/mediatek/mtk-pmic-wrap.c | 36 ++++++++++++++++++++++++----
 1 file changed, 32 insertions(+), 4 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-pmic-wrap.c b/drivers/soc/mediatek/mtk-pmic-wrap.c
index bf39a64f3ecc..8dea5e14d73e 100644
--- a/drivers/soc/mediatek/mtk-pmic-wrap.c
+++ b/drivers/soc/mediatek/mtk-pmic-wrap.c
@@ -1163,6 +1163,8 @@ struct pmic_wrapper {
 	const struct pwrap_slv_type *slave;
 	struct clk *clk_spi;
 	struct clk *clk_wrap;
+	struct clk *clk_sys;
+	struct clk *clk_tmr;
 	struct reset_control *rstc;
 
 	struct reset_control *rstc_bridge;
@@ -2250,6 +2252,20 @@ static int pwrap_probe(struct platform_device *pdev)
 		return PTR_ERR(wrp->clk_wrap);
 	}
 
+	wrp->clk_sys = devm_clk_get_optional(wrp->dev, "sys");
+	if (IS_ERR(wrp->clk_sys)) {
+		return dev_err_probe(wrp->dev, PTR_ERR(wrp->clk_sys),
+				     "failed to get clock: %pe\n",
+				     wrp->clk_sys);
+	}
+
+	wrp->clk_tmr = devm_clk_get_optional(wrp->dev, "tmr");
+	if (IS_ERR(wrp->clk_tmr)) {
+		return dev_err_probe(wrp->dev, PTR_ERR(wrp->clk_tmr),
+				     "failed to get clock: %pe\n",
+				     wrp->clk_tmr);
+	}
+
 	ret = clk_prepare_enable(wrp->clk_spi);
 	if (ret)
 		return ret;
@@ -2258,6 +2274,14 @@ static int pwrap_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_out1;
 
+	ret = clk_prepare_enable(wrp->clk_sys);
+	if (ret)
+		goto err_out2;
+
+	ret = clk_prepare_enable(wrp->clk_tmr);
+	if (ret)
+		goto err_out3;
+
 	/* Enable internal dynamic clock */
 	if (HAS_CAP(wrp->master->caps, PWRAP_CAP_DCM)) {
 		pwrap_writel(wrp, 1, PWRAP_DCM_EN);
@@ -2272,7 +2296,7 @@ static int pwrap_probe(struct platform_device *pdev)
 		ret = pwrap_init(wrp);
 		if (ret) {
 			dev_dbg(wrp->dev, "init failed with %d\n", ret);
-			goto err_out2;
+			goto err_out4;
 		}
 	}
 
@@ -2286,7 +2310,7 @@ static int pwrap_probe(struct platform_device *pdev)
 	if (!(pwrap_readl(wrp, PWRAP_WACS2_RDATA) & mask_done)) {
 		dev_dbg(wrp->dev, "initialization isn't finished\n");
 		ret = -ENODEV;
-		goto err_out2;
+		goto err_out4;
 	}
 
 	/* Initialize watchdog, may not be done by the bootloader */
@@ -2319,7 +2343,7 @@ static int pwrap_probe(struct platform_device *pdev)
 			       IRQF_TRIGGER_HIGH,
 			       "mt-pmic-pwrap", wrp);
 	if (ret)
-		goto err_out2;
+		goto err_out4;
 
 	wrp->regmap = devm_regmap_init(wrp->dev, NULL, wrp, wrp->slave->regmap);
 	if (IS_ERR(wrp->regmap)) {
@@ -2331,11 +2355,15 @@ static int pwrap_probe(struct platform_device *pdev)
 	if (ret) {
 		dev_dbg(wrp->dev, "failed to create child devices at %pOF\n",
 				np);
-		goto err_out2;
+		goto err_out4;
 	}
 
 	return 0;
 
+err_out4:
+	clk_disable_unprepare(wrp->clk_tmr);
+err_out3:
+	clk_disable_unprepare(wrp->clk_sys);
 err_out2:
 	clk_disable_unprepare(wrp->clk_wrap);
 err_out1:
-- 
2.36.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
