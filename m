Return-Path: <SRS0=cHEQ=4V=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22677C3F2D1
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Mar 2020 02:47:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EDA402073D
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Mar 2020 02:47:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RQpT/HaU";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="kUv+Q1W6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EDA402073D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YnzAYSGDQ+ktuKitgtmyKwuE3O4DKt630Op9NAW78iI=; b=RQpT/HaUYllrdw
	uE38D0BvjZJ9DXQRR4kpJJHvAhHOqu6JSq8LKi3nrnhzzP6/pQTijSzrGiAQylZyIw3Y1mDvIQpKN
	PjBOtE0+pPSv04IMdd44TvPV7wl3AcabBDmBKjAzBGRFneBhlu/cg5tkkzJR6ZZrr7TgbHfHkNK93
	0Q+Ud0qu8FxtO3BoYXXyWYGJAdaDyuff+Z68KE6jrZ8NY3ZtSo9TDqH2/SH02sprXbPMgT/iSZnqQ
	Utg/AE6CJjDJmPOmz583biGReHCC0n04XGcNPxOJCR6C7Oir78RyodrfP9cJpi/9O4NL69UvBrutO
	n9RPOp846YXdIExdu8AQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j9K3v-0000Xr-Tu; Wed, 04 Mar 2020 02:47:07 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j9K3c-0008Ut-2S; Wed, 04 Mar 2020 02:46:49 +0000
X-UUID: 61504c32c92b466d8dd4c095977e48bf-20200303
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=N8uzmfi4oZf5SjaF1khnb5BTauSzbMkMnOjjAfK7Xwg=; 
 b=kUv+Q1W63A1dnmFWptEDLaQr7gyze9SehA222Fyqr7zllZKbNIHIf1F0EGqReLd6ka4+p/1Rgd3Kknmz+q33UEJoyThY6z4k9bHCjdynbyilnP58GhkJMgF49xLrDBYnlqIeIHnIbzsr+BM84pff+IG5qmD0tZrypsAxt+bV1OI=;
X-UUID: 61504c32c92b466d8dd4c095977e48bf-20200303
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 167182700; Tue, 03 Mar 2020 18:46:45 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 3 Mar 2020 18:36:42 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 4 Mar 2020 10:35:46 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 4 Mar 2020 10:36:01 +0800
Message-ID: <1583289401.32049.2.camel@mtksdaap41>
Subject: Re: [PATCH v4 04/13] mailbox: mediatek: cmdq: clear task in channel
 before shutdown
From: CK Hu <ck.hu@mediatek.com>
To: Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>
Date: Wed, 4 Mar 2020 10:36:41 +0800
In-Reply-To: <1583233125-7827-5-git-send-email-dennis-yc.hsieh@mediatek.com>
References: <1583233125-7827-1-git-send-email-dennis-yc.hsieh@mediatek.com>
 <1583233125-7827-5-git-send-email-dennis-yc.hsieh@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200303_184648_117099_CF1D0549 
X-CRM114-Status: GOOD (  15.60  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Daniel Vetter <daniel@ffwll.ch>, wsd_upstream@mediatek.com, David
 Airlie <airlied@linux.ie>, Jassi Brar <jassisinghbrar@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 HS Liao <hs.liao@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Houlong Wei <houlong.wei@mediatek.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Bibby Hsieh <bibby.hsieh@mediatek.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi, Dennis:

On Tue, 2020-03-03 at 18:58 +0800, Dennis YC Hsieh wrote:
> Do success callback in channel when shutdown. For those task not finish,
> callback with error code thus client has chance to cleanup or reset.
> 

Reviewed-by: CK Hu <ck.hu@mediatek.com>

> Signed-off-by: Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>
> ---
>  drivers/mailbox/mtk-cmdq-mailbox.c | 38 ++++++++++++++++++++++++++++++
>  1 file changed, 38 insertions(+)
> 
> diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmdq-mailbox.c
> index 9994ac9426d6..b56d340c8982 100644
> --- a/drivers/mailbox/mtk-cmdq-mailbox.c
> +++ b/drivers/mailbox/mtk-cmdq-mailbox.c
> @@ -387,6 +387,12 @@ static int cmdq_mbox_send_data(struct mbox_chan *chan, void *data)
>  
>  	if (list_empty(&thread->task_busy_list)) {
>  		WARN_ON(clk_enable(cmdq->clock) < 0);
> +		/*
> +		 * The thread reset will clear thread related register to 0,
> +		 * including pc, end, priority, irq, suspend and enable. Thus
> +		 * set CMDQ_THR_ENABLED to CMDQ_THR_ENABLE_TASK will enable
> +		 * thread and make it running.
> +		 */
>  		WARN_ON(cmdq_thread_reset(cmdq, thread) < 0);
>  
>  		writel(task->pa_base >> cmdq->shift_pa,
> @@ -450,6 +456,38 @@ static int cmdq_mbox_startup(struct mbox_chan *chan)
>  
>  static void cmdq_mbox_shutdown(struct mbox_chan *chan)
>  {
> +	struct cmdq_thread *thread = (struct cmdq_thread *)chan->con_priv;
> +	struct cmdq *cmdq = dev_get_drvdata(chan->mbox->dev);
> +	struct cmdq_task *task, *tmp;
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&thread->chan->lock, flags);
> +	if (list_empty(&thread->task_busy_list))
> +		goto done;
> +
> +	WARN_ON(cmdq_thread_suspend(cmdq, thread) < 0);
> +
> +	/* make sure executed tasks have success callback */
> +	cmdq_thread_irq_handler(cmdq, thread);
> +	if (list_empty(&thread->task_busy_list))
> +		goto done;
> +
> +	list_for_each_entry_safe(task, tmp, &thread->task_busy_list,
> +				 list_entry) {
> +		cmdq_task_exec_done(task, CMDQ_CB_ERROR);
> +		kfree(task);
> +	}
> +
> +	cmdq_thread_disable(cmdq, thread);
> +	clk_disable(cmdq->clock);
> +done:
> +	/*
> +	 * The thread->task_busy_list empty means thread already disable. The
> +	 * cmdq_mbox_send_data() always reset thread which clear disable and
> +	 * suspend statue when first pkt send to channel, so there is no need
> +	 * to do any operation here, only unlock and leave.
> +	 */
> +	spin_unlock_irqrestore(&thread->chan->lock, flags);
>  }
>  
>  static const struct mbox_chan_ops cmdq_mbox_chan_ops = {

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
