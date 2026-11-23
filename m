Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6518C606A688
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Nov 2026 23:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=aQRxISOD;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WL/K8FUm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=oLmGWtI2ku8OobUX8IXzT/SJezeWZOgyXUpkYddicFI=; b=aQRxISODVdioCblw0uOi6Fkv/Y
	jNqpYQbwdC9iIcYMBecHkAFZ3BEx+/ExbfTOZ6J4OKEsPiwRbMLkspzP/9q5Z1geD+pxKEYsdRUrm
	tv1zsn+CC9oFruNUo/tgh9Wv35Ak09UfwnppruIG5y2jO1CIX0Vd2gpzURUd13wtD+JIpmDPkhvGs
	f7wYOzZCFnRWQd1Pi1sk+rZb2/7HmyJeqXDRs9n9OpZ4TWk3nZe7ggEpmEhbQnH9sLTc7pJtaGQkN
	zVO8EtDIn7u9VKne0F4ufOSFLhAGLWxISkFIVzTqZUVgn3XCiPTGNpXRiR0seAfFtD8DBlQOERNnS
	v1lRCdoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVdFr-000000059HD-0cQH;
	Mon, 23 Nov 2026 23:15:23 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVdFe-000000059A5-32be;
	Mon, 23 Nov 2026 23:15:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8B83960D82;
	Mon, 23 Nov 2026 23:15:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 479D41F000EC;
	Mon, 23 Nov 2026 23:15:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795475709;
	bh=oLmGWtI2ku8OobUX8IXzT/SJezeWZOgyXUpkYddicFI=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=WL/K8FUmm1dMW/4d2llwALEo0FOmpVizKKKd6aD2dyCjTXUlvaJbYZye3V8+Y5P+z
	 t4M0MA0AbfSHMdOugXQMn5pr6vvWSmdyT1CFG/4zzHnoMaQuFkBo4XheqBwMczk1Sx
	 9jBdjjuA20bKDEGEgk/S2TKQvx+oGqMv6uJg0Z7xxuo/WaU7cKRvAOL0LD8g6TOA0+
	 JifjNFKTIQ9umv2H7RRWj5jFb/0WCsLknPhu8PPraDoQpN/VATYnGGj4IWs9rpgAJS
	 k0dRaGhoMp1rjwNuXoSwo3NdMO9gyayBANipG+QUJOVnL7SPjCGHPWLGrc8DlVvG4d
	 Chg9dFveUWnVQ==
Subject: Re: [PATCH net-next v8 3/3] net: ethernet: mtk_eth_soc: add 9K jumbo
From: netdev-bot+sashiko@kernel.org
To: sandeeph@loljews.com
Date: Mon, 23 Nov 2026 23:15:07 +0000
Message-ID: <179547570786.3135.14102312432224479446@kernel.org>
In-Reply-To: <patch-33f903552b0fbd7330e1165ec70bbb39@loljews.com>
References: <patch-33f903552b0fbd7330e1165ec70bbb39@loljews.com>
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Thank you for your contribution! Sashiko AI review found 9 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 5 · Low: 4

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The commit message's case for GMAC1, the built-in switch port
  and the only 10G MAC, contradicts itself and does not support the…
- [Medium] mtk_pdma_set_sdl() writes ADMA_RX_CFG[31:16] (pdma.rx_cfg =
  0x6a10) with MTK_PDMA_LRO_SDL + eth->rx_buf_len, i.e. 0x3000 +…
- [Medium] mtk_poll_rx() now counts over-long descriptors in
  netdev->stats.rx_length_errors, and mtk_get_stats64() adds that into…
- [Medium] In mtk_set_mcr_max_rx(), the MCR jumbo field (bits 31:28) is
  written whenever the SoC has MTK_NETSYS_RX_9K and val > 1552.
- [Medium] On MT7988, mtk_change_mtu() (called under RTNL) now calls
  mtk_set_all_macs_max_rx(), which reads every other MAC's…
