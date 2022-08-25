Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 539B5C28D13
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Aug 2022 13:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KfGKO4gRVHDia7DffjyPAcJcjBq+6O29TGohmEixT6E=; b=UI7QELkQ9LhB15f+bGsmyJco4c
	8CNdLbC8a3BQaKkvTxpSGsnhmENEIGE7h7A0obj8Zjngd9HllkofS5JS1WUx6I5jMkQ2kesT9l+Tu
	pezgApDSIwV2JXR9tRfD9bpuZQXWXAicpKuDjAQq37gpniqHWepQB1vc4/bzLsoo1cr+ff4Y7+9Lm
	1jPOl7qngAc7s1Hy0vWbTEAXsbM1H9XYu48S5AoxCnABn6msYUkW7TPYpOrYtl2KG/Ztifrt7r905
	98eF1QsBh0D1wQi7oZK0Gf7Cf8XNDz3BwOU76fTjfD9p1cBIgpYANu3SoyS+xllscvN/G8zvAG1PR
	EbsbYW1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRCub-00EncS-9I; Thu, 25 Aug 2022 13:28:45 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRCuA-00EnQB-TU; Thu, 25 Aug 2022 13:28:20 +0000
Received: by mail-wm1-x331.google.com with SMTP id h204-20020a1c21d5000000b003a5b467c3abso2684441wmh.5;
        Thu, 25 Aug 2022 06:28:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=KfGKO4gRVHDia7DffjyPAcJcjBq+6O29TGohmEixT6E=;
        b=gfhg0I9DGV8Q5gc55jPTx1jSwtM6UtBeNZSqgS5SWaysdaYZhB5W6OJmrHN1Hgl8pO
         5t70mJDysooDK0BRriyZC3Cx6EyYXnVaRaFFMmbkQkN2Wa82MlXllExcYe9JLKkdQ9cT
         kGhJIAw1J9733Ydo8rWumKglDarKtv/90YLt+ZkvFru9P8A88NLDkGPLHZ2qks4YV05q
         KHu1NarUTSz6Wk9hj2kDD6S5o6cYZao4NTnRrJFWkSIsWvXeaFAF8Wqmxkxfhq5QlpHV
         fuSXfcjtlTyW/Qav46x2cqqtyDUyMOEVEk+UcY1hrOyOhCSdIXkXPBIr/pxuh56f04/x
         B1dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=KfGKO4gRVHDia7DffjyPAcJcjBq+6O29TGohmEixT6E=;
        b=264XJP2luIctXNPjqTJdyMhfrDnsbgPtOkIjNyNBGLpMPn8pEtNQGyCZLs2VK1CI1F
         hhBPBse3b4VqSllLUNulGKXrtyLhgRQBBxQpp9faceE8BszieTYJT5sSDdQQulH9tDAm
         X2ABnTpi15ZZ/9Afu2X/kVGlCWJWCchwFnkIdbGWtZjupTpum5ntScwTqwpgcnv28TdO
         sx+u0eRzwv2kQc0aExQ3L6nsoBFY1SRBb/WBoEacncui7Y6RXx8tvCKmIuH1WuJJLnoj
         c6qVuG4Egqq/Bxjsxe1o6zSstdljCWC9hZRc2g2T96iTSJwT29fVQAa6a98RsPeg8LLO
         EEzg==
X-Gm-Message-State: ACgBeo3bbx5MVADuLbULT9K7GSpn6OkCUCBT0Oh1RCh38uXTicX9eYo8
	hA3yWXu7fCndqgcrjvAbelI=
X-Google-Smtp-Source: AA6agR5a9Ai7VYX7KZ47qWIsUFrlG3Kqel4VjkZPZEG/YVdHcomsm8Mjah2kQb/Q9rfYRRDpbLy+IA==
X-Received: by 2002:a1c:4c18:0:b0:3a5:3ddd:2f29 with SMTP id z24-20020a1c4c18000000b003a53ddd2f29mr2360318wmf.91.1661434095307;
        Thu, 25 Aug 2022 06:28:15 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id k5-20020a05600c1c8500b003a5f3de6fddsm5620850wms.25.2022.08.25.06.28.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Aug 2022 06:28:14 -0700 (PDT)
