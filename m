Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3767CD37B3
	for <linux-mediatek@archiver.kernel.org>; Sun, 17 Sep 2023 14:43:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fdaEbu6km8BqHRGwr2c7GCk1sImwIY5D3Zm1fNqAyQY=; b=Fz2VMkLw0ZRZVO73sy+Lj+26h+
	ohtPREkIBQn2eNS0FzwT9YbfX6omcR7m+QeXpvKVYnrz4xeCVToJoqRhSR2zLVsQihA8XGVNTKUNQ
	eDABdn1HLGMCxp81uIzStoDsDwvSGRzkKxBieycRloOG3fOnxUI6i5RQY+ecIttiYXxNkixvUicbS
	koHqIEKy7trCeit5xNo1Q1RRbiJV2FUxFcc26k5EcQLZJGp0DhYeK1Z1++8NeK9n7YySRm+ZGbpjD
	CgoK/vRvHVCkd3klIPsrkpnQRqMHn/9ruPDkp4ek2NsIhw/ji5wgr4VMA7Cu2rhMDZekREI6t7afG
	BIvNtdTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qhszu-00DjRF-1o;
	Sun, 17 Sep 2023 14:43:42 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qhszr-00DjQV-14;
	Sun, 17 Sep 2023 14:43:40 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2b703a0453fso61705911fa.3;
        Sun, 17 Sep 2023 07:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1694961817; x=1695566617; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fdaEbu6km8BqHRGwr2c7GCk1sImwIY5D3Zm1fNqAyQY=;
        b=lRP3bEMXHdgtsBmQ+TYQLGpyhX1P3kgxWFXggFwGUVK36rgcHg22YnJL0dvPLm9dBV
         HYsEupznb96DA05TgwLzZtm/G5vX10mwokIru9t80HyD5n2PMG2h9sInNBZxM3VopiI7
         3eHopfG87apiliMLMftYXa//IOx3atl15aScMsvgeUJAdWX5KlVfdWYye8kV973WbvFD
         jqy6FDJs+VcGxmyRtHlW0W4K5ZcH2p+498quincpT/0o3rkePW7orsEMum07VzWQLVVl
         c80ZQ8rSVgWy6mE4U8NYKdWf1EPdpwiQsdLByLM5U6FPpc37inIBKCCNSlpwPD/YrjG5
         FNPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694961817; x=1695566617;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fdaEbu6km8BqHRGwr2c7GCk1sImwIY5D3Zm1fNqAyQY=;
        b=HfcX1JYSm58GSl5J7xm2Ejqz5CmJgXHBTkzFW0iY/UockT5fBS7mwPaCA/YJiVAgNw
         fIgKtLeZ0w1h0Zzk2aPYpHaI/qHPPpmBudNZnawkzxvESj5U8BWEO+4iy7XGzI5stgRb
         CKbQwX5r6jO+JuRvPwFZKczBzirHvzMZoe4hwH3Ap7bWVvi9UH1dszt01l7NbklEzbVH
         HcDkniRgpILefFPsao5rnxZGVYxVc/x33wD89QEO0x6tW2+SuEWZwjgML2EOFhq6vPvn
         402AV79/bN3wWMtmZMMAfHjpjMv5gIVe7lVe1L0PuGnCB6m5c0V0g4iQi5nWeJVYGYdI
         /wzg==
X-Gm-Message-State: AOJu0YzWl7w1dQ4eMDAa8A42dELN747kPsSqsOWguIRnO7Uiby+wlxEe
	brdDjrHGg4Men7cshxMqvec=
X-Google-Smtp-Source: AGHT+IEJIeAd3ewMw2+cvZVpanMlw/F0SbFIvtkFqTZ0ddrwDnzgxXx7HQKIxO9egvEEZV79PvH9eA==
X-Received: by 2002:a2e:9409:0:b0:2bd:1bca:ebee with SMTP id i9-20020a2e9409000000b002bd1bcaebeemr5200667ljh.19.1694961816913;
        Sun, 17 Sep 2023 07:43:36 -0700 (PDT)
Received: from jernej-laptop.localnet (APN-123-246-155-gprs.simobil.net. [46.123.246.155])
        by smtp.gmail.com with ESMTPSA id x8-20020a1709065ac800b0099bccb03eadsm4998862ejs.205.2023.09.17.07.43.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Sep 2023 07:43:36 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Vladimir Zapolskiy <vz@mleia.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Emil Renner Berthing <kernel@esmil.dk>,
 Samin Guo <samin.guo@starfivetech.com>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 Russell King <linux@armlinux.org.uk>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Jisheng Zhang <jszhang@kernel.org>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next v2 19/23] net: stmmac: dwmac-sunxi: use
 devm_stmmac_probe_config_dt()
