Return-Path: <SRS0=bnG6=GB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F468C433E0
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Dec 2020 08:42:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4BBDE21D7F
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Dec 2020 08:42:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4BBDE21D7F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hEhW1unWQpM14k2JS/Vf87h8v1pOTQxQsV+obOZ6x8A=; b=2DtAYlk2wrhHK8XF2rRMmDSxb
	pDDRLi7J5zWz3OTpS76LexQfa4myxVMZ5y4RR4UlbU0rkKfYmonQgS1qs/IPuDZSoUDiZiPvCBCDg
	HCg51G6JGAqXKOehN9Td7WvrzbNqiA5meflTa5wJuoM3KnU1/saE9nE5iIqR2hQq5PUhw7bXQX2C5
	I0JwKjBfCWhJfdXAiJtwwmmEHo2t/cEdxmDJzY/SMb1NM3Z7RngM+gA1hWcQODW4CSoRN1F8iBb0h
	mxVeGZfC8h7U0+pAm9lGPWjjwPGtCZ6ZIbnJ7QM+GWrHJG6LtNkyelMoxmybCLsujOUagH5M8CruG
	d7lhk/ZzQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kuAZf-0004gy-RN; Tue, 29 Dec 2020 08:41:47 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kuAZb-0004ew-A1; Tue, 29 Dec 2020 08:41:45 +0000
X-UUID: 48edbf720f87462ea8d1af1aa1ec38d0-20201229
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=NQ4QRe8nSxWh6QAMyMqUfz/+0mHdp+v/GQvcpjpR/0A=; 
 b=cA39+NycD7Y5GGYl/1rFnwbVuCwUfh842rsZpjLU64PfL5ZHYA4JNcbhLKxAExbvJMbD54QL/4cTF6hn8U0XTmgWXiF72XuhxAXZMOhs43TxW8xMhW9IGD6abEcSG7FVZ6D3vWMP/jW1G0epEOp7qhkjK6tvGSd0MKZ7xvBlivU=;
X-UUID: 48edbf720f87462ea8d1af1aa1ec38d0-20201229
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <freddy.hsin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1389785413; Tue, 29 Dec 2020 00:41:35 -0800
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 29 Dec 2020 00:39:55 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 29 Dec 2020 16:39:55 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 29 Dec 2020 16:39:54 +0800
Message-ID: <1609231194.9252.6.camel@mtkswgap22>
Subject: Re: [PATCH v1 1/1] driver: watchdog: Remove mtk_wdt_stop() in
 probe() to prevent the system freeze and it doesn't reboot by watchdog
 problem
From: Freddy.Hsin <freddy.hsin@mediatek.com>
To: Guenter Roeck <linux@roeck-us.net>
Date: Tue, 29 Dec 2020 16:39:54 +0800
In-Reply-To: <a3851099-128a-1305-0f76-66af3c9c6e63@roeck-us.net>
References: <1608881450-11081-1-git-send-email-freddy.hsin@mediatek.com>
 <1608881450-11081-2-git-send-email-freddy.hsin@mediatek.com>
 <a3851099-128a-1305-0f76-66af3c9c6e63@roeck-us.net>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201229_034144_105973_D6886EFC 
