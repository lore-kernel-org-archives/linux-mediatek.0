Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 732B9606A32A
	for <linux-mediatek@archiver.kernel.org>; Sat, 21 Nov 2026 20:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=V7NpE8fY;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QrI1Lo4G
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=8wTKUb2nDtcI4XUZWaDjK73vktWeuXk+9frWrXZGua4=; b=V7NpE8fYiL/kCxzGxiIWifrMfK
	lQbTFnEAqSEnix9rl4AHj5lEZq8QdFEu3+dHlKv7YUskHoHDdQg0IbtHFwJq3UlKlj0aJ4J79IMZp
	Q0OG71jVAicifo8W5mTa/ij96FWiR+H+HpruWhNQy3Hh1BojFcuWJJzSGWmgweGVMU5aHh81wloo/
	f4YjL0nwzN1OBVOjfCN6mGU7OV89zNP3ljwUyskSLnzghSf2N/K7qt0aBX85b04kX/n4+ZCvpsPyb
	TzudCAQue8XHt1kLjoFa+kIu+NyDGgJ4Q29vQ+UZ5WWo10EX3ctgeyMT9eOHewex4FEpNllge1Tl+
	iZXBVmKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUrbK-00000000BXl-0jzB;
	Sat, 21 Nov 2026 20:22:22 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUrb2-00000000BIm-0J3r;
	Sat, 21 Nov 2026 20:22:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 53E524108D;
	Sat, 21 Nov 2026 20:22:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34BF91F000C0;
	Sat, 21 Nov 2026 20:22:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795292523;
	bh=8wTKUb2nDtcI4XUZWaDjK73vktWeuXk+9frWrXZGua4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=QrI1Lo4GN0021zXX03FLPn5CxJqUpik8EzIUBckX6Y/H7M9q5NHFSzVOVAARF6Tq/
	 utaFOf4DJwDgvY3pR80JxTGvkXLgvhBH2KWZrwvMZJmZuO0DB+0VbSYj6mVjrfGOIR
	 s8VgN0TvIYpAA3yRHdDZhRFp9Wbzsz1VVPkcWQQ1/bfBKPKTfKMMG1vFe8Lvb8Wj/v
	 BVo0WYE2Qp/ia1vdv39pi9XnauYPhGKtsXHzeYEMTPq2FBfaWx6oUEsS2odAFFLQG1
	 mWmUm7/i7aolnqcL9ipAcgKw+UuN/Ok1l9QuQa4gxyDDRGxHfGlv/KrwZ7rn9i3Z54
	 kfbSuKDXTbD7w==
Subject: Re: [PATCH net-next v7 3/3] net: ethernet: mtk_eth_soc: add 9K jumbo
From: netdev-bot+sashiko@kernel.org
To: sandeeph@loljews.com
Date: Sat, 21 Nov 2026 20:22:01 +0000
Message-ID: <179529252174.3135.11197923579737063499@kernel.org>
In-Reply-To: <patch-459b523c84ab9d1ebb5e3bd73c076393@loljews.com>
References: <patch-459b523c84ab9d1ebb5e3bd73c076393@loljews.com>
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
Cc: mason-cw.chang@mediatek.com, linux-kernel@vger.kernel.org, angelogioacchino.delregno@collabora.com, andrew+netdev@lunn.ch, netdev@vger.kernel.org, linux@armlinux.org.uk, daniel@makrotopia.org, edumazet@kernel.org, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com, kuba@kernel.org, pabeni@redhat.com, lorenzo@kernel.org, davem@davemloft.net, linux-arm-kernel@lists.infradead.org, nbd@nbd.name
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Thank you for your contribution! Sashiko AI review found 6 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 4 · Low: 2

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] mtk_pdma_set_sdl() programs the PDMA RX SDL field with
  MTK_PDMA_LRO_SDL + eth->rx_buf_len, and the result is far above every…
- [Medium] On MT7988 (MTK_NETSYS_RX_9K), mtk_rx_buf_len_from_mtu() adds
  VLAN_HLEN before comparing against the 2K floor.
