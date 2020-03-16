Return-Path: <SRS0=xc+O=5B=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4104AC0044D
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Mar 2020 15:58:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 16C152071C
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Mar 2020 15:58:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CnqCoH6X";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XGOY+0zN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 16C152071C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nJ8Zlz72coR7z8Z59EotCaHV1DXDJ4aE84js/c9v0R4=; b=CnqCoH6XP24JZe
	kt0npDS8wQde7uCm7uNY8zEF1YT55tIfbAcKqFYhmgke2fYwmI1YISfzk4Rh21EbUxguHiM2+KnDj
	W5FDfFLdOGEbWSZofcQrR/EDks+cA7yhG1X7x5J9f6XfsV/9eLNxdcQbsCtZUNY69mW4iW0gkIBqS
	CTxfZyuc2c8zhtp36XaYNLpra94t0EKuQAC/D3NbXTfjpnOP0THZiAY3HjBxLklj7Xqy2Y/rWXNy7
	3WV3JarwGcptfbhvUgJGiRG46YNjj0Vb0z/oG0Kgk+CK3KzEp41USqECv4sHaO7yBzFo1BfXq8HGr
	8LqAEXHZCzKcDGF/z5iw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jDs7z-0008Dv-SJ; Mon, 16 Mar 2020 15:58:07 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jDs7y-0008DV-0d
 for linux-mediatek@lists.infradead.org; Mon, 16 Mar 2020 15:58:07 +0000
Received: by mail-wr1-x444.google.com with SMTP id h4so1273583wru.2
 for <linux-mediatek@lists.infradead.org>; Mon, 16 Mar 2020 08:58:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=H8gu7DkqIY6Hs0O9tBbPEC3uwEKTTAu/TiMJwJ6IfWo=;
 b=XGOY+0zNdZhJAwbt7nG45/bQQxernSkoWJlhxo09FLN2GjiT7TZsLFWAicn5ItdGvm
 M2f0bxD904jzYwBR3rGju26xdAss05Tnrad5a3+eTITy4PaGbbo8kVJpU/QkMvi8bKHx
 M4gGOaDYgSyiZ3mJ9iPwBTsfWTTTSNUYdtcHHTf5c45HYQCEw05zhk2zHiiIlgXrLl50
 dxZ2vtj0a93wasRTiOYVhgOTGADvh9/WAPglVYHNBNVBcnbgiZ5GUkbXkDqOwRRwnZoI
 /icjBVyzPGEJHv+lmMhuIcgeVZ3ifW3bA1YXra3qBcD2x7XmMiVgn/6LpHTLIoSPUCDG
 QnJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=H8gu7DkqIY6Hs0O9tBbPEC3uwEKTTAu/TiMJwJ6IfWo=;
 b=rc+yPE55p4BCGL1Qoa4s5l14xauQfwp5nk66nOu1zpWNHQTXywBf9C0HrS03Q7zzW1
 wcNZOfFgQXYtnjy/PRyYFd8Jjqh1g4DMju1octgvXaiPNvEGGnilJJtahhkb6cbkRD0d
 U7SBJPtINW26zl2JJuNwtqQ0PefB8D/lyP5Fl62xcNSHTUPLffEzkbZ5yiHH4xC7cZPR
 aHVjtQMO+Ql8sVF0El199/eu2DNpvgqj00UIV5VUtz6pwimyLjP2y99OWmYrds34L73Y
 9i6JzMfL0tOAbvSSqlfXpESSYZhwDa8lBzFsCt9fmdhpc+IoECbWhcDxiK1+k8wNOns2
 UpnQ==
X-Gm-Message-State: ANhLgQ3eJ8eGvHOZhwFiad48hBhWgUSmyVwcQkjFgJWMCZ3oMSFcmkAj
 pKnyX+WZhWah5ZBTyY1LzPmi1A==
X-Google-Smtp-Source: ADFU+vsSrPRyJcA3YQxERetVdYcC8+kKaCnqT9yz2q1GFbJB+t1gIFoFuZk5ByOWaxPUf9x/6kt4+g==
X-Received: by 2002:a5d:66c4:: with SMTP id k4mr23072wrw.133.1584374284591;
 Mon, 16 Mar 2020 08:58:04 -0700 (PDT)
Received: from myrica ([2001:171b:226b:54a0:116c:c27a:3e7f:5eaf])
 by smtp.gmail.com with ESMTPSA id y189sm180467wmb.26.2020.03.16.08.58.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Mar 2020 08:58:04 -0700 (PDT)
Date: Mon, 16 Mar 2020 16:57:56 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Joerg Roedel <joro@8bytes.org>
Subject: Re: [PATCH 15/15] iommu: Move fwspec->iommu_priv to struct dev_iommu
Message-ID: <20200316155756.GO304669@myrica>
References: <20200310091229.29830-1-joro@8bytes.org>
 <20200310091229.29830-16-joro@8bytes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200310091229.29830-16-joro@8bytes.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200316_085806_059444_9EDD8F57 
X-CRM114-Status: GOOD (  15.20  )
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

On Tue, Mar 10, 2020 at 10:12:29AM +0100, Joerg Roedel wrote:
> From: Joerg Roedel <jroedel@suse.de>
> 
> Move the pointer for iommu private data from struct iommu_fwspec to
> struct dev_iommu.
> 
> Tested-by: Will Deacon <will@kernel.org> # arm-smmu
> Signed-off-by: Joerg Roedel <jroedel@suse.de>

Reviewed-by: Jean-Philippe Brucker <jean-philippe@linaro.org>

> ---
>  include/linux/iommu.h | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/include/linux/iommu.h b/include/linux/iommu.h
> index 056900e75758..8c4d45fce042 100644
> --- a/include/linux/iommu.h
> +++ b/include/linux/iommu.h
> @@ -369,6 +369,7 @@ struct iommu_fault_param {
>   *
>   * @fault_param: IOMMU detected device fault reporting data
>   * @fwspec:	 IOMMU fwspec data
> + * @priv:	 IOMMU Driver private data
>   *
>   * TODO: migrate other per device data pointers under iommu_dev_data, e.g.
>   *	struct iommu_group	*iommu_group;
> @@ -377,6 +378,7 @@ struct dev_iommu {
>  	struct mutex lock;
>  	struct iommu_fault_param	*fault_param;
>  	struct iommu_fwspec		*fwspec;
> +	void				*priv;
>  };
>  
>  int  iommu_device_register(struct iommu_device *iommu);
> @@ -589,7 +591,6 @@ struct iommu_group *fsl_mc_device_group(struct device *dev);
>  struct iommu_fwspec {
>  	const struct iommu_ops	*ops;
>  	struct fwnode_handle	*iommu_fwnode;
> -	void			*iommu_priv;
>  	u32			flags;
>  	u32			num_pasid_bits;
>  	unsigned int		num_ids;
> @@ -629,12 +630,12 @@ static inline void dev_iommu_fwspec_set(struct device *dev,
>  
>  static inline void *dev_iommu_priv_get(struct device *dev)
>  {
> -	return dev->iommu->fwspec->iommu_priv;
> +	return dev->iommu->priv;
>  }
>  
>  static inline void dev_iommu_priv_set(struct device *dev, void *priv)
>  {
> -	dev->iommu->fwspec->iommu_priv = priv;
> +	dev->iommu->priv = priv;
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
