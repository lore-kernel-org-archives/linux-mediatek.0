Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E662E77178
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Dec 2024 17:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GGowWo0E2U0Rf9eK43iU5kiPqwDu4Y2pVeYyplVhdDQ=; b=xxEEhdm/b7TixfryGVcMpNcYAi
	W3OpgPh2/Acp6RrCrJMBNaDr9Q9IGZMc1LK2ePcUoqRwI8+obb2u8CO2aDUqbeB1Uwx+e49FG5svS
	oAfD6CUprug+sHani8OSKF/mYfvksDSSBCL+Q69VGHT4txtVQlBhxitFK8CjGprM7JfTIsn/saPu9
	8FgESjQsWpoer9C8j52TbuXxl5QMBHsSxajHFBYA+RufjOUrH63V+rtKIXcbjL0HPJbFHi5OscrN0
	sda+lICR1UphJglVMWie4W9L4ndJL1FZUUiiNmF0LHvY1hCqPtFVyE9hvgRBlm08HKuSyjec3r7m6
	H+hKdkwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJFEq-0000000GrYH-1PDX;
	Thu, 05 Dec 2024 17:02:04 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJF11-0000000GoQ7-0Z5m
	for linux-mediatek@lists.infradead.org;
	Thu, 05 Dec 2024 16:47:48 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-7f46d5d1ad5so1002952a12.3
        for <linux-mediatek@lists.infradead.org>; Thu, 05 Dec 2024 08:47:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733417266; x=1734022066; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GGowWo0E2U0Rf9eK43iU5kiPqwDu4Y2pVeYyplVhdDQ=;
        b=kDqgJ9AZMSeyhSM6jhfFLOsFqa4uREOuB0xDa5S28dKWHsA7b14p+99ejUjHQpSWMH
         8s9EIYuFLSCi/l316BNMKBRDg6RQYFvxVXuD/Z7Uj/vq/sbZr1QtOlo66C2QJ2BaI5KG
         bpgpE2WJTZDBO0WWqqXqN5RsoaLwhDTz2F44uGfwBWBFgw2mniLJR3tS3YHRGYCpe4kh
         RTzXlJinTbopKEJBNKlNB0dbisna1C2pRnpudPdtB9PpXo2mVpWtYwmZulrnc2ZmVwq1
         IKIMyjZL4JN1QkUZcB3neR7f89jYWi5qlPEZBnM/qRJJy5VQtpkuJKIB0qhiZIgKn3Ml
         p7nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733417266; x=1734022066;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GGowWo0E2U0Rf9eK43iU5kiPqwDu4Y2pVeYyplVhdDQ=;
        b=njemmnDMwqEvE+NeZZgecpjFAkx26gnkVpvqir7wW9+Gw9WwW2Sin6wbwzcz166pzq
         ZFeOT0p55onaWijN8p28o9gyKd4uGbdAAW0LLiGYR6+iEVsb9J2M9lGGUHAu1gPIFofg
         PJ2xxVZnle2SaEq977kMc82g/Ms/yixPcOZn+fHOZiMmibM3njV1UpHIcH2NVSxeidBI
         5V77lrP5cfaSjSaL438QEQE8Cwoes4RpmyuHlPjtRvogTXOebx5R0jBmeHcCRJZa4Z7C
         o4EieT+mP8HrEKFY16HDrTkH26F0Smdjy3iEZy90ayfEo92Hb11xcEa2hS54p8nC+PyG
         B/RA==
X-Forwarded-Encrypted: i=1; AJvYcCUWTsuqzLDwXDLmYgU01iedDy2h5UHPe88pyWVuXl0bBusAuZKdMhsHtaFW4CcR7EDhq2yc1qlDMjqu2VRXxg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyXe9NavNerYUgpkGi/k9xf77pBZPJzt2SQNWpn580/gYtUdP26
	/QB91NIy6BsgERR02ixtydcUKVZIXqofysNFA1l8tpxPVhq/Ktal063Sc0DFWYY=
X-Gm-Gg: ASbGncuoFkNECLMknodzKzr+vppvMLjtCT5agUz51lXcj48+aHYcc5pf1P4+jSQV5Xe
	hKqQ6CQjK7r1miPrah6mZ4CPnFZEHYyWOLyWMzI4g2eMecxbTVN8QxhK5ZvWJXSbkJbB44IC2/T
	UddmSfH31NfPF3bcmnvnEgrLKYOPCMdlxCgLF6+wY5VE/zGWWEcTlXRGkl4L19c3j684E+HpfOF
	cgh0lq4pVhhfOJ6X7Rxyx6xW+plMTerN7DK3etlOp5pc50VculyzW+IaQ==
X-Google-Smtp-Source: AGHT+IHfdbN7q7iMS+18SQtbAa3CGAk6K7rAAw0BzwESRhSc460Et6yhn4diWwlO/9cKamVNlnvLvw==
X-Received: by 2002:a17:90b:1d03:b0:2ee:9e06:7db0 with SMTP id 98e67ed59e1d1-2ef011fbabcmr14575579a91.11.1733417265830;
        Thu, 05 Dec 2024 08:47:45 -0800 (PST)
Received: from p14s ([2604:3d09:148c:c800:cdba:9225:289d:fd74])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ef45ff780bsm1605849a91.42.2024.12.05.08.47.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 08:47:45 -0800 (PST)
Date: Thu, 5 Dec 2024 09:47:42 -0700
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Tinghan Shen <tinghan.shen@mediatek.com>
Subject: Re: [PATCH] remoteproc: mtk_scp: Only populate devices SCP cores
Message-ID: <Z1HZLq4iJQGmKDgM@p14s>
References: <20241202062826.66619-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241202062826.66619-1-wenst@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_084747_174860_E2974B9A 
X-CRM114-Status: GOOD (  21.70  )
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

Good day,

On Mon, Dec 02, 2024 at 02:28:25PM +0800, Chen-Yu Tsai wrote:
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
>  drivers/remoteproc/mtk_scp.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
> 
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

This looks like a sensible addition to me but I'll give Angelo some time to
chime in.

Regards,
Mathieu

>  	mutex_destroy(&scp_cluster->cluster_lock);
>  }
>  
> -- 
> 2.47.0.338.g60cca15819-goog
> 

