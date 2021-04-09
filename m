Return-Path: <SRS0=HbKG=JG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F439C433ED
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Apr 2021 05:43:13 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3335B61028
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Apr 2021 05:43:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3335B61028
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=LlR4CgmFdKTpcOPOWHEt7bA0FM3CTaQXyifESLXwZyY=; b=WR9Id1gAnp+LJa0wakP/ULrJf
	1RAiz+RLFf0jy75Xy/2K2pok3kAWt1YMhet4AUo1hQ3EsmtMCiu8iyLk8XUaGM+hO0uKp65AyTeFt
	h+KjwqhtqeKsXXM0+H9KUXXNXYO3BaISDBjLP/lOJJQyc8WC0b+GoPf0HKEkPF37HqOTHm2SUiBaa
	q2Kj5pY2AANNFxtk23DAgueiDMmohI+19cH5DTk/2FXQMCbhkhuMFGQpvFxbuTAVewRDhlqWFqdvu
	I5fQZ1ik12OR/yEX65bbakROO9PzwF4I66RUYabrptEidLzwag6mZrLnqIQG10+wEd6s+xY/sJ7lP
	l/H8+6ROA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUjuy-00ABCD-10; Fri, 09 Apr 2021 05:42:56 +0000
Received: from muru.com ([72.249.23.125])
 by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
 id 1lUjso-00AApG-KF; Fri, 09 Apr 2021 05:40:48 +0000
Received: from atomide.com (localhost [127.0.0.1])
 by muru.com (Postfix) with ESMTPS id 1890D818C;
 Fri,  9 Apr 2021 05:41:50 +0000 (UTC)
Date: Fri, 9 Apr 2021 08:40:36 +0300
From: Tony Lindgren <tony@atomide.com>
To: Ikjoon Jang <ikjn@chromium.org>
Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Mathias Nyman <mathias.nyman@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Len Brown <len.brown@intel.com>, Pavel Machek <pavel@ucw.cz>,
 linux-usb@vger.kernel.org, "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, 
 open list <linux-kernel@vger.kernel.org>, linux-pm@vger.kernel.org,
 Tianping Fang <tianping.fang@mediatek.com>,
 Eddie Hung <eddie.hung@mediatek.com>,
 Nicolas Boichat <drinkcat@chromium.org>
Subject: Re: [PATCH 1/6] PM: runtime: enable wake irq after runtime_suspend
 hook called
Message-ID: <YG/o1ERNkcaYAV9y@atomide.com>
References: <1617874514-12282-1-git-send-email-chunfeng.yun@mediatek.com>
 <CAATdQgCQ5Gm1CNEbVgLFiFcgDX0yP5G=48Fa29WYbpSuz25WXg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAATdQgCQ5Gm1CNEbVgLFiFcgDX0yP5G=48Fa29WYbpSuz25WXg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210409_064045_736044_ED7860D6 
X-CRM114-Status: GOOD (  12.99  )
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

* Ikjoon Jang <ikjn@chromium.org> [210409 05:33]:
> Hi Chunfeng,
> 
> On Thu, Apr 8, 2021 at 5:35 PM Chunfeng Yun <chunfeng.yun@mediatek.com> wrote:
> >
> > When the dedicated wake irq is level trigger, enable it before
> > calling runtime_suspend, will trigger an interrupt.
> >
> > e.g.
> > for a low level trigger type, it's low level at running time (0),
> > and becomes high level when enters suspend (runtime_suspend (1) is
> > called), a wakeup signal at (2) make it become low level, wake irq
> > will be triggered.
> >
> >                 ------------------
> >                |           ^     ^|
> > ----------------           |     | --------------
> >  |<---(0)--->|<--(1)--|   (3)   (2)    (4)
> >
> 
> Can't we just use a falling edge type for this irq line?

Sounds reasonable to me :)

Tony

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
