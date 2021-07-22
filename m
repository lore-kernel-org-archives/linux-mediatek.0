Return-Path: <SRS0=Khw4=MO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 336DBC6377D
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Jul 2021 10:16:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DB01061264
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Jul 2021 10:16:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DB01061264
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qFlz6dz4/qd0rNkLVw6N8MEJ+pXyqmtGrYux8CuVt1g=; b=2wR8RV5brfTral
	b21SCYIL1TtBLuVOfag5gJjV6POb3DkYj+piLoYdSZn3mLHlPat9z3VFvcpJplQLYL8mByVtaruVA
	iczXrT5l081YDHwTr5KQ1yYItvq+xe4UTfuB5mluzTH7OlyOcbq11nXsiPxe/tLqYeMW0bmfSzfdU
	ZPvKi+TF3QAOgU07PTM7lQs1oMHvCflhZqkAPA349ZSqCJs0QWoB+x25oX1iykcvqH7w2YBruRqrn
	RrFHh2FRJ+pbmHOTqNUdDp+YUQ4S2xeV5+N+DCa2r+G626/wllp/zC9wAgg+T28eE479lkLmS9VUb
	leJCStfXUlhfFaDaK1IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m6VkW-001AlE-HU; Thu, 22 Jul 2021 10:16:16 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6Vgw-0019Sb-Nx; Thu, 22 Jul 2021 10:12:36 +0000
X-UUID: 34c958c527614db99cec79e293216d52-20210722
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=l6KbJziSHG3anQMOz7NsvNX052w7IZh/nwF6Sf4i7VM=; 
 b=G1Zlg0d2m1uTvVu1DNIraR/opbUCugjO9pZBl68TDxb/xYzMn/VCBVLMbxgA3IJIku6nevQFhsHbP1Du+dq/aZaVkZVSuR+SKSM3USSmcaO9XNuIEOcjjoXxR9ETQdBU4G0He5tUELcXllxSZjolNAjLKRAfG7CLL9RtJSd+2bw=;
X-UUID: 34c958c527614db99cec79e293216d52-20210722
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <zhiyong.tao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2034209817; Thu, 22 Jul 2021 03:12:31 -0700
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 22 Jul 2021 03:03:42 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 22 Jul 2021 18:03:33 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 22 Jul 2021 18:03:32 +0800
Message-ID: <1626948212.29611.47.camel@mhfsdcap03>
Subject: Re: [PATCH] uart: mediatek: fix memory corruption issue
From: zhiyong tao <zhiyong.tao@mediatek.com>
To: Greg KH <gregkh@linuxfoundation.org>
CC: <timur@kernel.org>, <linux@armlinux.org.uk>, <alcooperx@gmail.com>,
 <tklauser@distanz.ch>, <sean.wang@kernel.org>, <srv_heupstream@mediatek.com>, 
 <hui.liu@mediatek.com>, <zhiyong.tao@mediatek.com>,
 <yuchen.huang@mediatek.com>, <huihui.wang@mediatek.com>,
 <eddie.huang@mediatek.com>, <sean.wang@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-serial@vger.kernel.org>
Date: Thu, 22 Jul 2021 18:03:32 +0800
In-Reply-To: <YPf67gw2KJCk/Ucs@kroah.com>
References: <20210710090103.2643-1-zhiyong.tao@mediatek.com>
 <20210710090103.2643-2-zhiyong.tao@mediatek.com>
 <YPf67gw2KJCk/Ucs@kroah.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 5812E3E14726AC00B2603BE441B9A33120E85081E654CF0F84FBEE315A7F59C12000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210722_031234_878959_98D09F0D 
X-CRM114-Status: GOOD (  30.12  )
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

On Wed, 2021-07-21 at 12:46 +0200, Greg KH wrote:
> On Sat, Jul 10, 2021 at 05:01:03PM +0800, Zhiyong Tao wrote:
> > This patch is used to fix memory corruption issue when rx power off.
> > 1. add spin lock in mtk8250_dma_rx_complete function in APDMA mode.
> 
> What does a lock protect from?  Please be explicit and detailed.

