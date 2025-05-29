Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4C80C5AD49
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 May 2025 20:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6TtaMd1HywfsuyRcNH/42AXM3iz/qus8mLnXbozVUkA=; b=i43FLp9azzU4iNKYl95rw3I7nc
	kbIKFAVmmtMgID+f/0eimYmY90N1OUfr8Xs/BIjcgWpm3/YWKR5e9LH7M6deIRkThwTjdbzEd0VIF
	O5NXVGk+KcPF6g5V0J/aE3gRQhoOT6YTxD4RZ9rkVYt7YD8KE6ugI3vE4IDuWKRzOWJBdmhygHyCs
	7LjwD5dBN1lFh11aZesPNq5wsMHIpWwVLmSU3dEbn5ILs8Bg6WVUNuASbP4m/Ca6noPGRkA//ZCZB
	7D6co6YocGHCsvtdJRowh/cSm6if15BplOVfvUjkD8NoMiZpHh+sULn6G7xdnZ+z0srFX1C0yd9TW
	PNHSaGJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKkB2-0000000GWKH-2syG;
	Thu, 29 May 2025 20:48:36 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKk8s-0000000GW2J-33DH
	for linux-mediatek@lists.infradead.org;
	Thu, 29 May 2025 20:46:24 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-879d2e419b9so1279227a12.2
        for <linux-mediatek@lists.infradead.org>; Thu, 29 May 2025 13:46:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1748551581; x=1749156381; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6TtaMd1HywfsuyRcNH/42AXM3iz/qus8mLnXbozVUkA=;
        b=dFjq2NiEPa1X5/bqSSOd6mWIbuLalfC2PpJYw2cED5pRguLkl7EjaX1LRnWE6aaNP/
         AYo4CiK28/U5j1cP4al3TDlx+dm1KJCJ0+UyW3BLO+py1ergg28tAKE984fKpbzmeJyd
         nTleKsnvpeHtHdWgPHUgE0sf6+hw9Y0f3TTWuK841ExFeX5FY5z46k3qSX197gSrGkJO
         +dHYtz/Gn/pU7Wyf56zsh9mp4FKEGrMR6N4KenHSQ3JyotkUrVmI5HhbFSBCWiroj8Lj
         4XRXiCjlZcflwv3Tk+OTZ8OTTZ27NKkAR1qJpRr4KL31uJ7QtUZbnkzXtcQKd6M+BNaL
         bHsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748551581; x=1749156381;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6TtaMd1HywfsuyRcNH/42AXM3iz/qus8mLnXbozVUkA=;
        b=fFRJz8Qb4gHaBTfr5S0COcAVoXOAyPe1+pQiGaAOaE+3ljxs5reLGibq+rjzNAk4wt
         H1uWCKMM+HxKkV4817FtLuBPfoUawf/mUzb/Ap+sjpHuDvG+EnqQuZYXw1yCXgLL1r0A
         szU2ZM8PHr8XFmgzf0fw54SOyN1uxEsIxMlI0cHUABCxoAfTqBBlmbEqoKCoG/NlG4RZ
         7gj2O98A078C3POYzcluTumxiBzqEycEDkqcTcZb6YO86LzCaEyO2AIF8tStLjG+MrHf
         IGsKF/O7Ep2a7HWoHDMp5BOWBa8vbd/DuzCk8MyZW+zJG6Rz8Udoy2LrCnZaIzHpgS9U
         nhvA==
X-Forwarded-Encrypted: i=1; AJvYcCV7pNjqLC7AH3FdauxXlYVRqUHbW+FBPUT4vBsSurZMV6Q8qQlPrXbJ+AyxT2SdkZP3fAPxFc72rmm8lZY9JQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwCgqLivpUBZiG8Ol/ZsTcY+UFPW/LlkBSaGL+BtxNWASC5MJ03
	vFDPdyoK/+gFxXRItIv6ovLe8AdHmRsdBn0lDtpdoxavRl9JwnKZ2K9XFto61C3a6Es=
