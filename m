Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70A1AC43334
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Jul 2022 09:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U7/XgC9RN4le35mQLRbV3pgGUKx0V1tiTu9hGjasAGI=; b=0uOR+n0NFgqLqpMYDkyoH3W5jE
	TS3PnXa9Q1gmhPALMfape0lO2QBc8LKbcbT/nZ75fajMyhvsGvEqLAHD2Og/MBeJ3aV3z1jO57DPk
	FD3uT491x8G8xv2d2/n4JAN7TnmWCH762UhiIi9CeWkR98jBpvJ5n+6URn8dkeVj9GbrdlvuPC4wF
	mKHe/44YOzGF73GY+T07zDfes5PoXUa9rU1xmAYltdxk9AE/P/0dRcy5G0t4LWNOpH3FL8KpAV8/Q
	ZUDtlPfuf+WuZ2gHjcyw4M5SmxhrSkW7d4Re8DKOyj7euzzwA68bA/ZRY/z1PKgrW4578eh+EPXlQ
	CDJmzWfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9kCn-002sfe-Ex; Fri, 08 Jul 2022 09:23:21 +0000
Received: from mail-io1-xd34.google.com ([2607:f8b0:4864:20::d34])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9kCT-002sRy-RC; Fri, 08 Jul 2022 09:23:07 +0000
Received: by mail-io1-xd34.google.com with SMTP id l24so19162144ion.13;
        Fri, 08 Jul 2022 02:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=U7/XgC9RN4le35mQLRbV3pgGUKx0V1tiTu9hGjasAGI=;
        b=SEK73+0Tdh+TtsYAOudd9GcFL0cnMQL6EwVH3NZG1Q30TqNpGfwvwxVJ2yocAZX8c+
         tgT9JhTrxCYfJbYfH0P20SPZcvRqLljpJC9Lqbn8Ai+p4Hoy88XH5B3Ha0zLOPlN4iYB
         3ZTQwMWmO1icAlPKhiYJqlojNR+8r3BJDGPkPcVh20KoN95cOiE3gUDbDhl+BsQJcDLy
         mqhmI2yhnR3shxv2ESZ1BlMBJuSty2Y+4vKsbAG+W5Bwi1tXBKgHR+vlDlxZFWQW26qz
         32gBntj83aot+8Ro4KWE1AXAxSgNtonorWstIOMmxwFD7D813RUTpEPn1XeNoGb+rtg7
         CaVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=U7/XgC9RN4le35mQLRbV3pgGUKx0V1tiTu9hGjasAGI=;
        b=wZ39B86kCBjYO2+CyiEFM+INwTi4R5tDAD+IC6ni/8k8MEaac6bNpymQY7LTj4FLzM
         W88VHx5/O31iUGTqCQJnPww2mz3CXVdBlZmkaR8f4BaA/8nZNi8FVY9oqg0FCV/40jLV
         Wait28grzv+dw4g/KvXOYRYdVDM6Tn696EcmuNXjk++c6omdPsCHRU4Hax/G5j0Y48AX
         s83fsi4WIXGVDmgmX7H8aN9Ki6a7xcMaevLO6R8K4znqVXLTfI8eZrQUnfw3Xj6OzshB
         CpvNo1j+IyMBmeGb7jK3HMI4avCYiHIrc25ugH1EBFcEURHn7f+nYZL1qFN25faTPRGh
         djtw==
X-Gm-Message-State: AJIora+xuiVcZnoEKWJb8CwQxNdTPbEzpQgKb0G8OHTq3VHn4Byr9Rdb
	mw95QJDySPL2znDpqOAty/s=
X-Google-Smtp-Source: AGRyM1t2xWCoYr09Jo0vvMoTX8WrRJ5XuGWsryJmy0bfppS9LrrILQXKs9QWucfoDSuMtqnmbOifuQ==
X-Received: by 2002:a05:6602:164a:b0:678:682f:568b with SMTP id y10-20020a056602164a00b00678682f568bmr1403979iow.187.1657272179559;
        Fri, 08 Jul 2022 02:22:59 -0700 (PDT)
Received: from [192.168.1.145] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id l10-20020a92d94a000000b002dc616d93acsm63916ilq.28.2022.07.08.02.22.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Jul 2022 02:22:58 -0700 (PDT)
Message-ID: <14bf5e6b-4230-fffc-4134-c3015cf4d262@gmail.com>
Date: Fri, 8 Jul 2022 11:22:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH net v3] stmmac: dwmac-mediatek: fix clock issue
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
 linux-mediatek@lists.infradead.org, macpaul.lin@mediatek.com
References: <20220708083937.27334-1-biao.huang@mediatek.com>
 <20220708083937.27334-2-biao.huang@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220708083937.27334-2-biao.huang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220708_022302_008883_E2994A1A 
X-CRM114-Status: GOOD (  22.57  )
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



On 08/07/2022 10:39, Biao Huang wrote:
> Since clocks are handled in mediatek_dwmac_clks_config(),
> remove the clocks configuration in init()/exit(), and
> invoke mediatek_dwmac_clks_config instead.
> 
> This issue is found in suspend/resume test.
> 

Commit message is rather confusing. Basically you are moving the clock enable 
into probe instead of init and remove it from exit. That means, clocks get 
enabled earlier and don't get disabled if the module gets unloaded. That doesn't 
sound correct, I think we would at least need to disable the clocks in remove 
function.

I suppose that suspend calls exit and that there was a problem when we disable 
the clocks there. Is this a HW issue that has no other possible fix?

Regards,
Matthias

> Fixes: 3186bdad97d5 ("stmmac: dwmac-mediatek: add platform level clocks management")
> Signed-off-by: Biao Huang <biao.huang@mediatek.com>
> ---
>   .../ethernet/stmicro/stmmac/dwmac-mediatek.c  | 36 +++++--------------
>   1 file changed, 9 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
> index 6ff88df58767..e86f3e125cb4 100644
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
> @@ -712,13 +686,21 @@ static int mediatek_dwmac_probe(struct platform_device *pdev)
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
>   }
>   
>   static const struct of_device_id mediatek_dwmac_match[] = {

