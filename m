Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74322606A320
	for <linux-mediatek@archiver.kernel.org>; Sat, 21 Nov 2026 12:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sOQduf1B;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=echgHL+0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=LLtVvNcvdiWE9Bm0C9C4fhNTth/wg7FRqwbs/4Sj6Dk=; b=sOQduf1BO+AJ87fy+JxD1RXyyk
	m9ZA6dKPuiY3ymPU1OBWWgFGNG+HKr6/S4MfdH5KEHjjkXhjsUd1FLzxc2oOVsVvpxwoTPAsFZxQy
	95fCgUQ13w7FHJZTPObTmjNyLstrJ/fv/LMLyHUqOyU4AlQmAQaFubCSfZTYDh3y/0tMBt6cD7v6L
	eXL3Ddv0WG+eAI0n5q7r0rW3zakMhPl0Ca5v2iIsX4kiXoujs9ZjYg5Rr2kB8ulPQ0Zf9BrduIoyY
	NavZne3qLZA6A0Jae0s7evd0YmVVu/lspfkxbm798+xO6t1DdUTL8mXnqJJiGtsRQCvlO7pq8BQVs
	RWtAplrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUkQT-0000000HC2L-0jJi;
	Sat, 21 Nov 2026 12:42:41 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUkQH-0000000HBxs-3Cr0;
	Sat, 21 Nov 2026 12:42:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3897C605D0;
	Sat, 21 Nov 2026 12:42:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FFC81F000C4;
	Sat, 21 Nov 2026 12:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795264948;
	bh=LLtVvNcvdiWE9Bm0C9C4fhNTth/wg7FRqwbs/4Sj6Dk=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=echgHL+0OoagPMZ9zwm/xjZ2yloMB9WT+OohPiIJP8INhpDnZJEydHCfxrUVUKR2V
	 FqQW6sGNyudsW3Qike7vYm6BhXmZF9oYOuETY3IzAbAxqKMo/P1cAPRfdGbUpm+Iyl
	 +P+ZBuE2xe+09QDS5NAAUG6vQo1JljJeJ/C2/p2Cl63FSRTQatNKEurCR8cmcMoKPI
	 O4jher4tqa4P8cTMP4TJ/xUdZ8X456gXCfZbBmh0KK0AJcb9eRRRCPbi6N5+NPuZvS
	 9ThOelBVoQqBrdqyjrKIl/4jqDNuhJ1YCPdIqIb8r/IINgA/1I9Taun7T1OS2ZYi3x
	 RLN4jeZLprsmA==
Subject: Re: [PATCH net-next v12 3/6] net: wwan: t9xx: Add control DMA interface
From: netdev-bot+sashiko@kernel.org
To: jackbb_wu@compal.com
Cc: loic.poulain@oss.qualcomm.com, ryazanov.s.a@gmail.com,
 johannes@sipsolutions.net, andrew+netdev@lunn.ch, davem@davemloft.net,
 kuba@kernel.org, pabeni@redhat.com, wen-zhi.huang@mediatek.com,
 shi-wei.yeh@mediatek.com, Minano.tseng@mediatek.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, horms@kernel.org, corbet@lwn.net,
 skhan@linuxfoundation.org, robert_yu@compal.com, Jeff_Chang@compal.com,
 edumazet@kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-doc@vger.kernel.org
Date: Sat, 21 Nov 2026 12:42:27 +0000
Message-ID: <179526494702.3135.6051033006782624225@kernel.org>
In-Reply-To: <20261117-t9xx_driver_v1-v12-3-e181b616b820@compal.com>
References: <20261117-t9xx_driver_v1-v12-3-e181b616b820@compal.com>
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Thank you for your contribution! Sashiko AI review found 4 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 3 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] In mtk_cldma_rxq_free()
  (drivers/net/wwan/t9xx/pcie/mtk_cldma.c), the final ring-drain loop…
- [Medium] mtk_cldma_hw_recovery() runs from mtk_cldma_start_xfer() when
  one TX queue's UL start-address register reads 0.
- [Medium] The driver says the CLDMA 'can lose its queue state, which
  leaves zero addresses' (comment in mtk_cldma_drv_init()).
- [Low] The patch adds TRB_CMD_STOP and TRB_CMD_RECOVER to the shared
  enum mtk_trb_cmd_type in mtk_ctrl_plane.h, but nothing implements them.

--

net: wwan: t9xx: Add control DMA interface

