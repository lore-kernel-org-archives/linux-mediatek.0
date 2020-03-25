Return-Path: <SRS0=43xy=5K=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBD0AC43331
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Mar 2020 11:47:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8B3F320714
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Mar 2020 11:47:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="i/l0Gvtm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8B3F320714
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=fi.rohmeurope.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5mb82X3Z06A81947s0NeJIeUxwA2X1VYIYmJMG7rVrA=; b=i/l0GvtmG8+vwc
	AHsOK56vhkXzMLbYCJLzwMZAVInacQTcFAyeqQjb+59xy0/rvzv/6GQLiYBZc3ZuB3ogMzxxYxzJw
	o78z89MNVC6CnT6w/BR20a0nIBI4pqecDs1j/qWi8cOzRwFeLVkuIJrNUydafSrbsdm8Aqh9PAVpA
	JWAFWcV8xV3TOu4A6+6utiGE5hHUUoR2NAXwy6vHlwbGJHqoBKS0760gYMG7JUl7IgHrCY2EQ58GI
	A3eklz71P+oTtZ0EMBAXb3Py9ncvIZequaSk600EMnq4INWg0tj2+MfvGu1f8w7C2NLBvi7u7wONF
	ENRaJJlghDtbG+wn2Yow==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jH4V5-0004jQ-G7; Wed, 25 Mar 2020 11:47:11 +0000
Received: from mailgate1.rohmeurope.com ([87.129.152.131])
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jH4V2-0004iu-OI; Wed, 25 Mar 2020 11:47:10 +0000
X-AuditID: c0a8fbf4-489ff70000004419-7c-5e7b44b8af81
Received: from smtp.reu.rohmeu.com (will-cas002.reu.rohmeu.com
 [192.168.251.178])
 by mailgate1.rohmeurope.com (Symantec Messaging Gateway) with SMTP id
 6B.E1.17433.8B44B7E5; Wed, 25 Mar 2020 12:47:04 +0100 (CET)
Received: from WILL-MAIL001.REu.RohmEu.com ([fe80::2915:304f:d22c:c6ba]) by
 WILL-CAS002.REu.RohmEu.com ([fe80::fc24:4cbc:e287:8659%12]) with mapi id
 14.03.0487.000; Wed, 25 Mar 2020 12:46:58 +0100
From: "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To: "broonie@kernel.org" <broonie@kernel.org>
Subject: Re: [PATCH v6 06/10] regulator: use linear_ranges helper
Thread-Topic: [PATCH v6 06/10] regulator: use linear_ranges helper
Thread-Index: AQHWAbaPCcyAOxMqz0a76vzAO0GO3KhXu6iAgAEV4ACAAEzzgIAAA4eA
Date: Wed, 25 Mar 2020 11:46:58 +0000
Message-ID: <6305832490e27343f4a01a926ed11a4a5c2aae90.camel@fi.rohmeurope.com>
References: <cover.1584977512.git.matti.vaittinen@fi.rohmeurope.com>
 <5522b2e03f77e1b7c93adf07b85747ea9ddfbf9b.1584977512.git.matti.vaittinen@fi.rohmeurope.com>
 <20200324142427.GF7039@sirena.org.uk>
 <739a01454410a5d7acf231c92e5b3ffcae49d84c.camel@fi.rohmeurope.com>
 <20200325113425.GC4346@sirena.org.uk>
In-Reply-To: <20200325113425.GC4346@sirena.org.uk>
Accept-Language: en-US, de-DE
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [62.78.225.252]
Content-ID: <5354D7E5FBF5A94EBB9DE96A773193A2@de.rohmeurope.com>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA01Ta0wUZxTNNzM7M4DbjMvrK0Kqa6yRFvHV9LZBgtY0Y38Qbf+1ETqUKUsK
 u2QfLWBsKEpUqPKShysoBVFKCY9FlLogdksoaMt2AyhakOCSRrYVKixQRKEzbBV+fee755x7
 7o97WVJVygaxiVqjqNcKSWram7pZs2AJa913OGbbUkUw9DoXKChrqKPh9FQlCacySwgYz/sZ
 wbx7EsHzgi4GmkobFOAuv0XB7Y4JCvJzt4BjsJCEotExGvqzLAhKin5HUGY/RkF3UyMFFzp7
 FXC0qoGGHFcw2O2NDMz2nyDgzLPLBFicdxSQ3/EbA33Xy2joO+pAcO5iLgXTpzoRlNpvEFB9
 10FA5rGdUFbdTUHV5dehsXmOgOnJDgUsOWcUUO4uIuHxUAkFjlI7CVntnQw4atwEtJdcUsBt
 qxHasxwkFJe3M9BskbQd/R/A3an7kmBxnoJ5m11CD6YRdD2ZR1Fv8XXn6xC/8LQA8bMzBRQ/
 OZjF8I0Pf1DwV76/R/A1U+H8j+Zhhr96cxNfYTHxzTWhfFXbOMFbak/SfMGlSgU/dKeN5id6
 e5kDIR/7RMQJxi8/SkzQhkd+6qPpeJhLp5T5pX6Tnc9koEHfbMSymNuFe24EZCNvVsUNIJw7
 2Md4Pt0IDz1eYmQRzUXg7HsS9GL9uDBc9LSKljUk93cAnmnNIWTCl9uDzYVOwiPaizMb/iI9
 +H3cNXIByZjiNuFFu1UhYyUXje/nzhKeMCuBu/89uyzy4nbg4rErlIwRF4JPZkwsNyW5QGz5
 c27ZjDkOX2yzkx7sj8edi//XN+Brc/WUPDTJbcEN18M91ijcPNxCefAGfCZnlPHMsBb3nB2j
 8lCAeVWCecVtXuU2r3KbV7krkKIW4WQhMSlBMIrbt+pF01a9TpMsPZ/pki3Is+nuVrRk229D
 BIts6FWWUPsrN759OEb1SpwuPk0jGDSxelOSaLAhzJJqP2WzmBqjUsYLaemiXveCWsdS6kDl
 5tH8QypOzvpCFFNE/Qs2mGXVWLlNuifVWr2YIKZ+nphkXKEJ1ktu7h3kZxC18aJeMBk1sfJ+
 xBqkBZGpNVKu8z3JrjSkCMlS1WO9hd5g88bLK0m2s7y6klRRWp1WDApUfihLOVmqMWlfBrlQ
 IIvUvsqKvRK7Rjr3l31cUgQhRSSYv5IjjMIKFZSB0qLZ4oNp1j3fHnzwtY3euCMxKnLd6eLC
 9Jg/JqPdiy0j1yKOuCzZu3T9+x8NG0IyH23+dbBWt/uEa+zJm0VNV3t2Bo0/jzZPjKhQ+j9x
 oQNJ+1p+iTyQ/m6/6Tur+x1T2HnVBmbGqq1fn/Zaq9b1ycB6lU/OT9H+ycePHF94dmi3rbZe
 TRk0wvZQUm8Q/gP5xf8YqwQAAA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200325_044708_947918_75624AE6 
