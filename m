Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C93AC001B0
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Jul 2023 09:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1mQpjvbXTqSZMh2oqXJLwIPvBh65UpQSNz+TWmuX7pg=; b=uzTnMzgU+x7R0mr9GDskLtoNBI
	49/RQAGWVNr4nk4vK3uze/fdPaBhQd37T9B2Lbz/3uyiLsqAf8yCqvwpFITaYu57vloeb9HBRo9Le
	jzIWaE4qzm45/o8pg0pSeBiVv+7DoGk9OiQPTVgXKorcXTW526dqxYeN4Ah/LJ+gpuX5/SsQtvDSL
	bBqpaWUqFuXwN7hkB1zx/TupEKh7yALy63OIehxq5gN5y+eRlhe7mC85m/HQe1HmgYYZFae87V6ey
	Iqp0AysupqhiHtfWOCXlzDsWNVfoMdAQY/G0x8xrcjYAMIcrcTAc2OxBkrnsZwdmMzqleYDHTAc67
	sI+InLSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJ9sq-00EKf8-28;
	Tue, 11 Jul 2023 09:42:12 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJ9sm-00EKaT-0v;
	Tue, 11 Jul 2023 09:42:10 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6C38D20008;
	Tue, 11 Jul 2023 09:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1689068517;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1mQpjvbXTqSZMh2oqXJLwIPvBh65UpQSNz+TWmuX7pg=;
	b=J0IPQRNMF4rW2vhHO+MYH6DbHjXzguu5d4CblnTphTAbz9ZHmZ8RKYVpLXShsypPVO7j6N
	LYIc1MsuzN/0rKV95AwKrjMPziCl43osWurZYVBCqlwo2TdBB8aEX5PQTCS5AGn50ZwmVL
	NTk/4ViLGUGU5qLaKuzX8Ib9PeofopHsvXevdHx5GDuHYF0bvSswTu9giUyFQtqS/YpbaK
	FvIou48O/Tbv0p4Kuv01/RRyikSfEnqANaZHaheeak+lCFg1RslpA9s4A6rqxdFdALqKXN
	FgIQbgkJJ+fVrlUVqyoL8iUiKDvvHr+9Xgt6QwIxvaipNaeSZgstvccv138LAg==
Date: Tue, 11 Jul 2023 11:41:55 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: "Chunfeng Yun (=?UTF-8?B?5LqR5pil5bOw?=)" <Chunfeng.Yun@mediatek.com>
Cc: "yhao016@ucr.edu" <yhao016@ucr.edu>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-mediatek@lists.infradead.org"
 <linux-mediatek@lists.infradead.org>, "gregkh@linuxfoundation.org"
 <gregkh@linuxfoundation.org>, "linux-usb@vger.kernel.org"
 <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] usb: mtu3: Fix possible use-before-initialization bug
Message-ID: <20230711114155.4a000704@bootlin.com>
In-Reply-To: <29a71cbb61148d2085cc08da681526c4e20d31b9.camel@mediatek.com>
References: <CA+UBctDxfb6+70+hzuXJ-gwb65E0uoNzXYEhpJT92sXr2CE7OA@mail.gmail.com>
	<20230705080625.02b2bac5@bootlin.com>
	<CA+UBctBqtSvyBWf9ZwKbecTrh9_6sCDm_TyU-ncb+6h5y19K5g@mail.gmail.com>
	<20230710082558.2f82d607@bootlin.com>
	<29a71cbb61148d2085cc08da681526c4e20d31b9.camel@mediatek.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: herve.codina@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230711_024208_584183_437B662A 
