Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E4BBEC8738
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Sep 2023 16:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NSaBC2fQNwHLHILULAZrCunkQwEUAqTjPbZlKJHoYXY=; b=NbXsNAWCtS14HrSCqFmPMSEAQl
	wQQ6b9VoUBEcrZSBdo5EO5klYUSaANCNi0UldpE2NzcQy5OUN2BZxtNUdtXHjbt45Newc2Y+BWNi6
	gl+eHn0YRm0ukdJIw0OcnXrsFUxYLVTcW6YLITzqu4eIrBhYURcIHm+F3UdBZvcSkV0iIkOQNr1gC
	mDB5hmXV5AzyRTOR3i2rac505ojqXy0c0Zu72m5t9cBqykPeqt1ZWhgIp6VJIa1JWPA3hB+c3+Xse
	gu38UFsfq8Pdc0ZPOXTX/goHx7tZBKWmuHc3w5rGEJS17p/3UWIVa6HJ5g8xOLuTTr8/aTghrsOYO
	EKc8iJGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qeHlF-00CNva-13;
	Thu, 07 Sep 2023 16:21:41 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qeHlC-00CNv2-0q;
	Thu, 07 Sep 2023 16:21:39 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1D7F561260;
	Thu,  7 Sep 2023 16:21:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9199CC433CA;
	Thu,  7 Sep 2023 16:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694103696;
	bh=LPGi9Fu144GxPJSIGqNXekKcUHxzLfYXOlpXxINy/Pg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mv0HlTXEVpZzU8M4w0BK/j5CLaqBwvdIO2NqtmjnQ4SPuITIxYSnVFc88H7R1SZsG
	 PEkC13ricPNtd/sjnXwFdRJSg58HKd3RJNKdjDCtGjr53TVFcXvurmtX7oEbEunOnU
	 kqZzadCG+iRPM3GX/Xo8kC6x5iefiOWTxon2EN5T5ZGomBctN59MBAxKRFb3pm+UT4
	 UfIyeDItfZat6nbYpZVYl39qR8XCKMc3R1tLZVYoOiD+uQ+Hu6W2eRw7PA+tpA3aBj
	 Z2Bs5/yCb738Lv5/qpuD11ZIlkdyw/6rvVdn+3ss4BAuGkcr77B5QFZgj0M8pOPYCN
	 TdTm4UUateZmQ==
Date: Thu, 7 Sep 2023 18:21:31 +0200
From: Simon Horman <horms@kernel.org>
To: Daniel Golle <daniel@makrotopia.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, Felix Fietkau <nbd@nbd.name>,
	John Crispin <john@phrozen.org>, Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net] net: ethernet: mtk_eth_soc: fix uninitialized
 variable
Message-ID: <20230907162131.GK434333@kernel.org>
References: <9918f1ae-5604-4bdc-a654-e0566ca77ad6@moroto.mountain>
 <51d1ae238aecde07b2b4fe02cdab0dc87287cd96.1694099183.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <51d1ae238aecde07b2b4fe02cdab0dc87287cd96.1694099183.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230907_092138_363580_69FF1D70 
X-CRM114-Status: GOOD (  23.26  )
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

On Thu, Sep 07, 2023 at 04:14:20PM +0100, Daniel Golle wrote:
> Variable dma_addr in function mtk_poll_rx can be uninitialized on
> some of the error paths. In practise this doesn't matter, even random
> data present in uninitialized stack memory can safely be used in the
> way it happens in the error path.
> 
> However, in order to make Smatch happy make sure the variable is
> always initialized.
> 
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---
>  drivers/net/ethernet/mediatek/mtk_eth_soc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> index 31090490d47ce..6342eac90793e 100644
> --- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> +++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> @@ -2119,11 +2119,11 @@ static int mtk_poll_rx(struct napi_struct *napi, int budget,
>  	u8 *data, *new_data;
>  	struct mtk_rx_dma_v2 *rxd, trxd;
>  	int done = 0, bytes = 0;
> +	dma_addr_t dma_addr = NULL;

Hi Daniel,

I'm not sure that NULL is a valid value for a variable of type dma_addr_t.
Is DMA_MAPPING_ERROR more appropriate here?

Flagged by Sparse and, W=1 builds with gcc-13 and clang-16.

>  
>  	while (done < budget) {
>  		unsigned int pktlen, *rxdcsum;
>  		struct net_device *netdev;
> -		dma_addr_t dma_addr;
>  		u32 hash, reason;
>  		int mac = 0;
>  
> -- 
> 2.42.0
> 