X-CRM114-Status: GOOD (  27.81  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
 wsd_upstream <wsd_upstream@mediatek.com>,
 Kuohong Wang =?UTF-8?Q?=28=E7=8E=8B=E5=9C=8B=E9=B4=BB=29?=
 <kuohong.wang@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chang-An Chen =?UTF-8?Q?=28=E9=99=B3=E6=98=B6=E5=AE=89=29?=
 <Chang-An.Chen@mediatek.com>, Wim Van Sebroeck <wim@linux-watchdog.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 2020-12-25 at 22:27 +0800, Guenter Roeck wrote:
> On 12/24/20 11:30 PM, Freddy Hsin wrote:
> > From: "freddy.hsin" <freddy.hsin@mediatek.com>
> > 
> > Before user space daemon start to access the watchdog device,
> > there is a time interval that watchdog is disabled in the
> > original flow. If the system freezing at this interval, it
> > cannot be rebooted by watchdog hardware automatically.
> > 
> > In order to solve this problem, the watchdog hardware should be
> > kept working, and start hrtimer in framework to ping it by
> > setting max_hw_heartbeat_ms and HW_RUNNING used in
> > watchdog_need_worker to determine whether the worker should be
> > started or not
> > 
> > Change-Id: I6a041b0922888a90011d7538ee804d80bc8d15ea
> > Signed-off-by: freddy.hsin <freddy.hsin@mediatek.com>
> > ---
> >  drivers/watchdog/mtk_wdt.c |   22 ++++++++++++++++++----
> >  1 file changed, 18 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
> > index d6a6393..62f08cd 100644
> > --- a/drivers/watchdog/mtk_wdt.c
> > +++ b/drivers/watchdog/mtk_wdt.c
> > @@ -195,6 +195,19 @@ static int mtk_wdt_set_timeout(struct watchdog_device *wdt_dev,
> >  	return 0;
> >  }
> >  
> > +static void mtk_wdt_init(struct watchdog_device *wdt_dev)
> > +{
> > +	struct mtk_wdt_dev *mtk_wdt = watchdog_get_drvdata(wdt_dev);
> > +	void __iomem *wdt_base;
> > +
> > +	wdt_base = mtk_wdt->wdt_base;
> > +
> > +	if (readl(wdt_base + WDT_MODE) & WDT_MODE_EN) {
> > +		set_bit(WDOG_HW_RUNNING, &wdt_dev->status);
> > +		mtk_wdt_set_timeout(wdt_dev, wdt_dev->timeout);
> > +	}
> > +}
> > +
> >  static int mtk_wdt_stop(struct watchdog_device *wdt_dev)
> >  {
> >  	struct mtk_wdt_dev *mtk_wdt = watchdog_get_drvdata(wdt_dev);
> > @@ -266,16 +279,17 @@ static int mtk_wdt_probe(struct platform_device *pdev)
> >  	mtk_wdt->wdt_dev.timeout = WDT_MAX_TIMEOUT;
> >  	mtk_wdt->wdt_dev.max_timeout = WDT_MAX_TIMEOUT;
> 
> No longer needed if max_hw_heartbeat_ms is set.

Got it. it will be removed in V2 patch

> 
> >  	mtk_wdt->wdt_dev.min_timeout = WDT_MIN_TIMEOUT;
> > +	mtk_wdt->wdt_dev.max_hw_heartbeat_ms = (WDT_MAX_TIMEOUT - 1) * 1000;
> 
> This needs explanation. Why WDT_MAX_TIMEOUT - 1 ?

In watchdog_need_worker(), there is a condition for starting worker (hm
&& watchdog_active(wdd) && t > hm), so I think in the case
that watchdog_active is true, the t (timeout) should be greater than
hm (max_hw_heartbeat_ms) or the worker will not work. Shouldn't I
consider for this case?

> 
> >  	mtk_wdt->wdt_dev.parent = dev;
> >  
> > +	watchdog_set_drvdata(&mtk_wdt->wdt_dev, mtk_wdt);
> > +
> > +	mtk_wdt_init(&mtk_wdt->wdt_dev);
> > +
> 
> Setting the chip (with the maximum timeout) ...
> 
Got it. mtk_wdt_init will be moved after watchdog_init_timeout in V2

BRs,
FreddyHsin

> >  	watchdog_init_timeout(&mtk_wdt->wdt_dev, timeout, dev);
> 
> just before initializing/setting the real timeout doesn't really make sense.
> 
> >  	watchdog_set_nowayout(&mtk_wdt->wdt_dev, nowayout);
> >  	watchdog_set_restart_priority(&mtk_wdt->wdt_dev, 128);
> >  
> > -	watchdog_set_drvdata(&mtk_wdt->wdt_dev, mtk_wdt);
> > -
> > -	mtk_wdt_stop(&mtk_wdt->wdt_dev);
> > -
> >  	watchdog_stop_on_reboot(&mtk_wdt->wdt_dev);
> >  	err = devm_watchdog_register_device(dev, &mtk_wdt->wdt_dev);
> >  	if (unlikely(err))
> > 
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