X-CRM114-Status: GOOD (  29.72  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Chunfeng,

On Tue, 11 Jul 2023 08:48:35 +0000
Chunfeng Yun (云春峰) <Chunfeng.Yun@mediatek.com> wrote:

> On Mon, 2023-07-10 at 08:25 +0200, Herve Codina wrote:
> >  	 
> > External email : Please do not click links or open attachments until
> > you have verified the sender or the content.
> >  Hi Yu,
> > 
> > On Sun, 9 Jul 2023 17:48:15 -0700
> > Yu Hao <yhao016@ucr.edu> wrote:
> >   
> > > Hi Hervé,
> > > 
> > > Thanks for the comments. How about this patch?
> > > ---
> > >  drivers/usb/mtu3/mtu3_gadget_ep0.c | 11 ++++++++---
> > >  1 file changed, 8 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/drivers/usb/mtu3/mtu3_gadget_ep0.c
> > > b/drivers/usb/mtu3/mtu3_gadget_ep0.c
> > > index e4fd1bb14a55..af2884943c2a 100644
> > > --- a/drivers/usb/mtu3/mtu3_gadget_ep0.c
> > > +++ b/drivers/usb/mtu3/mtu3_gadget_ep0.c
> > > @@ -600,7 +600,7 @@ static void ep0_tx_state(struct mtu3 *mtu)
> > >         mtu3_readl(mtu->mac_base, U3D_EP0CSR));
> > >  }
> > > 
> > > -static void ep0_read_setup(struct mtu3 *mtu, struct  
> > usb_ctrlrequest *setup)  
> > > +static int ep0_read_setup(struct mtu3 *mtu, struct usb_ctrlrequest  
> > *setup)  
> > >  {
> > >     struct mtu3_request *mreq;
> > >     u32 count;
> > > @@ -608,6 +608,8 @@ static void ep0_read_setup(struct mtu3 *mtu,
> > > struct usb_ctrlrequest *setup)
> > > 
> > >     csr = mtu3_readl(mtu->mac_base, U3D_EP0CSR) & EP0_W1C_BITS;
> > >     count = mtu3_readl(mtu->mac_base, U3D_RXCOUNT0);
> > > +   if (count == 0)
> > > +       return -EINVAL;  
> > 
> > 'count' should be tested against sizeof(*setup). Indeed, we need to
> > have a
> > setup data packet in the fifo.
> > 
> > What do you think about:
> > if (count < sizef(*setup))
> > return -EINVAL;  
> before call this function, already check the data length in fifo, it
> should be 8 bytes.
> see mtu3_ep0_isr(), about line 761.

Indeed, I missed that point.
Thanks for pointing it.

Regards,
Hervé

> 
> I think no need this patch
> 
> Thanks a lot
> 
> >   
> > > 
> > >     ep0_read_fifo(mtu->ep0, (u8 *)setup, count);
> > > 
> > > @@ -642,7 +644,8 @@ __acquires(mtu->lock)
> > >     struct mtu3_request *mreq;
> > >     int handled = 0;
> > > 
> > > -   ep0_read_setup(mtu, &setup);
> > > +   if (ep0_read_setup(mtu, &setup))
> > > +       return -EINVAL;  
> > 
> > Forward the error code to the caller ?
> > 
> > ret = ep0_read_setup(mtu, &setup)
> > if (ret < 0)
> > return ret;
> > 
> >   
> > >     trace_mtu3_handle_setup(&setup);
> > > 
> > >     if ((setup.bRequestType & USB_TYPE_MASK) == USB_TYPE_STANDARD)
> > > @@ -764,7 +767,9 @@ irqreturn_t mtu3_ep0_isr(struct mtu3 *mtu)
> > >             break;
> > >         }
> > > 
> > > -       ep0_handle_setup(mtu);
> > > +       if (ep0_handle_setup(mtu))
> > > +           break;
> > > +  
> > 
> > Ok
> >   
> > >         ret = IRQ_HANDLED;
> > >         break;
> > >     default:  
> > 
> > Be careful, your patch is wrongly indented.
> > tabs replaced by 4 spaces. You need to keep tabs.
> > 
> > Regards,
> > Hervé Codina
> >   


