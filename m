Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CC8CC43334
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jun 2022 05:42:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4p7AJXpyKf9f/1y5qsuA116NX2HYXVzeycU7A6gy3Bc=; b=VccGV9sUR3i8szyPdrImeWxd+0
	ecdOZHOM5OPCZ56z0gGCbGrnBBsAO0xfgU3eQaqr3CVPktCoogI34oNHVoUjHfDeakp9ccxiulZgN
	U/k/UkU8YeWxKol1OeXVXhU48G+U+NZF7AE4lQY513WZdaMwUTBO1UVDrApq7ZHb/YXfKd28V+iSq
	fDwxP4nLx6So+HWeEwz/+QpwNlttXGMDR6IM/R5b+V0LAz5XCKBbu0a4SrHa+/6vwPGfrI6XyBwyt
	mELa+2twRT6G4m74ofXVYaZQzfpX7u4eymW7TOqyePKod4BxF9kEQlKJ0lCGX+Y2W7iZj4G4YK8KO
	jOL0Pjcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4Fbq-00DWFq-Eq; Thu, 23 Jun 2022 05:42:30 +0000
Received: from verein.lst.de ([213.95.11.211])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4Fbe-00DWBl-Nt; Thu, 23 Jun 2022 05:42:20 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
	id 853FE68AA6; Thu, 23 Jun 2022 07:42:11 +0200 (CEST)
Date: Thu, 23 Jun 2022 07:42:11 +0200
From: Christoph Hellwig <hch@lst.de>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Christoph Hellwig <hch@lst.de>,
	Mark-PK Tsai <mark-pk.tsai@mediatek.com>,
	bjorn.andersson@linaro.org, robin.murphy@arm.com,
	m.szyprowski@samsung.com, matthias.bgg@gmail.com,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
	iommu@lists.linux-foundation.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, yj.chiang@mediatek.com
Subject: Re: [PATCH 0/2] dma-mapping, remoteproc: Fix dma_mem leak after
 rproc_shutdown
Message-ID: <20220623054211.GA12408@lst.de>
References: <20220422062436.14384-1-mark-pk.tsai@mediatek.com> <20220423174650.GA29219@lst.de> <20220622162540.GA1606016@p14s>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220622162540.GA1606016@p14s>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220622_224218_965519_9DAA7D61 
X-CRM114-Status: GOOD (  13.99  )
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

On Wed, Jun 22, 2022 at 10:25:40AM -0600, Mathieu Poirier wrote:
> On Sat, Apr 23, 2022 at 07:46:50PM +0200, Christoph Hellwig wrote:
> > Sigh.  In theory drivers should never declare coherent memory like
> > this, and there has been some work to fix remoteproc in that regard.
> > 
> > But I guess until that is merged we'll need somthing like this fix.
> 
> Should I take this in the remoteproc tree?  If so, can I get an RB?

Reluctantly-Acked-by: Christoph Hellwig <hch@lst.de>

