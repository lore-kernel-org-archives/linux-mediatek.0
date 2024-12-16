Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DB4FE7717F
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Dec 2024 16:51:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AhE+DSypq3SjpYtMHh6sKFtWdmcn5TW3B/Ayo8044zE=; b=eA11VVYEQPGaUYJnQg65w0HkVQ
	qSvG6eUfRdnQvKhX3pnwvNj2mIBtitG0dr/jSLtdIhUn0u3A1oNv3SHGZiEpE1w3krRau5hwVX7/2
	tSONKVO7XgR1zzx0E7LLqpD1ilCp/e/uY1gi6V4Lvjp4VIfIv1YF1a8nQwYWau6sOjL8cZAa4M+MD
	tgdS1X4JqSb9nH3+X74TzcceDO3f475KKEpEk3HIjTgENfmN1LH7YqZDIO9/G222uXnkaePdUlaIB
	Ei3Y9sF1nRd9iyjywPUB3HCVS5+ZEGG3r0ACAtc4NIdSSpJoOVUwZ61Gi/JWzlK/w3f0nqecGHXaK
	WFzCb70A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNEJV-0000000AfYu-1nvF;
	Mon, 16 Dec 2024 16:51:21 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNEJS-0000000AfWf-1Wtb
	for linux-mediatek@lists.infradead.org;
	Mon, 16 Dec 2024 16:51:20 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-7fcfb7db9bfso2985252a12.1
        for <linux-mediatek@lists.infradead.org>; Mon, 16 Dec 2024 08:51:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734367877; x=1734972677; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AhE+DSypq3SjpYtMHh6sKFtWdmcn5TW3B/Ayo8044zE=;
        b=NDM0wE4KCaLZRgMULFdpXelEX/mJKYfXfU/gEPzFMd/XYKRKkNSb+jeXriN5Zog9gk
         hH1nPxWm5aGs3daGg18GGtKmW0DkDvMYgGjxRxktJFUFqf2AH41PW631G4EW9EkJLe6a
         3rbD5TJ7K/Kcn5n3aecN2PVh9gER/cf8xFE6cvSPU1A+vwMRHSczw9LGqjLHZJAU2/5u
         wKYjeQqJmELibxId6AwW6kfusiXo7aql+kSeZtLfH4RwCR7PU4q8KEhke2JSicfPVm8u
         xdpgJhy+GN0T8hkwB2GAXN8HLMBszl00YvP1bwbWqBTHebbqBhI0Q9odo9Ru1NM2mjtq
         RDuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734367877; x=1734972677;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AhE+DSypq3SjpYtMHh6sKFtWdmcn5TW3B/Ayo8044zE=;
        b=gRZk6tHOmuaLqmjI7XRe9eBb+79Wr0UXnBNIxgix6MutswWboxirdlNbbHtOySrjXk
         KgB10R9XGyeX6pfdZ4Kq/J48/zPRWNf6/AsJoO2WSnh0ZnJ93GUC3+7xmZMcgqU0+oO4
         eLMQOTSDYDQoIgDP08pgjH6EI4Px+5FHMcVWRIOYfdCqFJoZU1oyX2w8Vj/0tEM50yq9
         0/e1etWcp48B6nU6qLvZhTydq351VQ2wHbRhhgyXlkdzgDDkFi6gJTBRaon9tLjS4fPQ
         Ytl+CGEy3DSzH4T3+a2INVqWOjUrVVJKFCdvITD+ayISB99x79/pma8tZtNlWwxYM1J6
         0LXg==
X-Forwarded-Encrypted: i=1; AJvYcCVEW5DhlKtjoofemGCEMO/4OBMRYhgN6wCDU/Z+zRrY9vmHFj0UF/2vMSYUJobOcUE35W4JUc+souvrIJBwAA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxnc0krzEmSx6IR8/XZ7n66VLs1ZRjj1tZRKBjlMNi1WKWlAFZV
	8zlTW0kwBLhpr1J8ScA63PfnSzyLb8sQSjBGuuHAmf8GIjBpNkpeFa/FWbsTcd0=
