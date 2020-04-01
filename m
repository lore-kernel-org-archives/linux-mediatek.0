Return-Path: <SRS0=ysX+=5R=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F863C2D0F3
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Apr 2020 13:19:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 56BE02073B
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Apr 2020 13:19:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tv98snOc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 56BE02073B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=fi.rohmeurope.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T502aAF1f3wAiEM4sn8wkTa39QI9FUkUOyVjeYx8J0o=; b=tv98snOc2JXL+L
	bCYaJbj43cYKXdiiDkSgHA3kDloDv4FWph2yPbuEEVq3kcS4/P1OCNF9SrcrCINA1P9ns3GMb+BYi
	AKslsO8YxhEZ4J5ycVXcr+BwZStxGlW0viKe1+NV5DlEfVr4JcJJ1TiKgnRNVGQYA2MuxFQr/TC3z
	OMPNQzc6RbxCFVbZiJjPq8iecQ1CGhfdP2UQfdPIuqJTuuXk1pTQbG6SQfDE3Sn5yXC0dyrTu3aT6
	hSDe+XE7tT4hgisqjlUuS+aJc0XzGCzePnfP5Ny3nS71aJJb5OhpwWCoh3gw6c5kIo+WO2Pc/xyVa
	AUkk/Y6DQBCqxeQU201Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jJdGh-0001f1-W0; Wed, 01 Apr 2020 13:18:55 +0000
Received: from mailgate1.rohmeurope.com ([87.129.152.131])
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jJdGe-0001e4-HW; Wed, 01 Apr 2020 13:18:54 +0000
X-AuditID: c0a8fbf4-473ff70000004419-d7-5e8494b8fb89
Received: from smtp.reu.rohmeu.com (will-cas002.reu.rohmeu.com
 [192.168.251.178])
 by mailgate1.rohmeurope.com (Symantec Messaging Gateway) with SMTP id
 E3.93.17433.8B4948E5; Wed,  1 Apr 2020 15:18:48 +0200 (CEST)
Received: from WILL-MAIL001.REu.RohmEu.com ([fe80::2915:304f:d22c:c6ba]) by
 WILL-CAS002.REu.RohmEu.com ([fe80::fc24:4cbc:e287:8659%12]) with mapi id
 14.03.0487.000; Wed, 1 Apr 2020 15:18:41 +0200
From: "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To: "andy.shevchenko@gmail.com" <andy.shevchenko@gmail.com>
Subject: Re: [SPF Softfail] Re: [PATCH v7 03/10] lib: add linear ranges helpers
Thread-Topic: [SPF Softfail] Re: [PATCH v7 03/10] lib: add linear ranges
 helpers
Thread-Index: AQHWB1cj+aMIIRocXUeZN2Io9Ehlr6himqGAgAFQhQCAACnkAIAACuYA
Date: Wed, 1 Apr 2020 13:18:41 +0000
Message-ID: <e2391c0749478d42ac7e2db4981b9d373a160323.camel@fi.rohmeurope.com>
References: <cover.1585656143.git.matti.vaittinen@fi.rohmeurope.com>
 <c4cd52979ec187c942fa5794aab11e6c7f944cbb.1585656143.git.matti.vaittinen@fi.rohmeurope.com>
 <20200331140523.GJ1922688@smile.fi.intel.com>
 <4e75e0fcc9782220798c90eee5e41788fe277cc1.camel@fi.rohmeurope.com>
 <CAHp75VcnK2A_qjBo3FEz-XC6Y=3z7ssSgT6AS-P_9EPyRXsFXQ@mail.gmail.com>
