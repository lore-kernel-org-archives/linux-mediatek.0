Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B98CDC433FE
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Nov 2022 16:49:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z3fcqOHVduVIIg4z4ijk3ykjn2RM3trgK5/ehZ3bY1M=; b=IyJoRhxC57i8Z8Nf+dtLXstHL8
	DTjMOYjYeOGCq/XkTJdu82Pskemxuzup459DEq2kD4GobUDWd4THc5ZIESbIIYwIX00xJX7Pq8VMI
	tm9B327+8dWjEcCZEs0ckf/O42yrrR5Emz5pbnRFQgWFwSVKIf4RwahGzSbIIfmjkpCeBc+QOxV/t
	axUy0coKn9QoNO6R7F1AhiCpqdBytV64bjZ+lwfPHY/JwSGz/Z4Yv+rQJih821JykXO+Tq6rR2ciZ
	0pGqgmWhLAv+5t3+Ce72fBwwwSPvwz6AF3kZOE1cxqd26IBeO0QEoQJy6mT/dShOoTlJBeaECzxs3
	hWL/SDow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxWSO-00AqVy-2k; Tue, 22 Nov 2022 16:49:12 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxWSL-00AqU0-30; Tue, 22 Nov 2022 16:49:10 +0000
Received: by mail-wm1-x336.google.com with SMTP id p13-20020a05600c468d00b003cf8859ed1bso11751833wmo.1;
        Tue, 22 Nov 2022 08:49:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=z3fcqOHVduVIIg4z4ijk3ykjn2RM3trgK5/ehZ3bY1M=;
        b=GdK7IiaGPYoYt2Cullz/bFXz5P3zaEbhbB2t0ZpbwFzBQeOMMKazdbcRBwospX37Ui
         pqMiIGLcaq9zFfPEICfldvKXfL31lnz0AaqH4lHRW1xbnHaDy/Lg4rdvd7XQjNxtq+ay
         1iqBc+fexaXnaY8vB2aO3JXyzKh/ipGhRImpUWnP3k8BcfmZebvEe4wqfSsUE5LZmN+8
         LmM6RhNUPnWyN7PHzsyFSneAEOivB3ucTrbdj4p7TsX7scxtByO6GWlpXTANw65+rSSo
         fJQ6zBeq9qJWeAL4dyugp+BKONx4Qikr+2fGiGvQOWJomWt9c7/sR/U9dBCEYOn2FDML
         9FtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z3fcqOHVduVIIg4z4ijk3ykjn2RM3trgK5/ehZ3bY1M=;
        b=oerHMzGbCYJQOnaSz/qtFHepwIPbBjt+pbcOlsHc/hDPelrnwF9j5VspfQySbepR0n
         ErP1xXQQYLOgvjq+U41o4Q0VCrAw/dF9sPgnhvUXdPf5jvIQGGuNSSB70EiB/mQ0baTd
         X1JXiXktPNBcUz8uY+N0xQXeZ5fKRt4kYiVQvtf90I3dFP2Co5FdquCv21jsO9qi7TF6
         JRXAWNv083zsJ1S862d5cfB/svx3nVBx58y9pLcQ4fnipKd5pX6vDz7a9EZDr4TApnDY
         xv0fyprpW+znAD942IO6nmm7A+sEsUg7+IPs2x4wUbs6SwA+nD8dXarLwog/ud2QAP2i
         lnMA==
X-Gm-Message-State: ANoB5pm5tvkO+IXsougp7MSd4t/hXfiso8Li0FrUMHJl+6LEiieTqYZK
	nqucb2oFQzQApS9gTiBGqoQ=
X-Google-Smtp-Source: AA0mqf5ZtsT30GoUH/4TBViJcG2p2xVpb/2WXR2KXr7wvrCOOAoP5enGR17CBNRPJryrNLruXod8Yg==
X-Received: by 2002:a05:600c:3590:b0:3d0:1489:78c4 with SMTP id p16-20020a05600c359000b003d0148978c4mr5836156wmq.167.1669135744520;
        Tue, 22 Nov 2022 08:49:04 -0800 (PST)
Received: from [192.168.0.25] ([37.222.251.204])
        by smtp.gmail.com with ESMTPSA id x9-20020a5d6509000000b0023c8026841csm14497653wru.23.2022.11.22.08.49.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Nov 2022 08:49:03 -0800 (PST)
Message-ID: <f51c7f56-4c62-0351-3b01-ae2f6432fb05@gmail.com>
Date: Tue, 22 Nov 2022 17:49:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v7 5/6] iommu/mediatek: Improve safety for mediatek,smi
 property in larb nodes
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
 <20221018024258.19073-6-yong.wu@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20221018024258.19073-6-yong.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221122_084909_207321_094DFB2E 
