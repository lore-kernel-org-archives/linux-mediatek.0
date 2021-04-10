Return-Path: <SRS0=+aVJ=JH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADFF5C433ED
	for <linux-mediatek@archiver.kernel.org>; Sat, 10 Apr 2021 01:56:30 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 26391611F1
	for <linux-mediatek@archiver.kernel.org>; Sat, 10 Apr 2021 01:56:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 26391611F1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:CC:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7k5GQNMCOs8UJNISjMDistWiTH3WU+prcI/7sLnT+pA=; b=YV/14j+1Bf/BNZ7FsjMwg/XPr
	L8ETwgg0xc8V6gsWZ2S/2yyJpMh1Q/l+nLyu6DOhikNcAJAwA53eiIUmKwI21L7bIuQUAl+JhhtNl
	7/ff1EjUiDXYV1coU31wvKYhj1d6YtqKUrW2kca9dZ2JaFYrqzcMQh6WOJixrMtUBm+CCdVsubF0V
	SUTvUoq0EYbKnyi6NjR7p5T5GRUbcPskL93vR8Xv5Rnh9rQ7ESuZwaZE08lAvzbGD8wcE5lNA7juw
	NEORWv++t8RoyYyrR6QxvlR+dMWHomRE2oudZDsI/+Ka9SQkG3LBNTsG3Ciok3tH6U2soo0egG9yn
	/w1bW2PJw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lV2r6-001v2G-HF; Sat, 10 Apr 2021 01:56:12 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lV2pT-001urX-P0; Sat, 10 Apr 2021 01:55:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=f+eHY1cO25QfYDw7qlA9DNcwvvrIIv/cae1oflaNgrU=; b=aqgTPFVul1KRHQwBybnHklFmpC
 GvPz0n1bt29EMJ9FFUtaeH6uAUAE7QHiOI0TTeLbRharCCGlp1zGx2+wtjN4k4tVI7y45CUP2TXIR
 dgVqipHC3UJQzppRhcMXvRUmlOIVlgMFZsHuNHAYNDn3581KFojiHn6AwUmFANzX9l+tgMKwWsM3J
 sU7xQe7EUKG2yG6R4im90W1loEkYVT7pMguloSQMvZBLys0UyP+Jz6zh+PHXIAegGK0ZlbfnXbheq
 IVooSVg9CNPTt91xizw/mbhuTjp4cOUzWkz16ZOgcMLVJLpu9KtC6eSquLPhFihlJJycgJbbZr9Pd
 OJvtLy5A==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lV2pQ-004u1G-6q; Sat, 10 Apr 2021 01:54:29 +0000
X-UUID: 85436a6fcd234605bd18ec7ef9642ca0-20210409
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=f+eHY1cO25QfYDw7qlA9DNcwvvrIIv/cae1oflaNgrU=; 
 b=IsSwYmxPmfQ41pHOH1pIzZ7N5A2/f9bvVswfYyhhvwJVZzs2OguEBVfkH8OxVq9YFzdR3e7UHTFGET7KTsnq0Z/k4Wr2e5xVh7To2ktnSkLx5P49ARyjDeG2Ni7guNdS3uE6EtwFgnJdPZXl5/hP5rV9XwsuQQNShiIY7h/Ak0U=;
X-UUID: 85436a6fcd234605bd18ec7ef9642ca0-20210409
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1389341751; Fri, 09 Apr 2021 18:54:26 -0700
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 9 Apr 2021 18:44:24 -0700
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31N2.mediatek.inc
 (172.27.4.87) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Sat, 10 Apr 2021 09:44:22 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 10 Apr 2021 09:44:21 +0800