- [Medium] The new XMAC_RX_CFG2 max-RX limit for the XGMII MACs
  (GMAC2/GMAC3) may be undone by the XMAC logic reset.
- [Medium] net: mediatek: stale MAC max-rx limits after MTU shrink in
  mtk_change_mtu()
- [Low] The patch adds an RX drop path on every SoC that the commit
  message does not mention.
- [Low] This patch renames mtk_max_lro_buf_alloc() to
  mtk_max_buf_alloc(size, gfp) and updates both call sites.

--

net: ethernet: mtk_eth_soc: add 9K jumbo

This commit adds an MTK_NETSYS_RX_9K capability for MT7988. With it the
XGMII MACs advertise a 9194 byte max_mtu, and the shared RX rings are
sized from the largest MTU of any MAC. The PDMA SDL, XMAC_RX_CFG2 and MCR
jumbo limits are programmed from that buffer length, and MTU growth is
rejected with -EBUSY while DMA is running.

Link: https://github.com/frank-w/BPI-Router-Linux/commit/b4c6cb1d5532
Link: https://github.com/mediatek/mtk-openwrt-feeds

> diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> index b3a6e5703538e..0a87b94e8c103 100644
> --- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> +++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c

[ ... ]

> @@ -554,6 +555,62 @@ static int mtk_mac_prepare(struct phylink_config *config, unsigned int mode,
>  	return 0;
>  }
>  
> +/* The MACs are fed from the shared RX rings, so the maximum frame they may
> + * accept is a property of the ring buffer length.  GMAC1 on netsys v3+ is
> + * the built-in switch port: it has no XMAC_RX_CFG2 limit register, so it
> + * keeps the MCR programming the other SoCs use, extended with the MCR
> + * jumbo field so its limit can grow with the rings like the XGMII MACs'.
> + */
> +static void mtk_set_mcr_max_rx(struct mtk_mac *mac, u32 val)
> +{

[ ... ]

> +	} else {
> +		mcr_cur = mtk_r32(mac->hw, MTK_XMAC_RX_CFG2(mac->id));
> +		mcr_new = mcr_cur & ~MTK_XMAC_MAX_RX_MASK;
> +		mcr_new |= FIELD_PREP(MTK_XMAC_MAX_RX_MASK,
> +				      min_t(u32, val, MTK_MAX_RX_LENGTH_9K));
> +
> +		if (mcr_new != mcr_cur)
> +			mtk_w32(mac->hw, mcr_new, MTK_XMAC_RX_CFG2(mac->id));
> +	}
> +}

[Severity: Medium]
Does this XMAC_RX_CFG2 limit survive link-up on GMAC2/GMAC3?

The value is written from mtk_mac_config(). phylink then calls
mac_link_up, and mtk_xgdm_mac_link_up() pulses the XMAC logic reset for
every non-GMAC1 XGMII MAC:

drivers/net/ethernet/mediatek/mtk_eth_soc.c:mtk_xgdm_mac_link_up() {
    ...
	/* Eliminate the interference(before link-up) caused by PHY noise */
	mtk_m32(mac->hw, XMAC_LOGIC_RST, 0, MTK_XMAC_LOGIC_RST(mac->id));
	mdelay(20);
    ...
}

Nothing writes XMAC_RX_CFG2 again after that. The reset could clear the
XMAC RX configuration, or the hardware could ignore writes made while
the logic is held in reset before the first link-up. In either case,
would RX_CFG2 go back to its hardware default on every link-up, so the
10G ports silently drop jumbo frames?

The commit message describes jumbo testing only on the switch path, and
GMAC1 returns from mtk_xgdm_mac_link_up() before it reaches this reset.
Have jumbo frames been tested on the XGMII ports after a link flap?

[ ... ]

