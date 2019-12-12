Return-Path: <SRS0=NAie=2C=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38B84C43603
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Dec 2019 01:13:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0A632214D8
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Dec 2019 01:13:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jjK1iky9";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="mOf6cG7l"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0A632214D8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cawOalBom/Lxpi6MPXy4Plwb8l9Jv9USMS0fpndzUMw=; b=jjK1iky9hcubl5
	j3jGAD+GNqzUMOoO7sPO4kmHxgJz1SQDyK2nWr1quhG9rfI3ltEvB9uyrUE9TYk/PYx7UmgMq7Bz3
	qZ5PDcJuMvkb58xCcIwlV0glDpHkDBvoOe/fSD31V7eFOEe4MZFsIeTam8nmxMqkfT3URLb6UW96U
	MS9GCxGahzmWCindDQ+kpgr+etFzu7kQ1eFgQ0Wzfl1fjVxVDkyxSMvzKhkiCBpLxsvWbawKuON91
	ihgscmcymqb7QGHZxv/1ss3XK+O2kb5yKGF5IlHvyGTlrq0baSfTSPEwRJj01fpaw+ZqiHzcPNgVp
	PNU82c52kztjCDT4GEkA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ifD3D-0007wO-Gt; Thu, 12 Dec 2019 01:13:55 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ifD34-0007ol-EE; Thu, 12 Dec 2019 01:13:47 +0000
X-UUID: 3c0a0a44c1cb46a69693d15db08773e7-20191211
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=B4MILXq3ZMERWeqsdACp65BTdrLNU+AFrjMI+Ui8c0s=; 
 b=mOf6cG7lzAyHQaWJzLGQ1IwDcHX1n70k9sM+f/NzOge0xvRurzaA9nhOr+Q3LWMBQZV6cBqcyeGFUqpZAaxYRCIZ+e22jFTDCnOGhUn2hotuR3c6i3j+mwVgoqFTo2XaVR2WSk689d3oDghkpwNoo1/ZKSS9qZffPaOGTJ4GD1o=;
X-UUID: 3c0a0a44c1cb46a69693d15db08773e7-20191211
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <dennis-yc.hsieh@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 540718661; Wed, 11 Dec 2019 17:13:44 -0800
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 11 Dec 2019 17:14:49 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 12 Dec 2019 09:13:18 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 12 Dec 2019 09:13:37 +0800
Message-ID: <1576113221.17653.6.camel@mtkswgap22>
Subject: Re: [PATCH v2 04/14] mailbox: mediatek: cmdq: clear task in channel
 before shutdown
From: Dennis-YC Hsieh <dennis-yc.hsieh@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>
Date: Thu, 12 Dec 2019 09:13:41 +0800
In-Reply-To: <1575946181.16676.4.camel@mtksdaap41>
References: <1574819937-6246-1-git-send-email-dennis-yc.hsieh@mediatek.com>
 <1574819937-6246-6-git-send-email-dennis-yc.hsieh@mediatek.com>
 <1575946181.16676.4.camel@mtksdaap41>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191211_171346_487816_3FED4477 
X-CRM114-Status: GOOD (  13.69  )
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
Cc: devicetree@vger.kernel.org, wsd_upstream@mediatek.com,
 Jassi Brar <jassisinghbrar@gmail.com>, linux-kernel@vger.kernel.org,
 Houlong Wei <houlong.wei@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Bibby Hsieh <bibby.hsieh@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi CK,

On Tue, 2019-12-10 at 10:49 +0800, CK Hu wrote:
> Hi, Dennis:
> 
> On Wed, 2019-11-27 at 09:58 +0800, Dennis YC Hsieh wrote:
> > Do success callback in channel when shutdown. For those task not finish,
> > callback with error code thus client has chance to cleanup or reset.
> > 
> > Signed-off-by: Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>
> > ---
> >  drivers/mailbox/mtk-cmdq-mailbox.c | 26 ++++++++++++++++++++++++++
> >  1 file changed, 26 insertions(+)
> > 
> > diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmdq-mailbox.c
> > index fd519b6f518b..c12a768d1175 100644
> > --- a/drivers/mailbox/mtk-cmdq-mailbox.c
> > +++ b/drivers/mailbox/mtk-cmdq-mailbox.c
> > @@ -450,6 +450,32 @@ static int cmdq_mbox_startup(struct mbox_chan *chan)
> >  
> >  static void cmdq_mbox_shutdown(struct mbox_chan *chan)
> >  {
> > +	struct cmdq_thread *thread = (struct cmdq_thread *)chan->con_priv;
> > +	struct cmdq *cmdq = dev_get_drvdata(chan->mbox->dev);
> > +	struct cmdq_task *task, *tmp;
> > +	unsigned long flags;
> > +
> > +	spin_lock_irqsave(&thread->chan->lock, flags);
> > +	if (list_empty(&thread->task_busy_list))
> > +		goto done;
> > +
> > +	WARN_ON(cmdq_thread_suspend(cmdq, thread) < 0);
> > +
> > +	/* make sure executed tasks have success callback */
> > +	cmdq_thread_irq_handler(cmdq, thread);
> > +	if (list_empty(&thread->task_busy_list))
> > +		goto done;
> > +
> > +	list_for_each_entry_safe(task, tmp, &thread->task_busy_list,
> > +				 list_entry) {
> > +		cmdq_task_exec_done(task, -ECONNABORTED);
> > +		kfree(task);
> > +	}
> > +
> > +	cmdq_thread_disable(cmdq, thread);
> > +	clk_disable(cmdq->clock);
> > +done:
> 
> cmdq_thread_resume(thread);
> 
> Regards,
> CK
> 

Call resume here will cause violation. The thread->task_busy_list empty
means no task work in gce and thread state should already disable
without clock, which is what we want since client try to shut down this
mbox channel. So I think we don't need resume here.


Regards,
Dennis

> > +	spin_unlock_irqrestore(&thread->chan->lock, flags);
> >  }
> >  
> >  static const struct mbox_chan_ops cmdq_mbox_chan_ops = {
> 
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
