Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D6DBC43334
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Jul 2022 12:12:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mQ/hcGr/I/V5gOxH9+3HtKc0WRnaD95esCjmTcO4bQ0=; b=JCU18FAxg7nu6l9lhEkoaxv0KV
	7+pJRiSCfziGr7147+/+E4Ipg2S/AANDSzYan+tGksSc95qYTfDk8xnde8WWKZu//8mWiYrIIM51m
	qbkjVv64/ka7SeD/iDN4hvw9PRH46nD/TrfeRsD/G8mhVzkvNg7bCOYRK4Cy4ZeCl5YV8b8PLNDsP
	dcBwhOxrrlFP8DNUNogMmado52wu8tbwA2eZaffSMVKRQXGSG06OIk1JSVDwuGhSgKdKXrtJR4MwV
	zjNMPfrlXcpMriDOyrlm+Mtk41BOn3IVD4sQGYJYaj665RsJwRNfne2kk1ilqjw2/zV768qO/3fpG
	xf276T4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBbDl-003PED-03; Wed, 13 Jul 2022 12:12:01 +0000
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBbDZ-003PA8-9U; Wed, 13 Jul 2022 12:11:50 +0000
Received: by mail-qt1-x830.google.com with SMTP id r2so11669884qta.0;
        Wed, 13 Jul 2022 05:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=mQ/hcGr/I/V5gOxH9+3HtKc0WRnaD95esCjmTcO4bQ0=;
        b=FojwuT6sStHpE+uVYaLsaIIQad4I8HewXV7sDZTXbpuvLEXufIWG1ufnuRB4cMYyrz
         kPOha1HctNi444O/CECbg2EoAhrjZmGgxNVFHD7lVLdK/PjolGofJE+qgGrOlW1woIlQ
         JYGpYoVSxSjDrFE5ImvMQW+sEj+hNdRAYU6+/EU7ibVtPwJOake8jcjZ5xTfPSsdChIZ
         rfKZQzXtJzQlYU821MXv/QWkkZhUhL5xT/bTMvVhfQeeO9MCgoXK8WnblnnfdxOagYex
         G8U5s7/vMXpdFqGlPBx6CZMa0+adjTZHfVn/kHN+8qI4SM8geqkQmo8uZnFT0urSGFo/
         XVMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=mQ/hcGr/I/V5gOxH9+3HtKc0WRnaD95esCjmTcO4bQ0=;
        b=pBPDEaVygpsQhpkEgE04UOCF0fSSCbCt/extCkKsV0Qz0kdsYIatA/t5OBrpTDLcM4
         bdWD9jeawxY8mZ4fF9DVwZYkhpQdkLcMOmiCNErHfr6wr0UERjlGsyNwwaUfSEE/vBqD
         t+SDXwi1qq8YM5vpY/OIS8DtevwOauceyjESpvun+nvCZ+roX6KbxtmlAc7UenIwwkWy
         PCFfVH4Ww+cBrQUzufH8C4jQI/8Zh6793eOtajhtLPyLebIhq5Jo+TD80oc6IDaeqOTU
         p5N6TQ14Yo9oe2ZozRkoiAcMoQsDBtCjIG705GDneB0cN1tZ9zBDc+228Zotyz9XWx6q
         53IA==
X-Gm-Message-State: AJIora+fvrukOSiMhtprVTqMdAgV2+MnD+iCShCdHFqHgR0Z6cLsiOHz
	zUyKBuBpyp9oNgWbK/bfk9I=
X-Google-Smtp-Source: AGRyM1tQvQdoyjFYZfS1liJSgb+wrsI4bYFX7V+tmV4z8j3UvfsmISCnmKU2aLt9KbpEZgAIYIuBuQ==
X-Received: by 2002:ac8:5cd3:0:b0:316:f772:f0b8 with SMTP id s19-20020ac85cd3000000b00316f772f0b8mr2587700qta.162.1657714305566;
        Wed, 13 Jul 2022 05:11:45 -0700 (PDT)
Received: from [192.168.43.228] ([193.86.92.180])
        by smtp.gmail.com with ESMTPSA id h13-20020a05620a400d00b006b5bbd8cb92sm630846qko.55.2022.07.13.05.11.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Jul 2022 05:11:44 -0700 (PDT)
Message-ID: <c8fdfa7b-f4eb-8308-4064-b868ce945e3a@gmail.com>
Date: Wed, 13 Jul 2022 14:11:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH net v4 1/3] stmmac: dwmac-mediatek: fix clock issue
Content-Language: en-US
To: Biao Huang <biao.huang@mediatek.com>, David Miller <davem@davemloft.net>
Cc: Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, macpaul.lin@mediatek.com,
 Jisheng Zhang <jszhang@kernel.org>,
 Mohammad Athari Bin Ismail <mohammad.athari.ismail@intel.com>
References: <20220713101002.10970-1-biao.huang@mediatek.com>
 <20220713101002.10970-2-biao.huang@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220713101002.10970-2-biao.huang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220713_051149_380934_7B46DD76 
