Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65ABAC001E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Oct 2023 14:41:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lrjsDP60ERtc9IKYDTr7nIZNfIMcm83JakwGPMNEVVw=; b=ZWrd9+pF5E+Pq41vh7UKrL58qI
	qdKU3PS9NTlslcrah1+fGeZJ0muV9qp+9lp38IWqQFE2dzpymzwWjc5aYFKD9xZCnUqTp7lJugHJt
	h2fvD2QTfQCxgwa9d9zeLmVes1BITud+rKBVRsB5k73Hu4SfYup+kTZEm8q+p+lTG8XP/fLVl+vx1
	CkFTzjEGeLbRikHlpjFSnPyduYanCqcFQkB4zTQR1M5+aIn5+EL29n7dFnRHzv6HhfVtQjS/Zf+0Z
	Tlp7EY+Ui4db5IDmS8minKd4RXLw20MSz60oKfsRstbj+zoEi+JZtcgNKdJLBZob5PN5NCIHiG9K/
	o6FhN20A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1quw7x-007aY3-2i;
	Mon, 23 Oct 2023 14:41:57 +0000
Received: from mail-ua1-x935.google.com ([2607:f8b0:4864:20::935])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1quw7A-007Zse-36
	for linux-mediatek@lists.infradead.org;
	Mon, 23 Oct 2023 14:41:10 +0000
Received: by mail-ua1-x935.google.com with SMTP id a1e0cc1a2514c-7b6eda04180so976824241.3
        for <linux-mediatek@lists.infradead.org>; Mon, 23 Oct 2023 07:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1698072067; x=1698676867; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lrjsDP60ERtc9IKYDTr7nIZNfIMcm83JakwGPMNEVVw=;
        b=lsYtRRKdHWuvS7Q1Py3t0G1TsCClZamqiy1XEHN99xG0m/VIBYHtZ44IhbUU7A8HVi
         wJ0kxofW/XqF5CLXEdavGYyRJ98tU2YfZlv+pKQzaTQdEWX/NOXQMfofe0d/UnvqQBEy
         LJd4bM78wE4I9q9mPX4awZIOjIYVo0iMZsWw8cULCPapRW/x42m0yG7oA2Fn0vuFUFnE
         IDe4xp2DTpDDil+K955x+y27vI4CNCDfzY3HQJbpPYZaJt3diTHDxR+9sUNiT+NBtKPW
         MFf+4+nc3EYQnjAUAzc2JqbWfwPw3dMQDSCA40apqEAJiRQPT3MFBTQINoU2p9vHnalT
         s4/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698072067; x=1698676867;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lrjsDP60ERtc9IKYDTr7nIZNfIMcm83JakwGPMNEVVw=;
        b=OaUJW5fanjtOcdN9iltp5fP3zFQB39PUh34Pv2FXWNoOn0uFd1LPSQ3N2lwTNWD6t8
         ynZDFYq+PF2KNqLtwgvh3bJsqVr4MMGe++MRCU1eFRD+Cz43McgBfF+qAOqEnD51owhc
         GtFVB1fBwXltmMYJOsAY/NwvHaqGLZyC0z6//E2XyBDDJ/SmK7WxHb7UvBzS5qru2Wwc
         AO3KTC9DEl+AJ7/QEc8dfi+OMVHgtjuZxUuuK/aEjozqU/nmf96z6xJogBe8wYfjs4lD
         JMPSzksxGRQ2KJaDoZ9g/8+8ObPvuX4Tke792z6bn5ONNvuX7Z8g0kbpcKFOzhNe5ddg
         2yGw==
X-Gm-Message-State: AOJu0YxBG1nDO9PCGE7hq3cbQtgmXVVRyVXZUBaGvsKeXBv8wcVeD0Ul
	Hzamt2ff5/xrYUREUMqTH44N/g==
X-Google-Smtp-Source: AGHT+IFCZPHLErko3PXnNt9gQ8dzsRqAd72bTaozBkI3aLRX3aVqekVz0T9UEND3nPPNVWsw1x/D5g==
X-Received: by 2002:a05:6102:2089:b0:458:32f7:30ad with SMTP id h9-20020a056102208900b0045832f730admr8598946vsr.24.1698072067569;
        Mon, 23 Oct 2023 07:41:07 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id f1-20020a05620a408100b007789a3499casm2725020qko.115.2023.10.23.07.41.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Oct 2023 07:41:07 -0700 (PDT)
