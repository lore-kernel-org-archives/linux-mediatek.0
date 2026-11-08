Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C70D0606A321
	for <linux-mediatek@archiver.kernel.org>; Sun,  8 Nov 2026 15:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=F46B2k4i;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TJYC7u/C
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=tS7Um5DMhxKUm027vq32NZL/bvrzTjSz3foWuqEhkjw=; b=F46B2k4iAICcNxPMa8OoKPYoUz
	DREbw1R3tyHT6/H0CAnYWuzl61NBW8QbwhoT3VutIsRCFbSMUMX2pwQqBnf1rkVNFS/pXsvGu3SDM
	y2k8tGBH0Eemm0HGPjRi1zlYNPMiZWWCgKdMSeKt/X8lEvj0UyWYgxwFx52gjBP6VQtz9HlNKs0GI
	in6EDYT+bn9ttFO5Wm+7vf83di8g+jZxgd9Hn5oQvpqsI3l7fFzEINuLfU/AUJ65nHuFqOIjROgOZ
	O6ErWpF9sT9pZz5Koro9/zOKu9ODxqUXA/Q9xHz5XC00vVOwutDrW1lf27stZ/hSw68U8Hwr5EriY
	v4HAzLmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ4fw-0000000GIXQ-2p3N;
	Sun, 08 Nov 2026 15:19:20 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ4fu-0000000GIXD-43uF;
	Sun, 08 Nov 2026 15:19:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 54D58406A5;
	Sun,  8 Nov 2026 15:19:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60DE21F0089F;
	Sun,  8 Nov 2026 15:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794151158;
	bh=tS7Um5DMhxKUm027vq32NZL/bvrzTjSz3foWuqEhkjw=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=TJYC7u/CLpWP+lzfJMc9ogVFoYpkWrgWg5JbRhCFshpLRaQG/otsIs0n1LJZoFASr
	 rWWWHMgua2gKEFRX6DHGPWFV1lB1t3Mk+Kw4isKdJUy1OPpEC81AUWd1s9S1mmlNti
	 UOa9dfULVU8gkzxXy1DgF82nvvOSg9+pfQ2Oi1TwFDPP4kmzvZDyxgTDKXNB/cC5W8
	 a0OsfQed83okN9EjHVZh+uyWM+GTQZEgT3+9s65fScHNciJulbYod0ch2Atk0oySXB
	 tK/Riqpr1jDaRIxQiApBF5AoBRiWzX5LPIrAhkGaVf6D7axKdK/yl5+0e6zMHVI9Fp
	 lcgVPdV//Ju9g==
Subject: Re: [PATCH] net: ethernet: mtk_wed: fix double free in mtk_wed_rx_reset
From: netdev-bot+sashiko@kernel.org
To: hujy652@gmail.com
Cc: nbd@nbd.name, lorenzo@kernel.org, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 sujuan.chen@mediatek.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, sashiko-bot@kernel.org,
 stable@vger.kernel.org
Date: Sun, 08 Nov 2026 15:19:16 +0000
Message-ID: <179415115690.994134.6626930296330601239@kernel.org>
In-Reply-To: <20261104-double-free-v1-1-efa52326702f@gmail.com>
References: <20261104-double-free-v1-1-efa52326702f@gmail.com>
X-sashiko-severity: High
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Thank you for your contribution! Sashiko AI review found 1 potential
issue(s) to consider.

Critical: 0 · High: 1 · Medium: 0 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] The patch fixes the immediate double free by removing the second
  mtk_wed_hwrro_free_buffer() call from mtk_wed_rx_reset().

--

net: ethernet: mtk_wed: fix double free in mtk_wed_rx_reset

mtk_wed_free_rx_buffer() already calls mtk_wed_hwrro_free_buffer(). The
patch therefore drops the second mtk_wed_hwrro_free_buffer() call from
mtk_wed_rx_reset(), which caused a double free of the hw_rro buffers on
WED v3.

Link: https://sashiko.dev/#/map/216156

> diff --git a/drivers/net/ethernet/mediatek/mtk_wed.c b/drivers/net/ethernet/mediatek/mtk_wed.c
> index f40ac5794341c..5e9674c9e63ab 100644
> --- a/drivers/net/ethernet/mediatek/mtk_wed.c
> +++ b/drivers/net/ethernet/mediatek/mtk_wed.c
> @@ -1723,7 +1723,6 @@ mtk_wed_rx_reset(struct mtk_wed_device *dev)
>  				   false);
>  	}
>  	mtk_wed_free_rx_buffer(dev);
> -	mtk_wed_hwrro_free_buffer(dev);

[Severity: High]
This removes the duplicate call, but the free helpers still never clear the
pointers they free. Can the stale rx_buf_ring.desc, hw_rro.desc and
hw_rro.pages still get freed a second time later?

mtk_wed_free_rx_buffer() frees the descriptor ring and leaves
dev->rx_buf_ring.desc set:

drivers/net/ethernet/mediatek/mtk_wed.c:mtk_wed_free_rx_buffer() {
	...
	dev->wlan.release_rx_buf(dev);
	dma_free_coherent(dev->hw->dev, dev->rx_buf_ring.size * sizeof(*desc),
			  desc, dev->rx_buf_ring.desc_phys);

	mtk_wed_hwrro_free_buffer(dev);
}

mtk_wed_hwrro_free_buffer() works the same way. It unmaps and frees the
pages, calls dma_free_coherent() on hw_rro.desc and kfree()s hw_rro.pages,
but leaves both pointers set.

After the reset path:

mtk_wed_device_dma_reset()
  mtk_wed_reset_dma()
    mtk_wed_rx_reset()
      mtk_wed_free_rx_buffer()

these pointers stay dangling until mtk_wed_start()->mtk_wed_rx_buffer_alloc()
overwrites them. Some paths seem to skip that step.

In mt7915_dma_start(), mtk_wed_device_start() is never called if the WO
rx stats message fails:

	ret = mt7915_mcu_wed_enable_rx_stats(dev);
	if (ret)
		return ret;

	mtk_wed_device_start(&dev->mt76.mmio.wed, wed_irq_mask);

mtk_wed_rx_buffer_alloc() returns -ENOMEM before it assigns
dev->rx_buf_ring.desc if dma_alloc_coherent() fails.

mtk_wed_hwrro_buffer_alloc() returns -ENOMEM in two places. If the
page_list allocation fails, it returns before assigning hw_rro.pages. If
the desc dma_alloc_coherent() fails, it returns before assigning
hw_rro.desc.

In any of these cases, the next unbind or remove would do:

__mtk_wed_detach()
  mtk_wed_free_rx_rings()
    mtk_wed_free_rx_buffer()
      dma_free_coherent() on the old rx_buf_ring.desc
      mtk_wed_hwrro_free_buffer()
        reads page_list[] from the already kfree()d hw_rro.pages
        dma_unmap_page() and __free_page() on already freed pages
        dma_free_coherent() on the old hw_rro.desc
        kfree() on the old hw_rro.pages

The if (!desc) and if (!page_list) checks don't help here, because the
pointers are still non-NULL.

Would it be better to set rx_buf_ring.desc, hw_rro.desc and hw_rro.pages
to NULL in mtk_wed_free_rx_buffer() and mtk_wed_hwrro_free_buffer()? The
commit message names the same cause:

  "This would cause double free because dma_free_coherent doesn't set
  freed desc to NULL."

Clearing the pointers would also have made the removed duplicate call
harmless.

>  
>  	return 0;
>  }

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261104-double-free-v1-1-efa52326702f%40gmail.com

