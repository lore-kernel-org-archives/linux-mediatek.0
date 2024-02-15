Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E15EC4829E
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Feb 2024 10:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RdR4GK6KgBwn0pGJB9p8ybSmrfkQbNAosPEYxYjz7as=; b=oXzWvF9SQ7HuJE6iNjQmMlqae/
	Yxj0pb6CS4J0U5iqO8fnUhDAKIOgPIQauQafvKFlAHRZ7e/R9Vjgi2UodPTSzXIwrDk1ExkM7wAsM
	1d2E9SnnNzsUblTTNPGapXdt/s0VvAWmbd98wzR8awx1h7vs/bpqLMMp14pZjQhV0Abyz82OVuUzL
	uEyi9qpgO87zG6wSVAIZXv01iUymILpTETgycp55UxK8upoRHFKRH9dpu2oLkyQPjfrs8Qg6PE83J
	sDZ1276JPkah1S5JW+pwYEuvwDPOWRxQBV0kS59a6pfV/tgvGmoU/WQ9nx+kXL35+FHdWHgZlNlza
	209QZtLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raZAZ-0000000Fp84-2TZv;
	Thu, 15 Feb 2024 10:40:43 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raZAU-0000000Fp3e-3hNJ;
	Thu, 15 Feb 2024 10:40:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1707993636;
	bh=Cd4xi9HhZEMAGJT2YQ0prCB+BmIoBoWmUrLCsLhn0aM=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=U9KIv3uhtMwUspJbyLete/tC9XPq1pMA/XhjUfDof9wK78Ug2zLTD2aBCzMm3jXKN
	 rwXQOus4f2twEzAWuoipJ0WD4cOAeVVZUzX3pe9V/tXitreMgw0Pol+lgzBqWYFkKy
	 DmHPyZnh96x06yLQyj3G6+YXENFLmelB9pYBae5U0VHvT2P0pC5zwkyF8KKbP+OQBH
	 nITptUjHkS/ABd+utumI7AXkST6DATejNc8SqhkLYFf+isk4DIkmA/nPWzoyhu8b36
	 x7P1UIpYYEc62rXo1wlnCKYz6NiaUC/fWzYXZVZbekUjx/3bhxQ1KDfSWcMexgVAgG
	 6KRnvNZ3/Mtnw==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 5D01A3780FC7;
	Thu, 15 Feb 2024 10:40:36 +0000 (UTC)
Message-ID: <c87af05e-9017-4806-88b1-7aa65f2b7070@collabora.com>
Date: Thu, 15 Feb 2024 11:40:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/9] soc: mediatek: cmdq: Remove unused helper funciton
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
References: <20240215004931.3808-1-chunkuang.hu@kernel.org>
 <20240215004931.3808-2-chunkuang.hu@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240215004931.3808-2-chunkuang.hu@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240215_024039_113697_C7773F67 
X-CRM114-Status: GOOD (  27.01  )
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

Il 15/02/24 01:49, Chun-Kuang Hu ha scritto:
> cmdq_pkt_create(), cmdq_pkt_destroy(), and cmdq_pkt_flush_async()
> are not used by all client drivers (MediaTek drm driver and
> MediaTek mdp3 driver),
> 

Hello CK,

We can technically force the hand to say that this is true - but only because
these two functions are copy-pasted in both mediatek-drm and MDP3 drivers with
no meaningful changes, as in, the only change is that `pkt` is supposed to be
preallocated in both of the variants, while the one in mtk-cmdq-helper allocates
it on its own.

Code duplication is something that we want to avoid, not something that we want
to embrace: removing those functions from cmdq-helper with the plan to keep
duplicating them in each MediaTek driver that uses CMDQ packets is plain wrong.

This - especially because I'm sure that we will see yet another copy-paste of
those two functions in a future ISP driver, bringing the duplication count to
3 (or actually, 3 by 2 functions = 6 times).

