Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B113CD37B6
	for <linux-mediatek@archiver.kernel.org>; Sat, 16 Sep 2023 08:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DbI2w959Q/gMhh2SKWaCmI3cBcqhdTBK27Hihg5lFc8=; b=vBE/bdB1qkcMGxpotYR8zo6LyP
	VpI58LN8B4lTux8Ldn9zEPdO6W5cCdhBJcHBkRIj01kMxSwj6ljDsUoMBkQ3YZ3sbK1VUhNr2U6ic
	i0z/DI6E/04P4PBeXLsPWD0x7i/rTjhDybgWm680xXxcgZHuLBhb6TxOe3ksu/5DL47iAM7ki9tj/
	0EKk/jLANoIj6HLhbrsa/5XVsS2yNnLSeMDuAiy6xRdcTsb+uDek+KUYpgmIVdUfvbtMWF7Up1mJE
	pmH/AyNtuhx8cuEoRu8wiyhzbnSyFaU6hLZktKQatLHfpDnG61vggLQcwCxHA+6qHpUo2pZ4YFErX
	lPfF7P5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qhQOC-00C8ga-0U;
	Sat, 16 Sep 2023 08:10:52 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qhQO7-00C8eC-36;
	Sat, 16 Sep 2023 08:10:49 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 4AEDCB80AC9;
	Sat, 16 Sep 2023 08:10:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E60DC433C7;
	Sat, 16 Sep 2023 08:10:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694851845;
	bh=YlrN4bDSNF+KqWi7kN9bxa/oeNXOFAT09nZc/x9+vhk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eK9TEedsqQfQ/qUwdKzxE0DMYl3ERflK3/+BUKPywqMVYa1Zy2UkD2Bnnal1HKR5G
	 DZtZ1dp5uyhkyXn0pL4FzLOhbSZOesDE4IjP56ngM+3yA6Kadpti7HmM9FdYV9IOai
	 /x7WLaSHQXGbE0W2LOpYTWhv1gtWib1dE1qEgHm2FgnS99OglhmjTBAGjtnZ4K6fHk
	 nU8+oteAKnT+lpWoYwIVaN8mun6Xs/IeJR3EmJiU4FdaRReHtI8eODEdyXft1zr6c4
	 zxJcfROLXA+fW/8ZdYPDzBt026qgzk0Y60Dw+ytoKuO0mnbVSHRJskDaO8WiG+3yHT
	 J52rtyDieXXeg==
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
Subject: [PATCH net-next v2 02/23] net: stmmac: dwmac-dwc-qos-eth: use devm_stmmac_probe_config_dt()
Date: Sat, 16 Sep 2023 15:58:08 +0800
Message-Id: <20230916075829.1560-3-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230916075829.1560-1-jszhang@kernel.org>
References: <20230916075829.1560-1-jszhang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230916_011048_287402_41D72889 
X-CRM114-Status: GOOD (  13.44  )
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

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 .../ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c   | 15 +++------------
 1 file changed, 3 insertions(+), 12 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
index 61ebf36da13d..ec924c6c76c6 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
@@ -435,15 +435,14 @@ static int dwc_eth_dwmac_probe(struct platform_device *pdev)
 	if (IS_ERR(stmmac_res.addr))
 		return PTR_ERR(stmmac_res.addr);
 
-	plat_dat = stmmac_probe_config_dt(pdev, stmmac_res.mac);
+	plat_dat = devm_stmmac_probe_config_dt(pdev, stmmac_res.mac);
 	if (IS_ERR(plat_dat))
 		return PTR_ERR(plat_dat);
 
 	ret = data->probe(pdev, plat_dat, &stmmac_res);
 	if (ret < 0) {
 		dev_err_probe(&pdev->dev, ret, "failed to probe subdriver\n");
-
-		goto remove_config;
+		return ret;
 	}
 
 	ret = dwc_eth_dwmac_config_dt(pdev, plat_dat);
@@ -458,25 +457,17 @@ static int dwc_eth_dwmac_probe(struct platform_device *pdev)
 
 remove:
 	data->remove(pdev);
-remove_config:
-	stmmac_remove_config_dt(pdev, plat_dat);
 
 	return ret;
 }
 
 static void dwc_eth_dwmac_remove(struct platform_device *pdev)
 {
-	struct net_device *ndev = platform_get_drvdata(pdev);
-	struct stmmac_priv *priv = netdev_priv(ndev);
-	const struct dwc_eth_dwmac_data *data;
-
-	data = device_get_match_data(&pdev->dev);
+	const struct dwc_eth_dwmac_data *data = device_get_match_data(&pdev->dev);
 
 	stmmac_dvr_remove(&pdev->dev);
 
 	data->remove(pdev);
-
-	stmmac_remove_config_dt(pdev, priv->plat);
 }
 
 static const struct of_device_id dwc_eth_dwmac_match[] = {
-- 
2.40.1


