Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FA3AC3DA5D
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Jul 2024 16:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ac4TBOhO4Lvkf/O2AokVMuwcwMPMmOE7Ro7pJm1rvQk=; b=Bye/qO+UoAVa2rIftwo/mBTBeP
	r9XrBI+rEJoVxcZVJ97OlN1wdmDupsFDQaWrfBAiTXaf4EITfG4BqBO2z5kTgsUrwp1SLToCAEZva
	T49oLldg8VdL1aTW/5CUnJ9x3qay7EC0or75CRHdSSeqVRuBlo3nrVNtPfclahx5oJtc1bA5otQpZ
	22a5V+G7lQ/Ql4/WFr8hFHpv6RsiHbKdeppmDIDsov8SUT3ZqfHCBZE4h/LSh5xk+1DaUReJNat+X
	isted1/QoacT6NqbDHS6ouH8H8VARYSyPZMzTEC0RIxo2Ee7f9oyW9jnx700pVTFAE551NZgmAxJF
	E3XxyjjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sVvjc-0000000A3fw-2HrK;
	Mon, 22 Jul 2024 16:18:00 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sVvjE-0000000A3Xv-11vp
	for linux-mediatek@lists.infradead.org;
	Mon, 22 Jul 2024 16:17:38 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1fd65aaac27so18012055ad.1
        for <linux-mediatek@lists.infradead.org>; Mon, 22 Jul 2024 09:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fastly.com; s=google; t=1721665055; x=1722269855; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ac4TBOhO4Lvkf/O2AokVMuwcwMPMmOE7Ro7pJm1rvQk=;
        b=rh6Vclza4LMKzzamya67wQux9FsAtk9CbTUQabpSc9m924ii8ZWt2uYLMh0RN+2sEM
         Udp3JOJiincJrjZhaaaa1B2xZuWuoIVIcjpWt6criqFnyIM5ZbOXFc5C10DQ/thOY92J
         FUECVEofWJ7Ye0KlJb4q8JblE7N/d/E3uYwnE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721665055; x=1722269855;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ac4TBOhO4Lvkf/O2AokVMuwcwMPMmOE7Ro7pJm1rvQk=;
        b=wrKIylxjwmmrtV1iwiO1lgOXcKbAKQVyvuYsI63G8gIebXY7NbkhpM42OopZX/9+Th
         oVf8oAH6dal3wdQPKF4OVumY45FDJwYtfwdIIo0hWla6e3MJpmxarEBf67oxYNMqCBzb
         e+5n2LscqkPKy8/Tg6ZYPj2igq4RQytbkgm53WUqHdYamJHqMc2zhthShUofUkNpQDdg
         SWCQHDNHnBJn1s7fVsxK1nnJMO+3++NWVGPzBAPjjFx2wyedvIeYQenjWsVf2d3oNuTo
         SxpIP4+SuewWkk+Dhrn+l8yycwWC7IOlY0Dp0uxORkS+kI4AHDEF1N/XsIWYrnq8o+Cu
         ZdqQ==
X-Forwarded-Encrypted: i=1; AJvYcCXbaSaiURnKnC5+8cJZ7wJSPv3LFk2AN6O/Y9ekilhiEWaavAqi0jc+5+JoMtOTycekhaPbm9DjWNM+iClRSlAdNxLN35AZ9pNN+hLzX26HeqoV
X-Gm-Message-State: AOJu0Yx0bS2UHQfUzrEpwXgCwbXOV3+L2o8t/u+rWg5hfQQuYMBwqMuc
	Q3aisf2v6Rt8GylM8Agava3xAZJaoaVnuULwO5Dgr6RXP1DU69dmKbDSrwqrFmE=
X-Google-Smtp-Source: AGHT+IFB2y7zOFl4+Y01VeT43wEsBkhPo0FQ49eT3GIcwc/I7mB7L8n/Y/dKG9HTsZ7eJjeY9OWniQ==
X-Received: by 2002:a17:902:cec4:b0:1fd:b5fe:ee91 with SMTP id d9443c01a7336-1fdb5fef138mr3886125ad.25.1721665054849;
        Mon, 22 Jul 2024 09:17:34 -0700 (PDT)
