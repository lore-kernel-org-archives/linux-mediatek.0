Return-Path: <SRS0=MFJx=4X=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFD83C3F2CE
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Mar 2020 04:06:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B56E92072D
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Mar 2020 04:06:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qIwuzzYz";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="uKiWET/2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B56E92072D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XLNUGeLkaPtoddid8qpGW8pSsvG5KP63TRkpvE7ng4k=; b=qIwuzzYz256vAr
	7vFiVMQcvvfx5svT0t3lwN/WeI+2RdIX2SzgaRbSadcDjTdHggpVXFl8CyEGT1yxOeHdYPZWJdwl4
	6V4+V2FvEnSWMtZ4fVCVyGbEYAadcy9XN7Hww5arB6noc6ToKwfjIEXGdaXmdM5gLbjA1Gx6odNC0
	2nkPPOzv1Kj1gs0+KEj2pNizzLatSL9w4oT4j8S1TSGVV4Ze1quxIc+9whWywoKZ4p1XiwqdVtaSm
	JOrESkae/LpskCtPnQ9SFyyn8Lgg+PRx6XnjHCdjlYY5kPwZt9L/6XMwVpYrHsL2/X1CO0AJFCHOy
	ahFpZyVFwvFbASEa9H6g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jA4FX-0002oK-Ds; Fri, 06 Mar 2020 04:06:11 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jA4FP-0002hL-TI; Fri, 06 Mar 2020 04:06:05 +0000
X-UUID: 4ce4a1f2e74b4cc78829d8dc4fd9f5c2-20200305
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=HbvwGK3+J6EJNiSbZ0JadzfJDjJt686R95a2GVph8QM=; 
 b=uKiWET/2SI6kAvqgTgBgJYEOJiUReLrEKizAui8f3GOicKogIF0o1o2PUjf6eOnvdZXY28nTNXU7Uw567Ggn7RqWCpcxujzqvqxfQ5D+kQUB/JDXZ1G31fpfbK2FiVD6HX1d0q/RqzMaUg2bxrSJPJvO+Oyca96wO0lLbKTaRsQ=;
X-UUID: 4ce4a1f2e74b4cc78829d8dc4fd9f5c2-20200305
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <bibby.hsieh@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1479581992; Thu, 05 Mar 2020 20:05:58 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 5 Mar 2020 19:55:55 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 6 Mar 2020 11:54:29 +0800
Received: from [172.21.77.4] (172.21.77.4) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Fri, 6 Mar 2020 11:53:06 +0800
Message-ID: <1583466941.18586.1.camel@mtksdaap41>
Subject: Re: [PATCH v1 2/3] mailbox: mediatek: implement flush function
From: Bibby Hsieh <bibby.hsieh@mediatek.com>
To: Jassi Brar <jassisinghbrar@gmail.com>
Date: Fri, 6 Mar 2020 11:55:41 +0800
In-Reply-To: <1581931765.12547.0.camel@mtksdaap41>
References: <20200217090532.16019-1-bibby.hsieh@mediatek.com>
 <20200217090532.16019-3-bibby.hsieh@mediatek.com>
 <1581931765.12547.0.camel@mtksdaap41>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 269D5AFE256631CE763A7BA8ECC2A47A2B9957979F165F20397039FB87C414FF2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200305_200603_956019_77F2A19D 
X-CRM114-Status: GOOD (  16.27  )
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
Cc: devicetree@vger.kernel.org, Nicolas
 Boichat <drinkcat@chromium.org>, srv_heupstream@mediatek.com,
 linux-kernel@vger.kernel.org, Houlong Wei <houlong.wei@mediatek.com>,
 Dennis-YC Hsieh <dennis-yc.hsieh@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, CK Hu <ck.hu@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi, Jassi,

https://patchwork.kernel.org/cover/11385839/

I push a series of patches about remove atomic_exec feature in Mediatek
CMDQ driver. Could you please review them if you are free?

Thanks

On Mon, 2020-02-17 at 17:29 +0800, CK Hu wrote:
> Hi, Bibby:
> 
> On Mon, 2020-02-17 at 17:05 +0800, Bibby Hsieh wrote:
> > For client driver which need to reorganize the command buffer, it could
> > use this function to flush the send command buffer.
> > If the channel doesn't be started (usually in waiting for event), this
> > function will abort it directly.
> > 
> 
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> 
> > Signed-off-by: Bibby Hsieh <bibby.hsieh@mediatek.com>
> > ---
> >  drivers/mailbox/mtk-cmdq-mailbox.c | 52 ++++++++++++++++++++++++++++++
> >  1 file changed, 52 insertions(+)
> > 
> > diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmdq-mailbox.c
> > index 9a6ce9f5a7db..0da5e2dc2c0e 100644
> > --- a/drivers/mailbox/mtk-cmdq-mailbox.c
> > +++ b/drivers/mailbox/mtk-cmdq-mailbox.c
> > @@ -432,10 +432,62 @@ static void cmdq_mbox_shutdown(struct mbox_chan *chan)
> >  {
> >  }
> >  
> > +static int cmdq_mbox_flush(struct mbox_chan *chan, unsigned long timeout)
> > +{
> > +	struct cmdq_thread *thread = (struct cmdq_thread *)chan->con_priv;
> > +	struct cmdq_task_cb *cb;
> > +	struct cmdq_cb_data data;
> > +	struct cmdq *cmdq = dev_get_drvdata(chan->mbox->dev);
> > +	struct cmdq_task *task, *tmp;
> > +	unsigned long flags;
> > +	u32 enable;
> > +
> > +	spin_lock_irqsave(&thread->chan->lock, flags);
> > +	if (list_empty(&thread->task_busy_list))
> > +		goto out;
> > +
> > +	WARN_ON(cmdq_thread_suspend(cmdq, thread) < 0);
> > +	if (!cmdq_thread_is_in_wfe(thread))
> > +		goto wait;
> > +
> > +	list_for_each_entry_safe(task, tmp, &thread->task_busy_list,
> > +				 list_entry) {
> > +		cb = &task->pkt->async_cb;
> > +		if (cb->cb) {
> > +			data.sta = CMDQ_CB_ERROR;
> > +			data.data = cb->data;
> > +			cb->cb(data);
> > +		}
> > +		list_del(&task->list_entry);
> > +		kfree(task);
> > +	}
> > +
> > +	cmdq_thread_resume(thread);
> > +	cmdq_thread_disable(cmdq, thread);
> > +	clk_disable(cmdq->clock);
> > +
> > +out:
> > +	spin_unlock_irqrestore(&thread->chan->lock, flags);
> > +	return 0;
> > +
> > +wait:
> > +	cmdq_thread_resume(thread);
> > +	spin_unlock_irqrestore(&thread->chan->lock, flags);
> > +	if (readl_poll_timeout_atomic(thread->base + CMDQ_THR_ENABLE_TASK,
> > +				      enable, enable == 0, 1, timeout)) {
> > +		dev_err(cmdq->mbox.dev, "Fail to wait GCE thread 0x%x done\n",
> > +			(u32)(thread->base - cmdq->base));
> > +
> > +		return -EFAULT;
> > +	}
> > +	return 0;
> > +}
> > +
> >  static const struct mbox_chan_ops cmdq_mbox_chan_ops = {
> >  	.send_data = cmdq_mbox_send_data,
> >  	.startup = cmdq_mbox_startup,
> >  	.shutdown = cmdq_mbox_shutdown,
> > +	.flush = cmdq_mbox_flush,
> >  };
> >  
> >  static struct mbox_chan *cmdq_xlate(struct mbox_controller *mbox,
> 
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
