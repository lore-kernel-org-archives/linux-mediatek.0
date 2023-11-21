Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FA2BC61D96
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Nov 2023 12:52:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a5feH2/jkDCbwJZEcvQP2UexdyAXhgSRCA68qIaap+0=; b=WU1IgkimB7BiMbx50dJNfCniqh
	FDxdgF+xBQ6D54poOwTpXHhsEdOeRhF40FYx1vb9/8w69grDpzs0jE2IbWHLJ+LoTIEbifmW7y1+z
	8JJYDkje+9DR0EpA0IMt6Jart5iovo0veE/4WzWzna+qBwncZmGEEv11kTYDufcv3tJ5ZYddlla8u
	clWB1R5MUDApLjOqGeAMeUTu1XX4z41hvQcHhunFgyTkrjSyvryMu26xUX46YsLttDKpjcjHYeSfI
	i75p1DIC2hNnk018smaw3UXfym9m0NLJTOMIxmNcN7a3OaMCFBFX7wGWhAADDAgR3MfA1SvbfzcSR
	L3jn/FpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5QES-00GkiE-0K;
	Tue, 21 Nov 2023 12:52:00 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5QDc-00Gk15-0X;
	Tue, 21 Nov 2023 12:51:10 +0000
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 0D8436607326;
	Tue, 21 Nov 2023 12:51:05 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1700571066;
	bh=mvDbP9LsG0x+WjQA4KRWvixfVCE355+sCyiuJX+FpKc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Tn4Icet19uVB5GgfkjB4A6lrS8zxXD51rMrmLc0MVNJWKcFYpgIIKvtFqDGzt/0nz
	 VL4CEsm4Y5nl8tuAM8uk4PEq3PZatsGGPWKv5aIMPf/HbZCFrPaDLaSrvLFGmpLJ5q
	 juOqcwuOp9CPdj6Qk2Y19FPA8uc58emAAPWyRoUEu/yQbiMlEfqeSwaGVRXftl2jDO
	 0IaFa8JhRlE68KfqwnWCX23/UYQTmJSYM09DtqSV+XQGUdJI5t6LcYgYRRa/AD+5W/
	 QvGhNrsuLRH/owcPn4lTN6lhY4nmN/uab8E/IOz8pwDojB3zuREERC7YuxUL/GyH45
	 cW9LBq8sEen4g==
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
Subject: [PATCH v3 15/20] soc: mediatek: mtk-svs: Cleanup of svs_probe() function
Date: Tue, 21 Nov 2023 13:50:39 +0100
Message-ID: <20231121125044.78642-16-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231121125044.78642-1-angelogioacchino.delregno@collabora.com>
References: <20231121125044.78642-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231121_045108_358605_AE38C5F0 
X-CRM114-Status: UNSURE (   9.94  )
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


