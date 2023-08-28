Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA9C2C83F12
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Aug 2023 20:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+t/Lz/vXdxan4gWAx5JpBxkfpmp+HTpE+g34pRpgzeA=; b=V7n0RoK4R2sdFilISef+h4O2Dt
	DOeHDIU2tYH0Ea0/ibOZOZEaTpjz87K+xczkz5tf1TjBF7RZ9qBOvRkNaKu1kQea6fr6tR7I56cP7
	E1Yyqco4U//kNDOxFJTTCg6JuIPY/9NK3qSq19vbnHKmDtu+n9TalOrVojUXwXh7D1BYtmuDQ3Com
	ulKkAQqfXz4dIV/oVftx7+DoQGENY6rhnTdwlxdRuBVx6WFn2ukGFLjkLaMf4CFvwxtxv4xP0iXcg
	SayppYmhzlMkhs+m96yb4o+WfY6msZV8Sl/ADTS0Be2ch8/oWFpZGtXaB8M2prpf0AY5HTV8Jd6qD
	COdluy4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qaiWh-00AD4Y-1Y;
	Mon, 28 Aug 2023 20:07:55 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qaiWf-00AD3Z-1K
	for linux-mediatek@lists.infradead.org;
	Mon, 28 Aug 2023 20:07:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693253271;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+t/Lz/vXdxan4gWAx5JpBxkfpmp+HTpE+g34pRpgzeA=;
	b=Euisny/oO4LzNw8wgSWAPAy22e5R3D8IPIZud3Va5oB81P3WRiqngaZJ+oNt/UkOCck++8
	Ebh+aa1xqGP/ZU2aVOGDv9c44OHXOIVRE/2aZUC/G6GvW4nCk4qNY8DuOnOEMD1zBs7yPt
	WqlKjTdIewpQJYAhuOeYfJyAztHq97o=
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com
 [209.85.222.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-422-BmOaN6j0POay8K6ZEs7LCA-1; Mon, 28 Aug 2023 16:07:39 -0400
X-MC-Unique: BmOaN6j0POay8K6ZEs7LCA-1
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-7a01ecba96fso1387611241.3
        for <linux-mediatek@lists.infradead.org>; Mon, 28 Aug 2023 13:07:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693253250; x=1693858050;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+t/Lz/vXdxan4gWAx5JpBxkfpmp+HTpE+g34pRpgzeA=;
        b=jOTZdx51Qsnb4cfeJkwv844Zy/VkTpgP9BF5qO7apmeqKodIldUWtt0yUDdrje8OoX
         rISfr/MF62XNC9Y3G14J6bmohFjwWpBOcvC34h+3sLrgNcx60rbQ+Yk4YNAIwZEb0q46
         VIUeLPWNEnblV/j9drjru2nHW/+PWZpYgAdwMuQKDJ6h7noPrNsTT4uB7sqBd7VrAJsw
         b2vGUdgw8frwukPWovsWVcGhs70DYrfMaEVMWGwxRPcVqtW7unxYvCrh16FV1LSyaRCQ
         haLvWkzJvV0UN0sPZnd2lD9XScYjqUuMCltVo47VgIYeFoh1Ghrt9txI9yYr3tB5Dqry
         my1g==
X-Gm-Message-State: AOJu0YzjnLUBhrWe0XcbMQny+wFqudndNp080CigNfurFzWj9BVxAO0C
	DwQ3dSuo40wQtx4LvU0YLZ4cK0EgGg1oRvfDC6yiVedVe2naaO1lKteS4lnupDwpheXonbHODih
	0fILvfnGM2mhntZRw9JbWg78/c/+EBD01
X-Received: by 2002:a05:6102:d89:b0:44e:b396:419d with SMTP id d9-20020a0561020d8900b0044eb396419dmr6899842vst.3.1693253250505;
        Mon, 28 Aug 2023 13:07:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGvQrHN5P8TUioFwnH2DuKJFINn3O8GiLCiK+L04RR+CJ1jziXQavUqdv+merrihDaRe7h1tw==
X-Received: by 2002:a05:6102:d89:b0:44e:b396:419d with SMTP id d9-20020a0561020d8900b0044eb396419dmr6899781vst.3.1693253250162;
        Mon, 28 Aug 2023 13:07:30 -0700 (PDT)
Received: from localhost (ip98-179-76-75.ph.ph.cox.net. [98.179.76.75])
        by smtp.gmail.com with ESMTPSA id y3-20020a37e303000000b0076c8fd39407sm2344737qki.113.2023.08.28.13.07.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Aug 2023 13:07:29 -0700 (PDT)
Date: Mon, 28 Aug 2023 13:07:28 -0700
From: Jerry Snitselaar <jsnitsel@redhat.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Andy Gross <agross@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Bjorn Andersson <andersson@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, 
	Heiko Stuebner <heiko@sntech.de>, iommu@lists.linux.dev, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Joerg Roedel <joro@8bytes.org>, 
	Kevin Tian <kevin.tian@intel.com>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-s390@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
	Russell King <linux@armlinux.org.uk>, linuxppc-dev@lists.ozlabs.org, 
	Matthias Brugger <matthias.bgg@gmail.com>, Matthew Rosato <mjrosato@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Orson Zhai <orsonzhai@gmail.com>, Rob Clark <robdclark@gmail.com>, 
	Robin Murphy <robin.murphy@arm.com>, Samuel Holland <samuel@sholland.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Krishna Reddy <vdumpa@nvidia.com>, Chen-Yu Tsai <wens@csie.org>, 
	Will Deacon <will@kernel.org>, Yong Wu <yong.wu@mediatek.com>, 
	Chunyan Zhang <zhang.lyra@gmail.com>, Lu Baolu <baolu.lu@linux.intel.com>, 
	Dmitry Osipenko <digetx@gmail.com>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Nicolin Chen <nicolinc@nvidia.com>, Niklas Schnelle <schnelle@linux.ibm.com>, 
	Steven Price <steven.price@arm.com>, Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH v7 09/24] iommu: Allow an IDENTITY domain as the
 default_domain in ARM32