This adds the CLDMA (Cross Layer DMA) control-plane transport for the
t9xx WWAN driver. It covers the GPD ring handling for the TX and RX
queues, the reset and re-arm logic for an instance, and a TRB service
layer. Probe now attaches the transport context through the new
mtk_pci_dev_init()/mtk_pci_dev_exit() hooks.

> diff --git a/drivers/net/wwan/t9xx/pcie/mtk_cldma.c b/drivers/net/wwan/t9xx/pcie/mtk_cldma.c
> new file mode 100644
> index 0000000000000..c0bafb39e4f5a
> --- /dev/null
> +++ b/drivers/net/wwan/t9xx/pcie/mtk_cldma.c
> @@ -0,0 +1,1207 @@

[ ... ]

> +static void mtk_cldma_rx_done_work(struct work_struct *work)
> +{

[ ... ]

> +	ret = mtk_cldma_check_rx_req(drv_info, rxq);
> +	if (!ret)
> +		goto again;
> +
> +	/* -ENXIO means the queue has no start address programmed, which is
> +	 * exactly what a restart installs, so consume need_restart first.
> +	 * Only the resume below is skipped in that case.
> +	 */
> +	mutex_lock(&drv_info->rearm_lock);
> +	if (!atomic_read(&rxq->need_exit)) {
> +		if (atomic_xchg(&rxq->need_restart, 0)) {
> +			if (!mtk_cldma_rxq_restart(drv_info, rxq)) {
> +				atomic_set(&rxq->need_restart, 1);
> +				mutex_unlock(&drv_info->rearm_lock);
> +				goto again;
> +			}
> +		} else if (ret != -ENXIO) {
> +			mtk_cldma_resume_queue(drv_info, DIR_RX, rxq->rxqno);
> +		}
> +	}
> +	mutex_unlock(&drv_info->rearm_lock);
> +
> +	if (ret == -ENXIO)
> +		goto out;

[Severity: Medium]
What brings this RX queue back when mtk_cldma_check_rx_req() returns
-ENXIO and need_restart is clear?

mtk_cldma_check_rx_req() treats a zero SO_CUR_ADDR as lost state:

    curr_addr = mtk_cldma_get_rx_curr_addr(drv_info, rxq->rxqno);
    if (unlikely(!curr_addr))
        return -ENXIO;

The comment in mtk_cldma_drv_init() also says the device "can lose its
queue state, which leaves zero addresses".

In that case this worker skips the resume and goes to out. That path
unmasks XFER_DONE and returns. It does not set need_restart, restart
the queue or schedule any recovery.

An RX engine with no address should not raise another XFER_DONE, so
nothing reruns this worker. The only lost-state recovery is in the TX
submit path:

    mtk_cldma_start_xfer()
        if (unlikely(!val))
            mtk_cldma_hw_recovery()

Could RX on this CLDMA instance stay stuck until the host happens to
submit a TX on the same instance? On CLDMA0 (the SAP control channel),
host TX may be rare after the handshake. Unsolicited device-to-host
control messages could then sit there indefinitely.

This depends on SO_CUR_ADDR reading 0 after the state is lost, which
the driver's own comments say can happen.

[ ... ]

> +static void mtk_cldma_rxq_free(struct cldma_drv_info *drv_info, u32 rxqno)
> +{

[ ... ]

> +	/* free rx req resource */
> +	for (i = 0; i < rxq->nr_gpds; i++) {
> +		req = rxq->req_pool + rxq->free_idx;
> +		if (!(req->gpd->rx_gpd.gpd_flags & CLDMA_GPD_FLAG_HWO) &&
> +		    le16_to_cpu(req->gpd->rx_gpd.data_recv_len)) {
> +			if (!mtk_cldma_rx_skb_adjust(mdev, req)) {
> +				rxq->rx_done(req->skb, rxq->arg);
> +				req->skb = NULL;
> +			}
> +		}

[Severity: Medium]
Can req->skb be NULL when this loop reaches mtk_cldma_rx_skb_adjust()?

In mtk_cldma_rx_done_work(), if both the reload and the recycle
dma_map_single() fail, the slot is left empty:

    dev_kfree_skb_any(rx_skb);
    req->skb = NULL;
    req->data_dma_addr = 0;
    goto out_retry;

The leading refill for an empty slot (the !req->skb branch) can also
fail and jump to out_retry. The cancel_work_sync() earlier in
mtk_cldma_rxq_free() can then cancel the requeued retry before the
slot is refilled.

mtk_cldma_rx_skb_adjust() dereferences req->skb unconditionally:

    req->skb->len = 0;
    skb_reset_tail_pointer(req->skb);
    skb_put(req->skb, recv_len);

mtk_cldma_rx_skb_adjust() already zeroed data_recv_len for that slot.
To get here, the device would have to write a non-zero data_recv_len
into a GPD with HWO clear, which it does not own. The driver already
treats data_recv_len as device-controlled and clamps it against mtu.

If that happens, would closing the channel oops on a NULL skb? Would a
req->skb check here, like the one at the top of the loop in
mtk_cldma_rx_done_work(), be enough?

[ ... ]

> +/* The device reported a zero TX start address: it lost its queue state. */
> +static int mtk_cldma_hw_recovery(struct cldma_drv_info *drv_info, u32 qno)
> +{
> +	u64 val;
> +
> +	dev_err(drv_info->mdev->dev,
> +		"CLDMA%d lost its queue state, re-initializing\n",
> +		drv_info->hw_id);
> +
> +	mtk_cldma_rearm_queues(drv_info);

[Severity: Medium]
Is it safe to re-arm the whole instance here without a stop or a
mtk_cldma_drv_reset() first?

mtk_cldma_txq_free() and mtk_cldma_rxq_free() both reset the IP before
they call mtk_cldma_rearm_queues(). Here, the only evidence is that
one TX queue's UL start address read back as zero.

mtk_cldma_rearm_queues() then does three things:

  - mtk_cldma_drv_init() read-modify-writes UL_CFG and SO_CFG (the GPD
    format bits) and other IP-global registers.

  - On every published TX queue with tx_started set, it reprograms the
    start address and issues UL_START.

  - On every published RX queue, it sets need_restart, so
    mtk_cldma_rx_done_work() later reprograms SO_START_ADDR and issues
    SO_START.

What if a zero read on one queue does not mean the whole instance was
reset? Sibling TX and RX engines could still be running when they get
these CFG writes and START commands.

On TX, a START at the GPD currently being sent could resend or cut
that control message. On RX, a restart could lose or corrupt the frame
being written.

If the hardware only reads zero after a full IP reset, the other
engines are already idle and this does not apply. For comparison, the
t7xx driver re-initializes in a similar way without a stop, but only
reprograms the affected queue.

[ ... ]

> diff --git a/drivers/net/wwan/t9xx/pcie/mtk_trans_ctrl.c b/drivers/net/wwan/t9xx/pcie/mtk_trans_ctrl.c
> new file mode 100644
> index 0000000000000..3650878128a27
> --- /dev/null
> +++ b/drivers/net/wwan/t9xx/pcie/mtk_trans_ctrl.c
> @@ -0,0 +1,614 @@

[ ... ]

> +int mtk_pcie_hif_submit_skb(struct mtk_md_dev *mdev, struct sk_buff *skb, bool force_send)
> +{
> +	struct mtk_ctrl_blk *ctrl_blk = mdev->ctrl_blk;
> +	struct mtk_ctrl_trans *trans;
> +	struct queue_info *que;
> +	struct trb *trb;
> +	int ret;
> +
> +	trans = ctrl_blk->ctrl_hw_priv;
> +	trb = (struct trb *)skb->cb;
> +
> +	if (trb->cmd == TRB_CMD_STOP || trb->cmd == TRB_CMD_RECOVER) {
> +		trb->trb_complete(skb);
> +		return 0;
> +	}

[Severity: Low]
TRB_CMD_STOP and TRB_CMD_RECOVER are added to enum mtk_trb_cmd_type in
mtk_ctrl_plane.h, but nothing implements them. The commit message does
not mention them either.

Here they complete immediately and never set trb->status. They also
skip the trans->available check and submit_lock.
mtk_cldma_trb_process() rejects them in any case:

    if (!(trb->cmd > TRB_CMD_MIN && trb->cmd < TRB_CMD_STOP))
        return -EINVAL;

A caller trying to stop or recover a queue would get a successful
completion, with whatever status was left in skb->cb, while the queue
keeps running.

No caller in the series issues these commands yet. Could they be
dropped, or rejected with something like -EOPNOTSUPP until they are
implemented?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261117-t9xx_driver_v1-v12-0-e181b616b820%40compal.com

