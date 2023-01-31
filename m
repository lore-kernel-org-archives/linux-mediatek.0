Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09990C38142
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Jan 2023 13:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DDykM3xjoJqJ0kl5mL74IPEifh1EPorjz4JkjoCu2Ck=; b=gRWrxk5MbW3P/z7HXaomd/eSmo
	wzSonfZjZT72AjQWPPmmWLeyyJ7ES1YTDJafe3dGH4qRC8yoSftXi9wqwE2WSl0NZ3abLOHwuYKva
	PBColr7osnUOwTxMUbipQ7Zh1+GCWE6dSb67oSYZiyDB9ob6uy/3vwJCeTKGBqO9LnK8bhvFAlIIF
	0Otonpg0VQ0pN7iJJhHc+1pzRkJLTWMfp+TpYIlKcVlRmQJ06juLao+zw3wZ4jbHfCv32aJ1zFOXG
	DrpF81V7a1s19UpYhGI1OU1hmafFpxr3M6QCG55jTtArvGRIolJlc0P1KqsbLjAJHI7lb9hWJBWPb
	PulsMZ/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMqej-0085pJ-1U; Tue, 31 Jan 2023 13:26:37 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMqdO-0085BX-Gx; Tue, 31 Jan 2023 13:25:16 +0000
Received: by mail-wm1-x32f.google.com with SMTP id k8-20020a05600c1c8800b003dc57ea0dfeso4466415wms.0;
        Tue, 31 Jan 2023 05:25:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DDykM3xjoJqJ0kl5mL74IPEifh1EPorjz4JkjoCu2Ck=;
        b=CURwR0Lgn9WhsX6ywDQm13K/RhmiZivoGl4GvCyWc7PwAhJpbignBeXv5vigmQ5mZj
         OoCB8gMREUJGLd6cFDwESGZ6YSfutnNT4KTQbj05ipxpxkmSahMQI9K/w65C65Lbb3Wh
         d41drc6ykkp/N0MEO9RYJLc2hXLAfhP+q2UdaEbb97JF6OH5Ivdk3KSNlvjmqUUyBfew
         F/Oo0wOC2zoXCIQ/aC0/ZKb3FDdfxpLF2HApWFA9G01FvgZAGf0I8d68NULtliZIl8ph
         1LsmT5fjRKpHo3nU60H7MidQnMNfr6JH5xAuTVm6Eb8Y5nojh6Qnut1873pm+aF4D2Ts
         G6qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DDykM3xjoJqJ0kl5mL74IPEifh1EPorjz4JkjoCu2Ck=;
        b=IVsg3mLqmK0dJZ45DMArTZub/z5gb2Bu2k6F62Bh3ddm6ECfv6dt8rupuPx0vYQE/z
         mMD+XeRKSpGk0rV2KMXM4Cobov3HNilA5pD1jKifMbbwCy7nOu1AasVugY1nQ5hdfQIo
         BVXfiGzQp5PGGQrpLeyagnVSqWkCZijoe52oo2Z8K7/gAgeP53/1ECgaih4aUTDeig4f
         zwdlfv5qqa1tEF+7mAvBgaH1cf1qOlwDCkBRjgp1Noyd6qdI41s+oZlWZWt05aBtHcR0
         FTp3TCQb+9KCss/HHxAek8Ln/JwcC92lfXfcotQKlPPGA9DpJns2lGt7k8QJumNNQICd
         W/qw==
X-Gm-Message-State: AO0yUKV42gmSwT+LhffU1rlpfSo0FLbb6gWBUMulDXVgCxYPrKhjXiZI
	v6GVpIQNRSkCSO6e3lKJBJA=
X-Google-Smtp-Source: AK7set+SfF/7IYY5GviCD1PQ1TFPd91rN8Dki0ogSFZXZligftSvL1B0QOl7tXj5CqIA7yNb8/V70g==
X-Received: by 2002:a05:600c:a0e:b0:3dd:1b02:23b7 with SMTP id z14-20020a05600c0a0e00b003dd1b0223b7mr4163860wmp.10.1675171510655;
        Tue, 31 Jan 2023 05:25:10 -0800 (PST)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id l4-20020a7bc444000000b003db03725e86sm15793911wmi.8.2023.01.31.05.25.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Jan 2023 05:25:10 -0800 (PST)
Message-ID: <575d0d40-4a23-20af-f8c3-221c8fb0be1a@gmail.com>
Date: Tue, 31 Jan 2023 14:25:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v4 10/14] soc: mediatek: mtk-svs: move svs_platform_probe
 into probe
Content-Language: en-US
To: Roger Lu <roger.lu@mediatek.com>,
 Enric Balletbo Serra <eballetbo@gmail.com>, Kevin Hilman
 <khilman@kernel.org>, Nicolas Boichat <drinkcat@google.com>
Cc: Fan Chen <fan.chen@mediatek.com>,
 Jia-wei Chang <jia-wei.chang@mediatek.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20230111074528.29354-1-roger.lu@mediatek.com>
 <20230111074528.29354-11-roger.lu@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230111074528.29354-11-roger.lu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230131_052514_654984_B8ECD604 
X-CRM114-Status: GOOD (  17.57  )
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



On 11/01/2023 08:45, Roger Lu wrote:
> From: Matthias Brugger <matthias.bgg@gmail.com>
> 
> Moving svs_platform_probe into driver probe function will allow us to
> reduce svs_platform members. This will be done in a follow-up patch.
> 
> Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Roger Lu <roger.lu@mediatek.com>

Applied, thanks!

> ---
>   drivers/soc/mediatek/mtk-svs.c | 20 ++++----------------
>   1 file changed, 4 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/soc/mediatek/mtk-svs.c b/drivers/soc/mediatek/mtk-svs.c
> index 354582825082..9d9210c22289 100644
> --- a/drivers/soc/mediatek/mtk-svs.c
> +++ b/drivers/soc/mediatek/mtk-svs.c
> @@ -2387,17 +2387,17 @@ static const struct of_device_id svs_of_match[] = {
>   	},
>   };
>   
> -static struct svs_platform *svs_platform_probe(struct platform_device *pdev)
> +static int svs_probe(struct platform_device *pdev)
>   {
>   	struct svs_platform *svsp;
>   	const struct svs_platform_data *svsp_data;
> -	int ret;
> +	int ret, svsp_irq;
>   
>   	svsp_data = of_device_get_match_data(&pdev->dev);
>   
>   	svsp = devm_kzalloc(&pdev->dev, sizeof(*svsp), GFP_KERNEL);
>   	if (!svsp)
> -		return ERR_PTR(-ENOMEM);
> +		return -ENOMEM;
>   
>   	svsp->dev = &pdev->dev;
>   	svsp->name = svsp_data->name;
> @@ -2408,19 +2408,7 @@ static struct svs_platform *svs_platform_probe(struct platform_device *pdev)
>   
>   	ret = svsp_data->probe(svsp);
>   	if (ret)
> -		return ERR_PTR(ret);
> -
> -	return svsp;
> -}
> -
> -static int svs_probe(struct platform_device *pdev)
> -{
> -	struct svs_platform *svsp;
> -	int svsp_irq, ret;
> -
> -	svsp = svs_platform_probe(pdev);
> -	if (IS_ERR(svsp))
> -		return PTR_ERR(svsp);
> +		return ret;
>   
>   	if (!svs_is_efuse_data_correct(svsp)) {
>   		dev_notice(svsp->dev, "efuse data isn't correct\n");

