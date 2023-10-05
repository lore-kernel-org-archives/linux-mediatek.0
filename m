Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 681BCE7C4F4
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Oct 2023 07:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b7oE6uRElXy0dez91lrV9hORz3vwMShFowtABbZRImc=; b=riseNUknLSMWwjYjYvA29vRdbH
	UPb9cDzDfVCqgAEt4dKpR4BrX+VZ2cPzELmS93C853AcgMwOuuY+aHQ6Ks9ZJSoKztRSfGYun8G3B
	rqhZ7V6lJchMv4Xm+twCq5ePIx+TJi/o/rlufaabWQ9gqMS7HOzd76nvlcotORfTT+PT0+M84kWn6
	qB2biO7PQZf2+iPmHlcI9ttYKoPndkC9pl8wqxFK6t5zexrYqaJkIAZ6x5gfZ799m1Voia6Bhbwtt
	eclAmDsGUHekFHHJB/BzvnoED0QgABRq4ZzbFkG2yp2d2qVp8EfCqFejRBWsUnfXjllGt4ZODVkJV
	tPywP9oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qoIY3-001ZnZ-38;
	Thu, 05 Oct 2023 07:13:27 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qoIY0-001ZmK-13
	for linux-mediatek@lists.infradead.org;
	Thu, 05 Oct 2023 07:13:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 064E1B81CD8;
	Thu,  5 Oct 2023 07:13:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F94FC433BA;
	Thu,  5 Oct 2023 07:13:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1696490001;
	bh=8OKsDsRgseQhws0CL9HUY+Fxt0nfCfk4BoGajhLR7Is=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SM3GSVUb40jlNIYxL23WMHJhlc84z0uY4+A+X4KVpX7Y3FOLf9koln1RaU05qUH6D
	 LWvH6JoKggmL+dr/2lp5o8oMyH6UOT0OY5d4twl5gqbuDvF9boIWUy1/JRI7Zp/Q/6
	 JkSn7lXFpWYlDAbkPM/drvrRlPAn30g7rs9sXQHg=
Date: Thu, 5 Oct 2023 09:13:18 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>, linux-usb@vger.kernel.org,
	linux-mediatek@lists.infradead.org, kernel@pengutronix.de
Subject: Re: [PATCH v2] usb: mtu3: Convert to platform remove callback
 returning void
Message-ID: <2023100530-degree-overlap-6aff@gregkh>
References: <20230914200251.919584-1-u.kleine-koenig@pengutronix.de>
 <2023100219-variety-genre-befe@gregkh>
 <20231002144959.jc6wwfrvwd4cyu2l@pengutronix.de>
 <2023100253-amino-pencil-9a96@gregkh>
 <20231002214158.wvhals4ywezftepo@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231002214158.wvhals4ywezftepo@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231005_001324_533215_83915893 
X-CRM114-Status: GOOD (  26.83  )
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

On Mon, Oct 02, 2023 at 11:41:58PM +0200, Uwe Kleine-König wrote:
> Hello Greg,
> 
> On Mon, Oct 02, 2023 at 04:53:05PM +0200, Greg Kroah-Hartman wrote:
> > On Mon, Oct 02, 2023 at 04:49:59PM +0200, Uwe Kleine-König wrote:
> > > On Mon, Oct 02, 2023 at 04:39:47PM +0200, Greg Kroah-Hartman wrote:
> > > > On Thu, Sep 14, 2023 at 10:02:51PM +0200, Uwe Kleine-König wrote:
> > > > > @@ -469,8 +469,17 @@ static int mtu3_remove(struct platform_device *pdev)
> > > > >  		ssusb_gadget_exit(ssusb);
> > > > >  		ssusb_host_exit(ssusb);
> > > > >  		break;
> > > > > -	default:
> > > > > -		return -EINVAL;
> > > > > +	case USB_DR_MODE_UNKNOWN:
> > > > > +		/*
> > > > > +		 * This cannot happen because with dr_mode ==
> > > > > +		 * USB_DR_MODE_UNKNOWN, .probe() doesn't succeed and so
> > > > > +		 * .remove() wouldn't be called at all. However (little
> > > > > +		 * surprising) the compiler isn't smart enough to see that, so
> > > > > +		 * we explicitly have this case item to not make the compiler
> > > > > +		 * wail about an unhandled enumeration value.
> > > > > +		 */
> > > > > +		WARN_ON(1);
> > > > 
> > > > Please don't add new WARN_ON() calls to the kernel, print out a big
> > > > error message and return, don't reboot the machine.
> > > 
> > > Huh, printing out an loud error message was my intention. It's news to
> > > me that WARN_ON() reboots the machine?! I thought BUG_ON() was the one
> > > with the effects you describe that I shouldn't use.
> > 
> > panic-on-warn is set for zillions[1] of Linux systems out there, so systems
> > will reboot.
> 
> The people enabling panic-on-warn *ask* for a reboot if something
> strange happens, right? If ssusb->dr_mode is USB_DR_MODE_UNKNOWN in
> .remove() but wasn't in .probe(), that's strange, right? If I don't
> enable panic-on-warn, my system just emits a warning and then the driver
> copes with what it has, right? Sounds to me as if WARN_ON does exactly
> what is the right thing here.

I really don't want to add more WARN_ON() to the kernel if at all
possible.

If this "can not happen" then just don't even add code for it, why have
this at all?  The compiler warning can be handled a different way,
right?

thanks,

greg k-h

