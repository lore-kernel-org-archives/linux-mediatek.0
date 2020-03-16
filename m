Return-Path: <SRS0=xc+O=5B=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFF0AC0044D
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Mar 2020 15:47:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9DD0D2051A
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Mar 2020 15:47:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BstYCTcc";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lWNxgXfi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9DD0D2051A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d/Ee0jbyfM6VPUf2WcNDCyPJxm8YqXEKV52vW/nf+us=; b=BstYCTcchCSAL8
	ykot1VZJgwETEoKZWRX2UFUuTP01QpNxDXJnvHN/PA8D96d23Z0fy9R+n4Wg0C00JZKaDwSXycHja
	Sw7EZ7xjEk6QwWSBQ2B2i4crYz2B28UzzKyKBL8ngc+lBJwe/pCCDKrBzz4muXQ6Bm0yFugzVdxqn
	LxaBv1UxDG3M/99fgiSk2Kh/tWaE2iMJJw/9rA3GecvSVHLPLmwS217bMFdHhCba6vtxXcYfwhuS5
	O85Xe9z+QRdxuo0Bls6+wk7rQmehJ3SnDMTmhMa1Vwop9dIwCUEIBLCSkdHUIg5qjwr1eI+y8YLaV
	3n7x/6/vG73eKCZM/niA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jDrxR-0002K2-Om; Mon, 16 Mar 2020 15:47:13 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jDrxJ-0002CG-RM
 for linux-mediatek@lists.infradead.org; Mon, 16 Mar 2020 15:47:08 +0000
Received: by mail-wm1-x343.google.com with SMTP id g62so18648884wme.1
 for <linux-mediatek@lists.infradead.org>; Mon, 16 Mar 2020 08:47:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=GYsjb8wyMpitfSH0f8PA0mHjVYM9QWEBO9gCjay1L20=;
 b=lWNxgXfim4KYtEIBQRfki0eiyE/BWsrHh3mBkMGppzItkVPtihwUMSFvFNJ8xZBe/a
 brVy81DoW/z2tKhjRZCiCm/G+1HhJ4ivW/m8mNYUQ+5UJU0ouy6jtCyhH/U78JntPD50
 wA8YP4LnsMZBrluKad4Gdo4I6gdkfckXd+n28BgxyvvOZK40MupWY1itrZtSmK4bF7X3
 Lf8kgqGrtsTg2Pm92hWC3TpUqUqzFNt3JRDsmfiXg94brnBo2XJWC7QC0YLSYk8SkyIu
 pOSYqrLqVT2tAJ803lgFos/Qzi2xRy+O8Q6vbrgrPbyuCSc1hNAso5Tb2xZB8RKLPxC4
 BJkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=GYsjb8wyMpitfSH0f8PA0mHjVYM9QWEBO9gCjay1L20=;
 b=UB+ywV6xfWn7XQnbfMm7XL/gqk9KAZYcawIR37OKypDG1ZkrFhWwBXTPytkrjthc9o
 MOfvXKHzhNj20VFxHaw8jYxDFxZI+OQcx24ckb71F1QtFLkV6KZpucAfAInUJHd6WPj+
 6KRO0hkN7DuVUzBqg2PR4S7d21lE/GcISLJTKXB0IyE9QBZB+WsIbv/D8wxcgtae36SM
 H0QZgoRt2to2uUEXw4Q+sH+UM3OtlQIFv0GAwYtL3cRTL8uX6yiewPtotExBsZeWqAyt
 YiEsYC/wmWoLiHP4dy1jp6f+PPOX+yI9cZV90bIqcQP2HHhYgQbj2yJD1fsAFghjZvvt
 G3YA==
X-Gm-Message-State: ANhLgQ1CeRHOErAzPiNtHxhtxCNCzL/ZlyyIKif5mOnooWgpks8iQmI+
 sFWEifhHy0hukB/Loqu9GIowSA==
X-Google-Smtp-Source: ADFU+vug65fGoL5TKdymAh0vmL/kEClqE8KiEqVXS5gBbtx7HyWfeUkjQSmjqTq49k3w6tjjBOsBAA==
X-Received: by 2002:a7b:c019:: with SMTP id c25mr28919018wmb.126.1584373622085; 
 Mon, 16 Mar 2020 08:47:02 -0700 (PDT)
Received: from myrica ([2001:171b:226b:54a0:116c:c27a:3e7f:5eaf])
 by smtp.gmail.com with ESMTPSA id l8sm164858wmj.2.2020.03.16.08.47.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Mar 2020 08:47:01 -0700 (PDT)
