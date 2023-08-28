Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91700C83F11
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Aug 2023 23:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xTlRxnsNejmw67GltYX+utAoy4aZnJxgNkm5+nl9i5c=; b=z+FROiERf/jTdu26GYc+2kx/qK
	/PdPyHRUdC1unCGOdyXb2ww6+yvjfnhumHHVtjLuckSQ9kFr6eFi/WUXocF0f6spyHBie2zHxeOIx
	4DOlGc6cSqFnfG0eBZnYNl7CekAnOoZGp5uBJneHVdeFm1eWu523jMvBOpQ+AJ2aAqsSZbBn/P3A0
	tAa59pll8IVyN1ki4dbetqxo92fqjjx1iq61xQlGuQkY8HRqgkQGcFNkfMc9ECeDby0EYmvSBNLWp
	qyK7jYsrL2l4/QvpimW0VDn29Sj8tfUGtSLpewL+yB0wXExeWiiN1ksEhAoVjJkwldisjNI8cwfNB
	+8DQFj1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qalaf-00ARtk-2D;
	Mon, 28 Aug 2023 23:24:13 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qalab-00ARsL-2X
	for linux-mediatek@lists.infradead.org;
	Mon, 28 Aug 2023 23:24:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693265049;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xTlRxnsNejmw67GltYX+utAoy4aZnJxgNkm5+nl9i5c=;
	b=O/HXx6gOPAw1G0NNiFbc/YdRvh7EGUQUxRtboG8MWd4UOKmXDnyF/hQKi+jvq/aJK4qC2g
	EbyAaKqk6YvyiR/cWNvYNIHBPG87YLigExN57ckd/L7A3M1Lo/+X7eRxOmpERnTOThoGuz
	Rk1UHo7JtxuG6UIqEYUpnvOwlchKmkQ=
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-343-bzUI2uVeNPSLcWJbFng_1Q-1; Mon, 28 Aug 2023 19:24:07 -0400
X-MC-Unique: bzUI2uVeNPSLcWJbFng_1Q-1
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-563ab574cb5so2863865a12.1
        for <linux-mediatek@lists.infradead.org>; Mon, 28 Aug 2023 16:24:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693265046; x=1693869846;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xTlRxnsNejmw67GltYX+utAoy4aZnJxgNkm5+nl9i5c=;
        b=VdSI1uF3XyNEbEsPTFWMvrX+wEIXJJo0Omrf6BIT4jX9XH5u1oFSFnM270DbvBd6Is
         cswkLsNQnMLXTs3fBbzmQatU1IAbuWh1ZVJwFXNbAED6UWzv8s3x76e+5P0NoL1EhjOt
         WhqGjyjgyDcy84MnUfycUF/YYCb5SjIs31MEszKIaTwHuiSKzcQINhz/FIjF17NtBja5
         prtFukjsWrEoB5XqtjKtg9F34xqX4lwmrnk8PmGMGQBAZEV4aCm+3I8owXSsjnn1MYlE
         aLGKknFtoSUl6lLRHlY5MUGqKJFmJkkj46LjAtPTtMVgTinMYw0GpFyVzGAE0AKD1LGD
         GjEQ==
X-Gm-Message-State: AOJu0YysbS5MLWkqNqVOoUV8gf/RvnE5gW/loLuP7zbL95IaO0MxhvrI
	xca0zi6XjNX076QLvkD/aN/we4aOOCXSE+iEGT6fl1Oigc0lFKYFNsb6nTDR4Xwq5ixAslbcNtw
	9zAlZzZmPx8aVxA8lS8fgaZGLiqnxS/V2
X-Received: by 2002:a05:6a20:138f:b0:10c:7c72:bdf9 with SMTP id hn15-20020a056a20138f00b0010c7c72bdf9mr18329553pzc.29.1693265045860;
        Mon, 28 Aug 2023 16:24:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE8Ty56TNbGFuBUAvk0gJFhf9IoSXDvKLMofXm6bHW4BVTeieXHXsUmxMoZ3DKq2KwFtbABPg==
X-Received: by 2002:a05:6a20:138f:b0:10c:7c72:bdf9 with SMTP id hn15-20020a056a20138f00b0010c7c72bdf9mr18329511pzc.29.1693265045554;
        Mon, 28 Aug 2023 16:24:05 -0700 (PDT)
Received: from localhost (ip98-179-76-75.ph.ph.cox.net. [98.179.76.75])
        by smtp.gmail.com with ESMTPSA id v12-20020a170902b7cc00b001993a1fce7bsm7913930plz.196.2023.08.28.16.24.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Aug 2023 16:24:05 -0700 (PDT)
Date: Mon, 28 Aug 2023 16:24:04 -0700
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
Subject: Re: [PATCH v7 24/24] iommu: Convert remaining simple drivers to
 domain_alloc_paging()
Message-ID: <4pidxw6zc2sk2sypjdobusdrdbpwa7gddifxwnm2c2sdtfsp7t@yg3hup2mhpbr>
References: <0-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
 <24-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <24-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230828_162410_111977_61B57ED8 
X-CRM114-Status: GOOD (  16.48  )
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

On Wed, Aug 23, 2023 at 01:47:38PM -0300, Jason Gunthorpe wrote:
> These drivers don't support IOMMU_DOMAIN_DMA, so this commit effectively
> allows them to support that mode.
> 
> The prior work to require default_domains makes this safe because every
> one of these drivers is either compilation incompatible with dma-iommu.c,
> or already establishing a default_domain. In both cases alloc_domain()
> will never be called with IOMMU_DOMAIN_DMA for these drivers so it is safe
> to drop the test.
> 
> Removing these tests clarifies that the domain allocation path is only
> about the functionality of a paging domain and has nothing to do with
> policy of how the paging domain is used for UNMANAGED/DMA/DMA_FQ.
> 
> Tested-by: Niklas Schnelle <schnelle@linux.ibm.com>
> Tested-by: Steven Price <steven.price@arm.com>
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Tested-by: Nicolin Chen <nicolinc@nvidia.com>
> Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  drivers/iommu/msm_iommu.c    | 7 ++-----
>  drivers/iommu/mtk_iommu_v1.c | 7 ++-----
>  drivers/iommu/omap-iommu.c   | 7 ++-----
>  drivers/iommu/s390-iommu.c   | 7 ++-----
>  4 files changed, 8 insertions(+), 20 deletions(-)
> 

Reviewed-by: Jerry Snitselaar <jsnitsel@redhat.com>


