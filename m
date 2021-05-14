Return-Path: <SRS0=SQT7=KJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 753B7C433ED
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 May 2021 05:58:52 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6FD6B61447
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 May 2021 05:58:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6FD6B61447
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:CC:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hHq24/keR9cNFPyZuCmTrECRziUVxMNQ/46F7PEKQ+Y=; b=lFfQX6gIxdkAdn8oX41wlBYQG
	dmAl9bbVwIAGubTGDcXT28YyhyP6ZYsNbvBW25izL3ZZnFI5W/VN1Qg8Lfw7odHFDmPVgGyAHyFb6
	jx33cUAy4t32spcZDTuyaerq4QP0QYNOoxxdZEFB5dogE4j4A8J+xhwsYofF2zLjYZMcWdSmiV2DA
	IhJk2r3e5Q5i1TSs09gj0CWQ9pb4V4DVQ2FrbZmqCyyBQqkMOry4gv4ZWFgn5/hWOH1a/Ne7nQi9J
	7w+r6PoFYPZeEXflLqQt1NEoGCcvk6kfyN94OQndyiP7myAi4DGXMJIKRZPTtHV6rUjCQxkyl3XhK
	BdfWKOdyQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lhQqE-007GI0-BM; Fri, 14 May 2021 05:58:30 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lhQq1-007GFo-Gl; Fri, 14 May 2021 05:58:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=uBkJYOBF3nBuM67e9q6aIA3FhUXGTxHk9W7aWmr1taQ=; b=vuYqAmMIeGNUJQNYQgPv0ePhV2
 /LuldaLXDNPh7bmlLJWd8D41a/Yq3lz2FTz1dNqzksBnBegdRxpoAwBwcsA/0Rmdlv/ij8wntx0pr
 U/7Q2J6MbzIGWhf2ZJs/S5ABmJEK31G3YWL6KEKmvC53ZcjJAaU7/SQHx8y9a8MzOTiBHoBxTyLCG
 XwvIe+HiRBQpYPfINIwX8AwgeJ/eJxBrSjkpEu+DYTUrvt8m7w8zEbTxQAwk1m7fX6dtH0tf4GUfE
 +va9esjk18WdHgeEBCooAofCpt+vSY/3RpTO1E4KHRM5j3Df/LW+B7gDDNO0IEKrIL5ywisTbf/fM
 RK/kyENA==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lhQpx-00BjnU-Vy; Fri, 14 May 2021 05:58:15 +0000
X-UUID: 82a50cb4056a4ba295678aeec09c6f12-20210513
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=uBkJYOBF3nBuM67e9q6aIA3FhUXGTxHk9W7aWmr1taQ=; 
 b=CRURKEIoQyjN2BTuA3xHiF8nn9FvZRudLmqJgCz8VIgX4alhwy9yWgjJi9+3l66aYOpmPLvuwcL+mQ0PMEVrtvjSYVlWeMmKDyh6qR1w8H21O+AZoJhW4QX7FgR9bBVzju7LLTmql+UMw0XpVpeXVZspvmq4jUcMHYpNEROLrKs=;
X-UUID: 82a50cb4056a4ba295678aeec09c6f12-20210513
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <roger.lu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1173112877; Thu, 13 May 2021 22:58:11 -0700
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 13 May 2021 22:58:09 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 14 May 2021 13:58:01 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 14 May 2021 13:58:01 +0800
Message-ID: <f64f2419217c0c8e0e269db0b480abb08040adb4.camel@mediatek.com>
Subject: Re: [PATCH v16 3/7] soc: mediatek: SVS: introduce MTK SVS engine
From: Roger Lu <roger.lu@mediatek.com>
To: Guenter Roeck <linux@roeck-us.net>
CC: Matthias Brugger <matthias.bgg@gmail.com>, Enric Balletbo Serra
 <eballetbo@gmail.com>, Kevin Hilman <khilman@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Nicolas Boichat <drinkcat@google.com>, Stephen Boyd
 <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Fan Chen
 <fan.chen@mediatek.com>, HenryC Chen <HenryC.Chen@mediatek.com>, YT Lee
 <yt.lee@mediatek.com>, Xiaoqing Liu <Xiaoqing.Liu@mediatek.com>, "Charles
 Yang" <Charles.Yang@mediatek.com>, Angus Lin <Angus.Lin@mediatek.com>, "Mark
 Rutland" <mark.rutland@arm.com>, Nishanth Menon <nm@ti.com>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-pm@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Fri, 14 May 2021 13:58:01 +0800
