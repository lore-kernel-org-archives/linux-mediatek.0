Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E616C433FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Oct 2022 13:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J4boSMDIMSEVQTaENzgDytuelvqQTNOGg+C0gp1qMNY=; b=IUYe8lT7Oal3QGsh9+qQ3exEgG
	T9lEMGqzusp+UZbOYAXgWvAP12JFMXHoBHtwxiDrRx32Dk5e0CG0VHj1wtX2MXXP6OjcUzPaQJLls
	mkGYjSI3IMGzbu1vCT1XhCmIz7/BThoM55YPfq77g1TcI1nvO8IOnqsRXLlRqbocJGluGk2Hhd/k4
	mrLdo//FdzWuxwgB3cNv2ULlrBYyp92/f0T8EiAELK0gpZbwvLuSSYU32PSQPp4D1wKIRmPPNI7Co
	UJ9N/M1pOWo4pVbzlDeCfGREEQQLYkTqKHYpvmBoLWWgNDx7wKkLaB1nvXwQgOt5o+38hXIE8L18P
	C97DoQQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olVZv-00FRxH-9I; Thu, 20 Oct 2022 13:27:19 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olVKd-00FIXo-GL
	for linux-mediatek@lists.infradead.org; Thu, 20 Oct 2022 13:11:36 +0000
Received: by mail-wr1-x42b.google.com with SMTP id f11so34353646wrm.6
        for <linux-mediatek@lists.infradead.org>; Thu, 20 Oct 2022 06:11:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J4boSMDIMSEVQTaENzgDytuelvqQTNOGg+C0gp1qMNY=;
        b=E/Hioe+jZMzRIQ7yMGUhSU9ay7uPXjwm6UBqcrUgwU3IgoI5pSLHBPSmJ/pTFqxz5O
         roKsqMeS6FiuhGGMda7XTJ+1FNRXTc+pghU8rh44mD8Ycu1kaDyBDPqYJcIKudLuI3jQ
         dTDishgLlhpzIHyUch61+aiJxjLDxmT+ybnyQ2/D99l6jz71IPm7l1MV6gsmZlJWQtjX
         3XcQqZJcsUHES4z20q/BGKRDN03p8cAUamKq+2i1FvjVCsyy92/vlLydwwdf/IGpOB8m
         R1k5Bs6QcyfQIBZRtzbYZXkUfHZ2Fxc2UuTPgBhyUrtSbJZHkAmkOfbCpdjL5JqiUrhW
         CugA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J4boSMDIMSEVQTaENzgDytuelvqQTNOGg+C0gp1qMNY=;
        b=ZvN82Z5gDNcIO7V/bPvKSX0ux+fofaKGGx3x9bmtqdMec9+HPZH5HbA83BUHtTPcRu
         EQQqEDmyDMUQKQv9SS+7VDwl5i8fnoNRmEVplmK52UjOAaRzvyJxuk04JQDYBVu7g6yK
         qEt13azM71I6dl31WNeBPodzlekW3fkWzDmIBPHGWZXQ6Mh9yvXVZdp/r5sP0WLAxWDs
         8pYn13WNqb5uYk5S4TLXV/oCc+rXa4LMXZ+Cw1jNVz5Q8P4M62qA9Iv2+MSMSzL3kfRP
         pWQj7cfhe300ChJI0RMsTkw0CAXnRWMOvR/H9+01zCytcW5qt4nrRNzf0/anEsPqu3vZ
         PGPg==
X-Gm-Message-State: ACrzQf1C5YuPvxqSaHm/G0cfvVyAhRSDIpP/3p77hR4IKe6UtgXjf3G3
	sRHXC9HPotT6mCzOBJEwdxtNhg==
