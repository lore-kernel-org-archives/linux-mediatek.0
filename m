Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88E8CC77B75
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 May 2023 07:58:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pQ0/GDeAvYDN8Nmfs+Ixf3KnACZQuioMz4BUCvWBOPY=; b=dTPnJBDoqPBDGRDeWHdY8PlUHz
	P7ZUBrQGknVCH0OhTAMKG1JqAANHSWbRtj2j2I3dWJAlY1/+gzSCsRIS8WT5KTnoPzKX6J6QYfmcu
	HWfNp0aYvzH8/Y26/PKJn41MFILMPBySAcTuxD5m2aum5TOEXxuFbq3U7MM6CRcz70U5/SN6IgtMl
	3wRQEFoTcWbfbZecvMwPOb6p7tK1IfP20tQWnS9Ele5NQ/14UG8e/PcbG23jgvQHw4lUbfaA3JDQU
	WJn7cVkmRQL8BajHMEKPqb6ucoLpVOYdJzVKwlyWOHTLtWWUSi5TyAgdl9p6qssHkrnZSpUYRTii1
	Bzq3qbAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pypZj-004kau-1G;
	Tue, 16 May 2023 07:58:27 +0000
Received: from bee.tesarici.cz ([77.93.223.253])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pypZf-004kZ0-1y;
	Tue, 16 May 2023 07:58:25 +0000
Received: from meshulam.tesarici.cz (dynamic-2a00-1028-83b8-1e7a-4427-cc85-6706-c595.ipv6.o2.cz [IPv6:2a00:1028:83b8:1e7a:4427:cc85:6706:c595])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by bee.tesarici.cz (Postfix) with ESMTPSA id 022691617A9;
	Tue, 16 May 2023 09:58:20 +0200 (CEST)
Authentication-Results: mail.tesarici.cz; dmarc=fail (p=none dis=none) header.from=tesarici.cz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tesarici.cz; s=mail;
	t=1684223901; bh=vgp/F7g/spz90YI9EAe5zEYmTaqdHJkzRNoRv0QNyqo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=PiKtJUDXeLIXLILtSnIYL0BWgkz+1wtz3Skq/knjoFpezpja2UdK19+qCjZ7PudN3
	 Y30ABlU9VOPl9n8xKjK5pH/3a8JiDL195rF6HNNpdMHP6wArDy70+Zi6x/LxqQIQlu
	 ibT19G77KLEtOH9rfxVy+qRNl4Bzq6+qxaP4382xqIziuSKvlMU3p8RupyFg5U5W/o
	 tFWS2oTyGYyMLRjdnCK2qeWtiHho1mdvnndZuLvLV1+H80+qAAYo8Pq83ef4A8xA4R
	 +bQXyF5Kf4JJ/L0goFRsCBPLCj0g5AtWa0385zU9r4oMTsoeg4N3n8jhCgkY5fSenZ
	 tDBAOVxUZcDdg==
Date: Tue, 16 May 2023 09:58:19 +0200
From: Petr =?UTF-8?B?VGVzYcWZw61r?= <petr@tesarici.cz>
To: Niklas Schnelle <schnelle@linux.ibm.com>
Cc: Joerg Roedel <joro@8bytes.org>, Matthew Rosato <mjrosato@linux.ibm.com>,
 Will Deacon <will@kernel.org>, Wenjia Zhang <wenjia@linux.ibm.com>, Robin
 Murphy <robin.murphy@arm.com>, Jason Gunthorpe <jgg@ziepe.ca>, Gerd Bayer
 <gbayer@linux.ibm.com>, Julian Ruess <julianr@linux.ibm.com>, Pierre Morel
 <pmorel@linux.ibm.com>, Alexandra Winter <wintera@linux.ibm.com>, Heiko
 Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, Alexander
 Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger
 <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, Suravee
 Suthikulpanit <suravee.suthikulpanit@amd.com>, Hector Martin
 <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig
 <alyssa@rosenzweig.io>, David Woodhouse <dwmw2@infradead.org>, Lu Baolu
 <baolu.lu@linux.intel.com>, Andy Gross <agross@kernel.org>, Bjorn Andersson
 <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, Yong Wu
 <yong.wu@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Orson Zhai
 <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan
 Zhang <zhang.lyra@gmail.com>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, Thierry
 Reding <thierry.reding@gmail.com>, Krishna Reddy <vdumpa@nvidia.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Jonathan Corbet <corbet@lwn.net>,
 linux-s390@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux.dev, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-tegra@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v9 1/6] s390/ism: Set DMA coherent mask
Message-ID: <20230516095819.78442f09@meshulam.tesarici.cz>
In-Reply-To: <20230310-dma_iommu-v9-1-65bb8edd2beb@linux.ibm.com>
References: <20230310-dma_iommu-v9-0-65bb8edd2beb@linux.ibm.com>
	<20230310-dma_iommu-v9-1-65bb8edd2beb@linux.ibm.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230516_005823_828112_E03D2EF8 
X-CRM114-Status: GOOD (  21.40  )
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

On Mon, 15 May 2023 11:15:51 +0200
Niklas Schnelle <schnelle@linux.ibm.com> wrote:

> A future change will convert the DMA API implementation from the
> architecture specific arch/s390/pci/pci_dma.c to using the common code
> drivers/iommu/dma-iommu.c which the utilizes the same IOMMU hardware
> through the s390-iommu driver. Unlike the s390 specific DMA API this
> requires devices to correctly call set the coherent mask to be allowed
> to use IOVAs >2^32 in dma_alloc_coherent(). This was however not done
> for ISM devices. ISM requires such addresses since currently the DMA
> aperture for PCI devices starts at 2^32 and all calls to
> dma_alloc_coherent() would thus fail.
> 
> Reviewed-by: Alexandra Winter <wintera@linux.ibm.com>
> Reviewed-by: Matthew Rosato <mjrosato@linux.ibm.com>
> Signed-off-by: Niklas Schnelle <schnelle@linux.ibm.com>
> ---
>  drivers/s390/net/ism_drv.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/s390/net/ism_drv.c b/drivers/s390/net/ism_drv.c
> index 8acb9eba691b..1399b5dc646c 100644
> --- a/drivers/s390/net/ism_drv.c
> +++ b/drivers/s390/net/ism_drv.c
> @@ -660,7 +660,7 @@ static int ism_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>  	if (ret)
>  		goto err_disable;
>  
> -	ret = dma_set_mask(&pdev->dev, DMA_BIT_MASK(64));
> +	ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(64));

Ah. I love this change. I have already wondered a few times if the
coherent DMA mask for this device may actually be different from
dma_mask. Now I know. ;-)

Thanks!

Petr T

