Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2267ACD37B5
	for <linux-mediatek@archiver.kernel.org>; Sat, 16 Sep 2023 08:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lWx2SPTa6kheNdS6Ewo22+0/9zyKhBXS1nee5Nal+ME=; b=Z+uvapnSCAkVucsalYZ8X/VmNy
	D2Bftt+6466FITTKe7T0TZ2Zxf1w9amSdBJPtBx+rV0dXY1p5HPcX9sLjQzk4PGEDNoyyg15qtFFx
	pYyy8CCNnRaobZ7x4jLqTA6X46y6Sxsbrn/1NuZrVxVPUHcUI7S5MECYv8ABXfQTcKpTdI+euzVWZ
	w2hmKUpU6YNGsX8vxg2QkzONY027q9FzkzVe2yZSZya4J4vX92I7Ocrins6mtKsyJAa1EziV0oDH4
	EqHkGY99j6DpIvxUwN/MB/M090At9c0Jgzc1gW+mFjrARdkMduOt6ZPVkwVxY2B+aXrTYsa3kATrE
	3i/cE39A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qhQP9-00C9K0-3D;
	Sat, 16 Sep 2023 08:11:52 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qhQP2-00C9E2-2E;
	Sat, 16 Sep 2023 08:11:46 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 18E3860AAF;
	Sat, 16 Sep 2023 08:11:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A8EAC433CB;
	Sat, 16 Sep 2023 08:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694851903;
	bh=suO+8eIztFCZlwSD7uqirMgAu/b9k2nFDN75QHwxBD0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MGeoc3XoBZL8cc3sfZZH/HKjz3P8JT7A7MD9eBbBq8uuOhwjSVLoYoCr3q1VEdLYX
	 W9heWbbUKiqMPN4cviVdUNYpFAU8F5GAL1YOe/GVFJOFqxfD0Aptk5cNgfnL/NcL/8
	 UIicHoxn0GQujien1GTKeUk0olmirGcx6cuswT4l/Fu9LMV/W7HFt8sYpYlj+ffA7v
	 84PUFRZgd5yeYpl5hyByQdjPi6tPTHr0iLJlvmcUZdNeIHJBNouiWlUX3XQmXjnrmI
	 RvnW3jKyuN4Kswgu9CYCRLrv6sIYDY5T5LCZ8jwvQ7reocrGfs4Wnp5W4s5XYj3Z5n
	 bxzx2RkLNzkJg==
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
Subject: [PATCH net-next v2 10/23] net: stmmac: dwmac-mediatek: use devm_stmmac_probe_config_dt()
Date: Sat, 16 Sep 2023 15:58:16 +0800
Message-Id: <20230916075829.1560-11-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230916075829.1560-1-jszhang@kernel.org>
References: <20230916075829.1560-1-jszhang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230916_011144_836401_38E0E18C 
X-CRM114-Status: GOOD (  12.96  )
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
 drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
index cd796ec04132..11976a854240 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
@@ -656,7 +656,7 @@ static int mediatek_dwmac_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	plat_dat = stmmac_probe_config_dt(pdev, stmmac_res.mac);
+	plat_dat = devm_stmmac_probe_config_dt(pdev, stmmac_res.mac);
 	if (IS_ERR(plat_dat))
 		return PTR_ERR(plat_dat);
 
@@ -665,7 +665,7 @@ static int mediatek_dwmac_probe(struct platform_device *pdev)
 
 	ret = mediatek_dwmac_clks_config(priv_plat, true);
 	if (ret)
-		goto err_remove_config_dt;
+		return ret;
 
 	ret = stmmac_dvr_probe(&pdev->dev, plat_dat, &stmmac_res);
 	if (ret)
@@ -675,8 +675,6 @@ static int mediatek_dwmac_probe(struct platform_device *pdev)
 
 err_drv_probe:
 	mediatek_dwmac_clks_config(priv_plat, false);
-err_remove_config_dt:
-	stmmac_remove_config_dt(pdev, plat_dat);
 
 	return ret;
 }
@@ -685,7 +683,7 @@ static void mediatek_dwmac_remove(struct platform_device *pdev)
 {
 	struct mediatek_dwmac_plat_data *priv_plat = get_stmmac_bsp_priv(&pdev->dev);
 
-	stmmac_pltfr_remove(pdev);
+	stmmac_pltfr_remove_no_dt(pdev);
 	mediatek_dwmac_clks_config(priv_plat, false);
 }
 
-- 
2.40.1