- [Low] The commit message says 9K is enabled on "the 10G XGMII MACs" and
  that XMAC_RX_CFG2 is programmed "on the XGMII MACs, so a tagged…
- [Low] mtk_poll_rx() gains a `pktlen > ring->buf_size` drop, justified
  by a comment that states as fact that "The engine can report a length…
- [Low] The commit message describes the patch as "a forward-port of the
  MediaTek downstream jumbo work: Mason Chang's \"change default rx…
- [Low] mtk_xgdm_mac_link_up() calls mtk_set_mcr_max_rx(mac,
  mac->hw->rx_buf_len) unconditionally.

--

net: ethernet: mtk_eth_soc: add 9K jumbo

This adds an MTK_NETSYS_RX_9K capability for MT7988. It raises max_mtu on
the XGMII MACs to 9194 and sizes the shared RX rings from the largest MTU
of any MAC. The MAC limits (MCR, XMAC_RX_CFG2) and the ADMA_RX_CFG SDL
field are reprogrammed from that shared length, and mtk_poll_rx() now
drops descriptors whose PLEN0 exceeds the posted buffer.

Link: https://github.com/frank-w/BPI-Router-Linux/commit/b4c6cb1d5532
Link: https://github.com/mediatek/mtk-openwrt-feeds

> This is a forward-port of the MediaTek downstream jumbo work: Mason
> Chang's "change default rx buffer length" and "add 9k jumbo frame
> support" (MediaTek OpenWrt feed 999-eth-30/31, carried in
> frank-w/BPI-Router-Linux), plus Frank Wunderlich's "try to fix crash
> the right way".

[ ... ]

> Signed-off-by: Sandeep Haemoon <sandeeph@loljews.com>

[Severity: Low]
The message credits the code to Mason Chang and Frank Wunderlich, but the
only trailer is the submitter's Signed-off-by.

Should the original Signed-off-by chain be kept here, or Co-developed-by
plus Signed-off-by tags added, as described in
Documentation/process/submitting-patches.rst?

> diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> index b3a6e5703538e..bc0295f95203b 100644
> --- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> +++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c

[ ... ]