Message-ID: <qovs7txfhvtbfvc6un6albkxy6x6ytmnowqcgh6wt2fgbmvhto@2unjmfnnbqfh>
References: <0-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
 <9-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <9-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230828_130753_527905_464906AB 
X-CRM114-Status: GOOD (  26.72  )
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

On Wed, Aug 23, 2023 at 01:47:23PM -0300, Jason Gunthorpe wrote:
> Even though dma-iommu.c and CONFIG_ARM_DMA_USE_IOMMU do approximately the
> same stuff, the way they relate to the IOMMU core is quiet different.
> 
> dma-iommu.c expects the core code to setup an UNMANAGED domain (of type
> IOMMU_DOMAIN_DMA) and then configures itself to use that domain. This
> becomes the default_domain for the group.
> 
> ARM_DMA_USE_IOMMU does not use the default_domain, instead it directly
> allocates an UNMANAGED domain and operates it just like an external
> driver. In this case group->default_domain is NULL.
> 
> If the driver provides a global static identity_domain then automatically
> use it as the default_domain when in ARM_DMA_USE_IOMMU mode.
> 
> This allows drivers that implemented default_domain == NULL as an IDENTITY
> translation to trivially get a properly labeled non-NULL default_domain on
> ARM32 configs.
> 
> With this arrangment when ARM_DMA_USE_IOMMU wants to disconnect from the
> device the normal detach_domain flow will restore the IDENTITY domain as
> the default domain. Overall this makes attach_dev() of the IDENTITY domain
> called in the same places as detach_dev().
> 
> This effectively migrates these drivers to default_domain mode. For
> drivers that support ARM64 they will gain support for the IDENTITY
> translation mode for the dma_api and behave in a uniform way.
> 
> Drivers use this by setting ops->identity_domain to a static singleton
> iommu_domain that implements the identity attach. If the core detects
> ARM_DMA_USE_IOMMU mode then it automatically attaches the IDENTITY domain
> during probe.
> 
> Drivers can continue to prevent the use of DMA translation by returning
> IOMMU_DOMAIN_IDENTITY from def_domain_type, this will completely prevent
> IOMMU_DMA from running but will not impact ARM_DMA_USE_IOMMU.
> 
> This allows removing the set_platform_dma_ops() from every remaining
> driver.
> 
> Remove the set_platform_dma_ops from rockchip and mkt_v1 as all it does
> is set an existing global static identity domain. mkt_v1 does not support
> IOMMU_DOMAIN_DMA and it does not compile on ARM64 so this transformation
> is safe.
> 
> Tested-by: Steven Price <steven.price@arm.com>
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Tested-by: Nicolin Chen <nicolinc@nvidia.com>
> Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  drivers/iommu/iommu.c          | 21 ++++++++++++++++++++-
>  drivers/iommu/mtk_iommu_v1.c   | 12 ------------
>  drivers/iommu/rockchip-iommu.c | 10 ----------
>  3 files changed, 20 insertions(+), 23 deletions(-)
> 

Reviewed-by: Jerry Snitselaar <jsnitsel@redhat.com>


