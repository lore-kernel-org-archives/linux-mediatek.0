Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5297C83F11
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Aug 2023 20:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BkaTz3YQaxv4XNx1z6p3EOnPP86a0L+L06c9Q1h/cfg=; b=MjUuZgjO1myzYB/bPRupphV2Uk
	X4HMzDkqI1A0UV3LyrOCTmmIkGWRkP8D85m9nTP/urJfZi0LZPLm/Lo/ur2kIQp0gn6FIFmQLliyC
	P2lQaUOk3+sALOBfJA+zg1EKcqmq3oovS3Tqa/raMLQvZSfIBTQUuLrVBWtt+8P/CTArG81UPGoOJ
	UXziTfgBzuyZEaV9j5QPy0M2cjyzwTsfFlUZQU7sCiEFe/UgOQVao9WEBBHdLXJsGc/gCaqeJ76p/
	iEtad/iH+XA4JAAl8MaZJ88jWEuOavueOfKqUKa9l90L42SZvDn2OyW2zAn2aND5rORYBQfy054vA
	nWWic1pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qajJp-00AGhc-1M;
	Mon, 28 Aug 2023 20:58:41 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qajJm-00AGfu-2W
	for linux-mediatek@lists.infradead.org;
	Mon, 28 Aug 2023 20:58:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693256315;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BkaTz3YQaxv4XNx1z6p3EOnPP86a0L+L06c9Q1h/cfg=;
	b=YwyTtnesoTqWDIxeUTe+s9TIjKizXl9FLO7J1stvvXh7hlDgWm2BPbsJb+33U+trc5EtYV
	0XR+I8p3e9nodMkuL/c3r76iXGYS27YskPuikB2rHd6Muzlurh6Os5CdVgSrXES/TTv3C4
	WoaD5V+Wab+agO/lwTxWHrmBSiiVDz4=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-602-qukEIthqO7-ukT8zWbyYIQ-1; Mon, 28 Aug 2023 16:58:33 -0400
X-MC-Unique: qukEIthqO7-ukT8zWbyYIQ-1
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-411fae3127eso45224391cf.2
        for <linux-mediatek@lists.infradead.org>; Mon, 28 Aug 2023 13:58:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693256313; x=1693861113;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BkaTz3YQaxv4XNx1z6p3EOnPP86a0L+L06c9Q1h/cfg=;
        b=d2IB8pCmlRti/oQ1zurBwF0fHks/N7rS8KLqy/wpGWZORyrSPUOvgao46DIWigWfCR
         I/5/h5anGUNeBRoc2SqrgWb6y1SEljv3suiWg7GoFj3tK9UAEK84AbnXIF5uOcqFQ1TD
         KqjeRYni/KRuoSJ5nqlyBQQBdezTl7gyOQjzHauXWaRL+mJrmRVniumeAhbXw0UlWCsg
         B5ypc5l6oPtd2H6fnWRZqmtSmZy+H8DwsysjJL9V/bwHZNM5wmYDs+MeL34eQvewai7m
         HDhGh+EU9lf1kZAGJeVUHwvB9lkEYm5w+XmGdUhRir6e0728SHx/vQH1d2hrxpGWRWON
         oKEg==
X-Gm-Message-State: AOJu0YyqZFSxdaBQT/c14KA5ma+DS+ICz8PUajQaZl8+xk2bdZzv4mHC
	sMFiiNCk66CNPhmkNMCL3+thAxn6d3hZrbWltoMGQN8QV5XU5SYo1Ay3G8pxZ0Te8SWbS9Jfk/L
	EfwPe4YVSIZhzp3Bim66Ssnd688DWGBbE
X-Received: by 2002:a05:622a:12:b0:411:f7e6:3be5 with SMTP id x18-20020a05622a001200b00411f7e63be5mr18754093qtw.30.1693256313482;
        Mon, 28 Aug 2023 13:58:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGqzxLWZK4Sb4/58FxlbaHsUgrMjm1Fc7pMUPbHePKpRNp9fWsIa9/KWnDi5jm+4pqQWfwb1w==
X-Received: by 2002:a05:622a:12:b0:411:f7e6:3be5 with SMTP id x18-20020a05622a001200b00411f7e63be5mr18754084qtw.30.1693256313282;
        Mon, 28 Aug 2023 13:58:33 -0700 (PDT)
Received: from localhost (ip98-179-76-75.ph.ph.cox.net. [98.179.76.75])
        by smtp.gmail.com with ESMTPSA id a11-20020a05620a102b00b0076cf49bcb50sm2613298qkk.37.2023.08.28.13.58.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Aug 2023 13:58:32 -0700 (PDT)
Date: Mon, 28 Aug 2023 13:58:31 -0700
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
Subject: Re: [PATCH v7 15/24] iommu: Remove ops->set_platform_dma_ops()
Message-ID: <6thxe2cqyfs6czmd63a7ompjpvkv2c2aestp7almmk725r5ivd@2lmwtzyfylmp>
References: <0-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
 <15-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <15-v7-de04a3217c48+15055-iommu_all_defdom_jgg@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230828_135838_898196_A9095E3C 
X-CRM114-Status: GOOD (  12.32  )
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

On Wed, Aug 23, 2023 at 01:47:29PM -0300, Jason Gunthorpe wrote:
> All drivers are now using IDENTITY or PLATFORM domains for what this did,
> we can remove it now. It is no longer possible to attach to a NULL domain.
> 
> Tested-by: Heiko Stuebner <heiko@sntech.de>
> Tested-by: Niklas Schnelle <schnelle@linux.ibm.com>
> Tested-by: Steven Price <steven.price@arm.com>
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Tested-by: Nicolin Chen <nicolinc@nvidia.com>
> Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  drivers/iommu/iommu.c | 30 +++++-------------------------
>  include/linux/iommu.h |  4 ----
>  2 files changed, 5 insertions(+), 29 deletions(-)
> 

Reviewed-by: Jerry Snitselaar <jsnitsel@redhat.com>


