Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BD6CE7E64C
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Sep 2023 16:08:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6oDat+15Yv8jvHk03dbPKuk8zwd+AnRHF/euH49EJVQ=; b=4hDnuK9pz7FWQjg31XQm8a3+eh
	olYhfm/HYr+meF0AryNheV0JIPWTHt8qskZCp8NN5yTUw3EangL6sOVpkGNISNcKsdvHk2fWO+NQ6
	WVZ6WRDw+U3o6gMaMdt51tnWxmiNlwd6WhzgonYklD8jUBTcOmQrESRSLRaJlLw2oM9GlZ5JGh2Os
	WBFf6qSCK2wp0Txqge7386oAy9iaCAL4cA93NVsZtk8n8ShykI8lATRKBzCI5uogErEnEgYlFUhow
	oWgxYGvv2QwSCaX33hiP/58xHSVfeK4vJYANvXym1wqea9/eLighOUuZgJaawRh+T+4n1ExWnqruB
	+eynY0Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlAc3-00Ggqv-1f;
	Tue, 26 Sep 2023 16:08:39 +0000
Received: from mail-vk1-xa30.google.com ([2607:f8b0:4864:20::a30])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlAc1-00Ggq3-0r
	for linux-mediatek@lists.infradead.org;
	Tue, 26 Sep 2023 16:08:38 +0000
Received: by mail-vk1-xa30.google.com with SMTP id 71dfb90a1353d-48feedb90d2so3106832e0c.1
        for <linux-mediatek@lists.infradead.org>; Tue, 26 Sep 2023 09:08:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1695744514; x=1696349314; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6oDat+15Yv8jvHk03dbPKuk8zwd+AnRHF/euH49EJVQ=;
        b=bjSKcB+CLDyDwBo6kgHWvWEgjlgGVNpcw7soktwQakUR/ZmB6cMt0YYhwEiE/CnI3Q
         EAy/0W9tOcTbJDzbUnXGRZAWVvyRALCZLH4CLKkgEDbqFgEhBa4dhXURkhpsIakQvvAB
         MAVaX2VY+k/Ta3bClmNXKkuZou33x2i059P55cSDhLc9wW8nF1Th9eGYeQezkC3rSFqp
         WafmiR/ez3/wodm7Z0jcWjeWcem2nhQ0AYdiwlJlISVr7tZHvU4FFYadanLlI20NfX9C
         YF7WV8Ry94iDd+Ynt4vhkCfL7zht3+/tW/WfPGUlBUTIdUa1iTd4q0D7zUxa/07xAQqD
         yvPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695744514; x=1696349314;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6oDat+15Yv8jvHk03dbPKuk8zwd+AnRHF/euH49EJVQ=;
        b=LlzMzFCdAHQmV2A/HDw03N4+y+Z5SPwKcWYEAWsYkYYSn/IgHv9OPeBNhjv+XbDSv1
         RhXRd46CbACpX5x2whcUHC2H9N7gav3glb9Xj2HzqXFAfpm178sYg1bLj0SJqZbEQ7/h
         mkjN1NsEfX7D8dxm2NRK99/G7n8sqVo3/Dn3fHNxhi0tURE3T3uKgf3vmX2TwUtd23fW
         PmQCU+jQUT21gnuBLW2dC+b1zScWvklKfpsIL+Yethdq7dvxmKAWhfYxWM+LH5H3T2xO
         PL1YlHdg53UQblkotdzItF/6r6eG1i7uEVvK3DRC8/RDPm3KV1mJdP90NFh3aA0jyC6p
         kWZQ==
X-Gm-Message-State: AOJu0Yxa6Dbv3rWnSRekWxI1w9urHRJI3O3GEfVJkkYA5CWiJcNRoz+L
	iDyzIBWf31KJ9dOzV42YxF69Nw==
X-Google-Smtp-Source: AGHT+IFDQgBrhIPwgsFhbivVL+D36TCzBymyRjeSj3OWewpTHgWhOtDO4u30/jSZ3MjQP6HcqK5sVA==
X-Received: by 2002:a1f:c582:0:b0:48f:9778:2b9f with SMTP id v124-20020a1fc582000000b0048f97782b9fmr6177336vkf.11.1695744514328;
        Tue, 26 Sep 2023 09:08:34 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-68-26-201.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.26.201])
        by smtp.gmail.com with ESMTPSA id d8-20020a0cb2c8000000b0065b13180892sm1817688qvf.16.2023.09.26.09.08.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Sep 2023 09:08:33 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1qlAbw-001Evg-HO;
	Tue, 26 Sep 2023 13:08:32 -0300
Date: Tue, 26 Sep 2023 13:08:32 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Joerg Roedel <joro@8bytes.org>
Cc: Niklas Schnelle <schnelle@linux.ibm.com>,
	Matthew Rosato <mjrosato@linux.ibm.com>,
	Will Deacon <will@kernel.org>, Wenjia Zhang <wenjia@linux.ibm.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Gerd Bayer <gbayer@linux.ibm.com>,
	Julian Ruess <julianr@linux.ibm.com>,
	Pierre Morel <pmorel@linux.ibm.com>,
	Alexandra Winter <wintera@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
	Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	David Woodhouse <dwmw2@infradead.org>,
	Lu Baolu <baolu.lu@linux.intel.com>, Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Yong Wu <yong.wu@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Krishna Reddy <vdumpa@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Jonathan Corbet <corbet@lwn.net>, linux-s390@vger.kernel.org,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v12 0/6] iommu/dma: s390 DMA API conversion and optimized
 IOTLB flushing
Message-ID: <20230926160832.GM13795@ziepe.ca>
References: <20230825-dma_iommu-v12-0-4134455994a7@linux.ibm.com>
 <ZRLy_AaJiXxZ2AfK@8bytes.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZRLy_AaJiXxZ2AfK@8bytes.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230926_090837_468295_5B47A51E 
X-CRM114-Status: GOOD (  15.35  )
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

On Tue, Sep 26, 2023 at 05:04:28PM +0200, Joerg Roedel wrote:
> Hi Niklas,
> 
> On Fri, Aug 25, 2023 at 12:11:15PM +0200, Niklas Schnelle wrote:
> > Niklas Schnelle (6):
> >       iommu: Allow .iotlb_sync_map to fail and handle s390's -ENOMEM return
> >       s390/pci: prepare is_passed_through() for dma-iommu
> >       s390/pci: Use dma-iommu layer
> >       iommu/s390: Disable deferred flush for ISM devices
> >       iommu/dma: Allow a single FQ in addition to per-CPU FQs
> >       iommu/dma: Use a large flush queue and timeout for shadow_on_flush
> 
> Turned out this series has non-trivial conflicts with Jasons
> default-domain work so I had to remove it from the IOMMU tree for now.
> Can you please rebase it to the latest iommu/core branch and re-send? I
> will take it into the tree again then.

Niklas, I think you just 'take yours' to resolve this. All the
IOMMU_DOMAIN_PLATFORM related and .default_domain = parts should be
removed. Let me know if you need anything

Thanks,
Jason

