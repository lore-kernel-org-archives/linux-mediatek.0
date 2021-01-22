Return-Path: <SRS0=vrrm=GZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DEAR_SOMETHING,
	DKIMWL_WL_HIGH,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F59BC433E0
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Jan 2021 00:54:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0938422CAE
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Jan 2021 00:54:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0938422CAE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7AoSR3LEUvZ6m1MZNqxD/To/JuPeE39S8Qqh9oA2jgs=; b=q60FAcTV60LwILeOabngeM6KW
	iWDXN9ygEdJGGRVql784e71PQbjEDoMu4r5lpT2TBZhULhRP0RCUi60Hs3GChRJp5576nd0GS750A
	qhRldu42gf9nDrBsZPzi6B6uJKLoJluosvSRf/f2mxJzqzrWBsLsemb+YvqrHi/UUKFZuNw1WsXtn
	PGLjCkXkVFLICYXQr5+uq1kKql9mwlNstHargOHoQYDCuw/X0g3zDja0Ybxt6nKbg2xycLY6VN58C
	cTdhK4kZkJpFRBXbAJJXV3UydPqOpJgOolT3VEmeg+w/pEtfoKIJ+DLcZA/7jOgH5Jo96wJZbzTCG
	VFoDXy+9Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l2kiK-0007do-Hh; Fri, 22 Jan 2021 00:54:12 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l2kiG-0007bz-0V; Fri, 22 Jan 2021 00:54:09 +0000
X-UUID: 0e985d0c987441ad9e6370f566822df7-20210121
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=smCmt3kXsiZFHJzKKlAVT7/YVlC4qDYJn1kUsFniB6Y=; 
 b=DsQynwa9byuWvg1d2TMNAydcEntmN6tY/Igqccguq+B3mam5NpDuZmjZwLN70JjBsLnwchzKEUgQG2m3mJg0GQPYxEJrC07zIE2uyaX1PCDHmVaL01zOiZQQ5uxbbZpCOQTyUdqzo3J6nqrfVIC//k42GwNRS33N+K8mxwxJGbQ=;
X-UUID: 0e985d0c987441ad9e6370f566822df7-20210121
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <freddy.hsin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 98402943; Thu, 21 Jan 2021 16:54:00 -0800
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 21 Jan 2021 16:53:58 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 22 Jan 2021 08:53:50 +0800
Received: from [172.21.77.33] (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 22 Jan 2021 08:53:50 +0800
Message-ID: <1611276830.6717.2.camel@mtkswgap22>
Subject: Re: [PATCH v2 1/1] watchdog: mtk_wdt: Remove mtk_wdt_stop() in
 probe() to prevent the system freeze and it doesn't reboot by watchdog
 problem
From: Freddy.Hsin <freddy.hsin@mediatek.com>
To: Guenter Roeck <linux@roeck-us.net>
Date: Fri, 22 Jan 2021 08:53:50 +0800
In-Reply-To: <6ce2a1f6-9385-8004-5227-88bb5cdba5e2@roeck-us.net>
References: <1609316157-3748-1-git-send-email-freddy.hsin@mediatek.com>
 <6ce2a1f6-9385-8004-5227-88bb5cdba5e2@roeck-us.net>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: D0201DAD7C1D0F124AEF0B76ECDD3B8AF4755B7F93FCDC8ED6963D5AA73A3D2D2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210121_195408_249879_B1B7C4FF 
X-CRM114-Status: GOOD (  25.69  )
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

On Thu, 2020-12-31 at 00:50 +0800, Guenter Roeck wrote:
> On 12/30/20 12:15 AM, Freddy Hsin wrote:
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
> > started or not. Besides the redundant setting of max_timeout is
> > also removed.
> > 
> > Signed-off-by: freddy.hsin <freddy.hsin@mediatek.com>
> > ---
> 
> Change log goes here.
> 
> Looks good though.
> 
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>


Dear Sir,

Will this change be merged into the mainline tree?

BRs,
FreddyHsin


> 
> >  drivers/watchdog/mtk_wdt.c |   17 +++++++++++++++--
> >  1 file changed, 15 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
> > index d6a6393..0c869b7 100644
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
> > @@ -264,7 +277,7 @@ static int mtk_wdt_probe(struct platform_device *pdev)
> >  	mtk_wdt->wdt_dev.info = &mtk_wdt_info;
> >  	mtk_wdt->wdt_dev.ops = &mtk_wdt_ops;
> >  	mtk_wdt->wdt_dev.timeout = WDT_MAX_TIMEOUT;
> > -	mtk_wdt->wdt_dev.max_timeout = WDT_MAX_TIMEOUT;
> > +	mtk_wdt->wdt_dev.max_hw_heartbeat_ms = WDT_MAX_TIMEOUT * 1000;
> >  	mtk_wdt->wdt_dev.min_timeout = WDT_MIN_TIMEOUT;
> >  	mtk_wdt->wdt_dev.parent = dev;
> >  
> > @@ -274,7 +287,7 @@ static int mtk_wdt_probe(struct platform_device *pdev)
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