> @@ -554,6 +555,98 @@ static int mtk_mac_prepare(struct phylink_config *config, unsigned int mode,
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
> +	struct mtk_eth *eth = mac->hw;
> +	u32 mcr_cur, mcr_new;
> +
> +	if (MTK_HAS_CAPS(eth->soc->caps, MTK_SOC_MT7628))
> +		return;
> +
> +	if (!mtk_interface_mode_is_xgmii(eth, mac->interface) ||
> +	    mac->id == MTK_GMAC1_ID) {
> +		mcr_cur = mtk_r32(mac->hw, MTK_MAC_MCR(mac->id));
> +		mcr_new = mcr_cur & ~MAC_MCR_MAX_RX_MASK;
> +

[ ... ]

> +		/* The bucket encodes at most 2048; the SoCs with the 9K
> +		 * capability need the jumbo field, in 1024-byte units, for
> +		 * anything larger.  The MT7988A reference manual defines
> +		 * only 4'h2 (2 Kbytes) for that field and marks the rest
> +		 * reserved, while the MediaTek downstream driver programs
> +		 * the length there and jumbo passes on its reference
> +		 * hardware; the vendor encoding is kept for the internal
> +		 * switch port.  Clearing it together with the bucket keeps
> +		 * a later MTU shrink from leaving a stale larger limit
> +		 * behind.
> +		 */
> +		if (MTK_HAS_CAPS(eth->soc->caps, MTK_NETSYS_RX_9K)) {
> +			u32 jumbo = DIV_ROUND_UP(val, MTK_MAX_RX_LENGTH_UNIT);
> +
> +			mcr_new &= ~MAC_MCR_MAX_RX_JUMBO_MASK;
> +
> +			if (val > 1552)
> +				mcr_new |= MAC_MCR_MAX_RX_JUMBO(jumbo);
> +		}

[Severity: Medium]
The commit message describes what the vendor driver does for GMAC1 in two
places, and the two descriptions seem to contradict each other:

  "the vendor driver programs the length there and jumbo passes on its
  reference hardware, so the vendor encoding is kept for the internal
  switch port."

and:

  "the downstream reference programs no limit for GMAC1 and jumbo frames
  pass the switch on the reference hardware, which suggests the field
  is not enforced there"

If the vendor driver does not program GMAC1, what justifies writing the
reserved encodings (3..9 in MCR[31:28]) into GMAC1's MTK_MAC_MCR?

If the field is not enforced for switch-side frames, is the claim "so no
MAC accepts a frame the rings cannot hold" accurate for GMAC1?

The current code already suggests the field is not enforced.
mtk_mac_config() does a full-register write for the XGMII modes:

    mtk_w32(mac->hw, MAC_MCR_FORCE_LINK_DOWN, MTK_MAC_MCR(mac->id));

That leaves GMAC1 in the 1518 bucket, yet tagged 1522-byte DSA frames
already pass on MT7988. If so, the per-descriptor PLEN0 bound would be the
only real protection on GMAC1.

There is no Tested-by, and the message does not say whether 9K frames
through GMAC1 and DSA were tested. Could that be clarified?

[Severity: Medium]
The jumbo field is gated only on MTK_NETSYS_RX_9K, not on
mac->id == MTK_GMAC1_ID. The comment, however, limits the vendor encoding
to the internal switch port.

The MCR branch is taken by any MAC whose mac->interface is not XGMII. On
MT7988 that means GMAC2/GMAC3 in MII or GMII mode, and later any
SGMII/2500BASE-X MAC once those modes are supported.

mtk_set_all_macs_max_rx(), mtk_mac_config() and mtk_hw_init() all pass
the shared eth->rx_buf_len. Once any XGMII MAC's MTU goes above 2030,
rx_buf_len becomes 3072..9216.

Would these GDM MACs, whose max_mtu stays at 2030, then be programmed
with MAC_MCR_MAX_RX_JUMBO(3..9), the encodings the manual marks reserved?
Their RX length handling would then depend on another netdev's MTU.

Should the jumbo write be limited to GMAC1?

[ ... ]

> @@ -877,6 +982,12 @@ static void mtk_xgdm_mac_link_up(struct mtk_mac *mac,
>  		mcr |= XMAC_MCR_FORCE_RX_FC;
>  
>  	mtk_w32(mac->hw, mcr, MTK_XMAC_MCR(mac->id));
> +
> +	/* The logic reset above can clear the RX size limit programmed from
> +	 * mtk_mac_config(), so set it again now that the logic is out of
> +	 * reset and the interface mode is known.
> +	 */
> +	mtk_set_mcr_max_rx(mac, mac->hw->rx_buf_len);
>  }

[Severity: Low]
mtk_set_mcr_max_rx() picks the register from the cached mac->interface,
not from the interface argument phylink passes here. This call site also
has no PHY_INTERFACE_MODE_NA guard, unlike mtk_set_all_macs_max_rx() and
mtk_hw_init().

mtk_mac_config() can exit through init_err before it sets mac->interface,
for example when mtk_gmac_2p5gphy_path_setup() fails for GMAC2 INTERNAL.
In that case mac->interface stays NA. Because mac_config returns void,
phylink still calls mac_link_up, and mtk_mac_link_up() dispatches here
based on the interface argument.

Would mtk_set_mcr_max_rx() then read-modify-write the GDM MTK_MAC_MCR of
an XGDM MAC and leave XMAC_RX_CFG2 at its 0x800 reset value?

Should this call use the same NA guard as the other call sites, or pick
the register from the interface argument?

> @@ -1239,29 +1350,40 @@ static void mtk_get_stats64(struct net_device *dev,
>  
>  	storage->tx_errors = dev->stats.tx_errors;
>  	storage->rx_dropped = dev->stats.rx_dropped;
> +	storage->rx_length_errors += dev->stats.rx_length_errors;
>  	storage->tx_dropped = dev->stats.tx_dropped;
>  }

[Severity: Medium]
The new software drops are added to rx_length_errors. Earlier in this
function, storage->rx_errors is still set only from the checksum counter:

    storage->rx_errors = hw_stats->rx_checksum_errors;

The kernel-doc for struct rtnl_link_stats64 in
include/uapi/linux/if_link.h says:

    @rx_errors: Total number of bad packets received on this network
    device. This counter must include events counted by
    @rx_length_errors,

Should rx_errors also include dev->stats.rx_length_errors? Otherwise the
new drops will not show up in the error totals reported by ip -s link
and /proc/net/dev.

[ ... ]

> @@ -2268,6 +2398,15 @@ static int mtk_poll_rx(struct napi_struct *napi, int budget,
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

[Severity: Low]
The comment states that the engine can report a PLEN0 larger than the
posted buffer. If that is true, does the current code already crash on
every SoC?

On the non-page_pool path, build_skb(data, ring->frag_size) plus
skb_reserve(NET_SKB_PAD + NET_IP_ALIGN) leaves exactly buf_size of room.
skb_put(skb, pktlen) with a larger pktlen would then reach
skb_over_panic().

If so, should this check go out as a separate fix with a Fixes: tag, so it
can be applied to net and stable instead of only arriving with the MT7988
feature work?

The check is also required by the build_skb(data, alloc_size) change
further down, which extends tailroom to the whole compound page. Without
the check, an over-long PLEN0 would pass non-zeroed memory from
__get_free_pages() up the stack instead of crashing. Could the commit
message explain that dependency?

[ ... ]

> @@ -3259,6 +3416,71 @@ static int mtk_dma_busy_wait(struct mtk_eth *eth)

[ ... ]

> +/* Program ADMA_RX_CFG[31:16], "ADMA LRO free buffer SDL" in the MT7988A
> + * reference manual: the capacity of the buffer the ADMA is handed,
> + * encoded the way the MediaTek downstream driver does it
> + * (MTK_PDMA_LRO_SDL plus the frame area).  It is not the RX frame-length
> + * limit; that is the per-descriptor PLEN0 together with the MAC limit.
> + */
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
This writes 0x3000 + rx_buf_len into ADMA_RX_CFG[31:16]. That is 14336 at
the default MTU and 21504 at 9K. mtk_dma_init() calls it on every DMA
bring-up on MT7988, including at MTU 1500. MTK_PDMA_LRO_SDL was unused
until now, so this register used to stay at its reset default.

The comment calls this field "the capacity of the buffer the ADMA is
handed". MT7988 has no MTK_HWLRO, so there are no LRO rings.

The ADMA only gets normal-ring buffers of ring->buf_size (about
rx_buf_len, or order-0 page_pool pages at 2K) and the 2K QDMA buffers.
The programmed value is about 12 KiB larger than any buffer that is
actually posted.

If the comment is accurate and the engine treats this field as buffer
capacity, can it DMA past the end of the page_pool pages or the 2K QDMA
buffers?

If PLEN0 is the real bound, as the commit message argues, is the comment
wrong? And is this write needed at all on a SoC without HW LRO?

[ ... ]

> @@ -4360,15 +4585,53 @@ static int mtk_change_mtu(struct net_device *dev, int new_mtu)

[ ... ]

> +	/* On the SoCs whose rings grow with the MTU every MAC has to be
> +	 * narrowed or widened together, because they share the buffers;
> +	 * the other SoCs keep the per-device limit they always had.
> +	 */
> +	if (MTK_HAS_CAPS(eth->soc->caps, MTK_NETSYS_RX_9K))
> +		mtk_set_all_macs_max_rx(eth);
> +	else
> +		mtk_set_mcr_max_rx(mac, length);

[Severity: Medium]
Can this race with another MAC's phylink resolve worker?

mtk_change_mtu() runs under RTNL. mtk_set_all_macs_max_rx() reads every
other MAC's mac->interface without a lock, then does a plain
mtk_r32()/mtk_w32() read-modify-write of that MAC's MTK_MAC_MCR.

The other MAC's phylink resolve worker holds only its own phylink
state_mutex. It writes mac->interface in mtk_mac_config(). It also
read-modify-writes the same MCR in mtk_mac_config(), mtk_mac_finish(),
mtk_gdm_mac_link_up() and mtk_mac_link_down().

One possible interleaving, where MAC B's link is still being set up and
CPU0 computes a new max-rx value for it:

CPU0 (RTNL, MTU change on MAC A)
mtk_set_all_macs_max_rx()
  mtk_set_mcr_max_rx(B)
    mcr_cur = mtk_r32(mac->hw, MTK_MAC_MCR(mac->id));

                     CPU1 (MAC B resolve worker)
                     mtk_gdm_mac_link_up()
                       mcr |= MAC_MCR_TX_EN | MAC_MCR_RX_EN |
                              MAC_MCR_FORCE_LINK;
                       mtk_w32(mac->hw, mcr, MTK_MAC_MCR(mac->id));

    mtk_w32(mac->hw, mcr_new, MTK_MAC_MCR(mac->id));

Would MAC B then be left with TX/RX disabled and FORCE_LINK cleared,
while phylink reports carrier up until the next link flap?

Before this patch, mtk_change_mtu() only touched the MCR of the device
being changed.

rx_buf_len does not change while DMA is running, and all phylinks are
stopped when DMA is down. Would calling mtk_set_all_macs_max_rx() only
when !running avoid this race?

[ ... ]

> @@ -5018,8 +5281,17 @@ static int mtk_add_mac(struct mtk_eth *eth, struct device_node *np)
>  	eth->netdev[id]->irq = eth->irq[MTK_FE_IRQ_SHARED];
>  	eth->netdev[id]->dev.of_node = np;
>  
> +	/* DSA sets the conduit MTU (user MTU + tag) before the netdev is
> +	 * opened, so max_mtu must already be final here.  Deriving it only
> +	 * in mtk_open() leaves the conduit at its 1504 default and blocks
> +	 * 9K frames on the DSA user ports.
> +	 */
>  	if (MTK_HAS_CAPS(eth->soc->caps, MTK_SOC_MT7628))
>  		eth->netdev[id]->max_mtu = MTK_MAX_RX_LENGTH - MTK_RX_ETH_HLEN;
> +	else if (MTK_HAS_CAPS(eth->soc->caps, MTK_NETSYS_RX_9K) &&
> +		 mtk_interface_mode_is_xgmii(eth, phy_mode))
> +		eth->netdev[id]->max_mtu =
> +			MTK_MAX_RX_LENGTH_9K - MTK_RX_ETH_HLEN - VLAN_HLEN;

[Severity: Low]
The commit message says 9K is enabled on "the 10G XGMII MACs". It also
says XMAC_RX_CFG2 is programmed "on the XGMII MACs, so a tagged
maximum-size frame fits from the first 3K class up".

In this tree, mtk_add_mac() never adds USXGMII, 10GBASE-R or 5GBASE-R to
supported_interfaces for any MAC. Those modes only appear inside
mtk_interface_mode_is_xgmii(). MT7988_CAPS also has no MTK_SGMII.

On MT7988, the only reachable mode that counts as XGMII is
PHY_INTERFACE_MODE_INTERNAL. GMAC1 (ESW) and GMAC2 (2P5GPHY) use it.

GMAC1, the only 10G MAC, takes the MCR branch in mtk_set_mcr_max_rx(). The
XMAC_RX_CFG2 path therefore only runs on GMAC2, the internal 2.5G PHY
port.

Could the commit message say which MACs use which limit register?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/patch-51fa5ed3bc801edb3f29b61ca7888382%40loljews.com

