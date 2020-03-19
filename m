Return-Path: <SRS0=inF0=5E=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C197C4332D
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Mar 2020 11:36:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2A2032070A
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Mar 2020 11:36:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pr3IRDEC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2A2032070A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=huNwDVqoBLuCxpguYCqyJIDvUThE4xA+ilpEiukMPyk=; b=pr3IRDECS4Xc3x
	SFtBiHGIOD37zLrehAWwGrPQWHLSDeDR1qeap3U+Qq9L46FPBsj9bASvG1HLLklPnJY12ahYeXMQ5
	8jCD1NxOfU13/4j0ERxJAgobt1kzt3t/SXGO2U9RGgFfgKJHa7xjpDQWBMmPSC6Wur9OKV940xFpR
	JcxYLPNJHBwxuPdqANIsH0Ll0AhHLPeZEwimvKlfXlGHNhdSmKfBHx316AeE2xA8/7oKUy6KeHG1r
	Gzs2MvT9JAzlgs07EfFr/Z6mwDHTbY4kodSnJmV4VYTYgBUa4LhmZ4t+ery1sxFYFCzLC6oPOdutE
	Okx7bISmcOh/0J6EFS9A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jEtTL-00014M-18; Thu, 19 Mar 2020 11:36:23 +0000
Received: from mga12.intel.com ([192.55.52.136])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jEtTC-0000wi-4V; Thu, 19 Mar 2020 11:36:15 +0000
IronPort-SDR: zviuxzIC3Gzlsm6NPzv2OmrTt9VhaZOnq/h+Jdh6piUZ1oqnwjQEnZ4z0txupoZuMm33ONq7aT
 TuxoE2OeTaug==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2020 04:36:12 -0700
IronPort-SDR: zLFal0iZZQ0ZeR6+e3XbpetkEaXpQZVwtGXSMeK5IxeonJZfwJg60dAil2oiypArdRd8mzsDIw
 R6s5MCiPToyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,571,1574150400"; d="scan'208";a="444534943"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by fmsmga005.fm.intel.com with ESMTP; 19 Mar 2020 04:36:09 -0700
Received: from andy by smile with local (Exim 4.93)
 (envelope-from <andy.shevchenko@gmail.com>)
 id 1jEtT9-00B3pc-1y; Thu, 19 Mar 2020 13:36:11 +0200
Date: Thu, 19 Mar 2020 13:36:11 +0200
From: Andy Shevchenko <andy.shevchenko@gmail.com>
To: Dongchun Zhu <dongchun.zhu@mediatek.com>
Subject: Re: [V3, 2/2] media: i2c: Add DW9768 VCM driver
Message-ID: <20200319113611.GJ1922688@smile.fi.intel.com>
References: <20200228155958.20657-1-dongchun.zhu@mediatek.com>
 <20200228155958.20657-3-dongchun.zhu@mediatek.com>
 <20200305120516.GQ5379@paasikivi.fi.intel.com>
 <CAHp75Vf5km-YitoTUAFkr8LZVq2QMep1rC19ZpR-YRbeXgJOVQ@mail.gmail.com>
 <1584612215.5781.62.camel@mhfsdcap03>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1584612215.5781.62.camel@mhfsdcap03>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200319_043614_194343_98657B8F 
X-CRM114-Status: GOOD (  12.88  )
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 devicetree <devicetree@vger.kernel.org>,
 Nicolas Boichat <drinkcat@chromium.org>, srv_heupstream@mediatek.com,
 shengnan.wang@mediatek.com, Tomasz Figa <tfiga@chromium.org>,
 louis.kuo@mediatek.com, sj.huang@mediatek.com,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, bingbu.cao@intel.com,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Mar 19, 2020 at 06:03:35PM +0800, Dongchun Zhu wrote:
> On Tue, 2020-03-10 at 12:10 +0200, Andy Shevchenko wrote:
> > On Thu, Mar 5, 2020 at 2:07 PM Sakari Ailus
> > <sakari.ailus@linux.intel.com> wrote:
> > > On Fri, Feb 28, 2020 at 11:59:58PM +0800, Dongchun Zhu wrote:
> > > > This patch adds a V4L2 sub-device driver for DW9768 lens voice coil,
> > > > and provides control to set the desired focus via I2C serial interface.
> > 
> > ...
> > 
> > > > --- a/MAINTAINERS
> > > > +++ b/MAINTAINERS
> > > > @@ -5139,6 +5139,7 @@ M:      Dongchun Zhu <dongchun.zhu@mediatek.com>
> > > >  L:   linux-media@vger.kernel.org
> > > >  T:   git git://linuxtv.org/media_tree.git
> > > >  S:   Maintained
> > > > +F:   drivers/media/i2c/dw9768.c
> > > >  F:   Documentation/devicetree/bindings/media/i2c/dongwoon,dw9768.yaml
> > 
> > This has ordering issues.
> > Run parse-maintainers.pl to fix.
> > 
> 
> Pardon, how to run parse-maintainers.pl?
> Locally I ran this script, it occurs some syntax as below.
> $./scripts/parse-maintainers.pl

It's a perl script which is made non-executable by some reason.

So, proper run as a parameter to the language interpreter, i.e.
	$ perl scripts/parse-maintainer.pl

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
