Return-Path: <SRS0=xc+O=5B=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70783C0044D
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Mar 2020 15:52:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 424A72051A
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Mar 2020 15:52:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TCjmOHJE";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yl6bstE+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 424A72051A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SSubOHgxJcJM0vROLhjdhCfgAH+5yE+Zjr/bJv9Wf/Q=; b=TCjmOHJEF3cwlA
	P2mSFhwl99XJ6ag7BqUeeLh8BscIh0RlhacPirBNc1iR6dV9xetQpqpTniRQMDLUtL164D1loGutv
	I2mcsDoMIQGqVrut6XIq/tb6HfY0suRQbGYT4y6EKAMxZ2J7zvspHO5c3oEty25NlH6owhx2uPAKg
	c7TuGBlcaxVGtX7Xb8pO0h5gjH+IG5ity6CEQ0QLr4hX3PwqUw0MZL+lAgvBPaSPtd+gw1BMpzY2X
	SfhoCRJs/9UyYZEO+70X71AnFhmgzYAtTrMtLGR0dlsnKdYeXNJl7fTdgnMy8g8ofi7JRKdcygtbW
	TJo/fxYxdOP4HT/L63uw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jDs2d-00057c-G6; Mon, 16 Mar 2020 15:52:35 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jDs2a-00057B-Gf
 for linux-mediatek@lists.infradead.org; Mon, 16 Mar 2020 15:52:33 +0000
Received: by mail-wr1-x441.google.com with SMTP id b2so15632746wrj.10
 for <linux-mediatek@lists.infradead.org>; Mon, 16 Mar 2020 08:52:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=CQWUEVlXfznSczAKyGpDi3T2t4zubClSxzSzuBgyOmY=;
 b=yl6bstE+aSegQ4PSIZwfpkI4xv5zEpFCHJTeJOmkwQSJ+I34mLp8AxYTWZ9rJT3sc2
 lfVn74R8N/A5/RlriKIwFzgnhIdRpYphZB/RGS2V7TiOu9jBnvyS/vVHkhpcG/UCkclI
 /Xe8pirR3stVSJMCZatixqgD5qeqsOrizxVPTp5NmPJGHiiNFTlr2SrOO2kgOC4/0W9m
 TaePqXQ0F0j8GjfwG6eC/pF625lANh0WVdHPpEVzOMwvBPZshj8wKu9LXxVj1/SPB9LL
 CEn13SHypRSkWd4ThtiGgPM4UZhcVfHP1IHQBtjQSqNt8bUgTV5XgO5/lnNRElqlP+4y
 Bdeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=CQWUEVlXfznSczAKyGpDi3T2t4zubClSxzSzuBgyOmY=;
 b=hYIL9aB09gC2a5PiTFPJDVjCkMktrPzbztTa1W2cVBy4M/AnxFPh8vvpJ75OGSFIUt
 YHyw6NWckoWt0f/ALPT78Tt6QKuCxRSi5OgMn/3fb2i6/wt2Jv67wmDKsc616aFwNGnl
 4hGHfeo2qaZmFV126vwpCI3De79DTVXlWz98ieFVwlwPrJ8T4YjOn8nf11yKpMUrCCEP
 2EQkbDv7Hz2y2MDG5ezcMGxm6MJGYXtns0QL3ctWyXRFSXEce7/funbiMQ2TVhR3pnoZ
 vVZ0zp3ymYbbDhxKtRqumUoS9Wunrt6A3Xm3Fdhc2Bl4EQjTmmi92hmUr985qTSAEVT6
 nM2Q==
X-Gm-Message-State: ANhLgQ0v6YrmZYuG1h2oQMCs9Cixvv3P5GrTjFZOjKzEr791uCL4TMkN
 wr7P1zGWJFzZWohPsiNbXIQb8A==
