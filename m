Return-Path: <SRS0=xc+O=5B=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8954C18E5B
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Mar 2020 15:57:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7A4852071C
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Mar 2020 15:57:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ao/E78Kn";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uq3aC7rP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7A4852071C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4d9J2yPa7+slD1fHfuLAqudpMa2uX39DyaiB4g0eys0=; b=ao/E78KnnDX7y1
	NklQOTaExxk9IZXdUvx9DeumDnhpN6zlXeI6vqAgqIGizzGg4w/jr0sKTyb0Fc/p2k3I6/rVILgB/
	KP+CGZXWEk9bP4lOteJqDEADzcCLf6gMZI3luLRadcdc55KyZdy0920vYHYQc8yVAcXMfKywrOJ/Z
	HlBpudpnljfI0YY/ecRMAlvVQHne57nhTFfM7YRE7sElW1Fpz8tkXuwa6m6uO3G3kmAFD2Bnx/tT3
	Tgt1AKLAn3AbCIUO7uBZV2fCHDQWoz6eBK/bA7cAZSqfkVy3w8DX48O9tTNmk2CMbDmnA4mm+HS9Z
	9IjIMKILQzYoZRBiTRwA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jDs6o-0007vX-6W; Mon, 16 Mar 2020 15:56:54 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jDs6l-0007uq-DF
 for linux-mediatek@lists.infradead.org; Mon, 16 Mar 2020 15:56:52 +0000
Received: by mail-wm1-x343.google.com with SMTP id a132so18260011wme.1
 for <linux-mediatek@lists.infradead.org>; Mon, 16 Mar 2020 08:56:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=xMvs0/HoidPNJcKREH4cxPQfySQhzOIJtF8I7+UM558=;
 b=uq3aC7rP8Gi0hWD2k9GTvb304Urdg7HWJq+1GajWwKZFGsN2rAJMGURBxedQKUW4jd
 asGhdTqUUsTBsHFqdt9E3rUbuOPH9LnplZyIROCXZts0Altk+BtOGfxVnQG2zCkEVKBq
 NAuI2JAjicGhKKjGeoT4CC5ZB2QqLarkq2Zu2k9kjsXdW+uN+BMXxoUU5u4N96yU44fx
 tCZDJoxX8PkOf/gkX0aCFzGDyygT+xsCtaCtEDXLQvT6XUdDgAn69Z6zXz1IbnDjfIOR
 mq+n2Ab7QrOC31UPcgX0gGxqUx4OOFYTI0TN6BbHpW3S45c2GIHm7KEYESWZoQ3DPMJV
 MY7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=xMvs0/HoidPNJcKREH4cxPQfySQhzOIJtF8I7+UM558=;
 b=ghjTWxiMdC67jxKjzrk9Ax5jy1XEfS0ojw8v8zuBaNMboxsey8lAXPwM2r8ex84VM2
 ooghrE41M6H7eLx1QOY8wUloNt5jle27gWPNPjQQYlY/8J5BvK7xVt6C4SCsnBeReiFL
 hk/7SYVzJx581Mwcd+R95jrAAWF0tJNBWbEBjMsYxtoDrb+YIfETDdWxzxTUy1diqmAD
 YtocMXsJmaVQjeMdyOXfZ9ajqPHpEYd1I0c81aa/dl+4FVgG48StOgCL+/UeqnNt1Qec
 1u+k2EZchj9vnNALB1PfYeYHcKWosgydB+1UPUId9PMd3KpL7IO56koSwn8rP3XEAkD/
 7V6w==
X-Gm-Message-State: ANhLgQ3QZhz8ggO9b9SiXGVnwT0JMYkLGzDmFDs1H+6fyJ21XdUGW+5x
 qxd/mWQP3d7M1idS63vhZYArfw==
X-Google-Smtp-Source: ADFU+vtb9SuXzA1/Pyl3fT36qeOkgagpJNuCxgpPrVNo6inRK/YVmejfWVsaU34AB8eJFzzgsz2mCw==
X-Received: by 2002:a1c:4d13:: with SMTP id o19mr28587408wmh.186.1584374209825; 
 Mon, 16 Mar 2020 08:56:49 -0700 (PDT)
