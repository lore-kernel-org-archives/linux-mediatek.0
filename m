Return-Path: <SRS0=Knfd=4Q=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0196C3F2D3
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Feb 2020 15:57:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A4BCF246AC
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Feb 2020 15:57:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XQpMmoLs";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="OwHHlDmh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A4BCF246AC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yOodKDDVVl7K6GoBg0sA/8EDl9LbaF+XdXTMhG5GnYw=; b=XQpMmoLsYMVsTf
	Nl5iH3JuG6sQV6HlrrLzudQbDLZQWjEChsxNGbZ6c9H+ZUrpUVKgcqQUTcxZ8popz8Ki9qdhlqlh8
	/cysBuMLWTqJS/yGFTnDsZpw9KTmCs65Sy4tqyYVeGCRX7shpnJZLyfmeOOG7/uVuEikRxTzlhIjw
	py/gnC63mYRcPPpbvQWr1N+SOSDT/3c3qRcaXe9NnWGZM1vEcJPGJ3jguPLgTgUTH+NAzU82ZFCal
	fqOLIk/8u5u13i40/ovWdlc4JynmmkJWLLCOltO5J7JSn5ir4spWerPRO81YNnX6w2U4DzMkF5WsO
	BJjH5MrbGFRS/uHgfaHA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j7i0p-0005Pl-OQ; Fri, 28 Feb 2020 15:57:15 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j7i0m-0005Or-QM; Fri, 28 Feb 2020 15:57:14 +0000
X-UUID: 29780ac4fcd643b0bc2dda702ca6e856-20200228
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=7cG0Tkp+Ug5bunGNSSGHb42Z5Rk9tRubfSu6RGs66GY=; 
 b=OwHHlDmhfp612gROA0Cngk7oPDYTfdjAZG5Phzu0ZD31CMHm/nXypJhTlatcOv4OkmvvJ6YcSDqMVy+kq13rlPaB5XlbFh/NXyB1kwV2AJup6X9C8ZQhHpCOSwF4gZdQVqLub0X/Cg6AfGM+MzCTonDI/4y8uq8ntAfk6WClLbM=;
X-UUID: 29780ac4fcd643b0bc2dda702ca6e856-20200228
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1740438210; Fri, 28 Feb 2020 07:57:06 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 28 Feb 2020 07:57:47 -0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 28 Feb 2020 23:56:12 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Fri, 28 Feb 2020 23:57:00 +0800
Message-ID: <1582905422.14824.22.camel@mtksdaap41>
Subject: Re: [PATCH v3 04/13] mailbox: mediatek: cmdq: clear task in channel
 before shutdown
From: CK Hu <ck.hu@mediatek.com>
To: Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>
Date: Fri, 28 Feb 2020 23:57:02 +0800
In-Reply-To: <1582897461-15105-6-git-send-email-dennis-yc.hsieh@mediatek.com>
References: <1582897461-15105-1-git-send-email-dennis-yc.hsieh@mediatek.com>
 <1582897461-15105-6-git-send-email-dennis-yc.hsieh@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200228_075712_865566_88491A95 
X-CRM114-Status: GOOD (  14.62  )
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
Cc: devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 wsd_upstream@mediatek.com, Jassi Brar <jassisinghbrar@gmail.com>,
 linux-kernel@vger.kernel.org, Houlong Wei <houlong.wei@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Bibby Hsieh <bibby.hsieh@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Ming-Fan Chen <ming-fan.chen@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi, Dennis:

On Fri, 2020-02-28 at 21:44 +0800, Dennis YC Hsieh wrote:
> Do success callback in channel when shutdown. For those task not finish,
> callback with error code thus client has chance to cleanup or reset.
> 
> Signed-off-by: Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>
> ---
>  drivers/mailbox/mtk-cmdq-mailbox.c | 38 ++++++++++++++++++++++++++++++
>  1 file changed, 38 insertions(+)
> 
> diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmdq-mailbox.c
> index 7246b7e21a2e..50dec015593f 100644
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
> +		cmdq_task_exec_done(task, -ECONNABORTED);

cmdq_task_exec_done(task, CMDQ_CB_ERROR) ? However, I've like to use the
standard error as you write here.

Regards,
CK

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