In-Reply-To: <CAHp75VcnK2A_qjBo3FEz-XC6Y=3z7ssSgT6AS-P_9EPyRXsFXQ@mail.gmail.com>
Accept-Language: en-US, de-DE
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [62.78.225.252]
Content-ID: <46EA8B12FBB01B4BBBF30B8D77848703@de.rohmeurope.com>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA01Te1BUVRifc+/d3Qu4dV0WOBH94UY2OCkxWH1N2NDU1M2cxnQaZ3KSLnFh
 d1wWZh+GTU28dniNvAKBFYQBkWUlHruWRrwGCE2FbWMFMTUQxoQEJkAIKOpeNoV/zvnO93t9
 f3yHJhUldCCt0Rl5vY7TqqTeVJd11b7zYlH6kRfLRv1hYHyVgvKmBinkzlWTMJnfg+Cfwj4Z
 tJQ2SWCh4goFVztnKCjICwHXja9JKB6bkILbbEdQUvwzgnJnOgWXW5opqOwdkEBaTZMUcqaC
 wOlslsGiO5OAor/rCLCPD0mgoLNfBoOt5VIYTHMhOHUmj4L5E70ISp0dBNQOuwhITQ+H8trL
 FNTUbYe6lUYKmh1LBMzPdkqgYqGYhOlbJRS4Sp0kmNt7ZeCyLhDQXnJWAld/MEK72UXCyYp2
 GTjsArfTvReG524KhLVlCpa7nUJ1Zx5B35/LKDKcbTjdgNjVlULELj4spNjZG2YZ23z3nIQ9
 Xz9CsNa5UPZ7y20Z+13Xc2yV3cQ6rDvYmrZJgrXbsqRs4dlqCXtrqE3KzgwMyPYHfeQTEc0Z
 jx3UxOlCX//ERz1Sc59MXAlOuj/MJ6Pk4GzkRWNmN7b3VaJs5E0rmCGErYNrpOdxCWHzol14
 0LSUicDZIzJRoGRew9U/Vq1zSGbKD3/za61EBHyZD3CGc4DwkA7gjgfNyFO/jVOyLUj0oZhg
 3PNHrNiWM+/jkd9T1z0VzF0CXyo7KFK8BBtbfZzYRswzOCt5Zt2RZAKw/d6SxDMzg8+0OUlP
 7Ycnx9f+72/DF5YaKdGGZEJwU2uoRxqJZ1oeIk+9DRfljMk8E2zFP5VNUPnI37IpwbKhtmxS
 WzapLZvUVUhiQzie02jjOCMftkvPm3bpE9TxwvVpQrwdeZZ74SL6t/vdbkTQqBs9RRMqP/lK
 RvoRxRPRCTHH1ZxBHaU3aXlDN8I0qVLKT70lYPIY7vjnvD7hEfQ0TakC5M+PFXysYMSsozyf
 yOsfoUE0rcLyzFxBuFXPx/FJsRqtcQMmaC/R3DtQaeB1MbyeMxnVUeJyRBmE7RChLULu4RNi
 riGRixe6HukV9AqdP1lRTdKOilrh7F0/h2fba0kFpUvQ8YEB8pOijBFlapPucegUCqCRyld+
 R5xpi/DbH3tOCXGEEHc9KU2MM3IbUGAyCn2gCty/9IWPI3L0aO6Hby5G7/vyQkj/3sO2Z+v8
 tXtS2APE+em11ayuVrfvC2TuvWllSfh7E/rTXhHzcy8vdbTu6ZzP3P1GYcbCSykNv3w1+c72
 ncryv6j6IfcqjW37rk03/nazxlZ5rD/G+7ZP6qvXyeIeQ9i3eR2unLbRJ68d0nwWq6IMai5s
 B6k3cP8BMtXnXKoEAAA=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200401_061852_730128_FF73367F 
X-CRM114-Status: GOOD (  22.92  )
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


On Wed, 2020-04-01 at 15:39 +0300, Andy Shevchenko wrote:
> On Wed, Apr 1, 2020 at 1:09 PM Vaittinen, Matti
> <Matti.Vaittinen@fi.rohmeurope.com> wrote:
> > On Tue, 2020-03-31 at 17:05 +0300, Andy Shevchenko wrote:
> > > On Tue, Mar 31, 2020 at 03:23:03PM +0300, Matti Vaittinen wrote:
> > > > +int linear_range_get_selector_low_array(const struct
> > > > linear_range
> > > > *r,
> > > > +                                   int ranges, unsigned int
> > > > val,
> > > > +                                   unsigned int *selector,
> > > > bool
> > > > *found)
> > > > +{
> > > > +   int i;
> > > > +   int ret = -EINVAL;
> > > > +
> > > > +   for (i = 0; i < ranges; i++) {
> > > > +           int tmpret;
> > > > +
> > > > +           tmpret = linear_range_get_selector_low(&r[i], val,
> > > > selector,
> > > > +                                                  found);
> > > > +
> > > > +           if (!tmpret)
> > > > +                   ret = 0;
> > > > +
> > > > +           if (*found)
> > > > +                   break;
> > > > +   }
> > > > +
> > > > +   return ret;
> > > > +}
> > > 
> > > Can we refactor this?
> > > 
> > >       int i;
> > >       int ret = -EINVAL;
> > > 
> > >       for (i = 0; i < ranges; i++) {
> > >               ret = linear_range_get_selector_low(&r[i], val,
> > > selector, found);
> > >               if (*found)
> > >                       break;
> > >       }
> > > 
> > >       return break;
> > > 
> > > This will unshadow the error code returned by the loop body.
> > 
> > What is the return break; doing here? I don't understand the
> > syntax.
> 
> Typo. return ret; should be.
> 
> > And we want the logic to be such that we return zero from this
> > function
> > if _any_ of the calls to linear_range_get_selector_low returned
> > zero.
> > (Even if further calls would return non-zero value). But we wan't
> > to
> > keep looking for better (in-range) match if *found is not true.
> 
> won't or want to? I'm confused with the last.

want :) Typo here too.

> Is this logic described in the description? Sorry, I forgot, although
> I had read it.

 * Scan array of ranges for selector which which range value matches
given
 * input value. Value is matching if it is equal or smaller than
given
 * value. If given value is found to be in a range scannins is
stopped and
 * @found is set true. If a range with values smaller than
given value is found
 * but the range max is being smaller than given
value, then the ranges
 * biggest selector is updated to @selector but
scanning ranges is continued
 * and @found is set to false.

I think it is but I am open to all suggestions how to improve doc!

> > > Or if ranges is guaranteed to be always positive number, convert
> > > this
> > > to do {} while.
> > 
> > I don't see the benefit :/
> 
> I see.
>  do {
>    ret = ...
>  } while (++i < ranges && *found == false);
> 
> much better to read.

Huh?
Compared to:
for (i = 0; i < ranges; i++) {
	ret = ...
}

I wouldn't say so.

As I explained, we need to have "temporary" return value in any case
because we need to return 0 if any of the calls to
linear_range_get_selector_low() returned 0. Return value 0 from
linear_range_get_selector_low() means we found "matching" value (lower
than input) and selector was updated (although input value was not in
range).


Br,
	Matti Vaittinen
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
