Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A17E9C71145
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Aug 2023 03:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CH6mXKRKMtD7TEsSEIJfvoLTAwKYFLojoxw+I3lfT8w=; b=qL3XE5lYYqwEPjsGLTuA1xWLbX
	Xv9mxtYaxVVxOvFhIC8BWAhLLt6eMkCWf6T0DBQHIr0AimSqV40z3M69B5Uq+4C+DJOMAhKSJGdwN
	8RgK6M6Wl6dKJjuMp+2iG2KNCLvEd2U4v3KGh+XAwI7hafvHP/kLln8Sk1VfrALVCH9xTq/mGRCsz
	FPDs21W01wguAwWd0LlesGOofj+f9PSVQDMURM6Ea9HBZf3leKOcxJSI5W8gJ4mdGbpQDPLXiKp5Y
	IdBFESiXZQ76JsNJEh/oGjruR16eX1RBgfyU2TUDFmk/TxvMSxTHR58Ud6OmPI9i6BaM1A5bI4sWX
	dq7oDfgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZ1EF-0023cj-0r;
	Thu, 24 Aug 2023 03:41:51 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZ1EC-0023bg-1p
	for linux-mediatek@lists.infradead.org;
	Thu, 24 Aug 2023 03:41:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1692848505;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CH6mXKRKMtD7TEsSEIJfvoLTAwKYFLojoxw+I3lfT8w=;
	b=I4kDFujAOgWWAOl0aUYsz5otZMn5Bz4nKwZZ1ysZ3QZDYN4aESBvifOmT2ecq345K2Jw3N
	0QhzFTWfH85QV2HV6MEkDNBk/50VH7m80QmTkYJXprdvrgpCTo8Kv5/bHTku6asZSU5w1c
	eweqoLnMePh71KUIs7LhK+iYjk7VSRY=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-492-6y3O2faWPhS2FKm2_7xRhg-1; Wed, 23 Aug 2023 23:41:44 -0400
X-MC-Unique: 6y3O2faWPhS2FKm2_7xRhg-1
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-40ff200f300so73330741cf.2
        for <linux-mediatek@lists.infradead.org>; Wed, 23 Aug 2023 20:41:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692848503; x=1693453303;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CH6mXKRKMtD7TEsSEIJfvoLTAwKYFLojoxw+I3lfT8w=;
        b=BhLDWuDXp87YH9GPC3ZLv35Qej7jMkIFwFVTwpQ8HdlqgUss68YwuUDNnrgQu+OO88
         sI5e/jMqTtUD7Ge4dLhGgt1WkZOepcDUr/E0XqyXds6CD4dSxrK9PUSAFF7D/QGQB3Ic
         253B3fDKcmdy6ua8Ozg+/sYgx9bpk+yGONfNd2O0+WnrD/Wqf0CU9NU9y9K83MMdLGpa
         4YzeTj58tW4vmVxV/WmEh8mO8z9Z0Wbxhe1Oz3PLfu69v5eL1WjijWYcy75cSfKgfK+z
         m7y+97wxlI2JqPbQDu6PifJLCmXz8nQAL7DBL40vKd/kbMIbS0hTZNa91rpPJLZ8E1Sk
         k78w==
X-Gm-Message-State: AOJu0YxoYPsXpxMBABNY4x6fvGIFZT07hSZcwj0PFQx/EytEjoqFwhdZ
	rw2mw/Y69oKRX1YFvDBG9/n8OIc+6+mb4PmgJ/Bt56o93IFGAwRhwfEwUuQNvsRqdus9c/IAeXg
	TNbVPNaNl9XR3F6jfFhYNl5qwOPHFh2jA
X-Received: by 2002:a05:622a:1a19:b0:410:8551:2608 with SMTP id f25-20020a05622a1a1900b0041085512608mr13211977qtb.58.1692848503565;
        Wed, 23 Aug 2023 20:41:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFHjWv1CiL8QEOPMtXQgjOpwEGJSl7biyyoMP2HI5INen9hHlXD9XV1I7hmZP4s4Z/4tJVc6A==
X-Received: by 2002:a05:622a:1a19:b0:410:8551:2608 with SMTP id f25-20020a05622a1a1900b0041085512608mr13211932qtb.58.1692848503326;
        Wed, 23 Aug 2023 20:41:43 -0700 (PDT)
Received: from localhost (ip98-179-76-75.ph.ph.cox.net. [98.179.76.75])
        by smtp.gmail.com with ESMTPSA id s26-20020a0cb31a000000b006375f9fd170sm5116337qve.34.2023.08.23.20.41.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Aug 2023 20:41:42 -0700 (PDT)
Date: Wed, 23 Aug 2023 20:41:41 -0700
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
Subject: Re: [PATCH v7 01/24] iommu: Add iommu_ops->identity_domain
Message-ID: <r362pqn2venwjut7ernpzbxnc72kvknshxeobrvkvp7p5m554e@7jnu4wja663k>
References: <0-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
 <1-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <1-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230823_204148_680668_04F29316 
X-CRM114-Status: GOOD (  14.59  )
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

On Wed, Aug 23, 2023 at 01:47:15PM -0300, Jason Gunthorpe wrote:
> This allows a driver to set a global static to an IDENTITY domain and
> the core code will automatically use it whenever an IDENTITY domain
> is requested.
> 
> By making it always available it means the IDENTITY can be used in error
> handling paths to force the iommu driver into a known state. Devices
> implementing global static identity domains should avoid failing their
> attach_dev ops.
> 
> To make global static domains simpler allow drivers to omit their free
> function and update the iommufd selftest.
> 
> Convert rockchip to use the new mechanism.
> 
> Tested-by: Steven Price <steven.price@arm.com>
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Tested-by: Nicolin Chen <nicolinc@nvidia.com>
> Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>


Reviewed-by: Jerry Snitselaar <jsnitsel@redhat.com>


