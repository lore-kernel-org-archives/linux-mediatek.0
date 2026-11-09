Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C3A260A2629
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Nov 2026 22:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vAfGB8CI;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EEmDxAoh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=mh9nxcR7Zr7PjDB2zP6X1jj+dDf2TtwXNgUmCiBrw3g=; b=vAfGB8CIAsNTk2BB7UZN/IlRb5
	k/4F/V156uYj7AkHcx+2TNBqH3Qu/EuYUMqbi2qtnwHtt/hfqdiVgDARjRknWy/FF0VTWp70Byk4C
	KDob50omA1unFWQPJec6JtHh8/3NAUbDV9FLUFCv/DQsPuRpTBjJ5AyyheX1r4cTko2AGzdjiBhWu
	hEhhoKSqx+RHXWkDclYJywB2IdsROq7KCZ64DyQgtw3pe7rthHL8tIifAZqYmsR0ehgiJfuOzQUny
	Bfg1V7A4apDWnr7AeVwbiHQEIoQgSdhGi/Uk0kyl/KdQzJWutPQQ0J1ddLRNLEKP/Ov92+v4QXhzU
	V8PfGV3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQXiZ-00000001rjs-45gJ;
	Mon, 09 Nov 2026 22:19:59 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQXiX-00000001rj3-3JwZ;
	Mon, 09 Nov 2026 22:19:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id BAA1763513;
	Mon,  9 Nov 2026 22:19:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B3AE1F0089F;
	Mon,  9 Nov 2026 22:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794262795;
	bh=mh9nxcR7Zr7PjDB2zP6X1jj+dDf2TtwXNgUmCiBrw3g=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=EEmDxAoh61ZU2/SzdFii62fvjMhKDBql+O6A/RaJRzSM6nfKIZzyKZSDXkevBtc/j
	 725LrBhrE6BMbCedcK71xP3XV0F2YnhDqxM0nLRege7K62JrJSapGikDOWIPOnqrnM
	 yNYh9DcWnDdva7Y6hVZ3eG3T67PFBryeB1MRUz4b09f1/Za9C419GfMOD8r+mYDEjo
	 JuDqyOztivMUDSuw+TGLe0mFVUh52c/YKCPRiQsXbKZtE8mu4wBtW2IAlkcxSQ8j+N
	 CIEsiBQ/6qFBhuQyM9+AMhl/dZywzNZnHGhzmluxEAIsrmHvIRYToSJpYT4HTmnjS2
	 HExGd3x54pvTg==
Subject: Re: [PATCH net-next v3 1/2] net: ethernet: mtk_eth_soc: skip page_pool
From: netdev-bot+sashiko@kernel.org
To: sandeeph@loljews.com
Date: Mon, 09 Nov 2026 22:19:54 +0000
Message-ID: <179426279414.994134.13678817461648195791@kernel.org>
In-Reply-To: <patch-e9b81d2fdf3b2d4b11048e6a642bcfcc@loljews.com>
References: <patch-e9b81d2fdf3b2d4b11048e6a642bcfcc@loljews.com>
X-sashiko-severity: Medium
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Thank you for your contribution! Sashiko AI review found 3 potential
issue(s) to consider.

Critical: 0 (1) · High: 0 · Medium: 1 · Low: 2

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The new gate in mtk_rx_alloc() (`mtk_page_pool_enabled(eth) &&
  ring->buf_size <= MTK_PP_MAX_BUF_SIZE`) means a netsys v2+ ring can…
- [Low] The commit message does not match the code.
- [Low] The new comment in mtk_rx_alloc() describes changelog history
  rather than the code.

Pre-existing issues:
- [Critical] This problem wasn't introduced by this patch, but in
  mtk_poll_rx() the release_desc path rebuilds the descriptor's high DMA…

--

net: ethernet: mtk_eth_soc: skip page_pool

