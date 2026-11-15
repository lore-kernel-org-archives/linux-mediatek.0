Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8743606A8AC
	for <linux-mediatek@archiver.kernel.org>; Sun, 15 Nov 2026 00:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=AzRt0xn2;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Wd70A3+b
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=p1qeezPkjYvl7m0buWilarmr+j2OC6NCeVnUky5I7Ec=; b=AzRt0xn2rNhz3ifybcuoRDK7Xb
	5q8w5L2kJ+vWQrmV9CyQUbcLjfNrDcIggNMLuCWjgAjyJcVZlzAbrzHAjXt004sMw8TXoyTc6wJrl
	g3QHdh3DPGebe/doYSmWz7wvULHMAjadLRU7oE30eYdAhQvRrPQGW7Py5BPvMatvnfUFU4wBjG32f
	lpjsRTnr5C71hojN/KxLESiJa1X41ryPUPz4K1Qgae/RkRAh1m1ML7+S6p3OEg/GqFf+3rvP4MXpb
	HY/Sn+QLVzxlSxR/MDoo3qzPQ/0by7ZBgJ0ZRMzeqpIIokZT8nTGdZhllO/xDBobxRS0K5I1NdXzW
	vHr+imfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSOMn-0000000Gvmh-1nU6;
	Sun, 15 Nov 2026 00:45:09 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSOMl-0000000GvmB-13Fk;
	Sun, 15 Nov 2026 00:45:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7F99561B38;
	Sun, 15 Nov 2026 00:45:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 547D91F000C5;
	Sun, 15 Nov 2026 00:45:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794703505;
	bh=p1qeezPkjYvl7m0buWilarmr+j2OC6NCeVnUky5I7Ec=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Wd70A3+bv0aZmQ/elxnY9+B8Gdb5zZ2T+8MT97x8b2jpwba7sdix9RBhgo5wJFd/u
	 0ZL7dD+iz69zk+ANATes9YnkytLrURvVag+CDosKM10OQGRvQJBDOMzvf8uZ/q6Bmp
	 TBI+RwiaJUmaGAleMRXQVo2rUDEeGSrWwrIfGZqtC1ES3Mw2HJ3UzYtyPuAjwoWQLj
	 70rMAV2CdmsnwHGCPOsc/suOiBD2aLgqMXe5MoLtaCVSDAz2R4IGqmjZFaAqTOwbyv
	 gyKvkbwhwIwO3RqBzg/v4oA0O8Rra4qENJDC0yYFsf7JBI7yn+Iq+pWz5T9Bjz79U/
	 Z6wnD3unudI5A==
Subject: Re: [PATCH net-next v6 1/3] net: ethernet: mtk_eth_soc: fix the RX
From: netdev-bot+sashiko@kernel.org
To: sandeeph@loljews.com
Date: Sun, 15 Nov 2026 00:45:03 +0000
Message-ID: <179470350391.2199510.1485391861090132860@kernel.org>
In-Reply-To: <patch-4b4c5003bcf028fafd094e719c5e910b@loljews.com>
References: <patch-4b4c5003bcf028fafd094e719c5e910b@loljews.com>
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
Cc: mason-cw.chang@mediatek.com, linux-kernel@vger.kernel.org, angelogioacchino.delregno@collabora.com, andrew+netdev@lunn.ch, netdev@vger.kernel.org, linux@armlinux.org.uk, daniel@makrotopia.org, edumazet@kernel.org, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com, kuba@kernel.org, pabeni@redhat.com, lorenzo@kernel.org, davem@davemloft.net, linux-arm-kernel@lists.infradead.org, nbd@nbd.name
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

- [Low] The commit message for "net: ethernet: mtk_eth_soc: fix the RX"
  gets the history and cause backwards.
- [Low] The subject line "net: ethernet: mtk_eth_soc: fix the RX" does
  not say what is being fixed.

--

net: ethernet: mtk_eth_soc: fix the RX

This patch resets dma_addr to DMA_MAPPING_ERROR at the start of every
loop iteration in mtk_poll_rx(). Without it, a descriptor that goes to
release_desc without a new mapping can pick up high address bits left
over from an earlier iteration. That matters on MTK_36BIT_DMA SoCs with
DRAM above 4 GiB.

