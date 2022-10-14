Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0272C4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Oct 2022 16:03:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tVeGkGwr3GPdeR7i1EiSinttHW7VHiK035a7xfUpheg=; b=YZS+JoZhBJQOFFxqDpzGAkrsN7
	pTyZ9cHus/d9pLnYTb/xDWqEGQH7bXwdW/yBY8XZM/6lyCSli/ygutchaY3XUo4v8bvCX0PWlHT2F
	NSQubQKpc7I8YRrflCXUXZngI3h03XCeZPeYpwRC6gcuDxL0BWa6msEc+2R5SpwWWQ+V38H20vOjT
	vkY7wAJbyRHu+tdgqU+Q2nMGs8Wji0pZ3XXhXI8G8pY6bvGKWLnKzKNcrDaGqJILHoF6jAdu7VPUZ
	98FMySCuR9HnclTP+HiO0Bio1ZcU02AWJ5BmMcLK9g5VEeGE5lVhX3UqbqlFV2axW0J7PAqZnUsSn
	D9LT6a4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ojN9i-00FGPd-25; Fri, 14 Oct 2022 16:03:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ojN9g-00FGKd-Bb
	for linux-mediatek@bombadil.infradead.org; Fri, 14 Oct 2022 16:03:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=tVeGkGwr3GPdeR7i1EiSinttHW7VHiK035a7xfUpheg=; b=NrLfzvO7yWO5Zxgp497UtVCC7S
	UieTJ1Y7AJ77b8kmAKoQsmT8izFHqu+EBl99MPqyKoxHmoTP+F15kQDUj6loxW6z+UoVH/OFnBQj6
	Zso2kFG6eNwr9MK059DeNXi+jGD29GSGomcZ63d+6EPvLToPnn0lhRZQnwjPlpYSrryXq4hbdU3KF
	WkKm01ZrNWVf7Isg0D5Sy/2UqexKnG3DhBYGM0gpnnP7uG2quJvT1freKp+x+jqtNOodvuYtinnZF
	/LFeQt0wWVhp3iibveyfZskSoUjcg1MrSLZbwvt2JfA7ez9qhDhdJwXTpfTrsFxCc2NNtFCDdjn4D
	3kg9EkaQ==;
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ojMU5-003RLQ-Gu
	for linux-mediatek@lists.infradead.org; Fri, 14 Oct 2022 15:20:28 +0000
Received: by mail-wm1-x329.google.com with SMTP id 6-20020a1c0206000000b003c6c154d528so622267wmc.4
        for <linux-mediatek@lists.infradead.org>; Fri, 14 Oct 2022 08:20:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tVeGkGwr3GPdeR7i1EiSinttHW7VHiK035a7xfUpheg=;
        b=InRjgTzMx8XbJ1KgDcGDMbzPZR1VxxoUtvri/RCqT8YLh7f/82+k/7VKqOBPHZA6KE
         DjmoxFOo7cBXuluOxICdbZ6Nd777/hg9Rbgzx59EX75Ekfvw385ym4CpGVEIBf2rI0F4
         2T57uC07p/giZ+1uIsZl1203TlTFHLp8RtmiKxiHcc+fnDKQvt7UKqiMUE4qyggyxSKP
         vjEcNJIOc+/1xrMJWbJmxzGjyqVshyoULY+TuQ3xUS7OlI77FshBULxX/Z1L2Ifgknua
         dtgtlXOtz+N8x9h9dBBY69SbeDIvb4jmXgFelp4ELOHm7B/0521zrF63l0q7oXpU2AeV
         3fhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tVeGkGwr3GPdeR7i1EiSinttHW7VHiK035a7xfUpheg=;
        b=1PhDJ3xQqLMm9MkP+VHbd7zeI5LdsGcdvdU2153IQptlk6uZkdd1YMerdI78t7G3E+
         TA4/bs9N5pYgbJi2+rr8gjy92yWhFgQb0ZPaYmXHOIgm1lzPS0hsIDWdKlTn7s3zJJtl
         NkWS3Z1Pdn8r4cbewKuL5K0i+mAE1cLO5nD5DGJYosQT89kWXzIvzbMqwZHN1oPPpeVw
         PNUWpVW9uitxyKjZ52fZbueXKn5wZ0lbVgI0Vyk3JWvJ1wjmRRLC93Zv/6I8dIE1gYdL
         79JdbiDnDQcVXDOC3Btmx05YhhXmdsQxJuHUt5LqvWz7ZzCuBqp1mUwA4gHxafQOp4pR
         /fxQ==
