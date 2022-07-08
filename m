Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 523DDC43334
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Jul 2022 08:33:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Voj254B0p3wkYRVS8bJszZbCEXbEP6UJbrfd6/44x4s=; b=OF0z0nlbjT1pm5x7q+zdb357lX
	HH+133Q0LYzqaNvxh6Fu0BFh/oq/T664S9ekLbZ+ZEPVtKFE6O97sJWaA7uEpoAQMwtRKRM+3DRtS
	w75VIrwtgztz2RQL+uNlDjQZBHwf3TzKxavGqcZfQj5iSQXCpiZw/8p1j4TKeAIj7hfkqFYpSwIRj
	8QoQo4v5YwXMPbF2TKXiQ2LggGPCjvdoqEhFBqbeC8NokJyezT5a4zZIN1WdNrIEkLT7GIj1xH7J7
	fATVH51aFH9ET+mYZM7fLj+XYzDDTbSvSZaUV46vpT6Atkt3Era1xTrg5nCrsrHgfnftNltDPAk07
	vrh9jGiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9jQI-002ZYd-IM; Fri, 08 Jul 2022 08:33:14 +0000
Received: from mail-il1-x135.google.com ([2607:f8b0:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9jMi-002Y0d-Up; Fri, 08 Jul 2022 08:29:34 +0000
Received: by mail-il1-x135.google.com with SMTP id v2so3431119ilo.7;
        Fri, 08 Jul 2022 01:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=Voj254B0p3wkYRVS8bJszZbCEXbEP6UJbrfd6/44x4s=;
        b=NOoI0w9SPNgApsuy7D0rRt//K01GWYCh2YVqOTCqwwVhAsF0MkiJHZOx/w8Kz/UkGu
         U9iFfyc813badJjJwM/J+ab0brj853pwzahsuyw5AGS6vC2HI32dZHU567dRWSIANPf9
         f1IKCGaEMwy/XzQMj9lFhIneZ1+F666VhWCXm2K0OwPN6Vgl+ED1h+SIjHkncMeAqyy0
         ss5xU7ZwXafKpFOQkKB/g/HoG/rl+UMnAc1aeCsx2R7DnnjCRDF7cN/NAzuRztg7ngS1
         1aTmSMXn+Vmn59wggVifPMudq3P8oh5wog3n4yNsY3JxUXqkPFDZQSyGSnDVkr00vdIQ
         DL4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Voj254B0p3wkYRVS8bJszZbCEXbEP6UJbrfd6/44x4s=;
        b=P2uY5gn9E8bKCQW8RCQxmN8flnS2hx3gYfP1mbsqt13xqDO8ISRDes/GlRMGJp1k5Z
         75fg8SCUhtNfh4+oXaGf6RTPNK5ET2oLQiDOitlf6uf10xKEe0RrRqnUHI6ikQwSTATO
         bKFKuuftjIZknd0V9Xa2POrL+3pTP9EzJz76SQOIDUnaU+57LIQRu6zJuu7+QSXkCHnS
         CSb4fgywo2DoO1Wa7eczI2fSPgXa/Yu/esKKuXt6PQiQuGMd3s1SHp3+eJxwNd+tjMld
         ivCchVc6QUBX6Q7UBJqTMbiNJ3ZJFFaJPjS8IF2iL2dCEN9NpckRGYCQewEZSXloH1mq
         FwCQ==
X-Gm-Message-State: AJIora/QU2XtfzwLbwZJ03EAPYjJVJ1NLVwJlQil9aZWTZP8xToI+/7Z
	jgr4kzEij3nGX2Q9ixYZrpA=
X-Google-Smtp-Source: AGRyM1szrpKQ04HJXTHsJ0vRoWy6DvJYkFZppXH8z8QoaTM7mI1fD693J9v50GHzhx539e5duO2YmA==
X-Received: by 2002:a05:6e02:152c:b0:2db:34fc:a61f with SMTP id i12-20020a056e02152c00b002db34fca61fmr1395111ilu.139.1657268972071;
        Fri, 08 Jul 2022 01:29:32 -0700 (PDT)
Received: from [192.168.1.145] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id k9-20020a6b3c09000000b00669a3f60e99sm18753936iob.31.2022.07.08.01.29.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Jul 2022 01:29:30 -0700 (PDT)
Message-ID: <0c01efca-d350-a922-2beb-453b24e9af48@gmail.com>
Date: Fri, 8 Jul 2022 10:29:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] soc: mediatek: mutex: Simplify with
 devm_platform_get_and_ioremap_resource()
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20220623121701.107512-1-angelogioacchino.delregno@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220623121701.107512-1-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220708_012933_060810_C46B2F04 
X-CRM114-Status: GOOD (  19.97  )
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



On 23/06/2022 14:17, AngeloGioacchino Del Regno wrote:
> Convert platform_get_resource(), devm_ioremap_resource() to a single
> call to devm_platform_get_and_ioremap_resource(), as this is exactly
> what this function does.
> 
> While at it, also remove a redundant call to of_address_to_resource(),
> as this was getting the address of the same resource index 0: we can
> as well get the iostart from the 'regs' pointer.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Applied, thanks!

> ---
>   drivers/soc/mediatek/mtk-mutex.c | 18 ++++++------------
>   1 file changed, 6 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/soc/mediatek/mtk-mutex.c b/drivers/soc/mediatek/mtk-mutex.c
> index 60cbafea577e..ca8440fb48cd 100644
> --- a/drivers/soc/mediatek/mtk-mutex.c
> +++ b/drivers/soc/mediatek/mtk-mutex.c
> @@ -787,7 +787,7 @@ static int mtk_mutex_probe(struct platform_device *pdev)
>   {
>   	struct device *dev = &pdev->dev;
>   	struct mtk_mutex_ctx *mtx;
> -	struct resource *regs, addr;
> +	struct resource *regs;
>   	int i;
>   #if IS_REACHABLE(CONFIG_MTK_CMDQ)
>   	int ret;
> @@ -811,11 +811,12 @@ static int mtk_mutex_probe(struct platform_device *pdev)
>   		}
>   	}
>   
> -	if (of_address_to_resource(dev->of_node, 0, &addr) < 0) {
> -		dev_err(dev, "Failed to get addr\n");
> -		return -EINVAL;
> +	mtx->regs = devm_platform_get_and_ioremap_resource(pdev, 0, &regs);
> +	if (IS_ERR(mtx->regs)) {
> +		dev_err(dev, "Failed to map mutex registers\n");
> +		return PTR_ERR(mtx->regs);
>   	}
> -	mtx->addr = addr.start;
> +	mtx->addr = regs->start;
>   
>   #if IS_REACHABLE(CONFIG_MTK_CMDQ)
>   	ret = cmdq_dev_get_client_reg(dev, &mtx->cmdq_reg, 0);
> @@ -823,13 +824,6 @@ static int mtk_mutex_probe(struct platform_device *pdev)
>   		dev_dbg(dev, "No mediatek,gce-client-reg!\n");
>   #endif
>   
> -	regs = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	mtx->regs = devm_ioremap_resource(dev, regs);
> -	if (IS_ERR(mtx->regs)) {
> -		dev_err(dev, "Failed to map mutex registers\n");
> -		return PTR_ERR(mtx->regs);
> -	}
> -
>   	platform_set_drvdata(pdev, mtx);
>   
>   	return 0;

