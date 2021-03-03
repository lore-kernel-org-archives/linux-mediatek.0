Return-Path: <SRS0=dK9R=IB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADBCBC433DB
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Mar 2021 17:25:41 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EDEF164E84
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Mar 2021 17:25:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EDEF164E84
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=n8BDWXJnULOFBONnstBpUnOA+2K0qt+KxfOSPyskBHE=; b=pPzKCiTJdcNkubSS9YZWo4Jg+
	J4FCSMcNmdaDR8o+xXSppaBj0/zxFcGBA1pcSpp20i9JbunKhrKFto+PmY4iIh+tWabYDaR1gfblr
	8o5xoY2XRblCqFWOOHBWYjn0pyvy9AlPRAD/X7YzMguuZQA2rH44l7ZYaLK6Ps6NbGtaNKKYlPXzB
	IOAgPVYwR3zV1W6JfWTjUTZu6OTun+75T3tFg3n6HxacCF0AzpZgMPss4aGSaMV+wL/T1e9FdDm9M
	b9vu27aPfvpJOCLyqnSiKICkLALehAKddvxnhI3CsvNqKBs0839lI+P4qTel4MaCPMW3tlfb/MK3b
	wLhmuaLYA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lHVFV-005nCp-TU; Wed, 03 Mar 2021 17:25:26 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHSuk-005FNE-Gb; Wed, 03 Mar 2021 14:55:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=grLmHzM1WTxLyFnetwt7OHqUMHVimT2ZQg79yw21waE=; b=AOhVsBy2LGRQ5G9LGYt4rYHF/B
 RDwpXjzIJbZh3hcyVe+UeUPBEgJhhnc14uHLRHO94T5aD7h83pk5uHf2zlOTK87catiWExDEgFYzr
 ezms2MnDdKdgc7xmO7Rs7sBlYXSPtkmJIIRwZhuQX6R6msaVnpFjzOsZNlYkNv/P6XalwaNhqiPF0
 NE5DD6MHQYNgrUwu0FXQXl1UVsw8fgZyKiCvNRx6MpGivcJz01uxOEtB17bgb4z7ys7wNxAGoQFXB
 jaRMMgJ8O6FgQjPQ2pNNUuVxnm82ueFYzvKTgpMfQubnJyzOKjq0awkFCvfqVjR5TMJ68NIW1jllr
 USFLow1g==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHNPh-001wUY-9d; Wed, 03 Mar 2021 09:03:26 +0000
X-UUID: 3666326a35b64ba28c26a09e67788206-20210303
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=grLmHzM1WTxLyFnetwt7OHqUMHVimT2ZQg79yw21waE=; 
 b=GzRFRsptfSotdqbg/abyCO99qWyWAd+R1PY+sbqL0+RxWvswbgg1NUl/PvC5/GdMFzVy/P00CC6tDINz7ERx8w3cLt2YP4kDLD8htyFDUFgbXDp3IOAFXUMpJ8MRJdCvZPsqwYPBaVIjEeafFnF0rWBmXx4issfcbU529XCJpwE=;
X-UUID: 3666326a35b64ba28c26a09e67788206-20210303
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <leilk.liu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 236618161; Wed, 03 Mar 2021 01:03:13 -0800
Received: from MTKMBS32N1.mediatek.inc (172.27.4.71) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 3 Mar 2021 01:02:44 -0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS32N1.mediatek.inc
 (172.27.4.71) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 3 Mar 2021 17:02:40 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 3 Mar 2021 17:02:39 +0800
Message-ID: <1614762159.5898.9.camel@mhfsdcap03>
Subject: Re: [PATCH] spi: mediatek: Re-license MTK SPI driver as Dual MIT/GPL
From: Leilk Liu <leilk.liu@mediatek.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Wed, 3 Mar 2021 17:02:39 +0800
In-Reply-To: <YD84OKr4vNwA7vnz@kroah.com>
References: <20210303025636.795-1-leilk.liu@mediatek.com>
 <YD84OKr4vNwA7vnz@kroah.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 9A50E5966DFB3374904F9625230C65C0882547409960E6A6FB5287E07708BE842000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210303_090326_018379_B2237A3A 
X-CRM114-Status: GOOD (  23.01  )
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

On Wed, 2021-03-03 at 08:18 +0100, Greg Kroah-Hartman wrote:
> On Wed, Mar 03, 2021 at 10:56:36AM +0800, Leilk Liu wrote:
> > From: "leilk.liu" <leilk.liu@mediatek.com>
> > 
> > It is wanted to use MTK spi bus driver with GPL-2.0 or MIT license.
> > But now it is only licensed as GPL-2.0, so re-license it as dual
> > MIT/GPL.
> > 
> > Signed-off-by: leilk.liu <leilk.liu@mediatek.com>
> 
> Please use your name here, not an email alias for where your name goes.
> 
OK, I'll fix it, thanks!
> 
> > ---
> >  drivers/spi/spi-mt65xx.c                 | 4 ++--
> >  include/linux/platform_data/spi-mt65xx.h | 2 +-
> 
> Given that these files have been licensed under the GPL only since 2015,
> all changes contributed to it have only been licensed under the GPL as
> well, so have you gotten approval for all of the contributors for this
> change?
> 
This is the reason that I sent this patch to ask for ACKs from all
contributors (who are all in the To mail-list) for these files.

> Can you please get your lawyer to also sign off on this license change
> patch, so that we know that you have their approval for this incase
> there are questions about it in the future?
> 
I need to use the code in other projects that is not with GPL-2.0.
Also, the license change is approved by Mediatek supervisor.

> thanks,
> 
> greg k-h

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
