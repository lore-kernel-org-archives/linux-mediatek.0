Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95635606A321
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Nov 2026 11:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UsCTyIRv;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZKj/5PY5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=gBaRZPyJTX0vGBHDFrBjUpvgfOXhHnVeShEMkW6baMk=; b=UsCTyIRv645nmqIxK9ZwTig1y1
	IoySTx1N+hNr4u0yq33liXj+3ZyFRDnjTfOQQzu+jRnWvDkdMMnSDtHcoGrdqdvVuhCkO6BlrT1BP
	Ac7HLFygqp0vWczRfZLlfu30RvJRHJwxnPN6nFcnxrm1XLDyjnt+SPH5i+OsVbkOR5IdSOCtSXJcg
	VzCMSjCmQ2qiB13Lt/6ofu5a6oMu8ppEDsJsvghFn2MPqglCwAv399V//+KXlPLcPfEQbIZjutxX7
	Lw7kSEUdd4ToIwbrdtTF2eBW5QBeZ8ogKnIlYMp1ZC6irZkcSKD0EhImel9XiJRKq7NBw7/fUbyPl
	W5q/eCJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQjfI-00000003ZQr-3Bqj;
	Tue, 10 Nov 2026 11:05:25 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQjdu-00000003ZEk-0ZBr;
	Tue, 10 Nov 2026 11:03:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 91791635CA;
	Tue, 10 Nov 2026 11:03:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 090861F008A1;
	Tue, 10 Nov 2026 11:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794308637;
	bh=gBaRZPyJTX0vGBHDFrBjUpvgfOXhHnVeShEMkW6baMk=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=ZKj/5PY5g2mRk7ixIGpNVYsamJFsXyppTpT5aG12JpVs938iHS+XsZqb2NA05HSyb
	 QevnkuJ3yRg5yZf0qj0rVV5seDWkFfcNNjOOCfog8fYAepqmjWwTwAhGVDo3ozRU4L
	 s9qFVuRgcbUL2RFzFIQGIfIgU64VP0dosj1NW+PIh1fzfh93+StrkKLkM/vMMQZkL7
	 ek3quQaueUHBANia6NJQFy/7+g2llDmIWaJJcF9q1C5lXLAomAulzd+KFR/LOCfNmb
	 4m7ug83kqf+Ewo4/nQeAlMDxbfxMwj7I2uaWXvv4YZaDrtAlx6qc989K5Ur5jhB1tP
	 MAI6ROiQil4eA==
Subject: Re: [PATCH v11 4/6] net: wwan: t9xx: Add control port
From: netdev-bot+sashiko@kernel.org
To: jackbb_wu@compal.com
Cc: loic.poulain@oss.qualcomm.com, ryazanov.s.a@gmail.com,
 johannes@sipsolutions.net, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 wen-zhi.huang@mediatek.com, shi-wei.yeh@mediatek.com,
 Minano.tseng@mediatek.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, horms@kernel.org, corbet@lwn.net,
 skhan@linuxfoundation.org, robert_yu@compal.com, Jeff_Chang@compal.com,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-doc@vger.kernel.org
Date: Tue, 10 Nov 2026 11:03:55 +0000
Message-ID: <179430863558.994134.1789647998017952188@kernel.org>
In-Reply-To: <20261105-t9xx_driver_v1-v11-4-2084aa512864@compal.com>
References: <20261105-t9xx_driver_v1-v11-4-2084aa512864@compal.com>
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Thank you for your contribution! Sashiko AI review found more severe
issue(s) in other patches of this series. This mail is only an FYI, in case
you want to address the nit picks below when you respin.

Low priority / nit picks for your consideration:

- [Low] The struct mtk_port comment in drivers/net/wwan/t9xx/mtk_port.h
  (lines 83-86) says tx_seq and rx_seq "are reset while the channel is…
- [Low] mtk_port_rx_dispatch() (drivers/net/wwan/t9xx/mtk_port.c:408-409)
  picks the destination port from the CCCI header channel, which the…
- [Low] Concern: mtk_port_status_update() and the port->enable field it
  writes are dead code at this commit and are not mentioned in the…
- [Low] Concern: mtk_port_internal_enable() sends a compensating DISABLE
  for every ENABLE failure other than -EBUSY, including failures before…
- [Low] Concern: mtk_port_send_data() never checks skb->len against
  port->tx_mtu, and mtk_cldma_submit_tx() writes cpu_to_le16(skb->len)…
- [Low] Concern: mtk_port_internal_close() runs
  test_and_clear_bit(PORT_S_OPEN) and then mtk_port_common_close() runs…
- [Low] Concern: the radix-tree port table has no consistent lock or RCU
  scheme.

--

net: wwan: t9xx: Add control port

This patch adds the t9xx control port layer. A port manager builds a
radix-tree port table and passes TRBs between port I/O and CLDMA, and an
internal port type provides open/close/write/recv_register. struct trb
gets a kref so mtk_ctrl_trb_handler() can hold a reference across a
dispatch, and TX sequence numbers are stamped at hardware hand-off.

