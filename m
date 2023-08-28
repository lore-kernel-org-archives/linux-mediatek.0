Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7A75C71153
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Aug 2023 23:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NqA+se+NtJmo6VZ6Aa5eIZ0Mw7Oak0MLDxzh66FDHNk=; b=iMGxwE8G3ZMl0XibpQWPHqDX09
	CcVBpwArP+9pBerAKWoU34H5dWyvZsaE8Gua7ZsWmB8NdWK/lstM/rhmn4tOLc/RI6gh7vmhVIe0Z
	Bzv5VWNjO/XBlyaYhxnkb8WEkAHNzfUfDETteJi2GE7oBtF17H49yHkC5f79tWHU+dWYz5D/gMjkO
	1gAsfPVkV8C9RBsBdzsVWiD3KVelq8t/Wlp41GuBUDaGvV9RyDYZSwYn/UN1J6gZRsLDiXIXDXG5b
	ZmRAFRtpFukon77qlClsygjIXtcan/F7BvmWwr7jK/IOBdwzVxtpI9oIDRXsRYSp5iqFAIhl/LUU2
	MC/uy2DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qalV4-00ARPi-0Z;
	Mon, 28 Aug 2023 23:18:26 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qalV0-00AROT-37
	for linux-mediatek@lists.infradead.org;
	Mon, 28 Aug 2023 23:18:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693264701;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NqA+se+NtJmo6VZ6Aa5eIZ0Mw7Oak0MLDxzh66FDHNk=;
	b=d6xNKgjlS9CH+ZuDN2utM1wWpXH3ZlAI9xdkvTOfQIWcTqMw4skyDDlOOhYdAQb2p8cH3E
	HUuCIaRrcRI46Wy/wxnzsy+QF1nYctYE+NZzVopuwie0mEKBXe0xaW4PvPRsiGBaMrEWjs
	7s1JRMFM8lPK/cAnNEH/50XxrgwRQSs=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-21-7O2Pz8_6MNOymGx1z1KYYA-1; Mon, 28 Aug 2023 19:18:19 -0400
X-MC-Unique: 7O2Pz8_6MNOymGx1z1KYYA-1
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-1c1fe87fc29so1307575ad.0
        for <linux-mediatek@lists.infradead.org>; Mon, 28 Aug 2023 16:18:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693264698; x=1693869498;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NqA+se+NtJmo6VZ6Aa5eIZ0Mw7Oak0MLDxzh66FDHNk=;
        b=QQUzDVJ/EwJYOqcQOEnWyVtgan3OaaphccZ9m5EwACn7zT43U4K6NL/hHr/aLxv3cC
         NKXJVBo/6mpCci+x7v5rQWd+C3nLSXQbKiLcxDq0N1oaG6YGlQWlR86IGwqbe/a5OfmY
         wECKM5nqLboFbG/3803m9O2P5my0C3XQyKdmi6rr360uIyitw7CBFEG8NzXpON9fnDpP
         Ren8UwfN8cahqikTwJAaWFMmojRT1YeL6KRrED7Wr3PWQZXqsQupo4aYu046wTVMIJnN
         7FS6UD0LvLb5vTHdQ8LKbnD65k/AKg1QJNMNMA4ds6QLJ+jyJM7IX1xxBwFGWco9V7iF
         3KRA==
X-Gm-Message-State: AOJu0YysSIQuPqyokcMpafT1sn00WoO1mkEGl4fSDESc5x5BuTJFOnaz
	D+Iv+bGvUkA/Lp7FndCPXlAbf/6+aMh9lTFHBmDT2jZM6CA/hZzA5cSt/Z6JBeaXHExttUS/IFp
	qisFUQuOI5DseFG3LzGGyAqf5mHcp0tmS
X-Received: by 2002:a17:902:ea08:b0:1c0:a30e:2388 with SMTP id s8-20020a170902ea0800b001c0a30e2388mr17734014plg.31.1693264698542;
        Mon, 28 Aug 2023 16:18:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH4PLIDBi9wZuEsVkyH1S0PFnZ5haeuWus0luN/Yrn+a4DV04N4xayoEkUTdP5JJP349iuJ+Q==
X-Received: by 2002:a17:902:ea08:b0:1c0:a30e:2388 with SMTP id s8-20020a170902ea0800b001c0a30e2388mr17733983plg.31.1693264698231;
        Mon, 28 Aug 2023 16:18:18 -0700 (PDT)
Received: from localhost (ip98-179-76-75.ph.ph.cox.net. [98.179.76.75])
        by smtp.gmail.com with ESMTPSA id f11-20020a170902ce8b00b001b53953f306sm7947728plg.178.2023.08.28.16.18.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Aug 2023 16:18:17 -0700 (PDT)
Date: Mon, 28 Aug 2023 16:18:16 -0700
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
Subject: Re: [PATCH v7 22/24] iommu: Add ops->domain_alloc_paging()
Message-ID: <6wbamqxazr3yxu25haul2vcbyt5da5py4i2pemga77pg74knov@htfe53txxkzx>
References: <0-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
 <22-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <22-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230828_161823_106564_8FFE083F 
X-CRM114-Status: GOOD (  19.44  )
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

On Wed, Aug 23, 2023 at 01:47:36PM -0300, Jason Gunthorpe wrote:
> This callback requests the driver to create only a __IOMMU_DOMAIN_PAGING
> domain, so it saves a few lines in a lot of drivers needlessly checking
> the type.
> 
> More critically, this allows us to sweep out all the
> IOMMU_DOMAIN_UNMANAGED and IOMMU_DOMAIN_DMA checks from a lot of the
> drivers, simplifying what is going on in the code and ultimately removing
> the now-unused special cases in drivers where they did not support
> IOMMU_DOMAIN_DMA.
> 
> domain_alloc_paging() should return a struct iommu_domain that is
> functionally compatible with ARM_DMA_USE_IOMMU, dma-iommu.c and iommufd.
> 
> Be forwards looking and pass in a 'struct device *' argument. We can
> provide this when allocating the default_domain. No drivers will look at
> this.
> 
> Tested-by: Steven Price <steven.price@arm.com>
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Tested-by: Nicolin Chen <nicolinc@nvidia.com>
> Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  drivers/iommu/iommu.c | 17 ++++++++++++++---
>  include/linux/iommu.h |  3 +++
>  2 files changed, 17 insertions(+), 3 deletions(-)
> 

Reviewed-by: Jerry Snitselaar <jsnitsel@redhat.com>


