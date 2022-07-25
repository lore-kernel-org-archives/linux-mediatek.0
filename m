Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECE4EC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Jul 2022 09:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MYK+t8d6WH5uuTgd+g612Qq/d/3ZBJw/mt5J9hb9180=; b=CIWOkxUhWMQKNiYzoaO2ht5ToM
	TZyrktlzMJgj4wIWOXy2v05vHopiHyfDF1KAnI8+aNhfDh/a0JeZz5ncwTqhzjXOOeivgarnLW/2/
	RS+x/IsSiPenAGjdqNDAZE9LPqi2zvqI2dD+nqD/Jx3Ki1xGohoKSwgXMtXmlt79Z3gllGxCvGJ7R
	6KN0SdHb1OK0ON+ZY8lywAva+dinRPVu+bvzrXfhe2MCd24peAmhx5keCYLE+3keGzSome7jKicmp
	9eXK2QRUeAIDvBm2ytNqdVhAfQEhZZ52pf0od8mlfA4hcHbGRkgPtR/w1VbIP6XVs31vm+USjxXZh
	8eNiWrhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFu3y-007KRa-PJ; Mon, 25 Jul 2022 09:07:42 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFu3k-007KJt-JL; Mon, 25 Jul 2022 09:07:30 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 8899066015E7;
	Mon, 25 Jul 2022 10:07:26 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1658740047;
	bh=uBO/pkzkv5EBZYyQnsx8/L7C7pGHaycXjjQey8xXLe4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QbtCyY/TkCm/cZ6AZqWzL7/QMYs2ImlWgUzVxfDiic5PcKm8bW9KeO+u+AdbMM+Z5
	 bI0DjNsw21DmjykhDxvsLDyL1ImWvZ3OX2VSLVeSLlAM5D5uslVqbPAImGNKuZhzMf
	 KetO4iahmMfcG0fIOg9u+5J0dbyU2UXGs6FSJn54KQ+gqrvaEasYO8sUe9uotVNFkb
	 G72Aby95gW0LR8kpNE0tlQlRlmQv4Ulnzu48hz39lC8Tct1N1XO7Dk9CLcjrnvtun3
	 xfll+2wTR+urIfDaTR5MdkiKhFzVMVuK1q5YVk/ROibH5h5QwLFEQ0brJiHvTjaOVQ
	 CUnU9FPjpDKog==
Message-ID: <59d9e674-2021-b02e-4ec8-aee8a118a96d@collabora.com>
Date: Mon, 25 Jul 2022 11:07:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 3/4] soc: mediatek: add support of MTK_SCPD_STRICT_BUSP
 cap
Content-Language: en-US
To: Markus Schneider-Pargmann <msp@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Weiyi Lu <weiyi.lu@mediatek.com>
Cc: Fabien Parent <parent.f@gmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Alexandre Bailon <abailon@baylibre.com>,
 Fabien Parent <fparent@baylibre.com>
References: <20220725081853.1636444-1-msp@baylibre.com>
 <20220725081853.1636444-4-msp@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220725081853.1636444-4-msp@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220725_020729_019554_A4754F65 
X-CRM114-Status: GOOD (  23.56  )
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

