Return-Path: <SRS0=ysX+=5R=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D28CDC43331
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Apr 2020 10:10:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A1D4020857
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Apr 2020 10:10:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ff/OQtGB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A1D4020857
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=fi.rohmeurope.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EdivNKq3QyT5R0MMTIy28ywQlZNALd+wz+8qFsDW1g4=; b=Ff/OQtGBaOd9AK
	w3I0Ow5v1PmvfyRwPGvvfFyPFC6toNUf16txTfk9SzbhTzfZngVceTyXxzdPXvgyK1OzPyBL4EuEB
	EA1LfDn+C+E42FKXX+dVf0JYgHLKJRbHQgJKuEe6ZduUzzXNln7YZ+MqpoARMvmn/t8QP2MCYcneg
	2B5WKlUypHDZ8vIhnuUNVLRFKY68ecvnci/I8UtBp0yAcedh6bx8mQuFEPtqmJJUqg8d4miqZDPCE
	L/YZjGyewWNAgK9abxLs4GGwD/m1ubO4qVNZo7RTDuYt8gDyCDH0m6lNhIM2vR+wp7BqiurNPFe6Z
	XyuXyZuv/SEAJn7KgT7g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jJaJt-00082O-28; Wed, 01 Apr 2020 10:10:01 +0000
Received: from mailgate1.rohmeurope.com ([87.129.152.131])
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jJaJp-00081Z-FL; Wed, 01 Apr 2020 10:09:59 +0000
X-AuditID: c0a8fbf4-473ff70000004419-9f-5e84687066ee
Received: from smtp.reu.rohmeu.com (will-cas002.reu.rohmeu.com
 [192.168.251.178])
 by mailgate1.rohmeurope.com (Symantec Messaging Gateway) with SMTP id
 31.E2.17433.078648E5; Wed,  1 Apr 2020 12:09:52 +0200 (CEST)
Received: from WILL-MAIL001.REu.RohmEu.com ([fe80::2915:304f:d22c:c6ba]) by
 WILL-CAS002.REu.RohmEu.com ([fe80::fc24:4cbc:e287:8659%12]) with mapi id
 14.03.0487.000; Wed, 1 Apr 2020 12:09:47 +0200
From: "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To: "andy.shevchenko@gmail.com" <andy.shevchenko@gmail.com>
Subject: Re: [SPF Softfail] Re: [PATCH v7 03/10] lib: add linear ranges helpers
Thread-Topic: [SPF Softfail] Re: [PATCH v7 03/10] lib: add linear ranges
 helpers
Thread-Index: AQHWB1cj+aMIIRocXUeZN2Io9Ehlr6himqGAgAFQhQA=
Date: Wed, 1 Apr 2020 10:09:46 +0000
Message-ID: <4e75e0fcc9782220798c90eee5e41788fe277cc1.camel@fi.rohmeurope.com>
References: <cover.1585656143.git.matti.vaittinen@fi.rohmeurope.com>
 <c4cd52979ec187c942fa5794aab11e6c7f944cbb.1585656143.git.matti.vaittinen@fi.rohmeurope.com>
 <20200331140523.GJ1922688@smile.fi.intel.com>
