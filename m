Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13E88C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 May 2022 09:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b1uyoshhEOQxMsAZQx5PFdPeppg/T3Sm0iiGdy20dg0=; b=dADfn5YjIXCS6P
	rmfF0uEVqMQBlA0umeIySAOP0lcgb0gAYRvI14prcwJWQ7V3+OnboKpOfK5n1eULru4Jo2z/ZB0Xn
	irCvIGkJ1X2bHgFONGb9/lpS2w8/V8cFoZxw738KIUbmuE9tNjGqs5EmHLteFj7BKeYnimp4403jt
	4oqmM1+o17bmeliyzBglLjg39utVJplgnTEY4OkcrBDAs66n73n6w5zxI04afohA5X86tDQV5TXd4
	+YI+I/fGDua3h3mp7L7B+GsWG94QfNMRoguE/V682qOAl1Td+kBuvNXsevon/7XjNisTK9lRzwnrF
	xy1KRaBIQXO1bhO31iqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrFlN-000mLX-Ea; Wed, 18 May 2022 09:14:37 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrFlL-000mHr-CQ
 for linux-mediatek@lists.infradead.org; Wed, 18 May 2022 09:14:36 +0000
Received: by mail-pg1-x532.google.com with SMTP id h186so1607130pgc.3
 for <linux-mediatek@lists.infradead.org>; Wed, 18 May 2022 02:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GjvQwPM1daZo8+jCqWpaTz2mh/pEzt/6tEe1yGu9dLM=;
 b=eQ6HR9gNmBjFbYML7Gui5OzZdhQ1ZJrrout1YiW/OYAgfXojWKCDuV86ePsOqi8nHc
 Q/zJMR8PLB4HUUvyQg60hVOtESQhHMagFOehN8Q+EZPU1tRYuO8ZMApeTCpvwtJHq/De
 I2AeL1NGadVpwvZU+UvRBmdFjJMVp+Wyrmw8BDFcLXdZAlyrOUA74BPZYYkT1C6LuOIm
 BOLQMyqpWZRz28NR53+azrOdFnIrUTeZ0IwvuFe0KwKlb7Q0ARYbekaBm3N4i61x5x9V
 +Ifyw1XogMpMIz4lWf9qMZRD3kLrTlp63mTXaxQHJ+9ErEVtg26/R+1HHAPNpPO8cg9i
 TLgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GjvQwPM1daZo8+jCqWpaTz2mh/pEzt/6tEe1yGu9dLM=;
 b=Hg9FCrMIdiWq5WtTFXgWPzGxwSJcsOq9KVIyImgc/ZjD9gqCR+uYi6OlY9VkyKoJe/
 HjkibMA/lDPUeNoAX9HL3J4WBfZBKsZglezCXHcBrK+C/LtAXioxKKWrvNVUPnQIY5SG
 PumcirbA89Z/vSPgKb7FQc59544fypq/aY/qYhen6QJkfzYiTu9zYc0/AobSdoutj8yk
 8hmxtyI6qsKhVUNTrQhJBRlNqJenuLWbZIDgmJ04+T1abyCq16q99zbDI0zVvaf+0KGs
 kjvEUkuUs3qPbMDtZHQvQ//4n/HgRaqaPAEFqx6C573AySDsqjIiC+EyhlvTSj07snv0
 Pz1Q==
X-Gm-Message-State: AOAM532+tC1TRZw1vgPIjVxJCXlyNrUqCG//5+b0t1YxSNG6Kki29/Ip
 5fB2JrNAy//K93lV3V+DYOhj23NGLklT2RLbetI+vg==
X-Google-Smtp-Source: ABdhPJympDV8mO/7wcUhujZ0IVK8Fi+T7b+h4c4ApG6fzgAOF2agcfhcnphsmdMxge90eiicfp3r24uSzxyxcZv9/dU=
X-Received: by 2002:a63:111f:0:b0:3da:ed0d:7623 with SMTP id
 g31-20020a63111f000000b003daed0d7623mr23285972pgl.586.1652865272760; Wed, 18
 May 2022 02:14:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220518090738.2694556-1-yangyingliang@huawei.com>
