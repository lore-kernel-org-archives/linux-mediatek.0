Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93B44C43334
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Jun 2022 03:00:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/rE6bdtyP0roITuc2jLbj2TVgOvmmZ9kKlbmPM0lj7E=; b=NhfBWaqiULumAl
	rhx9sa2rQq6HjjnlwGRdSnrCnJfYWl5DKY2gpnfquoftY5ABDdgWWyf1pcE2ho11CtxYS7opKLH9q
	VnwfIYdWe2pQRUkjOIrJIlrHir5v+vSN8lkupoqhWHavX3+PYfEa1qQVN/YRvXjFlSroGdxCkQTzR
	3l3b3kPtIsZLCFHfrpy9dW/yskA10luVwwyZ9VOO3hrU7L/2RaIsbYTtcq6jxMvNlnRj6MJlisF/4
	V7ZyRVS8p40CiK7/n21j+S2Et5yTtzY4Uuz1v9o9H6Po5edUlWaQLWM9TkoLLYCYrzWGaa7QhBgwl
	ecFiFGEq71CmAwiYS7xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzUt5-005J9X-8s; Fri, 10 Jun 2022 03:00:39 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzUsu-005J7M-9q; Fri, 10 Jun 2022 03:00:30 +0000
X-UUID: 206184e9e76f4579b97cde203410c0f4-20220609
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5,REQID:3616befa-868e-4438-907b-5eee8c6cb167,OB:0,LO
	B:0,IP:0,URL:5,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:5
X-CID-META: VersionHash:2a19b09,CLOUDID:651955e5-2ba2-4dc1-b6c5-11feb6c769e0,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:0,BEC:nil
X-UUID: 206184e9e76f4579b97cde203410c0f4-20220609
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
	(envelope-from <moudy.ho@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 1416145275; Thu, 09 Jun 2022 19:59:53 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 9 Jun 2022 19:49:50 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Fri, 10 Jun 2022 10:49:49 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Fri, 10 Jun 2022 10:49:49 +0800
Message-ID: <55b84b36832b0da24c267d06a43b9db4ee345176.camel@mediatek.com>
Subject: Re: [PATCH] mailbox: mtk-cmdq: Remove proprietary cmdq_task_cb
From: moudy.ho <moudy.ho@mediatek.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Jassi Brar
	<jassisinghbrar@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>
Date: Fri, 10 Jun 2022 10:49:49 +0800
In-Reply-To: <20220608144055.27562-1-chunkuang.hu@kernel.org>
References: <20220608144055.27562-1-chunkuang.hu@kernel.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220609_200028_403129_1DBDACB9 
X-CRM114-Status: GOOD (  18.92  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 2022-06-08 at 22:40 +0800, Chun-Kuang Hu wrote:
> rx_callback is a standard mailbox callback mechanism and could cover
> the
> function of proprietary cmdq_task_cb, so use the standard one instead
> of
> the proprietary one. Client driver has changed to use standard
> rx_callback, so remove proprietary cmdq_task_cb.
> 
> Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>

Depends on: 

https://patchwork.kernel.org/project/linux-mediatek/patch/1650102868-26219-1-git-send-email-chunkuang.hu@kernel.org/

Tested-by: Moudy Ho <Moudy.Ho@mediatek.com>

> ---
>  drivers/mailbox/mtk-cmdq-mailbox.c       | 11 -----------
>  include/linux/mailbox/mtk-cmdq-mailbox.h | 10 ----------
>  2 files changed, 21 deletions(-)
> 
> diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c
> b/drivers/mailbox/mtk-cmdq-mailbox.c
> index 2578e5aaa935..9465f9081515 100644
> --- a/drivers/mailbox/mtk-cmdq-mailbox.c
> +++ b/drivers/mailbox/mtk-cmdq-mailbox.c
> @@ -192,15 +192,10 @@ static bool cmdq_thread_is_in_wfe(struct
> cmdq_thread *thread)
>  
>  static void cmdq_task_exec_done(struct cmdq_task *task, int sta)
>  {
> -	struct cmdq_task_cb *cb = &task->pkt->async_cb;
>  	struct cmdq_cb_data data;
>  
>  	data.sta = sta;
> -	data.data = cb->data;
>  	data.pkt = task->pkt;
> -	if (cb->cb)
> -		cb->cb(data);
> -
>  	mbox_chan_received_data(task->thread->chan, &data);
>  
>  	list_del(&task->list_entry);
> @@ -448,7 +443,6 @@ static void cmdq_mbox_shutdown(struct mbox_chan
> *chan)
>  static int cmdq_mbox_flush(struct mbox_chan *chan, unsigned long
> timeout)
>  {
>  	struct cmdq_thread *thread = (struct cmdq_thread *)chan-
> >con_priv;
> -	struct cmdq_task_cb *cb;
>  	struct cmdq_cb_data data;
>  	struct cmdq *cmdq = dev_get_drvdata(chan->mbox->dev);
>  	struct cmdq_task *task, *tmp;
> @@ -465,13 +459,8 @@ static int cmdq_mbox_flush(struct mbox_chan
> *chan, unsigned long timeout)
>  
>  	list_for_each_entry_safe(task, tmp, &thread->task_busy_list,
>  				 list_entry) {
> -		cb = &task->pkt->async_cb;
>  		data.sta = -ECONNABORTED;
> -		data.data = cb->data;
>  		data.pkt = task->pkt;
> -		if (cb->cb)
> -			cb->cb(data);
> -
>  		mbox_chan_received_data(task->thread->chan, &data);
>  		list_del(&task->list_entry);
>  		kfree(task);
> diff --git a/include/linux/mailbox/mtk-cmdq-mailbox.h
> b/include/linux/mailbox/mtk-cmdq-mailbox.h
> index 44365aab043c..a8f0070c7aa9 100644
> --- a/include/linux/mailbox/mtk-cmdq-mailbox.h
> +++ b/include/linux/mailbox/mtk-cmdq-mailbox.h
> @@ -67,24 +67,14 @@ enum cmdq_code {
>  
>  struct cmdq_cb_data {
>  	int			sta;
> -	void			*data;
>  	struct cmdq_pkt		*pkt;
>  };
>  
> -typedef void (*cmdq_async_flush_cb)(struct cmdq_cb_data data);
> -
> -struct cmdq_task_cb {
> -	cmdq_async_flush_cb	cb;
> -	void			*data;
> -};
> -
>  struct cmdq_pkt {
>  	void			*va_base;
>  	dma_addr_t		pa_base;
>  	size_t			cmd_buf_size; /* command occupied
> size */
>  	size_t			buf_size; /* real buffer size */
> -	struct cmdq_task_cb	cb;
> -	struct cmdq_task_cb	async_cb;
>  	void			*cl;
>  };
>  


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
