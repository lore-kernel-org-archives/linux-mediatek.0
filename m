Return-Path: <SRS0=uv63=QA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8568AC433F5
	for <linux-mediatek@archiver.kernel.org>; Sat, 13 Nov 2021 07:16:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3B52F60F36
	for <linux-mediatek@archiver.kernel.org>; Sat, 13 Nov 2021 07:16:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3B52F60F36
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:MIME-Version:References:
	In-Reply-To:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=+WrgvqBKgn7HneG2UUuX//YjBaqyPxU+C41kqJ5rEDQ=; b=nEaiB5UTCEhAssvymE+ngNdiI1
	uEeCW2r9TsMk6b52RhUJ53mLTUj4PAnsekNIWZisUp5H2d28lCQsMgOeZafbTxkAis4bl1oMyLYfN
	IN+RGuTk7CceMWv86bl9ew+/+ecnCiSCinQAyWKNkkVnRbELeBSJdvDibY3Y3SyK1yh1ihX4NeH07
	ZPXtsotmh6MxXBplCz220hAqR4gNvTU9VA8qUYC9Jj7z8B3cPomQO/QuXt4qVTTLDbX9IsuwOOsAW
	2jsmA5cZHSv3pHAiiP/AKApex6JMtoQ7n/ZyeC4bckNmDqs+6Nx3gp/hYazBzzgILF65RzurROaoj
	CRd0lGUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mlnH7-00CHYW-IB; Sat, 13 Nov 2021 07:16:33 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mlnH2-00CHXx-NK; Sat, 13 Nov 2021 07:16:31 +0000
X-UUID: 99daf14494394f8a9930361c07ff22c6-20211113
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Date:MIME-Version:Content-Type:References:In-Reply-To:CC:To:From:Subject:Message-ID;
 bh=f5bv2fIAVTo8g215AUeOscF0bRtQ+IqfCg8Dqh6s7F8=; 
 b=kdLZry4v7A8F7v6va2LFOcn8nyFJZyqIyDIPFeKtSNyA9UU0ROB9efM+Mth7E8hzhxMVeszYpSnmozXxL7Kx2qYzbPyr1qU6GAA79O93yZrvz8atfoHB64qyW+qArP1RSuXxQAmhl58l+R1Jirsy4TuM+5WeRzxnQZTjXCQ2yYA=;
X-UUID: 99daf14494394f8a9930361c07ff22c6-20211113
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 554433818; Sat, 13 Nov 2021 00:16:21 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 12 Nov 2021 23:16:19 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 13 Nov 2021 15:16:18 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 13 Nov 2021 15:16:17 +0800
Message-ID: <6465d7110c8d7ecaec5aa48d9f45217f1ea0843b.camel@mediatek.com>
Subject: Re: [PATCH v4 1/3] PM / wakeirq: support enabling wake-up irq
 after runtime_suspend called
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>
CC: Len Brown <len.brown@intel.com>, Pavel Machek <pavel@ucw.cz>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>, Mathias Nyman
 <mathias.nyman@intel.com>, Matthias Brugger <matthias.bgg@gmail.com>, "Linux
 PM" <linux-pm@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, "open list:ULTRA-WIDEBAND (UWB) SUBSYSTEM:"
 <linux-usb@vger.kernel.org>, Linux ARM
 <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC..."
 <linux-mediatek@lists.infradead.org>, "Rafael J . Wysocki"
 <rafael.j.wysocki@intel.com>
In-Reply-To: <CAJZ5v0gb6vN9kHeQbgjRQXvOCNaFK8ur7bLDeAVjDqdT2=a+-g@mail.gmail.com>
References: <20211025070155.2995-1-chunfeng.yun@mediatek.com>
 <CAJZ5v0gb6vN9kHeQbgjRQXvOCNaFK8ur7bLDeAVjDqdT2=a+-g@mail.gmail.com>