Received: from LQ3V64L9R2 (c-24-6-151-244.hsd1.ca.comcast.net. [24.6.151.244])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70d1dbfe395sm2640504b3a.218.2024.07.22.09.17.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jul 2024 09:17:34 -0700 (PDT)
Date: Mon, 22 Jul 2024 09:17:31 -0700
From: Joe Damato <jdamato@fastly.com>
To: Elad Yifee <eladwf@gmail.com>
Cc: daniel@makrotopia.org, Felix Fietkau <nbd@nbd.name>,
	Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, bpf@vger.kernel.org
Subject: Re: [PATCH net-next RFC] net: ethernet: mtk_eth_soc: use prefetch
 methods
Message-ID: <Zp6GGzaJXhBcnGkC@LQ3V64L9R2>
Mail-Followup-To: Joe Damato <jdamato@fastly.com>,
	Elad Yifee <eladwf@gmail.com>, daniel@makrotopia.org,
	Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, bpf@vger.kernel.org
References: <20240720164621.1983-1-eladwf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240720164621.1983-1-eladwf@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240722_091736_459023_35FA3202 
X-CRM114-Status: GOOD (  20.08  )
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

On Sat, Jul 20, 2024 at 07:46:18PM +0300, Elad Yifee wrote:
> Utilize kernel prefetch methods for faster cache line access.
> This change boosts driver performance,
> allowing the CPU to handle about 5% more packets/sec.

Nit: It'd be great to see before/after numbers and/or an explanation of
how you measured this in the commit message.

> Signed-off-by: Elad Yifee <eladwf@gmail.com>
> ---
>  drivers/net/ethernet/mediatek/mtk_eth_soc.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> index 0cc2dd85652f..1a0704166103 100644
> --- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> +++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> @@ -1963,6 +1963,7 @@ static u32 mtk_xdp_run(struct mtk_eth *eth, struct mtk_rx_ring *ring,
>  	if (!prog)
>  		goto out;
>  
> +	prefetchw(xdp->data_hard_start);

Is there any reason to mix net_prefetch (as you have below) with
prefetch and prefetchw ?

IMHO: you should consider using net_prefetch and net_prefetchw
everywhere instead of using both in your code.

>  	act = bpf_prog_run_xdp(prog, xdp);
>  	switch (act) {
>  	case XDP_PASS:
> @@ -2039,7 +2040,7 @@ static int mtk_poll_rx(struct napi_struct *napi, int budget,
>  		idx = NEXT_DESP_IDX(ring->calc_idx, ring->dma_size);
>  		rxd = ring->dma + idx * eth->soc->rx.desc_size;
>  		data = ring->data[idx];
> -
> +		prefetch(rxd);

Maybe net_prefetch instead, as mentioned above?

>  		if (!mtk_rx_get_desc(eth, &trxd, rxd))
>  			break;
>  
> @@ -2105,6 +2106,7 @@ static int mtk_poll_rx(struct napi_struct *napi, int budget,
>  			if (ret != XDP_PASS)
>  				goto skip_rx;
>  
> +			net_prefetch(xdp.data_meta);
>  			skb = build_skb(data, PAGE_SIZE);
>  			if (unlikely(!skb)) {
>  				page_pool_put_full_page(ring->page_pool,
> @@ -2113,6 +2115,7 @@ static int mtk_poll_rx(struct napi_struct *napi, int budget,
>  				goto skip_rx;
>  			}
>  
> +			prefetchw(skb->data);

Maybe net_prefetchw instead, as mentioned above?

>  			skb_reserve(skb, xdp.data - xdp.data_hard_start);
>  			skb_put(skb, xdp.data_end - xdp.data);
>  			skb_mark_for_recycle(skb);
> @@ -2143,6 +2146,7 @@ static int mtk_poll_rx(struct napi_struct *napi, int budget,
>  			dma_unmap_single(eth->dma_dev, ((u64)trxd.rxd1 | addr64),
>  					 ring->buf_size, DMA_FROM_DEVICE);
>  
> +			net_prefetch(data);
>  			skb = build_skb(data, ring->frag_size);
>  			if (unlikely(!skb)) {
>  				netdev->stats.rx_dropped++;
> @@ -2150,6 +2154,7 @@ static int mtk_poll_rx(struct napi_struct *napi, int budget,
>  				goto skip_rx;
>  			}
>  
> +			prefetchw(skb->data);

Maybe net_prefetchw instead, as mentioned above?

