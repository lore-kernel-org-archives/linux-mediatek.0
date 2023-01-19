Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB69AC004D4
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Jan 2023 15:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2wVQPucPn/4N6eq7dGZ6TeO17YnTENvcpUYFEdBhnrI=; b=zruJpJBK3wjil9BYls7oJwSCha
	9lnfdVcM7N7+QUPw87B7I9WOKhzKw4ONd81gwGJjPwMTfyDG0uXkLzIGuum1tDpsxzzn38eRYHUyq
	NHEpmdTQs6/66ov1zH5wz7LoOx1SdaMhpEJHDeUVzYhfdepFT65AMuqR+HVIVrM1D9FNNYETYrznd
	XCbV06ihl3mi9NlUC58wOU9tZmjj+eRCZ+sxqEiVrXgDXyBb80TnhMzgRNgdUYoiw6HmfwtLkhbkI
	oZcPYCkdrSgFRBvg7Lw39CeQwYrSOnUyDS3esKEg8oXrWtOoSoGuwK6aKKWbmh7c43P50m5ThprCa
	/Yqk664w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIXBI-005l9S-Qr; Thu, 19 Jan 2023 15:50:24 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIXAy-005kzq-92; Thu, 19 Jan 2023 15:50:05 +0000
Received: by mail-wm1-x330.google.com with SMTP id m15so1876830wms.4;
        Thu, 19 Jan 2023 07:50:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2wVQPucPn/4N6eq7dGZ6TeO17YnTENvcpUYFEdBhnrI=;
        b=GzoWLUXDhcBm7VPBAEoLLYRp0qB+EENNjncD/NH+TYq+KLoxPQtSSBFn9C71UzjAbP
         GYP1N8R/btP0DFxy6clir06OFnlxDspd7Dn6NlnkqnWGCknbHvhwftnKzqxE/+0PtL9S
         Jp/9fIsz/ibzXrKAqmOw0XuVTwbV8QWLK6GMfYIrpxN5QsGzXbbnHt06bz95+Twg2vsR
         UECr1gkrnwRmxbvI/2xo1z8oWKVCw7z9tErSMhU4fYDE7N6CkYgNC6saM7nZzu51Y5E9
         6bSDTkvrm3VOXWM3AUHpU6AcVCMclr530fkuhJ7WZrfb7aygxTVUVy0/pntoW1kA29S1
         numA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2wVQPucPn/4N6eq7dGZ6TeO17YnTENvcpUYFEdBhnrI=;
        b=H1jMwkb2C8wRKBQF8m4spMUs2KYH5H05lcmH/CKIRYQWzQQDnvqVtnktMXMXxDtWqh
         kx0U6aMdIRTXtR1eBC8twpktCpAQQ88Edmd5jeAb1mohnH0paZwASGoIhFRAqMrokILz
         CDvbv7uyAt+Bs1SVH4LZDNiT0VfO+Niw8ckkyLdXyDUYcnxHAoxMgEbEFRVPds64oyh5
         /LsC5fBZtBfGnjYprRMGcgqobZ9RhDSN6GFLiK5sqD2Gj+X+hnucP6qngmmZKcIjb34y
         8ZavgSPILJFbZhvui9xId/5N1asRpihyOY1j6fF8w++iuaqi2P/+d6ttNusKSfXZdKB+
         aNdA==
X-Gm-Message-State: AFqh2kqHnT75jHt8bNVEOXjShIHUeGjRXwL2o/9JreF4zZl0rs0yKn1R
	qGJx8ZfnTO5ZIbg6vqBb2jQ=
