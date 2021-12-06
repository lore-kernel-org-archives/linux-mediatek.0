Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E470C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Dec 2021 15:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xkLEsOoR5v7s2FGV1k03Dftcgo8SFQ3seWsc9BJMU+4=; b=DIauqJdbxtAgd4IYfisbUqJP7k
	R+psmO0e52i5uBIpEfYLG/6M7rKBxJJSAE8Tp9SFWQ1yDAQEYHpws+2eevoPPBTPecfmO2418H3Jy
	/82vTkPQrTEHE3yZgK/IF0V0b86swnqvhyXNxQOM+ysaIXriSAOF/UTz0X7skpNLSoyscvV53kIiV
	7SoCYpYveDI1Ir5ph2HOUBYLrZXTJm/lQWFqxrq+JX3UOava7Vcp7Kt6Ze+40kj1MAq3xleQm3rr/
	N8J46xfToILge32YraPMLnmx2hKIM2FpNYoJOITASrZ2Coxz4Q64I7Vl8hnlQAoKuCrmEzANozSZg
	fftwvKUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muFi4-004Rit-9j; Mon, 06 Dec 2021 15:15:20 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muFhZ-004RV0-7T; Mon, 06 Dec 2021 15:14:50 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 265421F4488A
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
 t=1638803687; bh=0wYI5HLADYAd4xSANRFLZ/t5SGL4HjQoUDDbtVZMntw=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=F3i+qP58ek+QIKjw1gTAd6rIjXU196UrMqKi+DJqxtwKT9teAAAKYDKlz5oFjx46y
 FPqYUOo3CrAC3nuDPAyR2f16fDPcNAwAenlgSg0xB58532r5z07c3PBmgezyJ6ti6L
 KebBY0RT6kj0OndKhn9btJ7CLlBQznplhoMfPx+oIn44P4Yp4uw0SnnewMaBvZ7IeD
 KxkWDS4nJRLje/JEm0LgJyq17nuMAIFq11UWBpXnIAKA8FrW2f2CGgYXRyyVob+1Mx
 FVg68HlMTJE1lQAItxtheu4WVmAArwN9qGVH7ibsCT2t5b0jghIuqZzlmT9nYhBXVH
 FiDZ12bt+YGDw==
Subject: Re: [PATCH v4 1/7] net-next: stmmac: dwmac-mediatek: add platform
 level clocks management
To: Biao Huang <biao.huang@mediatek.com>, davem@davemloft.net,
 Jakub Kicinski <kuba@kernel.org>, Rob Herring <robh+dt@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, srv_heupstream@mediatek.com,
 macpaul.lin@mediatek.com, dkirjanov@suse.de
References: <20211203063418.14892-1-biao.huang@mediatek.com>
 <20211203063418.14892-2-biao.huang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <9dc0cbc3-8de0-f1ed-cfc9-852b7e69ab3c@collabora.com>
Date: Mon, 6 Dec 2021 16:14:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211203063418.14892-2-biao.huang@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211206_071449_477741_86987455 
X-CRM114-Status: GOOD (  21.48  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 03/12/21 07:34, Biao Huang ha scritto:
> This patch implements clks_config callback for dwmac-mediatek platform,
> which could support platform level clocks management.
> 
> Signed-off-by: Biao Huang <biao.huang@mediatek.com>
> ---
>   .../ethernet/stmicro/stmmac/dwmac-mediatek.c  | 24 ++++++++++++++-----
>   1 file changed, 18 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
> index 58c0feaa8131..157ff655c85e 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
> @@ -359,9 +359,6 @@ static int mediatek_dwmac_init(struct platform_device *pdev, void *priv)
>   		return ret;
>   	}
>   
> -	pm_runtime_enable(&pdev->dev);
> -	pm_runtime_get_sync(&pdev->dev);
> -
>   	return 0;
>   }
>   
> @@ -370,11 +367,25 @@ static void mediatek_dwmac_exit(struct platform_device *pdev, void *priv)
>   	struct mediatek_dwmac_plat_data *plat = priv;
>   
>   	clk_bulk_disable_unprepare(plat->num_clks_to_config, plat->clks);
> -
> -	pm_runtime_put_sync(&pdev->dev);
> -	pm_runtime_disable(&pdev->dev);
>   }
>   
> +static int mediatek_dwmac_clks_config(void *priv, bool enabled)
> +{
> +	struct mediatek_dwmac_plat_data *plat = priv;
> +	int ret = 0;
> +
> +	if (enabled) {
> +		ret = clk_bulk_prepare_enable(plat->num_clks_to_config, plat->clks);
> +		if (ret) {
> +			dev_err(plat->dev, "failed to enable clks, err = %d\n", ret);
> +			return ret;
> +		}
> +	} else {
> +		clk_bulk_disable_unprepare(plat->num_clks_to_config, plat->clks);
> +	}
> +
> +	return ret;
> +}
>   static int mediatek_dwmac_probe(struct platform_device *pdev)
>   {
>   	struct mediatek_dwmac_plat_data *priv_plat;
> @@ -420,6 +431,7 @@ static int mediatek_dwmac_probe(struct platform_device *pdev)
>   	plat_dat->bsp_priv = priv_plat;
>   	plat_dat->init = mediatek_dwmac_init;
>   	plat_dat->exit = mediatek_dwmac_exit;
> +	plat_dat->clks_config = mediatek_dwmac_clks_config;
>   	mediatek_dwmac_init(pdev, priv_plat);
>   
>   	ret = stmmac_dvr_probe(&pdev->dev, plat_dat, &stmmac_res);
> 

Hello Biao,

you're removing all calls to pm_runtime_* functions, so there is no more reason
to include linux/pm_runtime.h in this file: please also remove the inclusion.

Thanks!

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
