Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24CA5C3DA42
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Jul 2024 15:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uBj2YmtSTrFPZPUbLzrldXTaT0nXgCHgIoklfp+Mzk8=; b=sNmQe4LTDM1hA8BzCTmwgEEyMY
	tsHAYUff4z3BBWmvIYsznSmM3U7IZocB5vXoGf+c6fvvv2kFl/DPbY06+WKMWPI60qfmf+F0wptEZ
	+srg+V5tNiCPFRW2sniCeCdFddNuxhcgkBQMDXLsMGi6+Vj7bbQHJ6gc03dNbuEd7wPlB43R+l9wh
	UaghPNiwLs3c1CF7hugOVti82CLT1OTwcbEJKY8BCjmlVY9gqmS9OK9EGYELan7jZGltoYngX2BSF
	G7E38FGlQNDUz4f/TmAQ+OIbgeDCCh+L1ZoG6IHoLAKe4dWuMytmfGFTk23H3PLauapiiAEMzBPzF
	R9YIaobg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRZgN-0000000B2FY-259Q;
	Wed, 10 Jul 2024 15:56:39 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRZgK-0000000B2EW-1MkD
	for linux-mediatek@lists.infradead.org;
	Wed, 10 Jul 2024 15:56:37 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-2c983d8bdc7so4822344a91.0
        for <linux-mediatek@lists.infradead.org>; Wed, 10 Jul 2024 08:56:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720626995; x=1721231795; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uBj2YmtSTrFPZPUbLzrldXTaT0nXgCHgIoklfp+Mzk8=;
        b=IwikkgiejhZ73pXiE6cTdNW78FrAD0vjGAI6YdMOgTClIBhiVtS4GUradgw1s0T2Sb
         DM14rqYuhm5CYeFN6zQDsw6v8eUpzhk+3+rT45QSFbuxcQvz+nybgoZowvVSbatLgxT4
         yJreVkJ8L1RWbBrbbhjmPDApUCaiYFGcbK8lSNgxJ6OWoSkaaCBT8DbI0xZRpTwWcM5l
         TNFQLw8UxWNFS7UOzRQ8X9C2VuMHCeo7TGMMMs13A/ltXkJk4kDGuLbmuxiTktDxpfRf
         X0Wq3asEf3tkdm2p1qoMNul2Kfk5a9BDyyC00APItw51GNBvQoTCV36ryZTLqvsntTB2
         EXUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720626995; x=1721231795;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uBj2YmtSTrFPZPUbLzrldXTaT0nXgCHgIoklfp+Mzk8=;
        b=PctaL/NgDgERMOb2QFXUmw0wZllnq2HoCoV7ELsms6KdZdZD5MKBBQaU6dqPiZBxdM
         gVInTlvjEqqvxf0Rp0Uz6V1Ov2ViMyRwX+uvgeMcJH34rppm0/RuuccN+1JwiJ3u5p3P
         abx2mdzyXx5VYCfRO+7QWJC8tOJrjbQildExoAeBD31u6HJC7iiBef0nrfu/Jzt+3ZT1
         UUa6tsa2o2QR3WbzvYWhddxlA+Ir7yl3eH8l1NUG9vuA94HCLzEAbobsDjGqb7Y5JG/G
         NiQ0JT1iOCv6uoyx5zcL3woaZ8Fo1VtErBAGQG3V0Ox78R+6uSDmFHtqhsxbv3jJqUT0
         Q41g==
X-Forwarded-Encrypted: i=1; AJvYcCUT99/yZ2wW1VGjfytYvaEk5m7EJfiUkcLMPxWnfdPS4K5idbwOEu4YyCZXokZNYOSi+DAOB7nWC5K3IktiNgDu23R0ux+yAe7wN0vrd5Vw4d5V
X-Gm-Message-State: AOJu0YxvKmr6q8I/sSBy893clB02wmKkmn0FjYOmY9ETm4laZp04gjXg
	j2TzmewU1FyElHvymARD54Y9qaGJiSPqgyABiZLsYQTnEsZGIMtkfKv82IPcr9k=
