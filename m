Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 621E5C4332F
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Oct 2022 09:55:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EQLF9Gdg5kyV17HOMFelIS/xaSg7EsLEbbwxSRci1Qc=; b=ZHSZvyQaVFEeET2elup+1TIqAR
	ZYO2VqDL353xhnHCP+NRRBb4yeMLX1vfPdmYFAFFaj3DQu6WFeKjcuOEMhcjeq7kOJbZ8/5K9Pm8F
	OCDI2e0/qZcerdauLNXbruBgDyNHle0d7lGmQjtjXxcLmFozAzbZS5XmiQQQTHTCRYF8tYu1Kliag
	AT+l2KFX1BDNc2sMOE9AEDF+hB/RVrJizDEfjDVsB7o8FJG6tCG7c5qj5zK+gOtrL46mwvsaNVuBE
	lqk3ZHqe53PBh4eZmUNA+fnORy67DIpW/Fa+8x7RC8CrbvL+KTaO9ChYU2sJXUpoNcwwKKgcyMQf8
	59XKvn9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okMpz-00A2Ef-GZ; Mon, 17 Oct 2022 09:55:11 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okMpw-00A1vy-6x
	for linux-mediatek@lists.infradead.org; Mon, 17 Oct 2022 09:55:09 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 344686601DA4;
	Mon, 17 Oct 2022 10:55:03 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1666000503;
	bh=0BGJxth/S0cNSBwudzgf7uq5wUi6jmEBT0hxDiCnJSE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ZK8/v6eB59PCqq2XBOMJ3EbV5yNBZZhqilUJZEtiAj4YQedbewT0Q0VJt0sb7fQv5
	 5tWZdoj1SKVv4bz5hOmdUU6b/kkxx9ZV8x9/rnb68i4UuerrdnnPgR2hFLlyk53+2/
	 Oo8NZMy5eLOd9guuT5iwna/UiO9xYZZZjLxlAfK1raVCLTG5Wiq/e2KD95ompInJTy
	 CB+zasvUS2TU+7u1yNtpcA+O3msUXT668hJH4nKKOWyxkLaCHIQ4De7zzSQ+EsHDdQ
	 LdDPGGJEAxn2U0yr5w4EdCu+Fom3v1r2s+M/EVXiwk/HSCbSvkrRRspowuX1Qr0e8X
	 5zHQa4O7gAH1Q==
Message-ID: <b2eb0582-85c8-47be-7004-b527e1fb2e41@collabora.com>
Date: Mon, 17 Oct 2022 11:55:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH net 1/3] net: ethernet: mtk_eth_soc: fix possible memory
 leak in mtk_probe()
Content-Language: en-US
To: Yang Yingliang <yangyingliang@huawei.com>,
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Cc: nbd@nbd.name, davem@davemloft.net
References: <20221017035156.2497448-1-yangyingliang@huawei.com>
 <20221017035156.2497448-2-yangyingliang@huawei.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221017035156.2497448-2-yangyingliang@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221017_025508_529045_0C9FA419 
X-CRM114-Status: GOOD (  20.31  )
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

Il 17/10/22 05:51, Yang Yingliang ha scritto:
> If mtk_wed_add_hw() has been called, mtk_wed_exit() needs be called
> in error path or removing module to free the memory allocated in
> mtk_wed_add_hw().
> 
> Fixes: 804775dfc288 ("net: ethernet: mtk_eth_soc: add support for Wireless Ethernet Dispatch (WED)")
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> ---
>   drivers/net/ethernet/mediatek/mtk_eth_soc.c | 17 ++++++++++++-----
>   1 file changed, 12 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> index 4fba7cb0144b..7cd381530aa4 100644
> --- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> +++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> @@ -4060,19 +4060,23 @@ static int mtk_probe(struct platform_device *pdev)
>   			eth->irq[i] = platform_get_irq(pdev, i);
>   		if (eth->irq[i] < 0) {
>   			dev_err(&pdev->dev, "no IRQ%d resource found\n", i);
> -			return -ENXIO;
> +			err = -ENXIO;
> +			goto err_wed_exit;
>   		}
>   	}
>   	for (i = 0; i < ARRAY_SIZE(eth->clks); i++) {
>   		eth->clks[i] = devm_clk_get(eth->dev,
>   					    mtk_clks_source_name[i]);
>   		if (IS_ERR(eth->clks[i])) {
> -			if (PTR_ERR(eth->clks[i]) == -EPROBE_DEFER)
> -				return -EPROBE_DEFER;
> +			if (PTR_ERR(eth->clks[i]) == -EPROBE_DEFER) {
> +				err = -EPROBE_DEFER;
> +				goto err_wed_exit;
> +			}
>   			if (eth->soc->required_clks & BIT(i)) {
>   				dev_err(&pdev->dev, "clock %s not found\n",
>   					mtk_clks_source_name[i]);
> -				return -EINVAL;
> +				err = -EINVAL;
> +				goto err_wed_exit;
>   			}
>   			eth->clks[i] = NULL;
>   		}
> @@ -4083,7 +4087,7 @@ static int mtk_probe(struct platform_device *pdev)
>   
>   	err = mtk_hw_init(eth);
>   	if (err)
> -		return err;
> +		goto err_wed_exit;
>   
>   	eth->hwlro = MTK_HAS_CAPS(eth->soc->caps, MTK_HWLRO);
>   
> @@ -4179,6 +4183,8 @@ static int mtk_probe(struct platform_device *pdev)
>   	mtk_free_dev(eth);
>   err_deinit_hw:
>   	mtk_hw_deinit(eth);
> +err_wed_exit:
> +	mtk_wed_exit();

mtk_wed_add_hw() happens *only* if eth->soc->offload_version == true.
To make this clean, mtk_wed_exit() should be called only if mtk_wed_add_hw()
was ever called, so you have to add a check here.


>   
>   	return err;
>   }
> @@ -4198,6 +4204,7 @@ static int mtk_remove(struct platform_device *pdev)
>   		phylink_disconnect_phy(mac->phylink);
>   	}
>   
> +	mtk_wed_exit();

...and here as well.

Regards,
Angelo

>   	mtk_hw_deinit(eth);
>   
>   	netif_napi_del(&eth->tx_napi);