In-Reply-To: <20220518090738.2694556-1-yangyingliang@huawei.com>
From: Loic Poulain <loic.poulain@linaro.org>
Date: Wed, 18 May 2022 11:13:56 +0200
Message-ID: <CAMZdPi9uvh4E70-AXpGrdzkgh35mfWQbhL8Kxw_o9_DsfL2gbw@mail.gmail.com>
Subject: Re: [PATCH -next] net: wwan: t7xx: use GFP_ATOMIC under spin lock in
 t7xx_cldma_gpd_set_next_ptr()
To: Yang Yingliang <yangyingliang@huawei.com>
Cc: linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, 
 haijun.liu@mediatek.com, chandrashekar.devegowda@intel.com, 
 ricardo.martinez@linux.intel.com, davem@davemloft.net, kuba@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220518_021435_448518_22D08F28 
X-CRM114-Status: GOOD (  17.35  )
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

Hi Yang,

On Wed, 18 May 2022 at 10:57, Yang Yingliang <yangyingliang@huawei.com> wrote:
>
> Sometimes t7xx_cldma_gpd_set_next_ptr() is called under spin lock,
> so add a parameter in t7xx_cldma_gpd_set_next_ptr() to make if it
> use GFP_ATOMIC flag.
>
> Fixes: 39d439047f1d ("net: wwan: t7xx: Add control DMA interface")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> ---
>  drivers/net/wwan/t7xx/t7xx_hif_cldma.c | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/net/wwan/t7xx/t7xx_hif_cldma.c b/drivers/net/wwan/t7xx/t7xx_hif_cldma.c
> index 0c52801ed0de..1fa9bb763831 100644
> --- a/drivers/net/wwan/t7xx/t7xx_hif_cldma.c
> +++ b/drivers/net/wwan/t7xx/t7xx_hif_cldma.c
> @@ -91,9 +91,12 @@ static void t7xx_cldma_gpd_set_next_ptr(struct cldma_gpd *gpd, dma_addr_t next_p
>  }
>
>  static int t7xx_cldma_alloc_and_map_skb(struct cldma_ctrl *md_ctrl, struct cldma_request *req,
> -                                       size_t size)
> +                                       size_t size, bool is_atomic)

Would be simpler to directly pass the gfp_mask as a parameter.


>  {
> -       req->skb = __dev_alloc_skb(size, GFP_KERNEL);
> +       if (is_atomic)
> +               req->skb = __dev_alloc_skb(size, GFP_ATOMIC);
> +       else
> +               req->skb = __dev_alloc_skb(size, GFP_KERNEL);
>         if (!req->skb)
>                 return -ENOMEM;
>
> @@ -174,7 +177,7 @@ static int t7xx_cldma_gpd_rx_from_q(struct cldma_queue *queue, int budget, bool
>                 spin_unlock_irqrestore(&queue->ring_lock, flags);
>                 req = queue->rx_refill;
>
> -               ret = t7xx_cldma_alloc_and_map_skb(md_ctrl, req, queue->tr_ring->pkt_size);
> +               ret = t7xx_cldma_alloc_and_map_skb(md_ctrl, req, queue->tr_ring->pkt_size, false);
>                 if (ret)
>                         return ret;
>
> @@ -402,7 +405,7 @@ static struct cldma_request *t7xx_alloc_rx_request(struct cldma_ctrl *md_ctrl, s
>         if (!req->gpd)
>                 goto err_free_req;
>
> -       val = t7xx_cldma_alloc_and_map_skb(md_ctrl, req, pkt_size);
> +       val = t7xx_cldma_alloc_and_map_skb(md_ctrl, req, pkt_size, false);
>         if (val)
>                 goto err_free_pool;
>
> @@ -801,7 +804,7 @@ static int t7xx_cldma_clear_rxq(struct cldma_ctrl *md_ctrl, int qnum)
>                 if (req->skb)
>                         continue;
>
> -               ret = t7xx_cldma_alloc_and_map_skb(md_ctrl, req, rxq->tr_ring->pkt_size);
> +               ret = t7xx_cldma_alloc_and_map_skb(md_ctrl, req, rxq->tr_ring->pkt_size, true);
>                 if (ret)
>                         break;
>
> --
> 2.25.1
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