In-Reply-To: <ec5f064f-41f1-f8f9-9a6d-fdf02c43cb8d@roeck-us.net>
References: <20210428065440.3704-1-roger.lu@mediatek.com>
 <20210428065440.3704-4-roger.lu@mediatek.com>
 <20210506045115.GA767398@roeck-us.net>
 <7a7a07adedf5d3f430fecf81aed35c6321e5b634.camel@mediatek.com>
 <ec5f064f-41f1-f8f9-9a6d-fdf02c43cb8d@roeck-us.net>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210513_225814_056662_D57DCFB7 
X-CRM114-Status: GOOD (  29.36  )
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

On Thu, 2021-05-13 at 20:33 -0700, Guenter Roeck wrote:
> On 5/13/21 8:10 PM, Roger Lu wrote:
> > Hi Guenter,
> > 
> > Sorry for the late reply and thanks for the notice.
> > 
> > On Wed, 2021-05-05 at 21:51 -0700, Guenter Roeck wrote:
> > > On Wed, Apr 28, 2021 at 02:54:36PM +0800, Roger Lu wrote:
> > > > The Smart Voltage Scaling(SVS) engine is a piece of hardware
> > > > which calculates suitable SVS bank voltages to OPP voltage
> > > > table.
> > > > Then, DVFS driver could apply those SVS bank voltages to
> > > > PMIC/Buck
> > > > when receiving OPP_EVENT_ADJUST_VOLTAGE.
> > > > 
> > > > Signed-off-by: Roger Lu <roger.lu@mediatek.com>
> > > > ---
> > > >   drivers/soc/mediatek/Kconfig   |   10 +
> > > >   drivers/soc/mediatek/Makefile  |    1 +
> > > >   drivers/soc/mediatek/mtk-svs.c | 1723
> > > > ++++++++++++++++++++++++++++++++
> > > >   3 files changed, 1734 insertions(+)
> > > >   create mode 100644 drivers/soc/mediatek/mtk-svs.c
> > > > 
> > > 
> > > [ ... ]
> > > 
> > > > +
> > > > +	svsp_irq = irq_of_parse_and_map(svsp->dev->of_node, 0);
> > > > +	ret = devm_request_threaded_irq(svsp->dev, svsp_irq,
> > > > NULL,
> > > > svs_isr,
> > > > +					svsp->irqflags, svsp-
> > > > >name,
> > > > svsp);
> > > 
> > > 0-day reports:
> > > 
> > > drivers/soc/mediatek/mtk-svs.c:1663:7-32: ERROR:
> > > 	Threaded IRQ with no primary handler requested without
> > > IRQF_ONESHOT
> > > 
> > > I would be a bit concerned about this. There is no primary (hard)
> > > interrupt handler, meaning the hard interrupt may be re-enabled
> > > after
> > > the default hard interrupt handler runs. This might result in
> > > endless
> > > interrupts.
> > 
> > Oh, we add IRQF_ONESHOT in "svs_get_svs_mt8183_platform_data()" for
> > threaded irq. So, please kindly let us know if we need to set more
> > flags or any other potential risks we should be aware. Thanks in
> > advance.
> > 
> 
> After reviewing the code, I think this was actually a false alarm,
> at least if svsp->irqflags always includes IRQF_ONESHOT.
> The code is kind of unusual, though. Unless I am missing something,
> svsp->irqflags is only set in one place and it is always set
> to IRQF_TRIGGER_LOW | IRQF_ONESHOT. If there is a remote chance
> that the flag is ever different, it would have been better (and less
> confusing) to specify IRQF_ONESHOT directly when requesting the
> interrupt (because it is always needed, no matter which SOC).
> If the flags are always the same, there is no reason for having
> the svsp->irqflags variable in the first place.

Thanks for the advice. We still need svsp->irqflags for customizing
different SoC requirement as [1] and I'll specify IRQF_ONESHOT directly
as [2] in the next version.

[1]
mt8183 setting: svsp->irqflags = IRQF_TRIGGER_LOW | IRQF_ONESHOT;
mt8192 setting: svsp->irqflags = IRQF_TRIGGER_HIGH | IRQF_ONESHOT;
https://lore.kernel.org/patchwork/patch/1419309/ (mt8192)

[2]
ret = devm_request_threaded_irq(svsp->dev, svsp_irq, NULL, svs_isr,
				svsp->irqflags | IRQF_ONESHOT,
				svsp->name, svsp);
> 
> Thanks,
> Guenter
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