X-CRM114-Status: GOOD (  24.78  )
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



On 13/07/2022 12:10, Biao Huang wrote:
> The pm_runtime takes care of the clock handling in current
> stmmac drivers, and dwmac-mediatek implement the
> mediatek_dwmac_clks_config() as the callback for pm_runtime.
> 
> Then, stripping duplicated clocks handling in old init()/exit()
> to fix clock issue in suspend/resume test.
> 
> As to clocks in probe/remove, vendor need symmetric handling to
> ensure clocks balance.
> 
> Test pass, including suspend/resume and ko insertion/remove.
> 
> Fixes: 3186bdad97d5 ("stmmac: dwmac-mediatek: add platform level clocks management")
> Signed-off-by: Biao Huang <biao.huang@mediatek.com>
> ---
>   .../ethernet/stmicro/stmmac/dwmac-mediatek.c  | 49 ++++++++-----------
>   1 file changed, 21 insertions(+), 28 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
> index 6ff88df58767..ca8ab290013c 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
> @@ -576,32 +576,7 @@ static int mediatek_dwmac_init(struct platform_device *pdev, void *priv)
>   		}
>   	}
>   
> -	ret = clk_bulk_prepare_enable(variant->num_clks, plat->clks);
> -	if (ret) {
> -		dev_err(plat->dev, "failed to enable clks, err = %d\n", ret);
> -		return ret;
> -	}
> -
> -	ret = clk_prepare_enable(plat->rmii_internal_clk);
> -	if (ret) {
> -		dev_err(plat->dev, "failed to enable rmii internal clk, err = %d\n", ret);
> -		goto err_clk;
> -	}
> -
>   	return 0;
> -
> -err_clk:
> -	clk_bulk_disable_unprepare(variant->num_clks, plat->clks);
> -	return ret;
> -}
> -
> -static void mediatek_dwmac_exit(struct platform_device *pdev, void *priv)
> -{
> -	struct mediatek_dwmac_plat_data *plat = priv;
> -	const struct mediatek_dwmac_variant *variant = plat->variant;
> -
> -	clk_disable_unprepare(plat->rmii_internal_clk);
> -	clk_bulk_disable_unprepare(variant->num_clks, plat->clks);
>   }
>   
>   static int mediatek_dwmac_clks_config(void *priv, bool enabled)
> @@ -643,7 +618,6 @@ static int mediatek_dwmac_common_data(struct platform_device *pdev,
>   	plat->addr64 = priv_plat->variant->dma_bit_mask;
>   	plat->bsp_priv = priv_plat;
>   	plat->init = mediatek_dwmac_init;
> -	plat->exit = mediatek_dwmac_exit;
>   	plat->clks_config = mediatek_dwmac_clks_config;
>   	if (priv_plat->variant->dwmac_fix_mac_speed)
>   		plat->fix_mac_speed = priv_plat->variant->dwmac_fix_mac_speed;
> @@ -712,13 +686,32 @@ static int mediatek_dwmac_probe(struct platform_device *pdev)
>   	mediatek_dwmac_common_data(pdev, plat_dat, priv_plat);
>   	mediatek_dwmac_init(pdev, priv_plat);
>   
> +	ret = mediatek_dwmac_clks_config(priv_plat, true);
> +	if (ret)
> +		return ret;
> +
>   	ret = stmmac_dvr_probe(&pdev->dev, plat_dat, &stmmac_res);
>   	if (ret) {
>   		stmmac_remove_config_dt(pdev, plat_dat);
> -		return ret;
> +		goto err_drv_probe;
>   	}
>   
>   	return 0;
> +
> +err_drv_probe:
> +	mediatek_dwmac_clks_config(priv_plat, false);
> +	return ret;
> +}
> +
> +static int mediatek_dwmac_remove(struct platform_device *pdev)
> +{
> +	struct mediatek_dwmac_plat_data *priv_plat = get_stmmac_bsp_priv(&pdev->dev);
> +	int ret;
> +
> +	ret = stmmac_pltfr_remove(pdev);
> +	mediatek_dwmac_clks_config(priv_plat, false);
> +

We enalbe the clocks after calling stmmac_probe_config_dt(), so we should 
disable them before calling stmmac_pltfr_remove(), correct?

Other then that:
Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> +	return ret;
>   }
>   
>   static const struct of_device_id mediatek_dwmac_match[] = {
> @@ -733,7 +726,7 @@ MODULE_DEVICE_TABLE(of, mediatek_dwmac_match);
>   
>   static struct platform_driver mediatek_dwmac_driver = {
>   	.probe  = mediatek_dwmac_probe,
> -	.remove = stmmac_pltfr_remove,
> +	.remove = mediatek_dwmac_remove,
>   	.driver = {
>   		.name           = "dwmac-mediatek",
>   		.pm		= &stmmac_pltfr_pm_ops,

