Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98060C43334
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Jun 2022 15:34:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z04GqdIq0nbbJumXjS8MwxzVoOdY5hmfOR7O5JxL2HI=; b=N/qdukl9yC6XSk
	Mm7fvqvSpOX4ty7U1ihP7xs6bfGtggRp5LBEz7B0GDhlc9I4m51A+3Tf9JFDPPC0v1wzz3eMsm1+j
	MyaphboEKvmDdcei08xX+CoPJQp6yx4kxxBAuh0EteTvumUy9KrVHzLRUAB1qhcM32NNLl506xQOp
	1lZ8bOy2Y153rCnznXXkVdf3gH+V96+aoc4Pgf7iSdPobS4ElbxcVNbJwOD7xJQylXxut+Hfq+tkj
	qNyHx1bm6B5ciSQ/V0dICclRxONriECPsEJjmRT5ttgyxCua/qzPQuO4pg4u89Wk7sct6zJTA7aGD
	mzGZmkyyP44Ztb8vrpZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nx9JH-0081GB-1N; Fri, 03 Jun 2022 15:33:59 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nx9J4-00818J-Ue; Fri, 03 Jun 2022 15:33:48 +0000
Received: by mail-ed1-x52e.google.com with SMTP id v19so10642574edd.4;
        Fri, 03 Jun 2022 08:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oq/7Nt8hH+8An2BVROqJRuKS0FRepvvGNwqF4LhpwJ4=;
        b=DzV8Du2HCN9eSAgLq3MmS7PYFIDS1VRh6mUcBFhEV21yX/IAgSreSh/t0mxzUtlImT
         rfOo2ZsgUXTal15h7gqJ3yfC67EuvjyOCTFfTAcVFPBROXrLgimo9pbQA2jauTKqdiHv
         8rYPBk3HZh2QD+PnAMm9CTzNQeC5kO98ipf8eDi4YcO3RoVLWo/3YXOTCHmj0RWgcqGV
         p2isfYtVh+mgHQ+vs/Y7M792D41OHL9f2VzELxLiQe6NQ8qI8ZrlyU+QZtDPjUQKZowp
         h7ivIuhuz8cQZi3TiKh9mmfcCwiZR1BLqwfiiwt7n4xMegJPJiL3JMgE2+XaZ9FfJl8o
         1xMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oq/7Nt8hH+8An2BVROqJRuKS0FRepvvGNwqF4LhpwJ4=;
        b=wlXxup/B1SLl+Y40f1Qc5jyprvRSJGahJr/rYgoAXsfnWP5+u8slYxEQQShm/xFlSf
         vtv389FjY/mEG5FvJ7yzA66iPAyXzuH1StWHEvO+3yOlObqMQeYQfN6JXT3J9+nQ2xrt
         JE82CyjlX9ur8xI+/Ce3T23pnXIJ9GUiS1UEOKx219g8VFye5bpiTBwkqMeyi3vb1bWO
         FZy4zOxWuXKsVwuN7meGFDIfxjQ4is2z1hfPkGFJOgof9HwDYmMtxL0Yarlf0W341f1t
         wSQqZbpgX73IDZXrLZ3e34XVGLp51T+T5JADFQouRQoh/wpIAe0laYVRrNrUsFC6nIZD
         Ediw==
X-Gm-Message-State: AOAM531YZYmrzU+Cd/erALoBWAVkNJPedVbAxp4KVdIjz/cbVsToE2eb
	rFgrZ0WfPxyx9aLzdMOlAnbRk25TKh3v2MiqPnM=
X-Google-Smtp-Source: ABdhPJx9Um0Wr5FdUvDXEQcoa+psDOXWhyl3zgwebxsBe9AFwJLM9ZB77SuRP2YlibAkeQyKiO2cU5TxiNb6TkEepiU=
X-Received: by 2002:a05:6402:1399:b0:410:9fa2:60d6 with SMTP id
 b25-20020a056402139900b004109fa260d6mr11253369edv.35.1654270416705; Fri, 03
 Jun 2022 08:33:36 -0700 (PDT)
MIME-Version: 1.0
References: <2997c5b0-3611-5e00-466c-b2966f09f067@nbd.name>
 <1654245968-8067-1-git-send-email-chen45464546@163.com> <CAKgT0Uc9vSEJxrev10Uc3P==+tTip7+7W=AF2uE+VB3GVyOTxg@mail.gmail.com>
