Return-Path: <SRS0=IT6v=7J=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A208EC433E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 May 2020 21:16:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 69D55207E8
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 May 2020 21:16:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LoAls8Z+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 69D55207E8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kjlTEDZVSE1sA0Fu+yILeW4H4Od+kXwqFPSI1KuIeq8=; b=LoAls8Z+NhCmec
	we5HBrVCelhb4lERKJ0oZGWdxAZ/51leT8X8qrBbun6FXz4EBm2EL3ATMeSyWOGr3HeG0VFXL+KFa
	7NaZsAQtGhL++3QsK8lfYbPgMtYxCKE7hrgz80RYRtmgHrMX1XH03OKi9yO2+BrcRSJbfxMW2wVyE
	eKGNc9Xej4Aa8hUFffLBfWmnWDhiv1BzXMsh/2HJhIdwARCFgG34YMwkRSdvZmERcbu9ul6Uj9B2b
	RMrJyyeSr9DuK1GtdpdrYJ42dUIRC2a2N17U06AmzT+aI3V5URp97BsbliNlzEPmqoiGy+6EMaaaP
	aOrgjqwet26eMDqNPBDQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1je3Pq-0000ft-Ie; Wed, 27 May 2020 21:16:46 +0000
Received: from mga17.intel.com ([192.55.52.151])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1je3Pf-0000WU-UA; Wed, 27 May 2020 21:16:37 +0000
IronPort-SDR: XLbsj49dxAyL4bNSCHPV3SqYZnw37u/vAgQ1NRgZf+qt0M+MoWVgkwZFPI0MuKONG1Vin6sWDC
 a9SHKD4LnlDg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2020 14:16:35 -0700
IronPort-SDR: XCm8vub/jNoIWjRW3pQgdNpxd20fY5viVZZhDBe1JUEsvjmEBvyvBAAIgEeyHz31GajEQ6Ggny
 cgVGkXlUxPsA==
X-IronPort-AV: E=Sophos;i="5.73,442,1583222400"; d="scan'208";a="468887887"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2020 14:16:31 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
 id 9D86F206EA; Thu, 28 May 2020 00:16:28 +0300 (EEST)
Date: Thu, 28 May 2020 00:16:28 +0300
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Rob Herring <robh@kernel.org>, Dongchun Zhu <dongchun.zhu@mediatek.com>
Subject: Re: [V9, 1/2] media: dt-bindings: media: i2c: Document OV02A10
 bindings
Message-ID: <20200527211628.GT7618@paasikivi.fi.intel.com>
References: <20200523084103.31276-1-dongchun.zhu@mediatek.com>
 <20200523084103.31276-2-dongchun.zhu@mediatek.com>
 <20200526182847.GA92449@bogus>
 <1590569355.8804.448.camel@mhfsdcap03>
 <CAL_Jsq+sN0SVidTrY0ODXEkzkxYFvG1FTnL0oRQBSKf=ynLdyQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAL_Jsq+sN0SVidTrY0ODXEkzkxYFvG1FTnL0oRQBSKf=ynLdyQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200527_141635_984950_7DA77ED9 
X-CRM114-Status: UNSURE (   9.63  )
X-CRM114-Notice: Please train this message.
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 srv_heupstream <srv_heupstream@mediatek.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Shengnan Wang =?utf-8?B?KOeOi+Wco+eUtyk=?= <shengnan.wang@mediatek.com>,
 Tomasz Figa <tfiga@chromium.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Sj Huang <sj.huang@mediatek.com>, Nicolas Boichat <drinkcat@chromium.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Louis Kuo <louis.kuo@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Cao Bing Bu <bingbu.cao@intel.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Rob, Dongchun,

On Wed, May 27, 2020 at 09:27:22AM -0600, Rob Herring wrote:
> > > > +    properties:
> > > > +      endpoint:
> > > > +        type: object
> > > > +        additionalProperties: false
> > > > +
> > > > +        properties:
> >
> > Actually I wonder whether we need to declare 'clock-lanes' here?
> 
> Yes, if you are using it.

Dongchun, can you confirm the chip has a single data and a single clock
lane and that it does not support lane reordering?

So if there's nothing to convey to the driver, also the data-lanes should
be removed IMO.

-- 
Kind regards,

Sakari Ailus

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
