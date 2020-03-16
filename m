Return-Path: <SRS0=xc+O=5B=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BF26C0044D
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Mar 2020 15:45:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3CF232051A
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Mar 2020 15:45:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Pp9AKtTw";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hxXhoxAr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3CF232051A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/Yx36aH2jmtBI4083/rdNTcUFD0gUiVmhndrz8jkx0g=; b=Pp9AKtTwMI8Zm6
	AkqvGNG5Gw//1JAzrlAhumAeHE4Ls+ltlly9lKyk4BVI3PDu8fMHhtBAfQQtqj8+MKFTjQXOGsHiE
	vThSV9Xb1RErQVGfBRoov2T61a4q3jBbmGGaSJGMExNSCY0UGCnPtNzHEbcbkPU+KBu1Jqfd7PytN
	YNDHRBPBs5t1ymXJFj96rVoZ7Uir+qtWABfD5uomxfNzGuU32UoW+ExittgmzmMF8fXelVlU71Ir8
	uC3Q50AvcoxNCw4M0Zotpcci/OZ5KIZYoQVZ6JZ1TxwqT2xYkrpBsIWU/cw4SXrT7nJfLHLSku4UB
	Z+Ta6co/SJkYmcvqkXcw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jDrvc-0001cV-65; Mon, 16 Mar 2020 15:45:20 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jDrvZ-0001bC-4L
 for linux-mediatek@lists.infradead.org; Mon, 16 Mar 2020 15:45:18 +0000
Received: by mail-wr1-x443.google.com with SMTP id h4so1219554wru.2
 for <linux-mediatek@lists.infradead.org>; Mon, 16 Mar 2020 08:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=hEmn41e48jqvaiXw5xLaWp2S+l0O2jS39TBL03MNI00=;
 b=hxXhoxArp91c63USSVFsklYGXMgLrrsjkhu5g1UGp1zyy2n8XTBfkiR1Trc0tz1WDB
 7rlFlfA3mTHUn9N/PzaQY4rBvksNd1syevhlYwAUW3Ru2jaBWBY+0Xosvk28KeTgjJ5j
 jqJylm90J/u+L5kQGPjfiHUCGLkj+K1nTT8AIFuI+hnVn5ICTQeRsbvUyOUlfQCpoJEb
 oKmfyotDHtwV15SBsR6EOXaEANsTKHX+WqTAugb9REmnvneIy//03pcbyRK6jF1YaIkL
 E1kIK+f+hMAdAicfTbCRpa//PRNo1gqmMgex84Csuk7ee/H88bIWixhXbf+II68tzgDr
 +Y1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=hEmn41e48jqvaiXw5xLaWp2S+l0O2jS39TBL03MNI00=;
 b=XKulUREx/Vpw4SxD4Mp4VEn1gfHk/HVc1phTlCx9b925oCu/WW+2OkfCxRb8W+Zi4d
 MoXVafwruLSAwdEhsOfCq175+vnfQs0PedCaaJ6Sf93TyPVtoOnHtMc9yzFhp7PdF69A
 B93Mp8MT850QIHr5n9Y/uKvt2gLjv2W0Q9Y/8MqUxfE6vIFa0Wt83A6j3P4WKp552OHG
 n66oB45ojonu3717sUOhVsog4nqc3pAK4Hbw0Tql4vHC1cvhTFhyuNd5ImbRShrZK3jX
 vMoB/bjiiFcIuOHo8EB/gsB9BNfsMNVb5fOzw+a3tMNQxcJPgy06h/D34A7pC0qEmCXr
 Z8MQ==
X-Gm-Message-State: ANhLgQ38g7fTSr7UaflIa5fAbEymGzgFiOvQooF+yM001fQD7J7ZKgrz
 QuJxUCAS8BdM2Rgx+ap/e+qrCQ==
X-Google-Smtp-Source: ADFU+vuSIPxQ2tXAem/Xsf3GS6Qs55Yq15VaQJIudTFkEtog7LxN1oleC+jlmpa06uPiU5W3lvjDZw==
X-Received: by 2002:a05:6000:1212:: with SMTP id
 e18mr20630902wrx.371.1584373515410; 
 Mon, 16 Mar 2020 08:45:15 -0700 (PDT)