X-Gm-Message-State: ACrzQf0mP0OanYl1ysSBeVqDTb4fdXd/VKsXagsCsO8roo9P4dVhUJyH
	McunaDviEQWlEVVgR+qy+TBaZg==
X-Google-Smtp-Source: AMsMyM7GI20M1DkrCHHPZWF7On1eDILIzgkIsk3u76ZoQXKutoYqkqtDCydpDuEe5T/fviFsBjXNiw==
X-Received: by 2002:a05:600c:1c1f:b0:3c6:bfda:d485 with SMTP id j31-20020a05600c1c1f00b003c6bfdad485mr3852252wms.59.1665760823841;
        Fri, 14 Oct 2022 08:20:23 -0700 (PDT)
Received: from [127.0.0.1] (2a02-8440-6241-7429-3074-96af-9642-0004.rev.sfr.net. [2a02:8440:6241:7429:3074:96af:9642:4])
        by smtp.gmail.com with ESMTPSA id z11-20020a05600c0a0b00b003c6bd91caa5sm2818223wmp.17.2022.10.14.08.20.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Oct 2022 08:20:23 -0700 (PDT)
From: Guillaume Ranquet <granquet@baylibre.com>
Date: Fri, 14 Oct 2022 17:16:05 +0200
Subject: [PATCH v2 12/12] drm/mediatek: dpi: Add mt8195 hdmi to DPI driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20220919-v2-12-8419dcf4f09d@baylibre.com>
References: <20220919-v2-0-8419dcf4f09d@baylibre.com>
In-Reply-To: <20220919-v2-0-8419dcf4f09d@baylibre.com>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, David Airlie <airlied@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Jitao shi <jitao.shi@mediatek.com>, CK Hu <ck.hu@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@ti.com>, Matthias Brugger <matthias.bgg@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Guillaume Ranquet <granquet@baylibre.com>, stuart.lee@mediatek.com, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, mac.shen@mediatek.com, linux-mediatek@lists.infradead.org,
 dri-devel@lists.freedesktop.org
X-Mailer: b4 0.11.0-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221014_162026_606294_D186ECB4 
X-CRM114-Status: GOOD (  20.05  )
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

Add the DPI1 hdmi path support in mtk dpi driver

Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
---
 drivers/gpu/drm/mediatek/mtk_dpi.c      | 143 ++++++++++++++++++++++++++++++--
 drivers/gpu/drm/mediatek/mtk_dpi_regs.h |   5 ++
 2 files changed, 141 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index 508a6d994e83..8052b47042b8 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
@@ -14,7 +14,10 @@
 #include <linux/of_graph.h>
 #include <linux/pinctrl/consumer.h>
 #include <linux/platform_device.h>
+#include <linux/reset.h>
 #include <linux/types.h>
+#include <linux/regmap.h>
+#include <linux/mfd/syscon.h>
 
 #include <video/videomode.h>
 
