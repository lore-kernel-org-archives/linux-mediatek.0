Return-Path: <SRS0=lKUU=7K=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35B16C433E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 May 2020 03:36:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0873120888
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 May 2020 03:36:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PkP+nxSO";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="TUF7+Zf5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0873120888
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ShrL+ZewzAouStBebc4WOVTPgKixfGOkV+H0ew05RPY=; b=PkP+nxSOnvchSj
	EmRNGhp0GQGEjweL5+V5hp8pCKtJcUfoeGBphClYO+g8HdThtmLUQFCeUDbBDJZ1pe4O2fPA4XIlh
	Cw8jAXN2Qeb/LMPKy0ezINMQblpJUbNliEgihgVL6F74oRhS9F1gbH4AfWLIMvDNY8usTVJEG1B67
	95YMTVm58wwSnqjXm5dqy4Q3+64oPjQ4mPUmTsMNTGNw87vatHmsw3i3O2NjGtKA+m0CdrD/lR9LY
	nQAnIW8s/wkExduTBrhYPNLiFNRsDUMVqrnJk8Pdurp7JpCceoibhCKs9G/1KSHjtDadZP6ChMDpB
	SoB6/AOxu2PNMsWMrY/g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1je9LY-0007zB-8m; Thu, 28 May 2020 03:36:44 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1je9LW-0007ye-7p; Thu, 28 May 2020 03:36:43 +0000
X-UUID: faa115bcb225478a870f95e80bf2edc4-20200527
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=B6mKHMDfrymV2HHPTTa5aBOQ9ky9BHCqAwadTmNHccs=; 
 b=TUF7+Zf5fFkb6aXHGMEhOvrn6uow7lzAU5G7sk4CucFjAx5XmRNTxiOSavhADjZZgnbktTj4YfccuA5vOhv4SsB0Ep6nE+0404oRJHcWMTTDkZF/LTCSb97CqMMW19Q2giNFgEXIP4A9EpTGZuGD4oRvEz2lZry1RBMzK3xlxKI=;
X-UUID: faa115bcb225478a870f95e80bf2edc4-20200527
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <dongchun.zhu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 491293446; Wed, 27 May 2020 19:36:40 -0800
Received: from MTKMBS31DR.mediatek.inc (172.27.6.102) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 27 May 2020 20:36:38 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31DR.mediatek.inc
 (172.27.6.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 28 May 2020 11:36:30 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 28 May 2020 11:36:29 +0800
Message-ID: <1590636882.8804.474.camel@mhfsdcap03>
Subject: Re: [V9, 1/2] media: dt-bindings: media: i2c: Document OV02A10
 bindings
From: Dongchun Zhu <dongchun.zhu@mediatek.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Date: Thu, 28 May 2020 11:34:42 +0800
In-Reply-To: <20200527211628.GT7618@paasikivi.fi.intel.com>
References: <20200523084103.31276-1-dongchun.zhu@mediatek.com>
 <20200523084103.31276-2-dongchun.zhu@mediatek.com>
 <20200526182847.GA92449@bogus> <1590569355.8804.448.camel@mhfsdcap03>
 <CAL_Jsq+sN0SVidTrY0ODXEkzkxYFvG1FTnL0oRQBSKf=ynLdyQ@mail.gmail.com>
 <20200527211628.GT7618@paasikivi.fi.intel.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 0450CC54ABF4AD762CD5AF3FD76B1C4256091870E9459F877A5F0726FFA223302000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200527_203642_287889_CB0606C5 
X-CRM114-Status: GOOD (  15.38  )
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
 dongchun.zhu@mediatek.com, Louis Kuo <louis.kuo@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Cao Bing Bu <bingbu.cao@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 "moderated list:ARM/FREESCALE IMX / MXC
 ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Sakari, Rob,

On Thu, 2020-05-28 at 00:16 +0300, Sakari Ailus wrote:
> Hi Rob, Dongchun,
> 
> On Wed, May 27, 2020 at 09:27:22AM -0600, Rob Herring wrote:
> > > > > +    properties:
> > > > > +      endpoint:
> > > > > +        type: object
> > > > > +        additionalProperties: false
> > > > > +
> > > > > +        properties:
> > >
> > > Actually I wonder whether we need to declare 'clock-lanes' here?
> > 
> > Yes, if you are using it.
> 
> Dongchun, can you confirm the chip has a single data and a single clock
> lane and that it does not support lane reordering?
> 

From the datasheet, 'MIPI inside the OV02A10 provides one single
uni-directional clock lane and one bi-directional data lane solution for
communication links between components inside a mobile device.
The data lane has full support for HS(uni-directional) and
LP(bi-directional) data transfer mode.'

The sensor doesn't support lane reordering, so 'clock-lanes' property
would not be added in next release.

> So if there's nothing to convey to the driver, also the data-lanes should
> be removed IMO.
> 

However, 'data-lanes' property may still be required.
It is known that either data-lanes or clock-lanes is an array of
physical data lane indexes. Position of an entry determines the logical
lane number, while the value of an entry indicates physical lane, e.g.,
for 1-lane MIPI CSI-2 bus we could have "data-lanes = <1>;", assuming
the clock lane is on hardware lane 0.

As mentioned earlier, the OV02A10 sensor supports only 1C1D and does not
support lane reordering, so here we shall use 'data-lanes = <1>' as
there is only a clock lane for OV02A10.

Reminder:
If 'data-lanes' property is not present, the driver would assume
four-lane operation. This means for one-lane or two-lane operation, this
property must be present and set to the right physical lane indexes.
If the hardware does not support lane reordering, monotonically
incremented values shall be used from 0 or 1 onwards, depending on
whether or not there is also a clock lane.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