X-Google-Smtp-Source: AMrXdXsvPxP5GAgFiwZRv2Fpgnrwc9rnvZyLzAJChkNt06zUWqu4L+MVDkX3aIGYEefydWUx4Puoiw==
X-Received: by 2002:a05:600c:a13:b0:3db:1de2:af31 with SMTP id z19-20020a05600c0a1300b003db1de2af31mr3088765wmp.37.1674143402986;
        Thu, 19 Jan 2023 07:50:02 -0800 (PST)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id n19-20020a05600c4f9300b003d1d5a83b2esm5829981wmq.35.2023.01.19.07.50.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jan 2023 07:50:02 -0800 (PST)
Message-ID: <1503b3b8-261d-a434-cfd7-2a5db4d0d2a1@gmail.com>
Date: Thu, 19 Jan 2023 16:50:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v6 3/4] clk: mediatek: remove MT8195 vppsys/0/1
 simple_probe
Content-Language: en-US
To: Moudy Ho <moudy.ho@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-clk@vger.kernel.org, Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20230118031509.29834-1-moudy.ho@mediatek.com>
 <20230118031509.29834-4-moudy.ho@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230118031509.29834-4-moudy.ho@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230119_075004_378221_80E058E5 
X-CRM114-Status: GOOD (  23.04  )
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