X-Gm-Gg: ASbGncuSlri1L4Dh1nntOMnABm+lnpbQ/wNaYlyGfg1xSAizCQy6IeBivQHGdtrrjAW
	DFo0/EjAOh5zPReTnjLFyF/joE0Ks9xhuILevt1p9fFFvUtYFJCiVB4MPRkLkBHB/sOD0T/S6KF
	elrr08gzBHFKK0d78hnpcvwVSee7yqWW3XJI5usCJv7UFP+uKBbcpqF4keepj1Gv1G61nJmOl0T
	2FaocsQhbDjEbRc50jY49jmUDLaV2rOIv+2E8BFM05Oc1LkKaoMmL5hSh6SKU0sfzb3lDZiRdP7
	nZPDPnbUUU0pud0aEKfqqSx7OVaFCHOVtRyC55krYlSNmPYCxQfN5aA+IV0TYx1RsjIngQ==
X-Google-Smtp-Source: AGHT+IEO8HwssTrnrLL8DGNfi7UDT2JfkJIUURFRStahz0gCmflYidew8g3m8w3QvBPF+GZDsBP2sw==
X-Received: by 2002:a17:90b:1d89:b0:311:f99e:7f51 with SMTP id 98e67ed59e1d1-312415329famr1432137a91.18.1748551581341;
        Thu, 29 May 2025 13:46:21 -0700 (PDT)
Received: from tjeznach.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506bd9486sm16245345ad.67.2025.05.29.13.46.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 13:46:20 -0700 (PDT)
Date: Thu, 29 May 2025 13:46:17 -0700
From: Tomasz Jeznach <tjeznach@rivosinc.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Alim Akhtar <alim.akhtar@samsung.com>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Albert Ou <aou@eecs.berkeley.edu>, asahi@lists.linux.dev,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Lu Baolu <baolu.lu@linux.intel.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Stuebner <heiko@sntech.de>, iommu@lists.linux.dev,
	Janne Grunau <j@jannau.net>,
	Jean-Philippe Brucker <jean-philippe@linaro.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Joerg Roedel <joro@8bytes.org>, Kevin Tian <kevin.tian@intel.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-riscv@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Matthew Rosato <mjrosato@linux.ibm.com>,
	Neal Gompa <neal@gompa.dev>, Orson Zhai <orsonzhai@gmail.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Rob Clark <robdclark@gmail.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Samuel Holland <samuel@sholland.org>,
	Niklas Schnelle <schnelle@linux.ibm.com>,
	Sven Peter <sven@svenpeter.dev>,
	Thierry Reding <thierry.reding@gmail.com>,
	Krishna Reddy <vdumpa@nvidia.com>, virtualization@lists.linux.dev,
	Chen-Yu Tsai <wens@csie.org>, Will Deacon <will@kernel.org>,
	Yong Wu <yong.wu@mediatek.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>, patches@lists.linux.dev
Subject: Re: [PATCH 3/7] iommu: Remove ops.pgsize_bitmap from drivers that
 don't use it
Message-ID: <aDjHmR7ZVTbsSITO@tjeznach.ba.rivosinc.com>
References: <0-v1-7c5282b0c334+2db-iommu_rm_ops_pgsize_jgg@nvidia.com>
 <3-v1-7c5282b0c334+2db-iommu_rm_ops_pgsize_jgg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3-v1-7c5282b0c334+2db-iommu_rm_ops_pgsize_jgg@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250529_134623_011608_C5792941 
X-CRM114-Status: GOOD (  17.84  )
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

On Tue, Apr 29, 2025 at 11:34:13AM -0300, Jason Gunthorpe wrote:
> These drivers all set the domain->pgsize_bitmap in their
> domain_alloc_paging() functions, so the ops value is never used. Delete
> it.
> 
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  drivers/iommu/apple-dart.c       | 1 -
>  drivers/iommu/intel/iommu.c      | 1 -
>  drivers/iommu/iommufd/selftest.c | 1 -
>  drivers/iommu/riscv/iommu.c      | 1 -
>  drivers/iommu/virtio-iommu.c     | 6 ++----
>  5 files changed, 2 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
> index bb57092ca90110..2d0d31ba28860a 100644
> --- a/drivers/iommu/riscv/iommu.c
> +++ b/drivers/iommu/riscv/iommu.c
> @@ -1533,7 +1533,6 @@ static void riscv_iommu_release_device(struct device *dev)
>  }
>  
>  static const struct iommu_ops riscv_iommu_ops = {
> -	.pgsize_bitmap = SZ_4K,
>  	.of_xlate = riscv_iommu_of_xlate,
>  	.identity_domain = &riscv_iommu_identity_domain,
>  	.blocked_domain = &riscv_iommu_blocking_domain,

Reviewed-by: Tomasz Jeznach <tjeznach@rivosinc.com> # for RISC-V

Sorry for the delayed response.
- Tomasz

