Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEDEAC32771
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Sep 2022 08:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NMm6vbupuNg3e8G1erinu7XgiIOmdNdtykV6wWBx/V8=; b=FW+KLJ02OcU3Qnzn4qdzJ+SfLd
	BFqKuPk0G6XJxhXqKRiowjzhyPAyeyxg+dbMSX2iRnYLi5nnAX4Br9OpB1AoVNnoAI5h4rMP54cj+
	av9LPwUqBaBL1Dta138KAQPeAu4Dn2+PYwsnXVCHDI9qsGpJUHxIo1IdeaYVAd0FTO6KGrhkZ36gi
	3kIV6MrPGpCRiNzIQvQKsjvXZAT1qjqgQGIDdN+2CaD1julZZnq0XXP2SQ8MP0iRm8ag+1/5Y/ltA
	Gd9z5FPt3CppLBlFTt1HNYhhtVY00j17tOfF5MnqN9FBUhkdo0FD7koJYx9u+1AUlNJ9fxrFAfV0i
	4Vt92Y1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oavWq-00A9sp-J5; Wed, 21 Sep 2022 08:56:24 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oavVg-00A9Mr-9m
	for linux-mediatek@lists.infradead.org; Wed, 21 Sep 2022 08:55:15 +0000
Received: by mail-wm1-x332.google.com with SMTP id az6so3921201wmb.4
        for <linux-mediatek@lists.infradead.org>; Wed, 21 Sep 2022 01:55:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=NMm6vbupuNg3e8G1erinu7XgiIOmdNdtykV6wWBx/V8=;
        b=cs5Dvxfm7fd7aaUwKHNDAnKWcNrqMyWvSpCFhYmNjRwKQjf697cP12ef2JVhzS+nTr
         rBiEPfFCAvK18V0b4TPU93sWl3nBICTtuO2MuXRVpLAsvrnPMrSMT8utfj6qRBivTxti
         BXRo7n7yiwy1VFEU65sNSMFb9wbJX0Y01wSWLKT5xxq4/13Ub6Q0C+MSyK+vNliqzKv7
         7DJIhCBeCbjUg+pZttjuEgYoPhQn5piUM0+uqu6ez9uuEzMnz+dnjzErRDjuyGOk/BYS
         UkhbQnQFMY8EjTuZOsOAEbzscpTOQfKIqXeSfDZd9sFya7VbVqAP+h8BvB+DFZ+Idka/
         wnnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=NMm6vbupuNg3e8G1erinu7XgiIOmdNdtykV6wWBx/V8=;
        b=0lPmDOIWwW83bLBwYW0FNuH06N5ezWgHdQvETdNV3sOLfjYz1EvDsmB/ZBCDW+y6dY
         3EbW/MiL9XBL0LKvPGaM3YO+NeNu+2EwaoksT02bJD0bEAbR0HK5yTeuIijbu+I6YtV3
         1Obs8ul925gxfK0iJqtwSbYrtby4Poa8zQIYXV8kQD5D2GCn+cKkcYgEGCETn6LSJx/a
         GHE1yya624+pvG1eJTfoJ9Y97L3XGLtjC8TDiYLfbeAXcforO+U/ogoLbTqhnebahIJ4
         NPuM/kU16pF5t5brBCZVSwL58NIW9NnKvXtMwK+NKe5gAgkag2Mp5PQgXscbTb3Y44Jw
         g9qQ==
X-Gm-Message-State: ACrzQf0rQP80mm/DsGLm7lsoJwtIW8WwrAbOo2c5DND4XJl2yj/k0c7f
	NGvO0u1tb+DzZD3sV3mkxkrNaQ==
X-Google-Smtp-Source: AMsMyM5v4ccQB/sVn2S/zJDFsH4keJ/VCqNp428gK8IV32RalM87u6d3xbyo/Rp+qs75y4SGFW5eBA==
X-Received: by 2002:a1c:202:0:b0:3a8:4197:eec0 with SMTP id 2-20020a1c0202000000b003a84197eec0mr5125375wmc.83.1663750506995;
        Wed, 21 Sep 2022 01:55:06 -0700 (PDT)