> @@ -2268,6 +2356,15 @@ static int mtk_poll_rx(struct napi_struct *napi, int budget,
>  
>  		pktlen = RX_DMA_GET_PLEN0(trxd.rxd2);
>  
> +		/* The engine can report a length larger than the posted
> +		 * buffer; never pass the unwritten remainder of the buffer
> +		 * up the stack.
> +		 */
> +		if (unlikely(pktlen > ring->buf_size)) {
> +			netdev->stats.rx_length_errors++;
> +			goto release_desc;
> +		}
> +

[Severity: Low]
This check runs on every SoC, not only on the ones with
MTK_NETSYS_RX_9K, and it adds a new drop path counted in
rx_length_errors.

mtk_get_stats64() also now adds dev->stats.rx_length_errors to the
hardware short/long error sum, which changes the rx_length_errors value
userspace sees.

Before this patch such a frame would have reached skb_put() and hit
skb_over_panic(). Could the commit message mention this check and the
stats change? The list of changes does not cover either of them.

[ ... ]

> @@ -2863,7 +2977,8 @@ static int mtk_rx_alloc(struct mtk_eth *eth, int ring_no, int rx_flag)
>  			if (ring->frag_size <= PAGE_SIZE)
>  				data = netdev_alloc_frag(ring->frag_size);
>  			else
> -				data = mtk_max_lro_buf_alloc(GFP_KERNEL);
> +				data = mtk_max_buf_alloc(ring->frag_size,
> +							 GFP_KERNEL);

[Severity: Low]
This isn't a bug, but the page_pool gate comment earlier in mtk_rx_alloc()
still names the old helper:

	 * length fits.  Larger rings use the netdev_alloc_frag()/
	 * mtk_max_lro_buf_alloc() path below instead.

Should it say mtk_max_buf_alloc() now? The fallback is no longer
LRO-only either, because it also backs the normal jumbo ring.

[ ... ]

> @@ -3259,6 +3374,67 @@ static int mtk_dma_busy_wait(struct mtk_eth *eth)

[ ... ]

> +static u32 mtk_rx_buf_len_from_mtu(struct mtk_eth *eth, int max_mtu)
> +{
> +	int length;
> +
> +	/* Only the SoCs with the 9K capability grow the shared rings with
> +	 * the MTU.  Everywhere else the buffers stay at 2K, so the largest
> +	 * MTU those SoCs advertise keeps working at runtime and the -EBUSY
> +	 * rule below never applies to them.
> +	 */
> +	if (!MTK_HAS_CAPS(eth->soc->caps, MTK_NETSYS_RX_9K))
> +		return MTK_MAX_RX_LENGTH_2K;
> +
> +	length = max_mtu + MTK_RX_ETH_HLEN + VLAN_HLEN;
> +	if (length <= MTK_MAX_RX_LENGTH_2K)
> +		return MTK_MAX_RX_LENGTH_2K;
> +
> +	return DIV_ROUND_UP(length, 1024) * 1024;
> +}

[Severity: Medium]
On MT7988, does adding VLAN_HLEN here break part of the advertised MTU
range at runtime? For a max MTU from 2027 to 2030:

    2027 + 18 + 4 = 2049 -> DIV_ROUND_UP(2049, 1024) * 1024 = 3072

At the default MTU the rings are built with rx_buf_len 2048, so
mtk_change_mtu() then hits:

	running = refcount_read(&eth->dma_refcnt);
	if (running && rx_buf_len > eth->rx_buf_len)
		return -EBUSY;

mtk_add_mac() still sets max_mtu = MTK_MAX_RX_LENGTH_2K -
MTK_RX_ETH_HLEN (2030) on the non-XGMII MACs: SGMII/2500base-x GMAC2 and
GMAC3, and the internal 2.5G PHY GMAC2. As a result,
"ip link set <sgmii port> mtu 2030" on a running MT7988 now returns
-EBUSY. It is inside max_mtu, and it was accepted before this patch.

The same threshold hits DSA user ports on the GMAC1 conduit at user MTUs
2023 to 2026, because the conduit MTU is the user MTU + 4.

The comment above says the largest advertised MTU keeps working at
runtime, but that is only true on the non-9K SoCs. Should the non-XGMII
max_mtu on MT7988 lose VLAN_HLEN as well? Or should the 2K floor be
checked before the VLAN headroom is added?

[ ... ]

> +static void mtk_pdma_set_sdl(struct mtk_eth *eth)
> +{
> +	const struct mtk_reg_map *reg_map = eth->soc->reg_map;
> +	u32 val;
> +
> +	if (!mtk_is_netsys_v3_or_greater(eth))
> +		return;
> +
> +	val = mtk_r32(eth, reg_map->pdma.rx_cfg);
> +	val &= ~MTK_RX_CFG_SDL_MASK;
> +	val |= FIELD_PREP(MTK_RX_CFG_SDL_MASK,
> +			  MTK_PDMA_LRO_SDL + eth->rx_buf_len);
> +	mtk_w32(eth, val, reg_map->pdma.rx_cfg);
> +}

[Severity: Medium]
Can this set the PDMA RX length limit well above the buffers posted in
the ring?

MTK_PDMA_LRO_SDL is 0x3000, the same value as MTK_MAX_LRO_RX_LENGTH
(4096 * 3), which is the HW-LRO segment length. Elsewhere in the driver
the SDL field at bit 16 holds a plain byte length:

#define MTK_LRO_MIN_RXD_SDL	(MTK_HW_LRO_SDL_REMAIN_ROOM << 16)

Read the same way, this write sets the limit to 0x3000 + 2048 = 14336
bytes with 2K rings and 0x3000 + 9216 = 21504 bytes with 9K rings. Both
are at least 12 KiB above ring->buf_size, the PLEN0 written into every
descriptor. Both are also above the 9216 cap this patch uses for
max_mtu, XMAC_RX_CFG2 and the MCR jumbo field.

The write runs on every MT7988 open, including at MTU 1500:

mtk_open()->mtk_start_dma()->mtk_dma_init()->mtk_pdma_set_sdl()

The commit message also says the GMAC1 MCR limit is probably not
enforced for switch-side frames. That would leave this field as the only
hardware length guard on the DSA conduit.

The new check in mtk_poll_rx() says "The engine can report a length
larger than the posted buffer". Suppose the engine applies this global
limit instead of the per-descriptor PLEN0. Could an oversized frame from
the wire then be written past the mapped buffer, into a neighbouring
frag or skb_shared_info? The pktlen check only runs after the DMA write
has happened.

If the engine splits the frame instead, mtk_poll_rx() has no
last-segment check. Would the tail of the frame then be parsed as a
separate frame?

The field could also be "flag bits | length", as in the vendor's 0x3000
+ 1536 case. Then the addition carries into bits 12-13 for any
rx_buf_len >= 4096 (0x3000 + 0x1000 = 0x4000, 0x3000 + 0x2400 = 0x5400).
Can that encoding represent the jumbo lengths at all?

[ ... ]

> @@ -4360,21 +4531,59 @@ static int mtk_change_mtu(struct net_device *dev, int new_mtu)
>  	int length = new_mtu + MTK_RX_ETH_HLEN;
>  	struct mtk_mac *mac = netdev_priv(dev);
>  	struct mtk_eth *eth = mac->hw;
> +	u32 rx_buf_len;
> +	bool running;
>  	int max_mtu, i;
>  
> +	/* The RX rings are shared by every MAC, so the buffer length
> +	 * follows the largest MTU of all of them, the new one included.
> +	 */
> +	max_mtu = new_mtu;
> +	for (i = 0; i < MTK_MAX_DEVS; i++) {
> +		if (eth->netdev[i] && eth->netdev[i] != dev &&
> +		    eth->netdev[i]->mtu > max_mtu)
> +			max_mtu = eth->netdev[i]->mtu;
> +	}
> +	rx_buf_len = mtk_rx_buf_len_from_mtu(eth, max_mtu);
> +
>  	if (rcu_access_pointer(eth->prog) &&
> -	    length > MTK_PP_MAX_BUF_SIZE) {
> +	    mtk_rx_ring_buf_size(rx_buf_len) > MTK_PP_MAX_BUF_SIZE) {
>  		netdev_err(dev, "Invalid MTU for XDP mode\n");
>  		return -EINVAL;
>  	}
>  
> -	mtk_set_mcr_max_rx(mac, length);
> +	/* The rings cannot be resized in place while DMA is running: a
> +	 * larger buffer can only come from the reallocation at the next
> +	 * open, so reject it.  A smaller one is fine, the buffers the
> +	 * rings already hold are big enough for it.
> +	 */
> +	running = refcount_read(&eth->dma_refcnt);
> +	if (running && rx_buf_len > eth->rx_buf_len)
> +		return -EBUSY;
> +
> +	/* On the SoCs whose rings grow with the MTU, keep the MAC limit in
> +	 * step with the shared buffers; the other SoCs keep the per-device
> +	 * limit they always had.
> +	 */
> +	if (MTK_HAS_CAPS(eth->soc->caps, MTK_NETSYS_RX_9K))
> +		mtk_set_mcr_max_rx(mac, rx_buf_len);
> +	else
> +		mtk_set_mcr_max_rx(mac, length);
> +
>  	WRITE_ONCE(dev->mtu, new_mtu);
>  
>  	max_mtu = mtk_max_gmac_mtu(eth);
>  	for (i = 0; i < ARRAY_SIZE(eth->ppe); i++)
>  		mtk_ppe_update_mtu(eth->ppe[i], max_mtu);
>  
> +	/* While DMA is up the rings keep the buffers they were built
> +	 * with; update eth->rx_buf_len only when DMA is down so it keeps
> +	 * describing the buffers the rings hold, or will hold at the next
> +	 * open.
> +	 */
> +	if (!running)
> +		eth->rx_buf_len = rx_buf_len;
> +
>  	return 0;
>  }
>  

