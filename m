Return-Path: <SRS0=O+qu=CH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CD73C433E2
	for <linux-mediatek@archiver.kernel.org>; Sat, 29 Aug 2020 06:36:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 09850207BB
	for <linux-mediatek@archiver.kernel.org>; Sat, 29 Aug 2020 06:36:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BlVkBwPt";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="j3yC42Qf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 09850207BB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7fsOwSGGA0XzAuN0VeK3oVO2SuBfIivPEU3hnaMVyO0=; b=BlVkBwPtchyy5VgWa05aDkuYu
	TniKoZJJ4f/8QDhoS/LP5UjQhLF2qeL83HtFgyjM++GPSRan3/xcvSIh9yKbwxjrMR5+YlRnmSuWQ
	XtKoGfotIFvkdFWOzH50L8ky0QvzlWu3pHSiPEy8vW7A6pIXR+KitZh9PDbeW8SHXz7NGtxtVOuY6
	MZ5XpIVXKTuEHthcqB4m0Is740UItUj2MMsRpO0VFQjkIR9hjrz0+BuQGFpByWfSyLT7tqjcf8xAF
	V+UnjuA4oassQTQS9XcKVX9oEB+1Xyw5kKZ0nOECR+qqFoQgIcR7SX44ryjDerOEHzE5Qz8a8UveW
	OwCdJ3LWw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kBuTk-0001py-Fx; Sat, 29 Aug 2020 06:36:44 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBuTf-0001pE-Tk; Sat, 29 Aug 2020 06:36:41 +0000
X-UUID: 055275b5131740a9abeb70e52e5f4267-20200828
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=7d446flNlXqERo30OxiNXzjgNqEd2wybxd1E9tnSaiU=; 
 b=j3yC42QfFwaMVkWBOfFqt9parUQUdB8Jgl90h0+6I35iMwb9HcK3JnKDf6TvRZ258SeBGMWA/qNaXb1fFBYDZ8tV6XRohXMWqhZ1nJ4xzBnZ4ev1OZ2T46kzd5f5MsOgmMOExxRlj4uwzzj0S0cl74Ipmo8VCuEpiaVWCYaFVHI=;
X-UUID: 055275b5131740a9abeb70e52e5f4267-20200828
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <freddy.hsin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1558123554; Fri, 28 Aug 2020 22:36:12 -0800
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 28 Aug 2020 23:26:09 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 29 Aug 2020 14:26:01 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 29 Aug 2020 14:26:02 +0800
Message-ID: <1598682362.14037.28.camel@mtkswgap22>
Subject: Re: [PATCH v1 1/1] driver: watchdog: Add mtk_wdt_init for mediatek
 watchdog hw init
From: Freddy.Hsin <freddy.hsin@mediatek.com>
To: Guenter Roeck <linux@roeck-us.net>
Date: Sat, 29 Aug 2020 14:26:02 +0800
In-Reply-To: <a63e9613-d448-d784-0c60-0fd8d1b9b937@roeck-us.net>
References: <1598600968-28498-1-git-send-email-freddy.hsin@mediatek.com>
 <1598600968-28498-2-git-send-email-freddy.hsin@mediatek.com>
 <a63e9613-d448-d784-0c60-0fd8d1b9b937@roeck-us.net>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 6B6BA55B1AE0D64803E09E8B3B9BC22621E37215DCECAB7005722416B9C2EF1F2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200829_023640_197454_CFDDCF71 
X-CRM114-Status: GOOD (  30.45  )
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
Cc: linux-watchdog@vger.kernel.org, wsd_upstream@mediatek.com,
 chun-hung.wu@mediatek.com, kuohong.wang@mediatek.com,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, chang-an.chen@mediatek.com,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 2020-08-28 at 07:26 -0700, Guenter Roeck wrote:
