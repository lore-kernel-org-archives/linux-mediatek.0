Return-Path: <SRS0=HbKG=JG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF9EEC43461
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Apr 2021 11:15:54 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6D5BC610E7
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Apr 2021 11:15:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6D5BC610E7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=IqnJGI4+4GD7itJF1Bn5eo2xweKRB1vm/IfARmvAUUE=; b=XRuepEgoJgmc8BXuTEEKq5Ba+
	PfAQ0VslSeRtBaBxZYoNuffWsCdDw+z2fIeeDVmCknkoZUbYR3YKxGdSMZDtFaFvG7GcpXCU0tGES
	yyj0vpUhgS5e++4ExnyZZLqW5uGzy1w25iHKzQb/erREPp009IHpMjAgHIIb+sAb2c3Roe51xGlvU
	F526lPtRrbAy9US4z8lE3uMBSlXxfHl4+qAynurYvnJeqwHBSr7hUeAcytuya/PAUThmZa9zb+kqT
	bzafbDnAL82Su0WQGF1wL4qau/OGgRbxv3nzGbeOPI1O5ncsYlZ/Cj6CKsEDzlBu+o7d4D6iPOxZb
	cWJMofLsQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUp6u-000XTx-1X; Fri, 09 Apr 2021 11:15:36 +0000
Received: from mail-oi1-f178.google.com ([209.85.167.178])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUp6E-000XLs-Ad; Fri, 09 Apr 2021 11:14:56 +0000
Received: by mail-oi1-f178.google.com with SMTP id k25so5403824oic.4;
 Fri, 09 Apr 2021 04:14:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Rxjs0bOzud5jPgrtCrFonjn8TrOn+6BSTDUNWNa5VkA=;
 b=JlIbxGB+J75IffAW/01qQ9LkrSbyGlTtV05pBU9KyyFhfr0XHNHlcfqVMYFhb9fA+m
 JdnVK7MZ+jv7MSbvzG6Jn78dy4oklM0sAtYx0B7zaALW22TOnZKg6wpPB/I7c8cnibKa
 KYYXMv5Tckcm5dlBqfCv06gASWhx38qmi64ZDr5Xwmyz6v4UQwXZ03uh6GNTb9MmKACi
 IEE+V4tNX4S26HSb7cumu5Ysdj/cOOJvm2zzcnAxCEh0CU4yqv3651KXhAETCu/jB5dh
 5+LEEIJun180nvEYdHPYHXXyYhlqd1VORV6LiPzcEtSxLPj8Kc7qkRvVwTqvcQrn7yGu
 du5Q==
X-Gm-Message-State: AOAM533VON+4glDJc9JXCZe2XyHCgal5ntnq9TgbsnbVUR9lb4JNueAG
 6sc+neyUi75DbWfwWYbs6FBNyyGYc1O/BhJSOBuUHyzi
X-Google-Smtp-Source: ABdhPJzqQwV2RLtxpvy3bdjEZbTiGwM6R2VqAkJLIvDpOTRgfz1/jDCWilo+43fl261e+3ylK2QTCgBnzn1M84H/KAA=
X-Received: by 2002:aca:5fc3:: with SMTP id t186mr9286785oib.69.1617966892336; 
 Fri, 09 Apr 2021 04:14:52 -0700 (PDT)
MIME-Version: 1.0
References: <1617874514-12282-1-git-send-email-chunfeng.yun@mediatek.com>
 <CAJZ5v0gGntbfnvAP5A491_hUh-JUuqZjZRdPPLwWJjnZRtemcQ@mail.gmail.com>
 <1617933211.12105.22.camel@mhfsdcap03> <YG/ohhh3Tyet6InQ@atomide.com>
 <1617957362.12105.27.camel@mhfsdcap03>
In-Reply-To: <1617957362.12105.27.camel@mhfsdcap03>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Fri, 9 Apr 2021 13:14:40 +0200
Message-ID: <CAJZ5v0ioobLt5aEm8TAcPKgJiL13OJ7KqTeJmcQCuVp8ALxBmw@mail.gmail.com>
Subject: Re: [PATCH 1/6] PM: runtime: enable wake irq after runtime_suspend
 hook called
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Tony Lindgren <tony@atomide.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, Mathias Nyman <mathias.nyman@intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, Len Brown <len.brown@intel.com>,
 Pavel Machek <pavel@ucw.cz>, 
 "open list:ULTRA-WIDEBAND (UWB) SUBSYSTEM:" <linux-usb@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux PM <linux-pm@vger.kernel.org>, 
 Tianping Fang <tianping.fang@mediatek.com>,
 Eddie Hung <eddie.hung@mediatek.com>, 
 Ikjoon Jang <ikjn@chromium.org>, Nicolas Boichat <drinkcat@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210409_121454_487615_2AE4E92E 
X-CRM114-Status: GOOD (  23.05  )
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

On Fri, Apr 9, 2021 at 10:36 AM Chunfeng Yun <chunfeng.yun@mediatek.com> wrote:
>
> On Fri, 2021-04-09 at 08:39 +0300, Tony Lindgren wrote:
> > * Chunfeng Yun <chunfeng.yun@mediatek.com> [210409 01:54]:
> > > On Thu, 2021-04-08 at 19:41 +0200, Rafael J. Wysocki wrote:
> > > > On Thu, Apr 8, 2021 at 11:35 AM Chunfeng Yun <chunfeng.yun@mediatek.com> wrote:
> > > > >
> > > > > When the dedicated wake irq is level trigger, enable it before
> > > > > calling runtime_suspend, will trigger an interrupt.
> > > > >
> > > > > e.g.
> > > > > for a low level trigger type, it's low level at running time (0),
> > > > > and becomes high level when enters suspend (runtime_suspend (1) is
> > > > > called), a wakeup signal at (2) make it become low level, wake irq
> > > > > will be triggered.
> > > > >
> > > > >                 ------------------
> > > > >                |           ^     ^|
> > > > > ----------------           |     | --------------
> > > > >  |<---(0)--->|<--(1)--|   (3)   (2)    (4)
> > > > >
> > > > > if we enable the wake irq before calling runtime_suspend during (0),
> > > > > an interrupt will arise, it causes resume immediately;
> > > >
> > > > But that's necessary to avoid missing a wakeup interrupt, isn't it?
> > > That's also what I worry about.
> >
> > Yeah sounds like this patch will lead into missed wakeirqs.
> If miss level trigger wakeirqs, that means HW doesn't latch it? is it HW
> limitation?

If it's level-triggered, it won't be missed, but then it is just
pointless to suspend the device when wakeup is being signaled in the
first place.

I'm not sure if I understand the underlying problem correctly.  Is it
about addressing spurious wakeups?

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
