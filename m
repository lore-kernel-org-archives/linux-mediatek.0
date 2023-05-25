Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B221AC7EE2F
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 May 2023 08:32:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WUG13dsx+vnQbTBeymqMCwsiiNa5M8nHn3nInnKkFjo=; b=BLUx7NoGhUP93IXRKTLowBR5PU
	tBwtdd7ZHdCrAiFy3BaEk/NlADLnVMHH3R/PlAJivE5kt8DHR56ixrfPbO6m/SaoJyys3Vv67yzDw
	Z+YHyqdoHHD3z6SGQf35B9ouZTOmPfv7JRLhHM0azcy8ixJt1F3jAeyCaUNJjMHiuTmjD15YnRWIX
	LpUIxMfz2pZyEqq5NLasUiAkQO+212V585iFwQ3XNfcWKWV04+RZd05PA61gkHIVTIQ92pCZxY5Hc
	4otODfc2YyjkFpm95LmwBmDlT1wLThZl5KYPfWmq2MWgamV5mHeLXJ5aHldtiWn9zE1eLZSKfUo1C
	LUm6u+fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q26Oe-00G05g-0Z;
	Thu, 25 May 2023 08:32:32 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q26OZ-00G047-2a;
	Thu, 25 May 2023 08:32:29 +0000
Received: from [IPV6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab] (unknown [IPv6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 9C8926605835;
	Thu, 25 May 2023 09:32:25 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1685003546;
	bh=k7/vQeCVs8X0P7remFwr5otkr++Shtwkoci6K9NhYW0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Isbhhwk9giCSw2ViZig4ubY/S59uih32qTe7tcxSI32LTgG8MusjOiNbORkGO9YAI
	 aXBagtZfF/zARYJhYLYetZ/vAp2MZjw+P2n426xJsqtu/QcdHLnBmeqIzNyvOZN6MK
	 3vvYn6zZ07LAD7j6LrLWW6FEg0bdIz7Bjq8sUjssKCTcQx4ndMMP2gV4EEztjw/vuj
	 mnNRPtIy3iVC1sT9B6Ml2THj4V+ER/M3aBbtrxBKJAodHSS7LSV0X2QeVZgQxmJEhm
	 ArHMJm6WC91cEi47wWZh5liegHexp0CfDC+nbi3znHaFsMonEnNwOeALzOm0rE57w7
	 w1l6H2d7di1nw==
Message-ID: <2b20c9d7-e9b4-c70e-b59c-c504a2a74c52@collabora.com>
Date: Thu, 25 May 2023 10:32:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v4 2/2] clk: mediatek: reset: add infra_ao reset support
 for MT8188
Content-Language: en-US
To: Runyang Chen <runyang.chen@mediatek.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org
References: <20230525075011.7032-1-runyang.chen@mediatek.com>
 <20230525075011.7032-3-runyang.chen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230525075011.7032-3-runyang.chen@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230525_013227_971939_E0578E83 
X-CRM114-Status: GOOD (  17.14  )
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

Il 25/05/23 09:50, Runyang Chen ha scritto:
> The infra_ao reset is needed for MT8188.
> - Add mtk_clk_rst_desc for MT8188.
> - Add register reset controller function for MT8188 infra_ao.
> - Add infra_ao_idx_map for MT8188.
> 
> Signed-off-by: Runyang Chen <runyang.chen@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202305242320.AZzmINEa-lkp@intel.com/
> ---
>   drivers/clk/mediatek/clk-mt8188-infra_ao.c | 24 ++++++++++++++++++++++
>   1 file changed, 24 insertions(+)
> 
> diff --git a/drivers/clk/mediatek/clk-mt8188-infra_ao.c b/drivers/clk/mediatek/clk-mt8188-infra_ao.c
> index a38ddc7b6a88..f590178737cb 100644
> --- a/drivers/clk/mediatek/clk-mt8188-infra_ao.c
> +++ b/drivers/clk/mediatek/clk-mt8188-infra_ao.c
> @@ -5,6 +5,7 @@
>    */
>   
>   #include <dt-bindings/clock/mediatek,mt8188-clk.h>
> +#include <dt-bindings/reset/mt8188-resets.h>
>   #include <linux/clk-provider.h>
>   #include <linux/platform_device.h>
>   
> @@ -176,9 +177,32 @@ static const struct mtk_gate infra_ao_clks[] = {
>   		       "infra_ao_aes_msdcfde_0p", "top_aes_msdcfde", 18),
>   };
>   
> +static u16 infra_ao_rst_ofs[] = {
> +	INFRA_RST0_SET_OFFSET,
> +	INFRA_RST1_SET_OFFSET,
> +	INFRA_RST2_SET_OFFSET,
> +	INFRA_RST3_SET_OFFSET,
> +	INFRA_RST4_SET_OFFSET,
> +};
> +
> +static u16 infra_ao_idx_map[] = {
> +	[MT8188_INFRA_RST1_THERMAL_MCU_RST] = 1 * RST_NR_PER_BANK + 2,
> +	[MT8188_INFRA_RST1_THERMAL_CTRL_RST] = 1 * RST_NR_PER_BANK + 4,
> +	[MT8188_INFRA_RST3_PTP_CTRL_RST] = 3 * RST_NR_PER_BANK + 5,
> +};
> +
> +static const struct mtk_clk_rst_desc infra_ao_rst_desc = {
> +	.version = MTK_RST_SET_CLR,
> +	.rst_bank_ofs = infra_ao_rst_ofs,
> +	.rst_bank_nr = ARRAY_SIZE(infra_ao_rst_ofs),
> +	.rst_idx_map = infra_ao_idx_map,
> +	.rst_idx_map_nr = ARRAY_SIZE(infra_ao_idx_map),
> +};
> +
>   static const struct mtk_clk_desc infra_ao_desc = {
>   	.clks = infra_ao_clks,
>   	.num_clks = ARRAY_SIZE(infra_ao_clks),
> +	.rst_desc = &infra_ao_rst_desc,
>   };
>   
>   static const struct of_device_id of_match_clk_mt8188_infra_ao[] = {


