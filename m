Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D170CD35162
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Apr 2026 11:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+wLwW3RwfZlMNchucl4Q1BjkgKkbbVmuqcbZXsSlons=; b=PzEoWZygjJ9+bvUBV1nTXZUOZK
	4+ZKrH8V+jLR+EnDBKGcFkCMy3AyEDPzL0pQBTCnU2Unih1Vg3c8YjIurzupmsqwf0auZ3fyLn3Ht
	5sVORbCjtXAZd+fkSo8BycpFkn39q3cpgQImwXDRRnC/TOhzdyrmhaqiJBAT3yrxFDBZPoqcXUvpM
	BtSpn1uWdNnDhq+jzAftnPvumWh4TluLXdoIV23hLrCu1uZEuwp8GhJJPY4d1bR0yd/DvlWLzXuzZ
	GRafKgvvl70fJwwnZmNJDac3VQqEUzVC1Mzk3Z7UwA5GdBJGaCUpPY8CHjzeHpx9yhKbaQeFV3ug/
	A9nnvg/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7tfg-0000000EdK1-1gMj;
	Wed, 01 Apr 2026 11:23:40 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7tfd-0000000EdIY-2qx9
	for linux-mediatek@lists.infradead.org;
	Wed, 01 Apr 2026 11:23:38 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2b0b260d309so166145ad.1
        for <linux-mediatek@lists.infradead.org>; Wed, 01 Apr 2026 04:23:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775042616; x=1775647416; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+wLwW3RwfZlMNchucl4Q1BjkgKkbbVmuqcbZXsSlons=;
        b=AlR96aZuenuYYNVVRaA2bkaazoK/5q4O4+sro4/1cCx1WMHL6oF+sWS8I+BMeKBruN
         JrJher1L2PucxuhDmzwS/dg3Ur1Y5FQ4fngNxQf+WbMebB02DF/MTPWAtm0eT9QK3d0R
         2s8TB17Vw0ZR7quIoYNTZDXk79PlyssdNyX8Ju+u/DtZyMCp4RpzuAA3uYHHIvBIThGB
         IrSKGaX8D1BJCGGH+DIydwpNdtha+W4s/RZqWZVVBi8ZeOtfmSICrfC91m3ZGkXXS2Ni
         ow1soaCkS0vpNACBiCoP42jltuA4mFZSG/dKITkgRXk9GAj/wgtdoCUocOj1oR9zheXh
         Yohg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775042616; x=1775647416;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+wLwW3RwfZlMNchucl4Q1BjkgKkbbVmuqcbZXsSlons=;
        b=X9UjqEyoMTL98OnmwGTxvuarCDTvDtY42RPDe8r64XZ1m1zcVZR3lxvPrI1KkQbik7
         nTgU0m+C4c7e+RiNfLmaS1D+eSa4I9LrXZ1CmIwzPMvOz0p3eBCizS6MCvtA3t4Jpy2y
         WvmNcI6VRRO9Uv1wmwBeZ4HTJ2YunndMxyS2sD/AxqVGdmvegbTQl2qZjvHwUrrvs+Ny
         div0Qsc8A7hMUbyEpyoltvym4oEqpxuGVNfCQD0sAHvryjEQG2ENq8PtJd7Rgppliv61
         0Tb9jvOtEozt6bLFk4j8Dk2fzWBMLDcpKwDyviytNYNehufWgdU4/ydivRpLougMbc/N
         qCXA==
X-Forwarded-Encrypted: i=1; AJvYcCWYoie1eCwYMxTZ0MvQdFAqrLSzQw8fHUbnGNUfEvPYJfjFszywxrGPkyWnHioxM/2Q94PDFdfbXCaHyqkKlg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwSIYWjRp5I7fqs1ZYh0TAdFccCLvVCZxS9RR+Zxb2DMPy9/P+S
	+9fUDo5itEzLOBVL1LGDWdWeCWMSMmKVqwr5k+BCix+nuDW4y5hVcWN4B2Ub6F0l2A==
X-Gm-Gg: ATEYQzz6Dj77sdYMcYfPpwrP7wSahHEJV/OAbgtN9qIbhvRawtHzD86+/Sk16yetlwn
	3iKkmT71HgQKNT1bfTGiOjQxf36FinrHoZZjMBeiKJaH8ZPoQ2pwEx5DM7TLa7sNPWhLhz8HLjU
	KDz8hexKa2dZraASXhsu77hxfBKZRFNgnr2ZsKgtMlTuW4WVLQETOOrzbWlR2GTTmzIUcvUSZ5b
	1ENv5dNxPrt2qJ3xWAyG/ZirwfFi2ABEgy85TOHt2I7vxymm2yPjqJZnocecQVzFLOXrGsQyLnQ
	8ooGorxEgJW9+6urJrDP0mzRMStQitp7f0EMLW58qh0hmQbm6VMualcvvVCy5SbnEuvQuAFetFi
	uYOlJYJxGr4MQg2lvnR1QqrcabQzfaZ9I3F0wdMt6RN6LVbOAmTdu4RFcC7R3H6/cjuYy5Mr5D4
	3XQ6nZb9kdM5u3eZOgibfIDP/o/GCJidMxOHZHE4HDzOcM6WyUr+NfWiT51Q==
