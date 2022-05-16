Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1607C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 May 2022 11:32:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZiSEF0Z3sUrMZUVjIxBluaxKojRMSKjkGtALQZFKKJI=; b=oWlacjY0mVikM/
	0nD6fKUfdihlspQu4XuMMWy0TRKZ6ARtomJ8svy88L+qgXh91vvcMWRFTBAMXshHlmQKZP5uHqlyw
	s4mfKahYPkGGmuc4JjquW2W69k9E8ndiua8wc24L/EzcBi/uYqIZjG9JTCBVXFeuFwlC7md7Vux85
	xQQ9jI7Xl/6aICGFH9L0CYo+DjIkP9vvzb0JKoUzwDf3XGXIpi9jeV6rSu8zhD3aavpOLlqzFNDDt
	8jMkswT8+Jl2rFj7HqmJ+4KNe0Ta0y0jkyIa4Z9F9N9nYJORWxC6z2m+lS+lWxyAFjBcq5t4mnxXi
	ynwgGWOakIVdiX1WW+7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nqYxl-007KCf-0V; Mon, 16 May 2022 11:32:33 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nqYxi-007KBX-AD; Mon, 16 May 2022 11:32:31 +0000
Received: by mail-wr1-x435.google.com with SMTP id t6so20106545wra.4;
 Mon, 16 May 2022 04:32:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=zNR2zgstDynxCnsgIvM+YFx8Mm5SD6bvInuiy+HlYH4=;
 b=UyLd39lQXbSVZDC9Xe9aH0rJ2WKhYevQ0+yihicysr7I1lEyV0fbrXdI4kHtic0clt
 oPex+0nC7Cflv6YTxnjp9D1s0oeGZvDcKRfE2b5gt3BzFjqRj29cxZth70WtoSOkHybZ
 fkjHRYvNi0p9zdWjobA8DVTsQQJ5LqiJzGs6OHpZHT8qae7duw3R5YXawfiMpNyPgKx5
 MumHCn8i5fLFkGibvUcLBCc8+ZRkRl8o+hGuZcUfhmGtnUy9r+RGqyIM2bkEIAbqVZWm
 WNnwJoTOVhtDKr5Hg8kp7ZABxX/ClcW5Al3UKFgvHBTG8zmoCI5RuHL36vQ4Pz2pOO7Y
 uN5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=zNR2zgstDynxCnsgIvM+YFx8Mm5SD6bvInuiy+HlYH4=;
 b=UChESsJEikzT7LWV1s6EUSIg+9Pz5zG3O0rEFoKXiirSNbC0ZsXqaZ9H0+0ECrzDpV
 Ogj25Ww54izcGPuspK0DWjeHsGaPGw7cr5PEtvUHvFW/ClOFxe6Mw4nnAQu+R6QhFKRo
 QCAnEOY49xt1wJ2V4g2cqkZ4GUplPeeAVDkDRYpnaVsZLF7gE/+WOuHpKCrXPJOOIr3O
 oJPtprpYOzLfqbN+0b8CGy9fA7/YQy53TcUOHg5W3ZI7fme8fzvQP3ur6kF10JWw7d7R
 JfI8lpoIa1xal0KeWYIBzTyOqlOtCmdEaXpJlZeBiXt2W6hfhGcuRaWVnSo79gZTdGfI
 2Hvw==
X-Gm-Message-State: AOAM530V3VV4ar2ZeDLpwhnG2uIcB4ATXeCj7EIKmHkiuAIaaA5UbxeU
 e9qh1LZMW+6HM/U6n2n0Aek=
X-Google-Smtp-Source: ABdhPJyub9eU480qKQjh8jFlPz4AgCb1FDgUdJPm9VqXaaDrLbu652HkHldv3AQz72yMU3flgGVLZQ==
X-Received: by 2002:a5d:4dcc:0:b0:20a:ddaa:1c30 with SMTP id
 f12-20020a5d4dcc000000b0020addaa1c30mr13203540wru.419.1652700747506; 
 Mon, 16 May 2022 04:32:27 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 p2-20020adfaa02000000b0020cd0762f37sm9224270wrd.107.2022.05.16.04.32.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 May 2022 04:32:26 -0700 (PDT)
Message-ID: <6f96e6f2-b614-3219-3302-da1679565722@gmail.com>
Date: Mon, 16 May 2022 13:32:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v2 2/2] memory: mtk-smi: Add support for MT6795 Helio X10
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 yong.wu@mediatek.com
Cc: krzysztof.kozlowski@linaro.org, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 konrad.dybcio@somainline.org, marijn.suijten@somainline.org,
 martin.botka@somainline.org, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org, paul.bouchara@somainline.org,
 kernel@collabora.com
