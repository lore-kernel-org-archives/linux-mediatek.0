Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFE1CC433FE
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Nov 2022 16:33:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tP8o2qeHXoHC6ulVNsIBHcsYBkHGaXQH2ePC4lnEEXg=; b=s1NSLYlqxvj97Mps8/il6gAmnz
	z8I67XCBBgCWReyLvQ5SRlcilvo9c1jXpuzA7NjcRQsW9HgTcePta1Md+bseb9COqIt6Jnkkv9qqp
	pRJKfhsDEmxBJoxE6zNdx25r03xlomzG0CCHMOdwZN+R6+BdV9Utbtcl/vs4n7OMCkQYz9PxFZW9c
	LXHfy6gEiQPc8eOeuKQnPO9waTN+8t/GTPX5NToZqEpN6kxGZ2M3Pl8LyU7UZ6QjpXT0zHfe5IiRR
	J30nirP6uNLNG4H8gxPJlUO+yuWZWY9RfCoAtTfRlKclXHfokyeGdlxSRekPweYf7lzllIfxYqAtq
	SPhApeGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxWD3-00AkLH-ND; Tue, 22 Nov 2022 16:33:21 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxWCf-00AkCO-0t; Tue, 22 Nov 2022 16:32:58 +0000
Received: by mail-wm1-x332.google.com with SMTP id h187-20020a1c21c4000000b003d03017c6efso93862wmh.4;
        Tue, 22 Nov 2022 08:32:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tP8o2qeHXoHC6ulVNsIBHcsYBkHGaXQH2ePC4lnEEXg=;
        b=PYjoG1xoo59ZH+t/QsWjfv2FKr9FaZRvnkvbrQGj0ALZy6VUc62MnwiJqjedlETq6Y
         oNxAFPDWaSKT03DWcBCAKD+eMpVQEOgrMrNnuCrDUPLdQ0FHxMrSCaMMQpuEIalRLN0D
         u7zRUrGe6QULUakhwdeB3tnWXG6Vrw1QDVOLG8RDEjAd4i1xc3sIuMLu44uvK0gwIdYP
         SYJe+l2UZPYKlfbtoTcJQjHzh+BQe3DFJRHmRth8lppKU+4fYWyK30q3Hs+O3H9QhMQv
         V0OQaoTcaOSIDTsuUGp+/3xTRmGt0MVq3Iz3hisiK5QlZYSkH3yl2ehVQ0jw9NdGSbcs
         bYXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tP8o2qeHXoHC6ulVNsIBHcsYBkHGaXQH2ePC4lnEEXg=;
        b=enk6EWIWcSpJrBXU5jMy4L/6Ba/Qn7N6lOYKjY9iRw5NJlHMRkhFz5Nm1D5oJ/X3m9
         mlUiWcz4OVE/lJYNARyg9K12Wa87n27dSFZOn5egxwsty4hlXsJuIL4cCuGn6y8lsA1d
         bg3B5C1U9Qc521mp7FyouNpHX5qxyJ4UVE12VOT9DK7/TeH/hCBfviUs52Zr+zdL/Tol
         lPkqrFwgxvQYaKB9uw5bhvWjXADiTYaL7jK5iHNfBZO3h84CQOPlBXwW7uCtBvkUmWKe
         Vbx03/8mOkOdqQFunnksV75QdI1A0beWjDHQEK9cuFVtNmI84yCC5FSM3Ynjr2d11ZU6
         LjbA==
X-Gm-Message-State: ANoB5pk6QqM2g0QWBJMXBS833LbN0J40g7c1ZPUW3uzSrzcAqnl/vwLF
	wU/oiEHHfOQmy0cJKjh5byA=
X-Google-Smtp-Source: AA0mqf6SfVYhWPWFSmXZgMUDEYgeh//Ch89S4WClJdJLReB0bGvjBL3aIzmPYRi0FFtshEhJAG4pCA==
X-Received: by 2002:a1c:4b0f:0:b0:3cf:735c:9d5a with SMTP id y15-20020a1c4b0f000000b003cf735c9d5amr10377045wma.113.1669134774264;
        Tue, 22 Nov 2022 08:32:54 -0800 (PST)
