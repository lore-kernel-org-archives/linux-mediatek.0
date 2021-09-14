Return-Path: <SRS0=LW2f=OE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4AECC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Sep 2021 13:01:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B4D76113B
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Sep 2021 13:01:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7B4D76113B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zSl7O/YYO3sGSbcUQrwAjphsqauae+YdJfGeP38y6yA=; b=zID50QxuoW1z17
	1hNFexTPVdycuGcpcfcaLdV1uBsGaKwENGIdIZh6EQmILxlM+1185Plg3upHBbrKDclGMZITAP8Zt
	5sBRp0Mt0HSY3rfmSxEL6iBz3m8bIdNojFj1lLCWB6ZLVgTxnnrbbkvkYNuh5qvoUhTfDq/gCgDSY
	tXoSLRN1u5NXvulz1a3UCIhSP5Hy5/1Y+exGem2NlbcJ7XOgj7RiRkJJjYUDK9dErtgkeFlbbgfrA
	J+W6ZX+b5J+534YPWkHz/WSeATJPliAQBFJ3spTH0ahIYTc8hY9fm0dIzsEgMH7mhlQRklsKd5guy
	/CTJI7MLmv+h8Z5Mt8Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mQ84B-005of8-7t; Tue, 14 Sep 2021 13:01:39 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQ848-005ocQ-Qc; Tue, 14 Sep 2021 13:01:38 +0000
X-UUID: 698086d9b84a47ae97c68d0f8498e73e-20210914
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=o/ulPcGoC9qllHKs1jxpDbN0XZWElaGx7RjSMBlQ4ig=; 
 b=jV8zBqkRw4rzwhGkurv3wsu21IV+vFZHCBjtkrlVU4ea3/cC8pHrB/nSJ9z0QGJuIrMfSknVtuYqIma+1WOibrqDu2SGaLn1LqnJzCwa9UVoGKx6imQ+HOmLY2tgI0sqdky6Rbj4xFMTERjtQ0n1ePRcnrSRxV7AIRhuMgzIhpQ=;
X-UUID: 698086d9b84a47ae97c68d0f8498e73e-20210914
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <fengquan.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 603305763; Tue, 14 Sep 2021 06:01:34 -0700
Received: from MTKMBS33N2.mediatek.inc (172.27.4.76) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 14 Sep 2021 05:51:34 -0700
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS33N2.mediatek.inc
 (172.27.4.76) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 14 Sep 2021 20:51:32 +0800
Received: from mhfsdcap04 (10.17.3.154) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 14 Sep 2021 20:51:31 +0800
Message-ID: <39a7b3043e39db30394270a51a3ebca670f465d9.camel@mediatek.com>
Subject: Re: [v2,1/2] watchdog: mtk: add disable_wdt_extrst support
From: Fengquan Chen <fengquan.chen@mediatek.com>
To: Guenter Roeck <linux@roeck-us.net>, Wim Van Sebroeck
 <wim@linux-watchdog.org>, Rob Herring <robh+dt@kernel.org>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, <linux-watchdog@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <tinghan.shen@mediatek.com>, <randy.wu@mediatek.com>,
 <rex-bc.chen@mediatek.com>, <christine.zhu@mediatek.com>,
 <joe.yang@mediatek.com>, <zhishuang.zhang@mediatek.com>
Date: Tue, 14 Sep 2021 20:51:33 +0800
In-Reply-To: <65cc931f-ba49-19b5-ce25-c49f7b984cec@roeck-us.net>
References: <20210903061623.10715-1-Fengquan.Chen@mediatek.com>
 <20210903061623.10715-2-Fengquan.Chen@mediatek.com>
 <65cc931f-ba49-19b5-ce25-c49f7b984cec@roeck-us.net>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 7696784DA0C6EE93EB3F11057021201EBE78BCE407BDF54B2280A17DDB698F292000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210914_060136_914015_8DFAB2E9 
X-CRM114-Status: GOOD (  24.02  )
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

On Fri, 2021-09-03 at 07:05 -0700, Guenter Roeck wrote:
> On 9/2/21 11:16 PM, Fengquan Chen wrote:
> > In some cases, we may need watchdog just to trigger an
> > internal soc reset without sending any output signal.
> > 
> > Provide a disable_wdt_extrst parameter for configuration.
> > We can disable or enable it just by configuring dts.
> > 
> > Signed-off-by: fengquan.chen <fengquan.chen@mediatek.com>
> 
> Nit: You should set up git such that it uses "Fengquan Chen", not
> "fengquan.chen".
> 
> Other than that, for my reference,
> 
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> 
> We'll have to wait for dt property approval before we can apply the
> patch.
> 
> Thanks,
> Guenter

Thanks, i have uploaded a new v3 to fix the signed-off name,
and move the dt-binding patch to the first patch.

Best Regards
Fengquan

> 
> > ---
> >   drivers/watchdog/mtk_wdt.c | 7 +++++++
> >   1 file changed, 7 insertions(+)
> > 
> > diff --git a/drivers/watchdog/mtk_wdt.c
> > b/drivers/watchdog/mtk_wdt.c
> > index 97ca993bd009..276b6cb7d225 100644
> > --- a/drivers/watchdog/mtk_wdt.c
> > +++ b/drivers/watchdog/mtk_wdt.c
> > @@ -63,6 +63,7 @@ struct mtk_wdt_dev {
> >   	void __iomem *wdt_base;
> >   	spinlock_t lock; /* protects WDT_SWSYSRST reg */
> >   	struct reset_controller_dev rcdev;
> > +	bool disable_wdt_extrst;
> >   };
> >   
> >   struct mtk_wdt_data {
> > @@ -240,6 +241,8 @@ static int mtk_wdt_start(struct watchdog_device
> > *wdt_dev)
> >   
> >   	reg = ioread32(wdt_base + WDT_MODE);
> >   	reg &= ~(WDT_MODE_IRQ_EN | WDT_MODE_DUAL_EN);
> > +	if (mtk_wdt->disable_wdt_extrst)
> > +		reg &= ~WDT_MODE_EXRST_EN;
> >   	reg |= (WDT_MODE_EN | WDT_MODE_KEY);
> >   	iowrite32(reg, wdt_base + WDT_MODE);
> >   
> > @@ -309,6 +312,10 @@ static int mtk_wdt_probe(struct
> > platform_device *pdev)
> >   		if (err)
> >   			return err;
> >   	}
> > +
> > +	mtk_wdt->disable_wdt_extrst =
> > +		of_property_read_bool(dev->of_node, "mediatek,disable-
> > extrst");
> > +
> >   	return 0;
> >   }
> >   
> > 
> 
> 
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