Message-ID: <1618019061.12105.48.camel@mhfsdcap03>
Subject: Re: [PATCH 1/6] PM: runtime: enable wake irq after runtime_suspend
 hook called
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>
CC: Tony Lindgren <tony@atomide.com>, Rob Herring <robh+dt@kernel.org>,
 Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, Len Brown <len.brown@intel.com>,
 Pavel Machek <pavel@ucw.cz>, "open list:ULTRA-WIDEBAND (UWB) SUBSYSTEM:"
 <linux-usb@vger.kernel.org>, Linux ARM
 <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC..."
 <linux-mediatek@lists.infradead.org>, "open list:OPEN FIRMWARE AND FLATTENED
 DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "Linux Kernel Mailing
 List" <linux-kernel@vger.kernel.org>, Linux PM <linux-pm@vger.kernel.org>,
 Tianping Fang <tianping.fang@mediatek.com>, Eddie Hung
 <eddie.hung@mediatek.com>, Ikjoon Jang <ikjn@chromium.org>, Nicolas Boichat
 <drinkcat@chromium.org>
Date: Sat, 10 Apr 2021 09:44:21 +0800
In-Reply-To: <CAJZ5v0ioobLt5aEm8TAcPKgJiL13OJ7KqTeJmcQCuVp8ALxBmw@mail.gmail.com>
References: <1617874514-12282-1-git-send-email-chunfeng.yun@mediatek.com>
 <CAJZ5v0gGntbfnvAP5A491_hUh-JUuqZjZRdPPLwWJjnZRtemcQ@mail.gmail.com>
 <1617933211.12105.22.camel@mhfsdcap03> <YG/ohhh3Tyet6InQ@atomide.com>
 <1617957362.12105.27.camel@mhfsdcap03>
 <CAJZ5v0ioobLt5aEm8TAcPKgJiL13OJ7KqTeJmcQCuVp8ALxBmw@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 7AC3D9FEF60E5C1132401E888149897F7B3B859953E6EA0B57D85E51DFAC66AD2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210409_185428_281443_3B9F08F7 
X-CRM114-Status: GOOD (  25.17  )
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

On Fri, 2021-04-09 at 13:14 +0200, Rafael J. Wysocki wrote:
> On Fri, Apr 9, 2021 at 10:36 AM Chunfeng Yun <chunfeng.yun@mediatek.com> wrote:
> >
> > On Fri, 2021-04-09 at 08:39 +0300, Tony Lindgren wrote:
> > > * Chunfeng Yun <chunfeng.yun@mediatek.com> [210409 01:54]:
> > > > On Thu, 2021-04-08 at 19:41 +0200, Rafael J. Wysocki wrote:
> > > > > On Thu, Apr 8, 2021 at 11:35 AM Chunfeng Yun <chunfeng.yun@mediatek.com> wrote:
> > > > > >
> > > > > > When the dedicated wake irq is level trigger, enable it before
> > > > > > calling runtime_suspend, will trigger an interrupt.
> > > > > >
> > > > > > e.g.
> > > > > > for a low level trigger type, it's low level at running time (0),
> > > > > > and becomes high level when enters suspend (runtime_suspend (1) is
> > > > > > called), a wakeup signal at (2) make it become low level, wake irq
> > > > > > will be triggered.
> > > > > >
> > > > > >                 ------------------
> > > > > >                |           ^     ^|
> > > > > > ----------------           |     | --------------
> > > > > >  |<---(0)--->|<--(1)--|   (3)   (2)    (4)
> > > > > >
> > > > > > if we enable the wake irq before calling runtime_suspend during (0),
> > > > > > an interrupt will arise, it causes resume immediately;
> > > > >
> > > > > But that's necessary to avoid missing a wakeup interrupt, isn't it?
> > > > That's also what I worry about.
> > >
> > > Yeah sounds like this patch will lead into missed wakeirqs.
> > If miss level trigger wakeirqs, that means HW doesn't latch it? is it HW
> > limitation?
> 
> If it's level-triggered, it won't be missed, but then it is just
> pointless to suspend the device when wakeup is being signaled in the
> first place.
Got it
> 
> I'm not sure if I understand the underlying problem correctly.  Is it
> about addressing spurious wakeups?
In fact, it's default value is the same as the wakeup signal, maybe the
above case, using level trigger, should be avoided, it is not clear and
causes confusion, as Ikjoon and Tony suggested, using falling edge type
is better.

Thanks a lot



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
