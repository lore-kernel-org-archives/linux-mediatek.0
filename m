Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 418CDC54734
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Aug 2024 12:19:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TcpLMTXgakMBEQ724bvsd10qDi9GSKYxx9b9qziVjS8=; b=wWrj9lVQqNq1dj3DVHDALxkG94
	bJmJCnDjzKOxDXUymPH0yw3MXJ9VvbaFeNbcEJGPADuvJhFJUQ5Sq2Yhmg9GgaG9jBdagiC+3yhCL
	TT0Fbx02TtnA+hDp5XFv/XUQtLdtEbQWPU/npOSesMy7MeOSMjKDP/7MLLqDJr9ANXKqa0s+P0g4g
	KANjTI3PwlHBKWP4+8VoZWp/Orc64K/p2PQxAbsolXBSHf/qudNMQmsYD1yw2AzC/1ZR2QPRJWDC0
	A78Su4J3N7+o1zm3mkJV7y2ASOKrJuQiQCUIo+Wp/rc/mdS++orC+l9H7FxyiK9Kkf/Je4mT2TLGO
	eQ0VTehA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sivAa-0000000BBcs-0VOo;
	Tue, 27 Aug 2024 12:19:32 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sivAM-0000000BBV5-0paD;
	Tue, 27 Aug 2024 12:19:20 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6D0DCDA7;
	Tue, 27 Aug 2024 05:19:43 -0700 (PDT)
Received: from [10.1.196.40] (e121345-lin.cambridge.arm.com [10.1.196.40])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 185FF3F762;
	Tue, 27 Aug 2024 05:19:14 -0700 (PDT)
Message-ID: <92ebdc16-7938-462a-bb0e-4d5d368c5eb1@arm.com>
Date: Tue, 27 Aug 2024 13:19:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] scsi: check that busses support the DMA API before
 setting dma parameters
To: Christoph Hellwig <hch@lst.de>, iommu@lists.linux.dev
Cc: "Martin K. Petersen" <martin.petersen@oracle.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, linux-scsi@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, dmaengine@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-media@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-hyperv@vger.kernel.org,
 netdev@vger.kernel.org
References: <20240824034925.1163244-1-hch@lst.de>
 <20240824034925.1163244-2-hch@lst.de>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20240824034925.1163244-2-hch@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240827_051918_439599_3BB819B9 
X-CRM114-Status: GOOD (  17.10  )
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

On 24/08/2024 4:49 am, Christoph Hellwig wrote:
> We'll start throwing warnings soon when dma_set_seg_boundary and
> dma_set_max_seg_size are called on devices for buses that don't fully
> support the DMA API.  Prepare for that by making the calls in the SCSI
> midlayer conditional.

Just thinking ahead, might it be worth a logical "are SG segment limits 
relevant?" wrapper around the dev->dma_parms reference? Not a big deal 
for now if we think this site is the only user, so either way,

Reviewed-by: Robin Murphy <robin.murphy@arm.com>

> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>   drivers/scsi/scsi_lib.c | 11 +++++++++--
>   1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/scsi/scsi_lib.c b/drivers/scsi/scsi_lib.c
> index 3958a6d14bf457..7f0394c4492033 100644
> --- a/drivers/scsi/scsi_lib.c
> +++ b/drivers/scsi/scsi_lib.c
> @@ -1988,8 +1988,15 @@ void scsi_init_limits(struct Scsi_Host *shost, struct queue_limits *lim)
>   	if (shost->no_highmem)
>   		lim->features |= BLK_FEAT_BOUNCE_HIGH;
>   
> -	dma_set_seg_boundary(dev, shost->dma_boundary);
> -	dma_set_max_seg_size(dev, shost->max_segment_size);
> +	/*
> +	 * Propagate the DMA formation properties to the dma-mapping layer as
> +	 * a courtesy service to the LLDDs.  This needs to check that the buses
> +	 * actually support the DMA API first, though.
> +	 */
> +	if (dev->dma_parms) {
> +		dma_set_seg_boundary(dev, shost->dma_boundary);
> +		dma_set_max_seg_size(dev, shost->max_segment_size);
> +	}
>   }
>   EXPORT_SYMBOL_GPL(scsi_init_limits);
>   