In-Reply-To: <20200331140523.GJ1922688@smile.fi.intel.com>
Accept-Language: en-US, de-DE
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [62.78.225.252]
Content-ID: <99BDC5946DF8894EBBBD54365573B640@de.rohmeurope.com>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA02Tf0wbZRzG995dewdbzVFgvCIaaSaGJYBkRr9uhBA3k2MiOpdFoxF2yI2S
 lVL7Q8FMxUGd66IDBgO64ghQYMj40RJFhEE63OaI1AaEQaYRwQWqQoQCMhS9o27wz91z7/M8
 38/7x/cYUlnChDPZWqOg1/IalTyQ6m9ac8To1EVpT3xUuBeGptYosLW1yOHThVoSZouvIvin
 9BoNHZVtMvBV36RgsG+OgpKz0eC5dY6E8slpOYyYHQgqyr9HYHMXUXCjo52CiwNDMiisa5PD
 GW8EuN3tNCyPfExA2d+NBDimRmVQ0vcdDcPdNjkMF3oQXKg/S8HiJwMIKt1XCLCPeQg4WbQH
 bPYbFNQ1RkHj3VYK2p0rBCzO98mg2ldOwh+3KyjwVLpJMPcO0OBp8hHQW9Egg8GvjdBr9pBw
 vrqXBqdDzPaNHISxhQkxsL5KwarLLaqfFhFc+3MVJe3hWj5rQdza3VLELS+VUtz8LTPNtf/y
 uYzrvDROcE0LcdxX1h9p7ov+x7gah4lzNu3m6npmCc7RfFrOlTbUyrjboz1ybm5oiH4p4rXt
 CRm88e3D2VnauMSj29VN1m6Z7nxKnnd5CRUg20ELYhjMPolnXBoLCmSU7CjCd8xewv9xHeGf
 Zz6USyE5m4At47QFBTAh7D5c+00NKWVI1huKy/76lZKMYPYQPuUeIvyhl/GV39uRX+/F/YPd
 MklT7C5srarayCjYVLzUsU5KWsmOIDzfeUjSAWJ++rJlA4bYh/HpgrmNPMmGYcedlY05mGVx
 fY+b9OtQPDu1/v95JP5ypZWS7kyy0bitO84vk3DJpRT/lEhcdmaS9t8gCH9bNU0Vo53WLQDr
 Ztm6WbZuKVu3lGuQrBnhHD5bk8UbhfhYvWCK1eeqc8TXm7k5DuRfbl8X+teV7EIEg1zoQYZQ
 hSry9xelKR/IyM3MV/MGdbrepBEMLoQZUhWiuHBA9BSZfP67gj73nvUQQ6nCFI9PlryhZCXW
 cUHQCfp7bgTDqLDi2efFYpBeyBLyjmVrjJs2wQRIwwPDQwyCNlPQ8yajOl1ajnSDuB2StUPk
 Jh2RuAYdnyOe+qs3UTxTPFtdSzID1XbxOTbfayeVlDZXK4SHKZ55QSywUkFt0t7HeVEYg1TB
 in0portD/M/vT/OKIEIE/ZBXKIGM/KYVXoDeyXAmJuuifNejfe81vEW/2lq5FrNtmzHoRHnR
 o3nj+2OCzfbGyKtpJmc2v7P7g2JN3iJqOe6tq82syeo68f7hlbbkHic9+dvTA5dPTkw/Mli8
 btPFJr7Y/3rqc+6uen7mQGpy88RTCeHDiflH7McmxzoJuXV8+pWW6LhTXKNlLeqoijKo+fjd
 pN7A/wfMgf4JpAQAAA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200401_030957_813873_5BA0912A 
X-CRM114-Status: GOOD (  34.75  )
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
 "milo.kim@ti.com" <milo.kim@ti.com>,
 "andrei.stefanescu@microchip.com" <andrei.stefanescu@microchip.com>,
 "rafael@kernel.org" <rafael@kernel.org>, "tony@atomide.com" <tony@atomide.com>,
 "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
 "brendanhiggins@google.com" <brendanhiggins@google.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "yamada.masahiro@socionext.com" <yamada.masahiro@socionext.com>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
 "vincenzo.frascino@arm.com" <vincenzo.frascino@arm.com>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
 "herbert@gondor.apana.org.au" <herbert@gondor.apana.org.au>,
 "b.zolnierkie@samsung.com" <b.zolnierkie@samsung.com>,
 "krzk@kernel.org" <krzk@kernel.org>,
 "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
 "wens@csie.org" <wens@csie.org>, "agross@kernel.org" <agross@kernel.org>,
 "Laine, Markus" <Markus.Laine@fi.rohmeurope.com>, "bp@suse.de" <bp@suse.de>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "zaslonko@linux.ibm.com" <zaslonko@linux.ibm.com>,
 "ckeepax@opensource.cirrus.com" <ckeepax@opensource.cirrus.com>,
 "arnd@arndb.de" <arnd@arndb.de>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "rf@opensource.cirrus.com" <rf@opensource.cirrus.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "sre@kernel.org" <sre@kernel.org>, "davidgow@google.com" <davidgow@google.com>,
 "skhan@linuxfoundation.org" <skhan@linuxfoundation.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "dan.j.williams@intel.com" <dan.j.williams@intel.com>,
 "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "support.opensource@diasemi.com" <support.opensource@diasemi.com>,
 "sbkim73@samsung.com" <sbkim73@samsung.com>,
 "patches@opensource.cirrus.com" <patches@opensource.cirrus.com>,
 "rdunlap@infradead.org" <rdunlap@infradead.org>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "talgi@mellanox.com" <talgi@mellanox.com>, "Mutanen, 
 Mikko" <Mikko.Mutanen@fi.rohmeurope.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "uwe@kleine-koenig.org" <uwe@kleine-koenig.org>,
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