X-Google-Smtp-Source: AMsMyM7XcWdQ45niE9823OodhnElezdZeoxDyltFVuQkpfyfcKWrLtK2eKa6PRbx8t6awEeRiArqjQ==
X-Received: by 2002:a05:6000:1842:b0:22e:7bbf:c75 with SMTP id c2-20020a056000184200b0022e7bbf0c75mr8601406wri.547.1666271488170;
        Thu, 20 Oct 2022 06:11:28 -0700 (PDT)
Received: from localhost.localdomain ([2001:861:3a82:90b0:2979:1615:9a68:f204])
        by smtp.gmail.com with ESMTPSA id x8-20020a5d6508000000b00228dff8d975sm16453927wru.109.2022.10.20.06.11.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Oct 2022 06:11:27 -0700 (PDT)
From: fchiby@baylibre.com
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Johnson Wang <johnson.wang@mediatek.com>,
	"Zhiyong.Tao" <zhiyong.tao@mediatek.com>
Cc: Fabien Parent <fparent@baylibre.com>,
	Sen Chu <sen.chu@mediatek.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 2/3] soc: mediatek: pwrap: add support for sys & tmr clocks
Date: Thu, 20 Oct 2022 15:09:56 +0200
Message-Id: <20221020130957.25197-3-fchiby@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221020130957.25197-1-fchiby@baylibre.com>
References: <20221020130957.25197-1-fchiby@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221020_061131_688247_220895FD 
X-CRM114-Status: GOOD (  16.00  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Fabien Parent <fparent@baylibre.com>

MT8365 requires an extra 2 clocks to be enabled to behave correctly.
Add support these 2 clocks, they are made optional since they seem to
be present only on MT8365.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
 drivers/soc/mediatek/mtk-pmic-wrap.c | 36 ++++++++++++++++++++++++----
 1 file changed, 32 insertions(+), 4 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-pmic-wrap.c b/drivers/soc/mediatek/mtk-pmic-wrap.c
index eb82ae06697f..d56b00023ccd 100644
--- a/drivers/soc/mediatek/mtk-pmic-wrap.c
+++ b/drivers/soc/mediatek/mtk-pmic-wrap.c
@@ -1171,6 +1171,8 @@ struct pmic_wrapper {
 	const struct pwrap_slv_type *slave;
 	struct clk *clk_spi;
 	struct clk *clk_wrap;
+	struct clk *clk_sys;
+	struct clk *clk_tmr;
 	struct reset_control *rstc;
 
 	struct reset_control *rstc_bridge;
@@ -2214,6 +2216,20 @@ static int pwrap_probe(struct platform_device *pdev)
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
@@ -2222,6 +2238,14 @@ static int pwrap_probe(struct platform_device *pdev)
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
@@ -2236,7 +2260,7 @@ static int pwrap_probe(struct platform_device *pdev)
 		ret = pwrap_init(wrp);
 		if (ret) {
 			dev_dbg(wrp->dev, "init failed with %d\n", ret);
-			goto err_out2;
+			goto err_out4;
 		}
 	}
 
@@ -2250,7 +2274,7 @@ static int pwrap_probe(struct platform_device *pdev)
 	if (!(pwrap_readl(wrp, PWRAP_WACS2_RDATA) & mask_done)) {
 		dev_dbg(wrp->dev, "initialization isn't finished\n");
 		ret = -ENODEV;
-		goto err_out2;
+		goto err_out4;
 	}
 
 	/* Initialize watchdog, may not be done by the bootloader */
@@ -2288,7 +2312,7 @@ static int pwrap_probe(struct platform_device *pdev)
 			       IRQF_TRIGGER_HIGH,
 			       "mt-pmic-pwrap", wrp);
 	if (ret)
-		goto err_out2;
+		goto err_out4;
 
 	wrp->regmap = devm_regmap_init(wrp->dev, NULL, wrp, wrp->slave->regops->regmap);
 	if (IS_ERR(wrp->regmap)) {
@@ -2300,11 +2324,15 @@ static int pwrap_probe(struct platform_device *pdev)
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
2.25.1


