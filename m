Return-Path: <SRS0=yMRY=6U=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D500C28CBC
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 May 2020 17:20:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E33DC20736
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 May 2020 17:20:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CiwFbN4Q";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="iuGK0qrh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E33DC20736
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mS0pR5hAzAboUfZ/L8AoD798xS04X9Xn6F4NZBzLYeA=; b=CiwFbN4QHmUNLJ
	bACp8OVv8TBfYb3sIhCfz2LLVBHZJ52qCIQhWKO2+uxh6nkmkIMUFM0jH8LXXeeZw7l6I8BfUMogV
	lks3Xx8ZOE+jndB6vZLBuYZIbXcLQrdKw/jc4yt0H840gDxNyGuv3G6Y51xc1JyTNpMVC3HiDdzT3
	lYMcXLCIJB78xEC+n/m+U2E97b5kJZOg9MlnvKfR1ILI8pKdfqzRsPdnM8xNv1CTH4LEmOyo1AKyu
	yv136aFXTOm8wr9/grpZksVF9ydB8sjiDTe1PjgTFDuktshE61Nf4S3ORqJ203xYd2+6TWI9bJGTl
	SHAxufBWc2ao/N8YimCg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jWNiW-0007RZ-5f; Wed, 06 May 2020 17:20:20 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jWNi8-0004rb-0n; Wed, 06 May 2020 17:19:57 +0000
Received: from kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com (unknown
 [163.114.132.4])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 303CA20736;
 Wed,  6 May 2020 17:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588785595;
 bh=Vx2laojPRA9af0b+TlZJnd1rj8BT6IbkCPf9uW8twE8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=iuGK0qrhphha7crkNxqfd/exR5+vrUBVOQvCaqmSpI6mMtTv2Bb9e5KAxHVaNhOJf
 cqiBsvormrGZm4pmx0ZvNJS1V19n58ngNSsoNqdXvSsTy/98rlzZ+Y1iImcjRJgUcu
 qekIZfCuEXFEPE/QxUXdK/yglIY8ZHVMjybnLH2o=
Date: Wed, 6 May 2020 10:19:53 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH 06/11] net: ethernet: mtk-eth-mac: new driver
Message-ID: <20200506101953.208e5366@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <CAMRc=MfmuKd64YaqrkhGFThDZd0_tRecR5H0QLY0cDJWSM-VgQ@mail.gmail.com>
References: <20200505140231.16600-1-brgl@bgdev.pl>
 <20200505140231.16600-7-brgl@bgdev.pl>
 <20200505110447.2404985c@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
 <CAMRc=MfmuKd64YaqrkhGFThDZd0_tRecR5H0QLY0cDJWSM-VgQ@mail.gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200506_101956_098110_33BF25E0 
X-CRM114-Status: GOOD (  17.14  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: devicetree <devicetree@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 netdev <netdev@vger.kernel.org>, Sean Wang <sean.wang@mediatek.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "David S . Miller" <davem@davemloft.net>, Fabien Parent <fparent@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 John Crispin <john@phrozen.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Mark Lee <Mark-MC.Lee@mediatek.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 6 May 2020 09:09:52 +0200 Bartosz Golaszewski wrote:
> > > +}  
> >
> > Why do you clean the TX ring from a work rather than from the NAPI
> > context?
> 
> So this was unclear to me, that's why I went with a workqueue. The
> budget argument in napi poll is for RX. Should I put some cap on the
> number of TX descriptors processed in napi context?

The prevailing wisdom is to not count the TX cleanup as work at all.
I think the best practice is to first clean up all the TX you can, 
and then do at must @budget of RX.

Perhaps one day we will come up with a good way of capping TX, but
today not counting it towards budget is the safe choice.

> > > +static int mtk_mac_receive_packet(struct mtk_mac_priv *priv)
> > > +{
> > > +     struct net_device *ndev = mtk_mac_get_netdev(priv);
> > > +     struct mtk_mac_ring *ring = &priv->rx_ring;
> > > +     struct device *dev = mtk_mac_get_dev(priv);
> > > +     struct mtk_mac_ring_desc_data desc_data;
> > > +     struct sk_buff *new_skb;
> > > +     int ret;
> > > +
> > > +     mtk_mac_lock(priv);
> > > +     ret = mtk_mac_ring_pop_tail(ring, &desc_data);
> > > +     mtk_mac_unlock(priv);
> > > +     if (ret)
> > > +             return -1;
> > > +
> > > +     mtk_mac_dma_unmap_rx(priv, &desc_data);
> > > +
> > > +     if ((desc_data.flags & MTK_MAC_DESC_BIT_RX_CRCE) ||
> > > +         (desc_data.flags & MTK_MAC_DESC_BIT_RX_OSIZE)) {
> > > +             /* Error packet -> drop and reuse skb. */
> > > +             new_skb = desc_data.skb;
> > > +             goto map_skb;
> > > +     }
> > > +
> > > +     new_skb = mtk_mac_alloc_skb(ndev);
> > > +     if (!new_skb) {
> > > +             netdev_err(ndev, "out of memory for skb\n");  
> >
> > No need for printing, kernel will complain loudly about oom.
> >  
> > > +             ndev->stats.rx_dropped++;
> > > +             new_skb = desc_data.skb;
> > > +             goto map_skb;
> > > +     }
> > > +
> > > +     skb_put(desc_data.skb, desc_data.len);
> > > +     desc_data.skb->ip_summed = CHECKSUM_NONE;
> > > +     desc_data.skb->protocol = eth_type_trans(desc_data.skb, ndev);
> > > +     desc_data.skb->dev = ndev;
> > > +     netif_receive_skb(desc_data.skb);
> > > +
> > > +map_skb:
> > > +     desc_data.dma_addr = mtk_mac_dma_map_rx(priv, new_skb);
> > > +     if (dma_mapping_error(dev, desc_data.dma_addr)) {
> > > +             dev_kfree_skb(new_skb);
> > > +             netdev_err(ndev, "DMA mapping error of RX descriptor\n");
> > > +             return -ENOMEM;  
> >
> > In this case nothing will ever replenish the RX ring right? If we hit
> > this condition 128 times the ring will be empty?
> 
> Indeed. What should I do if this fails though?

I think if you move things around it should work:

	skb = pop_tail();
	if (!skb)
		return;

	new_skb = alloc();
	if (!new_skb)
		goto reuse;

	dma_map(new_skb);
	if (error)
		goto reuse;
	
	dma_unmap(skb);

	if (do_packet_processing()) 
		free(skb);
	else
		receive(skb);

	put_on_ring(new_skb);


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