Hello Andy,

Thanks for the review again. I'll send v8 later this week :) 

On Tue, 2020-03-31 at 17:05 +0300, Andy Shevchenko wrote:
> On Tue, Mar 31, 2020 at 03:23:03PM +0300, Matti Vaittinen wrote:
> > Many devices have control registers which control some measurable
> > property. Often a register contains control field so that change in
> > this field causes linear change in the controlled property. It is
> > not
> > a rare case that user wants to give 'meaningful' control values and
> > driver needs to convert them to register field values. Even more
> > often user wants to 'see' the currently set value - again in
> > meaningful units - and driver needs to convert the values it reads
> > from register to these meaningful units. Examples of this include:
> > 
> > - regulators, voltage/current configurations
> > - power, voltage/current configurations
> > - clk(?) NCOs
> > 
> > and maybe others I can't think of right now.
> > 
> > Provide a linear_range helper which can do conversion from user
> > value
> > to register value 'selector'.
> > 
> > The idea here is stolen from regulator framework and patches
> > refactoring
> > the regulator helpers to use this are following.
> 
> ...
> 
> > +/*
> > + * linear_ranges.c -- helpers to map values in a linear range to
> > range index
> 
> File name inside file can bring an unnecessary churn in the future in
> case we
> would like to rename it (by some reason). So, better to remove.

Agree.

> > + *
> > + * Original idea borrowed from regulator framework
> > + *
> > + * It might be useful if we could support also inversely
> > proportional ranges?
> 
> Looks like remark that should not be here, rather in commit message
> or even in cover letter.

I think this is a good place so that anyone who opens this file will
see what could be done to improve this. No one is looking at the old
commit messages unless they face some problems. And cover letters fade
away even faster - although the cover letter and commit messages may
catch some attention during the patch submissions.

So maybe you would agree with me if I added this also in cover letter
and commit message :)

> 
> > + * Copyright 2020 ROHM Semiconductors
> > + */
> 
> ...
> 
> > +/**
> > + * linear_range_get_value - fetch a value from given range
> > + *
> 
> This blank line is not needed. Can we drop them everywhere?

Yep. We can. I see that is recommended way in Documentation/doc-
guide/kernel-doc.rst. (Although for my eye it looks clearer with the
empty line)

> 
> > + * @r:		pointer to linear range where value is looked
> > from
> > + * @selector:	selector for which the value is searched
> > + * @val:	address where found value is updated
> > + *
> > + * Search given ranges for value which matches given selector.
> > + *
> > + * Return: 0 on success, -EINVAL given selector is not found from
> > any of the
> > + * ranges.
> > + */
> 
> ...
> 
> > +int linear_range_get_selector_low(const struct linear_range *r,
> > +				  unsigned int val, unsigned int
> > *selector,
> > +				  bool *found)
> > +{
> > +	*found = false;
> > +
> > +	if (r->min > val)
> > +		return -EINVAL;
> > +
> > +	if (linear_range_get_max_value(r) >= val)
> > +		*found = true;
> 
> As far as I can see this is a bit different from _high counterpart. 

Yes. Because the logic is different. _low accepts selector for a
closest value which is smaller or equal to given. _high accepts
selector for a closest value which is higher or equal to given. This
mean that both the _high and _low accept also input value which is not
in the range - _low accepts input which is higher than range, _high
accepts input which is lower than the range.

Both functions bail out right away if input is not "acceptable". 

_low if:
+	if (r->min > val)
> > +		return -EINVAL;

_high if:
+	if (linear_range_get_max_value(r) < val)
> > +		return -EINVAL;
> > 

After this check, if the input is within the other end of range, then
we can set found to true.

for _low:
> > +	if (linear_range_get_max_value(r) >= val)
> > +		*found = true;

for _high:
> > +	if (r->min <= val) {
> > +		*found = true;
> > 

And I agree with your later comment - inversing this check for makes
the function cleaner.

> So, if we
> even not found the range we still check r->step. Can we make them
> symmetrical
> (to some extend)?

Yes we can. For _low we can do:

if (linear_range_get_max_value(r) < val) {
	*selector = r->max_sel;
	return 0;
}

if (!r->step)
	*selector = r->max_sel;
else
	*selector = DIV_ROUND_UP(val - r->min, r->step) + r - min_sel;
*found = true;
 
return 0;
 


> 
> > +	if (!r->step)
> 
> Why not positive conditional?

because we really want to test if step is zero. I can write it as
if (r->step == 0) if that is preferred. But we definitely want to chek
if r->step is zero and handle it as exception case. (We want to protect
from division by zero - and in that case all selectors are Ok as range
is constant)


> > +		*selector = r->min_sel;
> > +	else
> > +		*selector = (val - r->min) / r->step + r->min_sel;
> > +	return 0;
> > +}
> 
> ...
> 
> > +int linear_range_get_selector_low_array(const struct linear_range
> > *r,
> > +					int ranges, unsigned int val,
> > +					unsigned int *selector, bool
> > *found)
> > +{
> > +	int i;
> > +	int ret = -EINVAL;
> > +
> > +	for (i = 0; i < ranges; i++) {
> > +		int tmpret;
> > +
> > +		tmpret = linear_range_get_selector_low(&r[i], val,
> > selector,
> > +						       found);
> > +
> > +		if (!tmpret)
> > +			ret = 0;
> > +
> > +		if (*found)
> > +			break;
> > +	}
> > +
> > +	return ret;
> > +}
> 
> Can we refactor this?
> 
> 	int i;
> 	int ret = -EINVAL;
> 
> 	for (i = 0; i < ranges; i++) {
> 		ret = linear_range_get_selector_low(&r[i], val,
> selector, found);
> 		if (*found)
> 			break;
> 	}
> 
> 	return break;
> 
> This will unshadow the error code returned by the loop body.

What is the return break; doing here? I don't understand the syntax.
And we want the logic to be such that we return zero from this function
if _any_ of the calls to linear_range_get_selector_low returned zero.
(Even if further calls would return non-zero value). But we wan't to
keep looking for better (in-range) match if *found is not true.


> Or if ranges is guaranteed to be always positive number, convert this
> to do {} while.

I don't see the benefit :/

> 
> ...
> 
> > +int linear_range_get_selector_high(const struct linear_range *r,
> > +				   unsigned int val, unsigned int
> > *selector,
> > +				   bool *found)
> > +{
> > +	*found = false;
> > +
> > +	if (linear_range_get_max_value(r) < val)
> > +		return -EINVAL;
> > +
> > +	if (r->min <= val) {
> > +		*found = true;
> > +	} else {
> > +		*selector = r->min_sel;
> > +		return 0;
> > +	}
> 
> 	if (r->min > val) {
> 		*selector = r->min_sel;
> 		return 0;
> 	}

I agree. Inversing this condition makes it cleaner.


Best Regards
	Matti
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
