Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E257BC00144
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Aug 2022 17:58:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PyZ4L7I/mIwZxg09Gep2df0x0fY4ondC2tyBAL6Nf3A=; b=hmjIiElGFTaPbw9UkiP4QIM9Rx
	Uw34XKPf23N7uGqzi42iCsg/0Cy1i5/DnYLE6DDoNBRJPV7CdzWl0VT6oiDhgToTmT63UhwFaQBD7
	8nSuZMDxCVb2KLCZKFBuvrkUu+fDq4wgEdsAi7hSKmHxBgHkdocZLHNzgY83tg2JXkZtXpGhsY4s7
	G9awPYEocRR4vmRYctSB8xLT6UwQsdQFKXkeATbChciA2nWy3X3avdK8TupnMKq8qul/gVRkZ5qAy
	n094fJqE9RkuYY3az7xI5iBF8o0aR3+DwNfOBFqHQgKAvr1m1DPkfBMnqMYblEkYWRjB7Tm2cjDO/
	9NEBFcRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oIZg3-008S4e-5T; Mon, 01 Aug 2022 17:58:03 +0000
Received: from verein.lst.de ([213.95.11.211])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oIZfq-008Rn9-La; Mon, 01 Aug 2022 17:57:52 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
	id 27E2768AA6; Mon,  1 Aug 2022 19:57:45 +0200 (CEST)
Date: Mon, 1 Aug 2022 19:57:44 +0200
From: Christoph Hellwig <hch@lst.de>
To: yf.wang@mediatek.com
Cc: Christoph Hellwig <hch@lst.de>, Robin Murphy <robin.murphy@arm.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	"open list:DMA MAPPING HELPERS" <iommu@lists.linux.dev>,
	open list <linux-kernel@vger.kernel.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
	wsd_upstream@mediatek.com, Libo Kang <Libo.Kang@mediatek.com>,
	Ning Li <Ning.Li@mediatek.com>, Yong Wu <Yong.Wu@mediatek.com>,
	Miles Chen <miles.chen@mediatek.com>,
	jianjiao zeng <jianjiao.zeng@mediatek.com>
Subject: Re: [PATCH] dma-debug: Fix overflow issue in bucket_find_contain
Message-ID: <20220801175744.GA17256@lst.de>
References: <20220730114146.32669-1-yf.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220730114146.32669-1-yf.wang@mediatek.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220801_105751_055180_3307A8D3 
X-CRM114-Status: UNSURE (   9.92  )
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

> +	unsigned int shift = (1 << HASH_FN_SHIFT);

Please just add a constant for that right nxt to the HASH_FN_SHIFT
definition.