Il 25/07/22 10:18, Markus Schneider-Pargmann ha scritto:
> From: Alexandre Bailon <abailon@baylibre.com>
> 
> This adds support for MTK_SCPD_STRICT_BUSP capability. It is a strict
> bus protection policy that requires the bus protection to be disabled
> before accessing the bus.
> This is required by the mt8365, for the MM power domain.
> 
> Signed-off-by: Alexandre Bailon <abailon@baylibre.com>
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> ---
> 
> Notes:
>      Changes in v2:
>      - Fixup error handling path.
> 
>   drivers/soc/mediatek/mtk-pm-domains.c | 29 +++++++++++++++++++++++----
>   drivers/soc/mediatek/mtk-pm-domains.h |  1 +
>   2 files changed, 26 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/soc/mediatek/mtk-pm-domains.c b/drivers/soc/mediatek/mtk-pm-domains.c
> index d0eae2227813..94ca8981f45e 100644
> --- a/drivers/soc/mediatek/mtk-pm-domains.c
> +++ b/drivers/soc/mediatek/mtk-pm-domains.c
> @@ -240,6 +240,7 @@ static int scpsys_power_on(struct generic_pm_domain *genpd)
>   	struct scpsys *scpsys = pd->scpsys;
>   	bool tmp;
>   	int ret;
> +	bool strict_busprotect;
>   
>   	ret = scpsys_regulator_enable(pd->supply);
>   	if (ret)
> @@ -263,9 +264,18 @@ static int scpsys_power_on(struct generic_pm_domain *genpd)
>   	regmap_clear_bits(scpsys->base, pd->data->ctl_offs, PWR_ISO_BIT);
>   	regmap_set_bits(scpsys->base, pd->data->ctl_offs, PWR_RST_B_BIT);
>   
> -	ret = clk_bulk_prepare_enable(pd->num_subsys_clks, pd->subsys_clks);
> -	if (ret)
> -		goto err_pwr_ack;
> +	/*
> +	 * In few Mediatek platforms(e.g. MT6779), the bus protect policy is
> +	 * stricter, which leads to bus protect release must be prior to bus
> +	 * access.
> +	 */
> +	strict_busprotect = MTK_SCPD_CAPS(pd, MTK_SCPD_STRICT_BUSP);
> +	if (!strict_busprotect) {

Please directly check for MTK_SCPD_CAPS, you don't really need that bool variable,
not even for performance... and it fits just fine in one line, even.

	if (!MTK_SCPD_CAPS(pd, MTK_SCPD_STRICT_BUS_PROTECTION)) {

> +		ret = clk_bulk_prepare_enable(pd->num_subsys_clks,
> +					      pd->subsys_clks);
> +		if (ret)
> +			goto err_pwr_ack;
> +	}
>   
>   	ret = scpsys_sram_enable(pd);
>   	if (ret < 0)
> @@ -275,12 +285,23 @@ static int scpsys_power_on(struct generic_pm_domain *genpd)
>   	if (ret < 0)
>   		goto err_disable_sram;
>   
> +	if (strict_busprotect) {

	if (MTK_SCPD_CAPS(pd, MTK_SCPD_STRICT_BUS_PROTECTION)) {

> +		ret = clk_bulk_prepare_enable(pd->num_subsys_clks,
> +					      pd->subsys_clks);
> +		if (ret)
> +			goto err_enable_bus_protect;
> +	}
> +
>   	return 0;
>   
> +err_enable_bus_protect:

For human readability purposes (and paranoidly preventing future mistakes), I'd
add a check for the strict bus protection cap here too.

> +	scpsys_bus_protect_enable(pd);
>   err_disable_sram:
>   	scpsys_sram_disable(pd);
>   err_disable_subsys_clks:
> -	clk_bulk_disable_unprepare(pd->num_subsys_clks, pd->subsys_clks);
> +	if (!strict_busprotect)
> +		clk_bulk_disable_unprepare(pd->num_subsys_clks,
> +					   pd->subsys_clks);
>   err_pwr_ack:
>   	clk_bulk_disable_unprepare(pd->num_clks, pd->clks);
>   err_reg:
> diff --git a/drivers/soc/mediatek/mtk-pm-domains.h b/drivers/soc/mediatek/mtk-pm-domains.h
> index e788d6bdde9d..a50cfb926d22 100644
> --- a/drivers/soc/mediatek/mtk-pm-domains.h
> +++ b/drivers/soc/mediatek/mtk-pm-domains.h
> @@ -8,6 +8,7 @@
>   #define MTK_SCPD_SRAM_ISO		BIT(2)
>   #define MTK_SCPD_KEEP_DEFAULT_OFF	BIT(3)
>   #define MTK_SCPD_DOMAIN_SUPPLY		BIT(4)
> +#define MTK_SCPD_STRICT_BUSP		BIT(5)

MTK_SCPD_STRICT_BUS_PROTECTION is a bit more human readable.

>   #define MTK_SCPD_CAPS(_scpd, _x)	((_scpd)->data->caps & (_x))
>   
>   #define SPM_VDE_PWR_CON			0x0210

Regards,
Angelo