Received: from [192.168.0.25] ([37.222.251.204])
        by smtp.gmail.com with ESMTPSA id b8-20020adff908000000b0022ca921dc67sm14162699wrr.88.2022.11.22.08.32.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Nov 2022 08:32:53 -0800 (PST)
Message-ID: <de8a7833-6983-1d40-55b6-f985473d8201@gmail.com>
Date: Tue, 22 Nov 2022 17:32:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v7 3/6] iommu/mediatek: Add error path for loop of
 mm_dts_parse
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
 <20221018024258.19073-4-yong.wu@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20221018024258.19073-4-yong.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221122_083257_117253_7C18019F 
X-CRM114-Status: GOOD (  23.54  )
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
> The mtk_iommu_mm_dts_parse will parse the smi larbs nodes. if the i+1
> larb is parsed fail, we should put_device for the i..0 larbs.
> 
> There are two places need to comment:
> 1) The larbid may be not linear mapping, we should loop whole
>     the array in the error path.
> 2) I move this line position: "data->larb_imu[id].dev = &plarbdev->dev;"
>     before "if (!plarbdev->dev.driver)", That means set
>     data->larb_imu[id].dev before the error path. then we don't need
>     "platform_device_put(plarbdev)" again in probe_defer case. All depend
>     on "put_device" of the error path in error cases.
> 
> Fixes: d2e9a1102cfc ("iommu/mediatek: Contain MM IOMMU flow with the MM TYPE")
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>


> ---
>   drivers/iommu/mtk_iommu.c | 27 ++++++++++++++++++++-------
>   1 file changed, 20 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
> index 38112ad87d70..912322494bc0 100644
> --- a/drivers/iommu/mtk_iommu.c
> +++ b/drivers/iommu/mtk_iommu.c
> @@ -1055,8 +1055,10 @@ static int mtk_iommu_mm_dts_parse(struct device *dev, struct component_match **m
>   		u32 id;
>   
>   		larbnode = of_parse_phandle(dev->of_node, "mediatek,larbs", i);
> -		if (!larbnode)
> -			return -EINVAL;
> +		if (!larbnode) {
> +			ret = -EINVAL;
> +			goto err_larbdev_put;
> +		}
>   
>   		if (!of_device_is_available(larbnode)) {
>   			of_node_put(larbnode);
> @@ -1069,14 +1071,16 @@ static int mtk_iommu_mm_dts_parse(struct device *dev, struct component_match **m
>   
>   		plarbdev = of_find_device_by_node(larbnode);
>   		of_node_put(larbnode);
> -		if (!plarbdev)
> -			return -ENODEV;
> +		if (!plarbdev) {
> +			ret = -ENODEV;
> +			goto err_larbdev_put;
> +		}
> +		data->larb_imu[id].dev = &plarbdev->dev;
>   
>   		if (!plarbdev->dev.driver) {
> -			platform_device_put(plarbdev);
> -			return -EPROBE_DEFER;
> +			ret = -EPROBE_DEFER;
> +			goto err_larbdev_put;
>   		}
> -		data->larb_imu[id].dev = &plarbdev->dev;
>   
>   		component_match_add(dev, match, component_compare_dev, &plarbdev->dev);
>   		platform_device_put(plarbdev);
> @@ -1111,6 +1115,15 @@ static int mtk_iommu_mm_dts_parse(struct device *dev, struct component_match **m
>   		return -EINVAL;
>   	}
>   	return 0;
> +
> +err_larbdev_put:
> +	/* id may be not linear mapping, loop whole the array */
> +	for (i = MTK_LARB_NR_MAX - 1; i >= 0; i++) {
> +		if (!data->larb_imu[i].dev)
> +			continue;
> +		put_device(data->larb_imu[i].dev);
> +	}
> +	return ret;
>   }
>   
>   static int mtk_iommu_probe(struct platform_device *pdev)

