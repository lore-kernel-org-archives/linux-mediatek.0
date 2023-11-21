Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1D66C61D94
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Nov 2023 11:57:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/sTmpSUpUoBKaV3NeAFIU7m6PHTjrLFL8tG3Y3lCQEU=; b=E7iZ/VL9KuUZ5SyhZkIAR/Yb27
	6g1lrysuoRxpRqNoWG6ctCt/ZmbvvEQBi2QFQJAMYSBvhFBHsSyfVXQ6FArxskgH8aP4K1/W3GVSl
	kLZQNxaCMxURdjSD+Kq5sL6DKaXvnWekWe1QhTSs61RHBx0vd0fk27o7YzTi00qSWiGyDJ/00MuKr
	Z3Lum9FWReqOxITpMoEuM2mNOQ0YtDLaYBW6X1pMBwFCw0IyCvgq8/gdN84+T2fv6B5eYhK5EN5/+
	uIamK3oniyOCCjNxTtmfH3ga/OC5WdO7fZGP/yzdpvCilk5HJi96IF6C/6x9U+b4SOxXgvvB1N8By
	mWPRNtzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5PNS-00GdXR-2S;
	Tue, 21 Nov 2023 11:57:14 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5PMw-00Gd4M-1B;
	Tue, 21 Nov 2023 11:56:46 +0000
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 4752B6607325;
	Tue, 21 Nov 2023 11:56:40 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1700567801;
	bh=YAm2XwYefU2Wi2EmslwaPruVfwk8nKNQAa35BFgYSvI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eAZdz6wBDUxe/xFVk/DNfuWHvnngIcYV/5EIalT9o0s5s5zdYyOSPAy54MAAsldVc
	 xvth4ox12dkpyxAdVHUuSyG8DLQ/qk0wASACPNF7io8uGC3tQA+mI/UbThqb6fYsbm
	 il8HicYUL1jNMa8+VnCuorIk1WWzwJKU9fPokLWAya29dJpJuVBODgAIn306rCMbOm
	 cbt3EPut0XwcGuJ0Prx+1dGvauuq1R/GO34UYyoR85zN7RFf5781E0u44XmNvaW7Nn
	 jrqUviNyLVrQpOqJhJu0b1XBFlm1960ZsjKTrn4IkhCuGtZlgqHA2WiQah7qsjmMmR
	 bCohB00TFTK9A==
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
Subject: [PATCH v2 09/20] soc: mediatek: mtk-svs: Move t-calibration-data retrieval to svs_probe()
Date: Tue, 21 Nov 2023 12:56:13 +0100
Message-ID: <20231121115624.56855-10-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231121115624.56855-1-angelogioacchino.delregno@collabora.com>
References: <20231121115624.56855-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231121_035642_554722_9A2C0B64 
X-CRM114-Status: GOOD (  11.59  )
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


