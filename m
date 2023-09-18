Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A488CD37B0
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Sep 2023 19:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3GMjth0uk4svVwUdt3+lP+YAoEP9JG5oh8mw/tamzSY=; b=fw4dcx6jE/k5sC1HqFL0WH8fEx
	W4r25TbHXWRTWw98S74/g8LDnACX1RGH8PfqpQ3hSiAc58s4TL5I/M+CKk11KE2X81RyLjbieJS2U
	gvU53R00F+yjl/qVM20IoiEQ00HyatwjbykQyW9kKUE5uro7K1ovzCsLEeA523xOfczdsdvt+J+En
	J3w/8rzbob1WZckpXtwEGe1fPeSqK2I/37+02mXkuH4rxzBipvZAyNoaVZMGrKIuOi0ZU7iCDS8Fm
	4IsPOhf26Gtyk2cGgJDkR00Brb0vKsO60eJ/Ec1o930wZhRnbMDX8AxjGOr8OqEZN2XTRzakBLrI2
	Mr+115YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiKDM-00GDGC-0Z;
	Mon, 18 Sep 2023 19:47:24 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiKDF-00GDFQ-0j;
	Mon, 18 Sep 2023 19:47:22 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-500bbe3ef0eso5792733e87.1;
        Mon, 18 Sep 2023 12:47:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695066434; x=1695671234; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3GMjth0uk4svVwUdt3+lP+YAoEP9JG5oh8mw/tamzSY=;
        b=ULtLdbxzNZp5Ig/xR+9kmt3hTGw/5I5ObMPIAuhIpGWAhtcs9wvfaujWYn+j0Di3L0
         RwLCA2LK4KUgIQzXPv3Mhg78wpcJqNBKJUFns8K56vN9dL4FQaR4oRVc8bpMcxA/EXJK
         m88iJlLNbPQEhNElqbZb4vLZlX0UnLyUbxl1oj9rRjvPFQtvevBk3IT15tcqzK8k5+3Z
         mU7MvkbZQ2Ic15eEFz+Dd+pFYRr1YuihWpYM8pGRIoSE4ktGI/DBxA9AmVi8Q9fo+449
         Eqmb99kW633nEdnyP67wTmdyyQ+Ztk/jLQCVKA/hMaNWHJW51Wmr/HsZgIulk9GpPp4k
         YjRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695066434; x=1695671234;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3GMjth0uk4svVwUdt3+lP+YAoEP9JG5oh8mw/tamzSY=;
        b=nlwaPJCZlsmCTLocjXaGhPPC0UEo9EzLG/ognZNnBA4hPtbyWVm1PaHmzBS5ww1Khl
         g53iIfNUULrLcaa7ytuwAjIUPjEBFd6xQDVTOnK4akuqleMbnTggvbWovSkx8zQ8hx8i
         YHzbFEiJ64bgah9Etm1NXSqyJ5JYpukwL2FfvsaOpFCn/IxHEw9SF8CLPheI1Ry/7hNN
         UlGEH3Zq1gB3kZEj7mxNck7wlfYlMx6c9FS5XoCqYn4/r3jTr9+hg9ECewDkKaE+wx4G
         iE8IldGoA+HQItQkCpcfqBIw0OlEpvViBPPW1JXhRRDwHgje7iPy8oq2kJQJr9mYK8DF
         lFgA==
X-Gm-Message-State: AOJu0YyHJRj1edvZMWWJSxUH+ncqMffVapT2OsbjHDIuelQqFu5xQ4fc
	yrksT8WVwBxk+s203vP9R/s=
X-Google-Smtp-Source: AGHT+IFU7njRlBwGSq66q3hzfwk/hZvM8S7fmF9CZN+KqPY2x8ju4hdMyo/0KMTFfnBSlUsJW2or3w==
X-Received: by 2002:a05:6512:2256:b0:503:636:68e1 with SMTP id i22-20020a056512225600b00503063668e1mr275797lfu.20.1695066433864;
        Mon, 18 Sep 2023 12:47:13 -0700 (PDT)
Received: from mobilestation ([178.176.81.244])
        by smtp.gmail.com with ESMTPSA id z3-20020a19f703000000b0050084e55bd8sm1926434lfe.138.2023.09.18.12.47.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Sep 2023 12:47:13 -0700 (PDT)
Date: Mon, 18 Sep 2023 22:47:07 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Jose Abreu <joabreu@synopsys.com>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, 
	Vladimir Zapolskiy <vz@mleia.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Emil Renner Berthing <kernel@esmil.dk>, 
	Samin Guo <samin.guo@starfivetech.com>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>, 
	Russell King <linux@armlinux.org.uk>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-tegra@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next v2 07/23] net: stmmac: dwmac-intel-plat: use
 devm_stmmac_probe_config_dt()
