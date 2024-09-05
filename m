Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 817BBCD5BD4
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Sep 2024 16:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WGwxBe/iaaoqwox8h/HS48crgUAbtB3Lz0hvS0382cQ=; b=R/0efLFiALFktMoVidEfaSoAqz
	gitvSc/439QHfshT11tAa6wYaO6bfoo8KVdNj+IUSqGgiTdjPP27vBTe6VSAvEltgwNx80F/JV7BY
	7sKfKuOq01X+XYszO0/MaYVxv1STUnSlBWnuSGAYPvpsa3gFITrC/sSajUm1o3p6XXXZjr9D1Ef7Q
	7W+ZAAF8VgCH9zO8xrBie1xPCfMSpVTAB79VSPL7Qx114gEKeeq1pog5wp//BSR929PfshWEq4MGc
	48cXfWuaElitgehVW4+tKhXiy+x4MXksayqaGNtwGYVBQQ0N96yYJTmluhhjXL2VfI1AHXtswc8td
	1QdoMrGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smFI2-000000096PY-3eo8;
	Thu, 05 Sep 2024 16:24:58 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smFGD-000000095xi-1fMw
	for linux-mediatek@lists.infradead.org;
	Thu, 05 Sep 2024 16:23:07 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-71788bfe60eso829323b3a.1
        for <linux-mediatek@lists.infradead.org>; Thu, 05 Sep 2024 09:23:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725553383; x=1726158183; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WGwxBe/iaaoqwox8h/HS48crgUAbtB3Lz0hvS0382cQ=;
        b=w/geTesEO0C/jZQT3nIIiIWvlgXnUm2lPSW3rXHxyiTjxpEpT+V0SINuAxmvcizK7R
         FdGgNBYjKnxrFR1Fuz2xBuKlm3tW7m36LYvcCQ7KiWSvnNxI1LE33gv4qYd++e/UKMge
         0hYJIsc1U/l7ILDraCYFdFk+Rh6lVoSYDFQIIhkAUv0fg3TVQqIRYfBt4BfHa2X78DL6
         H22M6QarzVNVcYuSpgF+GoR3CBObdQW1rH8UfkuGhCLBogYeKWSuenBQHIP/QXQUrkHc
         hnCg0TtUnLZUwkmJVomC7+WgW9qtYItEnanaZnWbtInNvVWKscEUqtTzzPvfa+jPVOgF
         s8zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725553383; x=1726158183;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WGwxBe/iaaoqwox8h/HS48crgUAbtB3Lz0hvS0382cQ=;
        b=WofMqjWbSmkJvtWABuw5CxaniqJ4HGpSzrcVU2trMfplNbXOB0bICoo2zaPVd9XN8N
         MbLu2FiO0lkrXBxvwB04nvewbMfb21YuBOpWU6iJtq2YyxNwqWdc0hyikx/IjiykzePD
         CMFNLSYd0sVwC3TnDmbtKT4BudG9lPSPpHgqBRizj489mKTr6SSoA3xEhlZdAt6At3Bv
         HTr2xRnN55wvTCp4keRPGfb1F1sBmQqS9E2EbFTkY8hrI0PwEro4tl1ub1jBufVmj4ix
         6HnqEwxSsRgXFnKIJbgvsspsJGRbb54jXsS8yKKrIL92yYEwriCrVEcpnpvznfJuujZ7
         PAhA==
X-Forwarded-Encrypted: i=1; AJvYcCXbflohjcgOkiTgV1S1K80rBqVTCqx9xKF7uuhXVczt+hihWYkRuWFI6mc30ZDEZ+hLqLOiY83ISacENMPVlw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxEi1w0OFv1gK5IqJ18szCm60zbZWCEY6riTRZU0I0UeDZgTMbG
	AfXguafQHuH/YQ1IPIrmYwEIdLDTPdGFDCafh38wPSqlLj+HiSdI4izh/e7AZUE=
X-Google-Smtp-Source: AGHT+IEstKk+LEI8X3OaN9fTZu6CZPPKQppwGBYLvxBQ/FfkUBW23FDlSvzIk3BvLCy/OE4uzgavvQ==
X-Received: by 2002:a05:6a20:e196:b0:1cc:dfd1:2453 with SMTP id adf61e73a8af0-1cce1016eebmr24968329637.30.1725553383443;
        Thu, 05 Sep 2024 09:23:03 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:3b5d:f081:c58f:f7e2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7177859a369sm3510923b3a.148.2024.09.05.09.23.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2024 09:23:02 -0700 (PDT)
