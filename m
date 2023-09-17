Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36F2BCD37B4
	for <linux-mediatek@archiver.kernel.org>; Sun, 17 Sep 2023 14:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t8OnI6u0cEOFTJYu1llDUXyx2auo+am+q/WLsax6FAQ=; b=P4fiVB5/hasIAHsElcrnIDjPHA
	kh3OelLjYorv3GwUBK+I+Gx/IlL5+ZT1UrkwE4ukGcCBnLdem55/TkcYtrxGuxQ8L1tUgX4Tsu9Vt
	MCpJ7bi36kbpDPgVyCetrwqpC27IW87pnSXThBjPUrGDIqqhF520IB55BAkVdxtCO+BgsVB/JYmXq
	TE1NiVLoIcA9yAAx12rg+ZrLYzsKFPj6optMHVeWfLERqc0OJS8liibXC4xZODRtYSlymHOuqzYgC
	gXOVwcymM0uHMQFMXtFXmvU9tuAQIHsYKnA2IigTpC+pl+iozgYGGubnj9f44vTNNnyxeb9dXkJ+x
	leggk/Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qhsyf-00DjK9-19;
	Sun, 17 Sep 2023 14:42:25 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qhsyb-00DjJG-1c;
	Sun, 17 Sep 2023 14:42:22 +0000
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2c007d6159aso4122331fa.3;
        Sun, 17 Sep 2023 07:42:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1694961737; x=1695566537; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t8OnI6u0cEOFTJYu1llDUXyx2auo+am+q/WLsax6FAQ=;
        b=TB1zY4Xq7SbW5kJOIr6/Gu5SmVUdDUOQVyfwpDyivV0u6vXM4KUN4x1qX37/fFthQm
         ScuuWwGBVPD0vKlr2vn3ESp/Rwit3YVvB4TuE3/S9v/YYI9VKZnrHVOSvpBPEEt5duAE
         5MAf4pE4vzDKiSDmDNVPCLoJChog6L3X166BKti/gX7HiKnmrWlThCkuDwu/42ETW49L
         kSXDWLtPpvMc6aXTvBbxs8waCKudQL6tsASeYCvH2PbUh3K5qr2POQwigGvZuFq3T3dc
         RqTQ4GgvRTFzQAImk8l12EWCHGsh6HwtKT3LM35JvCe610EaCBIZM/n3tLbE+9AhXSXj
         1GIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694961737; x=1695566537;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t8OnI6u0cEOFTJYu1llDUXyx2auo+am+q/WLsax6FAQ=;
        b=a8RRWziN3ZrQrsCq+1Ert9Dpad1aPra6ENzYF1/32QUh9Pq4+lVBd8+u3s0QC9jDrh
         wFdPwHT+hr/HNMuQNQ+QpZd3zQw3eIr3w5uKrv7YNxzYYtWlIewkNQqfxFtZytOXnWYy
         Y+sIQsnUnGfoNzY4Hon0WzA+pL2VVTnLYlQJLXLVQtBZydDoN2MLtZOSfPyTHatBTLqE
         ZckbMtJV62YigK8xWiG+LoQ9FW3+h5O3La7cpXMtez2jL+sugUi0AXv8/MYnXYtyMemR
         NDQ1mEk+ZKJCgZTl7BlgKHcJ/SGacGc51ROrzt7yyJuZH1xegujTxjBnoJ3nUAKQq8II
         kKGw==
X-Gm-Message-State: AOJu0YyXtynxo9dwfNwmfdVjVkUSsCeqcfqI6IMIAgRgjzBI6nmv2ecx
	FWYBhrJlDH7dJWlSYq49xlU=
X-Google-Smtp-Source: AGHT+IGCwEla40TgXmbfl+4SNqk+BjMa1n4H5XAPcLrxUPNV78F+jE9Mq3MjRLIpRqip9g6ySlXEyA==
X-Received: by 2002:a05:651c:1245:b0:2c0:d44:6162 with SMTP id h5-20020a05651c124500b002c00d446162mr250029ljh.12.1694961736917;
        Sun, 17 Sep 2023 07:42:16 -0700 (PDT)
Received: from jernej-laptop.localnet (APN-123-246-155-gprs.simobil.net. [46.123.246.155])
        by smtp.gmail.com with ESMTPSA id gz2-20020a170906f2c200b009ae05f9eab3sm624439ejb.65.2023.09.17.07.42.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Sep 2023 07:42:16 -0700 (PDT)
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
Subject: Re: [PATCH net-next v2 18/23] net: stmmac: dwmac-sun8i: use
 devm_stmmac_probe_config_dt()
Date: Sun, 17 Sep 2023 16:42:12 +0200
Message-ID: <2701959.mvXUDI8C0e@jernej-laptop>
In-Reply-To: <20230916075829.1560-19-jszhang@kernel.org>
References: <20230916075829.1560-1-jszhang@kernel.org>
 <20230916075829.1560-19-jszhang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230917_074221_535869_A79C56AB 
X-CRM114-Status: GOOD (  15.52  )
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

Dne sobota, 16. september 2023 ob 09:58:24 CEST je Jisheng Zhang napisal(a):
> Simplify the driver's probe() function by using the devres
> variant of stmmac_probe_config_dt().
> 
> The calling of stmmac_pltfr_remove() now needs to be switched to
> stmmac_pltfr_remove_no_dt().
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c index
> 01e77368eef1..63a7e5e53d7b 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> @@ -1224,7 +1224,7 @@ static int sun8i_dwmac_probe(struct platform_device
> *pdev) if (ret)
>  		return -EINVAL;
> 
> -	plat_dat = stmmac_probe_config_dt(pdev, stmmac_res.mac);
> +	plat_dat = devm_stmmac_probe_config_dt(pdev, stmmac_res.mac);
>  	if (IS_ERR(plat_dat))
>  		return PTR_ERR(plat_dat);
> 
> @@ -1244,7 +1244,7 @@ static int sun8i_dwmac_probe(struct platform_device
> *pdev)
> 
>  	ret = sun8i_dwmac_set_syscon(&pdev->dev, plat_dat);
>  	if (ret)
> -		goto dwmac_deconfig;
> +		return ret;
> 
>  	ret = sun8i_dwmac_init(pdev, plat_dat->bsp_priv);
>  	if (ret)
> @@ -1295,8 +1295,6 @@ static int sun8i_dwmac_probe(struct platform_device
> *pdev) sun8i_dwmac_exit(pdev, gmac);
>  dwmac_syscon:
>  	sun8i_dwmac_unset_syscon(gmac);
> -dwmac_deconfig:
> -	stmmac_remove_config_dt(pdev, plat_dat);
> 
>  	return ret;
>  }
> @@ -1314,7 +1312,7 @@ static void sun8i_dwmac_remove(struct platform_device
> *pdev) clk_put(gmac->ephy_clk);
>  	}
> 
> -	stmmac_pltfr_remove(pdev);
> +	stmmac_pltfr_remove_no_dt(pdev);
>  	sun8i_dwmac_unset_syscon(gmac);
>  }





