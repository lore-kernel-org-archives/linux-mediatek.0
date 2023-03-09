Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E66FBC64EC4
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Mar 2023 14:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=alc5ZV/1pwYoBZ2ycwbaMzjt9nufHBTeIsNkvP9Z/qA=; b=SALez3XUYF16ilCm4OxOsfwiDL
	2IpT1UQuSy6t+78To7LdFHLORzvXy7vQyszDQue0d7lYs8iBBe/wWbTPm6QrR995SE9Jq+06sUCtM
	kxdoNHIopZmz3hYD5hUvHm142yw6W97fdJ0kr0El48dRnLj9c4nrRCB1vCPFUfvY6EV8gCr/ceX8C
	N2mQbd/QXR64YyT17drwfuufwxxDJuOGYsRkB+5hEsUeRevjU9qQBQ1omXJThUslYvSLsuL5akdPh
	dK35MLWqqxT8HlmZ0JLPbeV3xG77qQGOAmfObPuFA7dyyxEc4VUqjXT95N84cn1S26Zmv0EyP52Qg
	z0thzwGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paHcb-00Agc4-DM; Thu, 09 Mar 2023 14:51:57 +0000
Received: from desiato.infradead.org ([90.155.92.199])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paHWq-00Ae6k-QF
	for linux-mediatek@bombadil.infradead.org; Thu, 09 Mar 2023 14:46:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=alc5ZV/1pwYoBZ2ycwbaMzjt9nufHBTeIsNkvP9Z/qA=; b=lAfbHezEwiZMtwn1R8MdTroWQ0
	wjbjOYvpTUwtdyYxkHTYJL22aZbywKLJKSrhr//wm9Gw3Yve7F1hVzAwBXlVquUeE3iKkIUYehSAa
	p9C7rAYWGrzobzdBsO6cME5Wy2cCmACGMJN6qv9+nmds/27kwpHCNToy3TbyvYM+kkKspJtaFC/bB
	V6uTJvZVPx9qkTXgQP+0EY9baLpkI3IdaucwjaFmP42CnA39PJpeSPdckARzt1Pik9DtDL6dO+B00
	IHPJ9fyVLfbnFTnR/5F96p6ih+TspxXOlsn5VU0Rn/l8Lr4WjkvQVIDUc3S9oy7ULtBztryIfLK9G
	Y0ryR8tQ==;
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1paHAt-0008UF-28
	for linux-mediatek@lists.infradead.org;
	Thu, 09 Mar 2023 14:23:22 +0000
Received: by mail-wm1-x331.google.com with SMTP id o11-20020a05600c4fcb00b003eb33ea29a8so1363694wmq.1
        for <linux-mediatek@lists.infradead.org>; Thu, 09 Mar 2023 06:23:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1678371799;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=alc5ZV/1pwYoBZ2ycwbaMzjt9nufHBTeIsNkvP9Z/qA=;
        b=vua8HsX6kKMtxhCOPTEhPvzbt17dD3wWW2uq5glryvHByylmTsLCpgU5WM3WNUF0cO
         wzB0FSV8uUa3MMF/4Qqfieq/XGppreoONGRPZCL/kiKdsvqtHrasMq8I4AMYTux85uAW
         CyVoGBsp3ybkrMGZ80QS+feAsGNiiJf7FFmYXyPMbPBB1gn54JyAv2A5LEYoaTXZNVlA
         qq4RT02R0VXjUZyn8ClKB4blQNYyF9CncPLPwOP8KqylLsvT7kkNrWqYZPyCD0hqn/Bg
         EHen2OuYqWhqANYBCYFF56aErhBRzfRI5EGHKGzmlCwnGuy2LcUlaAcfY5EchL2QinhX
         JZEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678371799;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=alc5ZV/1pwYoBZ2ycwbaMzjt9nufHBTeIsNkvP9Z/qA=;
        b=u3ZJd2NPapNLDlpnDEFzgot0DUR5xWbzKDNgNiaxgC3KZHCqwuX2iC49+7ACAFseJ+
         5APU5C1puDwYTOYgVqccuYTnPzW/95CIpwNeLLhEs6g/d6QfyAOFHD+NBCHIMcM1aCr2
         FJPRFG0kifqsUr/+nsIMGo4Jz9YkvkbRUCrLSlHj+3zFnzaSG7Ln2rjzXIu4ZsiByK2Y
         V5AtM781/R3EqI5d6ARi6YB76duywoyHPE13Otk4v36FMk4WpiStYdaUR8vmlR1jdWzn
         3ItODxlnvDDTVfRsGowWzGyAuXAvl4X0bhTBLFWSCiLLugokWxQxsBEA3ZI74pirrJ0L
         2Gfw==
X-Gm-Message-State: AO0yUKXq9k9+YauCQyYhJQ2726ZkwFa2BatsqJ1ZUs4Wm6y6ur/R9jE6
	uXPt3/sVKj1LHwg9gN86KP/W7Q==
X-Google-Smtp-Source: AK7set9YP71aZ+iDxfdYv7zEaWCrl4hWKev1CRBj3uDH+u/8sul7d53lYUV5ewUWAi7P0urgT2YqQA==
X-Received: by 2002:a05:600c:1c05:b0:3eb:4501:6c60 with SMTP id j5-20020a05600c1c0500b003eb45016c60mr15940998wms.5.1678371799212;
        Thu, 09 Mar 2023 06:23:19 -0800 (PST)
