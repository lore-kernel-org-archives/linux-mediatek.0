Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4FD3CD37B6
	for <linux-mediatek@archiver.kernel.org>; Sat, 16 Sep 2023 08:12:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lHfvLgdngO5a/xPeIhnqWC78WVW1J7sdyb+1w8vHuK4=; b=rVEtTXWWUcjR/DVBOLahmgJSc4
	GwFhb/kPMYQhvWBnEeVbG3qrKmsZOZQAt/Uv/zlK4anCTtzKRX5aLqNjX2iDcmI4Xx0UVw2Y2fGTN
	IyrXWiigUImWIVyuqc1Fh1o52Zzk2n+gq6CpZCL+XEUlckC/AdfxnIlG31b4jav0HnUUeAS/Dk8Vv
	GrThUY8BrqebdX28ifrY5QJwXLRvrSBL236Qk2FA1Nezwm4TGQ/ocoyouP0fyuqwHUr1gEawC9yXj
	NvSK6p9MMa20fhte6OqejnEoNFjLc26vU79stfygPyF+uRg2AQ3SM7VaBL6K0qeNWHTkODRD3NiKg
	xiDMiF1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qhQQ2-00CA56-2X;
	Sat, 16 Sep 2023 08:12:46 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qhQPy-00CA1D-1Y;
	Sat, 16 Sep 2023 08:12:43 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 1E27DB80DDB;
	Sat, 16 Sep 2023 08:12:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21B44C433C8;
	Sat, 16 Sep 2023 08:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694851959;
	bh=gDuGzivyyQ8xcbFnZYFp+TOLVAp3wAS56uHvlgLzSs8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BOI8U9K2Jl/RBpbL0O5fLetMAE8GEGGrk+yB2Cq9NziIhXCzwtosHXALsyebat8Nj
	 AjspZN72qPnAeSHwcyav0UVtA66Y6d1ipkwR8kjhYnmTs9h3xKM4arM8MQQXPukHhr
	 ZwNtnjLe3YjIgjfmfe4EZ1luzsB8A6jURhgjMBCkG3wkfMxHcWg4GdJM33ODCMdi7h
	 6vcQbtoOnaGpHbswQfLCNaUfcGyp13ynhK4TprN6uYUuj2V7sYp35kZoNGWKOEUHZl
	 S6an22a3PDfpXxA2elkd5T6oKGsKQrPpCXyJGOub6PIz+F05D0LrNkdukrFn/TUuPx
	 gWtQY+OA19qPQ==
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
Subject: [PATCH net-next v2 18/23] net: stmmac: dwmac-sun8i: use devm_stmmac_probe_config_dt()
Date: Sat, 16 Sep 2023 15:58:24 +0800
Message-Id: <20230916075829.1560-19-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230916075829.1560-1-jszhang@kernel.org>
References: <20230916075829.1560-1-jszhang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230916_011242_815062_8514C127 
X-CRM114-Status: GOOD (  12.33  )
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
 drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
index 01e77368eef1..63a7e5e53d7b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
@@ -1224,7 +1224,7 @@ static int sun8i_dwmac_probe(struct platform_device *pdev)
 	if (ret)
 		return -EINVAL;
 
-	plat_dat = stmmac_probe_config_dt(pdev, stmmac_res.mac);
+	plat_dat = devm_stmmac_probe_config_dt(pdev, stmmac_res.mac);
 	if (IS_ERR(plat_dat))
 		return PTR_ERR(plat_dat);
 
@@ -1244,7 +1244,7 @@ static int sun8i_dwmac_probe(struct platform_device *pdev)
 
 	ret = sun8i_dwmac_set_syscon(&pdev->dev, plat_dat);
 	if (ret)
-		goto dwmac_deconfig;
+		return ret;
 
 	ret = sun8i_dwmac_init(pdev, plat_dat->bsp_priv);
 	if (ret)
@@ -1295,8 +1295,6 @@ static int sun8i_dwmac_probe(struct platform_device *pdev)
 	sun8i_dwmac_exit(pdev, gmac);
 dwmac_syscon:
 	sun8i_dwmac_unset_syscon(gmac);
-dwmac_deconfig:
-	stmmac_remove_config_dt(pdev, plat_dat);
 
 	return ret;
 }
@@ -1314,7 +1312,7 @@ static void sun8i_dwmac_remove(struct platform_device *pdev)
 		clk_put(gmac->ephy_clk);
 	}
 
-	stmmac_pltfr_remove(pdev);
+	stmmac_pltfr_remove_no_dt(pdev);
 	sun8i_dwmac_unset_syscon(gmac);
 }
 
-- 
2.40.1


