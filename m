Return-Path: <SRS0=lKUU=7K=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E550FC433E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 May 2020 08:13:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B51AF20B80
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 May 2020 08:13:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cDW2CENw";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="ZmuMmaRW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B51AF20B80
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X+zoQCKp6ZOD5/Zmocarz0xs2V2uBmPsNoLffZs3Ihw=; b=cDW2CENwSDSmjG
	UH7t2BvF+12xjJCwC8g3h8FlQFK2O76ANo9pS25WngxLCBUbfPp9xs9VeJcOae/kl18nhSH+RJYLu
	+Jal3JZxJMYXdF5ZdAOlo1GPWFTEEIIQrCltMiHz3GkVsR1WEm+0CmvKDyx+MSVEzgy04KYJSy5Pq
	yPg/xnt93J5eBOiGKn5FhjT0QBT/aSrGB7Ktjf7/Plx7HhYjqIulOyggLiu6IzumOgX+d8ee6OVGU
	1eXKk1w/e1RM8P6r/by8lfj91mc8QaEwM3DS9TdMk9NMgGybaKqGq8kOm1eXIa7673yt7nQfMdTzt
	tWCbKLZXJhnKY619iVWw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jeDf0-0006rY-6a; Thu, 28 May 2020 08:13:06 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jeDeo-0006eg-TP; Thu, 28 May 2020 08:12:58 +0000
X-UUID: 6b86cc787cd640b095d3642c22018e83-20200528
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=vdtwpDh+BfZcY9fDqODOL1gT1h9erHJDlZqiyVdKXQw=; 
 b=ZmuMmaRWWGZgcQs1oemoalKmlFPS239xjO4kzXUxQ2ijMGIE2B9pR68jSteAK4O3voBy+yB0o4hl6mv+Jof6BmPRE2IIe2O1oSGfv5BdDjRwAcvZBe57vU7xtG9vZz9V/NV7j/3kJinFgEOQlN8P99ns6a6hWGxDf6yoBD+daQw=;
X-UUID: 6b86cc787cd640b095d3642c22018e83-20200528
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <dongchun.zhu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1776174737; Thu, 28 May 2020 00:12:53 -0800
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 28 May 2020 01:06:33 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N2.mediatek.inc
 (172.27.4.87) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 28 May 2020 16:06:29 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 28 May 2020 16:06:30 +0800
Message-ID: <1590653082.8804.517.camel@mhfsdcap03>
Subject: Re: [V9, 1/2] media: dt-bindings: media: i2c: Document OV02A10
 bindings
From: Dongchun Zhu <dongchun.zhu@mediatek.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Date: Thu, 28 May 2020 16:04:42 +0800
In-Reply-To: <20200528072332.GW7618@paasikivi.fi.intel.com>
References: <20200523084103.31276-1-dongchun.zhu@mediatek.com>
 <20200523084103.31276-2-dongchun.zhu@mediatek.com>
 <20200526182847.GA92449@bogus> <1590569355.8804.448.camel@mhfsdcap03>
 <CAL_Jsq+sN0SVidTrY0ODXEkzkxYFvG1FTnL0oRQBSKf=ynLdyQ@mail.gmail.com>
 <20200527211628.GT7618@paasikivi.fi.intel.com>
 <1590636882.8804.474.camel@mhfsdcap03>
 <20200528072332.GW7618@paasikivi.fi.intel.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 40A29D3792692DD8CE5B51233948BE224921176E99DFDF64883FC26B2B3119662000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200528_011255_249854_F4934AFD 
X-CRM114-Status: GOOD (  23.40  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 srv_heupstream <srv_heupstream@mediatek.com>, devicetree@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>,
 Shengnan Wang =?UTF-8?Q?=28=E7=8E=8B=E5=9C=A3=E7=94=B7=29?=
 <shengnan.wang@mediatek.com>, Tomasz Figa <tfiga@chromium.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Sj Huang <sj.huang@mediatek.com>, Nicolas Boichat <drinkcat@chromium.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Louis Kuo <louis.kuo@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Cao Bing Bu <bingbu.cao@intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 "moderated list:ARM/FREESCALE IMX / MXC
 ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Sakari,

On Thu, 2020-05-28 at 10:23 +0300, Sakari Ailus wrote:
> Hi Dongchun,
> 
> On Thu, May 28, 2020 at 11:34:42AM +0800, Dongchun Zhu wrote:
> > Hi Sakari, Rob,
> > 
> > On Thu, 2020-05-28 at 00:16 +0300, Sakari Ailus wrote:
> > > Hi Rob, Dongchun,
> > > 
> > > On Wed, May 27, 2020 at 09:27:22AM -0600, Rob Herring wrote:
> > > > > > > +    properties:
> > > > > > > +      endpoint:
> > > > > > > +        type: object
> > > > > > > +        additionalProperties: false
> > > > > > > +
> > > > > > > +        properties:
> > > > >
> > > > > Actually I wonder whether we need to declare 'clock-lanes' here?
> > > > 
> > > > Yes, if you are using it.
> > > 
> > > Dongchun, can you confirm the chip has a single data and a single clock
> > > lane and that it does not support lane reordering?
> > > 
> > 
> > From the datasheet, 'MIPI inside the OV02A10 provides one single
> > uni-directional clock lane and one bi-directional data lane solution for
> > communication links between components inside a mobile device.
> > The data lane has full support for HS(uni-directional) and
> > LP(bi-directional) data transfer mode.'
> > 
> > The sensor doesn't support lane reordering, so 'clock-lanes' property
> > would not be added in next release.
> > 
> > > So if there's nothing to convey to the driver, also the data-lanes should
> > > be removed IMO.
> > > 
> > 
> > However, 'data-lanes' property may still be required.
> > It is known that either data-lanes or clock-lanes is an array of
> > physical data lane indexes. Position of an entry determines the logical
> > lane number, while the value of an entry indicates physical lane, e.g.,
> > for 1-lane MIPI CSI-2 bus we could have "data-lanes = <1>;", assuming
> > the clock lane is on hardware lane 0.
> > 
> > As mentioned earlier, the OV02A10 sensor supports only 1C1D and does not
> > support lane reordering, so here we shall use 'data-lanes = <1>' as
> > there is only a clock lane for OV02A10.
> > 
> > Reminder:
> > If 'data-lanes' property is not present, the driver would assume
> > four-lane operation. This means for one-lane or two-lane operation, this
> > property must be present and set to the right physical lane indexes.
> > If the hardware does not support lane reordering, monotonically
> > incremented values shall be used from 0 or 1 onwards, depending on
> > whether or not there is also a clock lane.
> 
> How can the driver use four lanes, considering the device only supports a
> single lane??
> 

I understood your meaning.
If we omit the property 'data-lanes', the sensor should work still.
But then what's the meaning of the existence of 'data-lanes'?
If this property 'data-lanes' is always optional, then why dt-bindings
provide the interface?

In the meantime, if omitting 'data-lanes' for one sensor(transmitter)
that has only one physical data lane, MIPI receiver(e.g., MIPI CSI-2)
shall enable four-lane configuration, which may increase consumption of
both power and resource in the process of IIC communication.
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
