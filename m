Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFCE3C7EE31
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Jun 2025 07:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UfXqL1VCpMdcfpMpfKfH39ExE2JdNIFR6jVxQI6Iv4Q=; b=K69zwKbyVYvd3C4JrXkmBH5P/h
	1kevsCHFwdXJ4KI9X/tpgA4ho9LuJ5hnz/VDJAdEXAi9W5snXFeGeYNnPheu7AsBKJoMFD9+oQgS2
	K1Qrx0UVAuYFiGdGG1pz9OViPkbsllKxbiyNNf15MRPOVKIU6+Vw14eI1E4WQhWe5OdqC9eUo1QZN
	Vl0UD9Smw8Cz+qdRL4tR66nk1vSk3Zc8P89/ZCYYVBWggKGiDWZb0o1rjRNh8uKuVmXqnWljtV+nL
	ZQE0waXrcIoJwtELurqUu2XAkQmwa37xMzukpveAIwioPhff4xs0ZGsCiyzinpyblgRhQBAAj1+0n
	xkqVA1LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV347-0000000DlFp-0Hzl;
	Fri, 27 Jun 2025 07:00:03 +0000
Received: from mail.8bytes.org ([85.214.250.239])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV30s-0000000Dkgk-1Xew;
	Fri, 27 Jun 2025 06:56:43 +0000
Received: from 8bytes.org (p4ffe03ae.dip0.t-ipconnect.de [79.254.3.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id B2DBE4D686;
	Fri, 27 Jun 2025 08:56:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1751007397;
	bh=8cyCUVLrNKS6tVu4VEKnS5rU8EEbVvMM4YBN4njzgJc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XU+Ec1H6zYbpoJnBguJ7GDr9FEN9rGsre0pu8KqaKGy81Z4kSMmAWmsLnuh8C6DXX
	 NNDbZaaw/8hi+SEmWsp5x3pevvQorZ/gnxPIioOfE8HvHGxwz1755SXHcf4LYAXtZ2
	 4mCpj7FQzDFz6VXNwUJwKVqKYmzDv8PJ9OZQsqYZo+D5KCzC+3KXRAYaDgs30cvzbf
	 b9rnpd2DjGQE4e7TFeqIpB49EWs2qUxIo370ZNhi4u0ii2sX+By78Bt9A5CzII9ZQu
	 qAYA7JvY8BJ+VxyGicYP9L2BwXzRfRdSbcDYET1GuYoeHH7ug+hgwd2x2yUSyjfWiH
	 g0r0oGD4DIalg==
Date: Fri, 27 Jun 2025 08:56:35 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Alim Akhtar <alim.akhtar@samsung.com>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Albert Ou <aou@eecs.berkeley.edu>, asahi@lists.linux.dev,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Stuebner <heiko@sntech.de>, iommu@lists.linux.dev,
	Janne Grunau <j@jannau.net>,
	Jean-Philippe Brucker <jean-philippe@linaro.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
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
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Samuel Holland <samuel@sholland.org>, Sven Peter <sven@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Krishna Reddy <vdumpa@nvidia.com>, virtualization@lists.linux.dev,
	Chen-Yu Tsai <wens@csie.org>, Will Deacon <will@kernel.org>,
	Yong Wu <yong.wu@mediatek.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Lu Baolu <baolu.lu@linux.intel.com>,
	Kevin Tian <kevin.tian@intel.com>, patches@lists.linux.dev,
	Niklas Schnelle <schnelle@linux.ibm.com>,
	Sven Peter <sven@svenpeter.dev>,
	Tomasz Jeznach <tjeznach@rivosinc.com>
Subject: Re: [PATCH v2 0/7] Remove ops.pgsize_bitmap
Message-ID: <aF5Ao_yAbTGCPh3u@8bytes.org>
References: <0-v2-68a2e1ba507c+1fb-iommu_rm_ops_pgsize_jgg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0-v2-68a2e1ba507c+1fb-iommu_rm_ops_pgsize_jgg@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_235642_549447_82E9B541 
X-CRM114-Status: UNSURE (   7.09  )
X-CRM114-Notice: Please train this message.
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

> Jason Gunthorpe (7):
>   qiommu/arm-smmu-v3: Remove iommu_ops pgsize_bitmap
>   iommu/arm-smmu: Remove iommu_ops pgsize_bitmap
>   iommu: Remove ops.pgsize_bitmap from drivers that don't use it
>   iommu: Remove iommu_ops pgsize_bitmap from simple drivers
>   iommu/mtk: Remove iommu_ops pgsize_bitmap
>   iommu/qcom: Remove iommu_ops pgsize_bitmap
>   iommu: Remove ops->pgsize_bitmap

Applied, thanks Jason.

