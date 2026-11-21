Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09FC0606A320
	for <linux-mediatek@archiver.kernel.org>; Sat, 21 Nov 2026 12:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cWBGybPo;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LVAWv3eF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=h5SjH6TV7y579PYYKZeassR489/yyrLDaR0+teMqfJI=; b=cWBGybPok/PZdzBAVDofs2K3Dr
	9Q8Q8uKWdfkmSMeWt4TjEzVtOpp7F5DM/1sZrfRzGpJbKjf8aQpYP4r8YBORE6YoipJNZC3xUlT4V
	tebGc0oPyfJ7QFJE6KyniVXKjsx0ZdECSUYxY/MvBzahqs2ryeR4HlAUiPg4ECjG7kmedDCoKA6Co
	mQIL4C9En8YMDDJR/9HodJaWVwVKUBe/SmfRPrEP+QYd2DsAhlD0av11FqtDrmHmK/c9b5EDgsX3P
	lGrw0B2Y635qE8PdHLTvwxINnXuOJ2c7Oy6ucuF8M4JF00eSlGBeP/SH5hY2gQChCijeRNO60ZlOO
	wqs2l29A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUkQu-0000000HCH0-3kWc;
	Sat, 21 Nov 2026 12:43:09 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUkQL-0000000HBzy-06jC;
	Sat, 21 Nov 2026 12:42:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9296D40506;
	Sat, 21 Nov 2026 12:42:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 465701F000C0;
	Sat, 21 Nov 2026 12:42:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795264952;
	bh=h5SjH6TV7y579PYYKZeassR489/yyrLDaR0+teMqfJI=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=LVAWv3eFhEkXj2Cs8vGzD8xqK4J4i02LJGdgwzzsxN/4IftJYR/kz6yRrZ+lZwAzu
	 07oR9xpAzq1WIfQQadd7IY1/ZKPrZWBgZnRBsOmLBovhxEtla1EZXcsrr52EI/y9qk
	 3iArU+dQnAHrKbb0AwdRUBQwYsdnuoin3/KeqxuuFifPcwl8OZ2/n8nbJ+Wui5Rtyf
	 WbkxhuNBPVFhHA0eMd95lK3vpuf4J26owKojv5Ij+EqkBTdlJSwRb4fKek5v9oHJDE
	 8wR7lWo8XC2iZaqNEkc3WTjghsGyKes4cyPZMI6CqbRf5oFLWWxV0Fhk0VlMu8ctLX
	 w7WHwEIPLHO4g==
Subject: Re: [PATCH net-next v12 5/6] net: wwan: t9xx: Add FSM thread
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
Date: Sat, 21 Nov 2026 12:42:30 +0000
Message-ID: <179526495086.3135.1342674464764018440@kernel.org>
In-Reply-To: <20261117-t9xx_driver_v1-v12-5-e181b616b820@compal.com>
References: <20261117-t9xx_driver_v1-v12-5-e181b616b820@compal.com>
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

Thank you for your contribution! Sashiko AI review found 9 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 3 · Low: 6

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] If the modem reboots during the handshake, the FSM can report
  READY falsely.
- [Medium] mtk_cldma_rxq_restart() now calls mtk_cldma_stop_queue(DIR_RX)
  before every restart.
- [Medium] net: wwan: t9xx: mtk_cldma_start_xfer() returns -EIO on
  concurrent stop
- [Low] The subject "net: wwan: t9xx: Add FSM thread" understates the
  patch.
- [Low] When a TX or RX ring could not be stopped
  (drv_info->ring_leaked), mtk_cldma_dev_exit() still calls…
- [Low] The comment on the new field struct txq::is_stopping
  (mtk_cldma.h) says it is "Set by err_work while it stops this queue,…
- [Low] The comment on cldma_drv_info::quiesced (mtk_cldma_drv.h) says
  the instance's "interrupt and workers have already been retired".
- [Low] mtk_cldma_drv_quiesce() masks the CLDMA interrupt output by
  writing LINK_ERROR_VAL to reg_cldma_int_mask…
- [Low] mtk_fsm_feature_set_match() treats host-required features
  inconsistently.

