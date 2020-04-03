Return-Path: <SRS0=YIXp=5T=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0C2FC43331
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Apr 2020 11:02:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C1F1C2078C
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Apr 2020 11:02:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="o8nI7Gew"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C1F1C2078C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aPxv1jve4yOtliESe9YbZii2/vJvcU0LcHEhkQUCVZU=; b=o8nI7GewqmOlxV
	LbUFQ0dr6HgiuMEu4Uk0pIApGsNOzdP5zA7cq4syHJGbzCbXhuPux8XizfIiThF8/8qqE5IyrrBTr
	ne4tMYTyUYKRbQpFzdDmsmJ5tA5w69+9xskENRBuYcr35MGV6ubnIajaEBYyXaA8H2w+8E3f2/QZz
	csh2SjsP0orYzkClvI+6QQmElxOhi7rVjd/HL3RotGCrVDJLRk229O5wle2iqcm7ML3T09ePkYijo
	Ku4ZjMVLdDBR5kCoaAuTWTmrPFBp4hI/3Z71xWvomsM3ZAa/OUuv/m+Uz6MrqtHlMkD0i7kjdfSNK
	fLTRspe3s+NH9O0X0fqQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jKK5h-00069S-0x; Fri, 03 Apr 2020 11:02:25 +0000
Received: from mga02.intel.com ([134.134.136.20])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jKK5e-00068u-5r; Fri, 03 Apr 2020 11:02:23 +0000
IronPort-SDR: OJ0hXsPasudUa58ohP1CzSjph7gqi8efePegcCmqhYKRXDJmN03sYgDSnWd9hLDaRheQVwMFOU
 9kbyrwBlovfA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2020 04:02:21 -0700
IronPort-SDR: 5a/olc0ACQqahkFQkQxRyVBNsCA4xCic/xEhfND7MJmYVdslUpbDkdLtGefMcO/KHcxgKc3A9/
 kvDVjv3BeWPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,339,1580803200"; d="scan'208";a="268327035"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by orsmga002.jf.intel.com with ESMTP; 03 Apr 2020 04:02:10 -0700
Received: from andy by smile with local (Exim 4.93)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1jKK5S-00FPZD-Th; Fri, 03 Apr 2020 14:02:10 +0300
Date: Fri, 3 Apr 2020 14:02:10 +0300
From: "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>
To: "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
Subject: Re: [PATCH v8 00/10] Support ROHM BD99954 charger IC
Message-ID: <20200403110210.GO1922688@smile.fi.intel.com>
References: <cover.1585902279.git.matti.vaittinen@fi.rohmeurope.com>
 <50797a6ac6cda4647f9a396dab0ad08017e3138b.camel@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <50797a6ac6cda4647f9a396dab0ad08017e3138b.camel@fi.rohmeurope.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200403_040222_267495_E7B6A6A3 
X-CRM114-Status: GOOD (  17.64  )
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
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
 "vkoul@kernel.org" <vkoul@kernel.org>, "krzk@kernel.org" <krzk@kernel.org>,
 "m.reichl@fivetechno.de" <m.reichl@fivetechno.de>,
 "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
 "wens@csie.org" <wens@csie.org>, "andreas@kemnade.info" <andreas@kemnade.info>,
 "agross@kernel.org" <agross@kernel.org>, "Laine,
 Markus" <Markus.Laine@fi.rohmeurope.com>,
 "Adam.Thomson.Opensource@diasemi.com" <Adam.Thomson.Opensource@diasemi.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "ckeepax@opensource.cirrus.com" <ckeepax@opensource.cirrus.com>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
 "mazziesaccount@gmail.com" <mazziesaccount@gmail.com>,
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
 "b.zolnierkie@samsung.com" <b.zolnierkie@samsung.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Apr 03, 2020 at 10:07:41AM +0000, Vaittinen, Matti wrote:
> On Fri, 2020-04-03 at 11:36 +0300, Matti Vaittinen wrote:
> > Support ROHM BD99954 Battery Management IC
> > 
> > ROHM BD99954 is a Battery Management IC for 1-4 cell Lithium-Ion
> > secondary battery. BD99954 is intended to be used in space-constraint
> > equipment such as Low profile Notebook PC, Tablets and other
> > applications.
> > 
> > Series extracts a "linear ranges" helper out of the regulator
> > framework. Linear ranges helper is intended to help converting
> > real-world values to register values when conversion is linear. I
> > suspect this is useful also for power subsystem and possibly for clk.
> 
> I see Mark has acked/reviewed both the regulator changes and
> linear_ranges code. Do you think Mark should take the linear_ranges and
> regulator changes in his tree? I don't know Sebastian's schedule or
> when the charger portion is good to go - but I know that each new
> regulator driver which is added to regulator tree has a chance of using
> the struct regulator_linear_range - which will break when this series
> is applied. Or what would be the best way to avoid breaking regulators?
> 
> OTOH, if Mark takes linear_ranges in his tree, then this power portion
> of the series will depend on linear_ranges stuff that is in regulator
> tree. I guess this must be pretty standard stuff for you and you
> probably know how to handle it but I just wanted to point out the risk
> of breaking regulator build without visible merge conflicts.
> 
> Please let me know if I should split the series and rebase
> linear_ranges / regulator stuff on top of regulator tree.

From my point of view, you need to wait till rc1 is out and rebase the series.
The cross-subsystem changes can be handled by maintainers in a form of
immutable branches / tags. On your side you may recommend them how to proceed,
but the final decision is by them.

-- 
With Best Regards,
Andy Shevchenko



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
