Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E704CCD37B7
	for <linux-mediatek@archiver.kernel.org>; Sat, 16 Sep 2023 08:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+V2zt1Fq/mIsCRLrslLMxOJaDJjzmBiZLDl5kNRhkLk=; b=cFfW06YAzT+pgPUqJrmkZ+moFw
	b6mhDjKvSgdH0CQXPJ41PRf+8YCwsICp3wNopwu+N95y5o6nidVOUOOZoixw2mwVVlMa8Y3Jh3KGj
	syztVoSt+Jo/aGYQvQGlLcOXte4YsJcEttJ7WCyQeD2m2/fk0XvI7lXqv79LKWX/6Fa3ZdD8RhFIq
	1pb79IUkBmW02gT57PMGLaefdxsqQKjQyWLTBzfOBx1m5CVkPlpdbuyOmAQULeorwLFMWUNBSw11E
	GOgIsNE027sM1kuiINlf8Qo0KnmP3Dga/xSTPt5gtNcOC+Q1wviA7Ncmrwn6ZqDDupxwxHrS4Vg2M
	cyAU1UQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qhQPo-00C9t9-24;
	Sat, 16 Sep 2023 08:12:32 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qhQPi-00C9nP-14;
	Sat, 16 Sep 2023 08:12:27 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id CD33960AAF;
	Sat, 16 Sep 2023 08:12:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1809C433CD;
	Sat, 16 Sep 2023 08:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694851945;
	bh=pwxVh7O0mYqw2Ljn4tWnXFw2NWOIpp5wpRx6GKnF3MQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=e6vmNeEho7f/29mMl9USm28gLe72oRfimQLLra+JREzOWdEWz0f35mgbt/MgdYtFO
	 Zd1v0PDZXM5KOtc/FNL4PS8ei18B8nJwEZmlOJq11PTOBmRx+uzs9VLKIrFtLFKm9v
	 FhEKtwgvyPZWlWDe1uBvI4ZHPFqRgZsaEJP+PjAjDHN1ImOSkRhGI9WRq2Drq1atGO
	 bAhpkGvPVToy+Eu/yge2gYmKZK8raCy2/9sTkeo7u+NBuiA5vanKaW6BfbsdrMoUdf
	 hTKqjioGt1lcO5RT2Vlp1cL/b6Oave+4yEo7zgI+rvo7XSx0bpYaKmfIobqnufuDb+
	 fvOfSI3MhcitQ==
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
Subject: [PATCH net-next v2 16/23] net: stmmac: dwmac-sti: use devm_stmmac_probe_config_dt()
Date: Sat, 16 Sep 2023 15:58:22 +0800
Message-Id: <20230916075829.1560-17-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230916075829.1560-1-jszhang@kernel.org>
References: <20230916075829.1560-1-jszhang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230916_011226_467637_B86075D0 
X-CRM114-Status: GOOD (  12.60  )
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
 drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c
index 0d653bbb931b..4445cddc4cbe 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c
@@ -273,20 +273,18 @@ static int sti_dwmac_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	plat_dat = stmmac_probe_config_dt(pdev, stmmac_res.mac);
+	plat_dat = devm_stmmac_probe_config_dt(pdev, stmmac_res.mac);
 	if (IS_ERR(plat_dat))
 		return PTR_ERR(plat_dat);
 
 	dwmac = devm_kzalloc(&pdev->dev, sizeof(*dwmac), GFP_KERNEL);
-	if (!dwmac) {
-		ret = -ENOMEM;
-		goto err_remove_config_dt;
-	}
+	if (!dwmac)
+		return -ENOMEM;
 
 	ret = sti_dwmac_parse_data(dwmac, pdev);
 	if (ret) {
 		dev_err(&pdev->dev, "Unable to parse OF data\n");
-		goto err_remove_config_dt;
+		return ret;
 	}
 
 	dwmac->fix_retime_src = data->fix_retime_src;
@@ -296,7 +294,7 @@ static int sti_dwmac_probe(struct platform_device *pdev)
 
 	ret = clk_prepare_enable(dwmac->clk);
 	if (ret)
-		goto err_remove_config_dt;
+		return ret;
 
 	ret = sti_dwmac_set_mode(dwmac);
 	if (ret)
@@ -310,8 +308,6 @@ static int sti_dwmac_probe(struct platform_device *pdev)
 
 disable_clk:
 	clk_disable_unprepare(dwmac->clk);
-err_remove_config_dt:
-	stmmac_remove_config_dt(pdev, plat_dat);
 
 	return ret;
 }
-- 
2.40.1


