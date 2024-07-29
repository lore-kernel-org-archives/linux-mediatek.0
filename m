Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 037A4C3DA61
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Jul 2024 07:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0CUND3rMFWAf2MpHMRRNXSs0VFROHuTdzcnbSYfpGjY=; b=DKNvoEW47i5Sz+oXHDq+05fy0O
	kOqrEKQrnayl2jFwa1eAUGh0RY5ZHWSXJxM9NlcLRGPlu5WHOFRS1RFeA3slyGkdLQ7AgrUMkw4Yn
	W3O1Ma20hYW7jTKqnZ5vqGt/0u61ODa25rVJqfp6n/HbVOyK5eiDsMix/DfbcBgK8EC0/7EA9kuP2
	L7+nIGLbeerOu4YytcHztR1n6xvl7P1v53CzT5197lj/wFRjB7qCmycXyiL9NYqsiErtavtRmFilA
	Y7h/lSp9ftV1xxF1Jwet0b1PBKjHJskifPW4emV09ZQvhIy/2PrirAzHQQJW5I1S4qTkH+zAvIT5s
	3rrt+Szg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYL6X-0000000APlL-2vz3;
	Mon, 29 Jul 2024 07:47:37 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYL5l-0000000APW5-0s9L;
	Mon, 29 Jul 2024 07:46:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1722239207;
	bh=gbQ6Ez8CLtajORQq6U3RJkBxEyQhQ76lV9EIVahQTWk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=0HI5WJpn1cqeyzhH1ezN1ik09IcqW6RY19N9EtTsUOTHqcQtPC2IviYXZMfBNx0Bw
	 DZEal83SE1dYl84tgGeDK+IcKn31GV2nq46ZeBPf804tsHEjKXsgKzq0Td/bVZaRDr
	 8hXtunQvLCFsHqpaxIKDgyt0m4SRCTIzxEski39SDUYC2jx5j+wqo3cztuwUqlbsZk
	 z7UGq78Sg9OYqy+EuswUxoVtMZ0byRdD7vcPQntaxoz5CKRL0f4geFAtgtarYMf/Ie
	 mpdwtNqkJTqcdWMlWY4AvdYwOHHXnAWjf3yNOam3VxOIlQDW0wwiI7rh5tqRO2/FTV
	 mITsX5v1Jihdw==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 68914378203F;
	Mon, 29 Jul 2024 07:46:46 +0000 (UTC)
Message-ID: <f73bf4de-0795-41a6-a94a-016e85721e2e@collabora.com>
Date: Mon, 29 Jul 2024 09:46:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] pinctrl: mediatek: mt6765: Add virtual GPIOs
To: Arseniy Velikanov <me@adomerle.xyz>, mturquette@baylibre.com,
 sboyd@kernel.org, matthias.bgg@gmail.com, sean.wang@kernel.org,
 linus.walleij@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, frank.li@vivo.com, jiasheng@iscas.ac.cn,
 mars.cheng@mediatek.com, owen.chen@mediatek.com, macpaul.lin@mediatek.com,
 zh.chen@mediatek.com, argus.lin@mediatek.com
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
References: <20240729073428.28983-1-me@adomerle.xyz>
 <20240729073428.28983-4-me@adomerle.xyz>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240729073428.28983-4-me@adomerle.xyz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240729_004649_410427_E534C133 
X-CRM114-Status: GOOD (  13.43  )
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

Il 29/07/24 09:34, Arseniy Velikanov ha scritto:
> Add EINT-only virtual GPIOs as done for MT6735
> These pins are needed at least for PWRAP
> 

Those are not virtual - they do exist. For real.

I would, at this point, describe this commit as such:

pinctrl: mediatek: mt6765: Add GPIOs for PWRAP

Introduce missing additional EINT pins, used mainly for the PMIC Wrapper.


> Fixes: 477fecee7ca9 ("pinctrl: mediatek: add MT6765 pinctrl driver")

...and this is an addition, not a fix, so please remove the Fixes tag.

Cheers,
Angelo

> Signed-off-by: Arseniy Velikanov <me@adomerle.xyz>
> ---
>   drivers/pinctrl/mediatek/pinctrl-mtk-mt6765.h | 66 +++++++++++++++++++
>   1 file changed, 66 insertions(+)
> 
> diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-mt6765.h b/drivers/pinctrl/mediatek/pinctrl-mtk-mt6765.h
> index 772563720461..070af420333b 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-mtk-mt6765.h
> +++ b/drivers/pinctrl/mediatek/pinctrl-mtk-mt6765.h
> @@ -1749,6 +1749,72 @@ static struct mtk_pin_desc mtk_pins_mt6765[] = {
>   		DRV_GRP4,
>   		MTK_FUNCTION(0, "GPIO179")
>   	),
> +	MTK_PIN(
> +		180, "GPIO180",
> +		MTK_EINT_FUNCTION(0, 144),
> +		DRV_GRP4,
> +		MTK_FUNCTION(0, NULL)
> +	),
> +	MTK_PIN(
> +		181, "GPIO181",
> +		MTK_EINT_FUNCTION(0, 145),
> +		DRV_GRP4,
> +		MTK_FUNCTION(0, NULL)
> +	),
> +	MTK_PIN(
> +		182, "GPIO182",
> +		MTK_EINT_FUNCTION(0, 152),
> +		DRV_FIXED,
> +		MTK_FUNCTION(0, NULL)
> +	),
> +	MTK_PIN(
> +		183, "GPIO183",
> +		MTK_EINT_FUNCTION(0, 153),
> +		DRV_FIXED,
> +		MTK_FUNCTION(0, NULL)
> +	),
> +	MTK_PIN(
> +		184, "GPIO184",
> +		MTK_EINT_FUNCTION(0, 154),
> +		DRV_FIXED,
> +		MTK_FUNCTION(0, NULL)
> +	),
> +	MTK_PIN(
> +		185, "GPIO185",
> +		MTK_EINT_FUNCTION(0, 155),
> +		DRV_FIXED,
> +		MTK_FUNCTION(0, NULL)
> +	),
> +	MTK_PIN(
> +		186, "GPIO186",
> +		MTK_EINT_FUNCTION(0, 156),
> +		DRV_FIXED,
> +		MTK_FUNCTION(0, NULL)
> +	),
> +	MTK_PIN(
> +		187, "GPIO187",
> +		MTK_EINT_FUNCTION(0, 157),
> +		DRV_FIXED,
> +		MTK_FUNCTION(0, NULL)
> +	),
> +	MTK_PIN(
> +		188, "GPIO188",
> +		MTK_EINT_FUNCTION(0, 158),
> +		DRV_FIXED,
> +		MTK_FUNCTION(0, NULL)
> +	),
> +	MTK_PIN(
> +		189, "GPIO189",
> +		MTK_EINT_FUNCTION(0, 159),
> +		DRV_FIXED,
> +		MTK_FUNCTION(0, NULL)
> +	),
> +	MTK_PIN(
> +		190, "GPIO190",
> +		MTK_EINT_FUNCTION(0, 147),
> +		DRV_GRP4,
> +		MTK_FUNCTION(0, NULL)
> +	),
>   };
>   
>   #endif /* __PINCTRL_MTK_MT6765_H */


