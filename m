Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 946F9C54E58
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Mar 2024 09:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=87PhSsjtv1x+JQZmpCiioMPz9Gfgh8Wnv6MjE3E0p4E=; b=wN/ik2K521YexICdG+7abUtkVM
	iUfA/W8dArNscErxO089uiX0xEtw7ogbZt5S0SOBSMxtxcdE8eO3EvPr+JORj7v0R84DOQ2i4GQ9p
	AeHyi6L+k1RYFU6U0/dffdkg/LTXaKtpgPIRzT+c7oLprsXoSCPcVRXMVcrnQbt06W93+vtyeIgD6
	lGIUm9m9JKRMWhHM1//0mtJ9OUWgAtO8mAd3DfdmbFzmMt7xHvOkj3jv4RfA1cajKzW0NQwyqR344
	e6qqhZFk3bP22s5+AWKU9A7TfYzwtVafdtfNHb3OGYcK382DtYGKK+0nRw0Vt5Of8wYBmGgC/AZ5L
	mWA1pzIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rl3f1-0000000HHRI-08ym;
	Fri, 15 Mar 2024 09:15:31 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rl3ex-0000000HHQD-3muB;
	Fri, 15 Mar 2024 09:15:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1710494124;
	bh=acrQ5oOzFvIptP0m55ggct7J15MBntUB7Hgt+FmRFRg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=j7CQdFq496EcdadWXv01UmcL6cPMnEne0Ve8NgUX6EIsZfO28poLm/zYFElsRmg8r
	 L02tS8PomCFcYDO2g/Fpm6YlBqVX/p3IqIaxspuWPkGOYg1N1bGS+r6vAxDsKVKg+e
	 xiDOpoNn6GD1INtI2opCCnng8fin2PPXPROdpsqeOZhWLzYqRG/i+eHB+mYljXN4CE
	 sBKniqwVIkFU3vB2+zdfX0ICiRTuEItOr+lnz/V2pFkMZrcCk4q5rvTxNqt5uvNxXJ
	 AewYrKTKhrLaqm9vCBSfDpgEFOzbsvh9u3hyfcFeMqChvHglqGLhJr0cKE8r+7M/1i
	 pTRd13IOCOfWg==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 36ED137820FD;
	Fri, 15 Mar 2024 09:15:23 +0000 (UTC)
Message-ID: <d295a448-1b50-47be-92a2-770501c83e18@collabora.com>
Date: Fri, 15 Mar 2024 10:15:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mediatek: dsi: Correct calculation formula of PHY Timing
To: Shuijing Li <shuijing.li@mediatek.com>, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch,
 matthias.bgg@gmail.com, jitao.shi@mediatek.com
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20240315072945.19502-1-shuijing.li@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240315072945.19502-1-shuijing.li@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240315_021528_269369_696BD6AF 
X-CRM114-Status: GOOD (  13.22  )
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

Il 15/03/24 08:29, Shuijing Li ha scritto:
> This patch correct calculation formula of PHY timing.
> Make actual phy timing more accurate.
> 

More accurate in which cases? By how much? On which SoC(s)?

I agree about those changes if those are improving the PHY timing, but
can you please document what's going on?

Thanks,
Angelo

> Signed-off-by: Shuijing Li <shuijing.li@mediatek.com>
> ---
>   drivers/gpu/drm/mediatek/mtk_dsi.c | 33 +++++++++++++++---------------
>   1 file changed, 17 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
> index a2fdfc8ddb15..d1bd7d671880 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> @@ -235,22 +235,23 @@ static void mtk_dsi_phy_timconfig(struct mtk_dsi *dsi)
>   	u32 data_rate_mhz = DIV_ROUND_UP(dsi->data_rate, 1000000);
>   	struct mtk_phy_timing *timing = &dsi->phy_timing;
>   
> -	timing->lpx = (60 * data_rate_mhz / (8 * 1000)) + 1;
> -	timing->da_hs_prepare = (80 * data_rate_mhz + 4 * 1000) / 8000;
> -	timing->da_hs_zero = (170 * data_rate_mhz + 10 * 1000) / 8000 + 1 -
> -			     timing->da_hs_prepare;
> -	timing->da_hs_trail = timing->da_hs_prepare + 1;
> -
> -	timing->ta_go = 4 * timing->lpx - 2;
> -	timing->ta_sure = timing->lpx + 2;
> -	timing->ta_get = 4 * timing->lpx;
> -	timing->da_hs_exit = 2 * timing->lpx + 1;
> -
> -	timing->clk_hs_prepare = 70 * data_rate_mhz / (8 * 1000);
> -	timing->clk_hs_post = timing->clk_hs_prepare + 8;
> -	timing->clk_hs_trail = timing->clk_hs_prepare;
> -	timing->clk_hs_zero = timing->clk_hs_trail * 4;
> -	timing->clk_hs_exit = 2 * timing->clk_hs_trail;
> +	timing->lpx = (80 * data_rate_mhz / (8 * 1000)) + 1;
> +	timing->da_hs_prepare = (59 * data_rate_mhz + 4 * 1000) / 8000 + 1;
> +	timing->da_hs_zero = (163 * data_rate_mhz + 11 * 1000) / 8000 + 1 -
> +		timing->da_hs_prepare;
> +	timing->da_hs_trail = (78 * data_rate_mhz + 7 * 1000) / 8000 + 1;
> +
> +	timing->ta_go = 4 * timing->lpx;
> +	timing->ta_sure = 3 * timing->lpx / 2;
> +	timing->ta_get = 5 * timing->lpx;
> +	timing->da_hs_exit = (118 * data_rate_mhz / (8 * 1000)) + 1;
> +
> +	timing->clk_hs_prepare = (57 * data_rate_mhz / (8 * 1000)) + 1;
> +	timing->clk_hs_post = (65 * data_rate_mhz + 53 * 1000) / 8000 + 1;
> +	timing->clk_hs_trail = (78 * data_rate_mhz + 7 * 1000) / 8000 + 1;
> +	timing->clk_hs_zero = (330 * data_rate_mhz / (8 * 1000)) + 1 -
> +		timing->clk_hs_prepare;
> +	timing->clk_hs_exit = (118 * data_rate_mhz / (8 * 1000)) + 1;
>   
>   	timcon0 = timing->lpx | timing->da_hs_prepare << 8 |
>   		  timing->da_hs_zero << 16 | timing->da_hs_trail << 24;




