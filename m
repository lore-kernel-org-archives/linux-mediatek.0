Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE4EEC83F11
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Aug 2023 20:47:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZPnnQCDZkoCLUNIk6pqqLPBY9OW9d6paRIVLOJnAj78=; b=4vIVjw2EQQ+XnVO6qkl825fKn3
	Y/GZ8gbBtRbJBnoqhlaWi/n4Q5O43ea73qJm2k2AoKZHYOgjmlf99M6Ul35UnbrxjdrBJ+Jh8BEDu
	s+nubp3QI+kl7kT7wIj+A6xeLVRYwwJkXRIpkhN/09JEeRvl8y3WnoejQ+MRmEvnp6RBGKA6m8R5A
	1wvw0SM+milbR4oGW2E38e3FhyrDpCNoU4qzWbcX6tCCqDNxME/deD7dowII/4nJ7tXmybhKl2K/C
	aAMIvoQI+ZhF3dXkp6F+5mb0dFHPwgiH6W5aetPY/6ldagyXfp2DzRgMBfKpzOzLnLi8uw5tfAJ9W
	jopjo35w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qaj8r-00AFwK-1h;
	Mon, 28 Aug 2023 20:47:21 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qaj8n-00AFuP-2h
	for linux-mediatek@lists.infradead.org;
	Mon, 28 Aug 2023 20:47:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693255635;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZPnnQCDZkoCLUNIk6pqqLPBY9OW9d6paRIVLOJnAj78=;
	b=XC91y03PGZR0HvAzwBnNJNT4SwBDgT6GqHgpkCIB47BajQN+3tTw4IVMe77wJWjMgxgnCG
	OtxLC/kqhBUVygdGOtgAOsXDV2Iy1YGsTNdFOSjKtaTrThueSDokaFEELpM/0XGGOAdtgm
	n9f5EVj0O+URltOLMjABUijFQY3Al4Y=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-111-Uhp9Ho7kN82JOK4YEprrlQ-1; Mon, 28 Aug 2023 16:47:13 -0400
X-MC-Unique: Uhp9Ho7kN82JOK4YEprrlQ-1
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-76f1e2d6ea4so6595285a.1
        for <linux-mediatek@lists.infradead.org>; Mon, 28 Aug 2023 13:47:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693255633; x=1693860433;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZPnnQCDZkoCLUNIk6pqqLPBY9OW9d6paRIVLOJnAj78=;
        b=iiAIGYoX/6ZJm0pDU23wPAdCNZOK4qgczmRRuQTfeLb0TV0qSjkbypeGitc8lOs1FZ
         jiX7NxTSw/5IUGhCh/HhNApcgdyIg0mLnaEoSUjDy0HUWgS13Sb8t5/EAvSIPKSQazQp
         JmTbUgJ8lJbGakiAjYlOHcwGUNdjyrfmLMgl05z/HTsttGoAEYlDsVgT6zxxXHeXoFd7
         toHrM7WhAI6byOV9NgoLeT3RgpdeiZh5DmeY6oSH5lDQkPvv4fukfSptpewAP7SaG8l5
         hKw8P0MzkcDhRxEZJfIQTJg4JhXZY6VneNeOiqnohaeFyjOX9k4NBpetgowdFL+kbwnu
         ehbg==
X-Gm-Message-State: AOJu0Yym0FHQ9/A1XPnK0c0YdGe/Chkl51WvNVnV1j+x65sCJPR6yGzI
	E2FfuDIDLYbOBIDATOORBpM3A7ZKkRPlHr0E3XoE5DgiX0Oc1/smmhzW01xI2KDsfRvoWw1eqbj
	Iqw/vMR4z0NoUSAHa6QSfEzgTA500hddg
X-Received: by 2002:a05:620a:4614:b0:76d:aa3b:ac9c with SMTP id br20-20020a05620a461400b0076daa3bac9cmr24655254qkb.46.1693255633382;
        Mon, 28 Aug 2023 13:47:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHwVuI8ZPuQEBsqBHLA4mM96XswCj3GuW2ha49h3MQX3EuB7tqhbB8UeA/K6lT7Jvy4c0Wwkw==
X-Received: by 2002:a05:620a:4614:b0:76d:aa3b:ac9c with SMTP id br20-20020a05620a461400b0076daa3bac9cmr24655228qkb.46.1693255633141;
        Mon, 28 Aug 2023 13:47:13 -0700 (PDT)
Received: from localhost (ip98-179-76-75.ph.ph.cox.net. [98.179.76.75])
        by smtp.gmail.com with ESMTPSA id g9-20020a05620a13c900b0076db1caab16sm2631338qkl.22.2023.08.28.13.47.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Aug 2023 13:47:12 -0700 (PDT)
Date: Mon, 28 Aug 2023 13:47:11 -0700
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
Subject: Re: [PATCH v7 13/24] iommu/omap: Implement an IDENTITY domain
Message-ID: <242a7ntgcvqofkvw2aapftr3pgczpueam3beyr4qey5mgx2rh4@odjyxtbbscfz>
References: <0-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
 <13-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <13-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230828_134717_943660_F7E08CF8 
X-CRM114-Status: GOOD (  14.42  )
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

On Wed, Aug 23, 2023 at 01:47:27PM -0300, Jason Gunthorpe wrote:
> What omap does during omap_iommu_set_platform_dma() is actually putting
> the iommu into identity mode.
> 
> Move to the new core support for ARM_DMA_USE_IOMMU by defining
> ops->identity_domain.
> 
> This driver does not support IOMMU_DOMAIN_DMA, however it cannot be
> compiled on ARM64 either. Most likely it is fine to support dma-iommu.c
> 
> Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  drivers/iommu/omap-iommu.c | 21 ++++++++++++++++++---
>  1 file changed, 18 insertions(+), 3 deletions(-)
> 

Reviewed-by: Jerry Snitselaar <jsnitsel@redhat.com>