@@ -65,10 +68,14 @@ struct mtk_dpi {
 	struct drm_bridge *next_bridge;
 	struct drm_connector *connector;
 	void __iomem *regs;
+	struct reset_control *reset_ctl;
 	struct device *dev;
 	struct clk *engine_clk;
+	struct clk *dpi_ck_cg;
 	struct clk *pixel_clk;
+	struct clk *dpi_sel_clk;
 	struct clk *tvd_clk;
+	struct clk *hdmi_cg;
 	int irq;
 	struct drm_display_mode mode;
 	const struct mtk_dpi_conf *conf;
@@ -134,6 +141,7 @@ struct mtk_dpi_yc_limit {
  * @yuv422_en_bit: Enable bit of yuv422.
  * @csc_enable_bit: Enable bit of CSC.
  * @pixels_per_iter: Quantity of transferred pixels per iteration.
+ * @is_internal_hdmi: True if this DPI block is directly connected to SoC internal HDMI block
  */
 struct mtk_dpi_conf {
 	unsigned int (*cal_factor)(int clock);
@@ -152,6 +160,7 @@ struct mtk_dpi_conf {
 	u32 yuv422_en_bit;
 	u32 csc_enable_bit;
 	u32 pixels_per_iter;
+	bool is_internal_hdmi;
 };
 
 static void mtk_dpi_mask(struct mtk_dpi *dpi, u32 offset, u32 val, u32 mask)
@@ -465,8 +474,15 @@ static void mtk_dpi_power_off(struct mtk_dpi *dpi)
 		pinctrl_select_state(dpi->pinctrl, dpi->pins_gpio);
 
 	mtk_dpi_disable(dpi);
+
+	reset_control_rearm(dpi->reset_ctl);
+
 	clk_disable_unprepare(dpi->pixel_clk);
 	clk_disable_unprepare(dpi->engine_clk);
+	clk_disable_unprepare(dpi->dpi_sel_clk);
+	clk_disable_unprepare(dpi->dpi_ck_cg);
+	clk_disable_unprepare(dpi->hdmi_cg);
+	clk_disable_unprepare(dpi->tvd_clk);
 }
 
 static int mtk_dpi_power_on(struct mtk_dpi *dpi)
@@ -482,12 +498,44 @@ static int mtk_dpi_power_on(struct mtk_dpi *dpi)
 		goto err_refcount;
 	}
 
+	ret = clk_prepare_enable(dpi->dpi_sel_clk);
+	if (ret) {
+		dev_err(dpi->dev, "failed to enable dpi_sel clock: %d\n", ret);
+		goto err_refcount;
+	}
+
+	ret = clk_prepare_enable(dpi->tvd_clk);
+	if (ret) {
+		dev_err(dpi->dev, "Failed to enable tvd pll: %d\n", ret);
+		goto err_tvd;
+	}
+
+	ret = clk_prepare_enable(dpi->engine_clk);
+	if (ret) {
+		dev_err(dpi->dev, "Failed to enable engine clock: %d\n", ret);
+		goto err_engine;
+	}
+
+	ret = clk_prepare_enable(dpi->hdmi_cg);
+	if (ret) {
+		dev_err(dpi->dev, "Failed to enable hdmi_cg clock: %d\n", ret);
+		goto err_hdmi_cg;
+	}
+
+	ret = clk_prepare_enable(dpi->dpi_ck_cg);
+	if (ret) {
+		dev_err(dpi->dev, "Failed to enable dpi_ck_cg clock: %d\n", ret);
+		goto err_ck_cg;
+	}
+
 	ret = clk_prepare_enable(dpi->pixel_clk);
 	if (ret) {
 		dev_err(dpi->dev, "Failed to enable pixel clock: %d\n", ret);
 		goto err_pixel;
 	}
 
+	reset_control_reset(dpi->reset_ctl);
+
 	if (dpi->pinctrl && dpi->pins_dpi)
 		pinctrl_select_state(dpi->pinctrl, dpi->pins_dpi);
 
@@ -495,6 +543,15 @@ static int mtk_dpi_power_on(struct mtk_dpi *dpi)
 
 err_pixel:
 	clk_disable_unprepare(dpi->engine_clk);
+	clk_disable_unprepare(dpi->dpi_ck_cg);
+err_ck_cg:
+	clk_disable_unprepare(dpi->hdmi_cg);
+err_hdmi_cg:
+	clk_disable_unprepare(dpi->engine_clk);
+err_engine:
+	clk_disable_unprepare(dpi->tvd_clk);
+err_tvd:
+	clk_disable_unprepare(dpi->dpi_sel_clk);
 err_refcount:
 	dpi->refcount--;
 	return ret;
@@ -538,7 +595,6 @@ static int mtk_dpi_set_display_mode(struct mtk_dpi *dpi,
 	else
 		clk_set_rate(dpi->pixel_clk, vm.pixelclock);
 
-
 	vm.pixelclock = clk_get_rate(dpi->pixel_clk);
 
 	dev_dbg(dpi->dev, "Got  PLL %lu Hz, pixel clock %lu Hz\n",
@@ -605,7 +661,16 @@ static int mtk_dpi_set_display_mode(struct mtk_dpi *dpi,
 	if (dpi->conf->support_direct_pin) {
 		mtk_dpi_config_yc_map(dpi, dpi->yc_map);
 		mtk_dpi_config_2n_h_fre(dpi);
-		mtk_dpi_dual_edge(dpi);
+		/* DPI could be connecting to external bridge
+		 * or internal HDMI encoder. */
+		if (dpi->conf->is_internal_hdmi) {
+			mtk_dpi_mask(dpi, DPI_CON, DPI_OUTPUT_1T1P_EN,
+				     DPI_OUTPUT_1T1P_EN);
+			mtk_dpi_mask(dpi, DPI_CON, DPI_INPUT_2P_EN,
+				     DPI_INPUT_2P_EN);
+		} else {
+			mtk_dpi_dual_edge(dpi);
+		}
 		mtk_dpi_config_disable_edge(dpi);
 	}
 	if (dpi->conf->input_2pixel) {
@@ -720,7 +785,10 @@ static void mtk_dpi_bridge_disable(struct drm_bridge *bridge)
 {
 	struct mtk_dpi *dpi = bridge_to_dpi(bridge);
 
-	mtk_dpi_power_off(dpi);
+	if (dpi->conf->is_internal_hdmi)
+		mtk_dpi_power_off(dpi);
+	else
+		mtk_dpi_disable(dpi);
 }
 
 static void mtk_dpi_bridge_enable(struct drm_bridge *bridge)
@@ -763,14 +831,16 @@ void mtk_dpi_start(struct device *dev)
 {
 	struct mtk_dpi *dpi = dev_get_drvdata(dev);
 
-	mtk_dpi_power_on(dpi);
+	if (!dpi->conf->is_internal_hdmi)
+		mtk_dpi_power_on(dpi);
 }
 
 void mtk_dpi_stop(struct device *dev)
 {
 	struct mtk_dpi *dpi = dev_get_drvdata(dev);
 
-	mtk_dpi_power_off(dpi);
+	if (!dpi->conf->is_internal_hdmi)
+		mtk_dpi_power_off(dpi);
 }
 
 static int mtk_dpi_bind(struct device *dev, struct device *master, void *data)
@@ -853,6 +923,11 @@ static unsigned int mt8183_calculate_factor(int clock)
 		return 2;
 }
 
+static unsigned int mt8195_calculate_factor(int clock)
+{
+	return 1;
+}
+
 static unsigned int mt8195_dpintf_calculate_factor(int clock)
 {
 	if (clock < 70000)
@@ -946,6 +1021,24 @@ static const struct mtk_dpi_conf mt8192_conf = {
 	.csc_enable_bit = CSC_ENABLE,
 };
 
+static const struct mtk_dpi_conf mt8195_conf = {
+	.cal_factor = mt8195_calculate_factor,
+	.max_clock_khz = 594000,
+	.reg_h_fre_con = 0xe0,
+	.output_fmts = mt8183_output_fmts,
+	.num_output_fmts = ARRAY_SIZE(mt8183_output_fmts),
+	.pixels_per_iter = 1,
+	.is_ck_de_pol = true,
+	.swap_input_support = true,
+	.dimension_mask = HPW_MASK,
+	.hvsize_mask = HSIZE_MASK,
+	.channel_swap_shift = CH_SWAP,
+	.yuv422_en_bit = YUV422_EN,
+	.csc_enable_bit = CSC_ENABLE,
+	.is_internal_hdmi = true,
+	.support_direct_pin = true,
+};
+
 static const struct mtk_dpi_conf mt8195_dpintf_conf = {
 	.cal_factor = mt8195_dpintf_calculate_factor,
 	.max_clock_khz = 600000,
@@ -1003,6 +1096,12 @@ static int mtk_dpi_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	dpi->reset_ctl = devm_reset_control_get_optional_exclusive(dev, "dpi_on");
+	if (IS_ERR(dpi->reset_ctl)) {
+		dev_err(dev, "Failed to get reset_ctl: %ld\n", PTR_ERR(dpi->reset_ctl));
+		return PTR_ERR(dpi->reset_ctl);
+	}
+
 	dpi->engine_clk = devm_clk_get(dev, "engine");
 	if (IS_ERR(dpi->engine_clk)) {
 		ret = PTR_ERR(dpi->engine_clk);
@@ -1012,7 +1111,26 @@ static int mtk_dpi_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	dpi->pixel_clk = devm_clk_get(dev, "pixel");
+	dpi->hdmi_cg = devm_clk_get_optional(dev, "hdmi_cg");
+	if (IS_ERR(dpi->hdmi_cg)) {
+		ret = PTR_ERR(dpi->hdmi_cg);
+		if (ret != -EPROBE_DEFER)
+			dev_err(dev, "Failed to get hdmi_cg clock: %d\n", ret);
+
+		return ret;
+	}
+
+	dpi->dpi_ck_cg = devm_clk_get_optional(dev, "ck_cg");
+	if (IS_ERR(dpi->dpi_ck_cg)) {
+		ret = PTR_ERR(dpi->dpi_ck_cg);
+		if (ret != -EPROBE_DEFER)
+			dev_err(dev, "Failed to get dpi ck cg clock: %d\n",
+				ret);
+
+		return ret;
+	}
+
+	dpi->pixel_clk = devm_clk_get_optional(dev, "pixel");
 	if (IS_ERR(dpi->pixel_clk)) {
 		ret = PTR_ERR(dpi->pixel_clk);
 		if (ret != -EPROBE_DEFER)
@@ -1021,7 +1139,7 @@ static int mtk_dpi_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	dpi->tvd_clk = devm_clk_get(dev, "pll");
+	dpi->tvd_clk = devm_clk_get_optional(dev, "pll");
 	if (IS_ERR(dpi->tvd_clk)) {
 		ret = PTR_ERR(dpi->tvd_clk);
 		if (ret != -EPROBE_DEFER)
@@ -1030,6 +1148,14 @@ static int mtk_dpi_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	dpi->dpi_sel_clk = devm_clk_get_optional(dev, "dpi_sel");
+	if (IS_ERR(dpi->dpi_sel_clk)) {
+		ret = PTR_ERR(dpi->dpi_sel_clk);
+		dev_err_probe(dev, ret, "Failed to get dpi_Sel_clk clock: %d\n", ret);
+
+		return ret;
+	}
+
 	dpi->irq = platform_get_irq(pdev, 0);
 	if (dpi->irq <= 0)
 		return -EINVAL;
@@ -1085,6 +1211,9 @@ static const struct of_device_id mtk_dpi_of_ids[] = {
 	{ .compatible = "mediatek,mt8195-dp-intf",
 	  .data = &mt8195_dpintf_conf,
 	},
+	{ .compatible = "mediatek,mt8195-dpi",
+	  .data = &mt8195_conf,
+	},
 	{ },
 };
 MODULE_DEVICE_TABLE(of, mtk_dpi_of_ids);
diff --git a/drivers/gpu/drm/mediatek/mtk_dpi_regs.h b/drivers/gpu/drm/mediatek/mtk_dpi_regs.h
index 62bd4931b344..653ef4b93a97 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi_regs.h
+++ b/drivers/gpu/drm/mediatek/mtk_dpi_regs.h
@@ -43,6 +43,11 @@
 #define DPINTF_YUV422_EN		BIT(24)
 #define DPINTF_CSC_ENABLE		BIT(26)
 #define DPINTF_INPUT_2P_EN		BIT(29)
+#define DPI_OUTPUT_1T1P_EN		BIT(24)
+#define DPI_INPUT_2P_EN			BIT(25)
+#define DPI_EXT_VSYNC_EN		BIT(26)
+#define DPI_RGB565_EN			BIT(27)
+#define DPI_RGB880_EN			BIT(28)
 
 #define DPI_OUTPUT_SETTING	0x14
 #define CH_SWAP				0

-- 
b4 0.11.0-dev

