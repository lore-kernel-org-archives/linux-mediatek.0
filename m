Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECC64C4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Nov 2022 16:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ri7F1S4pLcMxIqjAu0KioPz4x8UzFumJZoJlr3Ul9aA=; b=d6tCwSPK2OpvLslinw+2j5kCj3
	5D/azLZK0DTaulqB03kkG2gas++bmMysV9+oIw3bNcsgP1Ez+jHJ+NRSoPfCVKweR/2QDyZXUTpxu
	GlJsfUo+KBcGydi+lKOiFNnA9H588kU17FICRsnOECdGrjOEdXvRGSCw+uWcuyAoG9NYTM560DIaD
	AJWc99RdOZ/jPRb/Wt9uaqA/rvRv09E/l+Ihp8Ngo1S+z3mh5Lf8t8RhSlYoaz5EsC6s70i26/H6+
	ft1wXXE4d9kmptFNsvTy9Vejv4ojNWDI70XYlFzjqO6l1jiSr+gpRT0pKmSO+7g7UZIBXBQ4jtI4e
	D6ijso7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxW8y-00AinP-3i; Tue, 22 Nov 2022 16:29:08 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxW8u-00Ailu-Q6; Tue, 22 Nov 2022 16:29:06 +0000
Received: by mail-wr1-x430.google.com with SMTP id bs21so25546923wrb.4;
        Tue, 22 Nov 2022 08:29:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ri7F1S4pLcMxIqjAu0KioPz4x8UzFumJZoJlr3Ul9aA=;
        b=iL/3dbSN6JIadgGbQyFSPNrufc3sS6tL14gE5qWA17O3qnMAnv6s9s58mHJW0vJhc1
         I9iB0a8c/s821dbPo47o00RNEptev9gj4jjk96mgDX8AHw+1Kz3hWwYVgWg+qVpf5BfJ
         z+W/L1i5dCz7tjzVG+vRZUJoPSubD36hiUdokWG/EfAH0JYjxiy6FWF5lvDzx8YOpJQ6
         q7XyEVcymhYVAsc/w48eeZz15SNtkPNG3oMcQxDYsaageSkF73V+V82e6W8+I3DsU6zt
         snqM0RIseGnmnJXCSMFJtjtSYxsMKBtKhtt2unbslggojpPBqIHSGExVkBb25JaqKpKY
         K4hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ri7F1S4pLcMxIqjAu0KioPz4x8UzFumJZoJlr3Ul9aA=;
        b=19go3U2fJIB5UvC4Zjwu6qyWr/dYDkYfdLRmhysF7pSGsxUf1qfPW4+lxqKVz3z9Gh
         tsLZFz3zU1K29Ojff9ULnu1AHYpP+bJt4wX4W83ERzwoj4VToIa3cuN23ukXg9I+G3zP
         GRGNera1+x7czfiVPxJRaVN/h/M3vxWiJ8kU/Es+WXTBYUES8fxfOP2icbY3GOhNak5M
         pKLg8Hhw8wFqbhBqJ3weotcM1vZFLk71MPRh2brVLooqPHJ1/zGAn+pC5YwcohkgKFwV
         +YwkiRkr0KUTxe10duU3HK5I2zFiBelV3zX8oS7fKhROU5cNczG74uyqfE277DKlP99D
         yxAQ==
X-Gm-Message-State: ANoB5pmwxH0dYXUKrsyOZ1H78gEDkBI/Pkgg8ahFV2KJ++5fm5bq5NDL
	y7Q38vjuihogDcAEDkQuWZQ=
X-Google-Smtp-Source: AA0mqf4+ga2CUanb3QmE8qQV12cTEWEsslAcVL4sAJOytJ1vcghhfvz3fGBaJJDGVjoIHbM2vU2/Dg==
X-Received: by 2002:a5d:4568:0:b0:241:e8b0:cdcc with SMTP id a8-20020a5d4568000000b00241e8b0cdccmr640819wrc.581.1669134542632;
        Tue, 22 Nov 2022 08:29:02 -0800 (PST)
Received: from [192.168.0.25] ([37.222.251.204])
        by smtp.gmail.com with ESMTPSA id p11-20020a05600c468b00b003c65c9a36dfsm19810612wmo.48.2022.11.22.08.29.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Nov 2022 08:29:01 -0800 (PST)
Message-ID: <451e69dc-ad89-9ffc-1e91-70796e908003@gmail.com>
Date: Tue, 22 Nov 2022 17:28:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v7 2/6] iommu/mediatek: Use component_match_add
Content-Language: en-US
To: Yong Wu <yong.wu@mediatek.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>
Cc: Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux.dev,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 mingyuan.ma@mediatek.com, yf.wang@mediatek.com, libo.kang@mediatek.com,
 chengci.xu@mediatek.com, youlin.pei@mediatek.com, anan.sun@mediatek.com,
 xueqi.zhang@mediatek.com, Guenter Roeck <groeck@chromium.org>,
 Dan Carpenter <dan.carpenter@oracle.com>
References: <20221018024258.19073-1-yong.wu@mediatek.com>
 <20221018024258.19073-3-yong.wu@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20221018024258.19073-3-yong.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221122_082904_927493_C6A06C59 
X-CRM114-Status: GOOD (  18.12  )
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



On 18/10/2022 04:42, Yong Wu wrote:
> In order to simplify the error patch(avoid call of_node_put), Use
> component_match_add instead component_match_add_release since we are only
> interested in the "device" here. Then we could always call of_node_put in
> normal path.
> 
> Strictly this is not a fixes patch, but it is a prepare for adding the
> error path, thus I add a Fixes tag too.
> 
> Fixes: d2e9a1102cfc ("iommu/mediatek: Contain MM IOMMU flow with the MM TYPE")
> Suggested-by: Robin Murphy <robin.murphy@arm.com>
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>   drivers/iommu/mtk_iommu.c | 10 ++++------
>   1 file changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
> index 3189b585725f..38112ad87d70 100644
> --- a/drivers/iommu/mtk_iommu.c
> +++ b/drivers/iommu/mtk_iommu.c
> @@ -1068,19 +1068,17 @@ static int mtk_iommu_mm_dts_parse(struct device *dev, struct component_match **m
>   			id = i;
>   
>   		plarbdev = of_find_device_by_node(larbnode);
> -		if (!plarbdev) {
> -			of_node_put(larbnode);
> +		of_node_put(larbnode);
> +		if (!plarbdev)
>   			return -ENODEV;
> -		}
> +
>   		if (!plarbdev->dev.driver) {
> -			of_node_put(larbnode);
>   			platform_device_put(plarbdev);
>   			return -EPROBE_DEFER;
>   		}
>   		data->larb_imu[id].dev = &plarbdev->dev;
>   
> -		component_match_add_release(dev, match, component_release_of,
> -					    component_compare_of, larbnode);
> +		component_match_add(dev, match, component_compare_dev, &plarbdev->dev);
>   		platform_device_put(plarbdev);
>   	}
>   