Date: Thu, 5 Sep 2024 10:22:59 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Liu Jing <liujing@cmss.chinamobile.com>
Cc: andersson@kernel.org, paul@crapouillou.net, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	patrice.chotard@foss.st.com, linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] remoteproc:remove redundant dev_err message
Message-ID: <Ztna4xyKbOJTw5C1@p14s>
References: <20240904185417.14357-1-liujing@cmss.chinamobile.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240904185417.14357-1-liujing@cmss.chinamobile.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240905_092305_472748_BFBC0F56 
X-CRM114-Status: GOOD (  15.68  )
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

On Thu, Sep 05, 2024 at 02:54:17AM +0800, Liu Jing wrote:
> devm_ioremap_resource already contains error message, so remove
> the redundant dev_err message
> 
> Signed-off-by: Liu Jing <liujing@cmss.chinamobile.com>
> 
> diff --git a/drivers/remoteproc/da8xx_remoteproc.c b/drivers/remoteproc/da8xx_remoteproc.c
> index 9041a0e07fb2..289d5ce9f7af 100644
> --- a/drivers/remoteproc/da8xx_remoteproc.c
> +++ b/drivers/remoteproc/da8xx_remoteproc.c
> @@ -214,8 +214,6 @@ static int da8xx_rproc_get_internal_memories(struct platform_device *pdev,
>  						   mem_names[i]);
>  		drproc->mem[i].cpu_addr = devm_ioremap_resource(dev, res);
>  		if (IS_ERR(drproc->mem[i].cpu_addr)) {
> -			dev_err(dev, "failed to parse and map %s memory\n",
> -				mem_names[i]);
>  			return PTR_ERR(drproc->mem[i].cpu_addr);
>  		}
>  		drproc->mem[i].bus_addr = res->start;
> diff --git a/drivers/remoteproc/ingenic_rproc.c b/drivers/remoteproc/ingenic_rproc.c
> index 9902cce28692..b3ee5c47001d 100644
> --- a/drivers/remoteproc/ingenic_rproc.c
> +++ b/drivers/remoteproc/ingenic_rproc.c
> @@ -186,7 +186,6 @@ static int ingenic_rproc_probe(struct platform_device *pdev)
>  	mem = platform_get_resource_byname(pdev, IORESOURCE_MEM, "aux");
>  	vpu->aux_base = devm_ioremap_resource(dev, mem);
>  	if (IS_ERR(vpu->aux_base)) {
> -		dev_err(dev, "Failed to ioremap\n");
>  		return PTR_ERR(vpu->aux_base);
>  	}
>  
> @@ -197,7 +196,6 @@ static int ingenic_rproc_probe(struct platform_device *pdev)
>  		vpu->mem_info[i].base = devm_ioremap_resource(dev, mem);
>  		if (IS_ERR(vpu->mem_info[i].base)) {
>  			ret = PTR_ERR(vpu->mem_info[i].base);
> -			dev_err(dev, "Failed to ioremap\n");
>  			return ret;
>  		}
>  
> diff --git a/drivers/remoteproc/keystone_remoteproc.c b/drivers/remoteproc/keystone_remoteproc.c
> index 7e57b90bcaf8..a31f94a290c9 100644
> --- a/drivers/remoteproc/keystone_remoteproc.c
> +++ b/drivers/remoteproc/keystone_remoteproc.c
> @@ -312,8 +312,6 @@ static int keystone_rproc_of_get_memories(struct platform_device *pdev,
>  						   mem_names[i]);
>  		ksproc->mem[i].cpu_addr = devm_ioremap_resource(dev, res);
>  		if (IS_ERR(ksproc->mem[i].cpu_addr)) {
> -			dev_err(dev, "failed to parse and map %s memory\n",
> -				mem_names[i]);
>  			return PTR_ERR(ksproc->mem[i].cpu_addr);
>  		}
>  		ksproc->mem[i].bus_addr = res->start;
> diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
> index e744c07507ee..cb8ad16583c7 100644
> --- a/drivers/remoteproc/mtk_scp.c
> +++ b/drivers/remoteproc/mtk_scp.c
> @@ -1126,7 +1126,6 @@ static struct mtk_scp *scp_rproc_init(struct platform_device *pdev,
>  	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "sram");
>  	scp->sram_base = devm_ioremap_resource(dev, res);
>  	if (IS_ERR(scp->sram_base)) {
> -		dev_err(dev, "Failed to parse and map sram memory\n");
>  		return ERR_CAST(scp->sram_base);
>  	}

There is another instance in the Mediatek driver - please address.

Thanks,
Mathieu

