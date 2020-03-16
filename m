Return-Path: <SRS0=xc+O=5B=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DD4FC0044D
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Mar 2020 15:39:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E5CA320679
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Mar 2020 15:39:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oINTfePl";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VjUfHswC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E5CA320679
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+AABQ9KsK/Wg26EduSfk9kmkqcvcja6hIdLlxuBkFAM=; b=oINTfePlEMTZ29
	z3jD7ZN7F6nr1uCYiyRnnWkPaEJU7Lcn7S1WkDwX9FTpd5f79lk20rtV7LUMNncFk5VJ9Q2Y9T+yk
	OWY5H2iMQCZqZe+j7PHp43GVTsJBBNkVXaEtRxpn0wSegb0qMhN5oXtGaqTSGll32jw4BcDh7rZF4
	Nf5QeIC3hqgQVQw5/Rn9WZ2GQ0HP7dXs8JPSWi4J7iSmyHuvlMh4z8sLSK+Ei/naniLHW92aaWF24
	gUdPCCLKdjhCE7d5LhqkbPJvkkE3gxVesznAxib8kP/B3uItK5kr9soDeYH3USO+MTbc+GDl8njf+
	mH3A2LhLlD3YLHEODj5A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jDrq8-0006P3-Vu; Mon, 16 Mar 2020 15:39:41 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jDrpv-0006BH-MZ
 for linux-mediatek@lists.infradead.org; Mon, 16 Mar 2020 15:39:29 +0000
Received: by mail-wr1-x443.google.com with SMTP id z15so21794504wrl.1
 for <linux-mediatek@lists.infradead.org>; Mon, 16 Mar 2020 08:39:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Q0yzkSCm1Xcsm6hOYYsbTqS4amhDbi797Ag8RmkjurU=;
 b=VjUfHswCT1UKNAujAPhK8VCtliVrWtYIYyppBsAtlnbFCrxaad4Uc2A5soRvyi8Lz/
 SqPfxSFRDIQCzDyvLFNz52fC+JJkBauYJCclNDsvmtzidrUQROIsVQV6zcwzj00LmPWd
 He65rfdf7A/Oc+IFkmPIIFP2thDMmrP7w+MUVZbhd7yiRPnRF5U7lNWsW24hYJVoJYeR
 8wHBvHBpk9d8ZmoBo1s6yLkrnEqIRgPQmKuMyjkvlD33ynh0mEfoeYi9XfpNu36ky7nN
 jntyaqHoGFn/okVfozaKqLoYwnG4+U3ZIqhxZ9ETSHCiCMC6Iw7WS6sjUwRs0+vfP+X7
 +bQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Q0yzkSCm1Xcsm6hOYYsbTqS4amhDbi797Ag8RmkjurU=;
 b=loRM+8sfIfqSSv+8rREJCHZ871URAyyYwuxjN0FUFS63gxAUoU0HRw7izN2aerH44u
 8zSbmNU3JVqQDIoiQjcnjZoVR9jO5TkqeANZhnWusZ0XtNBypslP8e/F4dch+VM+vjVF
 ieRyS0Pl1EaP1XijgSZDrtzgyATCnUDVT7L6bd+zy0f9MM+Iurk6qiadHI1EcA+VKEzM
 8DYnpSR4CgF4PEp7nfHjXJUtcNVqgJm9o5MnRcDJ4MCUVUG1tkpEr6I8tEjkuz8BGadu
 Mp3eoeIITSWlcHtdVsotiVqk5V2wW3/dJFU766XkIF2W4kIXRHinwdbCrX1boGsrdCg3
 Lwuw==
X-Gm-Message-State: ANhLgQ3AUssJ6EYzRk2aoYAiNf7UAFWO54hveZlW3ntw2aBzr/Ewv/mG
 0xBeXy83+k5juntlQn6hJUt4ng==
X-Google-Smtp-Source: ADFU+vs0mvRenL1g+U69U0qbNtFq1SVNLFNkkOGefFPc2C+th0hGKZ/JyHhYDuRn/eeS5wXEeUsB/Q==
X-Received: by 2002:adf:d4ce:: with SMTP id w14mr26159791wrk.101.1584373164974; 
 Mon, 16 Mar 2020 08:39:24 -0700 (PDT)
Received: from myrica ([2001:171b:226b:54a0:116c:c27a:3e7f:5eaf])
 by smtp.gmail.com with ESMTPSA id 19sm143446wma.3.2020.03.16.08.39.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Mar 2020 08:39:24 -0700 (PDT)
Date: Mon, 16 Mar 2020 16:39:16 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Joerg Roedel <joro@8bytes.org>
Subject: Re: [PATCH 01/15] iommu: Define dev_iommu_fwspec_get() for
 !CONFIG_IOMMU_API
Message-ID: <20200316153916.GB304669@myrica>
References: <20200310091229.29830-1-joro@8bytes.org>
 <20200310091229.29830-2-joro@8bytes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200310091229.29830-2-joro@8bytes.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200316_083927_791497_A8E9955E 
X-CRM114-Status: GOOD (  13.44  )
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

On Tue, Mar 10, 2020 at 10:12:15AM +0100, Joerg Roedel wrote:
> From: Joerg Roedel <jroedel@suse.de>
> 
> There are users outside of the IOMMU code that need to call that
> function. Define it for !CONFIG_IOMMU_API too so that compilation does
> not break.
> 
> Reported-by: kbuild test robot <lkp@intel.com>
> Signed-off-by: Joerg Roedel <jroedel@suse.de>

Reviewed-by: Jean-Philippe Brucker <jean-philippe@linaro.org>

As a result drivers/gpu/host1x/hw/channel_hw.c and
drivers/gpu/drm/tegra/vic.c can lose their #ifdef CONFIG_IOMMU_API

> ---
>  include/linux/iommu.h | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/include/linux/iommu.h b/include/linux/iommu.h
> index d1b5f4d98569..3c4ca041d7a2 100644
> --- a/include/linux/iommu.h
> +++ b/include/linux/iommu.h
> @@ -1073,6 +1073,10 @@ static inline int iommu_sva_unbind_gpasid(struct iommu_domain *domain,
>  	return -ENODEV;
>  }
>  
> +static inline struct iommu_fwspec *dev_iommu_fwspec_get(struct device *dev)
> +{
> +	return NULL;
> +}
>  #endif /* CONFIG_IOMMU_API */
>  
>  #ifdef CONFIG_IOMMU_DEBUGFS
> -- 
> 2.17.1
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
