Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EB8DC43334
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Jun 2022 13:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8h+FpcXrrgVVoUz/iXyZW+h/bqUW6xveKHdamK/cuQc=; b=CdXE8GnAeb1uva2cPQZOEaQUAQ
	3eAM0M7fkLKAOcbvxrs75LZPmLCPF9GLoAcn2yhN81yAINx+fISYRUm7PaC0w8rqXa0uXhHSnl3Tl
	7dnAwwd3skZxdZcQ6h7bl6MKuonKgZBokZ7GCsaF83YVcafnS+0II5JeJR2r1VD07LC6SClWPi1ht
	3IBCLiIfuFVa6rpjmTMH1EJOkDLp+1buFdTjXWvxlCNhAAlalPSe2DDSZUkNbyBwD04HbgiRGaym3
	kf6M4eSCNkjk7rsfhlRyZs/X4O2eNN9uqIODglt8AF4y54u/C9l2jdllJfkldzjtlgpOOH4YqPWfc
	xaYpRIvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1pY9-002SfQ-Dp; Thu, 16 Jun 2022 13:28:41 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1pY6-002Sdj-TP; Thu, 16 Jun 2022 13:28:40 +0000
Received: by mail-wr1-x431.google.com with SMTP id h5so1927733wrb.0;
        Thu, 16 Jun 2022 06:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=8h+FpcXrrgVVoUz/iXyZW+h/bqUW6xveKHdamK/cuQc=;
        b=a998jYD2CZKZZJVPrXyeBC/bJFux5MWHfso4bLTv11q7pyesMZCgv6WDOku9YPqUvN
         FDO7eR32YMlOe5kqaNv2yHLYNYJoiH6vO2OsGb8ebqOlPhV7cgdAwR1XqfKuhU6XIxMC
         PbYddJwmRfjU352RIVPwrjRL0TvqL9DkN3gq9ORZzp2kx06lrCfYe4G1JqzzvCf9MtJ2
         IIf+uhCuWz9ReVq4LmWp8OK/fNqP6QpLWUJtZKS4JxpCMjvqewjRX21/4VV938rWiKhr
         2IErU1R/CFnngTA39KwYkqVv+idN2Xl0GNfF2QS4Up29Yg8c753g4dUoRGvuNYzYhcgp
         qy5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=8h+FpcXrrgVVoUz/iXyZW+h/bqUW6xveKHdamK/cuQc=;
        b=PeKbb1Ot/03FnBHYnJQ4jnGuilS+xwqH2IbBQK7d7Sd1Ab1p9/CarBDpsPWfvZcrTF
         JCCJVnyRF/aeA5/BivaEbCIuYZKjl+taf+yCdG8qitUxVb+G3jl23WUttrVF7ivKQPUM
         uybUtNe0OO+YUPmDWFz4HwvdkyApVaoPgo3GvqjC+5v4GIzEc2Ov0rFq7r2+jQBQYoUd
         XpI8dYym5yJegkfjeQ454mNSeycsPrgXBZRDCnMkUlroTFqM7hrHIn25i5AJCVZIiTLD
         iC+xGAfPN5HEAIt+vh0wbQ8NjEtxaF2e1/vWP6+iNmlPkmz9Nam46jvhEWnj5Tp1fMAb
         hX4g==
X-Gm-Message-State: AJIora9M+1PlJ/sMO4xKXCpkALuM4tzI+RXm6LBqz6sSNj/6vCWj6a1z
	F5a4sdbRquYU9YATBW5dFtM=
X-Google-Smtp-Source: AGRyM1unnhtSqt7GBcBXkXPGLTuYxnFiOMYFOgsWaPoDEka0FPVYkml3TItU5PtGNRR2Jfz0hmT2dg==
X-Received: by 2002:adf:fe90:0:b0:210:7e22:186e with SMTP id l16-20020adffe90000000b002107e22186emr4837864wrr.321.1655386115274;
        Thu, 16 Jun 2022 06:28:35 -0700 (PDT)
Received: from [192.168.1.145] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id bg27-20020a05600c3c9b00b003974d0d981dsm6360986wmb.35.2022.06.16.06.28.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jun 2022 06:28:34 -0700 (PDT)
Message-ID: <085be77f-3833-628e-b76a-b2b888db3b78@gmail.com>
Date: Thu, 16 Jun 2022 15:28:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v2 1/5] iommu/mediatek: Use dev_err_probe to mute
 probe_defer err log
Content-Language: en-US
To: Yong Wu <yong.wu@mediatek.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>
Cc: iommu@lists.linux-foundation.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 mingyuan.ma@mediatek.com, yf.wang@mediatek.com, libo.kang@mediatek.com,
 chengci.xu@mediatek.com, youlin.pei@mediatek.com, anan.sun@mediatek.com,
 xueqi.zhang@mediatek.com, Guenter Roeck <groeck@chromium.org>,
 Dan Carpenter <dan.carpenter@oracle.com>
References: <20220616054203.11365-1-yong.wu@mediatek.com>
 <20220616054203.11365-2-yong.wu@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220616054203.11365-2-yong.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220616_062838_994164_CC483628 
X-CRM114-Status: GOOD (  17.16  )
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



On 16/06/2022 07:41, Yong Wu wrote:
> Mute the probe defer log:
> 
> [    2.654806] mtk-iommu 14018000.iommu: mm dts parse fail(-517).
> [    2.656168] mtk-iommu 1c01f000.iommu: mm dts parse fail(-517).
> 
> Fixes: d2e9a1102cfc ("iommu/mediatek: Contain MM IOMMU flow with the MM TYPE")
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Reviewed-by: Guenter Roeck <groeck@chromium.org>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>   drivers/iommu/mtk_iommu.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
> index bb9dd92c9898..3b2489e8a6dd 100644
> --- a/drivers/iommu/mtk_iommu.c
> +++ b/drivers/iommu/mtk_iommu.c
> @@ -1204,7 +1204,7 @@ static int mtk_iommu_probe(struct platform_device *pdev)
>   	if (MTK_IOMMU_IS_TYPE(data->plat_data, MTK_IOMMU_TYPE_MM)) {
>   		ret = mtk_iommu_mm_dts_parse(dev, &match, data);
>   		if (ret) {
> -			dev_err(dev, "mm dts parse fail(%d).", ret);
> +			dev_err_probe(dev, ret, "mm dts parse fail.");
>   			goto out_runtime_disable;
>   		}
>   	} else if (MTK_IOMMU_IS_TYPE(data->plat_data, MTK_IOMMU_TYPE_INFRA) &&

