Return-Path: <SRS0=KJBd=AM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08D86C433E0
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Jul 2020 11:58:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C95CD2067D
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Jul 2020 11:58:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="1bAiDLOY";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="UQcpx0io"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C95CD2067D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=pCiITQNLPpyviuil+brp5dkVQtUkcYIxfCirjeTACW0=; b=1bAiDLOYT6xWAsgVihLnp3AWV
	5p8EpM0xPCIyg4XNTlE+z+H8//0kf/yT0xoAabiAcisgJwFz9MCRmpdripYfZdWTKCeViuznlvRtO
	V+iuskcnahaRCNTwYffoxkg7/5lT6By6rsJ00ePw9kgwu05nr6Hek/MHwCdiPp5iaNw+NuVdKIRkd
	p0yUYGJmEsGk/hB/aD3WvZKq1t2lHEyXeAFmBRc6+88IaUK8UFkwMkb5Ahk7c6AV7hMbPa2gqex8t
	CZTO/lYF3hZoDsqKJTw4DNPGmBYyeGgMDBVstDqi5XdYW9/BBX6MRwzcoro4tTZmLAqgivOKIPd2z
	FYbq/pe/A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jqbNy-0007t5-0W; Wed, 01 Jul 2020 11:58:42 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jqbNv-0007rw-2Q; Wed, 01 Jul 2020 11:58:39 +0000
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1B7342067D;
 Wed,  1 Jul 2020 11:58:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593604715;
 bh=nDHkQnF3GE7LeSK4D2XQD+Jb5LeVxf5LtuLUx72bPl0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UQcpx0io+u/a7HSMAtKB8tJpIHuA9tVGeE/1lhqC+fzTxXp/XFbgQWyziKZCMUo4V
 9OmPXcF+enzCZDJ7tdbDXIq4TLpdl1kiP+3Fm8W6H/jzJqqM0PqwUVP/kzwmM7HC3u
 ALCWydllZlvVZhfCIR7+pO9v/EQ96aN/uME61ewI=
Date: Wed, 1 Jul 2020 13:58:21 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Subject: Re: [V2 PATCH] usb: mtu3: fix NULL pointer dereference
Message-ID: <20200701115821.GA2184169@kroah.com>
References: <1593502942-24455-1-git-send-email-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1593502942-24455-1-git-send-email-chunfeng.yun@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200701_075839_203368_3F5CD375 
X-CRM114-Status: GOOD (  17.70  )
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

On Tue, Jun 30, 2020 at 03:42:22PM +0800, Chunfeng Yun wrote:
> Some pointers are dereferenced before successful checks.
> 
> Reported-by: Markus Elfring <Markus.Elfring@web.de>
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
> v2: nothing changed, but abandon another patch
> ---
>  drivers/usb/mtu3/mtu3_gadget.c | 25 ++++++++++++++++++-------
>  1 file changed, 18 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/usb/mtu3/mtu3_gadget.c b/drivers/usb/mtu3/mtu3_gadget.c
> index f93732e..1689ca8 100644
> --- a/drivers/usb/mtu3/mtu3_gadget.c
> +++ b/drivers/usb/mtu3/mtu3_gadget.c
> @@ -332,14 +332,21 @@ static int mtu3_gadget_queue(struct usb_ep *ep,
>  
>  static int mtu3_gadget_dequeue(struct usb_ep *ep, struct usb_request *req)
>  {
> -	struct mtu3_ep *mep = to_mtu3_ep(ep);
> -	struct mtu3_request *mreq = to_mtu3_request(req);
> +	struct mtu3_ep *mep;
> +	struct mtu3_request *mreq;
>  	struct mtu3_request *r;
> +	struct mtu3 *mtu;
>  	unsigned long flags;
>  	int ret = 0;
> -	struct mtu3 *mtu = mep->mtu;
>  
> -	if (!ep || !req || mreq->mep != mep)
> +	if (!ep || !req)
> +		return -EINVAL;

How will either of those ever be NULL?  The kernel will not call this
function with either of them being NULL, right?

> +
> +	mep = to_mtu3_ep(ep);
> +	mtu = mep->mtu;
> +
> +	mreq = to_mtu3_request(req);
> +	if (mreq->mep != mep)
>  		return -EINVAL;
>  
>  	dev_dbg(mtu->dev, "%s : req=%p\n", __func__, req);
> @@ -373,8 +380,8 @@ static int mtu3_gadget_dequeue(struct usb_ep *ep, struct usb_request *req)
>   */
>  static int mtu3_gadget_ep_set_halt(struct usb_ep *ep, int value)
>  {
> -	struct mtu3_ep *mep = to_mtu3_ep(ep);
> -	struct mtu3 *mtu = mep->mtu;
> +	struct mtu3_ep *mep;
> +	struct mtu3 *mtu;
>  	struct mtu3_request *mreq;
>  	unsigned long flags;
>  	int ret = 0;
> @@ -382,6 +389,9 @@ static int mtu3_gadget_ep_set_halt(struct usb_ep *ep, int value)
>  	if (!ep)
>  		return -EINVAL;

Same here, how can that ever happen?

>  
> +	mep = to_mtu3_ep(ep);
> +	mtu = mep->mtu;
> +
>  	dev_dbg(mtu->dev, "%s : %s...", __func__, ep->name);
>  
>  	spin_lock_irqsave(&mtu->lock, flags);
> @@ -422,11 +432,12 @@ static int mtu3_gadget_ep_set_halt(struct usb_ep *ep, int value)
>  /* Sets the halt feature with the clear requests ignored */
>  static int mtu3_gadget_ep_set_wedge(struct usb_ep *ep)
>  {
> -	struct mtu3_ep *mep = to_mtu3_ep(ep);
> +	struct mtu3_ep *mep;
>  
>  	if (!ep)
>  		return -EINVAL;

Again, same here.

thanks,

greg k-h

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
