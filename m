Return-Path: <SRS0=xc+O=5B=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01DABC18E5B
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Mar 2020 15:50:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C6A952051A
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Mar 2020 15:50:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="heVW9DZ+";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KWi+mz5M"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C6A952051A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y+wwdfjSmmKubrIa7V8RrZfUC0ctJOxTQHR+Ks5Xv0Q=; b=heVW9DZ+6RebKx
	9ygJ+8o12MemPaLmsHrsnDKEp47cJ3RgyAzmkX33GiaHazUIkZqvE7hFyyEzjluVb+2eO1SzxDJOa
	CKE33jFWTETHoE/kBjDuHfuAhQ04BSY4jqugDMeIsef+3gOQZCICuG5mDIDifj8d06A1UW4FJPrMN
	nR0Dv/F8zGXh5CAyF1X43+tFS+XZF/nni/pY149Qc1ub0s3QIgfmdu3WtuwbPtTDUg/5kzoAH4GoF
	mTuQO6jwsYvBg3b3wzYoQQH3F4puy+VZGznEyVOYI3/Aahf9UrJZQLraIJST+WIqChDLCQFBJ4/9x
	KbhVXCXXjb3s0VakEZmA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jDs0m-0004fW-EV; Mon, 16 Mar 2020 15:50:40 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jDs0j-0004eX-Ix
 for linux-mediatek@lists.infradead.org; Mon, 16 Mar 2020 15:50:38 +0000
Received: by mail-wr1-x441.google.com with SMTP id s5so21917253wrg.3
 for <linux-mediatek@lists.infradead.org>; Mon, 16 Mar 2020 08:50:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=ppucAR3jBSlUx3f6FMEJLnESjyE6tqFd9bVOCG9Ch70=;
 b=KWi+mz5Ml7txmdoZr19aVQmfuq4pxYfgRps9r2wW5ZsBdqZUhieYBFFgGOjP2Y6bx4
 Wyhz0sJVzU+ttJVQaciTpiR1C0VRxuyTIVO+dc22nAk47TiATbV0DDmHWZKNHrvm2d4C
 vUaa0hW1YGFbvsd4Uq2C+TXdm+UshPrNCJCR7kDzhdknhAK2c/faq2qcpOcTCILD4e73
 SanxGSnN9MZ59DsdmAjiBTz1XxdiLtNTzfhIHxG2HnSi1v3DnTsQ2LGv/Q8k3NkWXNkz
 QoSGyKn9pcROOSXjXbika5mVnv89BwzwPk4bOrNqAP29KhbsRRP7ajNL8l0XJVmaY1q3
 +MfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ppucAR3jBSlUx3f6FMEJLnESjyE6tqFd9bVOCG9Ch70=;
 b=nzlBA3IezVQ+05x4nh1Vk3B65XMNSzw9DqPQ6TMWEuY73oK6MX6G9dkGupkaIVAg+e
 dZY6NMiy1YZk+RG2Wpoos8cAbVU9OTa5jj0KfCTim7eWAmsGf4VdYj7xj7V5P7X5vHOE
 czoEJYaRbCG784phjSpNmo8/rLeGmjMsljrSbOIrm/pARg5K5sJDkpbvvYNmLwYz/Ea2
 svei2cU7QeSH842Ys8q1Nr6mmBbM9rT/SZrCSBxJT6X9DDg8XsC6CTUF9IOhXS49ALWs
 UE5x2iKVjTtC+daseZ16yWfupRk0Im7wPZuv856K0EC/1WN+8SmR71jQfGDb7otGjdUk
 bAwQ==
X-Gm-Message-State: ANhLgQ1bwhokw4A7lwjyGyQZVUD3zKsHvYXYx1kMW7tRoElMGNuetNAP
 fXaI4kNj7ogX4Qxc1lkr07pcXg==
