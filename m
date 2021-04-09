Return-Path: <SRS0=HbKG=JG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90DB2C43460
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Apr 2021 05:42:21 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 31AF961165
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Apr 2021 05:42:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 31AF961165
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=q3SHbfaVQX0avRff3FhcxfaOQeniBtYLedRxsnWYdTw=; b=i09TJyHV7lhss54ssoQYfYCDJ
	aGaodEMDvZocxNaSZLBYUwh5bZO1e+v2Z0Q1PPnxFqEMCnat3LYy2EEaQxXngSCVwn14Mk0GLxQ5W
	4UiS+7bBL2JZZZAoHsHO/3VGAhztfQ0sSq0wT0bU5bPcoDnsUqYj8/ED1h3f6XZF5jic9SG0t4sTf
	1kv0iDyAF+l8F851RpINEcq63938oL6K+PmTa3GiHgIPi7EOMwlcVAQzL7TeTXo+kzCyvwoDrfcye
	cYGwCLe6lXloWv58sDhbmbZ3jbl5ESqt+DD7x0gK0jswvhYEhxigLeLKy4SNF8+NAuJkzNU2HMVtX
	vHF3Tl9lQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUjtr-00AAvg-L5; Fri, 09 Apr 2021 05:41:51 +0000
Received: from muru.com ([72.249.23.125])
 by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
 id 1lUjrb-00AAbi-2i; Fri, 09 Apr 2021 05:39:31 +0000
Received: from atomide.com (localhost [127.0.0.1])
 by muru.com (Postfix) with ESMTPS id 1BF1C80E7;
 Fri,  9 Apr 2021 05:40:32 +0000 (UTC)
Date: Fri, 9 Apr 2021 08:39:18 +0300
From: Tony Lindgren <tony@atomide.com>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Mathias Nyman <mathias.nyman@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Len Brown <len.brown@intel.com>, Pavel Machek <pavel@ucw.cz>,
 "open list:ULTRA-WIDEBAND (UWB) SUBSYSTEM:" <linux-usb@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux PM <linux-pm@vger.kernel.org>,
 Tianping Fang <tianping.fang@mediatek.com>,
 Eddie Hung <eddie.hung@mediatek.com>, Ikjoon Jang <ikjn@chromium.org>,
 Nicolas Boichat <drinkcat@chromium.org>
Subject: Re: [PATCH 1/6] PM: runtime: enable wake irq after runtime_suspend
 hook called
Message-ID: <YG/ohhh3Tyet6InQ@atomide.com>
References: <1617874514-12282-1-git-send-email-chunfeng.yun@mediatek.com>
 <CAJZ5v0gGntbfnvAP5A491_hUh-JUuqZjZRdPPLwWJjnZRtemcQ@mail.gmail.com>
 <1617933211.12105.22.camel@mhfsdcap03>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1617933211.12105.22.camel@mhfsdcap03>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210409_063927_537510_A32B30F5 
X-CRM114-Status: GOOD (  16.45  )
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

* Chunfeng Yun <chunfeng.yun@mediatek.com> [210409 01:54]:
> On Thu, 2021-04-08 at 19:41 +0200, Rafael J. Wysocki wrote:
> > On Thu, Apr 8, 2021 at 11:35 AM Chunfeng Yun <chunfeng.yun@mediatek.com> wrote:
> > >
> > > When the dedicated wake irq is level trigger, enable it before
> > > calling runtime_suspend, will trigger an interrupt.
> > >
> > > e.g.
> > > for a low level trigger type, it's low level at running time (0),
> > > and becomes high level when enters suspend (runtime_suspend (1) is
> > > called), a wakeup signal at (2) make it become low level, wake irq
> > > will be triggered.
> > >
> > >                 ------------------
> > >                |           ^     ^|
> > > ----------------           |     | --------------
> > >  |<---(0)--->|<--(1)--|   (3)   (2)    (4)
> > >
> > > if we enable the wake irq before calling runtime_suspend during (0),
> > > an interrupt will arise, it causes resume immediately;
> > 
> > But that's necessary to avoid missing a wakeup interrupt, isn't it?
> That's also what I worry about.

Yeah sounds like this patch will lead into missed wakeirqs.

Regards,

Tony

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