MIME-Version: 1.0
Date: Wed, 27 Oct 2021 17:29:52 +0800
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211112_231628_790945_71146D25 
X-CRM114-Status: GOOD (  33.82  )
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

On Tue, 2021-10-26 at 17:39 +0200, Rafael J. Wysocki wrote:
> On Mon, Oct 25, 2021 at 9:02 AM Chunfeng Yun <
> chunfeng.yun@mediatek.com> wrote:
> > 
> > When the dedicated wake IRQ is level trigger, and it uses the
> > device's low-power status as the wakeup source, that means if the
> > device is not in low-power state, the wake IRQ will be triggered
> > if enabled; For this case, need enable the wake IRQ after running
> > the device's ->runtime_suspend() which make it enter low-power
> > state.
> > 
> > e.g.
> > Assume the wake IRQ is a low level trigger type, and the wakeup
> > signal comes from the low-power status of the device.
> > The wakeup signal is low level at running time (0), and becomes
> > high level when the device enters low-power state (runtime_suspend
> > (1) is called), a wakeup event at (2) make the device exit low-
> > power
> > state, then the wakeup signal also becomes low level.
> > 
> >                 ------------------
> >                |           ^     ^|
> > ----------------           |     | --------------
> >  |<---(0)--->|<--(1)--|   (3)   (2)    (4)
> > 
> > if enable the wake IRQ before running runtime_suspend during (0),
> > a wake IRQ will arise, it causes resume immediately;
> > it works if enable wake IRQ ( e.g. at (3) or (4)) after running
> > ->runtime_suspend().
> > 
> > This patch introduces a new status WAKE_IRQ_DEDICATED_REVERSE to
> > optionally support enabling wake IRQ after running
> > ->runtime_suspend().
> > 
> > Suggested-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> > Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> 
> I don't really have anything to add regarding the code.
> 
> The kerneldoc comments could be improved, but I can take care of this
> when applying the patch.
Ok, thanks
> 
> Please collect ACKs for the remaining 2 patches in the series and I
> will pick up all three.
The files (mtu3_plat.c, xhci-mtk.c) modified by other 2 patches are
maintained by myself, please pick up them, thanks a lot.

> 
> Thanks!
> 
> > ---
> > v4: changes according to Rafael's suggestions
> >     1. rename new flag as WAKE_IRQ_DEDICATED_REVERSE;
> >     2. add __dev_pm_set_dedicated_wake_irq() with flag parameter,
> > then
> >        rebuild dev_pm_set_dedicated_wake_irq() and add new api
> >        dev_pm_set_dedicated_wake_irq_reverse();
> >     3. rename the new added parameter as cond_disable in
> >        dev_pm_disable_wake_irq_check(), and also simplify its flow;
> >     4. modify some comments
> > 
> > v3: add new status suggested by Rafael
> > 
> > v2: add more commit message
> > 
> >   Use the falling edge trigger interrupt suggested by Ikjoon [1],
> > it
> > works well at firstly when only use this related wakeup source, but
> > encounter issues if use other wakeup sources to wakeup platform as
> > below steps:
> > 1. use another wakeup source to wake up the suspended system;
> > 2. the consumer's resume() will be called, and exits sleep state;
> > 3. the consumer's wakeup signal will fall into low level, due to
> >    currently the wakeup irq is disabled, the wake-irq is pending;
> > 4. the consumer tries to enter runtime suspend, but there is a
> >    pending wakeup irq, so will resume again, this will repeat
> >    endlessly.
> > 
> >   Send out the patch again for further discussion.
> > 
> > [1]: https://patchwork.kernel.org/patch/12190407
> > 
> > ---
> >  drivers/base/power/power.h   |   7 ++-
> >  drivers/base/power/runtime.c |   6 ++-
> >  drivers/base/power/wakeirq.c | 101 +++++++++++++++++++++++++++--
> > ------
> >  include/linux/pm_wakeirq.h   |   9 +++-
> >  4 files changed, 96 insertions(+), 27 deletions(-)
[...]
> > 
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