Date: Sun, 17 Sep 2023 16:43:33 +0200
Message-ID: <5714209.DvuYhMxLoT@jernej-laptop>
In-Reply-To: <20230916075829.1560-20-jszhang@kernel.org>
References: <20230916075829.1560-1-jszhang@kernel.org>
 <20230916075829.1560-20-jszhang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230917_074339_373449_0A2EEDE0 
X-CRM114-Status: GOOD (  20.32  )
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

Dne sobota, 16. september 2023 ob 09:58:25 CEST je Jisheng Zhang napisal(a):
> Simplify the driver's probe() function by using the devres
> variant of stmmac_probe_config_dt().
> 
> The remove_new() callback now needs to be switched to
> stmmac_pltfr_remove_no_dt().
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  .../net/ethernet/stmicro/stmmac/dwmac-sunxi.c | 25 +++++++------------
>  1 file changed, 9 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sunxi.c
> b/drivers/net/ethernet/stmicro/stmmac/dwmac-sunxi.c index
> beceeae579bf..b857235f5b1f 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sunxi.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sunxi.c
> @@ -108,36 +108,31 @@ static int sun7i_gmac_probe(struct platform_device
> *pdev) if (ret)
>  		return ret;
> 
> -	plat_dat = stmmac_probe_config_dt(pdev, stmmac_res.mac);
> +	plat_dat = devm_stmmac_probe_config_dt(pdev, stmmac_res.mac);
>  	if (IS_ERR(plat_dat))
>  		return PTR_ERR(plat_dat);
> 
>  	gmac = devm_kzalloc(dev, sizeof(*gmac), GFP_KERNEL);
> -	if (!gmac) {
> -		ret = -ENOMEM;
> -		goto err_remove_config_dt;
> -	}
> +	if (!gmac)
> +		return -ENOMEM;
> 
>  	ret = of_get_phy_mode(dev->of_node, &gmac->interface);
>  	if (ret && ret != -ENODEV) {
>  		dev_err(dev, "Can't get phy-mode\n");
> -		goto err_remove_config_dt;
> +		return ret;
>  	}
> 
>  	gmac->tx_clk = devm_clk_get(dev, "allwinner_gmac_tx");
>  	if (IS_ERR(gmac->tx_clk)) {
>  		dev_err(dev, "could not get tx clock\n");
> -		ret = PTR_ERR(gmac->tx_clk);
> -		goto err_remove_config_dt;
> +		return PTR_ERR(gmac->tx_clk);
>  	}
> 
>  	/* Optional regulator for PHY */
>  	gmac->regulator = devm_regulator_get_optional(dev, "phy");
>  	if (IS_ERR(gmac->regulator)) {
> -		if (PTR_ERR(gmac->regulator) == -EPROBE_DEFER) {
> -			ret = -EPROBE_DEFER;
> -			goto err_remove_config_dt;
> -		}
> +		if (PTR_ERR(gmac->regulator) == -EPROBE_DEFER)
> +			return -EPROBE_DEFER;
>  		dev_info(dev, "no regulator found\n");
>  		gmac->regulator = NULL;
>  	}
> @@ -155,7 +150,7 @@ static int sun7i_gmac_probe(struct platform_device
> *pdev)
> 
>  	ret = sun7i_gmac_init(pdev, plat_dat->bsp_priv);
>  	if (ret)
> -		goto err_remove_config_dt;
> +		return ret;
> 
>  	ret = stmmac_dvr_probe(&pdev->dev, plat_dat, &stmmac_res);
>  	if (ret)
> @@ -165,8 +160,6 @@ static int sun7i_gmac_probe(struct platform_device
> *pdev)
> 
>  err_gmac_exit:
>  	sun7i_gmac_exit(pdev, plat_dat->bsp_priv);
> -err_remove_config_dt:
> -	stmmac_remove_config_dt(pdev, plat_dat);
> 
>  	return ret;
>  }
> @@ -179,7 +172,7 @@ MODULE_DEVICE_TABLE(of, sun7i_dwmac_match);
> 
>  static struct platform_driver sun7i_dwmac_driver = {
>  	.probe  = sun7i_gmac_probe,
> -	.remove_new = stmmac_pltfr_remove,
> +	.remove_new = stmmac_pltfr_remove_no_dt,
>  	.driver = {
>  		.name           = "sun7i-dwmac",
>  		.pm		= &stmmac_pltfr_pm_ops,





