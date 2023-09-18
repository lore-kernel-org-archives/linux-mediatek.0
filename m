Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AC17CD37B0
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Sep 2023 19:28:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YUNA23giNsy9yXBhE6+Kf6gNULsVNoBVOIJ8OFSJNNc=; b=mSZlJTT9dAdfInvSEB/6zNAL01
	4eU5KVRth99HP4yCd/em6x4QHjeef0I1068p/FeYkJ0kCsBFJ2MK4D2zl4aq88vguh7j152dP6tEx
	3mERISHghcpH2CltEHFopI16r49IG8wkp2QsetXuwepK0qidpNbEUD7W/BG6agtW//nUJePnfsKIk
	VTuHcZB3LVgJdT11cYSr4EXVpzsql639k1r1MhcN1200cg/s8I7OfqwUp2ylsHfCcmq9MVlM7ZfOJ
	uMJrOGReljN6GjK32IdpyCDp8HpMb+zNHazKQMzDQaT9lU7Ksij38wopgJumlAbAT6z89/2Krw31M
	Ozy7ltOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiJue-00GC3F-0N;
	Mon, 18 Sep 2023 19:28:04 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiJua-00GC2I-10;
	Mon, 18 Sep 2023 19:28:01 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-50098cc8967so7879231e87.1;
        Mon, 18 Sep 2023 12:27:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695065275; x=1695670075; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YUNA23giNsy9yXBhE6+Kf6gNULsVNoBVOIJ8OFSJNNc=;
        b=We6vnCKe+fxwq+UbYKb9TpnLdZUxjhosgC184z328OahoyTdfDiTWcGgnYXrY/q4OX
         FEsvl+eP9lK9NtquLrXVys5qwK7m9l9BPfCNanVNAJ4bUJ4BL8cXeb/OKU1fHslDZT+7
         YDycXMiGvR1/Vl/k1XZ8f7UkkZJnrQR/igcemAv96wwmXvpfjKM8KGOO0AG0u2eFICf2
         XS1vEq81PISQPPbknVQCSS4TwC1fkj+Zo2Z+Pgii1yNBbeyvPzI5Zg+r60pgjN5FS9h4
         9+f/1ZirHuhA7IxW6pVttQgD63RM+ZU1QGcs387Xi4+LgK3zN74qd9skbRixytMeAd1D
         94Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695065275; x=1695670075;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YUNA23giNsy9yXBhE6+Kf6gNULsVNoBVOIJ8OFSJNNc=;
        b=lD2XWDAESkcpkNVoZAqvnD4KLCUPeT9fifZNgab6+U8iQjU9jIVdlTK+vD3TMNZ4IY
         pfpIzGR1SH4UESZr9e2v/CxLTGxBqwM9saNQ77eNmGFUc9QxbG9+IBiZ81GrhQH+JA8h
         BRAlIABPk0XiIDJinwL+7obdMKZvc20EwvHzWg9GSPYx87SprIGV+AJoBulvAGg8/c81
         HX6kPLiSZAkMztY0XycyAZBDdYYxiXGfGLmXdWuc6x/ICBn4Etbk30xVFUp0j4Bv9hZV
         oPtNPS7Z7UhSoh1ZJ4XDK0njiZk+O9ftpGIVYMz+mUe37O92e+AgPKWSNjUxV94v+NQt
         ghGw==
X-Gm-Message-State: AOJu0YxrezGSjFncnFCHfVbTldP+RK1g8SaL1oubDZm96VqXv8hE8BSG
	81pl2a6WcRJFsoiMWnzscSM=
X-Google-Smtp-Source: AGHT+IHj4oSlgl2LSDqV5ANHoqz74jHZgqunRahPHglIvps97t3ij8W0vmwiuA1EgpsdIxEnzqZXEg==
X-Received: by 2002:a05:6512:962:b0:501:c3ee:62ec with SMTP id v2-20020a056512096200b00501c3ee62ecmr7844316lft.12.1695065275122;
        Mon, 18 Sep 2023 12:27:55 -0700 (PDT)
Received: from mobilestation ([85.140.3.118])
        by smtp.gmail.com with ESMTPSA id v22-20020ac25936000000b005009920b6afsm1941264lfi.9.2023.09.18.12.27.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Sep 2023 12:27:54 -0700 (PDT)
Date: Mon, 18 Sep 2023 22:27:50 +0300
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
Subject: Re: [PATCH net-next v2 01/23] net: stmmac: dwmac-anarion: use
 devm_stmmac_probe_config_dt()
Message-ID: <3zzbxnzkhlucscfx5h4h6k3lyhqln2nwmcsgb3dvzn6xqkhhdw@nrpekwfahkua>
References: <20230916075829.1560-1-jszhang@kernel.org>
 <20230916075829.1560-2-jszhang@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230916075829.1560-2-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230918_122800_355044_67FF8EE2 
X-CRM114-Status: GOOD (  24.06  )
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

On Sat, Sep 16, 2023 at 03:58:07PM +0800, Jisheng Zhang wrote:
> Simplify the driver's probe() function by using the devres
> variant of stmmac_probe_config_dt().
> 
> The remove_new() callback now needs to be switched to
> stmmac_pltfr_remove_no_dt().
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-anarion.c | 12 +++---------
>  1 file changed, 3 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-anarion.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-anarion.c
> index 58a7f08e8d78..0df3a2ad0986 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-anarion.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-anarion.c
> @@ -115,7 +115,7 @@ static int anarion_dwmac_probe(struct platform_device *pdev)
>  	if (IS_ERR(gmac))
>  		return PTR_ERR(gmac);
>  
> -	plat_dat = stmmac_probe_config_dt(pdev, stmmac_res.mac);
> +	plat_dat = devm_stmmac_probe_config_dt(pdev, stmmac_res.mac);
>  	if (IS_ERR(plat_dat))
>  		return PTR_ERR(plat_dat);
>  
> @@ -124,13 +124,7 @@ static int anarion_dwmac_probe(struct platform_device *pdev)
>  	anarion_gmac_init(pdev, gmac);
>  	plat_dat->bsp_priv = gmac;
>  
> -	ret = stmmac_dvr_probe(&pdev->dev, plat_dat, &stmmac_res);
> -	if (ret) {
> -		stmmac_remove_config_dt(pdev, plat_dat);
> -		return ret;
> -	}
> -
> -	return 0;
> +	return stmmac_dvr_probe(&pdev->dev, plat_dat, &stmmac_res);

Just a general note, IMO it's better from maintainability point of
view to use the pattern:

	ret = func();
	if (ret)
		return ret;

	return 0;

Thus should you need to add any functions call after or before the
func() method invocation with possible clean-up-on-error code the
change patch will look a bit simpler and more readable.

-Serge(y)

>  }
>  
>  static const struct of_device_id anarion_dwmac_match[] = {
> @@ -141,7 +135,7 @@ MODULE_DEVICE_TABLE(of, anarion_dwmac_match);
>  
>  static struct platform_driver anarion_dwmac_driver = {
>  	.probe  = anarion_dwmac_probe,
> -	.remove_new = stmmac_pltfr_remove,
> +	.remove_new = stmmac_pltfr_remove_no_dt,
>  	.driver = {
>  		.name           = "anarion-dwmac",
>  		.pm		= &stmmac_pltfr_pm_ops,
> -- 
> 2.40.1
> 
> 