> That protection was added by commit 6e0490fc36cd ("net: ethernet:
> mtk_eth_soc: fix SER panic with 4GB+ RAM") for the MTK_RESETTING path,
> but commit e10a35abb3da ("net: ethernet: mtk_eth_soc: fix
> uninitialized variable") moved the DMA_MAPPING_ERROR initialisation
> out of the loop, so it only holds for the first iteration.

[Severity: Low]
Is this history accurate? e10a35abb3da is dated 2023-09-10 and
6e0490fc36cd is dated 2025-04-27, so e10a35abb3da came first.

e10a35abb3da also does not appear to move an initialiser out of the
loop. Before it, mtk_poll_rx() declared dma_addr inside the while loop
with no initialiser:

    dma_addr_t dma_addr;

e10a35abb3da moved the declaration to function scope:

    dma_addr_t dma_addr = DMA_MAPPING_ERROR;

It also added the first dma_addr != DMA_MAPPING_ERROR check at
release_desc. Later, 6e0490fc36cd replaced that check with the FIELD_GET()
branch:

    if (unlikely(dma_addr == DMA_MAPPING_ERROR))
        addr64 = FIELD_GET(RX_DMA_ADDR64_MASK,
                           rxd->rxd2);
    else
        addr64 = RX_DMA_PREP_ADDR64(dma_addr);

So that branch only ever worked for the first loop iteration. Nothing
broke it later. Could the message give the order that way?

The message also does not say that this fix depends on the FIELD_GET()
branch from 6e0490fc36cd. Both hunks touch only the declaration and the
top of the loop, which have looked the same since e10a35abb3da. So the
patch would apply cleanly to a tree that has e10a35abb3da but not
6e0490fc36cd.

In that tree, every descriptor reaching release_desc would hit the
dma_addr == DMA_MAPPING_ERROR case and skip RX_DMA_PREP_ADDR64(). Its
high address bits would then be cleared. That is the original SER
failure, now on every iteration instead of only the first.

6e0490fc36cd carries Fixes: 2d75891ebc09, so most stable trees probably
have it already. Would it still help to name 6e0490fc36cd as a
prerequisite?

> net: ethernet: mtk_eth_soc: fix the RX

[Severity: Low]
This isn't a bug, but the subject does not say what is being fixed.
Something like "reset dma_addr per RX descriptor" or "keep descriptor
high address bits on release" would be more specific.

> With MTK_36BIT_DMA and DRAM above 4 GiB the hardware then DMAs the next
> frame to an address that is neither buffer, and the driver passes the
> stale contents of the untouched buffer up the stack.

Could the consequence be stated more directly? Before this patch, a
stale dma_addr from an earlier iteration reaches release_desc in
mtk_poll_rx() and goes through:

    addr64 = RX_DMA_PREP_ADDR64(dma_addr);
    ...
    rxd->rxd2 = RX_DMA_PREP_PLEN0(ring->buf_size) | addr64;

RX_DMA_PREP_ADDR64() fills RX_DMA_ADDR64_MASK, which holds physical
address bits 35:32. These bits are combined with the current buffer's
low bits in rxd1. The device then writes received frames to the same
offset in a different 4 GiB window. That is silent DMA corruption of
memory the driver does not own.

The mismatched address is also passed to dma_unmap_single() later. One
caller is mtk_poll_rx() itself, on the non-page_pool path:

    if (MTK_HAS_CAPS(eth->soc->caps, MTK_36BIT_DMA))
        addr64 = RX_DMA_GET_ADDR64(trxd.rxd2);

    dma_unmap_single(eth->dma_dev, ((u64)trxd.rxd1 | addr64),
                     ring->buf_size, DMA_FROM_DEVICE);

The other is mtk_rx_clean() during SER.

Would it be worth calling this memory corruption in the message, so
stable and security triage can judge how urgent it is?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/patch-4b4c5003bcf028fafd094e719c5e910b%40loljews.com

