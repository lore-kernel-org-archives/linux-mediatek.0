Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A8C1C25B74
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 May 2024 16:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GLtPNS2jldkvChLLBZmBdFhCDLFJuWcDZglJtWyDICU=; b=y7N1ztUGbwx3M8oFUqLjJxgGEp
	aOCAJ/6vgOSyKvfs7azw9zWEJISCcqFLlGrCl9IIvdEm7HwUl8Vp9/fBtXqI+m2JxmKwuipxZXOvG
	UgpUVOtxSV9kWVOgsj98EA4jkkPIgks7EJlGOSAO6VkfbH0mQaE0GCrSfcY2lyXvggv9QU6TA85Of
	7wQFpHL/cZP3G6fYB4KDFULiEMcTcBQLW9urDKZbNIJNuPbQg8SbjWapecI8+W2fp6FsdVd3I6HzN
	ueLY5EVzyhSJlOB/qr6ZP6Acylc4+12gooTT3lzIBcjF/+MAT/MPAHPv7oIt65YrYJ6HVU7OOUmlV
	KI1C86tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBczH-0000000FmFz-3jxX;
	Mon, 27 May 2024 16:14:15 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBczD-0000000FmDF-3tyW;
	Mon, 27 May 2024 16:14:13 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.97.1)
	(envelope-from <daniel@makrotopia.org>)
	id 1sBcyu-000000007MD-3VgY;
	Mon, 27 May 2024 16:13:52 +0000
Date: Mon, 27 May 2024 17:13:42 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Sunil Kovvuri Goutham <sgoutham@marvell.com>
Subject: Re: [net v2] net: ethernet: mtk_eth_soc: handle dma buffer size soc
 specific
Message-ID: <kbzsne4rm4232w44ph3a3hbpgr3th4xvnxazdq3fblnbamrloo@uvs3jyftecma>
References: <20240527142142.126796-1-linux@fw-web.de>
 <BY3PR18MB4737D0ED774B14833353D202C6F02@BY3PR18MB4737.namprd18.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BY3PR18MB4737D0ED774B14833353D202C6F02@BY3PR18MB4737.namprd18.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240527_091411_998480_9D3C1FBF 
X-CRM114-Status: GOOD (  19.83  )
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
Cc: Steven Liu <steven.liu@mediatek.com>, SkyLake Huang <SkyLake.Huang@mediatek.com>, Sam Shih <Sam.Shih@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, John Crispin <john@phrozen.org>, Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>, Frank Wunderlich <linux@fw-web.de>, Paolo Abeni <pabeni@redhat.com>, Lorenzo Bianconi <lorenzo@kernel.org>, Mark Lee <Mark-MC.Lee@mediatek.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Felix Fietkau <nbd@nbd.name>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, May 27, 2024 at 03:55:55PM GMT, Sunil Kovvuri Goutham wrote:
> 
> 
> > -----Original Message-----
> > From: Frank Wunderlich <linux@fw-web.de>
> > Sent: Monday, May 27, 2024 7:52 PM
> > To: Felix Fietkau <nbd@nbd.name>; Sean Wang <sean.wang@mediatek.com>;
> > Mark Lee <Mark-MC.Lee@mediatek.com>; Lorenzo Bianconi
> > <lorenzo@kernel.org>; David S. Miller <davem@davemloft.net>; Eric Dumazet
> > <edumazet@google.com>; Jakub Kicinski <kuba@kernel.org>; Paolo Abeni
> > <pabeni@redhat.com>; Matthias Brugger <matthias.bgg@gmail.com>;
> > AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> > Cc: Frank Wunderlich <frank-w@public-files.de>; John Crispin
> > <john@phrozen.org>; netdev@vger.kernel.org; linux-kernel@vger.kernel.org;
> > linux-arm-kernel@lists.infradead.org; linux-mediatek@lists.infradead.org;
> > Daniel Golle <daniel@makrotopia.org>
> > Subject: [net v2] net: ethernet: mtk_eth_soc: handle dma buffer size soc specific
> > 
> > From: Frank Wunderlich <frank-w@public-files.de>
> > 
> > The mainline MTK ethernet driver suffers long time from rarly but annoying tx
> > queue timeouts. We think that this is caused by fixed dma sizes hardcoded for
> > all SoCs.
> > 
> > Use the dma-size implementation from SDK in a per SoC manner.
> > 
> > Fixes: 656e705243fd ("net-next: mediatek: add support for MT7623
> > ethernet")
> > Suggested-by: Daniel Golle <daniel@makrotopia.org>
> > Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> 
> ..............
> > 
> > diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> > b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> > index cae46290a7ae..f1ff1be73926 100644
> > --- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> > +++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> 
> .............
> > @@ -1142,40 +1142,46 @@ static int mtk_init_fq_dma(struct mtk_eth *eth)
> >  						       cnt * soc->tx.desc_size,
> >  						       &eth->phy_scratch_ring,
> >  						       GFP_KERNEL);
> 
> ..............
> > -	for (i = 0; i < cnt; i++) {
> > -		dma_addr_t addr = dma_addr + i * MTK_QDMA_PAGE_SIZE;
> > -		struct mtk_tx_dma_v2 *txd;
> > +		dma_addr = dma_map_single(eth->dma_dev,
> > +					  eth->scratch_head[j], len *
> > MTK_QDMA_PAGE_SIZE,
> > +					  DMA_FROM_DEVICE);
> > 
> 
> As per commit msg, the fix is for transmit queue timeouts.
> But the DMA buffer changes seems for receive pkts.
> Can you please elaborate the connection here.

*I guess* the memory window used for both, TX and RX DMA descriptors
needs to be wisely split to not risk TX queue overruns, depending on the
SoC speed and without hurting RX performance...

Maybe someone inside MediaTek (I've added to Cc now) and more familiar
with the design can elaborate in more detail.