[Severity: Medium]
On the MTK_NETSYS_RX_9K SoCs the limit written here comes from the
shared rings, but only the MAC whose MTU is changing gets it. Can the
other MACs keep a limit larger than the buffers the rings end up
holding?

Take GMAC1 and GMAC2 both at MTU 9000 with DMA down. Lowering GMAC1
to 1500 keeps rx_buf_len at 9216 because of GMAC2, so GMAC1 is
programmed for 9216. Lowering GMAC2 to 1500 then drops
eth->rx_buf_len to 2048, but only GMAC2 is narrowed. GMAC1 keeps
9216 until mtk_mac_config() runs for it again.

That may never happen. Suppose only GMAC2 is reopened.
mtk_dma_init() builds 2048 byte rings, and mtk_open() calls
mtk_gdm_config() for every registered MAC. phylink_start(), though,
only reaches mtk_mac_config() for GMAC2.

GMAC1 is the switch conduit. Its link is forced up by
mtk_setup_bridge_switch() and, as far as I can see, stays up after
GMAC1 is closed. MTK_MAC_MCR(0) would then keep accepting 9216 byte
frames into 2048 byte buffers.

The same happens in this case:

  - GMAC1 at 1500 and GMAC2 at 9000 are both open, so both get 9216;
  - both are closed;
  - GMAC2 is lowered to 1500;
  - only GMAC2 is reopened.

