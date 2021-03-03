Return-Path: <SRS0=dK9R=IB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79697C433E0
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Mar 2021 15:46:06 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EFF5864EE8
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Mar 2021 15:46:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EFF5864EE8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ndX5ntqMVBkxk21StHp2D7W5vPQGCt+PB8yFyGqouoo=; b=B+FcftNzQWgV/5kgngj2athn4
	f4MQspAcMr39Lu0YltShJjhFiULX70HUzRAIVfVNuwsQck/tENItgVYGPjz89yuOQMCkM4vGa/fB9
	BbXE+pWbFWxsbr2xGCn674bWcz55cpLt4hq1o9zURapTPv/lDwHN/2UJo2N6zHI480lB75A9lvLde
	RRCtX/M3IwdZP6dzZr5qsh9APOrNLXOAKHwxNiq51oMTdU8acmqoALtvLqHCynBOrgTfXzGqY59B2
	GO4a0oJGkC57T1OJLB89u1yG0j+KcMqTwZZ+h+io4c7gaSe7Qd3Msh+AJEBi63pLbFf2w1rYuaAgu
	0B18QbSdQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lHTh7-005RkV-B5; Wed, 03 Mar 2021 15:45:49 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHSfL-005Ade-Qh; Wed, 03 Mar 2021 14:39:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=WMFS/nDEu50gJTWLKL4+IkNuc74AB74zFjvXeM3EZys=; b=QpFIUEGSlMY7l0Fwig8ASYnzj0
 pIV0KYzGJcHFfgm9d1DYmtQ1fQfBxxHE40Gl9sz3oMTjaO6t7HsXGojiJ1FcwidiDRE9CSSiJblbx
 +s0xZR6815xGyOD/uGY0lcyFQ7Lntp+UHDfR7EO0Qp2c/vARSE/ipAGWw4KHnbkSRFfkZgIGRgpPt
 2MCuorRkH0NvxQyvC+Cz56btl2OP7nK5CLk++yqfSy33cg7AfHXXwMm7wrZ2aQZHa/DU3T6pJfmOf
 Kp6TbAxVHNJ/u+C/0w8ZSqXqKrmBh1LDFi6c6yDwbHHHlRyjY32NksOfOYsuUKjK//Id0PrhSaJf4
 T39fqe5Q==;
Received: from mail.kernel.org ([198.145.29.99])
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHNYq-001y7L-Pn; Wed, 03 Mar 2021 09:12:54 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8877464ECE;
 Wed,  3 Mar 2021 09:12:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1614762769;
 bh=LcFEAIV39oP6qhAFHARHbGR+Nvr/RN2ia8mLaBzIos0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=z7bLFFz9oOMQtk+cVU94y2on5R6Q6uDedD0ceE8/iNe/x8BenPPZ4SJCxbiraQLWI
 bAC3OiRYGRfht03bQg+Fe5L3uDsNHbKAUlo3sOZxjur8xt4ppSFR4rK+YBup7Za6zU
 oVGBTXdLWnIyxSZs/+9zmrv5s9qf882+rPRnZsGA=
Date: Wed, 3 Mar 2021 10:12:46 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Leilk Liu <leilk.liu@mediatek.com>
Subject: Re: [PATCH] spi: mediatek: Re-license MTK SPI driver as Dual MIT/GPL
Message-ID: <YD9TDv85D/zSV2Li@kroah.com>
References: <20210303025636.795-1-leilk.liu@mediatek.com>
 <YD84OKr4vNwA7vnz@kroah.com> <1614762159.5898.9.camel@mhfsdcap03>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1614762159.5898.9.camel@mhfsdcap03>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210303_091254_441879_93AD170A 
X-CRM114-Status: GOOD (  24.92  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, linux-mediatek@lists.infradead.org,
 Nicolas Boichat <drinkcat@chromium.org>, Wei Yongjun <weiyj.lk@gmail.com>,
 fparent@baylibre.com, linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
 Stephen Boyd <swboyd@chromium.org>,
 Javier Martinez Canillas <javier@osg.samsung.com>,
 Mark Brown <broonie@kernel.org>, "luhua . xu" <luhua.xu@mediatek.com>,
 Pi-Hsun Shih <pihsun@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Axel Lin <axel.lin@ingics.com>, Thomas Gleixner <tglx@linutronix.de>,
 Fengguang Wu <fengguang.wu@intel.com>,
 Markus Elfring <elfring@users.sourceforge.net>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Mar 03, 2021 at 05:02:39PM +0800, Leilk Liu wrote:
> On Wed, 2021-03-03 at 08:18 +0100, Greg Kroah-Hartman wrote:
> > On Wed, Mar 03, 2021 at 10:56:36AM +0800, Leilk Liu wrote:
> > > From: "leilk.liu" <leilk.liu@mediatek.com>
> > > 
> > > It is wanted to use MTK spi bus driver with GPL-2.0 or MIT license.
> > > But now it is only licensed as GPL-2.0, so re-license it as dual
> > > MIT/GPL.
> > > 
> > > Signed-off-by: leilk.liu <leilk.liu@mediatek.com>
> > 
> > Please use your name here, not an email alias for where your name goes.
> > 
> OK, I'll fix it, thanks!
> > 
> > > ---
> > >  drivers/spi/spi-mt65xx.c                 | 4 ++--
> > >  include/linux/platform_data/spi-mt65xx.h | 2 +-
> > 
> > Given that these files have been licensed under the GPL only since 2015,
> > all changes contributed to it have only been licensed under the GPL as
> > well, so have you gotten approval for all of the contributors for this
> > change?
> > 
> This is the reason that I sent this patch to ask for ACKs from all
> contributors (who are all in the To mail-list) for these files.

That wasn't obvious :)

But given that many of the contributors here do not actually own the
copyrights of their contributions, how can you be sure that the real
owners are agreeing to this?  That requires something much more "legal"
than just an "ack" on a patch.  Please work with your corporate lawyers
for how to do this correctly.

> > Can you please get your lawyer to also sign off on this license change
> > patch, so that we know that you have their approval for this incase
> > there are questions about it in the future?
> > 
> I need to use the code in other projects that is not with GPL-2.0.

What project needs this code that you can not just base it off of your
original contribution instead?  That would not require any license
change of the kernel files, right?  Wouldn't that be easier than trying
to retain this license change over time as you will not be taking the
changes here into another project as well.

> Also, the license change is approved by Mediatek supervisor.

Great, get them to also sign-off on the patch please, along with your
lawyers, so that we know all is done correctly.

thanks,

greg k-h

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
