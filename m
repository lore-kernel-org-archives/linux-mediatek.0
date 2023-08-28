Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF482C83F11
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Aug 2023 23:21:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2tY2O409yN5fYvGoN8/JrlRj7FUk0pOGMULUjvQaUpg=; b=eRGoGO15wVgUWmE+0PV/Zvd01p
	2Rn8qBnXO/LlV8mQjQzjdsCsBpxZW9MqjMlTLJdiygDr8pBdr4FmUECQ7SQlq2rI+xsH55vgE6t1Q
	1bu4E2f10+iyhcll1tO8+4ALvU12LYH1sZSBqpD28Syk7xEi4WqWaq7OCCiq9wwC3EFizZHMhZ6RD
	WRjk0MartQg+UhXTcnDdbUPRu+enOVl72S2qqFk4a3sz0mfrQrXfZx7VP2W91AZVCLAqVMpClskG5
	Cr0xYUFzzhwjfWlYNgJhwfkbesIy3nex6hGkj2F8YvBdH+aepmBYDgwn5CdRYrTmDSUGyXbIj/sdL
	fId2JtQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qalXo-00ARfq-1Q;
	Mon, 28 Aug 2023 23:21:16 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qalXl-00AReQ-1k
	for linux-mediatek@lists.infradead.org;
	Mon, 28 Aug 2023 23:21:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693264872;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2tY2O409yN5fYvGoN8/JrlRj7FUk0pOGMULUjvQaUpg=;
	b=Gg4UGtu8YZcMeEQJKO8+0Ms4vYsbn75bO8Maf8SRoFNpK2ZZYPu3o1C4nODhYmjMGW/uAM
	LLxLC674MyP2U+63g3Dc3hMjncJySolSwzyZKiV0sVPKnSTArIh15eiIbflbF/ZgG6so7E
	ESZkv1481/1BZAjWjJOQRDOWWXX4yM0=
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-456-9AReaMRUPMWJkeh8zx4kkg-1; Mon, 28 Aug 2023 19:21:11 -0400
X-MC-Unique: 9AReaMRUPMWJkeh8zx4kkg-1
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-6bd06019013so3891566a34.2
        for <linux-mediatek@lists.infradead.org>; Mon, 28 Aug 2023 16:21:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693264870; x=1693869670;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2tY2O409yN5fYvGoN8/JrlRj7FUk0pOGMULUjvQaUpg=;
        b=iz/s1UMBdfem5/Ir7xWsEVbtuiLi7Zu7XCHNyDJfoIZoh85omPbyIiSnZr6Ycqhz40
         dJQz2cWE9rs70TMhwUBoSNvBxmTXs5cnD7VOmUw17Vt9BQhYb63r7GZyN+p5UXGujhKo
         XARs60bw0ENRAerF82e3F0U3e4w23vPawjBUTiwT0zHNfKvU3/kazjTNE3xY7Y03tdjw
         svMO5y+Mb+bIoQuXum+SIotEkviahVTvSgiXBct+t+SRigOPFjvZONraxul4njKE+9q+
         ZilPY3bbMpUGUeT38YaOWBYokzemJl0QqbT6faHfRu6RvTWVK1wXtHv0hGerGXCV/L0v
         VCbQ==
X-Gm-Message-State: AOJu0YyUlht7oeTbQi3bdnjsRvi2lq3Kw8w0cFeO/CyMqYo5s8FpDspK
	xjxBGSlILs8Qry4xuDvwmMUVnpXDo0EyzJf67lmj9FsGHKyUXTByz6A0MtumIQ8R1Ebaww44jST
	+CYOi6wsx9PmLhYDeG/90qrEE9hFNhcI1
X-Received: by 2002:a05:6830:1e69:b0:6b9:6663:4648 with SMTP id m9-20020a0568301e6900b006b966634648mr15282039otr.3.1693264870371;
        Mon, 28 Aug 2023 16:21:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFP5/EEWHTR1bez5m3Juu4cnUjVIKCsfQBSYEYoBbAOKOAwmWfu7HwgfLHfFstKObHsFOXoGQ==
X-Received: by 2002:a05:6830:1e69:b0:6b9:6663:4648 with SMTP id m9-20020a0568301e6900b006b966634648mr15282011otr.3.1693264870175;
        Mon, 28 Aug 2023 16:21:10 -0700 (PDT)
Received: from localhost (ip98-179-76-75.ph.ph.cox.net. [98.179.76.75])
        by smtp.gmail.com with ESMTPSA id e29-20020a63371d000000b00565eb4fa8d1sm7893911pga.16.2023.08.28.16.21.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Aug 2023 16:21:09 -0700 (PDT)
Date: Mon, 28 Aug 2023 16:21:08 -0700
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
Subject: Re: [PATCH v7 23/24] iommu: Convert simple drivers with DOMAIN_DMA
 to domain_alloc_paging()
Message-ID: <hqpyajmraabu5hwhprghy43p53f4qjwdux2job7bv3ss4mijuq@2ov4rd6ppqol>
References: <0-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
 <23-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <23-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230828_162113_677420_4E818740 
X-CRM114-Status: GOOD (  12.26  )
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

On Wed, Aug 23, 2023 at 01:47:37PM -0300, Jason Gunthorpe wrote:
> These drivers are all trivially converted since the function is only
> called if the domain type is going to be
> IOMMU_DOMAIN_UNMANAGED/DMA.
> 
> Tested-by: Heiko Stuebner <heiko@sntech.de>
> Tested-by: Steven Price <steven.price@arm.com>
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Tested-by: Nicolin Chen <nicolinc@nvidia.com>
> Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  drivers/iommu/arm/arm-smmu/qcom_iommu.c | 6 ++----
>  drivers/iommu/exynos-iommu.c            | 7 ++-----
>  drivers/iommu/ipmmu-vmsa.c              | 7 ++-----
>  drivers/iommu/mtk_iommu.c               | 7 ++-----
>  drivers/iommu/rockchip-iommu.c          | 7 ++-----
>  drivers/iommu/sprd-iommu.c              | 7 ++-----
>  drivers/iommu/sun50i-iommu.c            | 9 +++------
>  drivers/iommu/tegra-smmu.c              | 7 ++-----
>  8 files changed, 17 insertions(+), 40 deletions(-)
> 

Reviewed-by: Jerry Snitselaar <jsnitsel@redhat.com>


