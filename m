Return-Path: <SRS0=IR42=AN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 205A5C433DF
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Jul 2020 02:53:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E0536207F5
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Jul 2020 02:53:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hfY5iICi";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="aLSG1kWm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E0536207F5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=cfE3Ne8bBIegSjFa/zh4elFKReLtgPI/iSMGOV9veUM=; b=hfY5iICi1sX9JKcGuBxWbBPv+
	kWqdMUI0gFsuB+f2e3/cLu5Jmjdpn2GVmDbSFAFk5aUdRKzYW9uBxwbwZWsB8zdlFRPGkfQrfFd2Q
	WyrfDOU01MdNxpkZ6uWtWDO/jKA4PyvE6pFK1m1GFqrFP9f+FCK4M7lFAI/rOU0Pxe85cM4pdDo8Z
	KsIJbQHSIlsLkaAIzN6LkP2zx1cYGBjdBBaArUaWKlTHcemzpW858TaErCybd21H4FRqTBXAlI/9U
	7biAXQx3QggxFSQoqd+kF39yc4YxJ8B5xEnNAe7C2F1TfCW6LrlCJ3XLbn1CQGABpyrEUuJno/6Iz
	RGu8JEDhw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jqpLv-0001NF-Ac; Thu, 02 Jul 2020 02:53:31 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jqpLr-0001MC-LL; Thu, 02 Jul 2020 02:53:28 +0000
X-UUID: d38d504bc70a4920867738f294b337d1-20200701
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=afpaC7qRGVZ6JRFynQgro+7OJFSDdHfSPLeLJ/lq7kQ=; 
 b=aLSG1kWmHRehrrGQ3rqzjfigMarWaiFUhQ7v78o07HneYshjxm0TtsjxlfDJ93oVg48TrHNcYz/mTSwKXH2FX3xrwX0W8pO9A89pAl6spVO2XB7nXm8UocNMJ6AfRRU1t1SHBFdrmGxJHPd54OoLXPkaB+PsXp4NdKb2UAlrIFQ=;
X-UUID: d38d504bc70a4920867738f294b337d1-20200701
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1247762619; Wed, 01 Jul 2020 18:53:19 -0800
Received: from MTKMBS32N1.mediatek.inc (172.27.4.71) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 1 Jul 2020 19:53:17 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS32N1.mediatek.inc
 (172.27.4.71) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 2 Jul 2020 10:53:14 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 2 Jul 2020 10:53:09 +0800
Message-ID: <1593658371.23885.16.camel@mhfsdcap03>
Subject: Re: [V2 PATCH] usb: mtu3: fix NULL pointer dereference
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Thu, 2 Jul 2020 10:52:51 +0800
In-Reply-To: <20200701115821.GA2184169@kroah.com>
References: <1593502942-24455-1-git-send-email-chunfeng.yun@mediatek.com>
 <20200701115821.GA2184169@kroah.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 9F8CFEA6CEBAFB7D9D5D9DF806B368CC530AA52FD6E6FE9C3269E92BF6BF031F2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200701_225327_827536_43EF5226 
X-CRM114-Status: GOOD (  21.50  )
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
Cc: Felipe Balbi <felipe.balbi@linux.intel.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Markus Elfring <Markus.Elfring@web.de>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 2020-07-01 at 13:58 +0200, Greg Kroah-Hartman wrote:
> On Tue, Jun 30, 2020 at 03:42:22PM +0800, Chunfeng Yun wrote:
> > Some pointers are dereferenced before successful checks.
> > 
> > Reported-by: Markus Elfring <Markus.Elfring@web.de>
> > Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> > ---
> > v2: nothing changed, but abandon another patch
> > ---
> >  drivers/usb/mtu3/mtu3_gadget.c | 25 ++++++++++++++++++-------
> >  1 file changed, 18 insertions(+), 7 deletions(-)
> > 
> > diff --git a/drivers/usb/mtu3/mtu3_gadget.c b/drivers/usb/mtu3/mtu3_gadget.c
> > index f93732e..1689ca8 100644
> > --- a/drivers/usb/mtu3/mtu3_gadget.c
> > +++ b/drivers/usb/mtu3/mtu3_gadget.c
> > @@ -332,14 +332,21 @@ static int mtu3_gadget_queue(struct usb_ep *ep,
> >  
> >  static int mtu3_gadget_dequeue(struct usb_ep *ep, struct usb_request *req)
> >  {
> > -	struct mtu3_ep *mep = to_mtu3_ep(ep);
> > -	struct mtu3_request *mreq = to_mtu3_request(req);
> > +	struct mtu3_ep *mep;
> > +	struct mtu3_request *mreq;
> >  	struct mtu3_request *r;
> > +	struct mtu3 *mtu;
> >  	unsigned long flags;
> >  	int ret = 0;
> > -	struct mtu3 *mtu = mep->mtu;
> >  
> > -	if (!ep || !req || mreq->mep != mep)
> > +	if (!ep || !req)
> > +		return -EINVAL;
> 
> How will either of those ever be NULL?  The kernel will not call this
> function with either of them being NULL, right?
Yes, I find all class drivers already ensure they are not NULL.

> 
> > +
> > +	mep = to_mtu3_ep(ep);
> > +	mtu = mep->mtu;
> > +
> > +	mreq = to_mtu3_request(req);
> > +	if (mreq->mep != mep)
> >  		return -EINVAL;
> >  
> >  	dev_dbg(mtu->dev, "%s : req=%p\n", __func__, req);
> > @@ -373,8 +380,8 @@ static int mtu3_gadget_dequeue(struct usb_ep *ep, struct usb_request *req)
> >   */
> >  static int mtu3_gadget_ep_set_halt(struct usb_ep *ep, int value)
> >  {
> > -	struct mtu3_ep *mep = to_mtu3_ep(ep);
> > -	struct mtu3 *mtu = mep->mtu;
> > +	struct mtu3_ep *mep;
> > +	struct mtu3 *mtu;
> >  	struct mtu3_request *mreq;
> >  	unsigned long flags;
> >  	int ret = 0;
> > @@ -382,6 +389,9 @@ static int mtu3_gadget_ep_set_halt(struct usb_ep *ep, int value)
> >  	if (!ep)
> >  		return -EINVAL;
> 
> Same here, how can that ever happen?
Maybe when the class driver has something wrong:)

You mean it's better to remove these unnecessary checks?

Thanks

> 
> >  
> > +	mep = to_mtu3_ep(ep);
> > +	mtu = mep->mtu;
> > +
> >  	dev_dbg(mtu->dev, "%s : %s...", __func__, ep->name);
> >  
> >  	spin_lock_irqsave(&mtu->lock, flags);
> > @@ -422,11 +432,12 @@ static int mtu3_gadget_ep_set_halt(struct usb_ep *ep, int value)
> >  /* Sets the halt feature with the clear requests ignored */
> >  static int mtu3_gadget_ep_set_wedge(struct usb_ep *ep)
> >  {
> > -	struct mtu3_ep *mep = to_mtu3_ep(ep);
> > +	struct mtu3_ep *mep;
> >  
> >  	if (!ep)
> >  		return -EINVAL;
> 
> Again, same here.
> 
> thanks,
> 
> greg k-h

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