In-Reply-To: <CAKgT0Uc9vSEJxrev10Uc3P==+tTip7+7W=AF2uE+VB3GVyOTxg@mail.gmail.com>
From: Alexander Duyck <alexander.duyck@gmail.com>
Date: Fri, 3 Jun 2022 08:33:25 -0700
Message-ID: <CAKgT0UdR-bdiZXsV_=8yJUS8zjoO6jeBS5bKNWAyxwLCiOP8ZQ@mail.gmail.com>
Subject: Re: [PATCH v2] net: ethernet: mtk_eth_soc: fix misuse of mem alloc
 interface netdev[napi]_alloc_frag
To: Chen Lin <chen45464546@163.com>
Cc: Felix Fietkau <nbd@nbd.name>, Jakub Kicinski <kuba@kernel.org>, John Crispin <john@phrozen.org>, 
	Sean Wang <sean.wang@mediatek.com>, Mark-MC.Lee@mediatek.com, 
	David Miller <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, matthias.bgg@gmail.com, Netdev <netdev@vger.kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	LKML <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220603_083347_031597_E493E4A4 
X-CRM114-Status: GOOD (  26.33  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Jun 3, 2022 at 8:25 AM Alexander Duyck
<alexander.duyck@gmail.com> wrote:
>
> On Fri, Jun 3, 2022 at 2:03 AM Chen Lin <chen45464546@163.com> wrote:
> >
> > When rx_flag == MTK_RX_FLAGS_HWLRO,
> > rx_data_len = MTK_MAX_LRO_RX_LENGTH(4096 * 3) > PAGE_SIZE.
> > netdev_alloc_frag is for alloction of page fragment only.
> > Reference to other drivers and Documentation/vm/page_frags.rst
> >
> > Branch to use alloc_pages when ring->frag_size > PAGE_SIZE.
> >
> > Signed-off-by: Chen Lin <chen45464546@163.com>
> > ---
> >  drivers/net/ethernet/mediatek/mtk_eth_soc.c |   22 ++++++++++++++++++++--
> >  1 file changed, 20 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> > index b3b3c07..772d903 100644
> > --- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> > +++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> > @@ -1467,7 +1467,16 @@ static int mtk_poll_rx(struct napi_struct *napi, int budget,
> >                         goto release_desc;
> >
> >                 /* alloc new buffer */
> > -               new_data = napi_alloc_frag(ring->frag_size);
> > +               if (ring->frag_size <= PAGE_SIZE) {
> > +                       new_data = napi_alloc_frag(ring->frag_size);
> > +               } else {
> > +                       struct page *page;
> > +                       unsigned int order = get_order(ring->frag_size);
> > +
> > +                       page = alloc_pages(GFP_ATOMIC | __GFP_COMP |
> > +                                           __GFP_NOWARN, order);
> > +                       new_data = page ? page_address(page) : NULL;
> > +               }
> >                 if (unlikely(!new_data)) {
> >                         netdev->stats.rx_dropped++;
> >                         goto release_desc;
> > @@ -1914,7 +1923,16 @@ static int mtk_rx_alloc(struct mtk_eth *eth, int ring_no, int rx_flag)
> >                 return -ENOMEM;
> >
> >         for (i = 0; i < rx_dma_size; i++) {
> > -               ring->data[i] = netdev_alloc_frag(ring->frag_size);
> > +               if (ring->frag_size <= PAGE_SIZE) {
> > +                       ring->data[i] = netdev_alloc_frag(ring->frag_size);
> > +               } else {
> > +                       struct page *page;
> > +                       unsigned int order = get_order(ring->frag_size);
> > +
> > +                       page = alloc_pages(GFP_KERNEL | __GFP_COMP |
> > +                                           __GFP_NOWARN, order);
> > +                       ring->data[i] = page ? page_address(page) : NULL;
> > +               }
> >                 if (!ring->data[i])
> >                         return -ENOMEM;
> >         }
>
> Actually I looked closer at this driver. Is it able to receive frames
> larger than 2K? If not there isn't any point in this change.
>
> Based on commit 4fd59792097a ("net: ethernet: mediatek: support
> setting MTU") it looks like it doesn't, so odds are this patch is not
> necessary.

I spoke too soon. I had overlooked the LRO part. With that being the
case you can probably optimize this code to do away with the get_order
piece entirely, at least during runtime. My main concern is that doing
that in the fast-path will be expensive so you would be much better
off doing something like
get_order(mtk_max_frag_size(MTK_RX_FLAGS_HWLRO)) which would be
converted into a constant at compile time since everything else would
be less than 1 page in size.

Also you could then replace alloc_pages with __get_free_pages which
would take care of the page_address call for you.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
