Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BD86C27C4F
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Jun 2024 07:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jkz5PtPzIm4EecIBIbvS0My5voZwx4hvBrhqxo9yXaw=; b=tOAb1ZRH0v2N4FZQeSxn6aTBht
	bGgK4SogwYGM5/aulw2Lld/5XNKYIJLI8h9nojHL9l3yn/fK4JjLVw3R2aTCbvHmrR/mLzF8CpC8E
	aqIKzaNC7i0ejBER+nKVCNc5EPoGP8qAPFXOTgCyZiVX5UI8zyk0mWJvCVoSIxbLL4VKsI0YrXDGO
	30KSlyfeWbKmJjo1ExDWf97O57WYGzgYdZQh1tNtZpg2PIy8OGXb6I4R0EjCrGUNSsZ2BjieTU+It
	lV+bV+7cXm/2jX6dPNQddecGFur/9rtbi9DA3YfpSGXr4YOJckN6YD0NL/Grvwh1xkmfRduQwan6y
	sp3c4Tuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHeY9-0000000FPZX-1IZH;
	Thu, 13 Jun 2024 07:07:09 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHeY5-0000000FPYe-0ZzO;
	Thu, 13 Jun 2024 07:07:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1718262420;
	bh=LWRFNapN+wyTQNvWofeQWCa3j7JgLf2cUA8hrrwkD5A=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=s8CKTaLYhTF7um/sKo5IvJYMtqaSw3zTlF3L0BvrgEvaJkN5o6lrXpzBsomCKOUFC
	 MeNTeggOihYDgpBHnJyTHpK97tzM+KyAqqHly23tjVpK5WjjRhl+Efw6OZiZzfYQkt
	 ko19+oDsiWUbJj1srwsje4hqe6Qnn+2NsXu17sdAswEWwiGlCFgHjCPrnHV/7BgCVY
	 4dpDcfMnKEk/4xUFs0gRDFP0D9JE3guGmQnnoHAGe7wHhf7VJrmeG6tYBW4d3bsbGs
	 2/3DW0Z+c9boXXN3UpZURtNhy5Ohbew0/+T4QWcg3PM2jK4aruMaPsXKAiDTV79YuN
	 C1ySXo9uPU4ag==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 3198537821A3;
	Thu, 13 Jun 2024 07:06:59 +0000 (UTC)
Message-ID: <030a538b-bf28-4418-92fd-14225260eb85@collabora.com>
Date: Thu, 13 Jun 2024 09:06:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v2 1/2] clk: mediatek: mt8173-infracfg: Handle
 unallocated infracfg when module
To: Alper Nebi Yasak <alpernebiyasak@gmail.com>,
 linux-mediatek@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
 Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
 Michael Turquette <mturquette@baylibre.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Chen-Yu Tsai <wenst@chromium.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-clk@vger.kernel.org
References: <20240612201211.91683-1-alpernebiyasak@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240612201211.91683-1-alpernebiyasak@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240613_000705_612439_699A7CE1 
X-CRM114-Status: GOOD (  23.43  )
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

Il 12/06/24 22:11, Alper Nebi Yasak ha scritto:
> The MT8173 infracfg clock driver does initialization in two steps, via a
> CLK_OF_DECLARE_DRIVER declaration. However its early init function
> doesn't get to run when it's built as a module, presumably since it's
> not loaded by the time it would have been called by of_clk_init(). This
> causes its second-step probe() to return -ENOMEM when trying to register
> clocks, as the necessary clock_data struct isn't initialized by the
> first step.
> 
> MT2701 and MT6797 clock drivers also use this mechanism, but they try to
> allocate the necessary clock_data structure if missing in the second
> step. Mimic that for the MT8173 infracfg clock as well to make it work
> as a module.
> 
> Signed-off-by: Alper Nebi Yasak <alpernebiyasak@gmail.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
> 
> Changes in v2:
> - Rewrite patch subject for consistency
> 
> v1: https://lore.kernel.org/lkml/20231108213734.140707-1-alpernebiyasak@gmail.com/
> 
>   drivers/clk/mediatek/clk-mt8173-infracfg.c | 12 +++++++++++-
>   1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/mediatek/clk-mt8173-infracfg.c b/drivers/clk/mediatek/clk-mt8173-infracfg.c
> index 2f2f074e231a..ecc8b0063ea5 100644
> --- a/drivers/clk/mediatek/clk-mt8173-infracfg.c
> +++ b/drivers/clk/mediatek/clk-mt8173-infracfg.c
> @@ -98,7 +98,17 @@ CLK_OF_DECLARE_DRIVER(mtk_infrasys, "mediatek,mt8173-infracfg",
>   static int clk_mt8173_infracfg_probe(struct platform_device *pdev)
>   {
>   	struct device_node *node = pdev->dev.of_node;
> -	int r;
> +	int r, i;
> +
> +	if (!infra_clk_data) {
> +		infra_clk_data = mtk_alloc_clk_data(CLK_INFRA_NR_CLK);
> +		if (!infra_clk_data)
> +			return -ENOMEM;
> +	} else {
> +		for (i = 0; i < CLK_INFRA_NR_CLK; i++)
> +			if (infra_clk_data->hws[i] == ERR_PTR(-EPROBE_DEFER))
> +				infra_clk_data->hws[i] = ERR_PTR(-ENOENT);
> +	}
>   
>   	r = mtk_clk_register_gates(&pdev->dev, node, infra_gates,
>   				   ARRAY_SIZE(infra_gates), infra_clk_data);
> 
> base-commit: 03d44168cbd7fc57d5de56a3730427db758fc7f6


