Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AA53C433FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Oct 2022 08:34:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ttizy/IaItI14OvHj/mQJ2/xS/CeCz9Bx74GsXNiiYY=; b=MK4iVkzHz2YK+oFY6XpBt1PJNy
	zRR8T2QOHBjbcCZkyz8JnbuONEDPZjBesREewvYRzkSOcAGf8SrfPQFpPq3H3L0QJN51Jf/Ru4NOn
	bwArz4p+cU0q/DmQft0rbwaJ+Do7DiNOGyiTa59e6oyYvNGeoVg62+hbPx0cJMamuykcDcOCSsNu5
	H1CIO4vCqN12qAY4joAxa5Afv3Fk8WKqca2F9GQMIt5dbefl49AbDB3L1PXFwh5qljpQya3QFXCeP
	Tinm3LV1VMVWmMn0JM8g7G6lWYL4dQErrOuCGggR9h3SGgkaVY5enZBtoVH3C+TbwHqV8Q8cvzCJa
	AwbfuR0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olR0B-00CGIb-65; Thu, 20 Oct 2022 08:34:07 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1olQzx-00CG9U-QX; Thu, 20 Oct 2022 08:33:55 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 685AB66023A2;
	Thu, 20 Oct 2022 09:33:51 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1666254832;
	bh=eYxMz6zERQc7GTytaTxwkwMkEwSbrxhut31+a3wEpqo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=McX7Tn5gyIzVRQETcl61spVTpz7+tpl7vReaL79clhy9oI8LNQw/BCnp1mCRLEMj2
	 UoppxK88l1oNtHXEjz0UChsVJk01qesYhOaTWdyiwoHbeu+55JW2XeTZFGInqr34KU
	 Fdh4tOwi6HLmiLrcLP4wD5aw6Cl/UpxzuAAfdbtCxbbFdmiWeX6fvJ8h2NQjXJ3Qut
	 AEh3lX/7PKynaZ61blx05q9pnsR9QTfB/i5lxK9+JeFVu7kvL781F+O/XXRaBk6ey4
	 e2SVZ02BqzwUIUV5tgxg60vCcQwR+h5FYkQDkJiCOTZxKjlZDPzWU5ttZ3C6l6CcpR
	 zqXswuAhJclyQ==
Message-ID: <3e20104a-674a-666a-10b4-4a19abeabc9a@collabora.com>
Date: Thu, 20 Oct 2022 10:33:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH,2/2] drm: mediatek: Add mt8188 dpi compatibles and
 platform data
Content-Language: en-US
To: xinlei.lee@mediatek.com, chunkuang.hu@kernel.org, p.zabel@pengutronix.de,
 airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 ck.hu@mediatek.com, jitao.shi@mediatek.com
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <1666249553-15801-1-git-send-email-xinlei.lee@mediatek.com>
 <1666249553-15801-3-git-send-email-xinlei.lee@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <1666249553-15801-3-git-send-email-xinlei.lee@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221020_013354_029013_E05F5ADE 
X-CRM114-Status: GOOD (  15.26  )
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

Il 20/10/22 09:05, xinlei.lee@mediatek.com ha scritto:
> From: xinlei lee <xinlei.lee@mediatek.com>
> 
> For MT8188, the vdosys0 only supports 1T1P mode, so we need to add the compatible for mt8188 edp-intf.
> 
> Signed-off-by: xinlei lee <xinlei.lee@mediatek.com>
> ---
>   drivers/gpu/drm/mediatek/mtk_dpi.c     | 17 +++++++++++++++++
>   drivers/gpu/drm/mediatek/mtk_drm_drv.c |  2 ++
>   2 files changed, 19 insertions(+)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
> index 508a6d9..5cefda4 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> @@ -929,6 +929,20 @@ static const struct mtk_dpi_conf mt8183_conf = {
>   	.csc_enable_bit = CSC_ENABLE,
>   };
>   
> +static const struct mtk_dpi_conf mt8188_edpintf_conf = {
> +	.cal_factor = mt8195_dpintf_calculate_factor,
> +	.max_clock_khz = 600000,
> +	.output_fmts = mt8195_output_fmts,
> +	.num_output_fmts = ARRAY_SIZE(mt8195_output_fmts),
> +	.pixels_per_iter = 4,
> +	.input_2pixel = false,
> +	.dimension_mask = DPINTF_HPW_MASK,
> +	.hvsize_mask = DPINTF_HSIZE_MASK,
> +	.channel_swap_shift = DPINTF_CH_SWAP,
> +	.yuv422_en_bit = DPINTF_YUV422_EN,
> +	.csc_enable_bit = DPINTF_CSC_ENABLE,
> +};
> +
>   static const struct mtk_dpi_conf mt8192_conf = {
>   	.cal_factor = mt8183_calculate_factor,
>   	.reg_h_fre_con = 0xe0,
> @@ -1079,6 +1093,9 @@ static const struct of_device_id mtk_dpi_of_ids[] = {
>   	{ .compatible = "mediatek,mt8183-dpi",
>   	  .data = &mt8183_conf,
>   	},
> +	{ .compatible = "mediatek,mt8188-edp-intf",
> +	  .data = &mt8188_edpintf_conf,

Please rename to:

mediatek,mt8188-dp-intf

and

&mt8188_dpintf_conf

> +	},
>   	{ .compatible = "mediatek,mt8192-dpi",
>   	  .data = &mt8192_conf,
>   	},
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> index 91f58db..5732ed8 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -631,6 +631,8 @@ static const struct of_device_id mtk_ddp_comp_dt_ids[] = {
>   	  .data = (void *)MTK_DPI },
>   	{ .compatible = "mediatek,mt8183-dpi",
>   	  .data = (void *)MTK_DPI },
> +	{ .compatible = "mediatek,mt8188-edp-intf",

Same here.

Regards,
Angelo


