Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58631C83F11
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Aug 2023 20:25:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0s9odd+rKCTI6ikiachNnQFGjcYGlZyEVlbrTzPdyIQ=; b=eCYnGeNRM6flKkZE6ce1HrSCca
	n56hjOR6niuiwELEykokKF+9P+t7F9XGcLYU+OxMK7f6EWN5I88Guz0szL6jHTuY3AepZBDFmyeNi
	BcGMe0Nh2Bm7PO6LtMuGZ2G97f9Pn8Cuy1dIQi+/GRtMCEYirmVDx4FvHA/nc8Zwi6smvMLziFVBn
	/9GGwKqysZtDD9nmHx7z0wAU8wSN74I7lmyiMV/32rqBgKpeTWcD1vYy0bEH6GsuVYltQedMnQUKS
	mEmQGijdvSHHOfCZi8LnJBRLWiVWdqwnFTZeA0kfqTCVwWEgt4p8+oRUs5zuX39K10TtUua9H5AdX
	x68jYWDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qaioA-00AEXN-0e;
	Mon, 28 Aug 2023 20:25:58 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qaio7-00AEWh-2s
	for linux-mediatek@lists.infradead.org;
	Mon, 28 Aug 2023 20:25:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693254355;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0s9odd+rKCTI6ikiachNnQFGjcYGlZyEVlbrTzPdyIQ=;
	b=Kv2QBpvSOoatKoDFgXcGUUVmV33pdrW05takVvS5elUSIr8kpZJD6ldQC3vAVxLh5FBtAd
	HO0LdxbJtwtFn0hUZ6Ue2vrO8c5oEsfMBXMb50TBtX83f9AezxKrZ2yrhgePLNhCioWhs9
	TwmdaHsZjBPearDc7zNWSZMw5f5MaAo=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-210-ln0J8HjdNVC8eI9P-lgfaA-1; Mon, 28 Aug 2023 16:25:53 -0400
X-MC-Unique: ln0J8HjdNVC8eI9P-lgfaA-1
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-76f1e2d6ea4so4329585a.1
        for <linux-mediatek@lists.infradead.org>; Mon, 28 Aug 2023 13:25:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693254353; x=1693859153;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0s9odd+rKCTI6ikiachNnQFGjcYGlZyEVlbrTzPdyIQ=;
        b=MNIyS+OsImHR7JIcA/DxnIquXzPYoRUv51jHkG6+zp74mRerh00rKr0UFIERG5LSiv
         7Wtbw7M/eyaEZZ4ku4B3GWGso62G/GTsYrJwsnRwqXKBDdjvZC1tNVwMUwkU3UNOAw1h
         zEp9Y48oUxPvi0DxgvMblKwpcl0NKLUMQ80l+TRsCJgF5WVQaDAxqWssGiIdhGyNCTl9
         3kQv1qhVTCTH/+mBpEmlO/JbVGxA2ZyL/uvs05WWYZLhR39Rl6fjjCloXTWo3+mCDllp
         6dW3cj2c38SuXj4qclcT112XZdjS6MO+87EJu2FtFGLiUWSwf/44oXOzypAPQ/GmBhDc
         HBBQ==
X-Gm-Message-State: AOJu0YyJFPrcs7K6zhbHn7+ZgthkMBzbbom7Fsm43pv5ZRifQhRRqHMt
	pCu4Q3ATd9b5GTow//zuJHAdcGLx3niA2Mc4OhZvm8mGDWZamSvgv0OhjXHJ+n8djAuTSQ+LTjM
	Y6xlaDF4cbSV2aJJhNA+qTCDPQ+hi2H7U
X-Received: by 2002:a05:620a:221:b0:76d:c63e:8e70 with SMTP id u1-20020a05620a022100b0076dc63e8e70mr14041516qkm.27.1693254353203;
        Mon, 28 Aug 2023 13:25:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF9O6FxP0inVTnVJ2vRf5VolLj9Ux6/2WGBYm17sZOw53hmRs71i9SgIXCArw27HMmN5iSTDg==
X-Received: by 2002:a05:620a:221:b0:76d:c63e:8e70 with SMTP id u1-20020a05620a022100b0076dc63e8e70mr14041474qkm.27.1693254352979;
        Mon, 28 Aug 2023 13:25:52 -0700 (PDT)
Received: from localhost (ip98-179-76-75.ph.ph.cox.net. [98.179.76.75])
        by smtp.gmail.com with ESMTPSA id o22-20020a05620a111600b0076816153dcdsm2613458qkk.106.2023.08.28.13.25.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Aug 2023 13:25:52 -0700 (PDT)
Date: Mon, 28 Aug 2023 13:25:51 -0700
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
Subject: Re: [PATCH v7 11/24] iommu/tegra-smmu: Implement an IDENTITY domain
Message-ID: <mqc777v7h4bpz5xgfcqjqig4zoo3ifobiyut4r43dghkxp3yl2@uyb72ermxszs>
References: <0-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
 <11-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <11-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230828_132556_020286_DDD9950D 
X-CRM114-Status: GOOD (  12.00  )
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

On Wed, Aug 23, 2023 at 01:47:25PM -0300, Jason Gunthorpe wrote:
> What tegra-smmu does during tegra_smmu_set_platform_dma() is actually
> putting the iommu into identity mode.
> 
> Move to the new core support for ARM_DMA_USE_IOMMU by defining
> ops->identity_domain.
> 
> Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  drivers/iommu/tegra-smmu.c | 37 ++++++++++++++++++++++++++++++++-----
>  1 file changed, 32 insertions(+), 5 deletions(-)
> 

Reviewed-by: Jerry Snitselaar <jsnitsel@redhat.com>