X-CRM114-Status: GOOD (  25.86  )
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
> No functional change. Just improve safety from dts.
> 
> All the larbs that connect to one IOMMU must connect with the same
> smi-common. This patch checks all the mediatek,smi property for each
> larb, If their mediatek,smi are different, it will return fails.
> Also avoid there is no available smi-larb nodes.
> 
> Suggested-by: Guenter Roeck <groeck@chromium.org>
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>   drivers/iommu/mtk_iommu.c | 53 +++++++++++++++++++++++++++------------
>   1 file changed, 37 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
> index 9cbff48f03c0..f7ac102e343f 100644
> --- a/drivers/iommu/mtk_iommu.c
> +++ b/drivers/iommu/mtk_iommu.c
> @@ -1042,7 +1042,7 @@ static const struct component_master_ops mtk_iommu_com_ops = {
>   static int mtk_iommu_mm_dts_parse(struct device *dev, struct component_match **match,
>   				  struct mtk_iommu_data *data)
>   {
> -	struct device_node *larbnode, *smicomm_node, *smi_subcomm_node;
> +	struct device_node *larbnode, *frst_avail_smicomm_node = NULL;
>   	struct platform_device *plarbdev, *pcommdev;
>   	struct device_link *link;
>   	int i, larb_nr, ret;
> @@ -1054,6 +1054,7 @@ static int mtk_iommu_mm_dts_parse(struct device *dev, struct component_match **m
>   		return -EINVAL;
>   
>   	for (i = 0; i < larb_nr; i++) {
> +		struct device_node *smicomm_node, *smi_subcomm_node;
>   		u32 id;
>   
>   		larbnode = of_parse_phandle(dev->of_node, "mediatek,larbs", i);
> @@ -1094,27 +1095,47 @@ static int mtk_iommu_mm_dts_parse(struct device *dev, struct component_match **m
>   			goto err_larbdev_put;
>   		}
>   
> +		/* Get smi-(sub)-common dev from the last larb. */
> +		smi_subcomm_node = of_parse_phandle(larbnode, "mediatek,smi", 0);
> +		if (!smi_subcomm_node) {
> +			ret = -EINVAL;
> +			goto err_larbdev_put;
> +		}
> +
> +		/*
> +		 * It may have two level smi-common. the node is smi-sub-common if it
> +		 * has a new mediatek,smi property. otherwise it is smi-commmon.
> +		 */
> +		smicomm_node = of_parse_phandle(smi_subcomm_node, "mediatek,smi", 0);
> +		if (smicomm_node)
> +			of_node_put(smi_subcomm_node);
> +		else
> +			smicomm_node = smi_subcomm_node;
> +
> +		/*
> +		 * All the larbs that connect to one IOMMU must connect with the same
> +		 * smi-common.
> +		 */
> +		if (!frst_avail_smicomm_node) {
> +			frst_avail_smicomm_node = smicomm_node;
> +		} else if (frst_avail_smicomm_node != smicomm_node) {
> +			dev_err(dev, "mediatek,smi property is not right @larb%d.", id);
> +			of_node_put(smicomm_node);
> +			ret = -EINVAL;
> +			goto err_larbdev_put;
> +		} else {
> +			of_node_put(smicomm_node);
> +		}
> +
>   		component_match_add(dev, match, component_compare_dev, &plarbdev->dev);
>   		platform_device_put(plarbdev);
>   	}
>   
> -	/* Get smi-(sub)-common dev from the last larb. */
> -	smi_subcomm_node = of_parse_phandle(larbnode, "mediatek,smi", 0);
> -	if (!smi_subcomm_node)
> +	if (!frst_avail_smicomm_node)
>   		return -EINVAL;
>   
> -	/*
> -	 * It may have two level smi-common. the node is smi-sub-common if it
> -	 * has a new mediatek,smi property. otherwise it is smi-commmon.
> -	 */
> -	smicomm_node = of_parse_phandle(smi_subcomm_node, "mediatek,smi", 0);
> -	if (smicomm_node)
> -		of_node_put(smi_subcomm_node);
> -	else
> -		smicomm_node = smi_subcomm_node;
> -
> -	pcommdev = of_find_device_by_node(smicomm_node);
> -	of_node_put(smicomm_node);
> +	pcommdev = of_find_device_by_node(frst_avail_smicomm_node);
> +	of_node_put(frst_avail_smicomm_node);
>   	if (!pcommdev)
>   		return -ENODEV;
>   	data->smicomm_dev = &pcommdev->dev;

