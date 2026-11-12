Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA7F7606A33F
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Nov 2026 23:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HDvz3pYD;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iDhs6wU2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ihiq+0qddYW2J+cwl+nH5pr1pmcIs2DvPvGp5YujItE=; b=HDvz3pYD4wIvag2DYjzSYZTttm
	zBnElnbD8a1cJfV0ZpEkFxkrbx0+sUY1Eqz+C9awzFXOsRgFPksdrNKuobj1wOvoVQqZA+8JoXopU
	NcdRvSCFK0LGLlmtpk9Bf1zYux9fhSW6te3WNCzVzzrIuphJVHZ8D9khvBed0x9Q1R3GoVF3pgaq5
	ODsSwT8i2Ez3bCTwtK1Wxwz0h6HG5oYIbdgNh3dCLaU5EprmHl5//nxtzRF57dnpu5VtJDRuaE4kn
	SNbJDuMSsMgLercf+z5E3PmE8dxWxTc7A0zPjTNKTzJZ94SrTl88qPJqxfwV+Hh0po7TuNbaB4Ftq
	h4IZmS3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xReW2-0000000BGl1-1kM9;
	Thu, 12 Nov 2026 23:47:38 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xReW1-0000000BGkb-1zZg;
	Thu, 12 Nov 2026 23:47:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D6147455B8;
	Thu, 12 Nov 2026 23:47:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB4301F000C5;
	Thu, 12 Nov 2026 23:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794527256;
	bh=ihiq+0qddYW2J+cwl+nH5pr1pmcIs2DvPvGp5YujItE=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=iDhs6wU2RWdAuAsKAj9BTZP4O9whlnUCeeRWRZ86YVknzdYZybxJjR8v9UpF2c/D/
	 4Y+cHpL2KHoA/cwnU5Z0OX/qhwqii0nLOtz+yYkn//3O8HBX8l2Su7yKg5ch/x4eEP
	 QCy7CYuXiGvYPX9SnsjhhRrP1IFO74+6y+NdspjPvEEmH6XGJbi8mrbDou0l9QCp4y
	 HPz1uIXfcPyBA0IYKVvqjXXKUz28WrZLrTXOiqQQYUiH1KfvrWkFHkiQexJf9YScXr
	 /T2lCT264WXKfhaPqu59TvvxAxXNE+pPj8wx07PH5eq+J23QR60zNM04cZFLQzdVi3
	 DHpxH85131v/Q==
Subject: Re: [PATCH net-next v4 1/3] net: ethernet: mtk_eth_soc: reset RX DMA
From: netdev-bot+sashiko@kernel.org
To: sandeeph@loljews.com
Date: Thu, 12 Nov 2026 23:47:35 +0000
Message-ID: <179452725530.2199510.183276812923001293@kernel.org>
In-Reply-To: <patch-6b45cf654903652eb4ed98e2e7514f5c@loljews.com>
References: <patch-6b45cf654903652eb4ed98e2e7514f5c@loljews.com>
X-sashiko-severity: Low
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
Cc: mason-cw.chang@mediatek.com, angelogioacchino.delregno@collabora.com, andrew+netdev@lunn.ch, netdev@vger.kernel.org, linux@armlinux.org.uk, linux-kernel@vger.kernel.org, edumazet@kernel.org, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com, kuba@kernel.org, pabeni@redhat.com, lorenzo@kernel.org, davem@davemloft.net, linux-arm-kernel@lists.infradead.org, nbd@nbd.name
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Thank you for your contribution! Sashiko AI review found more severe
issue(s) in other patches of this series. This mail is only an FYI, in case
you want to address the nit picks below when you respin.

Low priority / nit picks for your consideration:

- [Low] The commit message does not accurately describe the change.

--

net: ethernet: mtk_eth_soc: reset RX DMA

This patch moves the DMA_MAPPING_ERROR initialisation of dma_addr in
mtk_poll_rx() to the top of the RX loop, so it is reset on every
iteration. On MTK_36BIT_DMA SoCs, a descriptor that is released through
release_desc without a new mapping then keeps its own high address bits
in rxd2.

> net: ethernet: mtk_eth_soc: reset RX DMA
>
> [ ... ]
>
> With MTK_36BIT_DMA and DRAM above 4 GiB the hardware then DMAs the next
> frame to an address that is neither buffer, and the driver passes the
> stale contents of the untouched buffer up the stack.

[Severity: Low]
This isn't a bug, but could the subject line be more specific?

The patch only resets the local dma_addr variable at the top of each
iteration of the loop in mtk_poll_rx(). No RX DMA engine is reset.

In this driver, "reset" usually refers to the hardware/SER reset code
(MTK_RESETTING, mtk_hw_reset(), reset.monitor_work). Someone reading the
shortlog, or a stable backporter, could take this for a change to the
reset path.

Should the body also say that this completes commit 6e0490fc36cd ("net:
ethernet: mtk_eth_soc: fix SER panic with 4GB+ RAM")?

That commit added this check at release_desc in mtk_poll_rx():

		if (MTK_HAS_CAPS(eth->soc->caps, MTK_36BIT_DMA)) {
			if (unlikely(dma_addr == DMA_MAPPING_ERROR))
				addr64 = FIELD_GET(RX_DMA_ADDR64_MASK,
						   rxd->rxd2);
			else
				addr64 = RX_DMA_PREP_ADDR64(dma_addr);
		}

The check only works if dma_addr is DMA_MAPPING_ERROR on every release
path. Since commit e10a35abb3da ("net: ethernet: mtk_eth_soc: fix
uninitialized variable"), dma_addr is set only once, before the loop. So
the MTK_RESETTING path that 6e0490fc36cd was fixing can still pick up the
high bits of a buffer mapped for an earlier descriptor in the same poll.

mtk_rx_clean() then unmaps an address built from mismatched high and low
bits:

			if (MTK_HAS_CAPS(eth->soc->caps, MTK_36BIT_DMA))
				addr64 = RX_DMA_GET_ADDR64(rxd->rxd2);

			dma_unmap_single(eth->dma_dev, ((u64)rxd->rxd1 | addr64),
					 ring->buf_size, DMA_FROM_DEVICE);

This is the SER panic described in 6e0490fc36cd. The body covers the
misdirected DMA and the stale data passed up the stack, but not this
unmap during SER.

Would it make sense to mention it and reference 6e0490fc36cd in the
commit message?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/patch-fc08a7ef40667bf3017366e452e6d3c0%40loljews.com

