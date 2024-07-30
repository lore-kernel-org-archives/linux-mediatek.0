Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B10EBC3DA61
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jul 2024 09:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+PyYxHAAjKY94HrEwTuVrgQc3+br0mLRkqh/sY77Zbs=; b=Exl9RRz6kZQImiIdBHKCXCohBm
	hJN+gWZG5thjJtX3ePs8qkKCwDS2B0Sb8h7qRxDe4M0eMB3X8Teqp5WUxEoGiBWU4dGdRKqAQIJmZ
	m9n+cOHIQWqD3e+h7A/jVXiaNYg4ElLGjgcFuT9E3UXGRf4qyQV7qyBJwgIsMUJbIENaP+cevezAv
	NHC8o8n0qminzVJ8P1lSC3Fmq0apJOrzxEeoo+uZDuCcGMh14+D3oefJamm4PO5m5b2nIxPRt67Jw
	O7HtsBwzikhuquq7yv/Cf+FOjeRNhrYzyeIh5WtpiIB6FzSYuVGvr8f6y4bJ6GEtLQgKycGf5qOoo
	RvFBS+6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYiiB-0000000EPhe-49dH;
	Tue, 30 Jul 2024 09:00:03 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYihG-0000000EPB2-0WB1
	for linux-mediatek@lists.infradead.org;
	Tue, 30 Jul 2024 08:59:08 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4280bca3960so25018935e9.3
        for <linux-mediatek@lists.infradead.org>; Tue, 30 Jul 2024 01:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fastly.com; s=google; t=1722329943; x=1722934743; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+PyYxHAAjKY94HrEwTuVrgQc3+br0mLRkqh/sY77Zbs=;
        b=okR+SkuBD3ajQbT48DzZ7apwPanPvDZdG/oCXu2UQ+b+4Kx7MtpCcPW5iAAOeX3nJG
         9hUWY+XU/wBzHOumyWe2Z0NFda2D7e64dSmb8e1x7erDnvRbAMJcqayEGbI1WMWbz5Tz
         bEIGUl1xA9UfLXX1pYGi3+YJBWKCzKo5sPfJg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722329943; x=1722934743;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+PyYxHAAjKY94HrEwTuVrgQc3+br0mLRkqh/sY77Zbs=;
        b=vYJccOURkGvqAnHDCrBNe+R2NBn8o0xY1U/asfLKO4rw3WiqAqxU3LEpT+BVt3popI
         062aaEkFOHLYZLseKRGuoIOMBOm2F+hX9eK+4VvC5glaCWq/HoOhJ6ZYI2aruC7cGmqX
         Uu62Wsw0QtBwj+qV8tQI1QTklQGkG8QGaB6ayFgbYmvtFOu1N61JTE1eFICOM1HfS1dk
         e2Gb1A4BN7It6DnBDsKYeNXOk6I+BQOfPyi6Gyf6IR66ZtJ2dFCzT3CVydIjHEQ2mb8w
         +c8Ziw4AWq55yoAwLAqwF+fCa1zomWb5VvNZFZ9WgW8dGq6tng/4ZsaZ6q9l9n+UCmG9
         oxuA==
X-Forwarded-Encrypted: i=1; AJvYcCW5zYT834CBkcSdIX872Z0tk1aTT5Vi4mI36ebyJHbzLcKOAhokPNt0HpAc4pY5ff6bBPMVpTYlPY20vn81MQW+00NOPXns5Du7n8EVotug+6ep
X-Gm-Message-State: AOJu0YwWUkUU9JClKD1skODGDNCQBOp9Q5pFcg18V5Bkyk/Oa2KrxYS2
	PI1EVdz26/RogK2/PS8xONzfL8Y16GUkiNkbEg8qKpIdOPHTR3BFOu8gc2P/3jY=