This commit adds a ring->buf_size <= MTK_PP_MAX_BUF_SIZE condition to the
page_pool creation in mtk_rx_alloc(). Rings whose descriptor length is
larger than the pool can back fall back to netdev_alloc_frag() or
mtk_max_lro_buf_alloc(). It is described as preparation for 9K jumbo
support in the next patch, with no functional change at this commit.

Link: https://github.com/mediatek/mtk-openwrt-feeds

> net: ethernet: mtk_eth_soc: skip page_pool

[Severity: Low]
This isn't a bug, but the subject line looks cut off. It doesn't say when
the page_pool is skipped.

> Gate the pool on ring->buf_size instead of ring->frag_size: frag_size is
> computed with the netdev_alloc_frag() layout, whose headroom and
> skb_shared_info footprint differ from the pool's, so a ring can pass a
> frag_size <= PAGE_SIZE test while its descriptor length is already larger
> than the pool can map.

Is "instead of ring->frag_size" accurate? Before this patch, the only
gate on the pool was:

	if (mtk_page_pool_enabled(eth)) {

The ring->frag_size <= PAGE_SIZE test exists only in the non-page_pool
branch. There it chooses between netdev_alloc_frag() and
mtk_max_lro_buf_alloc().

So this patch adds a new size condition rather than replacing a frag_size
one. The frag_size vs. buf_size reasoning and the no-functional-change
claim both look correct. Could the wording avoid implying that a
frag_size gate existed before?

> diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> index ad0fdc4133fb6..f2b2fb1130ff9 100644
> --- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> +++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> @@ -2819,7 +2819,15 @@ static int mtk_rx_alloc(struct mtk_eth *eth, int ring_no, int rx_flag)
>  	if (!ring->data)
>  		return -ENOMEM;
>  
> -	if (mtk_page_pool_enabled(eth)) {
> +	/* page_pool hands out order-0 pages and caps the DMA mapping at
> +	 * MTK_PP_MAX_BUF_SIZE, so it can only back a ring whose descriptor
> +	 * length fits that.  Today every ring does; this is the preparation
> +	 * for the 9K support in the next patch, where the normal ring grows
> +	 * past the pool's limit and takes the netdev_alloc_frag()/
> +	 * mtk_max_lro_buf_alloc() path below instead.
> +	 */

[Severity: Low]
This isn't a bug, but this comment describes the series history rather
than the code. The follow-up "net: ethernet: mtk_eth_soc: add 9K jumbo"
leaves it unchanged. After that patch:

  - "Today every ring does" is no longer true. A 9K ring has buf_size
    9216 and no pool.
  - "the next patch" no longer refers to anything.
  - mtk_max_lro_buf_alloc() has been renamed to mtk_max_buf_alloc().

Also, does page_pool really cap the DMA mapping at MTK_PP_MAX_BUF_SIZE?
mtk_create_page_pool() uses:

	.flags = PP_FLAG_DMA_MAP | PP_FLAG_DMA_SYNC_DEV,
	...
	.offset = MTK_PP_HEADROOM,
	.max_len = MTK_PP_MAX_BUF_SIZE,

PP_FLAG_DMA_MAP maps the whole order-0 page. max_len only limits the
sync-for-device length. The real constraint seems to be that
RX_DMA_PREP_PLEN0(ring->buf_size) must not exceed offset + max_len.

> +	if (mtk_page_pool_enabled(eth) &&
> +	    ring->buf_size <= MTK_PP_MAX_BUF_SIZE) {

[Severity: Medium]
With this condition, a netsys v2+ ring can now have
ring->page_pool == NULL. In mtk_poll_rx(), XDP only runs in the
page_pool branch:

	if (ring->page_pool) {
		...
		ret = mtk_xdp_run(eth, ring, &xdp, netdev);
		...
	} else {
		if (ring->frag_size <= PAGE_SIZE)
			new_data = napi_alloc_frag(ring->frag_size);

If an XDP program is accepted while the ring has no pool, the program
silently never runs.

This can't happen at this commit, because buf_size is always 2048. With
the follow-up "net: ethernet: mtk_eth_soc: add 9K jumbo" applied,
mtk_xdp_setup() checks the rx_buf_len recomputed from the current MTUs:

	if (dev->mtu > MTK_PP_MAX_BUF_SIZE ||
	    mtk_rx_buf_len(eth) > MTK_PP_MAX_BUF_SIZE) {

It does not check eth->rx_buf_len, which the live rings were allocated
with, or ring->page_pool itself.

Can this sequence on MT7988 with two GMACs attach an XDP program that
never runs?

1. With both interfaces down, set eth1 MTU to 9000. mtk_change_mtu()
   takes the !running branch and sets eth->rx_buf_len = 9216.

2. Bring eth0 and eth1 up. buf_size is 9216, so no page_pool is created.

3. While running, set eth1 MTU back to 1500. mtk_change_mtu() allows it:

	running = refcount_read(&eth->dma_refcnt);
	if (running && rx_buf_len > eth->rx_buf_len)
		return -EBUSY;

   eth->rx_buf_len stays at 9216.

4. Attach XDP to eth0. mtk_xdp_setup() sees dev->mtu 1500 and
   mtk_rx_buf_len(eth) 2048, and accepts the program. Its mtk_stop() and
   mtk_open() calls only move dma_refcnt 2->1->2, because eth1 is still
   up:

	if (!refcount_dec_and_test(&eth->dma_refcnt))
		return 0;

   So the rings are not reallocated.

The attach returns success, but all RX traffic bypasses the program.
xdp_features is also still advertised based on mtk_page_pool_enabled()
alone.

Could mtk_xdp_setup() check eth->rx_buf_len, or whether the rings have a
page_pool, instead?

>  		struct page_pool *pp;
>  
>  		pp = mtk_create_page_pool(eth, &ring->xdp_q, ring_no,

[Severity: Critical]
This is a pre-existing issue and wasn't introduced by this patch. While
looking at the fallback path that this series moves MT7988 jumbo rings
onto, it looks like mtk_poll_rx() can hand a descriptor back to the
hardware with a mixed DMA address.

dma_addr is set once, outside the loop:

	dma_addr_t dma_addr = DMA_MAPPING_ERROR;

The release_desc path rebuilds the high address bits from it:

skip_rx:
		ring->data[idx] = new_data;
		rxd->rxd1 = (unsigned int)dma_addr;
release_desc:
		if (MTK_HAS_CAPS(eth->soc->caps, MTK_36BIT_DMA)) {
			if (unlikely(dma_addr == DMA_MAPPING_ERROR))
				addr64 = FIELD_GET(RX_DMA_ADDR64_MASK,
						   rxd->rxd2);
			else
				addr64 = RX_DMA_PREP_ADDR64(dma_addr);
		}

Suppose iteration N refills its slot with buffer X, which leaves
dma_addr set to X. Iteration N+1 can then jump straight to release_desc
in three cases:

  - there is no netdev for the source port
  - MTK_RESETTING is set
  - a GFP_ATOMIC allocation fails in mtk_page_pool_get_buff() or
    napi_alloc_frag()

mtk_page_pool_get_buff() only writes *dma_addr on success. In that case
rxd1 still holds lo(Y) for the buffer Y the slot owns, but rxd2 gets
hi(X).

On MTK_36BIT_DMA SoCs with DRAM above 4 GiB, can the NIC then DMA the
next frame to hi(X)|lo(Y), which is neither buffer? The driver would
later call dma_unmap_single() on that address and pass the stale
contents of Y up the stack.

Should dma_addr be reset to DMA_MAPPING_ERROR at the start of each loop
iteration?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/patch-aad4cfa8d9522d1f7dbc9893ea12e813%40loljews.com

