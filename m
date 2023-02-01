Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5325C05027
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Feb 2023 13:23:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YXh9Bl5IlPDLRFf6zXorjLZOfKA/sZ6eA3cRR5AR1ac=; b=rc7A0CUH65tLt0iiPfLiav4nxg
	yZ1zKM9Piz0NtdX0sqC0ZEiCSPY8e2MGtYJ7kzlg+H2ECNv2nbm13KNLutse/BPXS+myKhNwmDbqw
	Ju+DYhL8XqSXdtgWusAzCIHzfcB3Au0F0rsx5/lpi6L6EQzVYU12H6U+4HuKQnwM+KYkkuwuibTzO
	usG0oQ+XpRTBeHL0Yfc+ifDGUTzy+0kXK8W1hoEZk0BpepMd0Wl9K2q6pUA3EH5Qo57aqsLnNHRFm
	4c1cgbVZmZtFF2dYaiSec02Sn97EDwm2OW3EPLhm0NXLCf2KoN3Hw8BzhSR48F7TOWsC8BoTdhweb
	MYKpMZ1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pND4t-00C20J-7V; Wed, 01 Feb 2023 13:23:07 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pND4e-00C1sh-IK; Wed, 01 Feb 2023 13:22:54 +0000
Received: by mail-wr1-x429.google.com with SMTP id h16so17263865wrz.12;
        Wed, 01 Feb 2023 05:22:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YXh9Bl5IlPDLRFf6zXorjLZOfKA/sZ6eA3cRR5AR1ac=;
        b=MBkzwzB5cIqpfo4uf9VGvAGPE4J+oDWOEOh4LaRsbqfUBgwavSl5ZFMXAk78HAY7sX
         Xuz5YPADNH1fJiZUQ/pUa1Pg1JtbQUGShrfRCUWfRpV3K+6b6h8cnH87e3JQ5t9N1Smk
         pF5Gm0f52xkU0ANVtL2Am0nJCQuEGwGOKC1EiEwXuD7YzWqYUnt+w9IUnVwLxxukW+RX
         ecDXies8ED4YXhnE5c/Iq4P7da+ue5zxdmgEsJ+tF9jlaqATJnIgch8WaqVTELFd5LA+
         CmyLQUhOlSjwZThN2fElwry16MmCHfIuEP+tSxF6eEsDJa28JzjG4PYZ7Z1cCwWSn6MO
         QmSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YXh9Bl5IlPDLRFf6zXorjLZOfKA/sZ6eA3cRR5AR1ac=;
        b=yPlTN7KdckQ8FxLOITUtPd635PyJioECEIkm9MY7BxVg/fCsfl4kluYZD9SNhn0LqY
         nRaC5RnVT6loWJfoo8PeHDQPSUbIuvgOnLnFxfu5gj2Nbn6WP3gHMMP1vWKd/rjP4s9t
         H2kbVS+u+8CGaZiE7YO0aK/LvFgDtnwziNR8xlhfZoPVDa15KY61DpTT06FxJ2PcOdkD
         sBgce5JlW2xqQQV6VRI720o6VagEevGy5BbgQL2Na9bX7bzTm2V9qyDiTulFduObCxx1
         qT8tiaPetJyHl0vSAbCx1qwZFLlONUq3qfki89I+S6TOQqbUXgacnqICAHjcGLRgozh8
         K4Uw==
X-Gm-Message-State: AO0yUKWDUiKYw9mYGPpN57pTwEMDGoaodwqz5I5AEzmTcyKy7OH8Tw4g
	EXOQ6bYWQ4TDlJIgv9nBMdk=
X-Google-Smtp-Source: AK7set8YzROljVYpUMD7B3LLaCaYBj5PhZDEWhOO7u6nhd2XLVL+UL+VKfwcMlMCb8yU8lN1xZUQYQ==
X-Received: by 2002:a5d:570b:0:b0:2bf:c01a:f24f with SMTP id a11-20020a5d570b000000b002bfc01af24fmr1651657wrv.5.1675257771086;
        Wed, 01 Feb 2023 05:22:51 -0800 (PST)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id a17-20020a5d53d1000000b0024cb961b6aesm16920717wrw.104.2023.02.01.05.22.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Feb 2023 05:22:50 -0800 (PST)
Message-ID: <136b0d6f-0523-8019-35d9-792211e22d2a@gmail.com>
Date: Wed, 1 Feb 2023 14:22:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] soc: mediatek: mtk-devapc: Switch to
 devm_clk_get_enabled()
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20221006110935.59695-1-angelogioacchino.delregno@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20221006110935.59695-1-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230201_052252_670050_2474D41B 
X-CRM114-Status: GOOD (  18.03  )
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



On 06/10/2022 13:09, AngeloGioacchino Del Regno wrote:
> This driver does exactly devm_clk_get() and clk_prepare_enable() right
> after, which is exactly what devm_clk_get_enabled() does: clean that
> up by switching to the latter.
> 
> This commit brings no functional changes.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Applied, sorry for the delay.

Matthias

> ---
>   drivers/soc/mediatek/mtk-devapc.c | 11 ++---------
>   1 file changed, 2 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/soc/mediatek/mtk-devapc.c b/drivers/soc/mediatek/mtk-devapc.c
> index fc13334db1b1..bad139cb117e 100644
> --- a/drivers/soc/mediatek/mtk-devapc.c
> +++ b/drivers/soc/mediatek/mtk-devapc.c
> @@ -276,19 +276,14 @@ static int mtk_devapc_probe(struct platform_device *pdev)
>   	if (!devapc_irq)
>   		return -EINVAL;
>   
> -	ctx->infra_clk = devm_clk_get(&pdev->dev, "devapc-infra-clock");
> +	ctx->infra_clk = devm_clk_get_enabled(&pdev->dev, "devapc-infra-clock");
>   	if (IS_ERR(ctx->infra_clk))
>   		return -EINVAL;
>   
> -	if (clk_prepare_enable(ctx->infra_clk))
> -		return -EINVAL;
> -
>   	ret = devm_request_irq(&pdev->dev, devapc_irq, devapc_violation_irq,
>   			       IRQF_TRIGGER_NONE, "devapc", ctx);
> -	if (ret) {
> -		clk_disable_unprepare(ctx->infra_clk);
> +	if (ret)
>   		return ret;
> -	}
>   
>   	platform_set_drvdata(pdev, ctx);
>   
> @@ -303,8 +298,6 @@ static int mtk_devapc_remove(struct platform_device *pdev)
>   
>   	stop_devapc(ctx);
>   
> -	clk_disable_unprepare(ctx->infra_clk);
> -
>   	return 0;
>   }
>   