X-CRM114-Status: GOOD (  17.60  )
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
 "rafael@kernel.org" <rafael@kernel.org>, "tony@atomide.com" <tony@atomide.com>,
 "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
 "brendanhiggins@google.com" <brendanhiggins@google.com>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "yamada.masahiro@socionext.com" <yamada.masahiro@socionext.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
 "uwe@kleine-koenig.org" <uwe@kleine-koenig.org>,
 "vincenzo.frascino@arm.com" <vincenzo.frascino@arm.com>,
 "dan.j.williams@intel.com" <dan.j.williams@intel.com>,
 "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
 "herbert@gondor.apana.org.au" <herbert@gondor.apana.org.au>,
 "b.zolnierkie@samsung.com" <b.zolnierkie@samsung.com>,
 "andy.shevchenko@gmail.com" <andy.shevchenko@gmail.com>,
 "krzk@kernel.org" <krzk@kernel.org>, "ardb@kernel.org" <ardb@kernel.org>,
 "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
 "wens@csie.org" <wens@csie.org>, "agross@kernel.org" <agross@kernel.org>,
 "Laine, Markus" <Markus.Laine@fi.rohmeurope.com>, "bp@suse.de" <bp@suse.de>,
 "pmladek@suse.com" <pmladek@suse.com>,
 "zaslonko@linux.ibm.com" <zaslonko@linux.ibm.com>,
 "ckeepax@opensource.cirrus.com" <ckeepax@opensource.cirrus.com>,
 "arnd@arndb.de" <arnd@arndb.de>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "rf@opensource.cirrus.com" <rf@opensource.cirrus.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "sre@kernel.org" <sre@kernel.org>, "davidgow@google.com" <davidgow@google.com>,
 "skhan@linuxfoundation.org" <skhan@linuxfoundation.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "support.opensource@diasemi.com" <support.opensource@diasemi.com>,
 "sbkim73@samsung.com" <sbkim73@samsung.com>,
 "patches@opensource.cirrus.com" <patches@opensource.cirrus.com>,
 "rdunlap@infradead.org" <rdunlap@infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "talgi@mellanox.com" <talgi@mellanox.com>, "Mutanen,
 Mikko" <Mikko.Mutanen@fi.rohmeurope.com>,
 "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
 "mhiramat@kernel.org" <mhiramat@kernel.org>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "olteanv@gmail.com" <olteanv@gmail.com>,
 "davem@davemloft.net" <davem@davemloft.net>,
 "mazziesaccount@gmail.com" <mazziesaccount@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hello Mark,

On Wed, 2020-03-25 at 11:34 +0000, Mark Brown wrote:
> On Wed, Mar 25, 2020 at 06:58:56AM +0000, Vaittinen, Matti wrote:
> > On Tue, 2020-03-24 at 14:24 +0000, Mark Brown wrote:
> > > On Tue, Mar 24, 2020 at 10:30:54AM +0200, Matti Vaittinen wrote:
> > > >  
> > > > -		if (!(min_uV <= linear_max_uV && max_uV >=
> > > > range-
> > > > > min_uV))
> > > > +		ret = linear_range_get_selector_high(range,
> > > > min_uV,
> > > > &sel,
> > > > +						     &found);
> > > > +		if (ret)
> > > >  			continue;
> > > Why are these going for _get_selector_high()?  Usually we try to
> > > choose
> > > the lowest voltage we can.
> > I tried to maintain the existing logic - which is (if I am not
> > mistaken) to search for first value which is equal or higher than
> > the
> > minimum. Hence we use the linear_range_get_selector_high() - which
> > does
> > not return selector for voltage smaller than given value (minimum).
> 
> OK, that's a bit confusingly named then - I'd read that as finding
> the
> highest value within the range without registering that the function
> only takes a single value so can't verify if the selector is in range
> or
> not.  I'll also need to check that the modified code verifies that
> the
> selector returned is within range.

In this API the boolan "found" reflects whether the value referred by
the selector is in range. I didn't check the "found" here because the
returned sel is in any case passed to rdev->desc->ops-
>list_voltage(rdev, sel) - and returned voltage is checked to be in
valid range.

And Rob once wrote to me that "naming is hard" :) And I do agree. I
selected this name because API returns value which is equal or higher
than given. _low variant returns value which is lower or equal.

Just a note - Dropped some email from CC as I keep getting delivery
failures.

Br,
	Matti
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
