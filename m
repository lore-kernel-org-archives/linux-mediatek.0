Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB58DC43334
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Jun 2022 13:04:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:Subject:From:References:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1dVwRcvX/zX2ZvyZyllNzIEz5OjgRw64ZDWPHeywZC8=; b=G2aVKO86syiEtd474Ns/KDPBKJ
	IleB59Rv0NfPicG82qBwHHUu6uZ8qpc9gTM+4WcbbYVJwyHV4Gg/sBvnMAsFR/fJCC9sDnMlzPQZZ
	DgrqXuImBagIEvqFrz5J+qIRziyzcRTgrQV0pUBWNFLe5ajcJfyFedtENMJfmVzXDChFrq6QN3Dr+
	yt7qh12bR8PJTllxrJ9kMdxZJ0I1w0amJgabH9V3gWnbpJH6v8DEuLN29O6x48NUPbMhb6F83XyMx
	V8Gx/z+zAF7zu6pNLZN7J7LbjkltcavmLooGjxVpUdunyff7khefKHTBTxljNhXwxg92GOlV4X7P8
	ZFq8f1vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1pAD-002Nll-EH; Thu, 16 Jun 2022 13:03:57 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1pAB-002NjQ-7l; Thu, 16 Jun 2022 13:03:56 +0000
Received: by mail-wr1-x434.google.com with SMTP id c21so1816445wrb.1;
        Thu, 16 Jun 2022 06:03:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:content-language:to:cc
         :references:from:subject:in-reply-to:content-transfer-encoding;
        bh=1dVwRcvX/zX2ZvyZyllNzIEz5OjgRw64ZDWPHeywZC8=;
        b=NLgcwNvhdW5LkWEv0Uj6WMcBuQS0Z1MM6opxaEO69IsazSgL5o/21eqAo114sQwXs2
         ZkXtQWXYFdjoNejhiOflb2NYwFTOrZCmVk+R4LosZsDdyZD9GX1+SdXppbuI+3Pl4Dwj
         oZ8LDWShTIDXYFrDt/VL60KBQZskZjrfS9Ujd846ylIsSkNqoYV821AlLBcV1M9k4Uni
         hvgWGjpA7tm8/uhmXNgYXzdZOlb/YAz+dFGZZ3YQFjV1IgK0SCNKEgtcekb73M/l0LwD
         Ea1mOJ4TPFkQ1t9gp7J5SSIcpPoZBufsHPVIxTtW0SXqdT9uP7HfY8MR7wZZT1DYNsT9
         tDIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent
         :content-language:to:cc:references:from:subject:in-reply-to
         :content-transfer-encoding;
        bh=1dVwRcvX/zX2ZvyZyllNzIEz5OjgRw64ZDWPHeywZC8=;
        b=iiCL971bAT4iSyORcMGwMt+C4hVcFoh0j1GGynnKU5yl77m/knUABikUl080ATH5ep
         Jywlmr5PryVBqyf/rb3kK90AEQozZ9Vts1bHA4fp+NOXcvtq6NSweW3r/A1BjZTpF1zb
         c2zZbiLfXnCA6cbyBRS0irzQkRHbo2NL9Fa1npId9jEwCnMMRKo34ysBUGFSoEvf5DWS
         0M/wMCAaUCvmVKqYZPpaIh7HzYsakQqyvCd/CX5BTgqFvSOZle5tew/JAjnkCfuU1r+M
         1NI+8UtonaDKRmDMru1rOirpOXW14dOqLivsNJ3tSa6pX/tNiTd4mt8GFDKlBQB7+IUM
         wfvA==
X-Gm-Message-State: AJIora+bzgPJvptC59FETuIarSIF3HnJ9yWN0uZi8BhDOoicYQu11vZr
	/tuNe+Ppud6pjyV8MFamFrw=
X-Google-Smtp-Source: AGRyM1sv4JO3boUQn0I7JKR24E8LVGw6lqUPTDh/dIC/Y2zXeT22ejoujCVHN0znkQkj4DjGS0zThA==
X-Received: by 2002:a05:6000:a0b:b0:219:f87e:86b with SMTP id co11-20020a0560000a0b00b00219f87e086bmr4647358wrb.570.1655384627020;
        Thu, 16 Jun 2022 06:03:47 -0700 (PDT)
Received: from [192.168.1.145] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id m15-20020a05600c4f4f00b0039748be12dbsm6319155wmq.47.2022.06.16.06.03.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jun 2022 06:03:46 -0700 (PDT)
Message-ID: <f47513f3-e1a9-1764-9954-cdf6931281a9@gmail.com>
Date: Thu, 16 Jun 2022 15:03:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 yong.wu@mediatek.com
Cc: joro@8bytes.org, will@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, iommu@lists.linux-foundation.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 krzysztof.kozlowski@linaro.org, miles.chen@mediatek.com
References: <20220616110830.26037-1-angelogioacchino.delregno@collabora.com>
 <20220616110830.26037-6-angelogioacchino.delregno@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH v4 5/5] iommu/mediatek: Cleanup pericfg lookup flow
In-Reply-To: <20220616110830.26037-6-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220616_060355_324161_5B074118 
X-CRM114-Status: GOOD (  16.49  )
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



On 16/06/2022 13:08, AngeloGioacchino Del Regno wrote:
> Since only the INFRA type IOMMU needs to modify register(s) in the
> pericfg iospace, it's safe to drop the pericfg_comp_str NULL check;
> also, directly assign the regmap handle to data->pericfg instead of
> to the infracfg variable to improve code readability.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>   drivers/iommu/mtk_iommu.c | 12 +++++-------
>   1 file changed, 5 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
> index 90685946fcbe..b2ae84046249 100644
> --- a/drivers/iommu/mtk_iommu.c
> +++ b/drivers/iommu/mtk_iommu.c
> @@ -1217,15 +1217,13 @@ static int mtk_iommu_probe(struct platform_device *pdev)
>   			dev_err(dev, "mm dts parse fail(%d).", ret);
>   			goto out_runtime_disable;
>   		}
> -	} else if (MTK_IOMMU_IS_TYPE(data->plat_data, MTK_IOMMU_TYPE_INFRA) &&
> -		   data->plat_data->pericfg_comp_str) {
> -		infracfg = syscon_regmap_lookup_by_compatible(data->plat_data->pericfg_comp_str);
> -		if (IS_ERR(infracfg)) {
> -			ret = PTR_ERR(infracfg);
> +	} else if (MTK_IOMMU_IS_TYPE(data->plat_data, MTK_IOMMU_TYPE_INFRA)) {
> +		p = data->plat_data->pericfg_comp_str;
> +		data->pericfg = syscon_regmap_lookup_by_compatible(p);
> +		if (IS_ERR(data->pericfg)) {
> +			ret = PTR_ERR(data->pericfg);
>   			goto out_runtime_disable;
>   		}
> -
> -		data->pericfg = infracfg;
>   	}
>   
>   	platform_set_drvdata(pdev, data);

