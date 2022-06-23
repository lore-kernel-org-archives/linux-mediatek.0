Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1959C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jun 2022 12:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ufu6yT18j4D0NeIusttCIlZORKdSbmeJGdvOSn9RpAw=; b=c0WEGa9f7wl/f3/pjM2PX5yaX6
	RpsU3+//0pjMm9Kif0gj0qm3Wjpt/RwrcIq7axSNTeA4u+W8Ubbt0YoyEVjO7G+tH3jgR0Y3PPlT9
	DkWtHPRugEr4JzYFNU1MivvK84AM8LWZaAiPBMNftpoxgO1Y53NA1FA+UHOt5VIgbIJa3DlKe1FTh
	JPT6BTlJksqZYP2cxn/h15px0MGkkcjgXZdCeeVUKKObQHoXKvucxPpd8rxBqipd8VaeIb/IeIBBE
	3GfqDeU3sjG0vCh2DNiyx4GBV8rV0lcsPS2KnkG0Rfqk8141tSFdSekpXf2M7p/FEYUne3k8ilekF
	GuNJ9ZeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4Ljo-00EwMg-Jh; Thu, 23 Jun 2022 12:15:08 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4LZw-00Es4R-QQ; Thu, 23 Jun 2022 12:04:58 +0000
Received: by mail-ed1-x52e.google.com with SMTP id c65so5174399edf.4;
        Thu, 23 Jun 2022 05:04:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=ufu6yT18j4D0NeIusttCIlZORKdSbmeJGdvOSn9RpAw=;
        b=o8SClQWJV5Ru/Zc8kpIdfbB9MMcgpPbzPeoQuTiYHI9bPc2WZepmmWOwVWQQrgclFP
         5aDdGr27KalRWPaO+mKs3hfrgcMUKaPg/kzjca8NDYWw/i9nND4yxHp09pxi2wZY04m2
         MCqW0M+I7QMoGibNDx3wIiwS9squIMpJKDwGJptwEnySzboWicpD9TgG4VYwIcOz3kxK
         IQD4cWsli6o92xPDAME4MK5M1VCRqnCZnRJYCVfu1s65Jr/YhnnPuHSDBsllxgGLuI3/
         RhAoudSBfC2M4M2O5Ox1dX+VdeLdQaVEk3HcT3ck0g9P74AH0jD1q80UMa6ZXAmHWeV8
         2kVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=ufu6yT18j4D0NeIusttCIlZORKdSbmeJGdvOSn9RpAw=;
        b=V8EqtxfywJBDc0qJ//eYl6NB9YPCadgG7nMsOybb5mI7M3CwucXyLUhAUgpO1NxKRd
         whQu0phqAqT7Fy7HeMQMMNDDL+x3YnSNZSsdWF1JabaKWFcIgQkC85I67TfNn349x9rY
         N24Z4G6N1WmFq/2xi9dxWS+VroFMuag1saNBCnDt21wN9pxC2xVQkgoamkPP1Qdl8vTl
         20wPceOMeGoocqMVLeQpQiaaLUYg4VsjjHRhlnLBSo7DC9r9AAdMsMY1PrrpOMYfZwuT
         l9QODHeBuemSrfzLgJBbLpSooEUGx6he9y3qC9nQS4HSUnf/3owx3Z8N6Wn9GHym/gGF
         DCMQ==
X-Gm-Message-State: AJIora/Q58JwCe/IJ/lwMQnKkvzIE6PpuuJFOeUImNKKsDG99b+TM/Tg
	Z60HJt2zDPHmUBJVG6WLB3k=
X-Google-Smtp-Source: AGRyM1usXBmH5/fwpNd06qO/yWn2NlL7QH0bfQAJrMesDu49vzDOCQ4mmdd+Px7FI9LJ81NuOg/r/Q==
X-Received: by 2002:a05:6402:5388:b0:435:71b:5d44 with SMTP id ew8-20020a056402538800b00435071b5d44mr10080480edb.364.1655985892157;
        Thu, 23 Jun 2022 05:04:52 -0700 (PDT)
Received: from [192.168.1.145] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id g15-20020a1709063b0f00b007246492658asm979759ejf.117.2022.06.23.05.04.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jun 2022 05:04:51 -0700 (PDT)
Message-ID: <92d0d361-7d04-150c-97f2-3e073945a210@gmail.com>
Date: Thu, 23 Jun 2022 14:04:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH] soc: mediatek: SVS: Use DEFINE_SIMPLE_DEV_PM_OPS for
 svs_pm_ops
Content-Language: en-US
To: Nathan Chancellor <nathan@kernel.org>
Cc: Roger Lu <roger.lu@mediatek.com>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, patches@lists.linux.dev,
 Jin Xiaoyun <jinxiaoyun2@huawei.com>
References: <20220622175649.1856337-1-nathan@kernel.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220622175649.1856337-1-nathan@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220623_050456_914657_F5B5A959 
X-CRM114-Status: GOOD (  21.28  )
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



On 22/06/2022 19:56, Nathan Chancellor wrote:
> When building this driver for an architecture that does not support
> CONFIG_PM_SLEEP, such as hexagon, the following warnings occur:
> 
>    drivers/soc/mediatek/mtk-svs.c:1481:12: error: unused function 'svs_suspend' [-Werror,-Wunused-function]
>    static int svs_suspend(struct device *dev)
>               ^
>    drivers/soc/mediatek/mtk-svs.c:1515:12: error: unused function 'svs_resume' [-Werror,-Wunused-function]
>    static int svs_resume(struct device *dev)
>               ^
>    2 errors generated.
> 
> This happens because SIMPLE_DEV_PM_OPS uses SET_SYSTEM_SLEEP_PM_OPS,
> which evaluates to nothing when CONFIG_PM_SLEEP is not set, leaving the
> functions unused in the eyes of the compiler.
> 
> This problem was rectified in commit 1a3c7bb08826 ("PM: core: Add new
> *_PM_OPS macros, deprecate old ones") with new macros. Use
> DEFINE_SIMPLE_DEV_PM_OPS to fix the warning while not changing
> svs_pm_ops when CONFIG_PM_SLEEP is set.
> 
> Fixes: 681a02e95000 ("soc: mediatek: SVS: introduce MTK SVS engine")
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Thanks for the patch. The same issue was addressed by Jin Xiayun here:
https://lore.kernel.org/linux-mediatek/20220623030931.2816013-1-jinxiaoyun2@huawei.com/T/#u

I'm happy for any review help.

Regards,
Matthias

> ---
>   drivers/soc/mediatek/mtk-svs.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/mediatek/mtk-svs.c b/drivers/soc/mediatek/mtk-svs.c
> index 606a00a2e57d..d70903f45ddf 100644
> --- a/drivers/soc/mediatek/mtk-svs.c
> +++ b/drivers/soc/mediatek/mtk-svs.c
> @@ -2381,7 +2381,7 @@ static int svs_probe(struct platform_device *pdev)
>   	return ret;
>   }
>   
> -static SIMPLE_DEV_PM_OPS(svs_pm_ops, svs_suspend, svs_resume);
> +static DEFINE_SIMPLE_DEV_PM_OPS(svs_pm_ops, svs_suspend, svs_resume);
>   
>   static struct platform_driver svs_driver = {
>   	.probe	= svs_probe,
> 
> base-commit: 71eaf1887203d0a59c92fd9dd3436b8d8489d68c

