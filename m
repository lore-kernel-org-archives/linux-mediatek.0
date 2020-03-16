Return-Path: <SRS0=xc+O=5B=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37928C0044D
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Mar 2020 15:42:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0AAD620663
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Mar 2020 15:42:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QZ5OtWys";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SuBjR7SX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0AAD620663
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BypAubKLcvV8/m+eHB66p6Bnrc0yJ6zZalVCbtdEh0A=; b=QZ5OtWysENhMuY
	9citwHWE7Y0TwtAjz9sFnoPYmkMZoBgwbAbNuQ8sIPrJkGT3UF9WOnqwKQtA4S7yFSEZ8NNpWECpG
	4y93TUOSeum00UndmKQveW4Xl83xszvLgiB6GDAnKALUvU7cc+Qli/o5Bf+B7rud0Jhdm+7dgBcUZ
	HRU1alz9YtZJkAjOlV/BR41334eutUWB/sU6Aq+m+3yaQyNB6NZGvqyuON/KtHdRY9eze0jKXL21d
	XrQSB0pOrqxlzi77njEDwCzGCu2OU6JF++vLmObK4I5GkNaWckvrFGC4d4aVUWz2TXfjwKEuWldVl
	wbbf+d0ahAKk8g7wxm9A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jDrsi-0008Q9-TU; Mon, 16 Mar 2020 15:42:20 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jDrsg-0008Pm-IC
 for linux-mediatek@lists.infradead.org; Mon, 16 Mar 2020 15:42:19 +0000
Received: by mail-wr1-x441.google.com with SMTP id a25so21838282wrd.0
 for <linux-mediatek@lists.infradead.org>; Mon, 16 Mar 2020 08:42:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=EuH2JuinWmp99M5kgpRBVbGMWPMpSteTL2l8ALHXOxA=;
 b=SuBjR7SXVaKqCALkd1H8UtvNwExNZJ6zJgrMM6mOmR/V8duV2z/Ny/rgwl/ICWYmHv
 RWBK+M3PyiJlb3+IMItQHsDQF5jSLhvuAHwNcv6LMVHk4wOfYJKCJcuzotqrz3dAGYH1
 ZoMfxYPhj1aGisNVytbbz16FGd19F/GLWWKqmyz5QVUWCH852OZkHrnPPIWPrqC4neyS
 a7v3wobNSSlJVCWjnzCdEU/vJKwAqNo9QlJDdZZzhe6JJt9HI/Adz/aIlbUVRlVc5+r/
 Wh3K+T1U8mRgzEN73lsQyDrC/jgt58bTBPttxWkvcuF/uHNDyFjl6FzCmQvD6Dy4PO5f
 8Mtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=EuH2JuinWmp99M5kgpRBVbGMWPMpSteTL2l8ALHXOxA=;
 b=MLJFmZmSmN5hS5BM44SvLfgmhXrg+/fqE50G/T7eQbDe6ykfKPgBpPvxD1bOijPCy5
 6d3JVWR+7G7tOxzROmKXae4xBkHfYDyDTmkL3JW1kMbJjrWDFCc9+OY13Gtswy4jIRfZ
 r0FG4CuE/9KF+0EkWxBUyfVmMKB2oxde24+/cX5fvNXmlIYRNU3OEzvLlE3P9Ouk0NLx
 YmaMh9yUx5dZnVOQPvK0jsJ5btdEdqyc1FeXfYKM482m2H+apTHFydMsp8SMVM3DhGId
 YEK/rw5mu5/Gptf5sj2q4ifN6U2ah2B92iJGNK0M6l+qx20spjwH+lrP6YOGQIKdYwz3
 wXSA==
X-Gm-Message-State: ANhLgQ32a8oLCLV4m2WPI8pdvzLe0g5/4MB5mnGrH3qze4oipwjXKJWO
 KEkIZ7A3X5A+7oRdtvO0Bvf65g==
X-Google-Smtp-Source: ADFU+vtvdsyytNA9HXn2kU8Gc/Wj/vUyTOW35SEjh5aHAlAPKupONXAmkHYxA+n8rH6jwZStjuAuGg==
X-Received: by 2002:adf:9e8b:: with SMTP id a11mr9088wrf.32.1584373337353;
 Mon, 16 Mar 2020 08:42:17 -0700 (PDT)
Received: from myrica ([2001:171b:226b:54a0:116c:c27a:3e7f:5eaf])
 by smtp.gmail.com with ESMTPSA id y80sm85174wmc.45.2020.03.16.08.42.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Mar 2020 08:42:16 -0700 (PDT)
Date: Mon, 16 Mar 2020 16:42:09 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Joerg Roedel <joro@8bytes.org>
Subject: Re: [PATCH 03/15] drm/msm/mdp5: Remove direct access of
 dev->iommu_fwspec
Message-ID: <20200316154209.GD304669@myrica>
References: <20200310091229.29830-1-joro@8bytes.org>
 <20200310091229.29830-4-joro@8bytes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200310091229.29830-4-joro@8bytes.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200316_084218_608462_3856AA0F 
X-CRM114-Status: GOOD (  13.30  )
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

On Tue, Mar 10, 2020 at 10:12:17AM +0100, Joerg Roedel wrote:
> From: Joerg Roedel <jroedel@suse.de>
> 
> Use the accessor functions instead of directly dereferencing
> dev->iommu_fwspec.
> 
> Signed-off-by: Joerg Roedel <jroedel@suse.de>

Reviewed-by: Jean-Philippe Brucker <jean-philippe@linaro.org>

> ---
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> index e43ecd4be10a..1252e1d76340 100644
> --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> @@ -725,7 +725,7 @@ struct msm_kms *mdp5_kms_init(struct drm_device *dev)
>  
>  	if (config->platform.iommu) {
>  		iommu_dev = &pdev->dev;
> -		if (!iommu_dev->iommu_fwspec)
> +		if (!dev_iommu_fwspec_get(iommu_dev))
>  			iommu_dev = iommu_dev->parent;
>  
>  		aspace = msm_gem_address_space_create(iommu_dev,
> -- 
> 2.17.1
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