Message-ID: <5x3xddynxi4mcf5zpac5q3kjabpq7iui6kdynasvgwp3ekzkc6@va2bm4fnh4fo>
References: <20230916075829.1560-1-jszhang@kernel.org>
 <20230916075829.1560-8-jszhang@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230916075829.1560-8-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230918_124717_287058_0493D01C 
X-CRM114-Status: GOOD (  23.64  )
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

On Sat, Sep 16, 2023 at 03:58:13PM +0800, Jisheng Zhang wrote:
> Simplify the driver's probe() function by using the devres
> variant of stmmac_probe_config_dt().
> 
> The calling of stmmac_pltfr_remove() now needs to be switched to
> stmmac_pltfr_remove_no_dt().
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  .../stmicro/stmmac/dwmac-intel-plat.c         | 27 +++++++------------
>  1 file changed, 9 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel-plat.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel-plat.c
> index d352a14f9d48..d1aec2ca2b42 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel-plat.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel-plat.c
> @@ -85,17 +85,15 @@ static int intel_eth_plat_probe(struct platform_device *pdev)
>  	if (ret)
>  		return ret;
>  
> -	plat_dat = stmmac_probe_config_dt(pdev, stmmac_res.mac);
> +	plat_dat = devm_stmmac_probe_config_dt(pdev, stmmac_res.mac);
>  	if (IS_ERR(plat_dat)) {
>  		dev_err(&pdev->dev, "dt configuration failed\n");
>  		return PTR_ERR(plat_dat);
>  	}
>  
>  	dwmac = devm_kzalloc(&pdev->dev, sizeof(*dwmac), GFP_KERNEL);
> -	if (!dwmac) {
> -		ret = -ENOMEM;
> -		goto err_remove_config_dt;
> -	}
> +	if (!dwmac)
> +		return -ENOMEM;
>  
>  	dwmac->dev = &pdev->dev;
>  	dwmac->tx_clk = NULL;
> @@ -110,10 +108,8 @@ static int intel_eth_plat_probe(struct platform_device *pdev)
>  		/* Enable TX clock */
>  		if (dwmac->data->tx_clk_en) {
>  			dwmac->tx_clk = devm_clk_get(&pdev->dev, "tx_clk");
> -			if (IS_ERR(dwmac->tx_clk)) {
> -				ret = PTR_ERR(dwmac->tx_clk);
> -				goto err_remove_config_dt;
> -			}
> +			if (IS_ERR(dwmac->tx_clk))
> +				return PTR_ERR(dwmac->tx_clk);
>  
>  			clk_prepare_enable(dwmac->tx_clk);
>  
> @@ -126,7 +122,7 @@ static int intel_eth_plat_probe(struct platform_device *pdev)
>  				if (ret) {
>  					dev_err(&pdev->dev,
>  						"Failed to set tx_clk\n");
> -					goto err_remove_config_dt;
> +					return ret;
>  				}
>  			}
>  		}
> @@ -140,7 +136,7 @@ static int intel_eth_plat_probe(struct platform_device *pdev)
>  			if (ret) {
>  				dev_err(&pdev->dev,
>  					"Failed to set clk_ptp_ref\n");
> -				goto err_remove_config_dt;
> +				return ret;
>  			}
>  		}
>  	}
> @@ -158,22 +154,17 @@ static int intel_eth_plat_probe(struct platform_device *pdev)
>  	ret = stmmac_dvr_probe(&pdev->dev, plat_dat, &stmmac_res);
>  	if (ret) {

>  		clk_disable_unprepare(dwmac->tx_clk);
> -		goto err_remove_config_dt;
> +		return ret;

Just a general note IMO it's better for maintainability to have the
clean-up-on-error block than reverting the previous changes in the if
body. Thus should you add new functions call before the block in
subject you won't need to add duplicated cleanup functions calls, but
just add new reverting method invocation to the cleanup-on-error path.

-Serge(y)

>  	}
>  
>  	return 0;
> -
> -err_remove_config_dt:
> -	stmmac_remove_config_dt(pdev, plat_dat);
> -
> -	return ret;
>  }
>  
>  static void intel_eth_plat_remove(struct platform_device *pdev)
>  {
>  	struct intel_dwmac *dwmac = get_stmmac_bsp_priv(&pdev->dev);
>  
> -	stmmac_pltfr_remove(pdev);
> +	stmmac_pltfr_remove_no_dt(pdev);
>  	clk_disable_unprepare(dwmac->tx_clk);
>  }
>  
> -- 
> 2.40.1
> 
> 