==> Hi Gregkh,

when uart is used as a communication port with external device(GPS).
when external device(GPS) power off, the power of rx pin is also from
1.8v to 0v. Even if there is not any data in rx. But uart rx pin can
capture the data "0".
If uart don't receive any data in specified cycle, uart will generates
BI(Break interrupt) interrupt.
If external device(GPS) power off, we found that BI interrupt appeared
continuously and very frequently.
When uart interrupt type is BI, uart IRQ handler(8250 framwork
API:serial8250_handle_irq) will push data to tty buffer.
The code path:
https://elixir.bootlin.com/linux/latest/source/drivers/tty/serial/8250/8250_port.c#L1917

mtk8250_dma_rx_complete is a task of mtk_uart_apdma_rx_handler.
mtk8250_dma_rx_complete priority is lower than uart irq
handler(serial8250_handle_irq).
if we are in process of mtk8250_dma_rx_complete, uart appear BI
interrupt:1)serial8250_handle_irq will priority execution.2)it may cause
write tty buffer conflict in mtk8250_dma_rx_complete.
So the spin lock protect the rx receive data process is not break.
> 
> > 2. add processing mechanism which count value is 0
> 
> What does this do?  And why is it needed?

==> when count value is 0, we don't need push data to tty buffer.
so we add it.
> 
> > 
> > Signed-off-by: Zhiyong Tao <zhiyong.tao@mediatek.com>
> 
> What commit does this fix?  Does this need to go to stable kernel trees?
> If so, how far back?
> 
> > ---
> >  drivers/tty/serial/8250/8250_mtk.c | 15 +++++++++++----
> >  1 file changed, 11 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/tty/serial/8250/8250_mtk.c b/drivers/tty/serial/8250/8250_mtk.c
> > index f7d3023f860f..09f7d2166315 100644
> > --- a/drivers/tty/serial/8250/8250_mtk.c
> > +++ b/drivers/tty/serial/8250/8250_mtk.c
> > @@ -91,12 +91,15 @@ static void mtk8250_dma_rx_complete(void *param)
> >  	struct mtk8250_data *data = up->port.private_data;
> >  	struct tty_port *tty_port = &up->port.state->port;
> >  	struct dma_tx_state state;
> > -	int copied, total, cnt;
> > +	unsigned int copied, total, cnt;
> >  	unsigned char *ptr;
> > +	unsigned long flags;
> >  
> >  	if (data->rx_status == DMA_RX_SHUTDOWN)
> >  		return;
> >  
> > +	spin_lock_irqsave(&up->port.lock, flags);
> > +
> >  	dmaengine_tx_status(dma->rxchan, dma->rx_cookie, &state);
> >  	total = dma->rx_size - state.residue;
> >  	cnt = total;
> > @@ -104,9 +107,11 @@ static void mtk8250_dma_rx_complete(void *param)
> >  	if ((data->rx_pos + cnt) > dma->rx_size)
> >  		cnt = dma->rx_size - data->rx_pos;
> >  
> > -	ptr = (unsigned char *)(data->rx_pos + dma->rx_buf);
> > -	copied = tty_insert_flip_string(tty_port, ptr, cnt);
> > -	data->rx_pos += cnt;
> > +	if (cnt != 0) {
> 
> Why does cnt matter here?  If cnt is 0, the code above should not do
> anything at all, right?

==> yes, if the counter value is 0, we don't need push data to the tty
buffer.
> 
> Or if it does, should we change tty_insert_flip_string() to always check
> for cnt != 0 before it does the first loop?  Hm, it looks like it will
> abort if cnt is 0, so what is this change really doing?  Why do you need
> it?  What is it "fixing"?
> 
==> It is not fix anything, we just think if count value is 0, we don't
need do anything.

Thanks.

> thanks,
> 
> greg k-h

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