X-Google-Smtp-Source: ADFU+vvMLgpIudyWQDIKiFCwE2bd5t8QaZ3ZQI2eMwU4VsE9JIaD98F8TicbYAXHc+pSTvK+AYpoyA==
X-Received: by 2002:adf:dfc1:: with SMTP id q1mr43953wrn.62.1584373836280;
 Mon, 16 Mar 2020 08:50:36 -0700 (PDT)
Received: from myrica ([2001:171b:226b:54a0:116c:c27a:3e7f:5eaf])
 by smtp.gmail.com with ESMTPSA id p16sm147962wmg.22.2020.03.16.08.50.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Mar 2020 08:50:35 -0700 (PDT)
Date: Mon, 16 Mar 2020 16:50:28 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Joerg Roedel <joro@8bytes.org>
Subject: Re: [PATCH 11/15] iommu/renesas: Use accessor functions for iommu
 private data
Message-ID: <20200316155028.GK304669@myrica>
References: <20200310091229.29830-1-joro@8bytes.org>
 <20200310091229.29830-12-joro@8bytes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200310091229.29830-12-joro@8bytes.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200316_085037_626200_9AE33BA0 
X-CRM114-Status: GOOD (  15.86  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Rob Clark <robdclark@gmail.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Will Deacon <will@kernel.org>,
 linux-arm-msm@vger.kernel.org, Sudeep Holla <sudeep.holla@arm.com>,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 iommu@lists.linux-foundation.org, Thierry Reding <thierry.reding@gmail.com>,
 linux-mediatek@lists.infradead.org, Andy Gross <agross@kernel.org>,
 Joerg Roedel <jroedel@suse.de>, Hanjun Guo <guohanjun@huawei.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Sean Paul <sean@poorly.run>,
 Robin Murphy <robin.murphy@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Mar 10, 2020 at 10:12:25AM +0100, Joerg Roedel wrote:
> From: Joerg Roedel <jroedel@suse.de>
> 
> Make use of dev_iommu_priv_set/get() functions.
> 
> Signed-off-by: Joerg Roedel <jroedel@suse.de>
> ---
>  drivers/iommu/ipmmu-vmsa.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/iommu/ipmmu-vmsa.c b/drivers/iommu/ipmmu-vmsa.c
> index ecb3f9464dd5..310cf09feea3 100644
> --- a/drivers/iommu/ipmmu-vmsa.c
> +++ b/drivers/iommu/ipmmu-vmsa.c
> @@ -89,9 +89,7 @@ static struct ipmmu_vmsa_domain *to_vmsa_domain(struct iommu_domain *dom)
>  
>  static struct ipmmu_vmsa_device *to_ipmmu(struct device *dev)
>  {
> -	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
> -
> -	return fwspec ? fwspec->iommu_priv : NULL;
> +	return dev_iommu_priv_get(dev);

The removal of the fwspec NULL check was worrying me a little. Now any
user of to_ipmmu() directly dereferences dev->iommu->priv where they
previously tested first whether dev->fwspec was set. But I didn't find
anything that could go wrong, and the resulting code looks better.

Reviewed-by: Jean-Philippe Brucker <jean-philippe@linaro.org>

>  }
>  
>  #define TLB_LOOP_TIMEOUT		100	/* 100us */
> @@ -727,14 +725,13 @@ static phys_addr_t ipmmu_iova_to_phys(struct iommu_domain *io_domain,
>  static int ipmmu_init_platform_device(struct device *dev,
>  				      struct of_phandle_args *args)
>  {
> -	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
>  	struct platform_device *ipmmu_pdev;
>  
>  	ipmmu_pdev = of_find_device_by_node(args->np);
>  	if (!ipmmu_pdev)
>  		return -ENODEV;
>  
> -	fwspec->iommu_priv = platform_get_drvdata(ipmmu_pdev);
> +	dev_iommu_priv_set(dev, platform_get_drvdata(ipmmu_pdev));
>  
>  	return 0;
>  }
> -- 
> 2.17.1
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