Received: from myrica ([2001:171b:226b:54a0:116c:c27a:3e7f:5eaf])
 by smtp.gmail.com with ESMTPSA id b12sm407322wro.66.2020.03.16.08.45.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Mar 2020 08:45:14 -0700 (PDT)
Date: Mon, 16 Mar 2020 16:45:07 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Joerg Roedel <joro@8bytes.org>
Subject: Re: [PATCH 05/15] iommu: Rename struct iommu_param to dev_iommu
Message-ID: <20200316154507.GF304669@myrica>
References: <20200310091229.29830-1-joro@8bytes.org>
 <20200310091229.29830-6-joro@8bytes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200310091229.29830-6-joro@8bytes.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200316_084517_182103_60AA478F 
X-CRM114-Status: GOOD (  18.71  )
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

On Tue, Mar 10, 2020 at 10:12:19AM +0100, Joerg Roedel wrote:
> From: Joerg Roedel <jroedel@suse.de>
> 
> The term dev_iommu aligns better with other existing structures and
> their accessor functions.
> 
> Tested-by: Will Deacon <will@kernel.org> # arm-smmu
> Signed-off-by: Joerg Roedel <jroedel@suse.de>

Reviewed-by: Jean-Philippe Brucker <jean-philippe@linaro.org>

> ---
>  drivers/iommu/iommu.c  | 28 ++++++++++++++--------------
>  include/linux/device.h |  6 +++---
>  include/linux/iommu.h  |  4 ++--
>  3 files changed, 19 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
> index 3e3528436e0b..beac2ef063dd 100644
> --- a/drivers/iommu/iommu.c
> +++ b/drivers/iommu/iommu.c
> @@ -152,9 +152,9 @@ void iommu_device_unregister(struct iommu_device *iommu)
>  }
>  EXPORT_SYMBOL_GPL(iommu_device_unregister);
>  
> -static struct iommu_param *iommu_get_dev_param(struct device *dev)
> +static struct dev_iommu *dev_iommu_get(struct device *dev)
>  {
> -	struct iommu_param *param = dev->iommu_param;
> +	struct dev_iommu *param = dev->iommu;
>  
>  	if (param)
>  		return param;
> @@ -164,14 +164,14 @@ static struct iommu_param *iommu_get_dev_param(struct device *dev)
>  		return NULL;
>  
>  	mutex_init(&param->lock);
> -	dev->iommu_param = param;
> +	dev->iommu = param;
>  	return param;
>  }
>  
> -static void iommu_free_dev_param(struct device *dev)
> +static void dev_iommu_free(struct device *dev)
>  {
> -	kfree(dev->iommu_param);
> -	dev->iommu_param = NULL;
> +	kfree(dev->iommu);
> +	dev->iommu = NULL;
>  }
>  
>  int iommu_probe_device(struct device *dev)
> @@ -183,7 +183,7 @@ int iommu_probe_device(struct device *dev)
>  	if (!ops)
>  		return -EINVAL;
>  
> -	if (!iommu_get_dev_param(dev))
> +	if (!dev_iommu_get(dev))
>  		return -ENOMEM;
>  
>  	if (!try_module_get(ops->owner)) {
> @@ -200,7 +200,7 @@ int iommu_probe_device(struct device *dev)
>  err_module_put:
>  	module_put(ops->owner);
>  err_free_dev_param:
> -	iommu_free_dev_param(dev);
> +	dev_iommu_free(dev);
>  	return ret;
>  }
>  
> @@ -211,9 +211,9 @@ void iommu_release_device(struct device *dev)
>  	if (dev->iommu_group)
>  		ops->remove_device(dev);
>  
> -	if (dev->iommu_param) {
> +	if (dev->iommu) {
>  		module_put(ops->owner);
> -		iommu_free_dev_param(dev);
> +		dev_iommu_free(dev);
>  	}
>  }
>  
> @@ -972,7 +972,7 @@ int iommu_register_device_fault_handler(struct device *dev,
>  					iommu_dev_fault_handler_t handler,
>  					void *data)
>  {
> -	struct iommu_param *param = dev->iommu_param;
> +	struct dev_iommu *param = dev->iommu;
>  	int ret = 0;
>  
>  	if (!param)
> @@ -1015,7 +1015,7 @@ EXPORT_SYMBOL_GPL(iommu_register_device_fault_handler);
>   */
>  int iommu_unregister_device_fault_handler(struct device *dev)
>  {
> -	struct iommu_param *param = dev->iommu_param;
> +	struct dev_iommu *param = dev->iommu;
>  	int ret = 0;
>  
>  	if (!param)
> @@ -1055,7 +1055,7 @@ EXPORT_SYMBOL_GPL(iommu_unregister_device_fault_handler);
>   */
>  int iommu_report_device_fault(struct device *dev, struct iommu_fault_event *evt)
>  {
> -	struct iommu_param *param = dev->iommu_param;
> +	struct dev_iommu *param = dev->iommu;
>  	struct iommu_fault_event *evt_pending = NULL;
>  	struct iommu_fault_param *fparam;
>  	int ret = 0;
> @@ -1104,7 +1104,7 @@ int iommu_page_response(struct device *dev,
>  	int ret = -EINVAL;
>  	struct iommu_fault_event *evt;
>  	struct iommu_fault_page_request *prm;
> -	struct iommu_param *param = dev->iommu_param;
> +	struct dev_iommu *param = dev->iommu;
>  	struct iommu_domain *domain = iommu_get_domain_for_dev(dev);
>  
>  	if (!domain || !domain->ops->page_response)
> diff --git a/include/linux/device.h b/include/linux/device.h
> index fa04dfd22bbc..405a8f11bec1 100644
> --- a/include/linux/device.h
> +++ b/include/linux/device.h
> @@ -44,7 +44,7 @@ struct iommu_ops;
>  struct iommu_group;
>  struct iommu_fwspec;
>  struct dev_pin_info;
> -struct iommu_param;
> +struct dev_iommu;
>  
>  /**
>   * struct subsys_interface - interfaces to device functions
> @@ -514,7 +514,7 @@ struct dev_links_info {
>   * 		device (i.e. the bus driver that discovered the device).
>   * @iommu_group: IOMMU group the device belongs to.
>   * @iommu_fwspec: IOMMU-specific properties supplied by firmware.
> - * @iommu_param: Per device generic IOMMU runtime data
> + * @iommu:	Per device generic IOMMU runtime data
>   *
>   * @offline_disabled: If set, the device is permanently online.
>   * @offline:	Set after successful invocation of bus type's .offline().
> @@ -614,7 +614,7 @@ struct device {
>  	void	(*release)(struct device *dev);
>  	struct iommu_group	*iommu_group;
>  	struct iommu_fwspec	*iommu_fwspec;
> -	struct iommu_param	*iommu_param;
> +	struct dev_iommu	*iommu;
>  
>  	bool			offline_disabled:1;
>  	bool			offline:1;
> diff --git a/include/linux/iommu.h b/include/linux/iommu.h
> index 3c4ca041d7a2..1c9fa5c1174b 100644
> --- a/include/linux/iommu.h
> +++ b/include/linux/iommu.h
> @@ -365,7 +365,7 @@ struct iommu_fault_param {
>  };
>  
>  /**
> - * struct iommu_param - collection of per-device IOMMU data
> + * struct dev_iommu - Collection of per-device IOMMU data
>   *
>   * @fault_param: IOMMU detected device fault reporting data
>   *
> @@ -373,7 +373,7 @@ struct iommu_fault_param {
>   *	struct iommu_group	*iommu_group;
>   *	struct iommu_fwspec	*iommu_fwspec;
>   */
> -struct iommu_param {
> +struct dev_iommu {
>  	struct mutex lock;
>  	struct iommu_fault_param *fault_param;
>  };
> -- 
> 2.17.1
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
