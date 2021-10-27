Return-Path: <SRS0=3cxa=PP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D38EEC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Oct 2021 19:26:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A2D90601FC
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Oct 2021 19:26:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A2D90601FC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Bx/jJQ0N9W7IjLOGw9OVKppj67mYOV300jAdUAUQ3DE=; b=rWmdDM8UthkmJW
	/DmwqeEAID9Rzh2319CbtTSJ6QwJVnPcYsomdjoHBwYSsWjXvaXw1lXvLpyAym2vRgY4raGfdYeWM
	pZX9EPDK6XXBt8mrESQ3Vf8vzFXgRzdq912FwQIRb3O04VqdLN0eoytG6NVu4CcV3Th2Jod1X4dJJ
	lt9yJCmSsBB6Go2vJhFYsO12vrrYixdDgZLfRZf8WSHfjG6StSaFxsbwKrOA1Nxvl8FxivuQf5uho
	ORvr/haCzFtY06hjngeXLjOVsSJAWof638iASEysMVk0xj5hKDZ6GpOcdD2LO90d/ovIaX96Yh7EP
	h7WomHkf5uri/LnA41kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfoZ7-005vCI-5X; Wed, 27 Oct 2021 19:26:25 +0000
Received: from mail-yb1-f176.google.com ([209.85.219.176])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfoFi-005n3L-EV; Wed, 27 Oct 2021 19:06:24 +0000
Received: by mail-yb1-f176.google.com with SMTP id d204so8917600ybb.4;
 Wed, 27 Oct 2021 12:06:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=twYyXM54JZtknY6kSlEQB2YIbHREslZxx1VWjQb9rKA=;
 b=VhRKTVnSoVwTjPFH9r9AYNubajwJi3l7Pheh33HNQMU58PrIMBFL23U71aS/mgzEEz
 BdBE22KRaNVgAEp3/E8b2eOs3DNq+ga3Tvm9WiWWy7xz/6j68BHDV9vX326W00Bj9/55
 JTtQ9+MWxCaRgI3YhY+YB3fH9oNcz241d+WZ35QvRmQSP4fK9dXmfSAfO0joJdBIxZMW
 pDKf5lxEuTdGSVCtJ52g3tj6nR/s83q86Dv7nIEmGEr7eTLbDSpR++IlqeC2Kw5+cj9Y
 5/dHVKETrBuNQgprP0ZWdD9xcl0FRWhGK5gauGLyEKEfybM0l5NUcAWt5ovnF3tgtchy
 pT9g==
X-Gm-Message-State: AOAM5321amkyfCpMO+pY0F8qSKcB12IhB33vy8XZfk0pnQIU9BFwg2hP
 jISaCOpo01VJ01lwf+bIcPbUN6OAVgDO1AWKu9oVy2lV
X-Google-Smtp-Source: ABdhPJxwyoNvTjXEvWSwEzQkvS3twTW+fZkOH2aK+Tp8JKa7djpi/yo4glrydaOg6ed57ahTO8qmsT3UR7s8ZIDHGmY=
X-Received: by 2002:a05:6830:1af0:: with SMTP id
 c16mr25814378otd.16.1635361244953; 
 Wed, 27 Oct 2021 12:00:44 -0700 (PDT)
MIME-Version: 1.0
References: <20211025070155.2995-1-chunfeng.yun@mediatek.com>
 <CAJZ5v0gb6vN9kHeQbgjRQXvOCNaFK8ur7bLDeAVjDqdT2=a+-g@mail.gmail.com>
 <fba3246fbc600f06eb40e90283c1cd51bc259804.camel@mediatek.com>
In-Reply-To: <fba3246fbc600f06eb40e90283c1cd51bc259804.camel@mediatek.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 27 Oct 2021 21:00:34 +0200
Message-ID: <CAJZ5v0hnrr+ZidUMkN837utcKc6otmqaZ+uTX_xMukTUrdHLDQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] PM / wakeirq: support enabling wake-up irq after
 runtime_suspend called
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <len.brown@intel.com>,
 Pavel Machek <pavel@ucw.cz>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mathias Nyman <mathias.nyman@intel.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Linux PM <linux-pm@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 "open list:ULTRA-WIDEBAND (UWB) SUBSYSTEM:" <linux-usb@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>, 
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211027_120622_514339_A2BE763F 
X-CRM114-Status: GOOD (  27.80  )
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

On Wed, Oct 27, 2021 at 11:34 AM Chunfeng Yun <chunfeng.yun@mediatek.com> wrote:
>
> On Tue, 2021-10-26 at 17:39 +0200, Rafael J. Wysocki wrote:
> > On Mon, Oct 25, 2021 at 9:02 AM Chunfeng Yun <
> > chunfeng.yun@mediatek.com> wrote:
> > >
> > > When the dedicated wake IRQ is level trigger, and it uses the
> > > device's low-power status as the wakeup source, that means if the
> > > device is not in low-power state, the wake IRQ will be triggered
> > > if enabled; For this case, need enable the wake IRQ after running
> > > the device's ->runtime_suspend() which make it enter low-power
> > > state.
> > >
> > > e.g.
> > > Assume the wake IRQ is a low level trigger type, and the wakeup
> > > signal comes from the low-power status of the device.
> > > The wakeup signal is low level at running time (0), and becomes
> > > high level when the device enters low-power state (runtime_suspend
> > > (1) is called), a wakeup event at (2) make the device exit low-
> > > power
> > > state, then the wakeup signal also becomes low level.
> > >
> > >                 ------------------
> > >                |           ^     ^|
> > > ----------------           |     | --------------
> > >  |<---(0)--->|<--(1)--|   (3)   (2)    (4)
> > >
> > > if enable the wake IRQ before running runtime_suspend during (0),
> > > a wake IRQ will arise, it causes resume immediately;
> > > it works if enable wake IRQ ( e.g. at (3) or (4)) after running
> > > ->runtime_suspend().
> > >
> > > This patch introduces a new status WAKE_IRQ_DEDICATED_REVERSE to
> > > optionally support enabling wake IRQ after running
> > > ->runtime_suspend().
> > >
> > > Suggested-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> > > Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> >
> > I don't really have anything to add regarding the code.
> >
> > The kerneldoc comments could be improved, but I can take care of this
> > when applying the patch.
> Ok, thanks
> >
> > Please collect ACKs for the remaining 2 patches in the series and I
> > will pick up all three.
> The files (mtu3_plat.c, xhci-mtk.c) modified by other 2 patches are
> maintained by myself, please pick up them, thanks a lot.

OK, applied as 5.16 material, thanks!

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