>  
> diff --git a/drivers/remoteproc/omap_remoteproc.c b/drivers/remoteproc/omap_remoteproc.c
> index 9ae2e831456d..07e707776cf9 100644
> --- a/drivers/remoteproc/omap_remoteproc.c
> +++ b/drivers/remoteproc/omap_remoteproc.c
> @@ -1201,8 +1201,6 @@ static int omap_rproc_of_get_internal_memories(struct platform_device *pdev,
>  		}
>  		oproc->mem[i].cpu_addr = devm_ioremap_resource(dev, res);
>  		if (IS_ERR(oproc->mem[i].cpu_addr)) {
> -			dev_err(dev, "failed to parse and map %s memory\n",
> -				data->mems[i].name);
>  			return PTR_ERR(oproc->mem[i].cpu_addr);
>  		}
>  		oproc->mem[i].bus_addr = res->start;
> diff --git a/drivers/remoteproc/pru_rproc.c b/drivers/remoteproc/pru_rproc.c
> index 327f0c7ee3d6..85b95e025c17 100644
> --- a/drivers/remoteproc/pru_rproc.c
> +++ b/drivers/remoteproc/pru_rproc.c
> @@ -1047,8 +1047,6 @@ static int pru_rproc_probe(struct platform_device *pdev)
>  						   mem_names[i]);
>  		pru->mem_regions[i].va = devm_ioremap_resource(dev, res);
>  		if (IS_ERR(pru->mem_regions[i].va)) {
> -			dev_err(dev, "failed to parse and map memory resource %d %s\n",
> -				i, mem_names[i]);
>  			ret = PTR_ERR(pru->mem_regions[i].va);
>  			return ret;
>  		}
> diff --git a/drivers/remoteproc/qcom_q6v5_adsp.c b/drivers/remoteproc/qcom_q6v5_adsp.c
> index 572dcb0f055b..fe65ffa9a93f 100644
> --- a/drivers/remoteproc/qcom_q6v5_adsp.c
> +++ b/drivers/remoteproc/qcom_q6v5_adsp.c
> @@ -602,7 +602,6 @@ static int adsp_init_mmio(struct qcom_adsp *adsp,
>  	} else {
>  		adsp->lpass_efuse = devm_ioremap_resource(&pdev->dev, efuse_region);
>  		if (IS_ERR(adsp->lpass_efuse)) {
> -			dev_err(adsp->dev, "failed to map efuse registers\n");
>  			return PTR_ERR(adsp->lpass_efuse);
>  		}
>  	}
> diff --git a/drivers/remoteproc/st_slim_rproc.c b/drivers/remoteproc/st_slim_rproc.c
> index d17719384c16..a6e50f51c794 100644
> --- a/drivers/remoteproc/st_slim_rproc.c
> +++ b/drivers/remoteproc/st_slim_rproc.c
> @@ -251,7 +251,6 @@ struct st_slim_rproc *st_slim_rproc_alloc(struct platform_device *pdev,
>  
>  		slim_rproc->mem[i].cpu_addr = devm_ioremap_resource(dev, res);
>  		if (IS_ERR(slim_rproc->mem[i].cpu_addr)) {
> -			dev_err(&pdev->dev, "devm_ioremap_resource failed\n");
>  			err = PTR_ERR(slim_rproc->mem[i].cpu_addr);
>  			goto err;
>  		}
> @@ -262,7 +261,6 @@ struct st_slim_rproc *st_slim_rproc_alloc(struct platform_device *pdev,
>  	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "slimcore");
>  	slim_rproc->slimcore = devm_ioremap_resource(dev, res);
>  	if (IS_ERR(slim_rproc->slimcore)) {
> -		dev_err(&pdev->dev, "failed to ioremap slimcore IO\n");
>  		err = PTR_ERR(slim_rproc->slimcore);
>  		goto err;
>  	}
> @@ -270,7 +268,6 @@ struct st_slim_rproc *st_slim_rproc_alloc(struct platform_device *pdev,
>  	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "peripherals");
>  	slim_rproc->peri = devm_ioremap_resource(dev, res);
>  	if (IS_ERR(slim_rproc->peri)) {
> -		dev_err(&pdev->dev, "failed to ioremap peripherals IO\n");
>  		err = PTR_ERR(slim_rproc->peri);
>  		goto err;
>  	}
> diff --git a/drivers/remoteproc/wkup_m3_rproc.c b/drivers/remoteproc/wkup_m3_rproc.c
> index 36a55f7ffa64..5648f450c018 100644
> --- a/drivers/remoteproc/wkup_m3_rproc.c
> +++ b/drivers/remoteproc/wkup_m3_rproc.c
> @@ -186,8 +186,6 @@ static int wkup_m3_rproc_probe(struct platform_device *pdev)
>  						   mem_names[i]);
>  		wkupm3->mem[i].cpu_addr = devm_ioremap_resource(dev, res);
>  		if (IS_ERR(wkupm3->mem[i].cpu_addr)) {
> -			dev_err(&pdev->dev, "devm_ioremap_resource failed for resource %d\n",
> -				i);
>  			ret = PTR_ERR(wkupm3->mem[i].cpu_addr);
>  			goto err_put_rproc;
>  		}
> -- 
> 2.33.0
> 
> 
> 