Date: Mon, 16 Mar 2020 16:46:54 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Joerg Roedel <joro@8bytes.org>
Subject: Re: [PATCH 06/15] iommu: Move iommu_fwspec to struct dev_iommu
Message-ID: <20200316154654.GG304669@myrica>
References: <20200310091229.29830-1-joro@8bytes.org>
 <20200310091229.29830-7-joro@8bytes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200310091229.29830-7-joro@8bytes.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200316_084705_922360_C6AB19A9 
X-CRM114-Status: GOOD (  17.46  )
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

On Tue, Mar 10, 2020 at 10:12:20AM +0100, Joerg Roedel wrote:
> From: Joerg Roedel <jroedel@suse.de>
> 
> Move the iommu_fwspec pointer in struct device into struct dev_iommu.
> This is a step in the effort to reduce the iommu related pointers in
> struct device to one.
> 
> Tested-by: Will Deacon <will@kernel.org> # arm-smmu
> Signed-off-by: Joerg Roedel <jroedel@suse.de>
> ---
>  drivers/iommu/iommu.c  |  3 +++
>  include/linux/device.h |  1 -
>  include/linux/iommu.h  | 12 ++++++++----
>  3 files changed, 11 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
> index beac2ef063dd..826a67ba247f 100644
> --- a/drivers/iommu/iommu.c
> +++ b/drivers/iommu/iommu.c
> @@ -2405,6 +2405,9 @@ int iommu_fwspec_init(struct device *dev, struct fwnode_handle *iommu_fwnode,
>  	if (fwspec)
>  		return ops == fwspec->ops ? 0 : -EINVAL;
>  
> +	if (!dev_iommu_get(dev))
> +		return -ENOMEM;
> +
>  	fwspec = kzalloc(sizeof(*fwspec), GFP_KERNEL);
>  	if (!fwspec)
>  		return -ENOMEM;
> diff --git a/include/linux/device.h b/include/linux/device.h
> index 405a8f11bec1..ca29c39a6480 100644
> --- a/include/linux/device.h
> +++ b/include/linux/device.h
> @@ -613,7 +613,6 @@ struct device {
>  
>  	void	(*release)(struct device *dev);
>  	struct iommu_group	*iommu_group;
> -	struct iommu_fwspec	*iommu_fwspec;
>  	struct dev_iommu	*iommu;
>  
>  	bool			offline_disabled:1;
> diff --git a/include/linux/iommu.h b/include/linux/iommu.h
> index 1c9fa5c1174b..f5edc21a644d 100644
> --- a/include/linux/iommu.h
> +++ b/include/linux/iommu.h
> @@ -368,14 +368,15 @@ struct iommu_fault_param {
>   * struct dev_iommu - Collection of per-device IOMMU data
>   *
>   * @fault_param: IOMMU detected device fault reporting data
> + * @fwspec:	 IOMMU fwspec data
>   *
>   * TODO: migrate other per device data pointers under iommu_dev_data, e.g.
>   *	struct iommu_group	*iommu_group;
> - *	struct iommu_fwspec	*iommu_fwspec;
>   */
>  struct dev_iommu {
>  	struct mutex lock;
> -	struct iommu_fault_param *fault_param;
> +	struct iommu_fault_param	*fault_param;
> +	struct iommu_fwspec		*fwspec;
>  };
>  
>  int  iommu_device_register(struct iommu_device *iommu);
> @@ -614,13 +615,16 @@ const struct iommu_ops *iommu_ops_from_fwnode(struct fwnode_handle *fwnode);
>  
>  static inline struct iommu_fwspec *dev_iommu_fwspec_get(struct device *dev)
>  {
> -	return dev->iommu_fwspec;
> +	if (dev->iommu)
> +		return dev->iommu->fwspec;
> +	else
> +		return NULL;
>  }
>  
>  static inline void dev_iommu_fwspec_set(struct device *dev,
>  					struct iommu_fwspec *fwspec)
>  {
> -	dev->iommu_fwspec = fwspec;
> +	dev->iommu->fwspec = fwspec;

It may be worth moving the set() to iommu.c and prevent any misuse.
Regardless:

Reviewed-by: Jean-Philippe Brucker <jean-philippe@linaro.org>

>  }
>  
>  int iommu_probe_device(struct device *dev);
> -- 
> 2.17.1
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