From: amergnat@baylibre.com
Date: Mon, 23 Oct 2023 16:40:14 +0200
Subject: [PATCH 14/18] drm/mediatek: dpi: add support for dpi clock
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231023-display-support-v1-14-5c860ed5c33b@baylibre.com>
References: <20231023-display-support-v1-0-5c860ed5c33b@baylibre.com>
In-Reply-To: <20231023-display-support-v1-0-5c860ed5c33b@baylibre.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jitao Shi <jitao.shi@mediatek.com>, Xinlei Lee <xinlei.lee@mediatek.com>, 
 CK Hu <ck.hu@mediatek.com>, Thierry Reding <thierry.reding@gmail.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org, 
 Alexandre Mergnat <amergnat@baylibre.com>, 
 Fabien Parent <fparent@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5504; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=gNNMmG/tic5FCAz01Mxk94pBODEehb9j1DvbosxWwjM=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBlNoXPtvxxoh6jBrTsWy5g9sqziSKeYRBQSeK2X9qj
 pLF6+oGJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZTaFzwAKCRArRkmdfjHURTkGD/
 9aHtaIPalJ9hCBJVp5Cm+eMJS63WzvlzUNGpmZTUXItS7gLNhiSr5M9Ygkx2cEbtyjitdJsef3ebnI
 CbVf/pWb3thpVnIj2emA0T4Ft/AvZDt5A69fkPmF0PrrVI1d7IPf336AX5AIsJKIlB+cchIXGi4oOh
 VcSTryoyVCGkKCmID4fVfNyVHV1Fxw1dTipJbS12OvX9fwfCclZHjoikr/B8G6xSopAC66omgAJTbD
 GJ/nV8ATBffGjCldK8zWsdXhnhMdOVG4nJgjN18FH8IgkPRd8e4/U6SX0Qj/NdTphyWitHWxmt8a3J
 2LyqB+lcQ49WBFaLOs7qxG1u1ZCZyElHol4PLbjye0nJdWyNlnMW7yTbODQgwaMpJ4s0/SHlV2+c6o
 4Z0L64Ie/RWZdHX3gXB2q+MZJKcx7lpbST/D3q4GumpmPewlHH95Z8ewyluHzWINNM4FSfWCszIE/a
 I9xFyVeZB1Qo1hzvaVrEj+u9Wtko52r9LNrmvJi+Yds9DdVxwMkDwuPGCF3SdSeEv/sHVvPbrGkXTw
 Ni1R85QW/UwDwmlAqvlu6ntr0MwqOwZ6Qy6BTGrKnXRTfxP9iAlV3E1beT/pOqKF0gY69zplnECvOy
 j9CUjsKAn7VaC/s6pr6m0Yx1QK6UQhrO3tl4u84dpMgDExKgpTM/DcDiEkCQ==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231023_074109_039839_83B0CF59 
X-CRM114-Status: GOOD (  18.22  )
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

