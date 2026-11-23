Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87393606A6A4
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Nov 2026 23:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=K5qLkPf6;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kVlt9Hv1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=hKLSWJdH/cW/Tz03CBh7+GtUNubuHi+KzzGqMktxs8M=; b=K5qLkPf6MUt1FMikvDkyyqzZGv
	qf5w9rQK/SY9Qlkk35FLv3nFMO5vAx8/RNIrhLDFCiW7RcMLSip0LgZLoJxzW6oiw5cq1LOfQGbAi
	2/zdEaMcimhgmrdqty1KFD8LwOkuEHjoa0dmpp64cMfi7X7Th9HIG6f4fYhnumnp5YwYQHkWsHFYZ
	qCSR9wl0zeoolJU96wQ56ddZ9+jL2oPcsAe8if0XtcOsdE0tNljF3/l4mzkve4yXckevHTc2mbuKv
	9mfP0QvqW4XxWZg/umtZ/s5O8KlsI7551fBPGIFKIk2JxnH3QRYYZ8fVG+Z5WSCsCRbmVhZ9dYSPD
	Awt765/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVdFe-000000059AR-1tvq;
	Mon, 23 Nov 2026 23:15:10 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVdFb-0000000599E-3Vir;
	Mon, 23 Nov 2026 23:15:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2BA824008C;
	Mon, 23 Nov 2026 23:15:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A87A1F000D0;
	Mon, 23 Nov 2026 23:15:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795475707;
	bh=hKLSWJdH/cW/Tz03CBh7+GtUNubuHi+KzzGqMktxs8M=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=kVlt9Hv1p9OYTI9HUT/B6bbWk9du33RzDunq243H7OkOeuQmYLJA7DdiDVw7mi1ms
	 KRpo1BtqOvGDUx17syAhEV0GQrd4wFO3MVnC4lXZKuNsOxstDQYzjZkjDhzawG6bwu
	 V77kOl8FPXJ/fNXPAnHbKv0OIRmuZczumgo1veCxcIbgoJ2m4jISrGmSXYMaNVJMYA
	 tfJfan2dC+IO3CRjvaigPSfTd+rjuI+ikGVHDjm2NepJ6XMw3cTrVbaRRJxi2HSwGs
	 Kc9LXCsi1kcvaGPJRugTPcFADZAck5aZPMek/MVqsQxCKvqtP2bhNKTqRF6JFrhIwn
	 2xD/zyWSz/MAw==
Subject: Re: [PATCH net-next v8 1/3] net: ethernet: mtk_eth_soc: reset dma_addr
From: netdev-bot+sashiko@kernel.org
To: sandeeph@loljews.com
Date: Mon, 23 Nov 2026 23:15:05 +0000
Message-ID: <179547570565.3135.18239991807635277619@kernel.org>
In-Reply-To: <patch-154d2fe52d9ef9bfc85e603784552187@loljews.com>
References: <patch-154d2fe52d9ef9bfc85e603784552187@loljews.com>
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

- [Low] The commit message of "net: ethernet: mtk_eth_soc: reset
  dma_addr" describes the mechanism correctly but undersells the impact.

--

net: ethernet: mtk_eth_soc: reset dma_addr

This patch resets dma_addr to DMA_MAPPING_ERROR at the start of every
iteration of the mtk_poll_rx() loop. A descriptor that goes to
release_desc without a new mapping then keeps its own high address
bits in rxd2, instead of picking up the previous descriptor's bits.

> With
> MTK_36BIT_DMA and DRAM above 4 GiB the hardware then DMAs the next
> frame to an address that is neither buffer, and the driver passes the
> stale contents of the untouched buffer up the stack.

[Severity: Low]
The code change looks correct. Could the commit message say more plainly
what this means in practice?

Before this patch, once one descriptor had been refilled, a later
descriptor that jumped to release_desc kept its own low bits in rxd1.
Its rxd2 was then rebuilt from the previous descriptor's mapping:

drivers/net/ethernet/mediatek/mtk_eth_soc.c:mtk_poll_rx() {
    ...
release_desc:
	if (MTK_HAS_CAPS(eth->soc->caps, MTK_36BIT_DMA)) {
		if (unlikely(dma_addr == DMA_MAPPING_ERROR))
			addr64 = FIELD_GET(RX_DMA_ADDR64_MASK,
					   rxd->rxd2);
		else
			addr64 = RX_DMA_PREP_ADDR64(dma_addr);
	}
    ...
		rxd->rxd2 = RX_DMA_PREP_PLEN0(ring->buf_size) | addr64;
    ...
}

The release paths are: no netdev for the source port, MTK_RESETTING
set, or mtk_page_pool_get_buff()/napi_alloc_frag() failing under
GFP_ATOMIC.

In that case the NIC writes the next received frame, up to
ring->buf_size bytes, to (prev_hi << 32) | cur_lo. The driver does not
own that memory. So ordinary inbound traffic can cause the device to
silently corrupt arbitrary kernel memory.

The current wording ("an address that is neither buffer") describes
the mechanism, but it never calls this memory corruption. Would it
help stable and security triage to state that directly?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/patch-51fa5ed3bc801edb3f29b61ca7888382%40loljews.com

