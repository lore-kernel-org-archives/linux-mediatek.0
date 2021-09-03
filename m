Return-Path: <SRS0=h4nU=NZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE3BBC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Sep 2021 07:01:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 83F34610A2
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Sep 2021 07:01:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 83F34610A2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9HB3VtpgSFfaOiCqBDSspjU8EZuJ9ZEVat6wYhTQUGE=; b=hFqpuroxPl3j2A
	aycsYZ7pfj91EWtBkAGBtlowNJlFPzTyizpr9b4noyPGI+shnObvwmWuscQyv0BeqJpo6FMQnudx+
	hWWli2Xotq5Rxk7ZMKcQ3g12JMnmZOlP3Wdf9BScJwNnJYtjIDBNuXl9qDrrDJWNlmRPIWo9FsFTo
	VhDiUFlYwjGs3XQ0p7YXnsdKQld+/iXSlSwcKYvZb2EesThQ4VON+AdMCndiiNBlUTeJkHfvD4gWb
	HO39yvc4Klpzd+OfRjjzJ0SXL+VxRRdHa23PHUP57HTCo1cucrrZPSpUi2U+qOaTdXPy8Muyq7Re9
	v3fp2j2OtXYWg842L5bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mM3Ck-00B7ge-GB; Fri, 03 Sep 2021 07:01:38 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mM3Ch-00B7ft-H8; Fri, 03 Sep 2021 07:01:37 +0000
X-UUID: 027ef5d86c3a4ee0b003d9b520f600ce-20210903
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=OQWwOb7sQeXF3nnpG4IGI+gbtaCyzmN8HQTZATIqijo=; 
 b=ZpHt3LM5Ix+9r70jkr80b3KSZonyuvp1TTlrUSolxaJ7nTluJXdZ1HTF/NXvY2z4n1KVSNo7GocgByozhIH0jPAV+sSA8wCjPIgrzsh+d7ZVnloe+KmJM3y+r0+rhFCRkgCVGlBxrtm5bC4AZ08TNOJUeQGiUIa9nZkYgMDPN/k=;
X-UUID: 027ef5d86c3a4ee0b003d9b520f600ce-20210903
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <fengquan.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1989615561; Fri, 03 Sep 2021 00:01:31 -0700
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 2 Sep 2021 23:51:29 -0700
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by mtkmbs05n1.mediatek.inc
 (172.21.101.15) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 3 Sep 2021 14:51:28 +0800
Received: from mhfsdcap04 (10.17.3.154) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 3 Sep 2021 14:51:26 +0800
Message-ID: <242e9e2ed9c2c071c4b05d11f276642e996e03b6.camel@mediatek.com>
Subject: Re: [PATCH] watchdog: mtk: add disable_wdt_extrst support
From: Fengquan Chen <fengquan.chen@mediatek.com>
To: Guenter Roeck <linux@roeck-us.net>, Wim Van Sebroeck
 <wim@linux-watchdog.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 <linux-watchdog@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <tinghan.shen@mediatek.com>, <randy.wu@mediatek.com>,
 <rex-bc.chen@mediatek.com>, <christine.zhu@mediatek.com>,
 <joe.yang@mediatek.com>, <zhishuang.zhang@mediatek.com>
Date: Fri, 3 Sep 2021 14:51:28 +0800
In-Reply-To: <5fe9c774-c619-604e-1f74-12ff6bfe826f@roeck-us.net>
References: <1630569881-6032-1-git-send-email-Fengquan.Chen@mediatek.com>
 <1630569881-6032-2-git-send-email-Fengquan.Chen@mediatek.com>
 <5fe9c774-c619-604e-1f74-12ff6bfe826f@roeck-us.net>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210903_000135_621209_E1698404 
X-CRM114-Status: GOOD (  23.98  )
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

On Thu, 2021-09-02 at 06:43 -0700, Guenter Roeck wrote:
> On 9/2/21 1:04 AM, Fengquan Chen wrote:
> > From: "fengquan.chen" <fengquan.chen@mediatek.com>
> 
> There should not be such From: line.

Thanks, i have removed it and uploaded a new version:
https://patchwork.kernel.org/project/linux-mediatek/list/?series=541567

> 
> > 
> > In some cases, we may need watchdog just to trigger an
> > internal soc reset without sending any output signal.
> > 
> > Provide a disable_wdt_extrst parameter for configuration.
> > We can disable or enable it just by configuring dts.
> > 
> > igned-off-by: Fengquan Chen <fengquan.chen@mediatek.com>
> 
> Missing "S".

Thanks, has been added back in v2.

> 
> > ---
> >   drivers/watchdog/mtk_wdt.c | 7 +++++++
> >   1 file changed, 7 insertions(+)
> > 
> > diff --git a/drivers/watchdog/mtk_wdt.c
> > b/drivers/watchdog/mtk_wdt.c
> > index 97ca993..4824c07 100644
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
> > +		of_property_read_bool(dev->of_node, "disable_extrst");
> > +
> 
> The new property needs to be documented and approved by a DT
> maintainer
> (separate patch). Something like "mtk,disable-extrst" would probably
> be
> a better property name.
> 
> Guenter

Thanks, the property name has been modified, and related dt-binding
has
been added,see series 541567

Best Regards
Fengquan

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