MT8365 requires an additional clock for DPI. Add support for that
additional clock.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 drivers/gpu/drm/mediatek/mtk_dpi.c | 50 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 49 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index 2f931e4e2b60..ddd7c54febe6 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
@@ -70,6 +70,7 @@ struct mtk_dpi {
 	struct device *mmsys_dev;
 	struct clk *engine_clk;
 	struct clk *pixel_clk;
+	struct clk *dpi_clk;
 	struct clk *tvd_clk;
 	int irq;
 	struct drm_display_mode mode;
@@ -137,6 +138,7 @@ struct mtk_dpi_yc_limit {
  * @csc_enable_bit: Enable bit of CSC.
  * @pixels_per_iter: Quantity of transferred pixels per iteration.
  * @edge_cfg_in_mmsys: If the edge configuration for DPI's output needs to be set in MMSYS.
+ * @is_dpi_clk_req: Support the additionnal DPI clock.
  */
 struct mtk_dpi_conf {
 	unsigned int (*cal_factor)(int clock);
@@ -156,6 +158,7 @@ struct mtk_dpi_conf {
 	u32 csc_enable_bit;
 	u32 pixels_per_iter;
 	bool edge_cfg_in_mmsys;
+	bool is_dpi_clk_req;
 };
 
 static void mtk_dpi_mask(struct mtk_dpi *dpi, u32 offset, u32 val, u32 mask)
@@ -472,6 +475,7 @@ static void mtk_dpi_power_off(struct mtk_dpi *dpi)
 	mtk_dpi_disable(dpi);
 	clk_disable_unprepare(dpi->pixel_clk);
 	clk_disable_unprepare(dpi->engine_clk);
+	clk_disable_unprepare(dpi->dpi_clk);
 }
 
 static int mtk_dpi_power_on(struct mtk_dpi *dpi)
@@ -481,10 +485,16 @@ static int mtk_dpi_power_on(struct mtk_dpi *dpi)
 	if (++dpi->refcount != 1)
 		return 0;
 
+	ret = clk_prepare_enable(dpi->dpi_clk);
+	if (ret) {
+		dev_err(dpi->dev, "failed to enable dpi clock: %d\n", ret);
+		goto err_refcount;
+	}
+
 	ret = clk_prepare_enable(dpi->engine_clk);
 	if (ret) {
 		dev_err(dpi->dev, "Failed to enable engine clock: %d\n", ret);
-		goto err_refcount;
+		goto err_engine;
 	}
 
 	ret = clk_prepare_enable(dpi->pixel_clk);
@@ -497,6 +507,8 @@ static int mtk_dpi_power_on(struct mtk_dpi *dpi)
 
 err_pixel:
 	clk_disable_unprepare(dpi->engine_clk);
+err_engine:
+	clk_disable_unprepare(dpi->dpi_clk);
 err_refcount:
 	dpi->refcount--;
 	return ret;
@@ -902,6 +914,7 @@ static const struct mtk_dpi_conf mt8173_conf = {
 	.channel_swap_shift = CH_SWAP,
 	.yuv422_en_bit = YUV422_EN,
 	.csc_enable_bit = CSC_ENABLE,
+	.is_dpi_clk_req = false,
 };
 
 static const struct mtk_dpi_conf mt2701_conf = {
@@ -920,6 +933,7 @@ static const struct mtk_dpi_conf mt2701_conf = {
 	.channel_swap_shift = CH_SWAP,
 	.yuv422_en_bit = YUV422_EN,
 	.csc_enable_bit = CSC_ENABLE,
+	.is_dpi_clk_req = false,
 };
 
 static const struct mtk_dpi_conf mt8183_conf = {
@@ -937,6 +951,7 @@ static const struct mtk_dpi_conf mt8183_conf = {
 	.channel_swap_shift = CH_SWAP,
 	.yuv422_en_bit = YUV422_EN,
 	.csc_enable_bit = CSC_ENABLE,
+	.is_dpi_clk_req = false,
 };
 
 static const struct mtk_dpi_conf mt8186_conf = {
@@ -969,6 +984,7 @@ static const struct mtk_dpi_conf mt8188_dpintf_conf = {
 	.channel_swap_shift = DPINTF_CH_SWAP,
 	.yuv422_en_bit = DPINTF_YUV422_EN,
 	.csc_enable_bit = DPINTF_CSC_ENABLE,
+	.is_dpi_clk_req = false,
 };
 
 static const struct mtk_dpi_conf mt8192_conf = {
@@ -986,6 +1002,7 @@ static const struct mtk_dpi_conf mt8192_conf = {
 	.channel_swap_shift = CH_SWAP,
 	.yuv422_en_bit = YUV422_EN,
 	.csc_enable_bit = CSC_ENABLE,
+	.is_dpi_clk_req = false,
 };
 
 static const struct mtk_dpi_conf mt8195_dpintf_conf = {
@@ -1000,6 +1017,25 @@ static const struct mtk_dpi_conf mt8195_dpintf_conf = {
 	.channel_swap_shift = DPINTF_CH_SWAP,
 	.yuv422_en_bit = DPINTF_YUV422_EN,
 	.csc_enable_bit = DPINTF_CSC_ENABLE,
+	.is_dpi_clk_req = false,
+};
+
+static const struct mtk_dpi_conf mt8365_conf = {
+	.cal_factor = mt8183_calculate_factor,
+	.channel_swap_shift = CH_SWAP,
+	.csc_enable_bit = CSC_ENABLE,
+	.dimension_mask = HPW_MASK,
+	.hvsize_mask = HSIZE_MASK,
+	.is_ck_de_pol = true,
+	.is_dpi_clk_req = true,
+	.max_clock_khz = 150000,
+	.num_output_fmts = ARRAY_SIZE(mt8183_output_fmts),
+	.output_fmts = mt8183_output_fmts,
+	.pixels_per_iter = 1,
+	.reg_h_fre_con = 0xe0,
+	.support_direct_pin = true,
+	.swap_input_support = true,
+	.yuv422_en_bit = YUV422_EN,
 };
 
 static int mtk_dpi_probe(struct platform_device *pdev)
@@ -1056,6 +1092,17 @@ static int mtk_dpi_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(dpi->tvd_clk),
 				     "Failed to get tvdpll clock\n");
 
+	if (dpi->conf->is_dpi_clk_req) {
+		dpi->dpi_clk = devm_clk_get(dev, "dpi");
+		if (IS_ERR(dpi->dpi_clk)) {
+			ret = PTR_ERR(dpi->dpi_clk);
+			if (ret != -EPROBE_DEFER)
+				dev_err(dev, "Failed to get dpi clock: %d\n", ret);
+
+			return ret;
+		}
+	}
+
 	dpi->irq = platform_get_irq(pdev, 0);
 	if (dpi->irq < 0)
 		return dpi->irq;
@@ -1097,6 +1144,7 @@ static const struct of_device_id mtk_dpi_of_ids[] = {
 	{ .compatible = "mediatek,mt8188-dp-intf", .data = &mt8188_dpintf_conf },
 	{ .compatible = "mediatek,mt8192-dpi", .data = &mt8192_conf },
 	{ .compatible = "mediatek,mt8195-dp-intf", .data = &mt8195_dpintf_conf },
+	{ .compatible = "mediatek,mt8365-dpi", .data = &mt8365_conf },
 	{ /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, mtk_dpi_of_ids);

-- 
2.25.1


