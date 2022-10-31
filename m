Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49A13FA3742
	for <linux-mediatek@archiver.kernel.org>; Mon, 31 Oct 2022 09:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s9+9zCegsUCIRIE3UD2cb0S32Fqr93kkv8zeVXoYmsQ=; b=03iBqMzsaAAkrbHm+Cw3ldl2m9
	v6a70BM4Ljx+R0QonFySH3zr3/GYM13HDcmWO7OSKaow7LtZOh8CU7MH2W3qRg2uLFiZaXLBqlYIb
	iuoJobFQdmuIDun3sbKMyRJHoa6HY0Dm9CENfM/YuvxMpElQwYSTMkbSD6r0wH9ziFLeFlOBMtb1J
	/cHwsuR4dqS4gfeoFLds88ePe8wVwLe28MfQ4IIn9T67NysBZKfFQWKBaBqEYwnLn5V+v8wrPZUBT
	i1ZThaPtxHKITQdxfGV6Gq2RonB/WNWn+gYjpQYTBAvjCFNJ+GzZqGQRQvQU6r8PBcIrxOO8wcnHz
	L4EUIVgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opRCE-00AAz1-Uo; Mon, 31 Oct 2022 09:35:06 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opRBj-00AAgv-IH
	for linux-mediatek@lists.infradead.org; Mon, 31 Oct 2022 09:34:37 +0000
Received: by mail-wm1-x32f.google.com with SMTP id c3-20020a1c3503000000b003bd21e3dd7aso10404444wma.1
        for <linux-mediatek@lists.infradead.org>; Mon, 31 Oct 2022 02:34:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s9+9zCegsUCIRIE3UD2cb0S32Fqr93kkv8zeVXoYmsQ=;
        b=nUwU40ZbSQQiiXmbuNHJK3uPUKBsu4RliRC4hTNLUhK98Ss8hzzdT7OiLOmb7FmJBf
         gSvqshhyvQIvg1ydoz2Jkijz72epbTZdOacS/GymSrj47SWRiJHo3rQ9vF4Ad2WMSv/1
         l2bz0Q4hAtVLD2eTS/bZHJ/YUrwN1gIoIoRqZigKtZwUapkeTm39DfSsTeOSamvsjtXU
         wDE6vhGIFtFmI6Tjk4zsLli4427TjK+TmMH5PtQSHPM0uOnPjFDB0nqO8vb7CgP8TwFw
         ZGx7EX1qir8C83A4z5O5ZJxiVwH3Dm2HpAV3dp5VGfH0xR3BdaBKokBnpDN01nKfMeYG
         1Y/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s9+9zCegsUCIRIE3UD2cb0S32Fqr93kkv8zeVXoYmsQ=;
        b=aqaubZ1YBCg0frzrL+RwPpXA2BpUKta9xTYQvZmvj8S4NAKxXZKlrOKpilqfFkQUqH
         g3IwNmadvXVtK4DodCE3JB1EZDwVTdJDv0DaTjSIabiuh1O/5LnsbSWuHkm2vo6NEyO/
         RV7ksr7YsDQSwPblxFrIMcsExNAvQ6PT1XBWboIJ8CYBPW9cKqHEuPGskQQ3MdzWhTl3
         JintvqfflnXcN0r/GBy6qj4AvkCMRITPGgInQsyfBR39dKN/r+LoHbQYoDGNGabpvx+f
         deU87cRzKb+WZOm4supoxhbp8hbmR1S3TAnJN/tlE54r2ES6ES5/mv15aEXhGGQ/3YEU
         2zmg==
X-Gm-Message-State: ACrzQf14N9SlSWpqo6ylWB7ftEru2mTs/eYVGwBy4I4BvCU4nrP4vQ3n
	0odXizjzE82pYQpHNr4iG5PIYg==
X-Google-Smtp-Source: AMsMyM5i4Jyy7DPwTD7FxJPx/hdZH5LYR2iYSU4sakPywzmez3E5HPoJ4cNum+Rt+v4uBRFtNQC+6w==
X-Received: by 2002:a05:600c:92a:b0:3cf:6264:f2a7 with SMTP id m42-20020a05600c092a00b003cf6264f2a7mr7695880wmp.131.1667208872711;
        Mon, 31 Oct 2022 02:34:32 -0700 (PDT)
Received: from fadwachiby.lan ([2001:861:3104:1980:6db3:63f:b30d:9361])
        by smtp.gmail.com with ESMTPSA id t16-20020adff610000000b0023538fb27c1sm6547566wrp.85.2022.10.31.02.34.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Oct 2022 02:34:32 -0700 (PDT)
From: fchiby@baylibre.com
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Johnson Wang <johnson.wang@mediatek.com>,
	"Zhiyong . Tao" <zhiyong.tao@mediatek.com>
Cc: Fabien Parent <fparent@baylibre.com>,
	Fadwa CHIBY <fchiby@baylibre.com>,
	Sen Chu <sen.chu@mediatek.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v3 2/3] soc: mediatek: pwrap: add support for sys & tmr clocks
Date: Mon, 31 Oct 2022 10:33:57 +0100
Message-Id: <20221031093401.22916-3-fchiby@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221031093401.22916-1-fchiby@baylibre.com>
References: <20221031093401.22916-1-fchiby@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221031_023435_658111_6BBE66FD 
X-CRM114-Status: GOOD (  15.63  )
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
Signed-off-by: Fadwa CHIBY <fchiby@baylibre.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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