Message-ID: <20ad18de-0db0-c1fa-55e5-ad0897269876@gmail.com>
Date: Thu, 25 Aug 2022 15:28:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [PATCH 3/6] soc: mediatek: mtk-svs: Remove hardcoded irqflags
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: roger.lu@mediatek.com, khilman@baylibre.com,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, nfraprado@collabora.com, kernel@collabora.com
References: <20220726141653.177948-1-angelogioacchino.delregno@collabora.com>
 <20220726141653.177948-4-angelogioacchino.delregno@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220726141653.177948-4-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220825_062819_012946_8B23BB77 
X-CRM114-Status: GOOD (  18.19  )
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



On 26/07/2022 16:16, AngeloGioacchino Del Regno wrote:
> The interrupt flags are specified in devicetree: forcing them into
> the driver is suboptimal and not very useful.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Applied, thanks

> ---
>   drivers/soc/mediatek/mtk-svs.c | 9 +--------
>   1 file changed, 1 insertion(+), 8 deletions(-)
> 
> diff --git a/drivers/soc/mediatek/mtk-svs.c b/drivers/soc/mediatek/mtk-svs.c
> index ee990acfc2d5..fcf246a6bb07 100644
> --- a/drivers/soc/mediatek/mtk-svs.c
> +++ b/drivers/soc/mediatek/mtk-svs.c
> @@ -262,7 +262,6 @@ static const u32 svs_regs_v2[] = {
>    * @rst: svs platform reset control
>    * @efuse_parsing: svs platform efuse parsing function pointer
>    * @probe: svs platform probe function pointer
> - * @irqflags: svs platform irq settings flags
>    * @efuse_max: total number of svs efuse
>    * @tefuse_max: total number of thermal efuse
>    * @regs: svs platform registers map
> @@ -280,7 +279,6 @@ struct svs_platform {
>   	struct reset_control *rst;
>   	bool (*efuse_parsing)(struct svs_platform *svsp);
>   	int (*probe)(struct svs_platform *svsp);
> -	unsigned long irqflags;
>   	size_t efuse_max;
>   	size_t tefuse_max;
>   	const u32 *regs;
> @@ -294,7 +292,6 @@ struct svs_platform_data {
>   	struct svs_bank *banks;
>   	bool (*efuse_parsing)(struct svs_platform *svsp);
>   	int (*probe)(struct svs_platform *svsp);
> -	unsigned long irqflags;
>   	const u32 *regs;
>   	u32 bank_max;
>   };
> @@ -2680,7 +2677,6 @@ static const struct svs_platform_data svs_mt8192_platform_data = {
>   	.banks = svs_mt8192_banks,
>   	.efuse_parsing = svs_mt8192_efuse_parsing,
>   	.probe = svs_mt8192_platform_probe,
> -	.irqflags = IRQF_TRIGGER_HIGH,
>   	.regs = svs_regs_v2,
>   	.bank_max = ARRAY_SIZE(svs_mt8192_banks),
>   };
> @@ -2699,7 +2695,6 @@ static const struct svs_platform_data svs_mt8183_platform_data = {
>   	.banks = svs_mt8183_banks,
>   	.efuse_parsing = svs_mt8183_efuse_parsing,
>   	.probe = svs_mt8183_platform_probe,
> -	.irqflags = IRQF_TRIGGER_LOW,
>   	.regs = svs_regs_v2,
>   	.bank_max = ARRAY_SIZE(svs_mt8183_banks),
>   };
> @@ -2743,7 +2738,6 @@ static struct svs_platform *svs_platform_probe(struct platform_device *pdev)
>   	svsp->banks = svsp_data->banks;
>   	svsp->efuse_parsing = svsp_data->efuse_parsing;
>   	svsp->probe = svsp_data->probe;
> -	svsp->irqflags = svsp_data->irqflags;
>   	svsp->regs = svsp_data->regs;
>   	svsp->bank_max = svsp_data->bank_max;
>   
> @@ -2782,8 +2776,7 @@ static int svs_probe(struct platform_device *pdev)
>   	}
>   
>   	ret = devm_request_threaded_irq(svsp->dev, svsp_irq, NULL, svs_isr,
> -					svsp->irqflags | IRQF_ONESHOT,
> -					svsp->name, svsp);
> +					IRQF_ONESHOT, svsp->name, svsp);
>   	if (ret) {
>   		dev_err(svsp->dev, "register irq(%d) failed: %d\n",
>   			svsp_irq, ret);

