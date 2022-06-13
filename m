Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A59CC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jun 2022 10:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4c3y19TwmHXkiyXP/NNqBUz+QIRgQDuk9ffy7t/NY4o=; b=oh2/M05vl24UkF
	SLjKYB8uzFEM8ywaG28+Iod5Tgu2COnbNRz3R6a735NrwTgfZjDbWXhetzydQU7wGfuLBr53fwa7f
	adpxFqlPv9ZWnUHGrNMnkqsyn/HIvDvFiIoxviMUsqGZyK0afFrtu6yjMUopaTGzHcWd0Ul5R1JF/
	MLa8H2JHl34DSCGvQXKcsT1mZc1dSoqHnHIjV/fDKr8yyp8Gx+6AXSMU+7Tm0Ep7BTD9EbTbX+sG9
	1oUavE7TgdfrJ8XykUCsvlCVvb+XVkeDl/Qof04FA9rDmjRXaMocOwrLZzcQV3v7ERxqLyc+YHCaG
	uMyMSgJonFef+LmVe9xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0hjn-0030x3-Im; Mon, 13 Jun 2022 10:56:03 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0hjc-0030tC-6M; Mon, 13 Jun 2022 10:55:53 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 956946601674;
	Mon, 13 Jun 2022 11:55:49 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1655117750;
	bh=AYCMDXpnrnlhea7/vMZzgZlR6eZJdympQCVtx5OxpTM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=a9CdHFRNL1cXCAvRh3XboG6jOiwZc4fzSdgrsQOHaYR4U5YU91vlz5msxD2p5T685
	 lrRe0P/w83HJGc/dmA+zxPrEaVOblxEPEL0usxx2u0eC9sul7icX7gHrUJTO3im7AJ
	 9lOGwrKI80poQ9yvcbLTRhmP4tFA5tfCyrQM7DHFPvr/s4Dftv1ZxlgnUcTZ0EKc4F
	 x2b7lXzuSt9Cke9UIztn45OivAJewKp5eRJqWd0GqVINKHCq6zQOteErj3iFsO9fTw
	 ZoMeIxiT4MBZK49qKgdXbIBC4tpTk6P+2KtV9C+l8PSenJ4oIOBMiR1L7XB4fJ1QAK
	 fRb9Z8IS6IG4w==
Message-ID: <7d2a1d75-e400-71aa-7127-144e257f408d@collabora.com>
Date: Mon, 13 Jun 2022 12:55:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v11 10/12] drm/mediatek: dpi: Add dpintf support
Content-Language: en-US
To: Bo-Chen Chen <rex-bc.chen@mediatek.com>, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de, daniel@ffwll.ch, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com, airlied@linux.ie
Cc: msp@baylibre.com, granquet@baylibre.com, jitao.shi@mediatek.com,
 wenst@chromium.org, ck.hu@mediatek.com, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220613064841.10481-1-rex-bc.chen@mediatek.com>
 <20220613064841.10481-11-rex-bc.chen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220613064841.10481-11-rex-bc.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220613_035552_499308_138F96CE 
X-CRM114-Status: GOOD (  26.01  )
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

Il 13/06/22 08:48, Bo-Chen Chen ha scritto:
> From: Guillaume Ranquet <granquet@baylibre.com>
> 
> dpintf is the displayport interface hardware unit. This unit is similar
> to dpi and can reuse most of the code.
> 
> This patch adds support for mt8195-dpintf to this dpi driver. Main
> differences are:
>   - Some features/functional components are not available for dpintf
>     which are now excluded from code execution once is_dpintf is set
>   - dpintf can and needs to choose between different clockdividers based
>     on the clockspeed. This is done by choosing a different clock parent.
>   - There are two additional clocks that need to be managed. These are
>     only set for dpintf and will be set to NULL if not supplied. The
>     clk_* calls handle these as normal clocks then.
>   - Some register contents differ slightly between the two components. To
>     work around this I added register bits/masks with a DPINTF_ prefix
>     and use them where different.
> 
> Based on a separate driver for dpintf created by
> Jitao shi <jitao.shi@mediatek.com>.
> 
> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> [Bo-Chen: Modify reviewers' comments.]
> Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> ---
>   drivers/gpu/drm/mediatek/mtk_dpi.c          | 115 ++++++++++++++++++--
>   drivers/gpu/drm/mediatek/mtk_dpi_regs.h     |  13 +++
>   drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c |   4 +
>   drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |   1 +
>   drivers/gpu/drm/mediatek/mtk_drm_drv.c      |   3 +
>   5 files changed, 126 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
> index 6b8cf648a5b5..08c8f21b4421 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> @@ -71,6 +71,7 @@ struct mtk_dpi {
>   	void __iomem *regs;
>   	struct device *dev;
>   	struct clk *engine_clk;
> +	struct clk *pll_gate_clk;

You don't need this clock in this driver, at all.

`pll_gate` would be CLK_VDO0_DP_INTF0_DP_INTF (parent = CLK_TOP_EDP);

Currently, you're assigning CLK_TOP_EDP to "pixel", but you can, at this point,
simply assign CLK_VDO0_DP_INTF0_DP_INTF to "pixel" instead... as when you call
clk_prepare_enable() on it, that'll also take care of enabling its CLK_TOP_EDP
parent for you.

You're not doing anything special if not taking care of enabling/disabling it.

Regards,
Angelo


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
