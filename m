Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3713606A321
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Nov 2026 11:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wl7BzUEJ;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jBaTn144
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Z+ytI9wavvMw+zLcwrAzpV1MNvJGWqbv85CxsVoh33I=; b=wl7BzUEJ1aq7LKnqSbXXZB9VY1
	UCoraShPejIWtWeZRuzg7BFYbdFidwFpINYhELjFR3TRQVrt7aU09MhCJFctJzX1959KZ1Mf9zZnD
	zuR3pjV8lFnaXxjAubF9OAiquKKn757PK67USKy7XbZ2VVahXyshteqpss8LPA7WnQ/2I6lrJBldM
	UQXsZCgu9s3mKmYDKIGFtSB5MVqffwX5/FyU/EnWKYw87ufPqwfTjg8O9pvTI2uLU3TPou23bz4EW
	RbcM/vOaoe0ew9PRfdhUhE0wtPSnTtxUda3l+Sw0tGhfz+/u3tplnm7lEw3mXYB8QeSThEfCct0ju
	ZIMyPuWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQjfV-00000003ZSz-1DFL;
	Tue, 10 Nov 2026 11:05:37 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQjdv-00000003ZF5-3Ff8;
	Tue, 10 Nov 2026 11:04:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 387BC6389B;
	Tue, 10 Nov 2026 11:03:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D79D91F0089F;
	Tue, 10 Nov 2026 11:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794308639;
	bh=Z+ytI9wavvMw+zLcwrAzpV1MNvJGWqbv85CxsVoh33I=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=jBaTn144YJp7KoPTLQbhZ8GkpZExfCIHBa4Y4iC68uDtRdUrrSnQtBRnpKFX2y+6p
	 54hgpuLx3jwsKvE9mM/HP7eOd1wGHmbKkEaI1Q5XnPu+unQPFq5hM4mopYb3UvaQTo
	 lKDJFtNl+vlilYwkLiZlCClztXd5alJ1Lf8oHG27WGWIJmCSPmN+393+FViW9QXfNg
	 tHIMuBNckryMXsVdY8KOa9X6dE4287p8mYSqYnaWaBg3OQi+J078zWeFN5+DxMFAnN
	 TqeUaIB5KG9SKHATHH0uSe23p5m4RLOIvofz0AkOumyfdmKHKdqGlfEyqnThbJx639
	 bYfn8bz6JuhiA==
Subject: Re: [PATCH v11 5/6] net: wwan: t9xx: Add FSM thread
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
Date: Tue, 10 Nov 2026 11:03:57 +0000
Message-ID: <179430863746.994134.15827653788526776199@kernel.org>
In-Reply-To: <20261105-t9xx_driver_v1-v11-5-2084aa512864@compal.com>
References: <20261105-t9xx_driver_v1-v11-5-2084aa512864@compal.com>
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

Thank you for your contribution! Sashiko AI review found 6 potential
issue(s) to consider.

Critical: 0 · High: 1 · Medium: 2 · Low: 3

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] net: wwan: t9xx: late is_stopping check in
  mtk_cldma_start_xfer()
- [Medium] When READY is refused, mtk_fsm_startup_act() has no way to
  recover.
- [Medium] In mtk_fsm_feature_set_match(), the
  RTFT_TYPE_SUPPORT_BACKWARD_COMPAT case (line 163) compares only…
- [Low] mtk_fsm_parse_hs2_msg() runs the runtime-feature actions before
  the HS2 framing has been checked.
- [Low] Two comments say the FSM kthread is "parked", but nothing in this
  code ever parks it.
- [Low] When mtk_cldma_err_tx_one() cannot stop a TX queue
  (mtk_cldma_stop_queue returns something other than 0 or -ENODEV), it…

--

net: wwan: t9xx: Add FSM thread

This commit adds an FSM kthread to the t9xx WWAN driver and wires the
HS1/HS2/HS3 runtime feature handshake into it. CLDMA bring-up and teardown
are driven from FSM state transitions, including registering the IRQ and
adding err_work for queue error recovery.

> diff --git a/drivers/net/wwan/t9xx/mtk_fsm.c b/drivers/net/wwan/t9xx/mtk_fsm.c
> new file mode 100644
> index 0000000000000..3350f6df5064a
> --- /dev/null
> +++ b/drivers/net/wwan/t9xx/mtk_fsm.c
> @@ -0,0 +1,1085 @@