--

net: wwan: t9xx: Add FSM thread

This commit adds an FSM kthread to the t9xx WWAN driver. The thread
serialises device and OS events and notifies registered listeners of
state transitions. It also wires the HS1/HS2/HS3 runtime feature handshake
into the FSM, drives CLDMA instance init/exit from FSM states, registers
the CLDMA IRQ, and adds ISR, error-recovery and quiesce logic.

> net: wwan: t9xx: Add FSM thread

[Severity: Low]
This isn't a bug, but the subject covers only part of what this patch
does. Besides the FSM core, it adds:

  - the HS1/HS2/HS3 handshake
  - CLDMA dev_init/dev_exit driven by FSM states, including the IRQ
    registration
  - the new mtk_cldma_isr(), mtk_cldma_err_work(), txq->is_stopping and
    mtk_cldma_drv_quiesce() recovery and teardown design

It also changes code from earlier patches in the series:

  - mtk_cldma_rxq_restart() now stops the queue before every restart
  - mtk_pcie_hif_exit() holds submit_lock across the whole teardown and
    returns early on !available
  - mtk_trans_ctrl_exit() now calls mtk_pcie_hif_exit()
  - mtk_cldma_txq_free() and mtk_cldma_rxq_free() reorder their masks
    and flushes

The commit message does describe most of this. Would splitting it make a
regression in one part easier to bisect or revert on its own?

> diff --git a/drivers/net/wwan/t9xx/mtk_fsm.c b/drivers/net/wwan/t9xx/mtk_fsm.c
> new file mode 100644
> index 0000000000000..227dc31ed2773
> --- /dev/null
> +++ b/drivers/net/wwan/t9xx/mtk_fsm.c
> @@ -0,0 +1,1002 @@

[ ... ]

