Return-Path: <SRS0=HbKG=JG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84989C433ED
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Apr 2021 08:46:34 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 21D6F61025
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Apr 2021 08:46:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 21D6F61025
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:CC:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ciqLESvdq7cX0cRCI5OI4Xe4svgVSa8LUyAejD/2B2M=; b=UC52CpegqTkH3Ucw8uCG08pO1
	09YsOzQZlmGQXW8QkufSuaa+WzBbTUdvYBkE8iY+IzktPNKS/pRRESin0jXnDrNmbKfCIrE92OHa4
	io4itUo42mIl1GecTvw2/DHQPqFlJmjXcal4uRfrYGq5dIhtYC5DCnMfEKuatVk9dPAvhV/yRCJYH
	V4NeWU1YwioqU5yl0/S83yYlDy8AF4FizQFTE1cJ71YlmjTZkImYfRxEG3uNNg5MZY27vAyfBU/FC
	bAi7EoURaRKX54k7d6aj0gp7KQKoPeHq/Tr7gxJJg7oPS/+p3oHiuIrornzhnOQRcsCGpg0dJ1/xw
	2dwwhVgmQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUmmS-0005nw-Ik; Fri, 09 Apr 2021 08:46:20 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUmmN-0005mg-HP; Fri, 09 Apr 2021 08:46:17 +0000
X-UUID: bf10428b414d4b37a9ceba20faed3c9d-20210409
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=yIa3uM6G22r1aP39OoNbC6ZO8rrtqiWMh2OKTwN3Djs=; 
 b=BE6Gdk0iN6jpc47s3NlXoEJXarshUY+u1lBRIJOSCQcXegxrrOVSJOChN2WaQEGDPRVEkDR5nIYMxi9oVris1xYT4CddEUn+tXvMc2DHxODxwPCxnXsz3mp5olNdEdEvt78VbKnoP6ra3HaQPVRSXw39PlErZTTN8B5eosBvmLk=;
X-UUID: bf10428b414d4b37a9ceba20faed3c9d-20210409
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2036667692; Fri, 09 Apr 2021 01:46:12 -0700
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 9 Apr 2021 01:36:08 -0700
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 9 Apr 2021 16:36:03 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 9 Apr 2021 16:36:02 +0800
Message-ID: <1617957362.12105.27.camel@mhfsdcap03>
Subject: Re: [PATCH 1/6] PM: runtime: enable wake irq after runtime_suspend
 hook called
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Tony Lindgren <tony@atomide.com>
CC: "Rafael J. Wysocki" <rafael@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
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
Date: Fri, 9 Apr 2021 16:36:02 +0800
In-Reply-To: <YG/ohhh3Tyet6InQ@atomide.com>
References: <1617874514-12282-1-git-send-email-chunfeng.yun@mediatek.com>
 <CAJZ5v0gGntbfnvAP5A491_hUh-JUuqZjZRdPPLwWJjnZRtemcQ@mail.gmail.com>
 <1617933211.12105.22.camel@mhfsdcap03> <YG/ohhh3Tyet6InQ@atomide.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: F1995856564853C53D5FE1D9127019BAA0A4EEA5D2AC64D5A3BD1FE537E9ECB92000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210409_094616_039203_95C0D208 
X-CRM114-Status: GOOD (  18.44  )
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

On Fri, 2021-04-09 at 08:39 +0300, Tony Lindgren wrote:
> * Chunfeng Yun <chunfeng.yun@mediatek.com> [210409 01:54]:
> > On Thu, 2021-04-08 at 19:41 +0200, Rafael J. Wysocki wrote:
> > > On Thu, Apr 8, 2021 at 11:35 AM Chunfeng Yun <chunfeng.yun@mediatek.com> wrote:
> > > >
> > > > When the dedicated wake irq is level trigger, enable it before
> > > > calling runtime_suspend, will trigger an interrupt.
> > > >
> > > > e.g.
> > > > for a low level trigger type, it's low level at running time (0),
> > > > and becomes high level when enters suspend (runtime_suspend (1) is
> > > > called), a wakeup signal at (2) make it become low level, wake irq
> > > > will be triggered.
> > > >
> > > >                 ------------------
> > > >                |           ^     ^|
> > > > ----------------           |     | --------------
> > > >  |<---(0)--->|<--(1)--|   (3)   (2)    (4)
> > > >
> > > > if we enable the wake irq before calling runtime_suspend during (0),
> > > > an interrupt will arise, it causes resume immediately;
> > > 
> > > But that's necessary to avoid missing a wakeup interrupt, isn't it?
> > That's also what I worry about.
> 
> Yeah sounds like this patch will lead into missed wakeirqs.
If miss level trigger wakeirqs, that means HW doesn't latch it? is it HW
limitation?
> 
> Regards,
> 
> Tony

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