On the other hand, removing the cmdq_pkt_flush_async() function is something
that I *do* support, as it's only doing two simple calls that are not even
specific to cmdq, but more like "generic stuff".

In short, as it is right now, this is a NACK - but if you change this commit to
remove only cmdq_pkt_flush_async() I would agree.

The right thing to do is to remove the duplicated functions:
  - mtk_drm_cmdq_pkt_create()
  - mtk_drm_cmdq_pkt_destroy()
  - mdp_cmdq_pkt_create()
  - mdp_cmdq_pkt_destroy()

...and migrate both drivers to use the common cmdq helper code instea, but that's
something that can come later.

For now, you can simply perform the ->cl removal on all duplicated functions, then
we can migrate them all to the common helper, removing duplication all along.

Regards,
Angelo

> Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> ---
>   drivers/soc/mediatek/mtk-cmdq-helper.c | 59 --------------------------
>   include/linux/soc/mediatek/mtk-cmdq.h  | 40 -----------------
>   2 files changed, 99 deletions(-)
> 
> diff --git a/drivers/soc/mediatek/mtk-cmdq-helper.c b/drivers/soc/mediatek/mtk-cmdq-helper.c
> index b0cd071c4719..67e17974d1e6 100644
> --- a/drivers/soc/mediatek/mtk-cmdq-helper.c
> +++ b/drivers/soc/mediatek/mtk-cmdq-helper.c
> @@ -105,50 +105,6 @@ void cmdq_mbox_destroy(struct cmdq_client *client)
>   }
>   EXPORT_SYMBOL(cmdq_mbox_destroy);
>   
> -struct cmdq_pkt *cmdq_pkt_create(struct cmdq_client *client, size_t size)
> -{
> -	struct cmdq_pkt *pkt;
> -	struct device *dev;
> -	dma_addr_t dma_addr;
> -
> -	pkt = kzalloc(sizeof(*pkt), GFP_KERNEL);
> -	if (!pkt)
> -		return ERR_PTR(-ENOMEM);
> -	pkt->va_base = kzalloc(size, GFP_KERNEL);
> -	if (!pkt->va_base) {
> -		kfree(pkt);
> -		return ERR_PTR(-ENOMEM);
> -	}
> -	pkt->buf_size = size;
> -	pkt->cl = (void *)client;
> -
> -	dev = client->chan->mbox->dev;
> -	dma_addr = dma_map_single(dev, pkt->va_base, pkt->buf_size,
> -				  DMA_TO_DEVICE);
> -	if (dma_mapping_error(dev, dma_addr)) {
> -		dev_err(dev, "dma map failed, size=%u\n", (u32)(u64)size);
> -		kfree(pkt->va_base);
> -		kfree(pkt);
> -		return ERR_PTR(-ENOMEM);
> -	}
> -
> -	pkt->pa_base = dma_addr;
> -
> -	return pkt;
> -}
> -EXPORT_SYMBOL(cmdq_pkt_create);
> -
> -void cmdq_pkt_destroy(struct cmdq_pkt *pkt)
> -{
> -	struct cmdq_client *client = (struct cmdq_client *)pkt->cl;
> -
> -	dma_unmap_single(client->chan->mbox->dev, pkt->pa_base, pkt->buf_size,
> -			 DMA_TO_DEVICE);
> -	kfree(pkt->va_base);
> -	kfree(pkt);
> -}
> -EXPORT_SYMBOL(cmdq_pkt_destroy);
> -
>   static int cmdq_pkt_append_command(struct cmdq_pkt *pkt,
>   				   struct cmdq_instruction inst)
>   {
> @@ -426,19 +382,4 @@ int cmdq_pkt_finalize(struct cmdq_pkt *pkt)
>   }
>   EXPORT_SYMBOL(cmdq_pkt_finalize);
>   
> -int cmdq_pkt_flush_async(struct cmdq_pkt *pkt)
> -{
> -	int err;
> -	struct cmdq_client *client = (struct cmdq_client *)pkt->cl;
> -
> -	err = mbox_send_message(client->chan, pkt);
> -	if (err < 0)
> -		return err;
> -	/* We can send next packet immediately, so just call txdone. */
> -	mbox_client_txdone(client->chan, 0);
> -
> -	return 0;
> -}
> -EXPORT_SYMBOL(cmdq_pkt_flush_async);
> -
>   MODULE_LICENSE("GPL v2");
> diff --git a/include/linux/soc/mediatek/mtk-cmdq.h b/include/linux/soc/mediatek/mtk-cmdq.h
> index 649955d2cf5c..6c42d817d368 100644
> --- a/include/linux/soc/mediatek/mtk-cmdq.h
> +++ b/include/linux/soc/mediatek/mtk-cmdq.h
> @@ -59,21 +59,6 @@ struct cmdq_client *cmdq_mbox_create(struct device *dev, int index);
>    */
>   void cmdq_mbox_destroy(struct cmdq_client *client);
>   
> -/**
> - * cmdq_pkt_create() - create a CMDQ packet
> - * @client:	the CMDQ mailbox client
> - * @size:	required CMDQ buffer size
> - *
> - * Return: CMDQ packet pointer
> - */
> -struct cmdq_pkt *cmdq_pkt_create(struct cmdq_client *client, size_t size);
> -
> -/**
> - * cmdq_pkt_destroy() - destroy the CMDQ packet
> - * @pkt:	the CMDQ packet
> - */
> -void cmdq_pkt_destroy(struct cmdq_pkt *pkt);
> -
>   /**
>    * cmdq_pkt_write() - append write command to the CMDQ packet
>    * @pkt:	the CMDQ packet
> @@ -266,19 +251,6 @@ int cmdq_pkt_jump(struct cmdq_pkt *pkt, dma_addr_t addr);
>    */
>   int cmdq_pkt_finalize(struct cmdq_pkt *pkt);
>   
> -/**
> - * cmdq_pkt_flush_async() - trigger CMDQ to asynchronously execute the CMDQ
> - *                          packet and call back at the end of done packet
> - * @pkt:	the CMDQ packet
> - *
> - * Return: 0 for success; else the error code is returned
> - *
> - * Trigger CMDQ to asynchronously execute the CMDQ packet and call back
> - * at the end of done packet. Note that this is an ASYNC function. When the
> - * function returned, it may or may not be finished.
> - */
> -int cmdq_pkt_flush_async(struct cmdq_pkt *pkt);
> -
>   #else /* IS_ENABLED(CONFIG_MTK_CMDQ) */
>   
>   static inline int cmdq_dev_get_client_reg(struct device *dev,
> @@ -294,13 +266,6 @@ static inline struct cmdq_client *cmdq_mbox_create(struct device *dev, int index
>   
>   static inline void cmdq_mbox_destroy(struct cmdq_client *client) { }
>   
> -static inline  struct cmdq_pkt *cmdq_pkt_create(struct cmdq_client *client, size_t size)
> -{
> -	return ERR_PTR(-EINVAL);
> -}
> -
> -static inline void cmdq_pkt_destroy(struct cmdq_pkt *pkt) { }
> -
>   static inline int cmdq_pkt_write(struct cmdq_pkt *pkt, u8 subsys, u16 offset, u32 value)
>   {
>   	return -ENOENT;
> @@ -384,11 +349,6 @@ static inline int cmdq_pkt_finalize(struct cmdq_pkt *pkt)
>   	return -EINVAL;
>   }
>   
> -static inline int cmdq_pkt_flush_async(struct cmdq_pkt *pkt)
> -{
> -	return -EINVAL;
> -}
> -
>   #endif /* IS_ENABLED(CONFIG_MTK_CMDQ) */
>   
>   #endif	/* __MTK_CMDQ_H__ */


