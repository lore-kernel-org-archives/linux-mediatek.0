Return-Path: <SRS0=sDSL=4F=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52B5AC7619F
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Feb 2020 09:33:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 254A920726
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Feb 2020 09:33:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="o6Q267fj";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="RDCvw7tH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 254A920726
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8esusLANwZvHFxhn4QBkZ3Fwx0hcID+EuYs/LAkNR4o=; b=o6Q267fjBur8/M
	AGwSTlcZuZ4vNYE59V2sAoW1uoqp31OZFW0gngJxxLX8SO8UnxQl7nLgElT9Lo2OwwgTNT1Rw+n+k
	QomdkSmrdiGRshMB/ZDoh9ldFMAGQ6zdqjB/JJPGZOTRORIGXuERIy290BaEnezf0mnlcPz4rw46u
	dASZc9suYvVeAeE6gwaJMlwzAglxdofA5xyWj03z+E8YxRZp3nrX/wPz6qmVIbRtkK5rSYs9U9qqM
	PnEVuKwWkEJ/q+8x/rHV4L2yPwXfH5UU5W/fVeRPq3+QCeDladQ1bnRsUFrXfaTDylcVnY2uxf/gs
	0v0MrnwFo7npI3wJhVJg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j3clo-0003Cc-Ct; Mon, 17 Feb 2020 09:32:52 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j3cif-0006wR-Tq; Mon, 17 Feb 2020 09:29:39 +0000
X-UUID: 468e4642296e46f28bfccc384afe54ad-20200217
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=+AZRRBU+eXyDNfzUrhQQGTkVM4JM0kpcUBh6dZge9tA=; 
 b=RDCvw7tHLfWuqmOGS911L2SXvA9CN9I/QCntQmRrc4VGTjml9DqeQNDiCsMEJAgxO6Vvx9S5J2s8E+8K9iyuOX1LGmyMMP2AiYWwwYl6TeCK8S8zaroegAj8Kw9dj98NG2G/V3WVJ1EIxW9QOrigMu7cTCRUinOPcnsCF7Bter0=;
X-UUID: 468e4642296e46f28bfccc384afe54ad-20200217
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1712034361; Mon, 17 Feb 2020 01:29:34 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 17 Feb 2020 01:29:52 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 17 Feb 2020 17:28:46 +0800
Received: from [172.21.77.4] (172.21.77.4) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Mon, 17 Feb 2020 17:27:27 +0800
Message-ID: <1581931765.12547.0.camel@mtksdaap41>
Subject: Re: [PATCH v1 2/3] mailbox: mediatek: implement flush function
From: CK Hu <ck.hu@mediatek.com>
To: Bibby Hsieh <bibby.hsieh@mediatek.com>
Date: Mon, 17 Feb 2020 17:29:25 +0800
In-Reply-To: <20200217090532.16019-3-bibby.hsieh@mediatek.com>
References: <20200217090532.16019-1-bibby.hsieh@mediatek.com>
 <20200217090532.16019-3-bibby.hsieh@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200217_012937_986872_EFFEB178 
X-CRM114-Status: GOOD (  15.22  )
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
Cc: devicetree@vger.kernel.org, Nicolas Boichat <drinkcat@chromium.org>,
 srv_heupstream@mediatek.com, Jassi Brar <jassisinghbrar@gmail.com>,
 linux-kernel@vger.kernel.org, Houlong Wei <houlong.wei@mediatek.com>,
 Dennis-YC Hsieh <dennis-yc.hsieh@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi, Bibby:

On Mon, 2020-02-17 at 17:05 +0800, Bibby Hsieh wrote:
> For client driver which need to reorganize the command buffer, it could
> use this function to flush the send command buffer.
> If the channel doesn't be started (usually in waiting for event), this
> function will abort it directly.
> 

Reviewed-by: CK Hu <ck.hu@mediatek.com>

> Signed-off-by: Bibby Hsieh <bibby.hsieh@mediatek.com>
> ---
>  drivers/mailbox/mtk-cmdq-mailbox.c | 52 ++++++++++++++++++++++++++++++
>  1 file changed, 52 insertions(+)
> 
> diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmdq-mailbox.c
> index 9a6ce9f5a7db..0da5e2dc2c0e 100644
> --- a/drivers/mailbox/mtk-cmdq-mailbox.c
> +++ b/drivers/mailbox/mtk-cmdq-mailbox.c
> @@ -432,10 +432,62 @@ static void cmdq_mbox_shutdown(struct mbox_chan *chan)
>  {
>  }
>  
> +static int cmdq_mbox_flush(struct mbox_chan *chan, unsigned long timeout)
> +{
> +	struct cmdq_thread *thread = (struct cmdq_thread *)chan->con_priv;
> +	struct cmdq_task_cb *cb;
> +	struct cmdq_cb_data data;
> +	struct cmdq *cmdq = dev_get_drvdata(chan->mbox->dev);
> +	struct cmdq_task *task, *tmp;
> +	unsigned long flags;
> +	u32 enable;
> +
> +	spin_lock_irqsave(&thread->chan->lock, flags);
> +	if (list_empty(&thread->task_busy_list))
> +		goto out;
> +
> +	WARN_ON(cmdq_thread_suspend(cmdq, thread) < 0);
> +	if (!cmdq_thread_is_in_wfe(thread))
> +		goto wait;
> +
> +	list_for_each_entry_safe(task, tmp, &thread->task_busy_list,
> +				 list_entry) {
> +		cb = &task->pkt->async_cb;
> +		if (cb->cb) {
> +			data.sta = CMDQ_CB_ERROR;
> +			data.data = cb->data;
> +			cb->cb(data);
> +		}
> +		list_del(&task->list_entry);
> +		kfree(task);
> +	}
> +
> +	cmdq_thread_resume(thread);
> +	cmdq_thread_disable(cmdq, thread);
> +	clk_disable(cmdq->clock);
> +
> +out:
> +	spin_unlock_irqrestore(&thread->chan->lock, flags);
> +	return 0;
> +
> +wait:
> +	cmdq_thread_resume(thread);
> +	spin_unlock_irqrestore(&thread->chan->lock, flags);
> +	if (readl_poll_timeout_atomic(thread->base + CMDQ_THR_ENABLE_TASK,
> +				      enable, enable == 0, 1, timeout)) {
> +		dev_err(cmdq->mbox.dev, "Fail to wait GCE thread 0x%x done\n",
> +			(u32)(thread->base - cmdq->base));
> +
> +		return -EFAULT;
> +	}
> +	return 0;
> +}
> +
>  static const struct mbox_chan_ops cmdq_mbox_chan_ops = {
>  	.send_data = cmdq_mbox_send_data,
>  	.startup = cmdq_mbox_startup,
>  	.shutdown = cmdq_mbox_shutdown,
> +	.flush = cmdq_mbox_flush,
>  };
>  
>  static struct mbox_chan *cmdq_xlate(struct mbox_controller *mbox,

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
