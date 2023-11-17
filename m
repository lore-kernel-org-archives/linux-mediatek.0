Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58E4AC5AD4C
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Nov 2023 09:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a5feH2/jkDCbwJZEcvQP2UexdyAXhgSRCA68qIaap+0=; b=E5Xgpp/vy4b4GYQaxqSKUCA1N6
	Nj/KK14c/teEijNhN626uCEeeeNfxMTgVdpGVUuvwh8kAotBHxdbSXJSFurGSbtI7vT8N2rVRvazG
	1wcxXC3t7pWqhXzxL2ShJtYygCY4ncB07Kz9S8Mr5pZQZzdQ2u6SYvM1oFuNcgEM8Lb5MGrtKHz9a
	gxkrrVHffF/m/BwZePNfuX2p1RC5L5VXMxkGosDNruH7lmplHnzj5vAsSSX2c4+vb5G6C2B2m263v
	re1DCrnIfMx1sWoNgfwJNDvAtmyD/VC8cEMRr+CxL8gQHTCwGjgkoSpWg7ay1P2aEo0gO9aA9iw5h
	ZYf224Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r3vNs-0067dL-1m;
	Fri, 17 Nov 2023 09:43:32 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r3vND-00670t-0a;
	Fri, 17 Nov 2023 09:42:53 +0000
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 1E94C6607398;
	Fri, 17 Nov 2023 09:42:49 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1700214169;
	bh=mvDbP9LsG0x+WjQA4KRWvixfVCE355+sCyiuJX+FpKc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BrNscpr3H8gtnvLMycWzXSDftQpQwnaxSmVNNPac2BpkGrvR5ZfjuYyCEAhaILwvA
	 2uPKBLjksdMUtRM69uxkXXLniW9aBmhw83Zemh42auXu7N1mEUcktX5YcmaYcUTVM6
	 Lcmb4dT9rar1ijTsKlqcvW5d2YfsmF+uHAI22xZJW9IHJjUqB5AHMIucj1V/2jGXoa
	 ah8uiWmzpqOzsAyZdgkY4BCPF72rAZlufmfz2HiXs3lD3DXJJjCyvQ36QBWsWaRNWg
	 c+DF5lrqtLI0B6x6rgW/VP7gKOxhLxarko3+lvv86f4Lgf0MkEYyChYeqX0cBfDJwH
	 +JrSQqk6kM0Ng==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Cc: krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	robh+dt@kernel.org,
	angelogioacchino.delregno@collabora.com,
	p.zabel@pengutronix.de,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com,
	wenst@chromium.org
Subject: [PATCH v1 15/20] soc: mediatek: mtk-svs: Cleanup of svs_probe() function
Date: Fri, 17 Nov 2023 10:42:23 +0100
Message-ID: <20231117094228.40013-16-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231117094228.40013-1-angelogioacchino.delregno@collabora.com>
References: <20231117094228.40013-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231117_014251_348456_39246DE2 
X-CRM114-Status: UNSURE (   9.54  )
X-CRM114-Notice: Please train this message.
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

Cleanup the svs_probe() function: use dev_err_probe() where possible,
change some efuse read failure gotos and then remove now impossible
IS_ERR_OR_NULL() checks (as they will never return true) for nvmem
(efuse read) failures.
Also remove some unnecessary blank lines.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/soc/mediatek/mtk-svs.c | 32 +++++++++++---------------------
 1 file changed, 11 insertions(+), 21 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-svs.c b/drivers/soc/mediatek/mtk-svs.c
index ac36c2efcafa..ae0cc22a2941 100644
--- a/drivers/soc/mediatek/mtk-svs.c
+++ b/drivers/soc/mediatek/mtk-svs.c
@@ -2775,14 +2775,13 @@ static int svs_probe(struct platform_device *pdev)
 	}
 
 	if (!svsp_data->efuse_parsing(svsp, svsp_data)) {
-		dev_err(svsp->dev, "efuse data parsing failed\n");
-		ret = -EPERM;
+		ret = dev_err_probe(svsp->dev, -EINVAL, "efuse data parsing failed\n");
 		goto svs_probe_free_tefuse;
 	}
 
 	ret = svs_bank_resource_setup(svsp);
 	if (ret) {
-		dev_err(svsp->dev, "svs bank resource setup fail: %d\n", ret);
+		dev_err_probe(svsp->dev, ret, "svs bank resource setup fail\n");
 		goto svs_probe_free_tefuse;
 	}
 
@@ -2794,43 +2793,40 @@ static int svs_probe(struct platform_device *pdev)
 
 	svsp->main_clk = devm_clk_get(svsp->dev, "main");
 	if (IS_ERR(svsp->main_clk)) {
-		dev_err(svsp->dev, "failed to get clock: %ld\n",
-			PTR_ERR(svsp->main_clk));
-		ret = PTR_ERR(svsp->main_clk);
+		ret = dev_err_probe(svsp->dev, PTR_ERR(svsp->main_clk),
+				    "failed to get clock\n");
 		goto svs_probe_free_tefuse;
 	}
 
 	ret = clk_prepare_enable(svsp->main_clk);
 	if (ret) {
-		dev_err(svsp->dev, "cannot enable main clk: %d\n", ret);
+		dev_err_probe(svsp->dev, ret, "cannot enable main clk\n");
 		goto svs_probe_free_tefuse;
 	}
 
 	svsp->base = of_iomap(svsp->dev->of_node, 0);
 	if (IS_ERR_OR_NULL(svsp->base)) {
-		dev_err(svsp->dev, "cannot find svs register base\n");
-		ret = -EINVAL;
+		ret = dev_err_probe(svsp->dev, -EINVAL, "cannot find svs register base\n");
 		goto svs_probe_clk_disable;
 	}
 
 	ret = devm_request_threaded_irq(svsp->dev, svsp_irq, NULL, svs_isr,
 					IRQF_ONESHOT, svsp_data->name, svsp);
 	if (ret) {
-		dev_err(svsp->dev, "register irq(%d) failed: %d\n",
-			svsp_irq, ret);
+		dev_err_probe(svsp->dev, ret, "register irq(%d) failed\n", svsp_irq);
 		goto svs_probe_iounmap;
 	}
 
 	ret = svs_start(svsp);
 	if (ret) {
-		dev_err(svsp->dev, "svs start fail: %d\n", ret);
+		dev_err_probe(svsp->dev, ret, "svs start fail\n");
 		goto svs_probe_iounmap;
 	}
 
 #ifdef CONFIG_DEBUG_FS
 	ret = svs_create_debug_cmds(svsp);
 	if (ret) {
-		dev_err(svsp->dev, "svs create debug cmds fail: %d\n", ret);
+		dev_err_probe(svsp->dev, ret, "svs create debug cmds fail\n");
 		goto svs_probe_iounmap;
 	}
 #endif
@@ -2839,18 +2835,12 @@ static int svs_probe(struct platform_device *pdev)
 
 svs_probe_iounmap:
 	iounmap(svsp->base);
-
 svs_probe_clk_disable:
 	clk_disable_unprepare(svsp->main_clk);
-
 svs_probe_free_tefuse:
-	if (!IS_ERR_OR_NULL(svsp->tefuse))
-		kfree(svsp->tefuse);
-
+	kfree(svsp->tefuse);
 svs_probe_free_efuse:
-	if (!IS_ERR_OR_NULL(svsp->efuse))
-		kfree(svsp->efuse);
-
+	kfree(svsp->efuse);
 	return ret;
 }
 
-- 
2.42.0


