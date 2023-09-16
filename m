Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7768FCD37B5
	for <linux-mediatek@archiver.kernel.org>; Sat, 16 Sep 2023 08:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6/xUoyIFASPIfXzO7DjHxdTqcD1CDAyUsRNRIBCEazE=; b=OjLvi+fUmOyGOJwXemSue0wVnW
	4p9cMeOHHGSGEkBoptMs8SGII3sa8orceImw3EkCYipoNyrW5OmYAap5N1fcs4I8ZdDkn799zlTSg
	z+sR6UyhM7WD6dorxhAp8L0ChPcB8IEVvwTCW2uXnwfXw3KIVx5wFwW39vcje2rXct5sGjLG0x6Cm
	VIOzZcWT/kDlwlzKdqSIZng6rVY+T8KScvPfOH4An9Dmv0zPcUNCJh9TzPYxg14bos0ubbZZyQCQg
	fuHi2YxxcOHOpP0cUfBGTHVQl2xwcyyemaU0AU1Ywtq0jz0XSlyED/kUagIcvhEqAexRdSRfKOOSO
	i7HS6yLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qhQQA-00CAAj-1H;
	Sat, 16 Sep 2023 08:12:54 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qhQQ6-00CA6v-17;
	Sat, 16 Sep 2023 08:12:52 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id AE424CE2BD0;
	Sat, 16 Sep 2023 08:12:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E48DC433CA;
	Sat, 16 Sep 2023 08:12:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694851967;
	bh=YIjtmUbVrg/RXcc1/xGF0odjZwPY+o3yQzwT12xvMT0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ih3jhFek7Im/uNs9x+ian0b7ZipqTfZA29fQeyQ0M/r4MkwvWGCVgx/iFYivQs/xz
	 AIGGMW/YQ0RUlDqjdl7TSesFoSkgf0nud823dgrt0fyF16nrxFEa/+aUiHkwUzxU8E
	 DBFm8s9CiCMbiNrJtUAbx61Xo0Rp1bA8N/cWlsKGbz6drGc/M9tectoq9B3yeZ7osH
	 dB8bQvYXgi6Jj0osY7yn8ZEw4rZG6OWI8TlZnSpkQ2TisGhd2YHqz1SdaK+K7RbmDG
	 w1nfDAmwC+TDgh8NUHA32q6NcujKPO2jW6z2W/QrqkjEZWXD/MldrB0ASbVoZnHnFI
	 U5MxpToJREWdg==
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
Subject: [PATCH net-next v2 19/23] net: stmmac: dwmac-sunxi: use devm_stmmac_probe_config_dt()
Date: Sat, 16 Sep 2023 15:58:25 +0800
Message-Id: <20230916075829.1560-20-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230916075829.1560-1-jszhang@kernel.org>
References: <20230916075829.1560-1-jszhang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230916_011250_745265_AB690AD8 
X-CRM114-Status: GOOD (  15.34  )
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

The remove_new() callback now needs to be switched to
stmmac_pltfr_remove_no_dt().

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 .../net/ethernet/stmicro/stmmac/dwmac-sunxi.c | 25 +++++++------------
 1 file changed, 9 insertions(+), 16 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sunxi.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sunxi.c
index beceeae579bf..b857235f5b1f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sunxi.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sunxi.c
@@ -108,36 +108,31 @@ static int sun7i_gmac_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	plat_dat = stmmac_probe_config_dt(pdev, stmmac_res.mac);
+	plat_dat = devm_stmmac_probe_config_dt(pdev, stmmac_res.mac);
 	if (IS_ERR(plat_dat))
 		return PTR_ERR(plat_dat);
 
 	gmac = devm_kzalloc(dev, sizeof(*gmac), GFP_KERNEL);
-	if (!gmac) {
-		ret = -ENOMEM;
-		goto err_remove_config_dt;
-	}
+	if (!gmac)
+		return -ENOMEM;
 
 	ret = of_get_phy_mode(dev->of_node, &gmac->interface);
 	if (ret && ret != -ENODEV) {
 		dev_err(dev, "Can't get phy-mode\n");
-		goto err_remove_config_dt;
+		return ret;
 	}
 
 	gmac->tx_clk = devm_clk_get(dev, "allwinner_gmac_tx");
 	if (IS_ERR(gmac->tx_clk)) {
 		dev_err(dev, "could not get tx clock\n");
-		ret = PTR_ERR(gmac->tx_clk);
-		goto err_remove_config_dt;
+		return PTR_ERR(gmac->tx_clk);
 	}
 
 	/* Optional regulator for PHY */
 	gmac->regulator = devm_regulator_get_optional(dev, "phy");
 	if (IS_ERR(gmac->regulator)) {
-		if (PTR_ERR(gmac->regulator) == -EPROBE_DEFER) {
-			ret = -EPROBE_DEFER;
-			goto err_remove_config_dt;
-		}
+		if (PTR_ERR(gmac->regulator) == -EPROBE_DEFER)
+			return -EPROBE_DEFER;
 		dev_info(dev, "no regulator found\n");
 		gmac->regulator = NULL;
 	}
@@ -155,7 +150,7 @@ static int sun7i_gmac_probe(struct platform_device *pdev)
 
 	ret = sun7i_gmac_init(pdev, plat_dat->bsp_priv);
 	if (ret)
-		goto err_remove_config_dt;
+		return ret;
 
 	ret = stmmac_dvr_probe(&pdev->dev, plat_dat, &stmmac_res);
 	if (ret)
@@ -165,8 +160,6 @@ static int sun7i_gmac_probe(struct platform_device *pdev)
 
 err_gmac_exit:
 	sun7i_gmac_exit(pdev, plat_dat->bsp_priv);
-err_remove_config_dt:
-	stmmac_remove_config_dt(pdev, plat_dat);
 
 	return ret;
 }
@@ -179,7 +172,7 @@ MODULE_DEVICE_TABLE(of, sun7i_dwmac_match);
 
 static struct platform_driver sun7i_dwmac_driver = {
 	.probe  = sun7i_gmac_probe,
-	.remove_new = stmmac_pltfr_remove,
+	.remove_new = stmmac_pltfr_remove_no_dt,
 	.driver = {
 		.name           = "sun7i-dwmac",
 		.pm		= &stmmac_pltfr_pm_ops,
-- 
2.40.1