The FE reset path has a similar gap after an MTU shrink while DMA is
running. eth->rx_buf_len is correctly left at the live value then.
However, mtk_stop() does not refresh it when dma_refcnt drops to
zero.

In mtk_pending_work(), mtk_hw_init(eth, true) then programs every MAC
from the stale 9216. Only after that does
mtk_open()->mtk_dma_init() derive 2048 and reallocate the rings. The
reopened MACs are narrowed again by mtk_mac_config(), but MACs that
were not running stay at 9216.

For GMAC2/GMAC3 there is also an ordering question. mac->interface is
PHY_INTERFACE_MODE_NA until the first mtk_mac_config(). A call from
mtk_hw_init() or mtk_change_mtu() before the first open therefore
takes the MCR branch of mtk_set_mcr_max_rx(). It writes the MCR jumbo
field of an XGMII MAC instead of XMAC_RX_CFG2. Is that intended?

The commit message says no MAC accepts a frame the rings cannot hold,
even after a reopen with a smaller MTU. These sequences seem to break
that.

Would it work better to have a helper that applies eth->rx_buf_len to
every MAC in eth->netdev[]? It could be called from mtk_change_mtu()
and again once mtk_dma_init() has derived the new length. Should the
reset path also derive the length before mtk_hw_init() runs?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/patch-7d2c457e68de6b53b7348d1bdbeadcec%40loljews.com