X-Received: by 2002:a17:902:ccca:b0:2ae:44db:570c with SMTP id d9443c01a7336-2b26b2b089amr2189835ad.12.1775042615401;
        Wed, 01 Apr 2026 04:23:35 -0700 (PDT)
Received: from google.com (10.129.124.34.bc.googleusercontent.com. [34.124.129.10])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35dbe606dd2sm6533691a91.3.2026.04.01.04.23.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 04:23:34 -0700 (PDT)
Date: Wed, 1 Apr 2026 11:23:23 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Albert Ou <aou@eecs.berkeley.edu>, asahi@lists.linux.dev,
	Baolin Wang <baolin.wang@linux.alibaba.com>, iommu@lists.linux.dev,
	Janne Grunau <j@jannau.net>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Joerg Roedel <joro@8bytes.org>,
	Jean-Philippe Brucker <jpb@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-riscv@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Neal Gompa <neal@gompa.dev>, Orson Zhai <orsonzhai@gmail.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
	Samuel Holland <samuel@sholland.org>, Sven Peter <sven@kernel.org>,
	virtualization@lists.linux.dev, Chen-Yu Tsai <wens@kernel.org>,
	Will Deacon <will@kernel.org>, Yong Wu <yong.wu@mediatek.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Lu Baolu <baolu.lu@linux.intel.com>,
	Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
	Joerg Roedel <joerg.roedel@amd.com>,
	Jon Hunter <jonathanh@nvidia.com>, patches@lists.linux.dev,
	Robin Murphy <robin.murphy@arm.com>,
	Samiullah Khawaja <skhawaja@google.com>, stable@vger.kernel.org,
	Vasant Hegde <vasant.hegde@amd.com>
Subject: Re: [PATCH] iommu: Always fill in gather when unmapping
Message-ID: <ac0AKyvHMYHlqL5i@google.com>
References: <0-v1-664d3acaabb9+78b-iommu_gather_always_jgg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0-v1-664d3acaabb9+78b-iommu_gather_always_jgg@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_042337_716340_56C3DE1D 
X-CRM114-Status: GOOD (  28.36  )
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

On Tue, Mar 31, 2026 at 04:56:22PM -0300, Jason Gunthorpe wrote:
> The fixed commit assumed that the gather would always be populated if
> an iotlb_sync was required.
> 
> arm-smmu-v3, amd, VT-d, riscv, s390, mtk all use information from the
> gather during their iotlb_sync() and this approach works for them.
> 
> However, arm-smmu, qcom_iommu, ipmmu-vmsa, sun50i, sprd, virtio,
> apple-dart all ignore the gather during their iotlb_sync(). They
> mostly issue a full flush.
> 
> Unfortunately the latter set of drivers often don't bother to add
> anything to the gather since they don't intend on using it. Since the
> core code now blocks gathers that were never filled, this caused those
> drivers to stop getting their iotlb_sync() calls and breaks them.
> 
> Since it is impossible to tell the difference between gathers that are
> empty because there is nothing to do and gathers that are empty
> because they are not used, fill in the gathers for the missing cases.
> 

I believe the problem is a fundamental disagreement between the core
layer and these drivers. The core assumes an empty gather means there
is no work to do, while these drivers expect a sync regardless. With
this, it seems we're forcing the drivers to lie to the core by 
populating a gather they don't actually use just to trigger the sync.

I was wondering if, as a longer-term direction, having an explicit flag
for these drivers to indicate they always require a sync would be a
cleaner way to handle this than the trivial population?

Just a thought, not a hard disagreement with the current approach..

> io-pgtable might have intended to allow the driver to choose between
> gather or immediate flush because it passed gather to
> ops->tlb_add_page(), however no driver does anything with it.
> 
> mtk uses io-pgtable-arm-v7s but added the range to the gather in the
> unmap callback. Move this into the io-pgtable-arm unmap itself. That
> will fix all the armv7 using drivers (arm-smmu, qcom_iommu,
> ipmmu-vmsa).
> 
> arm-smmu uses both ARM_V7S and ARM LPAE formats. The LPAE formats
> already have the gather population because SMMUv3 requires it, so it
> becomes consistent.
> 
> Add a trivial gather population to io-pgtable-dart.
> 
> Add trivial populations to sprd, sun50i and virtio-iommu in their
> unmap functions.
> 
> Fixes: 90c5def10bea ("iommu: Do not call drivers for empty gathers")
> Reported-by: Jon Hunter <jonathanh@nvidia.com>
> Closes: https://lore.kernel.org/r/8800a38b-8515-4bbe-af15-0dae81274bf7@nvidia.com
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  drivers/iommu/io-pgtable-arm.c  | 4 +++-
>  drivers/iommu/io-pgtable-dart.c | 3 +++
>  drivers/iommu/mtk_iommu.c       | 1 -
>  drivers/iommu/sprd-iommu.c      | 1 +
>  drivers/iommu/sun50i-iommu.c    | 1 +
>  drivers/iommu/virtio-iommu.c    | 2 ++
>  6 files changed, 10 insertions(+), 2 deletions(-)
>

Acked-by: Pranjal Shrivastava <praan@google.com>

Thanks,
Praan

