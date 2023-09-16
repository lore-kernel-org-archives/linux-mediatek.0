Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78D91CD37B5
	for <linux-mediatek@archiver.kernel.org>; Sat, 16 Sep 2023 08:11:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mcJuPdTT5PSeJ0r7Tit+l0BFZMdUShwV7yjDIMm2cWg=; b=1Ryk+nISwFfPHnIE9VXXdo/j7/
	Q8kSSkCIuuqc4yv8JTjB1j0+tjeBbnxPHckV2xtj+Z9NaZHTYnpKQMW+8jM8HX+InbbBXpbK9PhK5
	dGb3U3k0Yc83dYU5rauQnPQDz9NvyqGF6cUrOrrAkHIrOe/ZsPj+TvL6c3eeCVO3jpuFPn2wexQEf
	Ta6HVkVPI2ef9rrMOtjD1Wqzgkh1n+hLi53tVTh8OI+cUZWLYvXi98zpZDxuA3HeeXvOWWYsAlT5I
	y3MBMiw8NGPZgEdTAZ2160oSHUE0aJYHbXKzxaXQ78ikv53GmEROWBU23pNYycSunXqhHKEOQyZWj
	yUne/ZHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qhQOm-00C935-1O;
	Sat, 16 Sep 2023 08:11:28 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qhQOi-00C8zs-1V;
	Sat, 16 Sep 2023 08:11:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id A4E35B80AC8;
	Sat, 16 Sep 2023 08:11:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29C86C433CB;
	Sat, 16 Sep 2023 08:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694851881;
	bh=oTujxMOHFGRuGKFiieFc6dhpH7GYKf8q7WqlAEbZzVU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JmxWxAvQ9UJkjuq8H1uiO7GEaoC5WjEDdnkpggAIHHjS/RCKj+q3y6EondR7Zk1E9
	 g8wg5HTU8zlVHZezJyEyVq2j/2OTm/XahnDNqQdxoBChPySTEB8vs4xQ+9vc+x3nEY
	 LmGqQQy/8bIRXmcZZkMa6kGZqrPvTsGO0XLvzOicIclNT9luPVKo99/g1i0HvAyHVn
	 eX1o1AZnvJYbH5m8qQgzQgUHRruCBUcDCTKDvqO7vuTXtMr0epbTqJLk9HEroLZAKy
	 yRlg4TCzJNKp/4z8vmcyhAuTeHA6HhxQiuYUZnFnIXr1QnydHuFUNDDOG+/rvs/FqL
	 yy0teDzDICxBw==
From: Jisheng Zhang <jszhang@kernel.org>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Samin Guo <samin.guo@starfivetech.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
	Russell King <linux@armlinux.org.uk>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH net-next v2 07/23] net: stmmac: dwmac-intel-plat: use devm_stmmac_probe_config_dt()
Date: Sat, 16 Sep 2023 15:58:13 +0800
Message-Id: <20230916075829.1560-8-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230916075829.1560-1-jszhang@kernel.org>
References: <20230916075829.1560-1-jszhang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230916_011124_812904_B7FECA52 
X-CRM114-Status: GOOD (  13.47  )
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

Simplify the driver's probe() function by using the devres
variant of stmmac_probe_config_dt().

The calling of stmmac_pltfr_remove() now needs to be switched to
stmmac_pltfr_remove_no_dt().

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 .../stmicro/stmmac/dwmac-intel-plat.c         | 27 +++++++------------
 1 file changed, 9 insertions(+), 18 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel-plat.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel-plat.c
index d352a14f9d48..d1aec2ca2b42 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel-plat.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel-plat.c
@@ -85,17 +85,15 @@ static int intel_eth_plat_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	plat_dat = stmmac_probe_config_dt(pdev, stmmac_res.mac);
+	plat_dat = devm_stmmac_probe_config_dt(pdev, stmmac_res.mac);
 	if (IS_ERR(plat_dat)) {
 		dev_err(&pdev->dev, "dt configuration failed\n");
 		return PTR_ERR(plat_dat);
 	}
 
 	dwmac = devm_kzalloc(&pdev->dev, sizeof(*dwmac), GFP_KERNEL);
-	if (!dwmac) {
-		ret = -ENOMEM;
-		goto err_remove_config_dt;
-	}
+	if (!dwmac)
+		return -ENOMEM;
 
 	dwmac->dev = &pdev->dev;
 	dwmac->tx_clk = NULL;
@@ -110,10 +108,8 @@ static int intel_eth_plat_probe(struct platform_device *pdev)
 		/* Enable TX clock */
 		if (dwmac->data->tx_clk_en) {
 			dwmac->tx_clk = devm_clk_get(&pdev->dev, "tx_clk");
-			if (IS_ERR(dwmac->tx_clk)) {
-				ret = PTR_ERR(dwmac->tx_clk);
-				goto err_remove_config_dt;
-			}
+			if (IS_ERR(dwmac->tx_clk))
+				return PTR_ERR(dwmac->tx_clk);
 
 			clk_prepare_enable(dwmac->tx_clk);
 
@@ -126,7 +122,7 @@ static int intel_eth_plat_probe(struct platform_device *pdev)
 				if (ret) {
 					dev_err(&pdev->dev,
 						"Failed to set tx_clk\n");
-					goto err_remove_config_dt;
+					return ret;
 				}
 			}
 		}
@@ -140,7 +136,7 @@ static int intel_eth_plat_probe(struct platform_device *pdev)
 			if (ret) {
 				dev_err(&pdev->dev,
 					"Failed to set clk_ptp_ref\n");
-				goto err_remove_config_dt;
+				return ret;
 			}
 		}
 	}
@@ -158,22 +154,17 @@ static int intel_eth_plat_probe(struct platform_device *pdev)
 	ret = stmmac_dvr_probe(&pdev->dev, plat_dat, &stmmac_res);
 	if (ret) {
 		clk_disable_unprepare(dwmac->tx_clk);
-		goto err_remove_config_dt;
+		return ret;
 	}
 
 	return 0;
-
-err_remove_config_dt:
-	stmmac_remove_config_dt(pdev, plat_dat);
-
-	return ret;
 }
 
 static void intel_eth_plat_remove(struct platform_device *pdev)
 {
 	struct intel_dwmac *dwmac = get_stmmac_bsp_priv(&pdev->dev);
 
-	stmmac_pltfr_remove(pdev);
+	stmmac_pltfr_remove_no_dt(pdev);
 	clk_disable_unprepare(dwmac->tx_clk);
 }
 
-- 
2.40.1