X-Gm-Gg: ASbGncv6fKChUdsA0GGEefGE1AR8BbKYhhQldaVRJBoRq8wQu+0hvotBkex5mu9bnnh
	StIFl7lfibs2wLsa8pEfPsC+UZot0zYuvKEETMIVZA0/X8C8Ln9t67YdcqWss/+wdKL3v9QThI9
	kbUy8Jb9dWNLGarEW+LF59jOE1RvWoXtYI9jrLptTm9a8of6gDDVgydt88B0Luov3laLbMiloCd
	oMk5cofiwCLoZCzGsKewtx4rty8PcZKf4hElYuNBzMaFCjouEHty7dQuumL
X-Google-Smtp-Source: AGHT+IFdkBr1xidp7KbBA40XTCMNem9kWeuB09hpRbnYxb2m5xLWJETb06A1ncuzZHM9HfB1Sr5h4g==
X-Received: by 2002:a17:90b:2e41:b0:2ee:b6c5:1def with SMTP id 98e67ed59e1d1-2f28fa54f64mr20741065a91.8.1734367876736;
        Mon, 16 Dec 2024 08:51:16 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:13e6:498b:6054:9f90])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-218a1e500b8sm43931565ad.123.2024.12.16.08.51.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 08:51:16 -0800 (PST)
Date: Mon, 16 Dec 2024 09:51:13 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Tinghan Shen <tinghan.shen@mediatek.com>
Subject: Re: [PATCH v2] remoteproc: mtk_scp: Only populate devices for SCP
 cores
Message-ID: <Z2Baga9gSFLlmXll@p14s>
References: <20241211072009.120511-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241211072009.120511-1-wenst@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_085118_437176_39116F75 
X-CRM114-Status: GOOD (  21.03  )
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

On Wed, Dec 11, 2024 at 03:20:07PM +0800, Chen-Yu Tsai wrote:
> When multi-core SCP support was added, the driver was made to populate
> platform devices for all the sub-nodes. This ended up adding platform
> devices for the rpmsg sub-nodes as well, which never actually get used,
> since rpmsg devices are registered through the rpmsg interface.
> 
> Limit of_platform_populate() to just populating the SCP cores with a
> compatible string match list.
> 
> Fixes: 1fdbf0cdde98 ("remoteproc: mediatek: Probe SCP cluster on multi-core SCP")
> Cc: Tinghan Shen <tinghan.shen@mediatek.com>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
> Changes since v1:
> - Fix commit subject: populate devices *for* SCP cores
> ---
>  drivers/remoteproc/mtk_scp.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
>

I have applied this patch.

Thanks,
Mathieu

> diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
> index 0f4a7065d0bd..8206a1766481 100644
> --- a/drivers/remoteproc/mtk_scp.c
> +++ b/drivers/remoteproc/mtk_scp.c
> @@ -1326,6 +1326,11 @@ static int scp_cluster_init(struct platform_device *pdev, struct mtk_scp_of_clus
>  	return ret;
>  }
>  
> +static const struct of_device_id scp_core_match[] = {
> +	{ .compatible = "mediatek,scp-core" },
> +	{}
> +};
> +
>  static int scp_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> @@ -1357,13 +1362,15 @@ static int scp_probe(struct platform_device *pdev)
>  	INIT_LIST_HEAD(&scp_cluster->mtk_scp_list);
>  	mutex_init(&scp_cluster->cluster_lock);
>  
> -	ret = devm_of_platform_populate(dev);
> +	ret = of_platform_populate(dev_of_node(dev), scp_core_match, NULL, dev);
>  	if (ret)
>  		return dev_err_probe(dev, ret, "Failed to populate platform devices\n");
>  
>  	ret = scp_cluster_init(pdev, scp_cluster);
> -	if (ret)
> +	if (ret) {
> +		of_platform_depopulate(dev);
>  		return ret;
> +	}
>  
>  	return 0;
>  }
> @@ -1379,6 +1386,7 @@ static void scp_remove(struct platform_device *pdev)
>  		rproc_del(scp->rproc);
>  		scp_free(scp);
>  	}
> +	of_platform_depopulate(&pdev->dev);
>  	mutex_destroy(&scp_cluster->cluster_lock);
>  }
>  
> -- 
> 2.47.0.338.g60cca15819-goog
> 

