Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62BBBC7115D
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Aug 2024 04:25:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KehGCdshXIiswVfMoHH7TH5FP9Sf44TF27Ug2EGyzZg=; b=NSkgO+XFK/QUg1dwoGfAzp5p/2
	3gMcBAEInQJmL+PRoyAejLKgy3zTFO5mwxfvuW3taaCu9M1QjfN3i2vramQ71k1SRgHgBa4ElNPNn
	1+2Doix1MEXk5URvLpPxPNBbhvEdakC3vsyFOh0rrA5iTs28NzHQN91IszyFuX5Fs01GBTgtMjsiD
	eZqfjmIE9JzwqLh55t6ZCzM0yFAz2TxDyfHfEcxPVyib7konXIjk7geok85AzWXrchFVAXhPd2Zv1
	PIedf55MPumBmwC0HZ/Moaq/cfGooFtAb9c+lHfi8U2WX7h7+xFDPlP09WA3Y0mKbOreqVg/fa91B
	88bjUYLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjWib-00000000TRM-3sn2;
	Thu, 29 Aug 2024 04:25:09 +0000
Received: from verein.lst.de ([213.95.11.211])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjWhj-00000000TII-3gED;
	Thu, 29 Aug 2024 04:24:17 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
	id 84AC868AA6; Thu, 29 Aug 2024 06:24:12 +0200 (CEST)
Date: Thu, 29 Aug 2024 06:24:12 +0200
From: Christoph Hellwig <hch@lst.de>
To: "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Christoph Hellwig <hch@lst.de>, iommu@lists.linux.dev,
	Robin Murphy <robin.murphy@arm.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
	dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org,
	linux-mmc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-hyperv@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: remove the dma_set_{max_seg_size,seg_boundary,min_align_mask}
 return value v2
Message-ID: <20240829042412.GA4537@lst.de>
References: <20240824034925.1163244-1-hch@lst.de> <yq1v7zkdu3s.fsf@ca-mkp.ca.oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <yq1v7zkdu3s.fsf@ca-mkp.ca.oracle.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240828_212416_080097_92F9950B 
X-CRM114-Status: UNSURE (   7.46  )
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

Thanks,

I've pulled the series into the dma-mapping for-next tree now.