X-Google-Smtp-Source: AGHT+IF/ePhGnUz5oRY8da3ygbH+O32+pdLnV9wMLAT92Wkbz17fdqBPIg9jUaaUhazOspOKL0yp8Q==
X-Received: by 2002:a05:600c:1d9b:b0:426:5f7d:addc with SMTP id 5b1f17b1804b1-42811df6daamr52383965e9.37.1722329943453;
        Tue, 30 Jul 2024 01:59:03 -0700 (PDT)
Received: from LQ3V64L9R2 ([80.208.222.2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-428218a3934sm28986935e9.45.2024.07.30.01.59.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jul 2024 01:59:03 -0700 (PDT)
Date: Tue, 30 Jul 2024 09:59:01 +0100
From: Joe Damato <jdamato@fastly.com>
To: Elad Yifee <eladwf@gmail.com>
Cc: Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Daniel Golle <daniel@makrotopia.org>
Subject: Re: [PATCH net-next v2 1/2] net: ethernet: mtk_eth_soc: use prefetch
 methods
Message-ID: <ZqirVSHTM42983Qr@LQ3V64L9R2>
Mail-Followup-To: Joe Damato <jdamato@fastly.com>,
	Elad Yifee <eladwf@gmail.com>, Felix Fietkau <nbd@nbd.name>,
	Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Daniel Golle <daniel@makrotopia.org>
References: <20240729183038.1959-1-eladwf@gmail.com>
 <20240729183038.1959-2-eladwf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240729183038.1959-2-eladwf@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240730_015906_356954_567AF84A 
X-CRM114-Status: GOOD (  22.68  )
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

On Mon, Jul 29, 2024 at 09:29:54PM +0300, Elad Yifee wrote:
> Utilize kernel prefetch methods for faster cache line access.
> This change boosts driver performance,
> allowing the CPU to handle about 5% more packets/sec.
> 
> Signed-off-by: Elad Yifee <eladwf@gmail.com>
> ---
> Changes in v2:
> 	- use net_prefetchw as suggested by Joe Damato
> 	- add (NET_SKB_PAD + eth->ip_align) offset to prefetched data
> 	- use eth->ip_align instead of NET_IP_ALIGN as it could be 0,
> 	depending on the platform 
> ---
>  drivers/net/ethernet/mediatek/mtk_eth_soc.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> index 16ca427cf4c3..4d0052dbe3f4 100644
> --- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> +++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c

[...]

> @@ -2143,6 +2147,7 @@ static int mtk_poll_rx(struct napi_struct *napi, int budget,
>  			dma_unmap_single(eth->dma_dev, ((u64)trxd.rxd1 | addr64),
>  					 ring->buf_size, DMA_FROM_DEVICE);
>  
> +			net_prefetch(data + NET_SKB_PAD + eth->ip_align);
>  			skb = build_skb(data, ring->frag_size);
>  			if (unlikely(!skb)) {
>  				netdev->stats.rx_dropped++;
> @@ -2150,7 +2155,8 @@ static int mtk_poll_rx(struct napi_struct *napi, int budget,
>  				goto skip_rx;
>  			}
>  
> -			skb_reserve(skb, NET_SKB_PAD + NET_IP_ALIGN);
> +			net_prefetchw(skb->data);
> +			skb_reserve(skb, NET_SKB_PAD + eth->ip_align);

Based on the code in mtk_probe, I am guessing that only
MTK_SOC_MT7628 can DMA to unaligned addresses, because for
everything else eth->ip_align would be 0.

Is that right?

I am asking because the documentation in
Documentation/core-api/unaligned-memory-access.rst refers to the
case you mention, NET_IP_ALIGN = 0, suggesting that this is
intentional for performance reasons on powerpc:

  One notable exception here is powerpc which defines NET_IP_ALIGN to
  0 because DMA to unaligned addresses can be very expensive and dwarf
  the cost of unaligned loads.

It goes on to explain that some devices cannot DMA to unaligned
addresses and I assume that for your driver that is everything which
is not MTK_SOC_MT7628 ?