On 18/01/2023 04:15, Moudy Ho wrote:
> MT8195 VPPSYS0/1 will be probed by the compatible name in
> the mtk-mmsys driver and then probe its own clock driver as
> a platform driver.
> 
> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>   drivers/clk/mediatek/clk-mt8195-vpp0.c | 58 +++++++++++++++++++-------
>   drivers/clk/mediatek/clk-mt8195-vpp1.c | 58 +++++++++++++++++++-------
>   2 files changed, 86 insertions(+), 30 deletions(-)
> 
> diff --git a/drivers/clk/mediatek/clk-mt8195-vpp0.c b/drivers/clk/mediatek/clk-mt8195-vpp0.c
> index bf2939c3a023..6d5800f69f6c 100644
> --- a/drivers/clk/mediatek/clk-mt8195-vpp0.c
> +++ b/drivers/clk/mediatek/clk-mt8195-vpp0.c
> @@ -86,26 +86,54 @@ static const struct mtk_gate vpp0_clks[] = {
>   	GATE_VPP0_2(CLK_VPP0_WARP1_MDP_DL_ASYNC, "vpp0_warp1_mdp_dl_async", "top_wpe_vpp", 3),
>   };
>   
> -static const struct mtk_clk_desc vpp0_desc = {
> -	.clks = vpp0_clks,
> -	.num_clks = ARRAY_SIZE(vpp0_clks),
> -};
> +static int clk_mt8195_vpp0_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct device_node *node = dev->parent->of_node;
> +	struct clk_onecell_data *clk_data;
> +	int r;
>   
> -static const struct of_device_id of_match_clk_mt8195_vpp0[] = {
> -	{
> -		.compatible = "mediatek,mt8195-vppsys0",
> -		.data = &vpp0_desc,
> -	}, {
> -		/* sentinel */
> -	}
> -};
> +	clk_data = mtk_alloc_clk_data(CLK_VPP0_NR_CLK);
> +	if (!clk_data)
> +		return -ENOMEM;
> +
> +	r = mtk_clk_register_gates(node, vpp0_clks, ARRAY_SIZE(vpp0_clks), clk_data);
> +	if (r)
> +		goto free_vpp0_data;
> +
> +	r = of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
> +	if (r)
> +		goto unregister_gates;
> +
> +	platform_set_drvdata(pdev, clk_data);
> +
> +	return r;
> +
> +unregister_gates:
> +	mtk_clk_unregister_gates(vpp0_clks, ARRAY_SIZE(vpp0_clks), clk_data);
> +free_vpp0_data:
> +	mtk_free_clk_data(clk_data);
> +	return r;
> +}
> +
> +static int clk_mt8195_vpp0_remove(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct device_node *node = dev->parent->of_node;
> +	struct clk_hw_onecell_data *clk_data = platform_get_drvdata(pdev);
> +
> +	of_clk_del_provider(node);
> +	mtk_clk_unregister_gates(vpp0_clks, ARRAY_SIZE(vpp0_clks), clk_data);
> +	mtk_free_clk_data(clk_data);
> +
> +	return 0;
> +}
>   
>   static struct platform_driver clk_mt8195_vpp0_drv = {
> -	.probe = mtk_clk_simple_probe,
> -	.remove = mtk_clk_simple_remove,
> +	.probe = clk_mt8195_vpp0_probe,
> +	.remove = clk_mt8195_vpp0_remove,
>   	.driver = {
>   		.name = "clk-mt8195-vpp0",
> -		.of_match_table = of_match_clk_mt8195_vpp0,
>   	},
>   };
>   builtin_platform_driver(clk_mt8195_vpp0_drv);
> diff --git a/drivers/clk/mediatek/clk-mt8195-vpp1.c b/drivers/clk/mediatek/clk-mt8195-vpp1.c
> index ffd52c762890..3b88c69e96c9 100644
> --- a/drivers/clk/mediatek/clk-mt8195-vpp1.c
> +++ b/drivers/clk/mediatek/clk-mt8195-vpp1.c
> @@ -84,26 +84,54 @@ static const struct mtk_gate vpp1_clks[] = {
>   	GATE_VPP1_1(CLK_VPP1_VPP_SPLIT_26M, "vpp1_vpp_split_26m", "clk26m", 26),
>   };
>   
> -static const struct mtk_clk_desc vpp1_desc = {
> -	.clks = vpp1_clks,
> -	.num_clks = ARRAY_SIZE(vpp1_clks),
> -};
> +static int clk_mt8195_vpp1_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct device_node *node = dev->parent->of_node;
> +	struct clk_onecell_data *clk_data;
> +	int r;
>   
> -static const struct of_device_id of_match_clk_mt8195_vpp1[] = {
> -	{
> -		.compatible = "mediatek,mt8195-vppsys1",
> -		.data = &vpp1_desc,
> -	}, {
> -		/* sentinel */
> -	}
> -};
> +	clk_data = mtk_alloc_clk_data(CLK_VPP1_NR_CLK);
> +	if (!clk_data)
> +		return -ENOMEM;
> +
> +	r = mtk_clk_register_gates(node, vpp1_clks, ARRAY_SIZE(vpp1_clks), clk_data);
> +	if (r)
> +		goto free_vpp1_data;
> +
> +	r = of_clk_add_provider(node, of_clk_src_onecell_get, clk_data);
> +	if (r)
> +		goto unregister_gates;
> +
> +	platform_set_drvdata(pdev, clk_data);
> +
> +	return r;
> +
> +unregister_gates:
> +	mtk_clk_unregister_gates(vpp1_clks, ARRAY_SIZE(vpp1_clks), clk_data);
> +free_vpp1_data:
> +	mtk_free_clk_data(clk_data);
> +	return r;
> +}
> +
> +static int clk_mt8195_vpp1_remove(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct device_node *node = dev->parent->of_node;
> +	struct clk_hw_onecell_data *clk_data = platform_get_drvdata(pdev);
> +
> +	of_clk_del_provider(node);
> +	mtk_clk_unregister_gates(vpp1_clks, ARRAY_SIZE(vpp1_clks), clk_data);
> +	mtk_free_clk_data(clk_data);
> +
> +	return 0;
> +}
>   
>   static struct platform_driver clk_mt8195_vpp1_drv = {
> -	.probe = mtk_clk_simple_probe,
> -	.remove = mtk_clk_simple_remove,
> +	.probe = clk_mt8195_vpp1_probe,
> +	.remove = clk_mt8195_vpp1_remove,
>   	.driver = {
>   		.name = "clk-mt8195-vpp1",
> -		.of_match_table = of_match_clk_mt8195_vpp1,
>   	},
>   };
>   builtin_platform_driver(clk_mt8195_vpp1_drv);

