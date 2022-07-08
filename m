Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6908C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Jul 2022 08:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P6Gd+dIUTT3KkGrv9ENkxJer9nCvFgdfmHoOd7OvfxA=; b=VyqnMOy/OFeoQ5H4t3Rni5+2Lo
	BpA4mEspMMQ69XZQ6YiAKjzSfiLg4yyC9TfrUHGpE/6ADNZuIYWzV2Z3ENxaIVeccmleoXn++Pg3F
	6S2r9QEjxw5ioZTBu+QmaCEhzwzIfhhzP07dKU9nUL1YIZJxKDAVXgDTpqtFBfpKl1PdVmqnoizxj
	sq1+Kv+BmgWvjwWkxn+2XBSt73JeSFeJien+3GIWo+gc+rqvgQEo14Mw7D9GtX6aBYv564Kt24mwU
	9yLPefCYJp2HercZVe5o9wNFbFTkOxh3D2MSleMoUpgpOnC0kpLRrtBEXQp6Qfm3iCZAU/NhxmAJN
	Ja2qR+Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9jCi-002TPp-Th; Fri, 08 Jul 2022 08:19:12 +0000
Received: from mail-il1-x129.google.com ([2607:f8b0:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9jBd-002Sr4-FO; Fri, 08 Jul 2022 08:18:06 +0000
Received: by mail-il1-x129.google.com with SMTP id n9so8301793ilq.12;
        Fri, 08 Jul 2022 01:18:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=P6Gd+dIUTT3KkGrv9ENkxJer9nCvFgdfmHoOd7OvfxA=;
        b=MXWXmsdiLUQnCnslmIwo2CH3pAvsVQmDpyWIyYp9f7wga1G+VyuLRAz/FltCJ0DMon
         qlSREkRY0G2UDgvQV1IwPGaoISST0gSuQeBY1XKGFgQvEqllJbydZSWKtUURftpz5Hpe
         XfeNCZpdv6p7oe/Yzhqb8WqZcTs8SmmIYIG+je+fKAwtkecCAzBbiWVMoIz7jAcMAzI2
         Uze4Yo3RQ7KwKqDvf+Uvsdp7aANozHX4n0LESp/DxleVp2ocNDmEeOirGG5BQU4Fw5V2
         Dques4ELlQEy+G+X5jOJEmyaldF5VIGSUmFxL6jOzUC0sIO25BQkgaferMTWPufdyidJ
         aTGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=P6Gd+dIUTT3KkGrv9ENkxJer9nCvFgdfmHoOd7OvfxA=;
        b=oMRaA798eElqalXeDC4EMXRpjhP2dgbd8w779jtwopBK97OY+SKCwFDrZb3RBA1ood
         lRee10G9US7sCN1zi1x51478ebzBY00E+qK/Nn/woDYcGySfr+Fr+K2rXCcJ5/DLRHtf
         Fy3aZuhAnIUm7Jt1hyB50jREiRp5p01sLwUoIni+VCn+iveXct4kFyfCr9RWSXidSJuT
         706rTK1wQ1ehAmC5wim/oUMIFYo5tS+rZHUel/oQekR2gLF57IXfEjGZv0DNAEMh9eUq
         AlUnADlv4YW4vhYBdHXToM4KOXNh7fwCNeSPT+xr/OY2mfXG1K0i9I7GAQMnKlZ6P9Tj
         47Cg==
X-Gm-Message-State: AJIora8SnyIFtI6FwHoWJguvZk1zxw3vTM6yGXI1TnlMyApPzTMg78D7
	0fjESp9uqUL9n38AtXPZr4I=
X-Google-Smtp-Source: AGRyM1sMYLA3oN2FhV8iRlBxBKPC6Ma2VfIhQd5iP198thNMgX+FuuPQHfTYCjFgSpS9UIvXNT8yBA==
X-Received: by 2002:a05:6e02:1549:b0:2dc:616a:1dd4 with SMTP id j9-20020a056e02154900b002dc616a1dd4mr47747ilu.131.1657268283864;
        Fri, 08 Jul 2022 01:18:03 -0700 (PDT)
Received: from [192.168.1.145] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id g18-20020a05663810f200b0033cbfb5202esm2928253jae.11.2022.07.08.01.18.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Jul 2022 01:18:02 -0700 (PDT)
Message-ID: <c088f936-00a1-4a7b-c995-dd49b011494f@gmail.com>
Date: Fri, 8 Jul 2022 10:17:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH net v2] stmmac: dwmac-mediatek: fix clock issue
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
References: <20220708075622.26342-1-biao.huang@mediatek.com>
 <20220708075622.26342-2-biao.huang@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220708075622.26342-2-biao.huang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220708_011805_593247_6380CE17 
X-CRM114-Status: GOOD (  20.39  )
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



On 08/07/2022 09:56, Biao Huang wrote:
> Since clocks are handled in mediatek_dwmac_clks_config(),
> remove the clocks configuration in init()/exit(), and
> invoke mediatek_dwmac_clks_config instead.
> 
> This issue is found in suspend/resume test.
> 
> Fixes: 3186bdad97d5 ("stmmac: dwmac-mediatek: add platform level clocks management")
> Signed-off-by: Biao Huang <biao.huang@mediatek.com>
> ---
>   .../ethernet/stmicro/stmmac/dwmac-mediatek.c  | 32 ++++++-------------
>   1 file changed, 10 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
> index 6ff88df58767..6d82cf2658e0 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
> @@ -576,32 +576,12 @@ static int mediatek_dwmac_init(struct platform_device *pdev, void *priv)
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
>   }
>   
>   static void mediatek_dwmac_exit(struct platform_device *pdev, void *priv)
>   {
> -	struct mediatek_dwmac_plat_data *plat = priv;
> -	const struct mediatek_dwmac_variant *variant = plat->variant;
> -
> -	clk_disable_unprepare(plat->rmii_internal_clk);
> -	clk_bulk_disable_unprepare(variant->num_clks, plat->clks);
> +	/* nothing to do now */

We can just leave the function pointer point to NULL, that get checked before 
calling exit.

Regards,
Matthias

>   }
>   
>   static int mediatek_dwmac_clks_config(void *priv, bool enabled)
> @@ -712,13 +692,21 @@ static int mediatek_dwmac_probe(struct platform_device *pdev)
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

