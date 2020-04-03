Return-Path: <SRS0=YIXp=5T=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DEDFC43331
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Apr 2020 11:51:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 50AED2082F
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Apr 2020 11:51:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Yhu77OF6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 50AED2082F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cHZHuKvqyafQIANTEBvV3BVjMuyFoB0hT0iYdr0AwVk=; b=Yhu77OF6SdzrjO
	jqHS8mAvXmCnVKXeqL4bHm0QqmXkTbjzFPUTXXXLDKgPmvJ7Sz4+VF8BKJNfu33obYWib/AEUn59C
	VmZrjjaDALeQkE96yOA4Sn0DAHbrmwskbD/tla2mReLzPV3/e5Vg7yYWzASzZkNwETP6JFr7xHfNm
	nYso/usyKsUHyyFE3EwRVXP51HMNmIqmWJlQYjXjP9EQ4mgbIMw1JhnFEqOgMRyCtUg229pKq+cLY
	ViwFD+S3cwfZtqscdZO4K/F++ZiE537TlEPKV8a3HclgX2AobaBDjWi+SuzUQmdRSKBu/8vCGyLJ0
	KsCPBdV5J+EIgB05fCag==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jKKr6-00052w-6l; Fri, 03 Apr 2020 11:51:24 +0000
Received: from mga07.intel.com ([134.134.136.100])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jKKr3-00052P-HK; Fri, 03 Apr 2020 11:51:22 +0000
IronPort-SDR: 8wz3hEErgBObpGWyXsqvSkZOChl88728Qbj+J9S9XTKznLHymadlSdNfqs/on/fkn/iMq3nEHF
 JoADuhWIoLgA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2020 04:51:18 -0700
IronPort-SDR: TWrbSbCFDjIQwYAdP91BTNgBx/UU4Q79gmoYhmJ4QZRpOiv5dueLdZ7ioHSWnn57wMs5F925U7
 rnoxQbgpkGnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,339,1580803200"; d="scan'208";a="329143239"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by orsmga001.jf.intel.com with ESMTP; 03 Apr 2020 04:51:07 -0700
Received: from andy by smile with local (Exim 4.93)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1jKKqp-00FQBf-N3; Fri, 03 Apr 2020 14:51:07 +0300
Date: Fri, 3 Apr 2020 14:51:07 +0300
From: "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>
To: "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
Subject: Re: [PATCH v8 00/10] Support ROHM BD99954 charger IC
Message-ID: <20200403115107.GX1922688@smile.fi.intel.com>
References: <cover.1585902279.git.matti.vaittinen@fi.rohmeurope.com>
 <50797a6ac6cda4647f9a396dab0ad08017e3138b.camel@fi.rohmeurope.com>
 <20200403110210.GO1922688@smile.fi.intel.com>
 <8007dadb0b3a13934f2a950204506a156cb2e65e.camel@fi.rohmeurope.com>
 <20200403115016.GW1922688@smile.fi.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200403115016.GW1922688@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200403_045121_624744_2230011E 
X-CRM114-Status: GOOD (  18.03  )
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
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "andrei.stefanescu@microchip.com" <andrei.stefanescu@microchip.com>,
 "heiko@sntech.de" <heiko@sntech.de>, "rafael@kernel.org" <rafael@kernel.org>,
 "tony@atomide.com" <tony@atomide.com>,
 "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
 "brendanhiggins@google.com" <brendanhiggins@google.com>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "kholk11@gmail.com" <kholk11@gmail.com>,
 "hsin-hsiung.wang@mediatek.com" <hsin-hsiung.wang@mediatek.com>,
 "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
 "axel.lin@ingics.com" <axel.lin@ingics.com>,
 "gregory.clement@bootlin.com" <gregory.clement@bootlin.com>,
 "b.zolnierkie@samsung.com" <b.zolnierkie@samsung.com>,
 "krzk@kernel.org" <krzk@kernel.org>,
 "m.reichl@fivetechno.de" <m.reichl@fivetechno.de>,
 "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
 "wens@csie.org" <wens@csie.org>, "andreas@kemnade.info" <andreas@kemnade.info>,
 "agross@kernel.org" <agross@kernel.org>, "Laine,
 Markus" <Markus.Laine@fi.rohmeurope.com>,
 "Adam.Thomson.Opensource@diasemi.com" <Adam.Thomson.Opensource@diasemi.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "ckeepax@opensource.cirrus.com" <ckeepax@opensource.cirrus.com>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "rf@opensource.cirrus.com" <rf@opensource.cirrus.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "sre@kernel.org" <sre@kernel.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "support.opensource@diasemi.com" <support.opensource@diasemi.com>,
 "baolin.wang@linaro.org" <baolin.wang@linaro.org>,
 "sbkim73@samsung.com" <sbkim73@samsung.com>,
 "patches@opensource.cirrus.com" <patches@opensource.cirrus.com>,
 "rdunlap@infradead.org" <rdunlap@infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Mutanen,
 Mikko" <Mikko.Mutanen@fi.rohmeurope.com>,
 "vkoul@kernel.org" <vkoul@kernel.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "mazziesaccount@gmail.com" <mazziesaccount@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Apr 03, 2020 at 02:50:16PM +0300, andriy.shevchenko@linux.intel.com wrote:
> On Fri, Apr 03, 2020 at 11:13:54AM +0000, Vaittinen, Matti wrote:
> > On Fri, 2020-04-03 at 14:02 +0300, andriy.shevchenko@linux.intel.com
> > wrote:
> > > On Fri, Apr 03, 2020 at 10:07:41AM +0000, Vaittinen, Matti wrote:
> > > > On Fri, 2020-04-03 at 11:36 +0300, Matti Vaittinen wrote:
> 
> ...
> 
> > > From my point of view, you need to wait till rc1 is out and rebase
> > > the series.
> > 
> > Does this mean that there is no new regulator drivers expected to be
> > added after rc1 is out? If this is the case, the rebasing this series
> > on top of rc1 should work as then I get all new drivers (for a release)
> > converted. This is of course fine by me - but again we will risk of
> > breaking regulators if the series slips to next release. Thus I thought
> > that perhaps we should try getting the regulators stuff in Marks tree
> > so that further reguator drivers wouldn't be broken.
> 
> We already almost in the middle of merge window. With such a change I believe
> there is no room for testing it, so, it will be quite unlikely it makes v5.7
> release.
> 
> That is, you have approximately 6 more weeks to polish this code.

(If you need so, of course)

> > But as I said, my intention is not to claim I know how to do this. On
> > the contrary - I have _never_ participated in maintaining a tree that
> > will be merged by others. So, please just let me know what you see the
> > best. I can do splitting the series or rebasing to regulator tree or
> > rebase to rc1 when it is out if required :)

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