Received: from myrica (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net. [82.27.106.168])
        by smtp.gmail.com with ESMTPSA id p14-20020a5d48ce000000b0022afbd02c69sm1949060wrs.56.2022.09.21.01.55.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Sep 2022 01:55:06 -0700 (PDT)
Date: Wed, 21 Sep 2022 09:55:01 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: joro@8bytes.org, suravee.suthikulpanit@amd.com, will@kernel.org,
	robin.murphy@arm.com, robdclark@gmail.com, dwmw2@infradead.org,
	baolu.lu@linux.intel.com, agross@kernel.org,
	bjorn.andersson@linaro.org, matthias.bgg@gmail.com,
	orsonzhai@gmail.com, baolin.wang@linux.alibaba.com,
	zhang.lyra@gmail.com, sricharan@codeaurora.org, jgg@nvidia.com,
	kevin.tian@intel.com, konrad.dybcio@somainline.org,
	yong.wu@mediatek.com, thierry.reding@gmail.com, vdumpa@nvidia.com,
	jonathanh@nvidia.com, tglx@linutronix.de,
	shameerali.kolothum.thodi@huawei.com, christophe.jaillet@wanadoo.fr,
	thunder.leizhen@huawei.com, quic_saipraka@quicinc.com,
	jon@solid-run.com, yangyingliang@huawei.com, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-tegra@vger.kernel.org,
	virtualization@lists.linux-foundation.org
Subject: Re: [PATCH v4 0/6] Define EINVAL as device/domain incompatibility
Message-ID: <YyrRZXVWWxBhW3ST@myrica>
References: <cover.1663744983.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1663744983.git.nicolinc@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220921_015512_482166_93E062FD 
X-CRM114-Status: GOOD (  14.30  )
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

On Wed, Sep 21, 2022 at 01:22:31AM -0700, Nicolin Chen wrote:
> This series is to replace the previous EMEDIUMTYPE patch in a VFIO series:
> https://lore.kernel.org/kvm/Yxnt9uQTmbqul5lf@8bytes.org/
> 
> The purpose is to regulate all existing ->attach_dev callback functions to
> use EINVAL exclusively for an incompatibility error between a device and a
> domain. This allows VFIO and IOMMUFD to detect such a soft error, and then
> try a different domain with the same device.
[...]
>  drivers/iommu/amd/iommu.c                   | 12 +----
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 11 +---
>  drivers/iommu/arm/arm-smmu/arm-smmu.c       |  3 --
>  drivers/iommu/arm/arm-smmu/qcom_iommu.c     |  7 +--
>  drivers/iommu/fsl_pamu.c                    |  2 +-
>  drivers/iommu/fsl_pamu_domain.c             |  4 +-
>  drivers/iommu/intel/iommu.c                 | 10 ++--
>  drivers/iommu/intel/pasid.c                 |  6 ++-
>  drivers/iommu/iommu.c                       | 22 ++++++++
>  drivers/iommu/ipmmu-vmsa.c                  |  2 -
>  drivers/iommu/msm_iommu.c                   | 59 +++++++++++----------
>  drivers/iommu/mtk_iommu.c                   |  4 +-
>  drivers/iommu/omap-iommu.c                  |  6 +--
>  drivers/iommu/sprd-iommu.c                  |  4 +-
>  drivers/iommu/tegra-gart.c                  |  2 +-
>  drivers/iommu/virtio-iommu.c                |  7 ++-

For virtio-iommu:

Reviewed-by: Jean-Philippe Brucker <jean-philippe@linaro.org>

>  include/linux/iommu.h                       | 12 +++++
>  17 files changed, 90 insertions(+), 83 deletions(-)
> 
> -- 
> 2.17.1
> 

