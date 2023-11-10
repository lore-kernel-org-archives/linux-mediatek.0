Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01736C4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Nov 2023 06:36:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6dqdlP6AxTKMdU01n11JFGLaHz+ZMH6iLEES/JhpcoI=; b=rw6QWAHgY+m+PXoXb7SU2RusdN
	Lj7iLdbnd/22hHQ3MREHTODRAAhuJkHtHCqv3ZVJ2KxvEPdyQC00FCK3XHLMdaD6Hp4+qf1c8O+xm
	Di/xi8+zsUVwrUiw3YRpKb8A2VZ7HMsJ/mxuOrvVixRNnqadkfbGgpLfaxOVKB++4Cj3kcFi8I3Jr
	dut+42RiIxR0TrANFXpzEgmHUKbtccWjDYxXhS6EDL64Y5m074DttrT1777kp0pkAQhkR32eIWIVW
	qD3Kxz8x4BFYBOTCjcLsWsAzMyRHeBJbzrDSH3/Q4UYCenJXJ8bgjyfnPvcloqs7vzHpoecS6lNme
	hYXd7KqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r1L8N-007yZp-2M;
	Fri, 10 Nov 2023 06:36:51 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.96 #2 (Red Hat Linux))
	id 1r1L8J-007yZG-1y;
	Fri, 10 Nov 2023 06:36:47 +0000
Date: Thu, 9 Nov 2023 22:36:47 -0800
From: Christoph Hellwig <hch@infradead.org>
To: ed.tsai@mediatek.com
Cc: ming.lei@redhat.com, hch@lst.de, Jens Axboe <axboe@kernel.dk>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	wsd_upstream@mediatek.com, chun-hung.wu@mediatek.com,
	casper.li@mediatek.com, will.shiu@mediatek.com,
	light.hsieh@mediatek.com, linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2] block: limit the extract size to align queue limit
Message-ID: <ZU3Pf0o2RCZ+dGNa@infradead.org>
References: <20231110051950.21972-1-ed.tsai@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231110051950.21972-1-ed.tsai@mediatek.com>
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

On Fri, Nov 10, 2023 at 01:19:49PM +0800, ed.tsai@mediatek.com wrote:
> +	if (bdev && blk_queue_pci_p2pdma(bdev->bd_disk->queue))
>  		extraction_flags |= ITER_ALLOW_P2PDMA;

As pointed out in reply to Ming, you really need to first figure out
if we can assume we have a valid bdev or not, and if not pass all the
relevant information separately.

> +	if (bdev && bio_op(bio) != REQ_OP_ZONE_APPEND) {
> +		unsigned int max = queue_max_bytes(bdev_get_queue(bdev));

The higher level code must not look at queue_max_bytes, that is only
used for splitting and might not even be initialized.

