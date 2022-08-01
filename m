Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D780C00144
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Aug 2022 18:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iAdj/2xC13t/0KKresws6w0+3eiKoMfP9yXSFmCqRP4=; b=AxoGrgrQPHlT3q0oS8vnIOfuMm
	uWYbe40t+Yxl29fePtOZM02fyH1t1VJCHYJTzlkA3S3WbC+N3N4RH7BlrP/RI+3icaPNtKJ6LzY4i
	8NP9DT0rR+Y3hSFBvkjLRUfEEkYXwiqD6EDbGnW3iHsmTzebTHrsMOd7f4BrRH/uQhtqaCeR7HL+o
	gaqZEV08LvIxflPwAvKwG4fQWCCYjM6XZuEACnH/RSo5Z79FW+YcNPnXXcYJIf2vnkzZtx+kSC+Qa
	pyIMXO2DxKFT3pEeYapODOn9Zct+boi3OtfuzysEk3GtzSL70URB0/5IeKpxc1O/vrBY5Ff9bZIu/
	ffhJCH8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oIZk2-008XYY-P1; Mon, 01 Aug 2022 18:02:10 +0000
Received: from verein.lst.de ([213.95.11.211])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oIZjj-008Wsv-PG; Mon, 01 Aug 2022 18:01:54 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
	id 4406D68AFE; Mon,  1 Aug 2022 20:01:47 +0200 (CEST)
Date: Mon, 1 Aug 2022 20:01:46 +0200
From: Christoph Hellwig <hch@lst.de>
To: Robin Murphy <robin.murphy@arm.com>
Cc: yf.wang@mediatek.com, Christoph Hellwig <hch@lst.de>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	"open list:DMA MAPPING HELPERS" <iommu@lists.linux.dev>,
	open list <linux-kernel@vger.kernel.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
	wsd_upstream@mediatek.com, Libo Kang <Libo.Kang@mediatek.com>,
	Ning Li <Ning.Li@mediatek.com>, Yong Wu <Yong.Wu@mediatek.com>,
	Miles Chen <miles.chen@mediatek.com>
Subject: Re: [PATCH] dma-debug: Remove warning in dma_debug_entry
Message-ID: <20220801180146.GB17256@lst.de>
References: <20220730085657.31977-1-yf.wang@mediatek.com> <19a0a508-fb39-8b06-ce0f-ce26767ef57f@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <19a0a508-fb39-8b06-ce0f-ce26767ef57f@arm.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220801_110152_012559_DF2D76DD 
X-CRM114-Status: GOOD (  16.37  )
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

On Mon, Aug 01, 2022 at 01:07:10PM +0100, Robin Murphy wrote:
> Furthermore, even for the valid dma-buf import case I'm not convinced that 
> the SKIP_CPU_SYNC check can be dropped either. If one device can import a 
> buffer while another device is already accessing it, there are definitely 
> combinations of parameters which could lead to potential data loss (e.g. a 
> non-coherent DMA_TO_DEVICE mapping during a non-coherent DMA_FROM_DEVICE 
> access, a or non-coherent DMA_FROM_DEVICE mapping during a coherent 
> DMA_TO_DEVICE access).

Yes.  While there is a rare case where double mapping actually works
(exactly the same region, no access to the data between the invidual
mapping and unmapping calls), there is absolutely no good reason to
support it.  The additional cache maintainance operations will still
take some overhead that can be skipped, and it makes the rules very
confusing.  It is much better to fix the upper layers to use
the SKIP_CPU_SYNC flag in case of multiple mappings, which also
clearly documents what is being done there.