Received: from [127.0.1.1] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.googlemail.com with ESMTPSA id x22-20020a1c7c16000000b003e8dc7a03basm2772434wmc.41.2023.03.09.06.23.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 06:23:18 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Thu, 09 Mar 2023 15:23:08 +0100
Subject: [PATCH 19/21] drm/mediatek: dpi: add support for dpi clock
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20230220-display-v1-19-45cbc68e188b@baylibre.com>
References: <20230220-display-v1-0-45cbc68e188b@baylibre.com>
In-Reply-To: <20230220-display-v1-0-45cbc68e188b@baylibre.com>
To: Daniel Vetter <daniel@ffwll.ch>, CK Hu <ck.hu@mediatek.com>, Jitao Shi <jitao.shi@mediatek.com>,
 Thierry Reding <thierry.reding@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, Sam Ravnborg <sam@ravnborg.org>,
 Rob Herring <robh+dt@kernel.org>, Uwe Kleine-König <u.kleine-koenig@pengutronix.de>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, David Airlie <airlied@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Xinlei Lee <xinlei.lee@mediatek.com>
Cc: Guillaume La Roque <glaroque@baylibre.com>, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Alexandre Mergnat <amergnat@baylibre.com>, dri-devel@lists.freedesktop.org, Fabien Parent <fparent@baylibre.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.10.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2131; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=LHehVthqafMFi2shlzhoL6bucBM/8YioVECWdgiMt+E=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBkCeu+fJd/zbdyiR8zrIOwZ5qUWp3Pc/rEc2f1zcfE
 aU7fNHSJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZAnrvgAKCRArRkmdfjHURZKiEA
 Cbnd4JuCuoVv+myBWfMfN+Xe/5r43m//AH/pF0zz/dKWYHjR21eVuBr2nkywXEB+R6j2g0EA1tvEI2
 3yHndYsPjOEMgSIHzwH7E0aCUJ9KN4wjI7mS1fPjFKO4JIyIB/BGm5v7JkokueaI+hiTDW1NzD4G8V
 mE5HCXCvQuTs3CcyLp1mzVcLkh0iFW5EralJF29N7+XvudmxfKgiHxzCYdzKOU+ErUZwBQJSOK4HHu
 7ApWDCfzG/zxWdFSFAsIcy4LZDzEQCrEIWYZut//aX5WxO1Ln91OcbSzGBDX1jQYG+NlP1be9QqJHc
 xGvtbyiG0+zs0t2tAyyPgBywfRZNtCgT57eIW+LZfmbyL00VxSeGQ3r8VFZYGrs6LHmoBPza/7bFcT
 LksH73pmIvnFNKBeUXKgrQedPu5alhwdM6AIgKyeoZ++dsWX8ExvfPh5w48CBL9j1kFL9c7KPsAa/y
 y86nqA9/KqWEBO+j2yI2a7dJJ97nDCrwG7S7FBva6uyi6ZdUrl9xgaq47ys9vp2ZJPo7oGtetIG3BZ
 OAEj1Jb+ykkZ0vRJQaME57g0bPcBpxlRdFfUm/e94AV5VnKFESWovJwX1MnbrBozQPX6Q9ukTsIuSb
 Yn7F69dk0F4Vnxbd9nT8ZzknfB4py9MAW8yY8lssErbBotFIGJpaPJqFnxlQ==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230309_142320_141742_B8122D3B 
X-CRM114-Status: GOOD (  14.46  )
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
 drivers/gpu/drm/mediatek/mtk_dpi.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index 4317595a15d1..474c6e5bbf04 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
@@ -68,6 +68,7 @@ struct mtk_dpi {
 	struct device *dev;
 	struct clk *engine_clk;
 	struct clk *pixel_clk;
+	struct clk *dpi_clk;
 	struct clk *tvd_clk;
 	int irq;
 	struct drm_display_mode mode;
@@ -464,6 +465,7 @@ static void mtk_dpi_power_off(struct mtk_dpi *dpi)
 	mtk_dpi_disable(dpi);
 	clk_disable_unprepare(dpi->pixel_clk);
 	clk_disable_unprepare(dpi->engine_clk);
+	clk_disable_unprepare(dpi->dpi_clk);
 }
 
 static int mtk_dpi_power_on(struct mtk_dpi *dpi)
@@ -473,10 +475,16 @@ static int mtk_dpi_power_on(struct mtk_dpi *dpi)
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
@@ -489,6 +497,8 @@ static int mtk_dpi_power_on(struct mtk_dpi *dpi)
 
 err_pixel:
 	clk_disable_unprepare(dpi->engine_clk);
+err_engine:
+	clk_disable_unprepare(dpi->dpi_clk);
 err_refcount:
 	dpi->refcount--;
 	return ret;
@@ -1044,6 +1054,12 @@ static int mtk_dpi_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	dpi->dpi_clk = devm_clk_get_optional(dev, "dpi");
+	if (IS_ERR(dpi->dpi_clk)) {
+		return dev_err_probe(dev, ret, "Failed to get dpi clock: %p\n",
+				     dpi->dpi_clk);
+	}
+
 	dpi->irq = platform_get_irq(pdev, 0);
 	if (dpi->irq <= 0)
 		return -EINVAL;

-- 
b4 0.10.1

