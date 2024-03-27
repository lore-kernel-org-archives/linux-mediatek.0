Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E83E8C47DD9
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Mar 2024 16:58:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yUltN/NJxMhxZV1CH62BOvzy406AgQtlnwGFiPeOm1M=; b=0F8guu0Jrbhbk9gysFEilH70Eg
	Bdxc5WMqz0Xnn6x+tnqUK7H9FyDX+xQ8rAqb7iMZXJyqzKahYM46MWDKrS28ioAn8txmgRp6VmiwF
	DqaRbiJqF69JvW6ISmFt0GZezDR+Q9XXiavyCKhy2/zDoolEgBjH6IEL0ylkN4Rjm06iOX9o0PlBj
	gNQxfIz6UFXn671z9iXZpayVBHIcmz479c5ySzeWr2oH79vdrM5ObV8XWr+GweJc6gfvAeaH+n8ZO
	fVO5sfL73pIleyNJlyHxkfjQgr47pYi38Dk01grASjm29ItqgV7Q0IA0H8tZBdn7tTh0himrWyVlk
	+hmMoHYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpWbg-0000000AB1n-1sdH;
	Wed, 27 Mar 2024 16:58:32 +0000
Received: from mail-vs1-xe2c.google.com ([2607:f8b0:4864:20::e2c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpWba-0000000AAyb-1yKY;
	Wed, 27 Mar 2024 16:58:28 +0000
Received: by mail-vs1-xe2c.google.com with SMTP id ada2fe7eead31-476794adf30so2697025137.1;
        Wed, 27 Mar 2024 09:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711558704; x=1712163504; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yUltN/NJxMhxZV1CH62BOvzy406AgQtlnwGFiPeOm1M=;
        b=kZrmW0IbDwugBaZwJOayleF9Ui0b2DaMZSy+RU/EQ3LeBHyur0puy0JLgP4hGPEyvH
         O4Hn7c0qTnGrB5+0y6GAq4zs/XjFFH9xCK6AacPGSGHtMmwUoEha40XfGWu+L6N03qon
         aQ8hT9FBQhUKFg7FVwt7saimKAwV/el1i3MjG0Snwme1KiuFH3rEQdPwDG8rzpvlKSw6
         ZB4293nR5+Tphnu4ZNclD5FSDw6WLuokCyOQGvRBi0lJMYY/10OjG0BJFiEgRdtYGaLI
         Fd2WuueZk2xdVr2oJVQlVqbkXjjBwJsA/JUxIhbL1zopzZA1PNwcW10Iwc2wzWl/NtTT
         6Bew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711558704; x=1712163504;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yUltN/NJxMhxZV1CH62BOvzy406AgQtlnwGFiPeOm1M=;
        b=ndiDUDcWfCHnADz43mVu4XNJjeKrJr1MOPrf+FiTDvwl7ki0vB/sRprstlb79Cz2RT
         Lz/Ru5s9vfDzdSfvc6UY6CEWpJHb0zTMDt6kWsEZ0RPVYBxUIDxjFLzzeLYP2jDWoObp
         yFDSdHzCIOFf5NkVu26GtbShD1peDd/zBHagX0MGyZloHnzTG1/20kEEZMF6mmGTDXHf
         NkZuMiJCsAIUH/BRELo2R9Ax0LLYNku5retv7Xv+shw/Njotjer0epUoj+rHSS+8JVwT
         KqkUOl+B92BYt53CgFTXmDL8me5eUKB7ZyU1Fs9oCuC8shYflZgfTwRfwmxdJCOmyXGV
         Ffnw==
X-Forwarded-Encrypted: i=1; AJvYcCWqE4yZDPg+upDrREby8h0Zcfp+IS0PTj4TEwPWZTsdakTvnAmk8YvCM0LbbMoUZuu7Bm6+T0u/HWYLRr652XYAEz6a9TwlCO3fkHsWXsjjsNZRho5KBGAs4q6VWzwbGfaBb1meY/AZgpKMuU+BpRHTGrM6k1tChAkQ2xB7vcSF4XLZTnGtwhNz8Y6Hh+534yYJkSDQWENXOdibmXj9jg/B/91sCaWhf7Pcd8gopk1N7s/0AhNZCGjAVXSwOXPR/Xp8CwBA4Qp5B15tc2KIu8cgd0bPuv2SUIMV/If7PhuRunhH
X-Gm-Message-State: AOJu0Yyi7f4sGW477N9LY4uXWjgWQ+Ux+epfrA6UkqCFODGlMVgC3RtI
	JCFJfGZ5gmEXABWSAZep8aXdWRe5x95LXPzhCoZOB0gqX1B9hz2kRCKGaWJM6u9RcpYFKwZDT7a
	l5V7cHuiaMjZpIIDs1pHLJVxvwV8=
X-Google-Smtp-Source: AGHT+IG2+7fcvBBedZik6uQF+4M2q3ObjFc26qAotYqTJVzVn8pG6NuXX7LEd77qXX8Tn8MdeN0ijCK67x3Q8xGLlB4=
X-Received: by 2002:a05:6102:3b83:b0:472:64aa:403f with SMTP id
 z3-20020a0561023b8300b0047264aa403fmr602964vsu.26.1711558703814; Wed, 27 Mar
 2024 09:58:23 -0700 (PDT)
MIME-Version: 1.0
References: <20240327160314.9982-1-apais@linux.microsoft.com>
 <20240327160314.9982-5-apais@linux.microsoft.com> <2024032753-probable-blatancy-80bf@gregkh>
In-Reply-To: <2024032753-probable-blatancy-80bf@gregkh>
From: Allen <allen.lkml@gmail.com>
Date: Wed, 27 Mar 2024 09:58:12 -0700
Message-ID: <CAOMdWSLipPfm3OZTpjZz4uF4M+E_8QAoTeMcKBXawLnkTQx6Jg@mail.gmail.com>
Subject: Re: [PATCH 4/9] USB: Convert from tasklet to BH workqueue
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Allen Pais <apais@linux.microsoft.com>, linux-kernel@vger.kernel.org, tj@kernel.org, 
	keescook@chromium.org, vkoul@kernel.org, marcan@marcan.st, sven@svenpeter.dev, 
	florian.fainelli@broadcom.com, rjui@broadcom.com, sbranden@broadcom.com, 
	paul@crapouillou.net, Eugeniy.Paltsev@synopsys.com, 
	manivannan.sadhasivam@linaro.org, vireshk@kernel.org, Frank.Li@nxp.com, 
	leoyang.li@nxp.com, zw@zh-kernel.org, wangzhou1@hisilicon.com, 
	haijie1@huawei.com, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	sean.wang@mediatek.com, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, afaerber@suse.de, 
	logang@deltatee.com, daniel@zonque.org, haojian.zhuang@gmail.com, 
	robert.jarzmik@free.fr, andersson@kernel.org, konrad.dybcio@linaro.org, 
	orsonzhai@gmail.com, baolin.wang@linux.alibaba.com, zhang.lyra@gmail.com, 
	patrice.chotard@foss.st.com, linus.walleij@linaro.org, wens@csie.org, 
	jernej.skrabec@gmail.com, peter.ujfalusi@gmail.com, kys@microsoft.com, 
	haiyangz@microsoft.com, wei.liu@kernel.org, decui@microsoft.com, 
	jassisinghbrar@gmail.com, mchehab@kernel.org, maintainers@bluecherrydvr.com, 
	aubin.constans@microchip.com, ulf.hansson@linaro.org, manuel.lauss@gmail.com, 
	mirq-linux@rere.qmqm.pl, jh80.chung@samsung.com, oakad@yahoo.com, 
	hayashi.kunihiko@socionext.com, mhiramat@kernel.org, brucechang@via.com.tw, 
	HaraldWelte@viatech.com, pierre@ossman.eu, duncan.sands@free.fr, 
	stern@rowland.harvard.edu, oneukum@suse.com, 
	openipmi-developer@lists.sourceforge.net, dmaengine@vger.kernel.org, 
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-rpi-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	imx@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	linux-mediatek@lists.infradead.org, linux-actions@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
	linux-hyperv@vger.kernel.org, linux-rdma@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-mmc@vger.kernel.org, 
	linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-s390@vger.kernel.org, netdev@vger.kernel.org, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240327_095826_601674_53C13E3A 
X-CRM114-Status: GOOD (  23.72  )
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

> > The only generic interface to execute asynchronously in the BH context is
> > tasklet; however, it's marked deprecated and has some design flaws. To
> > replace tasklets, BH workqueue support was recently added. A BH workqueue
> > behaves similarly to regular workqueues except that the queued work items
> > are executed in the BH context.
> >
> > This patch converts drivers/infiniband/* from tasklet to BH workqueue.
>
> No it does not, I think your changelog is wrong :(

Whoops, sorry about that. I messed up the commit messages. I will fix it in v2.
>
> >
> > Based on the work done by Tejun Heo <tj@kernel.org>
> > Branch: https://git.kernel.org/pub/scm/linux/kernel/git/tj/wq.git for-6.10
> >
> > Signed-off-by: Allen Pais <allen.lkml@gmail.com>
> > ---
> >  drivers/usb/atm/usbatm.c            | 55 +++++++++++++++--------------
> >  drivers/usb/atm/usbatm.h            |  3 +-
> >  drivers/usb/core/hcd.c              | 22 ++++++------
> >  drivers/usb/gadget/udc/fsl_qe_udc.c | 21 +++++------
> >  drivers/usb/gadget/udc/fsl_qe_udc.h |  4 +--
> >  drivers/usb/host/ehci-sched.c       |  2 +-
> >  drivers/usb/host/fhci-hcd.c         |  3 +-
> >  drivers/usb/host/fhci-sched.c       | 10 +++---
> >  drivers/usb/host/fhci.h             |  5 +--
> >  drivers/usb/host/xhci-dbgcap.h      |  3 +-
> >  drivers/usb/host/xhci-dbgtty.c      | 15 ++++----
> >  include/linux/usb/cdc_ncm.h         |  2 +-
> >  include/linux/usb/usbnet.h          |  2 +-
> >  13 files changed, 76 insertions(+), 71 deletions(-)
> >
> > diff --git a/drivers/usb/atm/usbatm.c b/drivers/usb/atm/usbatm.c
> > index 2da6615fbb6f..74849f24e52e 100644
> > --- a/drivers/usb/atm/usbatm.c
> > +++ b/drivers/usb/atm/usbatm.c
> > @@ -17,7 +17,7 @@
> >   *           - Removed the limit on the number of devices
> >   *           - Module now autoloads on device plugin
> >   *           - Merged relevant parts of sarlib
> > - *           - Replaced the kernel thread with a tasklet
> > + *           - Replaced the kernel thread with a work
>
> a "work"?
 will fix the comments.

>
> >   *           - New packet transmission code
> >   *           - Changed proc file contents
> >   *           - Fixed all known SMP races
> > @@ -68,6 +68,7 @@
> >  #include <linux/wait.h>
> >  #include <linux/kthread.h>
> >  #include <linux/ratelimit.h>
> > +#include <linux/workqueue.h>
> >
> >  #ifdef VERBOSE_DEBUG
> >  static int usbatm_print_packet(struct usbatm_data *instance, const unsigned char *data, int len);
> > @@ -249,7 +250,7 @@ static void usbatm_complete(struct urb *urb)
> >       /* vdbg("%s: urb 0x%p, status %d, actual_length %d",
> >            __func__, urb, status, urb->actual_length); */
> >
> > -     /* Can be invoked from task context, protect against interrupts */
> > +     /* Can be invoked from work context, protect against interrupts */
>
> "workqueue"?  This too seems wrong.
>
> Same for other comment changes in this patch.

Thanks for the quick review, I will fix the comments and send out v2.

- Alle

> thanks,
>
> greg k-h
>

