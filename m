Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B63B2C001DF
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Oct 2023 14:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ccFMEm4lNEf5BgElPclVUM5qbJdaykgtunEiTu6x5q0=; b=at8Zs/Vp/zlsWp44eYuc1EE5JS
	Spgwrlq16TR9XrR6AIs/gNs32wsoz+8FnPbK0pH5OwcooZJYSyA05pZ7Zh5cRjSRPkfvXV/kjOhyB
	F97L5NFlt7G3SHla7y2L6qYWrAZ2ach0bxATimAs5zs0gtGaLEVU3cupslYS5afld/cpi04RaNe48
	dIrQzJ8vSTDEFafW0T0ubBnjwLDtvZem5uiTv2D8RuPZ31IJvNTkF6ympsat38tikI+JBsBdtPQst
	R6Vm0GGCtMu/iyNZfhkvTZgW39QZ83eJGwOErUqMNTV3oWfkLOky4rU5M/ozB3vB8mblqs6b7Wf6I
	p7Em747g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtqZM-002VbU-0z;
	Fri, 20 Oct 2023 14:33:44 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtqZJ-002VaJ-1t
	for linux-mediatek@lists.infradead.org;
	Fri, 20 Oct 2023 14:33:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 66179CE3911;
	Fri, 20 Oct 2023 14:33:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08FC6C433C7;
	Fri, 20 Oct 2023 14:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1697812418;
	bh=OQ/SwO6+aCaGvq+wHdqRuqJZ3IwVSwwQr1DeRuGWHUg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vaidQ2/AwzPR3ZDhWoNyRO5/RMWbojeOimU4dnTV9hlxZFYtVabK3EZ8/sKdfb0Nk
	 f5grS0/wL4/uz8mE2p1GLiaSeK1FNTCZ139Uous1egdmIResk5m1ZFVdRdgZwHJp6c
	 /mTS9fK26JLoKle0HFiib1prqwQ66HUO3bDcNbpE=
Date: Fri, 20 Oct 2023 16:33:34 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>, linux-usb@vger.kernel.org,
	linux-mediatek@lists.infradead.org, kernel@pengutronix.de
Subject: Re: [PATCH v2] usb: mtu3: Convert to platform remove callback
 returning void
Message-ID: <2023102012-snowbird-trapezoid-1f3a@gregkh>
References: <20230914200251.919584-1-u.kleine-koenig@pengutronix.de>
 <2023100219-variety-genre-befe@gregkh>
 <20231002144959.jc6wwfrvwd4cyu2l@pengutronix.de>
 <2023100253-amino-pencil-9a96@gregkh>
 <20231002214158.wvhals4ywezftepo@pengutronix.de>
 <2023100530-degree-overlap-6aff@gregkh>
 <20231020095325.qgymq46sj4isaoqa@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231020095325.qgymq46sj4isaoqa@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231020_073341_985598_BF6D9B6B 
X-CRM114-Status: GOOD (  32.00  )
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

On Fri, Oct 20, 2023 at 11:53:25AM +0200, Uwe Kleine-König wrote:
> Hello Greg,
> 
> On Thu, Oct 05, 2023 at 09:13:18AM +0200, Greg Kroah-Hartman wrote:
> > On Mon, Oct 02, 2023 at 11:41:58PM +0200, Uwe Kleine-König wrote:
> > > On Mon, Oct 02, 2023 at 04:53:05PM +0200, Greg Kroah-Hartman wrote:
> > > > On Mon, Oct 02, 2023 at 04:49:59PM +0200, Uwe Kleine-König wrote:
> > > > > On Mon, Oct 02, 2023 at 04:39:47PM +0200, Greg Kroah-Hartman wrote:
> > > > > > On Thu, Sep 14, 2023 at 10:02:51PM +0200, Uwe Kleine-König wrote:
> > > > > > > @@ -469,8 +469,17 @@ static int mtu3_remove(struct platform_device *pdev)
> > > > > > >  		ssusb_gadget_exit(ssusb);
> > > > > > >  		ssusb_host_exit(ssusb);
> > > > > > >  		break;
> > > > > > > -	default:
> > > > > > > -		return -EINVAL;
> > > > > > > +	case USB_DR_MODE_UNKNOWN:
> > > > > > > +		/*
> > > > > > > +		 * This cannot happen because with dr_mode ==
> > > > > > > +		 * USB_DR_MODE_UNKNOWN, .probe() doesn't succeed and so
> > > > > > > +		 * .remove() wouldn't be called at all. However (little
> > > > > > > +		 * surprising) the compiler isn't smart enough to see that, so
> > > > > > > +		 * we explicitly have this case item to not make the compiler
> > > > > > > +		 * wail about an unhandled enumeration value.
> > > > > > > +		 */
> > > > > > > +		WARN_ON(1);
> > > > > > 
> > > > > > Please don't add new WARN_ON() calls to the kernel, print out a big
> > > > > > error message and return, don't reboot the machine.
> > > > > 
> > > > > Huh, printing out an loud error message was my intention. It's news to
> > > > > me that WARN_ON() reboots the machine?! I thought BUG_ON() was the one
> > > > > with the effects you describe that I shouldn't use.
> > > > 
> > > > panic-on-warn is set for zillions[1] of Linux systems out there, so systems
> > > > will reboot.
> > > 
> > > The people enabling panic-on-warn *ask* for a reboot if something
> > > strange happens, right? If ssusb->dr_mode is USB_DR_MODE_UNKNOWN in
> > > .remove() but wasn't in .probe(), that's strange, right? If I don't
> > > enable panic-on-warn, my system just emits a warning and then the driver
> > > copes with what it has, right? Sounds to me as if WARN_ON does exactly
> > > what is the right thing here.
> > 
> > I really don't want to add more WARN_ON() to the kernel if at all
> > possible.
> > 
> > If this "can not happen" then just don't even add code for it, why have
> > this at all?  The compiler warning can be handled a different way,
> > right?
> 
> Sure, what do you suggest? A dev_warn()?

Sure.  but again, if this can not happen, why do anything?

> ..ooOO(But maybe there are people who reboot on dev_warn(), too?)

No, that's not a thing, thankfully :)

greg k-h