References: <20220513150633.387200-1-angelogioacchino.delregno@collabora.com>
 <20220513150633.387200-3-angelogioacchino.delregno@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220513150633.387200-3-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220516_043230_401652_3B21472E 
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 13/05/2022 17:06, AngeloGioacchino Del Regno wrote:
> The MediaTek Helio X10 (MT6795) SoC has 5 LARBs and one common SMI
> instance without any sub-common and without GALS.
> 
> While the smi-common configuration is specific to this SoC, on the
> LARB side, this is similar to MT8173, in the sense that it doesn't
> need the port in LARB, and the register layout is also compatible
> with that one, which makes us able to fully reuse the smi-larb
> platform data struct that was introduced for MT8173.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>   drivers/memory/mtk-smi.c | 17 +++++++++++++++++
>   1 file changed, 17 insertions(+)
> 
> diff --git a/drivers/memory/mtk-smi.c b/drivers/memory/mtk-smi.c
> index 86a3d34f418e..7e7c3ede19e4 100644
> --- a/drivers/memory/mtk-smi.c
> +++ b/drivers/memory/mtk-smi.c
> @@ -21,11 +21,13 @@
>   /* SMI COMMON */
>   #define SMI_L1LEN			0x100
>   
> +#define SMI_L1_ARB			0x200
>   #define SMI_BUS_SEL			0x220
>   #define SMI_BUS_LARB_SHIFT(larbid)	((larbid) << 1)
>   /* All are MMU0 defaultly. Only specialize mmu1 here. */
>   #define F_MMU1_LARB(larbid)		(0x1 << SMI_BUS_LARB_SHIFT(larbid))
>   
> +#define SMI_FIFO_TH0			0x230
>   #define SMI_M4U_TH			0x234
>   #define SMI_FIFO_TH1			0x238
>   #define SMI_FIFO_TH2			0x23c
> @@ -360,6 +362,7 @@ static const struct of_device_id mtk_smi_larb_of_ids[] = {
>   	{.compatible = "mediatek,mt2701-smi-larb", .data = &mtk_smi_larb_mt2701},
>   	{.compatible = "mediatek,mt2712-smi-larb", .data = &mtk_smi_larb_mt2712},
>   	{.compatible = "mediatek,mt6779-smi-larb", .data = &mtk_smi_larb_mt6779},
> +	{.compatible = "mediatek,mt6795-smi-larb", .data = &mtk_smi_larb_mt8173},
>   	{.compatible = "mediatek,mt8167-smi-larb", .data = &mtk_smi_larb_mt8167},
>   	{.compatible = "mediatek,mt8173-smi-larb", .data = &mtk_smi_larb_mt8173},
>   	{.compatible = "mediatek,mt8183-smi-larb", .data = &mtk_smi_larb_mt8183},
> @@ -541,6 +544,13 @@ static struct platform_driver mtk_smi_larb_driver = {
>   	}
>   };
>   
> +static const struct mtk_smi_reg_pair mtk_smi_common_mt6795_init[SMI_COMMON_INIT_REGS_NR] = {
> +	{SMI_L1_ARB, 0x1b},
> +	{SMI_M4U_TH, 0xce810c85},
> +	{SMI_FIFO_TH1, 0x43214c8},
> +	{SMI_FIFO_TH0, 0x191f},
> +};
> +
>   static const struct mtk_smi_reg_pair mtk_smi_common_mt8195_init[SMI_COMMON_INIT_REGS_NR] = {
>   	{SMI_L1LEN, 0xb},
>   	{SMI_M4U_TH, 0xe100e10},
> @@ -565,6 +575,12 @@ static const struct mtk_smi_common_plat mtk_smi_common_mt6779 = {
>   		    F_MMU1_LARB(5) | F_MMU1_LARB(6) | F_MMU1_LARB(7),
>   };
>   
> +static const struct mtk_smi_common_plat mtk_smi_common_mt6795 = {
> +	.type	  = MTK_SMI_GEN2,
> +	.bus_sel  = BIT(0),
> +	.init     = mtk_smi_common_mt6795_init,
> +};
> +
>   static const struct mtk_smi_common_plat mtk_smi_common_mt8183 = {
>   	.type     = MTK_SMI_GEN2,
>   	.has_gals = true,
> @@ -609,6 +625,7 @@ static const struct of_device_id mtk_smi_common_of_ids[] = {
>   	{.compatible = "mediatek,mt2701-smi-common", .data = &mtk_smi_common_gen1},
>   	{.compatible = "mediatek,mt2712-smi-common", .data = &mtk_smi_common_gen2},
>   	{.compatible = "mediatek,mt6779-smi-common", .data = &mtk_smi_common_mt6779},
> +	{.compatible = "mediatek,mt6795-smi-common", .data = &mtk_smi_common_mt6795},
>   	{.compatible = "mediatek,mt8167-smi-common", .data = &mtk_smi_common_gen2},
>   	{.compatible = "mediatek,mt8173-smi-common", .data = &mtk_smi_common_gen2},
>   	{.compatible = "mediatek,mt8183-smi-common", .data = &mtk_smi_common_mt8183},

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