[ ... ]

> +static int mtk_fsm_feature_set_match(enum runtime_feature_support_type *cur_ft_spt,
> +				     struct runtime_feature_info rtft_info_st,
> +				     struct runtime_feature_info rtft_info_cfg)
> +{

[ ... ]

> +	case RTFT_TYPE_SUPPORT_BACKWARD_COMPAT:
> +		/* Decided on the device's declaration alone: the host's
> +		 * configured type can be the older of the two, and gating on
> +		 * it would keep off a feature the device just called
> +		 * compatible.
> +		 */
> +		if (FIELD_GET(FEATURE_VER, rtft_info_st.feature) >=
> +		    FIELD_GET(FEATURE_VER, rtft_info_cfg.feature))
> +			*cur_ft_spt = RTFT_TYPE_MUST_SUPPORT;
> +		else
> +			*cur_ft_spt = RTFT_TYPE_NOT_EXIST;
> +		break;

[Severity: Medium]
Should this case also check the host's configured type?

Every host query entry is version 0. The entries the host never configured
are zero, because the fsm comes from devm_kzalloc(). So the version test is
always true. Any feature the device marks BACKWARD_COMPAT gets promoted to
RTFT_TYPE_MUST_SUPPORT, even when the host set it to NOT_EXIST or
NOT_SUPPORT. The MUST_SUPPORT case returns -EPROTO for that host config,
and the OPTIONAL case downgrades it.

In mtk_fsm_hs_info_init_by_hsid(), the MD handshake leaves
query_ft_set[QUERY_RTFT_ID_SAP_PORT_ENUM] as NOT_EXIST. The SAP handshake
leaves query_ft_set[QUERY_RTFT_ID_MD_PORT_ENUM] as NOT_EXIST. Both slots
have a handler in query_rtft_action[]. So mtk_fsm_parse_hs2_msg() would
run mtk_port_status_update() on port data the host never asked for:

    if (cur_ft_spt == RTFT_TYPE_MUST_SUPPORT && query_rtft_action[ft_id]) {
        if (!data_len) {
            ...
            ret = -EPROTO;
            break;
        }

If that entry has data_len == 0, the whole HS2 fails with -EPROTO. No HS3
is sent and the FSM never reaches READY.

The comment says the host's type is ignored because it "can be the older
of the two". That is about versions. Does it really cover a host that
never queried the feature, or one that explicitly refused it?

> +static int (*query_rtft_action[FEATURE_CNT])(struct mtk_md_dev *mdev,
> +					     void *rt_data, u32 data_len) = {
> +	[QUERY_RTFT_ID_MD_PORT_ENUM] = mtk_port_status_update,
> +	[QUERY_RTFT_ID_SAP_PORT_ENUM] = mtk_port_status_update,
> +};

[ ... ]

> +static int mtk_fsm_parse_hs2_msg(struct mtk_md_fsm *fsm, struct fsm_hs_info *hs_info,
> +				 struct sk_buff *skb)
> +{

[ ... ]

> +	rt_data = skb->data;
> +	rt_data_len = skb->len;
> +
> +	offset = sizeof(struct feature_query);
> +	for (ft_id = 0; ft_id < FEATURE_CNT; ft_id++) {

[Severity: Low]
This skips the feature_query header without checking head_pattern or
tail_pattern. It then runs query_rtft_action[] on the entries, and
mtk_port_status_update() writes port->enable. The FEATURE_QUERY_PATTERN
check on the same skb only runs later:

mtk_fsm_startup_act()
  mtk_fsm_parse_hs2_msg()          <- actions applied
  mtk_fsm_send_hs3_msg()
    mtk_fsm_append_rtft_entries()  <- -EPROTO on bad patterns

So an HS2 with a bad header but valid entries updates the port table
first, and only then is rejected. mtk_fsm_startup_act() goes to hs_err
and re-arms the channel. The port enable state from the rejected message
stays in place, and any port the retried HS2 does not list keeps that
value.

Could the pattern check move into mtk_fsm_parse_hs2_msg(), before any
action runs?

[ ... ]

> +static int mtk_fsm_startup_act(struct mtk_md_fsm *fsm, struct mtk_fsm_evt *event)
> +{

[ ... ]

> +	hs_done_flag = READ_ONCE(fsm->hs_done_flag);
> +	if (((fsm->fsm_flag | event->fsm_flag) & hs_done_flag) == hs_done_flag) {
> +		int user;
> +
> +		for (user = 0; user < MTK_FSM_HIF_USER_MAX; user++) {
> +			if (fsm->hif_err[user]) {
> +				dev_err(mdev->dev,
> +					"Refusing READY: HIF user %d init failed with %d\n",
> +					user, fsm->hif_err[user]);
> +				return fsm->hif_err[user];
> +			}
> +		}

[Severity: Medium]
Once READY is refused here, how does the FSM recover?

This returns directly and does not go through hs_err, so no handshake
channel is re-armed. Both channels were masked by their HS1 handlers. No
further STARTUP can arrive, and the FSM stays in BOOTUP until the driver
is rebound.

One way to get here is a DEV_CFG_MD_ONLY device. mtk_fsm_idle_evt_handler()
sets hs_done_flag to the MD bits only, but it still unmasks both channels:

    for (hs_id = 0; hs_id < HS_ID_MAX; hs_id++)
        mtk_fsm_unmask_ext_evt(fsm, fsm->hs_info[hs_id].mhccif_ch);

If a SAP HS1 arrives and mtk_cldma_dev_init(CLDMA0) fails,
hif_err[MTK_FSM_HIF_USER_CLDMA0] stays set. When the MD handshake
completes, READY is refused for good, even though SAP is not required in
that configuration. Can firmware send a SAP HS1 in MD-only mode?

Separately, the comment above mtk_fsm_hif_err_record() says:

    so a retried init that succeeds clears the failure it recorded before.

The MTK_FSM_HIF_USER_CTRL slot is only written by
mtk_ctrl_trans_fsm_state_handler(), on the transition to FSM_STATE_ON.
mtk_fsm_dev_add_act() allows that transition only once, from
FSM_STATE_INVALID. Is there any retry path for that slot?

The commit message says "the FSM advances to READY only after both
complete". It does not mention the MD-only case or the hif_err gate.

[ ... ]

> +err_unregister_evt:
> +	mtk_pci_unregister_ext_evt(mdev, DEV_EVT_D2H_BOOT_FLOW_SYNC);
> +err_stop_thread:
> +	/* mdev->fsm is never published on failure, so mtk_fsm_exit() cannot
> +	 * stop the parked kthread for us; it must be stopped here.
> +	 */
> +	kthread_stop(fsm->fsm_handler);
> +	put_task_struct(fsm->fsm_handler);
> +	return ret;
> +}

[Severity: Low]
This isn't a bug, but this thread is not parked. It was only created by
kthread_create() and never woken, and nothing in mtk_fsm.c calls
kthread_park().

The comment in mtk_pci_dev_exit() has the same problem:

    /* Close the event gate and park the FSM thread before the transport
     * plane it drives is torn down.
     */
    mtk_fsm_stop(mdev);

mtk_fsm_stop() clears fsm->fsm_handler and calls kthread_stop() and
put_task_struct(). The thread is terminated, not parked.

[ ... ]

> diff --git a/drivers/net/wwan/t9xx/pcie/mtk_cldma.c b/drivers/net/wwan/t9xx/pcie/mtk_cldma.c
> index d8763cdd67dac..4893edfebf79e 100644
> --- a/drivers/net/wwan/t9xx/pcie/mtk_cldma.c
> +++ b/drivers/net/wwan/t9xx/pcie/mtk_cldma.c

[ ... ]

> @@ -967,15 +1318,94 @@ static void mtk_cldma_txq_flush(struct cldma_drv_info *drv_info,

[ ... ]

> +static void mtk_cldma_err_tx_one(struct cldma_drv_info *drv_info, u32 qno)
> +{
> +	struct txq *txq;
> +	int ret;
> +

[ ... ]

> +	spin_lock(&txq->ring_lock);
> +	txq->is_stopping = true;
> +	spin_unlock(&txq->ring_lock);
> +
> +	ret = mtk_cldma_stop_queue(drv_info, DIR_TX, qno);
> +	/* -ENODEV: the link is dead, nothing is walking the ring */
> +	if (ret && ret != -ENODEV) {
> +		/* the device may still be walking the ring: unmapping its
> +		 * buffers here would leave it writing into unmapped memory.
> +		 * is_stopping is left set so nothing submits to it again,
> +		 * and QUEUE_ERROR masked until an instance re-arm.
> +		 */
> +		dev_err(drv_info->mdev->dev,
> +			"TX queue %u stop failed (%d), keeping its requests\n",
> +			qno, ret);
> +		return;
> +	}

[Severity: High]
The is_stopping test only runs after the start address has been read.
If that address was zero, mtk_cldma_hw_recovery() has also already
re-armed the whole instance by this point. Shouldn't a queue that
err_work owns be turned away before any of that?

Take a queue whose stop timed out in mtk_cldma_err_tx_one(). It keeps
is_stopping set and tx_started true. Later, a stop timeout in another
queue's mtk_cldma_txq_free() or mtk_cldma_rxq_free() resets the
instance. mtk_cldma_rearm_queues() then skips this queue on purpose and
leaves its start address at 0. The next mtk_cldma_tx() on it goes:

mtk_cldma_tx()
  mtk_cldma_start_xfer()
    mtk_cldma_get_tx_start_addr()  <- reads 0
    mtk_cldma_hw_recovery()
      mtk_cldma_rearm_queues()     <- instance re-armed again
    returns -EIO                   <- tx_started is still true
  mtk_cldma_stop_queue()
  mtk_cldma_txq_flush(..., -EIO)

A U64_MAX read on a dead link takes the same early -EIO exit. The same
thing can also happen while mtk_cldma_err_tx_one() is still polling its
stop, if the device lost its queue state along with the error.

The error is -EIO, not -EPIPE, so the new -EPIPE check in
mtk_cldma_tx() does not catch it. mtk_cldma_tx() then stops the queue,
clears tx_started and flushes the ring itself. Meanwhile
mtk_cldma_err_tx_one() is either doing the same thing or has decided
to keep those requests. The flushed TRBs complete with -EIO, not the
-EPIPE that recovery promises. Nothing clears is_stopping afterwards,
so the queue keeps refusing new submissions.

There is also a gap in the other direction. If the stop inside
mtk_cldma_tx() times out, it keeps the requests just as
mtk_cldma_err_tx_one() does, but it never sets is_stopping. So
mtk_cldma_submit_tx() keeps publishing HWO descriptors into a ring the
device may still be walking. That is exactly what is_stopping was
added to prevent.

Would it work to test is_stopping under ring_lock before the start
address read and the recovery? The stop-timeout path in mtk_cldma_tx()
could then set is_stopping the same way err_work does.

[Severity: Low]
What clears is_stopping after this return? The only place that clears it
is the end of a later mtk_cldma_err_tx_one() pass whose stop succeeds, and
that pass needs a new QUEUE_ERROR.

Another queue's stop can later time out in mtk_cldma_txq_free() or
mtk_cldma_rxq_free(). The instance is then reset with
mtk_cldma_drv_reset(), so the engine is idle. But mtk_cldma_rearm_queues()
skips this queue:

    if (txq->is_stopping) {
        /* Being stopped: restarting it would let the
         * device walk buffers the stopper is unmapping.
         */
    } else if (...

It programs no start address and issues no START. It does not flush the
kept requests, and it does not clear the flag. QUEUE_ERROR is unmasked,
but a reset queue that is not started will not raise one, so err_work
never runs for it again.

After that, mtk_cldma_submit_tx() keeps returning -EPIPE. The kept TRBs
stay incomplete until the channel is closed via mtk_cldma_txq_free(),
even though the reset made it safe to flush them. Is that intended? The
comment's "until an instance re-arm" suggests the re-arm should recover
this queue.

> +
> +	spin_lock(&txq->ring_lock);
> +	WRITE_ONCE(txq->tx_started, false);
> +	spin_unlock(&txq->ring_lock);
> +	mtk_cldma_txq_flush(drv_info, txq, -EPIPE);
> +
> +	spin_lock(&txq->ring_lock);
> +	txq->is_stopping = false;
> +	spin_unlock(&txq->ring_lock);

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261105-t9xx_driver_v1-v11-0-2084aa512864%40compal.com