X-Google-Smtp-Source: ADFU+vttr8+4jXiTPQnlMs6N4KDj9oq3qIoO+BGp44KMN8sfSjRCTINbImPpFYK6LbM8TzaWqB/nSA==
X-Received: by 2002:adf:f289:: with SMTP id k9mr37838wro.220.1584373951194;
 Mon, 16 Mar 2020 08:52:31 -0700 (PDT)
Received: from myrica ([2001:171b:226b:54a0:116c:c27a:3e7f:5eaf])
 by smtp.gmail.com with ESMTPSA id t1sm509263wrq.36.2020.03.16.08.52.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Mar 2020 08:52:30 -0700 (PDT)
Date: Mon, 16 Mar 2020 16:52:23 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Joerg Roedel <joro@8bytes.org>
Subject: Re: [PATCH 13/15] iommu/qcom: Use accessor functions for iommu
 private data
Message-ID: <20200316155223.GM304669@myrica>
References: <20200310091229.29830-1-joro@8bytes.org>
 <20200310091229.29830-14-joro@8bytes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200310091229.29830-14-joro@8bytes.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200316_085232_563068_1678B9E5 
X-CRM114-Status: GOOD (  15.81  )
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

On Tue, Mar 10, 2020 at 10:12:27AM +0100, Joerg Roedel wrote:
> From: Joerg Roedel <jroedel@suse.de>
> 
> Make use of dev_iommu_priv_set/get() functions.
> 
> Signed-off-by: Joerg Roedel <jroedel@suse.de>
> ---
>  drivers/iommu/qcom_iommu.c | 61 ++++++++++++++++++++++----------------
>  1 file changed, 36 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/iommu/qcom_iommu.c b/drivers/iommu/qcom_iommu.c
> index 4328da0b0a9f..80147f82d427 100644
> --- a/drivers/iommu/qcom_iommu.c
> +++ b/drivers/iommu/qcom_iommu.c
> @@ -74,16 +74,19 @@ static struct qcom_iommu_domain *to_qcom_iommu_domain(struct iommu_domain *dom)
>  
>  static const struct iommu_ops qcom_iommu_ops;
>  
> -static struct qcom_iommu_dev * to_iommu(struct iommu_fwspec *fwspec)
> +static struct qcom_iommu_dev * to_iommu(struct device *dev)
>  {
> +	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
> +
>  	if (!fwspec || fwspec->ops != &qcom_iommu_ops)
>  		return NULL;

Following other drivers, I think this test could move to add_device() (and
remove_device()?), but this is probably good enough for now.

> -	return fwspec->iommu_priv;
> +
> +	return dev_iommu_priv_get(dev);
>  }
[...]
>  static int qcom_iommu_of_xlate(struct device *dev, struct of_phandle_args *args)
>  {
> -	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
>  	struct qcom_iommu_dev *qcom_iommu;
>  	struct platform_device *iommu_pdev;
>  	unsigned asid = args->args[0];
> @@ -583,14 +594,14 @@ static int qcom_iommu_of_xlate(struct device *dev, struct of_phandle_args *args)
>  	    WARN_ON(asid > qcom_iommu->num_ctxs))
>  		return -EINVAL;
>  
> -	if (!fwspec->iommu_priv) {
> -		fwspec->iommu_priv = qcom_iommu;
> +	if (dev_iommu_priv_get(dev)) {

Should be:

	if (!dev_iommu_priv_set(dev))

Thanks,
Jean

> +		dev_iommu_priv_set(dev, qcom_iommu);
>  	} else {
>  		/* make sure devices iommus dt node isn't referring to
>  		 * multiple different iommu devices.  Multiple context
>  		 * banks are ok, but multiple devices are not:
>  		 */
> -		if (WARN_ON(qcom_iommu != fwspec->iommu_priv))
> +		if (WARN_ON(qcom_iommu != dev_iommu_priv_get(dev)))
>  			return -EINVAL;
>  	}
>  
> -- 
> 2.17.1
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