X-Google-Smtp-Source: AGHT+IER42wfBDvYrn5WVV2tIZB6J3uCihrTxDQpbbWz7C02veVVpbReOeakDmwhl/pQRtvuZYvxfA==
X-Received: by 2002:a17:90a:c385:b0:2c9:66d3:4663 with SMTP id 98e67ed59e1d1-2ca35d58971mr4748875a91.43.1720626994926;
        Wed, 10 Jul 2024 08:56:34 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:8408:4ecd:288d:848b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ca34e6fc0csm3985584a91.21.2024.07.10.08.56.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jul 2024 08:56:34 -0700 (PDT)
Date: Wed, 10 Jul 2024 09:56:32 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Shun-yi Wang <shun-yi.wang@mediatek.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com,
	jason-ch.chen@mediatek.com, yaya.chang@mediatek.com,
	teddy.chen@mediatek.com, olivia.wen@mediatek.com
Subject: Re: [PATCH 1/1] remoteproc: mediatek: Support multiple reserved
 memory regions
Message-ID: <Zo6vMPaefxCaDe7D@p14s>
References: <20240703115308.17436-1-shun-yi.wang@mediatek.com>
 <20240703115308.17436-2-shun-yi.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240703115308.17436-2-shun-yi.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240710_085636_402364_180DD1C7 
X-CRM114-Status: GOOD (  20.64  )
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

On Wed, Jul 03, 2024 at 07:53:08PM +0800, Shun-yi Wang wrote:
> From: "shun-yi.wang" <shun-yi.wang@mediatek.com>
> 
> SCP supports multiple reserved memory regions, intended for
> specific hardwards.
>
> Signed-off-by: shun-yi.wang <shun-yi.wang@mediatek.com>
> ---
>  drivers/remoteproc/mtk_scp.c | 25 +++++++++++++++++--------
>  1 file changed, 17 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
> index 9ecd5ea04b5f3..1902826cea0af 100644
> --- a/drivers/remoteproc/mtk_scp.c
> +++ b/drivers/remoteproc/mtk_scp.c
> @@ -1006,22 +1006,31 @@ EXPORT_SYMBOL_GPL(scp_mapping_dm_addr);
>  
>  static int scp_map_memory_region(struct mtk_scp *scp)
>  {
> -	int ret;
> +	int ret, i, err;
>  	const struct mtk_scp_sizes_data *scp_sizes;
> +	struct device_node *node = scp->dev->of_node;
> +	struct of_phandle_iterator it;
> +
> +	i = 0;
> +	of_for_each_phandle(&it, err, node, "memory-region", NULL, 0) {
> +		ret = of_reserved_mem_device_init_by_idx(scp->dev, node, i);
> +
> +		if (ret) {
> +			dev_err(scp->dev, "failed to assign memory-region: %s\n",
> +				it.node->name);
> +			of_node_put(it.node);
> +			return -ENOMEM;
> +		}

With this patch the code is out of sync with the bindings which are still
specifying a maxItems of 1 - please address.

Thanks,
Mathieu

>  
> -	ret = of_reserved_mem_device_init(scp->dev);
> +		i++;
> +	}
>  
>  	/* reserved memory is optional. */
> -	if (ret == -ENODEV) {
> +	if (!i) {
>  		dev_info(scp->dev, "skipping reserved memory initialization.");
>  		return 0;
>  	}
>  
> -	if (ret) {
> -		dev_err(scp->dev, "failed to assign memory-region: %d\n", ret);
> -		return -ENOMEM;
> -	}
> -
>  	/* Reserved SCP code size */
>  	scp_sizes = scp->data->scp_sizes;
>  	scp->cpu_addr = dma_alloc_coherent(scp->dev, scp_sizes->max_dram_size,
> -- 
> 2.18.0
> 

