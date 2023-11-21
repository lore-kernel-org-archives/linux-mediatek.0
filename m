Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53564C61D97
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Nov 2023 12:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/sTmpSUpUoBKaV3NeAFIU7m6PHTjrLFL8tG3Y3lCQEU=; b=RsWeawPLcQEP7w1aKRhjSSlOfr
	yLMh+5nVplT/5LLuoGSybRU/SQnUs8qDeKQqd5bpB1FBSLSLDX4rgFHDn8ohGbZnW3Ex6hc1+6CHB
	/Bdpmo+N1pjgmIXer3ekgU0uWtsDhaG4bR6YiswarWuQky0j192FtmohHRXN/s+JbcJthTXad1uDT
	Z1Q2WJmM4MM7HpxahGHfhIyC3ofB2f8Gwl9yT9SnFJZaZdNNwMvUq8l54E8g4rgiIeDZ6+5Ws5b08
	vy8F7OLrnlPDFlTPke+EjlmRSmxQLKn3YvIkJUfgmJVXQexgxC9o+dYId3WVyCuEnYVPs978AiAQQ
	ui+d8tFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5QEE-00GkWu-39;
	Tue, 21 Nov 2023 12:51:46 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5QDV-00Gjvd-2v;
	Tue, 21 Nov 2023 12:51:03 +0000
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id C8E4F6607314;
	Tue, 21 Nov 2023 12:50:59 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1700571060;
	bh=YAm2XwYefU2Wi2EmslwaPruVfwk8nKNQAa35BFgYSvI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QXtid+ivp1dSih09MgnuxB4/ZRA4pjGsxDuGrhSKwwYcVK0UMLDH0eWsBzpUYBULB
	 XkPzk17UGPJj9qII/QGy1AKPOVKl+k72O6cbbYaYsz6/S4b9lpuCJ632A6PYH659ZU
	 LT5Lz5/KwXwbw326hHl0PO4uNsgCwNdxwoI1IiBmqgYAjyWUWN9VmMuYrW7Qv1kaRA
	 hX2aEmUc5WgzHTf59V/Q8Ydty51DJ1ig8+cPlNb20L2uS21/kHxClGt+Hi+EreKmin
	 OyvnPwbiaOb2uQs6pYcvDtn+X7oaV5EEn8v8GvJwv+i18NYdLuvx+H8PxOeNlkLqei
	 xBuD6EZCNjuog==
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
Subject: [PATCH v3 09/20] soc: mediatek: mtk-svs: Move t-calibration-data retrieval to svs_probe()
Date: Tue, 21 Nov 2023 13:50:33 +0100
Message-ID: <20231121125044.78642-10-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231121125044.78642-1-angelogioacchino.delregno@collabora.com>
References: <20231121125044.78642-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231121_045102_112754_EF2150FA 
X-CRM114-Status: GOOD (  11.49  )
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

The t-calibration-data (SVS-Thermal calibration data) shall exist for
all SoCs or SVS won't work anyway: move it to the common svs_probe()
function and remove it from all of the per-SoC efuse_parsing() probe
callbacks.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/soc/mediatek/mtk-svs.c | 32 ++++++--------------------------
 1 file changed, 6 insertions(+), 26 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-svs.c b/drivers/soc/mediatek/mtk-svs.c
index ab564d48092b..1042af2aee3f 100644
--- a/drivers/soc/mediatek/mtk-svs.c
+++ b/drivers/soc/mediatek/mtk-svs.c
@@ -1884,11 +1884,6 @@ static bool svs_mt8195_efuse_parsing(struct svs_platform *svsp)
 		svsb->vmax += svsb->dvt_fixed;
 	}
 
-	ret = svs_get_efuse_data(svsp, "t-calibration-data",
-				 &svsp->tefuse, &svsp->tefuse_max);
-	if (ret)
-		return false;
-
 	for (i = 0; i < svsp->tefuse_max; i++)
 		if (svsp->tefuse[i] != 0)
 			break;
@@ -1949,11 +1944,6 @@ static bool svs_mt8192_efuse_parsing(struct svs_platform *svsp)
 		svsb->vmax += svsb->dvt_fixed;
 	}
 
-	ret = svs_get_efuse_data(svsp, "t-calibration-data",
-				 &svsp->tefuse, &svsp->tefuse_max);
-	if (ret)
-		return false;
-
 	for (i = 0; i < svsp->tefuse_max; i++)
 		if (svsp->tefuse[i] != 0)
 			break;
@@ -2009,11 +1999,6 @@ static bool svs_mt8188_efuse_parsing(struct svs_platform *svsp)
 		svsb->vmax += svsb->dvt_fixed;
 	}
 
-	ret = svs_get_efuse_data(svsp, "t-calibration-data",
-				 &svsp->tefuse, &svsp->tefuse_max);
-	if (ret)
-		return false;
-
 	for (i = 0; i < svsp->tefuse_max; i++)
 		if (svsp->tefuse[i] != 0)
 			break;
@@ -2097,11 +2082,6 @@ static bool svs_mt8186_efuse_parsing(struct svs_platform *svsp)
 		svsb->vmax += svsb->dvt_fixed;
 	}
 
-	ret = svs_get_efuse_data(svsp, "t-calibration-data",
-				 &svsp->tefuse, &svsp->tefuse_max);
-	if (ret)
-		return false;
-
 	golden_temp = (svsp->tefuse[0] >> 24) & GENMASK(7, 0);
 	if (!golden_temp)
 		golden_temp = 50;
@@ -2198,11 +2178,6 @@ static bool svs_mt8183_efuse_parsing(struct svs_platform *svsp)
 		}
 	}
 
-	ret = svs_get_efuse_data(svsp, "t-calibration-data",
-				 &svsp->tefuse, &svsp->tefuse_max);
-	if (ret)
-		return false;
-
 	/* Thermal efuse parsing */
 	adc_ge_t = (svsp->tefuse[1] >> 22) & GENMASK(9, 0);
 	adc_oe_t = (svsp->tefuse[1] >> 12) & GENMASK(9, 0);
@@ -3040,8 +3015,13 @@ static int svs_probe(struct platform_device *pdev)
 
 	ret = svs_get_efuse_data(svsp, "svs-calibration-data",
 				 &svsp->efuse, &svsp->efuse_max);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret, "Cannot read SVS calibration\n");
+
+	ret = svs_get_efuse_data(svsp, "t-calibration-data",
+				 &svsp->tefuse, &svsp->tefuse_max);
 	if (ret) {
-		ret = -EPERM;
+		dev_err_probe(&pdev->dev, ret, "Cannot read SVS-Thermal calibration\n");
 		goto svs_probe_free_efuse;
 	}
 
-- 
2.42.0


