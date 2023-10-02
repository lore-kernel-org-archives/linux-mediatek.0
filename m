Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0391E784B7
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Oct 2023 14:53:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bks4KxdSLORFdnLTCIppogq3dpDKERAzeHaIcTenHB8=; b=U1QD/qPd5HpiPD7MANC9wYcK3l
	vll57CmW1nRLc9cVM4VLMI4JGV9Gn7jgb0SpRuj3tEwy6ZJzXDrFWnV7UyGuJaP4Mx2TkBgEw9MyM
	8t3sHv5G9PPXs7QFMiSf1zIx1mpddm3TFFfxoHKc6e7zYkHUhAHuSp9gF+2sT3ww+wMZB7fu7tYCy
	RqhzMYLXMTvI+W1WI7G72+YbMaGsV10/0j8UA7FearGyyrqXQfdk8sFnwAb9cSSchkyIZhW4S27e/
	D0y2e3yvOzCbHgkUrhDr+huNWbNQZQXBNQuCkMWRbrfehPw40TJCQGVu6YEc1eSxiu8SyHYiy6hQm
	qJ8NLaeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnKIK-00Cv4D-28;
	Mon, 02 Oct 2023 14:53:12 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnKIH-00Cv2Z-2n
	for linux-mediatek@lists.infradead.org;
	Mon, 02 Oct 2023 14:53:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C5FEA60204;
	Mon,  2 Oct 2023 14:53:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 148B7C433C7;
	Mon,  2 Oct 2023 14:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1696258388;
	bh=+rVpKXm6Nmhq/ALGv9CKFZpidgGfpk8Y8x6TZ51OS8k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pi7CmM/WRmIoi1lEnPr1T0+EFGW9iHJMmX0utDgT3U5Y6pKnMgSmMpzBS8+er5kqh
	 ToS2ootXrmI3kY+Ey26Z4itgV+j+6zh6nMMuxbqjbr+i2Xz1871GBaNCcbFWKzNquM
	 erPN+M7XmTPxFMRDTCGAUvmhkIxoPRw4tVV8EfPM=
Date: Mon, 2 Oct 2023 16:53:05 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>, linux-usb@vger.kernel.org,
	linux-mediatek@lists.infradead.org, kernel@pengutronix.de
Subject: Re: [PATCH v2] usb: mtu3: Convert to platform remove callback
 returning void
Message-ID: <2023100253-amino-pencil-9a96@gregkh>
References: <20230914200251.919584-1-u.kleine-koenig@pengutronix.de>
 <2023100219-variety-genre-befe@gregkh>
 <20231002144959.jc6wwfrvwd4cyu2l@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231002144959.jc6wwfrvwd4cyu2l@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231002_075309_965580_D09E9CE9 
X-CRM114-Status: GOOD (  19.17  )
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

On Mon, Oct 02, 2023 at 04:49:59PM +0200, Uwe Kleine-König wrote:
> Hello Greg,
> 
> On Mon, Oct 02, 2023 at 04:39:47PM +0200, Greg Kroah-Hartman wrote:
> > On Thu, Sep 14, 2023 at 10:02:51PM +0200, Uwe Kleine-König wrote:
> > > @@ -469,8 +469,17 @@ static int mtu3_remove(struct platform_device *pdev)
> > >  		ssusb_gadget_exit(ssusb);
> > >  		ssusb_host_exit(ssusb);
> > >  		break;
> > > -	default:
> > > -		return -EINVAL;
> > > +	case USB_DR_MODE_UNKNOWN:
> > > +		/*
> > > +		 * This cannot happen because with dr_mode ==
> > > +		 * USB_DR_MODE_UNKNOWN, .probe() doesn't succeed and so
> > > +		 * .remove() wouldn't be called at all. However (little
> > > +		 * surprising) the compiler isn't smart enough to see that, so
> > > +		 * we explicitly have this case item to not make the compiler
> > > +		 * wail about an unhandled enumeration value.
> > > +		 */
> > > +		WARN_ON(1);
> > 
> > Please don't add new WARN_ON() calls to the kernel, print out a big
> > error message and return, don't reboot the machine.
> 
> Huh, printing out an loud error message was my intention. It's news to
> me that WARN_ON() reboots the machine?! I thought BUG_ON() was the one
> with the effects you describe that I shouldn't use.

panic-on-warn is set for zillions[1] of Linux systems out there, so systems
will reboot.

thanks,

greg k-h

[1] Unofficial number, I know the "cloud" systems set this, as well as
    all of Samsung's phone kernels, a non-trivial amount of Linux
    instances in the wild.

