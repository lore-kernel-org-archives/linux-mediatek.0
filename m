Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCDABCD37B6
	for <linux-mediatek@archiver.kernel.org>; Sat, 16 Sep 2023 08:13:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ir7K2TgyDMN2JNrFe1z8evNf2YIGoOpWJRSFUqqcp6s=; b=wxYHN9Uh1SLfqoykKckgmjAHqk
	KYUxolvRk/caRoe5eQR7fclOIN+jRxpTyJ6JSmYoubFBa7dMDpsLzoea7DtodJX5++XDUaqIHca2q
	kiGX/aRv1gL5VgmoKspo7KzcJY0S3jlEdOE1ZOZJVjOiMURjsN+PZ2hvc0CWN5Pf8/OFgVflCUTWr
	KJJrHN89qJOeokSSUf/Yo2q83frGdP2i6HOvKjSB7+86EcWimn+MjSRrIctkUmXp3xtGleKFAi1+E
	E9ZpvMvCd+xqH6vB9A7cnev4bR1DFk//NsBlywV6s891ua9aGtnHlIzUPMIc49G/OWLWmDpMfXfuS
	jvLc3xMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qhQQG-00CAG0-26;
	Sat, 16 Sep 2023 08:13:00 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qhQQC-00CACF-1v;
	Sat, 16 Sep 2023 08:12:58 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A9F5260AEB;
	Sat, 16 Sep 2023 08:12:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 733EAC433CB;
	Sat, 16 Sep 2023 08:12:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694851973;
	bh=KSe7NuuTmvNFUfkVlgyIp0m+TWXLJzpYZqE/n8ra5Ws=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rnDqtul2beGLFRSZ/OiQBcgCaJeOxva6GCnQCtR2em+MPpVlkpcK/TGM7Hvmdr0S6
	 JnJ4RxRcSwV/5iPCEPMGQSTXMLMNagH2FY5rkJ+j0/ApgIio2H5vVhaiJ2MgNz798r
	 u12j/JAJM498uaSEzRXKfcL995+xhFZy7998UZPYjTPCdJI38pIJuYY1VYhlm7+Ufb
	 MLZhYLL2igKv3/oCrQMmW6DJt/vcuUBJqQ+m4lsMocN3quCJCSjPgE3j+1SwahqyBq
	 Lu4NyCu4pVmEl+TsMNh5e+kT+7xx4jMP2MhAYKAu6nEW+6xFvM/V3ByDPG1zS/dMf3
	 cM97RocNCB/0w==
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
Subject: [PATCH net-next v2 20/23] net: stmmac: dwmac-tegra: use devm_stmmac_probe_config_dt()
Date: Sat, 16 Sep 2023 15:58:26 +0800
Message-Id: <20230916075829.1560-21-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230916075829.1560-1-jszhang@kernel.org>
References: <20230916075829.1560-1-jszhang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230916_011256_728526_0C2D4ABA 
X-CRM114-Status: GOOD (  13.95  )
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
 drivers/net/ethernet/stmicro/stmmac/dwmac-tegra.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-tegra.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-tegra.c
index e0f3cbd36852..7e512c0762ea 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-tegra.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-tegra.c
@@ -284,7 +284,7 @@ static int tegra_mgbe_probe(struct platform_device *pdev)
 	if (err < 0)
 		goto disable_clks;
 
-	plat = stmmac_probe_config_dt(pdev, res.mac);
+	plat = devm_stmmac_probe_config_dt(pdev, res.mac);
 	if (IS_ERR(plat)) {
 		err = PTR_ERR(plat);
 		goto disable_clks;
@@ -303,7 +303,7 @@ static int tegra_mgbe_probe(struct platform_device *pdev)
 						   GFP_KERNEL);
 		if (!plat->mdio_bus_data) {
 			err = -ENOMEM;
-			goto remove;
+			goto disable_clks;
 		}
 	}
 
@@ -321,7 +321,7 @@ static int tegra_mgbe_probe(struct platform_device *pdev)
 				 500, 500 * 2000);
 	if (err < 0) {
 		dev_err(mgbe->dev, "timeout waiting for TX lane to become enabled\n");
-		goto remove;
+		goto disable_clks;
 	}
 
 	plat->serdes_powerup = mgbe_uphy_lane_bringup_serdes_up;
@@ -342,12 +342,10 @@ static int tegra_mgbe_probe(struct platform_device *pdev)
 
 	err = stmmac_dvr_probe(&pdev->dev, plat, &res);
 	if (err < 0)
-		goto remove;
+		goto disable_clks;
 
 	return 0;
 
-remove:
-	stmmac_remove_config_dt(pdev, plat);
 disable_clks:
 	clk_bulk_disable_unprepare(ARRAY_SIZE(mgbe_clks), mgbe->clks);
 
@@ -360,7 +358,7 @@ static void tegra_mgbe_remove(struct platform_device *pdev)
 
 	clk_bulk_disable_unprepare(ARRAY_SIZE(mgbe_clks), mgbe->clks);
 
-	stmmac_pltfr_remove(pdev);
+	stmmac_pltfr_remove_no_dt(pdev);
 }
 
 static const struct of_device_id tegra_mgbe_match[] = {
-- 
2.40.1


