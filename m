Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DF00C43334
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Jun 2022 13:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vMYX8vVEMVSTBnRO4T8a2iTEzySbI9JJmfib14Jv9h0=; b=Pl4KEGh7qwvTXAbeelvvxAUKN+
	dGSVAcWHajPrvrn1EJTCURfFH/F6dNpu7JuNmVFEe12WafmH58k0CrZ2DUsnZr+Ed3kTWzfE3iRrL
	Y0BMXSbbJbXSJfBzVS+qPdUNHQZuCRiybkB2zKU1UnObwe63haOye69xVm9gk3lNcjKeMIFxEp5wh
	Az3b5w+stxjyTh10SHE0vUzq0miUN7kYgDG83ZwMvV1sJeBp0/z6COnZ3n+GACeDvrDpM7jPiEF1b
	v3FOW41flb/mbK1mGOgO0fofNe/vE1UgxZFpAGGQVYNFEam/mdGiYkth4ctMHJzmP5GX/tTzma75E
	2fgxh8Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1pwO-002cIh-Pg; Thu, 16 Jun 2022 13:53:44 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1psb-002a3e-Bi; Thu, 16 Jun 2022 13:49:50 +0000
Received: by mail-wr1-x436.google.com with SMTP id a15so1982126wrh.2;
        Thu, 16 Jun 2022 06:49:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=vMYX8vVEMVSTBnRO4T8a2iTEzySbI9JJmfib14Jv9h0=;
        b=oHZ/WlVy8bLQzX5XPSluY6fi8t4wrJHCh2DNNHWAK5yiyH5xZ9COwCQrs9ZfP+6ptJ
         93ySFOJe9wfCGwWXgHnar7m/6aGDnD0S1O+HxPC6xSk+cexyKjWkbP7CtFeceQJSn23R
         v1G63z1Dcox5wBclBjv9DRSavVbCjhO7hmFUmwX86Rnry/7oE4lazYOsHA8QrlPHgztj
         uR4PVch1A9250cKszi6i7e8YGVJtaKtiXz8JGxthLI1rLdfhbPsSKvbHGV5eoaEnr6rT
         Du4Tomd7n70SIuNSI7H8BbB7wi5Tzqpa8naYoVpfCcP1QttROIseu+D9zm/KshxSL+jU
         h+NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=vMYX8vVEMVSTBnRO4T8a2iTEzySbI9JJmfib14Jv9h0=;
        b=CdWhIq1Th+itnrpMKmK7Wq+cXsvOOoaHZwyjMCVHQLuGTx2biqNAq3mT/ooGI3SaAI
         YP+BZtew36IyXfYy2Z1PJJhdUIOkHOorwWOoVjf1NCmZFVhsm3DmV1D6Yh0szoUjdKl9
         trWs8QaZtGduJ2JnDoSH/o8SMkXytIiW9TrKta5kCKhbw6sQanI+j8fAPB4G1AlOadXX
         WIN44kwm8YrY7thlPyLNbwSN3087aTadEkASYl6Y9znvX/LeivevEkO3ZY/pJadeNGjv
         S7Y5aUP9UbPPnUQFcXb6prV3LAv81f7TdpJKTaYRARfbJCd2yKFq5klSY2LyV+HE/QeA
         7OxQ==
X-Gm-Message-State: AJIora/J7VDl4GSkdqfikY5gy0Tp0PzReyzwW4qZOWQupnSKH6q4YNPT
	CA+mGKCg7I71dC6md0jc/nA=
X-Google-Smtp-Source: AGRyM1s9twy4XfOTRNf07Dn5/dC+PXKASOKIAn/okFRK8bJikDResr8hjVSbZIf2IlwH1J8fURxW2Q==
X-Received: by 2002:a05:6000:170e:b0:218:3fe0:7c72 with SMTP id n14-20020a056000170e00b002183fe07c72mr4971478wrc.572.1655387386601;
        Thu, 16 Jun 2022 06:49:46 -0700 (PDT)
Received: from [192.168.1.145] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id g16-20020a05600c4ed000b0039c5497deccsm13646132wmq.1.2022.06.16.06.49.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jun 2022 06:49:45 -0700 (PDT)
Message-ID: <22c40a7f-d759-5b4a-f554-cf679102d91f@gmail.com>
Date: Thu, 16 Jun 2022 15:49:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v2 2/5] iommu/mediatek: Add error path for loop of
 mm_dts_parse
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
 <20220616054203.11365-3-yong.wu@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220616054203.11365-3-yong.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220616_064949_453514_B127A37B 
X-CRM114-Status: GOOD (  21.20  )
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
> The mtk_iommu_mm_dts_parse will parse the smi larbs nodes. if the i+1
> larb is parsed fail(return -EINVAL), we should of_node_put for the 0..i
> larbs. In the fail path, one of_node_put matches with of_parse_phandle in
> it.
> 
> Fixes: d2e9a1102cfc ("iommu/mediatek: Contain MM IOMMU flow with the MM TYPE")
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> ---
>   drivers/iommu/mtk_iommu.c | 21 ++++++++++++++++-----
>   1 file changed, 16 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
> index 3b2489e8a6dd..ab24078938bf 100644
> --- a/drivers/iommu/mtk_iommu.c
> +++ b/drivers/iommu/mtk_iommu.c
> @@ -1071,12 +1071,12 @@ static int mtk_iommu_mm_dts_parse(struct device *dev, struct component_match **m
>   

Don't we need to call the goto also on error case of:

larbnode = of_parse_phandle(dev->of_node, "mediatek,larbs", i);


Regards,
Matthias


>   		plarbdev = of_find_device_by_node(larbnode);
>   		if (!plarbdev) {
> -			of_node_put(larbnode);
> -			return -ENODEV;
> +			ret = -ENODEV;
> +			goto err_larbnode_put;
>   		}
>   		if (!plarbdev->dev.driver) {
> -			of_node_put(larbnode);
> -			return -EPROBE_DEFER;
> +			ret = -EPROBE_DEFER;
> +			goto err_larbnode_put;
>   		}
>   		data->larb_imu[id].dev = &plarbdev->dev;
>   
> @@ -1107,9 +1107,20 @@ static int mtk_iommu_mm_dts_parse(struct device *dev, struct component_match **m
>   			       DL_FLAG_STATELESS | DL_FLAG_PM_RUNTIME);
>   	if (!link) {
>   		dev_err(dev, "Unable to link %s.\n", dev_name(data->smicomm_dev));
> -		return -EINVAL;
> +		ret = -EINVAL;
> +		goto err_larbnode_put;
>   	}
>   	return 0;
> +
> +err_larbnode_put:
> +	while (i--) {
> +		larbnode = of_parse_phandle(dev->of_node, "mediatek,larbs", i);
> +		if (larbnode && of_device_is_available(larbnode)) {
> +			of_node_put(larbnode);
> +			of_node_put(larbnode);
> +		}
> +	}
> +	return ret;
>   }
>   
>   static int mtk_iommu_probe(struct platform_device *pdev)