> On 8/28/20 12:49 AM, Freddy Hsin wrote:
> > 1. add a hw initialization function
> > 2. enable/disable the watchdog depends on the original hw setting
> > 3. set WDOD_HW_RUNNING in start function in order to start
> >    kicker after driver probe and clear the bit in stop function
> > 
> > Change-Id: I25aa797f3b88288f26984455e499e599e27f09fa
> > Signed-off-by: Freddy Hsin <freddy.hsin@mediatek.com>
> 
> The subject is misleading - what this really does it to honor
> that/if a watchdog is already running. However, WDOG_HW_RUNNING
> should not generally be set/cleared in the start/stop function.
> Also, calling mtk_wdt_stop is pointless if WDT_MODE_EN is not set,
> since clearing WDT_MODE_EN is all it does. On top of that,
> setting WDOG_HW_RUNNING in the probe function requires that
> max_hw_heartbeat_ms is set (instead of max_timeout).
> 
> So if you really want to honor that the watchdog is already running
> at boot, you would have to initialize max_hw_heartbeat_ms, set
> WDOG_HW_RUNNING explicitly, and possibly call the ping function
> before changing the timeout.
> 
> Thanks,
> Guenter

Hi Guenter,

Thanks for you suggestion. I will submit a new patch according to
your advice.

The purpose of this patch is to control WDT_MODE_EN in the first stage
of preloader bring up, and it should not be disabled afterward to
prevent the system freeze and cannot be reset, so remove the
mtk_wdt_stop function and keep the original state set in preloader.

> 
> > ---
> >  drivers/watchdog/mtk_wdt.c |   22 +++++++++++++++++++++-
> >  1 file changed, 21 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
> > index d6a6393..59b5061 100644
> > --- a/drivers/watchdog/mtk_wdt.c
> > +++ b/drivers/watchdog/mtk_wdt.c
> > @@ -57,6 +57,9 @@
> >  static bool nowayout = WATCHDOG_NOWAYOUT;
> >  static unsigned int timeout;
> >  
> > +static int mtk_wdt_start(struct watchdog_device *wdt_dev);
> > +static int mtk_wdt_stop(struct watchdog_device *wdt_dev);
> > +
> >  struct mtk_wdt_dev {
> >  	struct watchdog_device wdt_dev;
> >  	void __iomem *wdt_base;
> > @@ -148,6 +151,19 @@ static int toprgu_register_reset_controller(struct platform_device *pdev,
> >  	return ret;
> >  }
> >  
> > +static int mtk_wdt_init(struct watchdog_device *wdt_dev)
> > +{
> > +	struct mtk_wdt_dev *mtk_wdt = watchdog_get_drvdata(wdt_dev);
> > +	void __iomem *wdt_base;
> > +
> > +	wdt_base = mtk_wdt->wdt_base;
> > +
> > +	if (readl(wdt_base + WDT_MODE) & WDT_MODE_EN)
> > +		mtk_wdt_start(wdt_dev);
> > +	else
> > +		mtk_wdt_stop(wdt_dev);
> > +}
> > +
> >  static int mtk_wdt_restart(struct watchdog_device *wdt_dev,
> >  			   unsigned long action, void *data)
> >  {
> > @@ -206,6 +222,8 @@ static int mtk_wdt_stop(struct watchdog_device *wdt_dev)
> >  	reg |= WDT_MODE_KEY;
> >  	iowrite32(reg, wdt_base + WDT_MODE);
> >  
> > +	clear_bit(WDOG_HW_RUNNING, &wdt_dev->status);
> > +
> >  	return 0;
> >  }
> >  
> > @@ -225,6 +243,8 @@ static int mtk_wdt_start(struct watchdog_device *wdt_dev)
> >  	reg |= (WDT_MODE_EN | WDT_MODE_KEY);
> >  	iowrite32(reg, wdt_base + WDT_MODE);
> >  
> > +	set_bit(WDOG_HW_RUNNING, &wdt_dev->status);
> > +
> >  	return 0;
> >  }
> >  
> > @@ -274,7 +294,7 @@ static int mtk_wdt_probe(struct platform_device *pdev)
> >  
> >  	watchdog_set_drvdata(&mtk_wdt->wdt_dev, mtk_wdt);
> >  
> > -	mtk_wdt_stop(&mtk_wdt->wdt_dev);
> > +	mtk_wdt_init(&mtk_wdt->wdt_dev);
> >  
> >  	watchdog_stop_on_reboot(&mtk_wdt->wdt_dev);
> >  	err = devm_watchdog_register_device(dev, &mtk_wdt->wdt_dev);
> > 
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