Received: from myrica ([2001:171b:226b:54a0:116c:c27a:3e7f:5eaf])
 by smtp.gmail.com with ESMTPSA id w16sm531971wrp.8.2020.03.16.08.56.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Mar 2020 08:56:49 -0700 (PDT)
Date: Mon, 16 Mar 2020 16:56:41 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Joerg Roedel <joro@8bytes.org>
Subject: Re: [PATCH 14/15] iommu/virtio: Use accessor functions for iommu
 private data
Message-ID: <20200316155641.GN304669@myrica>
References: <20200310091229.29830-1-joro@8bytes.org>
 <20200310091229.29830-15-joro@8bytes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200310091229.29830-15-joro@8bytes.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200316_085651_445577_6F7F9EC2 
X-CRM114-Status: GOOD (  15.02  )
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

On Tue, Mar 10, 2020 at 10:12:28AM +0100, Joerg Roedel wrote:
> From: Joerg Roedel <jroedel@suse.de>
> 
> Make use of dev_iommu_priv_set/get() functions.
> 
> Signed-off-by: Joerg Roedel <jroedel@suse.de>

Reviewed-by: Jean-Philippe Brucker <jean-philippe@linaro.org>

And tested on QEMU

> ---
>  drivers/iommu/virtio-iommu.c | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/iommu/virtio-iommu.c b/drivers/iommu/virtio-iommu.c
> index cce329d71fba..8ead57f031f5 100644
> --- a/drivers/iommu/virtio-iommu.c
> +++ b/drivers/iommu/virtio-iommu.c
> @@ -466,7 +466,7 @@ static int viommu_probe_endpoint(struct viommu_dev *viommu, struct device *dev)
>  	struct virtio_iommu_req_probe *probe;
>  	struct virtio_iommu_probe_property *prop;
>  	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
> -	struct viommu_endpoint *vdev = fwspec->iommu_priv;
> +	struct viommu_endpoint *vdev = dev_iommu_priv_get(dev);
>  
>  	if (!fwspec->num_ids)
>  		return -EINVAL;
> @@ -648,7 +648,7 @@ static int viommu_attach_dev(struct iommu_domain *domain, struct device *dev)
>  	int ret = 0;
>  	struct virtio_iommu_req_attach req;
>  	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
> -	struct viommu_endpoint *vdev = fwspec->iommu_priv;
> +	struct viommu_endpoint *vdev = dev_iommu_priv_get(dev);
>  	struct viommu_domain *vdomain = to_viommu_domain(domain);
>  
>  	mutex_lock(&vdomain->mutex);
> @@ -807,8 +807,7 @@ static void viommu_iotlb_sync(struct iommu_domain *domain,
>  static void viommu_get_resv_regions(struct device *dev, struct list_head *head)
>  {
>  	struct iommu_resv_region *entry, *new_entry, *msi = NULL;
> -	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
> -	struct viommu_endpoint *vdev = fwspec->iommu_priv;
> +	struct viommu_endpoint *vdev = dev_iommu_priv_get(dev);
>  	int prot = IOMMU_WRITE | IOMMU_NOEXEC | IOMMU_MMIO;
>  
>  	list_for_each_entry(entry, &vdev->resv_regions, list) {
> @@ -876,7 +875,7 @@ static int viommu_add_device(struct device *dev)
>  	vdev->dev = dev;
>  	vdev->viommu = viommu;
>  	INIT_LIST_HEAD(&vdev->resv_regions);
> -	fwspec->iommu_priv = vdev;
> +	dev_iommu_priv_set(dev, vdev);
>  
>  	if (viommu->probe_size) {
>  		/* Get additional information for this endpoint */
> @@ -920,7 +919,7 @@ static void viommu_remove_device(struct device *dev)
>  	if (!fwspec || fwspec->ops != &viommu_ops)
>  		return;
>  
> -	vdev = fwspec->iommu_priv;
> +	vdev = dev_iommu_priv_get(dev);
>  
>  	iommu_group_remove_device(dev);
>  	iommu_device_unlink(&vdev->viommu->iommu, dev);
> -- 
> 2.17.1
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
