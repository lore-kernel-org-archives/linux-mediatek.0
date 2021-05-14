Return-Path: <SRS0=SQT7=KJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 533E0C433B4
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 May 2021 03:11:02 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B48796143E
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 May 2021 03:11:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B48796143E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:CC:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=QBm/OIjT6T4kWEcybDpRB/ooVog0gLC9+B8Jz7pb0Ew=; b=QDcMbbqAxIqN+TfT98rOaw8fR
	hyhJ5VK9tk7tWT1ihogqNdSky72V8bKPffTVEaW5L4J5AIpP3O93gYKQbeI1WUNdz4/USreQPmNe3
	lodksrgiXnVFA3RTaSScTaspMvIlSn3+/DURUpj/pMQNQUzQA2wAlsc2C1WUmdqrO/DBcaROpV+Or
	Oh6qhSW5/0chJGlMCcCoY9MdQO9sARXxNV0wRgv/uxQtzIHH4+oPPtTiwFrNzC3SOZZl5+wb5cYHA
	dGPmcu0SPdhFoykEImr91QU13oo1vUNYEHhMOmUHfNJeDyXa9sdC/OyHFRkiDlHW7MMowuuv2WCwk
	xhkjvH0cw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lhODv-00728q-W8; Fri, 14 May 2021 03:10:48 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lhODi-00727h-SW; Fri, 14 May 2021 03:10:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=TJGSji2ZQJC1gEeWYsGmPT+9twgITBZ7l92YrBaGz8M=; b=U4CxZfPhknTF+EsiaBJvsH7bA0
 zZ7mJoxjnZT9Aer8Wds9bZMirC/kLqJvc/81p47Wa4B3SDqAyOKTuRviJuJ21pnvFwJQJg4aaKIwi
 bVEFc8QJjgOUAsIWp6tE1SXTrhaQ57yhLGwgwTxiKHWCEQ+t6A3TVdmVtMxNv/FmColNNpKYn3MUs
 XPA0wAxqmY7lzMAyP21quAjnNBTyxkH8JtxOWE9uQiTA3d8I2+FC9Y4Xfa8ykTizFJvf5GMuJ2Ecu
 2ijbR4oTdTGBHZHF1XLuFAE6c1T2xP+2my2Hs9TV80sk+7hpvpU61N+HqR+6OORvS/2TR/ln5EQJ8
 4/l7Q9KA==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lhODZ-00BgAU-7g; Fri, 14 May 2021 03:10:32 +0000
X-UUID: 7e08f968c24a4883b0114e97420363c5-20210513
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=TJGSji2ZQJC1gEeWYsGmPT+9twgITBZ7l92YrBaGz8M=; 
 b=SoWdPOz3pfiJwRPOvFp279daIN5ITE7Md38PT5PdvvFpwJZ/tKpE+R0dacuO4nkF85HglmlKaavPWtaJN856mPmni/wErlYQNcGQynL6wfpmAcRq5AgQdIkeXA1d/MBDmjG7J1tTMQE1baYOT3mxVWsET4N05vhF+7omMYoF3H8=;
X-UUID: 7e08f968c24a4883b0114e97420363c5-20210513
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <roger.lu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 351824189; Thu, 13 May 2021 20:10:19 -0700
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 13 May 2021 20:10:15 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 14 May 2021 11:10:13 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 14 May 2021 11:10:13 +0800
Message-ID: <7a7a07adedf5d3f430fecf81aed35c6321e5b634.camel@mediatek.com>
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
Date: Fri, 14 May 2021 11:10:13 +0800
In-Reply-To: <20210506045115.GA767398@roeck-us.net>
References: <20210428065440.3704-1-roger.lu@mediatek.com>
 <20210428065440.3704-4-roger.lu@mediatek.com>
 <20210506045115.GA767398@roeck-us.net>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210513_201030_073396_4DCE3760 
X-CRM114-Status: GOOD (  17.93  )
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

Hi Guenter,

Sorry for the late reply and thanks for the notice.

On Wed, 2021-05-05 at 21:51 -0700, Guenter Roeck wrote:
> On Wed, Apr 28, 2021 at 02:54:36PM +0800, Roger Lu wrote:
> > The Smart Voltage Scaling(SVS) engine is a piece of hardware
> > which calculates suitable SVS bank voltages to OPP voltage table.
> > Then, DVFS driver could apply those SVS bank voltages to PMIC/Buck
> > when receiving OPP_EVENT_ADJUST_VOLTAGE.
> > 
> > Signed-off-by: Roger Lu <roger.lu@mediatek.com>
> > ---
> >  drivers/soc/mediatek/Kconfig   |   10 +
> >  drivers/soc/mediatek/Makefile  |    1 +
> >  drivers/soc/mediatek/mtk-svs.c | 1723
> > ++++++++++++++++++++++++++++++++
> >  3 files changed, 1734 insertions(+)
> >  create mode 100644 drivers/soc/mediatek/mtk-svs.c
> > 
> 
> [ ... ]
> 
> > +
> > +	svsp_irq = irq_of_parse_and_map(svsp->dev->of_node, 0);
> > +	ret = devm_request_threaded_irq(svsp->dev, svsp_irq, NULL,
> > svs_isr,
> > +					svsp->irqflags, svsp->name,
> > svsp);
> 
> 0-day reports:
> 
> drivers/soc/mediatek/mtk-svs.c:1663:7-32: ERROR:
> 	Threaded IRQ with no primary handler requested without
> IRQF_ONESHOT
> 
> I would be a bit concerned about this. There is no primary (hard)
> interrupt handler, meaning the hard interrupt may be re-enabled after
> the default hard interrupt handler runs. This might result in endless
> interrupts.

Oh, we add IRQF_ONESHOT in "svs_get_svs_mt8183_platform_data()" for
threaded irq. So, please kindly let us know if we need to set more
flags or any other potential risks we should be aware. Thanks in
advance.

> 
> Guenter
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