> +static int mtk_fsm_feature_set_match(enum runtime_feature_support_type *cur_ft_spt,
> +				     struct runtime_feature_info rtft_info_st,
> +				     struct runtime_feature_info rtft_info_cfg)
> +{
> +	int ret = 0;
> +
> +	switch (FIELD_GET(FEATURE_TYPE, rtft_info_st.feature)) {
> +	case RTFT_TYPE_NOT_EXIST:
> +		fallthrough;
> +	case RTFT_TYPE_NOT_SUPPORT:
> +		/* A feature the device refuses fails the handshake only if
> +		 * the host requires it.
> +		 */
> +		if (FIELD_GET(FEATURE_TYPE, rtft_info_cfg.feature) == RTFT_TYPE_MUST_SUPPORT)
> +			ret = -EPROTO;
> +		else
> +			*cur_ft_spt = RTFT_TYPE_NOT_EXIST;
> +		break;

[ ... ]

> +	case RTFT_TYPE_OPTIONAL_SUPPORT:
> +		if (FIELD_GET(FEATURE_TYPE, rtft_info_cfg.feature) == RTFT_TYPE_NOT_EXIST ||
> +		    FIELD_GET(FEATURE_TYPE, rtft_info_cfg.feature) == RTFT_TYPE_NOT_SUPPORT) {
> +			*cur_ft_spt = RTFT_TYPE_NOT_SUPPORT;
> +		} else {
> +			if (FIELD_GET(FEATURE_VER, rtft_info_st.feature) ==
> +			    FIELD_GET(FEATURE_VER, rtft_info_cfg.feature))
> +				*cur_ft_spt = RTFT_TYPE_MUST_SUPPORT;
> +			else
> +				*cur_ft_spt = RTFT_TYPE_NOT_SUPPORT;
> +		}
> +		break;

[Severity: Low]
Should a host MUST_SUPPORT feature fail the handshake here too?

The host marks QUERY_RTFT_ID_MD_PORT_ENUM and QUERY_RTFT_ID_SAP_PORT_ENUM
as RTFT_TYPE_MUST_SUPPORT, version 0. If the device answers
NOT_EXIST/NOT_SUPPORT, the branch above returns -EPROTO.

If the device instead answers OPTIONAL_SUPPORT with a different
FEATURE_VER, this sets NOT_SUPPORT and returns 0. Then
mtk_fsm_parse_hs2_msg() skips the port enumeration:

	if (cur_ft_spt == RTFT_TYPE_MUST_SUPPORT && query_rtft_action[ft_id]) {

HS3 is sent and HS2_DONE is set. The FSM can then reach READY with no
ports enumerated and no error logged.

[ ... ]

> +static int mtk_fsm_startup_act(struct mtk_md_fsm *fsm, struct mtk_fsm_evt *event)
> +{

[ ... ]

> +	} else if (event->fsm_flag & FSM_HS2_DONE_MASK) {
> +		if (fsm->fsm_flag & event->fsm_flag) {
> +			dev_warn(mdev->dev, "Duplicate HS2 (hs%d), dropping\n", hs_info->id);
> +			dev_kfree_skb(skb);
> +			return 0;
> +		}
> +		ret = mtk_fsm_parse_hs2_msg(fsm, hs_info, skb);
> +		if (!ret)
> +			ret = mtk_fsm_send_hs3_msg(hs_info, skb);
> +		dev_kfree_skb(skb);
> +		if (ret)
> +			goto hs_err;
> +		mtk_fsm_switch_state(fsm, to_state, event);
> +	}
> +
> +	hs_done_flag = READ_ONCE(fsm->hs_done_flag);
> +	if (((fsm->fsm_flag | event->fsm_flag) & hs_done_flag) == hs_done_flag) {
> +		to_state = FSM_STATE_READY;
> +		mtk_fsm_switch_state(fsm, to_state, NULL);
> +	}

[Severity: Medium]
Can mtk_cldma_start_xfer() return -EIO for a queue that err_work is
already stopping? The first is_stopping check here is made under
ring_lock, and ring_lock is then dropped while rearm_lock stays held.
mtk_cldma_err_tx_one() sets is_stopping under ring_lock alone, without
rearm_lock, so the write can land just after this check:

  trb service thread                err_work
  mtk_cldma_start_xfer()
    takes rearm_lock
    reads is_stopping == false
                                    mtk_cldma_err_tx_one()
                                      sets is_stopping
                                      mtk_cldma_stop_queue()
    tx start address reads 0
    mtk_cldma_hw_recovery()
      mtk_cldma_rearm_queues()
        skips the start address
        for this txq, is_stopping
      start address still 0
      returns -EIO
    goto out, before the second
    is_stopping check

mtk_cldma_tx() then gets -EIO rather than -EPIPE, so its early return
for a stopping queue is bypassed. It goes on to call
mtk_cldma_stop_queue() and mtk_cldma_txq_flush() on the same queue
while err_work is stopping and flushing it.

The per-slot ring_lock keeps the two flushes from double-unmapping, but
nothing orders the two stops. Suppose err_work's stop succeeds; it then
flushes and clears is_stopping. If the stop in mtk_cldma_tx() times
out after that, mtk_cldma_tx() sets is_stopping again. The queue then
refuses every new request with -EPIPE until the channel is closed.
Also, requests that the error path meant to complete with -EPIPE can
instead be completed with -EIO by the other flush.

The window needs a zero start address read. That is the lost queue
state case mtk_cldma_hw_recovery() exists to handle.

Should mtk_cldma_err_tx_one() set is_stopping under rearm_lock as well,
so it cannot change while start_xfer holds that lock? Or should
start_xfer re-check is_stopping under ring_lock before it turns a
recovery failure into -EIO?

[Severity: Medium]
Can the FSM reach READY falsely if the modem reboots partway through the
handshake? Nothing ever clears bits in fsm->fsm_flag.

Suppose MD has finished HS2/HS3 and SAP has not, and then the device
reboots:

  fsm->fsm_flag has MD_HS_START | MD_HS2_DONE, state is BOOTUP
  device reboots and goes back through its boot stages
  mtk_fsm_early_bootup_handler() sees a new IDLE dev_state
    mtk_fsm_idle_evt_handler() re-opens both HS channels:

	for (hs_id = 0; hs_id < HS_ID_MAX; hs_id++)
		mtk_fsm_unmask_ext_evt(fsm, fsm->hs_info[hs_id].mhccif_ch);

  new MD HS1 is accepted in BOOTUP, and the host sends HS1 again
  new MD HS2 matches "fsm->fsm_flag & event->fsm_flag" and is dropped
    as a duplicate, so no HS3 is sent
  SAP completes; the stale MD_HS2_DONE bit satisfies hs_done_flag
    and the FSM switches to READY

With later patches in the series, READY enables the MD ports even though
the rebooted MD side never got HS3. The commit message only covers a
reboot after READY.

Should a new HS1 for a side clear that side's done bits?

[ ... ]

> diff --git a/drivers/net/wwan/t9xx/pcie/mtk_cldma.c b/drivers/net/wwan/t9xx/pcie/mtk_cldma.c
> index c0bafb39e4f5a..aca2484c13681 100644
> --- a/drivers/net/wwan/t9xx/pcie/mtk_cldma.c
> +++ b/drivers/net/wwan/t9xx/pcie/mtk_cldma.c

[ ... ]

> @@ -214,21 +376,37 @@ static bool mtk_cldma_rx_check_again(struct rxq *rxq)

[ ... ]

>  static bool mtk_cldma_rxq_restart(struct cldma_drv_info *drv_info, struct rxq *rxq)
>  {
>  	struct rx_req *req = rxq->req_pool + rxq->free_idx;
> +	int ret;
> +
> +	ret = mtk_cldma_stop_queue(drv_info, DIR_RX, rxq->rxqno);
> +	if (ret) {
> +		/* Do not restart it; QUEUE_ERROR stays masked: TRB_CMD_DISABLE
> +		 * tears the queue down and has the leak-the-ring handling for
> +		 * a stop that timed out.
> +		 */
> +		dev_err(drv_info->mdev->dev,
> +			"RX queue %u stop failed (%d), not restarting it\n",
> +			rxq->rxqno, ret);
> +		return true;
> +	}

[Severity: Medium]
What brings this RX queue back after the stop fails? The caller in
mtk_cldma_rx_done_work() has already consumed need_restart:

	if (atomic_xchg(&rxq->need_restart, 0)) {
		if (!mtk_cldma_rxq_restart(drv_info, rxq)) {

Returning true means the restart is never retried. On the error path,
the ISR left QUEUE_ERROR masked, and rx_done_work only unmasks
QUEUE_XFER_DONE on exit. RX also has no equivalent of txq->is_stopping
to record the state.

If the stop completes late, the queue ends up stopped. No XFER_DONE
arrives to run the worker again, so the RX channel stays dead while the
port still looks open.

If the hardware ignores the stop, the queue keeps running with its error
interrupt masked.

The comment points to TRB_CMD_DISABLE, but nothing issues one in this
case. The reset-recovery path in mtk_cldma_rearm_queues() also goes
through this function.

[ ... ]

> @@ -792,9 +1024,110 @@ static int mtk_cldma_hw_recovery(struct cldma_drv_info *drv_info, u32 qno)
>  	return 0;
>  }
>  
> +/* Silence the IP's interrupt output as well as the vector: a handler already
> + * past the mask unmasks it again on its way out.  Repeated calls are no-ops,
> + * so the teardown path can run it again without unregistering twice.
> + */
> +static void mtk_cldma_drv_quiesce(struct cldma_drv_info *drv_info)
> +{
> +	struct mtk_md_dev *mdev = drv_info->mdev;
> +
> +	mutex_lock(&drv_info->rearm_lock);
> +	if (drv_info->quiesced) {
> +		mutex_unlock(&drv_info->rearm_lock);
> +		return;
> +	}
> +	/* also read by the RX worker: no refill retry outlives the drain */
> +	WRITE_ONCE(drv_info->quiesced, true);
> +	mutex_unlock(&drv_info->rearm_lock);
> +
> +	mtk_pci_write32(mdev, drv_info->base_addr + drv_info->hw_regs->reg_cldma_int_mask,
> +			LINK_ERROR_VAL);

[Severity: Low]
This isn't a bug, but LINK_ERROR_VAL is otherwise used only as the
all-ones read-back value for a dead link. See mtk_cldma_check_intr_status(),
mtk_cldma_stop_queue() and mtk_cldma_tx_done_work().

mtk_cldma_drv_init() writes 0 to the same register to enable it. Would a
dedicated "mask all" constant be clearer here?

[ ... ]

> +static int mtk_cldma_dev_exit(struct cldma_dev *cd, int hif_id)
> +{

[ ... ]

> +	if (drv_info->ring_leaked)
> +		dev_err(mdev->dev, "CLDMA%d rings leaked\n", drv_info->hw_id);
> +	/* The leaked rings keep the pool busy: it keeps its pages and only its
> +	 * bookkeeping is freed.  Not destroying it would leak the same pages
> +	 * and the pool.
> +	 */
> +	dma_pool_destroy(drv_info->gpd_dma_pool);

[Severity: Low]
Is it safe to rely on this? The kernel-doc for dma_pool_destroy() in
mm/dmapool.c says:

  Caller guarantees that no more memory from the pool is in use,
  and that nothing will try to use the pool after this call.

When ring_leaked is set, descriptors from this pool are still allocated
and may still be a live DMA target. They survive only because of the
current pool->nr_active busy branch. That branch prints "busy", skips
dma_free_coherent(), and frees only the bookkeeping.

Every bind cycle where a stop times out also leaks more coherent pages
that nothing tracks.

[ ... ]

> diff --git a/drivers/net/wwan/t9xx/pcie/mtk_cldma.h b/drivers/net/wwan/t9xx/pcie/mtk_cldma.h
> index 375b57f672188..f6d26b80589f5 100644
> --- a/drivers/net/wwan/t9xx/pcie/mtk_cldma.h
> +++ b/drivers/net/wwan/t9xx/pcie/mtk_cldma.h

[ ... ]

> @@ -101,6 +103,12 @@ struct txq {
>  	u32 wr_idx;
>  	u32 free_idx;
>  	bool tx_started;
> +	/* Set by err_work while it stops this queue, and left set if the
> +	 * stop failed: the device may still be walking the ring, so new
> +	 * requests are refused with -EPIPE and the ones already queued are
> +	 * kept.  Read under ring_lock by the producer.
> +	 */
> +	bool is_stopping;
>  };

[Severity: Low]
This isn't a bug, but err_work is not the only writer. mtk_cldma_tx()
sets it from the trb service thread when mtk_cldma_start_xfer() fails and
the follow-up stop also fails:

	spin_lock(&txq->ring_lock);
	txq->is_stopping = true;
	spin_unlock(&txq->ring_lock);

mtk_cldma_err_tx_one() then clears it unconditionally after its own stop
and flush succeed, whoever set it. mtk_cldma_rearm_queues() and
mtk_cldma_start_xfer() also read it.

Could the comment describe both writers?

[ ... ]

> diff --git a/drivers/net/wwan/t9xx/pcie/mtk_cldma_drv.h b/drivers/net/wwan/t9xx/pcie/mtk_cldma_drv.h
> index f7b5018d3a737..b32301b0240ad 100644
> --- a/drivers/net/wwan/t9xx/pcie/mtk_cldma_drv.h
> +++ b/drivers/net/wwan/t9xx/pcie/mtk_cldma_drv.h
> @@ -78,8 +78,17 @@ struct cldma_drv_info {

[ ... ]

> +	/* this instance's interrupt and workers have already been retired;
> +	 * makes the quiesce safe to repeat on the teardown path
> +	 */
> +	bool quiesced;

[Severity: Low]
This isn't a bug, but mtk_cldma_drv_quiesce() sets quiesced before any
retirement step runs. It sets the flag under rearm_lock, and only then:

  - writes int_mask
  - masks the vector
  - calls synchronize_irq()
  - unregisters the handler
  - calls drain_workqueue()

mtk_cldma_rx_done_work() and mtk_cldma_rearm_queues() read the flag while
that is still in progress. So the flag really means retirement has
started and no more work should be queued.

Could the comment say that instead of "already been retired"?

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261117-t9xx_driver_v1-v12-0-e181b616b820%40compal.com

