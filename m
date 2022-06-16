Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE8BAC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Jun 2022 13:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m6uBZVuyEz2LJoe25N52zu3vkj3sZBGqGpB8uE3jv7A=; b=ZUVnL3r8FKk8EvMjFoVFdJMKXz
	b06zxzoJv7/nQTjgQLZ+TSwayw/qwrwZNHmiQXNYWEfvzze8JP0SNkrBvUfZp2/Y+V+dL/y3gJwi9
	P23+KmaWil+YDVP3nP316vMsDjvI35EZ/0PQrHDt4YWj9y9PDL8bijewEROrJ5MYtBcz2xazqyo+i
	x8zrirjNyEp4UXjAOg9DQIGGhql/60m2EN8NRmNAiAcXJsPE/Hhe1Y5K/h8EKC7r7w5a6/MKA9v0o
	X2utX1NZp82z0PDNl/tbil7CQZf+E4E3Jr2cRchBvNFV1mR0zpsmGY7uUcLk5ll1UA3t4q0d1P1gk
	QPnHvdJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1q1R-002es5-II; Thu, 16 Jun 2022 13:58:57 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1pzJ-002dsl-Lc; Thu, 16 Jun 2022 13:56:47 +0000
Received: by mail-wm1-x331.google.com with SMTP id m125-20020a1ca383000000b0039c63fe5f64so933741wme.0;
        Thu, 16 Jun 2022 06:56:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=m6uBZVuyEz2LJoe25N52zu3vkj3sZBGqGpB8uE3jv7A=;
        b=FCcdLGR8f+Nh4u2S5InboaIgmcQQkJa1/T5sIaER5b1erKLX9DvZqJNGD7loQo/q7C
         2952kKcUSS0KV+Y8KCAA2obrp6Y7UwwaB/Pq5FcS+zSpkx7tWMmapHDfShl4e/pt0Rxu
         /acX5/8UCfH0p0Kw9wexWShHNrRFe81xuW+3iCzpM6BLg34RyYTX8NwW/PmHwy7+joru
         O9lks34OHP+dOji5ulmU7tW46oqOySDujx/+lIOJwUWX+1sRiOxHGobuNE4qEL5zAjj9
         tGaXFzLgjYRHKA0q72nZauUDuqLWqwwLkD5RD9KB0TMTc+HrUsZ55yS61/GGqUt4DMhA
         uZdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=m6uBZVuyEz2LJoe25N52zu3vkj3sZBGqGpB8uE3jv7A=;
        b=EzFBU8rxavGzZotwMuCM5ga7YL/gbLEmQz1tVL7O8lRQqT3balNfApEQT5HY2mkV2V
         HMrW2NFCHLv/OVPPZ96TEX/5PJmp+cGPrT7e0ZL55CUlCGKOCKPHxrj+LnyzlkF1FueC
         m3lVJCAsBpex1kJ2aryfP1dzTlwfr03/OdVuy1OQW7w9tlPCMcliX9DPljwT00wbvYWd
         Q5RXuK4bcDTvkrY68fJia9CRVb2Bl430K8L3xfv1Rb14ywdiWloN7VoY1WKJCTXfgZ3C
         BbArbo6vtcV4CZ2zSr5LALS0Mt8W8EvZjyplBQLnxosObs4y9muKIoscRfgkWthVV7Wh
         lQfg==
X-Gm-Message-State: AJIora8cJiGXXCfQkrFpPP5MYuR0edzjotlsSj+5V3yWC9RdTK0EYTs8
	VWeU8zC6XT27cKtBcVwlrMw=
X-Google-Smtp-Source: AGRyM1vaMBvDopUDTt0s4tdWKsT6HUNecCRsYk/m/z7HxI6lnV8qvwV44VhHPlGJhcCQclZE98LQ/Q==
X-Received: by 2002:a05:600c:34cf:b0:39c:4dfb:1398 with SMTP id d15-20020a05600c34cf00b0039c4dfb1398mr5161884wmq.133.1655387801411;
        Thu, 16 Jun 2022 06:56:41 -0700 (PDT)
Received: from [192.168.1.145] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id o15-20020a05600c4fcf00b0039c811077d3sm2518057wmq.22.2022.06.16.06.56.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jun 2022 06:56:40 -0700 (PDT)
Message-ID: <65ebee0a-391a-294f-13f1-bc039f0a748c@gmail.com>
Date: Thu, 16 Jun 2022 15:56:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v2 5/5] iommu/mediatek: Remove a unused "mapping" which is
 only for v1
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
 <20220616054203.11365-6-yong.wu@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220616054203.11365-6-yong.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220616_065645_770931_98F31358 
X-CRM114-Status: GOOD (  15.79  )
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



On 16/06/2022 07:42, Yong Wu wrote:
> Just remove a unused variable that only is for mtk_iommu_v1.
> 
> Fixes: 9485a04a5bb9 ("iommu/mediatek: Separate mtk_iommu_data for v1 and v2")

It does not fix a bug, so no fixes tag here needed.

With that:
Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> ---
>   drivers/iommu/mtk_iommu.c | 3 ---
>   1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
> index 5e86fd48928a..e65e705d9fc1 100644
> --- a/drivers/iommu/mtk_iommu.c
> +++ b/drivers/iommu/mtk_iommu.c
> @@ -221,10 +221,7 @@ struct mtk_iommu_data {
>   	struct device			*smicomm_dev;
>   
>   	struct mtk_iommu_bank_data	*bank;
> -
> -	struct dma_iommu_mapping	*mapping; /* For mtk_iommu_v1.c */
>   	struct regmap			*pericfg;
> -
>   	struct mutex			mutex; /* Protect m4u_group/m4u_dom above */
>   
>   	/*