> diff --git a/drivers/net/wwan/t9xx/mtk_port.c b/drivers/net/wwan/t9xx/mtk_port.c
> new file mode 100644
> index 0000000000000..7fec696bd6db1
> --- /dev/null
> +++ b/drivers/net/wwan/t9xx/mtk_port.c
> @@ -0,0 +1,667 @@

[ ... ]

> +static int mtk_port_rx_dispatch(struct sk_buff *skb, void *priv)
> +{

[ ... ]

> +	channel = FIELD_GET(MTK_HDR_FLD_CHN, le32_to_cpu(ccci_h->status));
> +	/* A CLDMA instance carries the channels of one peer only (sAP or MD),
> +	 * the peer of the port that armed this queue.
> +	 */
> +	if (MTK_PEER_ID(channel) == MTK_PEER_ID(port->info.rx_ch))
> +		port = mtk_port_search_by_id(port_mngr, channel);
> +	else
> +		port = NULL;
> +	if (unlikely(!port)) {
> +		dev_warn_ratelimited(port_mngr->ctrl_blk->mdev->dev,
> +				     "Failed to find port by channel:%d\n", channel);
> +		goto drop_data;
> +	}
> +
> +	mtk_port_check_rx_seq(port, ccci_h);
> +	port->rx_seq = FIELD_GET(MTK_HDR_FLD_SEQ, le32_to_cpu(ccci_h->status));

[Severity: Low]
Should this also check that the channel belongs to the queue the frame
arrived on?

The destination port is taken from the channel field of the CCCI header,
and the device writes that field. The only check is that its peer ID
matches the peer of the port that armed this RX queue.

Later in the series the MD peer has three ports, each on its own queue:
MDCTRL on CLDMA1 RXQ0, MBIM on CLDMA1 RXQ2 and AT on CLDMA1 RXQ5. If a
frame arrives on the MBIM or AT queue carrying channel CCCI_CONTROL_RX,
it goes to the MDCTRL internal port's ->recv().

Each queue has its own CLDMA RX work item on a WQ_UNBOUND workqueue. Two
queues' workers can therefore run mtk_port_check_rx_seq(), write
port->rx_seq and call ->recv() for the same port at the same time. That
breaks the rule in struct mtk_port that rx_seq is written "only from the
rx_done callback of the one queue serving this channel". That rule is
the reason rx_seq has no lock.

Could the frame be dropped unless MTK_CH_ID(channel) matches the arming
port's channel, or unless the channel's queue matches the receiving
queue? t7xx does this by matching rxq_index.

[ ... ]

> +int mtk_port_ch_enable(struct mtk_port *port)
> +{
> +	struct mtk_port_mngr *port_mngr = port->port_mngr;
> +	struct trb_open_priv *trb_open_priv;
> +	struct sk_buff *skb;
> +	struct trb *trb;
> +	int ret;
> +
> +	/* The modem restarts its sequence numbering with the channel, and
> +	 * the first packet after it is not checked.
> +	 */
> +	port->tx_seq = 0;
> +	port->rx_seq = MTK_INVALID_RX_SEQ;

[Severity: Low]
Is the channel always closed when these counters are reset? The comment
in struct mtk_port in mtk_port.h depends on it:

	/* tx_seq is stamped and advanced only at hardware hand-off, by the one
	 * thread serving this port's TX queue; rx_seq only from the rx_done
	 * callback of the one queue serving this channel.  Both are reset
	 * while the channel is disabled, so neither needs a lock.
	 */

These are plain stores, made before the ENABLE is submitted. Nothing
checks that the CLDMA queue is closed. I can see two ways the queue can
still be live at this point.

The first is a retry after a timeout. On -ETIMEDOUT,
mtk_port_internal_enable() does this:

	ret = mtk_port_ch_enable(port);
	if (ret && ret != -EBUSY) {
		...
		mtk_port_ch_disable(port);
		clear_bit(PORT_S_ENABLE, &port->status);
		return;
	}

The ENABLE trb is still queued, with the DISABLE behind it. With "Add
FSM thread" later in the series, the handshake then fails in
mtk_fsm_ctrl_ch_start()->mtk_port_internal_open() with -ENODEV. The
device sends HS1 again, and mtk_port_mngr_fsm_state_handler_late() calls
->enable() a second time.

Suppose the trb thread has already run the first ENABLE. The RX queue is
then armed with rxq->arg = port, and the DISABLE has not closed it yet.
mtk_port_rx_dispatch() can then write port->rx_seq while this function
resets it.

The second is -EBUSY, which mtk_port_ch_enable() treats as success.
Suppose the queue was left open, for example because an earlier DISABLE
submit failed with -ENOMEM. Both counters are then reset while the queue
is live. The trb thread may still be running mtk_port_tx_seq_stamp() and
mtk_port_tx_seq_advance() on queued TX packets.

rx_seq only feeds the rate-limited warning in mtk_port_check_rx_seq(),
so the visible effect is a spurious or missed out-of-order warning.
KCSAN would still report the race.

Could the guarantee in the comment be enforced, or could the comment be
reworded to match what the code actually ensures?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261105-t9xx_driver_v1-v11-0-2084aa512864%40compal.com

