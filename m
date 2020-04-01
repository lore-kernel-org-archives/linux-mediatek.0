Return-Path: <SRS0=ysX+=5R=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A934EC10F26
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Apr 2020 12:40:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7BDB520776
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Apr 2020 12:40:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Z2GgIJvp";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BY7by+U+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7BDB520776
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jEtWXADZrUpJhnwT7WZMcm1rMn2Pop7LguSU4xkTksk=; b=Z2GgIJvpC7n3O4
	IOqbViCvXS0Sl3ylIkRGXELPzq66PDVvKSHuIhb11DHzq2sKsW19WEk9lskdIXjPwWTRoJGZBpC5w
	ER48ZTDrmdXVypOW8sbzHpc85ij1u/PgKSl6Uqu5Cm1B8xIIKrEJSxTlCZ8Y0NFNFgbbaK3WBYmXc
	pvth5b6laigsGDNzyZUJbMpC0MVbb5NBN69Az8PfbZ5tcZnbmFys6coHj/PK31adNmKWVGOwywllK
	BxOB1nxMULIH6YWZ5VA6sO2VJb06Aw41AIsZ2TAG5s39grWM86kEPOOiJpnXxiei9ElJ4SP0eVyWB
	BNO0nCChpNJn1bK22GPA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jJcf0-0000Zq-6b; Wed, 01 Apr 2020 12:39:58 +0000
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jJcex-0000Yv-C4; Wed, 01 Apr 2020 12:39:56 +0000
Received: by mail-pg1-x543.google.com with SMTP id 142so12051086pgf.11;
 Wed, 01 Apr 2020 05:39:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wqPuuqmEaKRyt+zX5ef2i5DbISQqc/uMRsheeu5DHEQ=;
 b=BY7by+U+lAhtPXmnx3rXQ2+9G6Z3XBbG1gMSjTRrlItiK2otMIaANBZNsUdlJxvA7r
 IM6Z/ClD4Efq3Eo6ybMSxZ2gKV5CpmcyHkWMeHr6qqCNwKLFyxmG/aobblX+81Z/mbIG
 LpTxdJSOe9FhTTGZ6GwO09TcYbJdmGMNL2XnQVLYChujPFC53U7Jp3izhR61vMfc7IwC
 Vn89J+yuLvI7X8e5+MYTc4lTFow3MqjFfdfQv6lNYf1DwkFfpGCMrf7BJdYXSZZU7KCf
 5TzAmPVcW/AhFAJM0gB/a2kBZ0OIhVemyPfRCd5AuW5cvK4YAY1hR68wvQ2v9aofLhBA
 xeLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wqPuuqmEaKRyt+zX5ef2i5DbISQqc/uMRsheeu5DHEQ=;
 b=JGAt2ttH795cOf41vqlZbwKx7coPl2hYIvsw0FXsUJZeHiOUqpvr7c2F0Y5tOOkr3D
 JBtInqfU4fE568aCkBWMRWuXfFjtXO3fWG9zZjuP6d7r3HMeycP8z+sQxIOJoDp15XTC
 rO0vO6ZyyCqAaYJrqkDqn0ZAUJ7PVp86nBi3V3wZ2LhEUzKm/LBuOjI2n5nYPNcY2mta
 Hihnh8KoXzMhuSuxJYXO0vnpbYxKsoO6VEG4LG0kYhNBmlcwLpGX230oAVW2dC7kkq6A
 3K0iUQTz7F/kkc1hfZkS0xEO7WD49K+FbF1ywflVBVvhKWcayI37IF+PCCX3IOSrWYdU
 sMMg==
X-Gm-Message-State: ANhLgQ2Pmhc77DuSxlBBTU2bfNmp2p6HvReR5wU/fTbuVUDV8gD++wEz
 RSD+zxCJjaAqA6w579SdffVz3+el/yjKCFcvSHo=
X-Google-Smtp-Source: ADFU+vt8xSuy+3Kztf1BbOHXikQzov8xlAL8+5OeJ/3MqZiCRQcpGljzj7pfgAzcw0+tmUPtsTQ7DRR1R41WyXQ22B4=
X-Received: by 2002:a63:798a:: with SMTP id
 u132mr23389168pgc.203.1585744794439; 
 Wed, 01 Apr 2020 05:39:54 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1585656143.git.matti.vaittinen@fi.rohmeurope.com>
 <c4cd52979ec187c942fa5794aab11e6c7f944cbb.1585656143.git.matti.vaittinen@fi.rohmeurope.com>
 <20200331140523.GJ1922688@smile.fi.intel.com>
 <4e75e0fcc9782220798c90eee5e41788fe277cc1.camel@fi.rohmeurope.com>
In-Reply-To: <4e75e0fcc9782220798c90eee5e41788fe277cc1.camel@fi.rohmeurope.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 1 Apr 2020 15:39:46 +0300
Message-ID: <CAHp75VcnK2A_qjBo3FEz-XC6Y=3z7ssSgT6AS-P_9EPyRXsFXQ@mail.gmail.com>
Subject: Re: [SPF Softfail] Re: [PATCH v7 03/10] lib: add linear ranges helpers
To: "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200401_053955_437911_A6111DDC 
X-CRM114-Status: GOOD (  27.85  )
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

On Wed, Apr 1, 2020 at 1:09 PM Vaittinen, Matti
<Matti.Vaittinen@fi.rohmeurope.com> wrote:
> On Tue, 2020-03-31 at 17:05 +0300, Andy Shevchenko wrote:
> > On Tue, Mar 31, 2020 at 03:23:03PM +0300, Matti Vaittinen wrote:

...

> > > + * It might be useful if we could support also inversely
> > > proportional ranges?
> >
> > Looks like remark that should not be here, rather in commit message
> > or even in cover letter.
>
> I think this is a good place so that anyone who opens this file will
> see what could be done to improve this. No one is looking at the old
> commit messages unless they face some problems. And cover letters fade
> away even faster - although the cover letter and commit messages may
> catch some attention during the patch submissions.
>
> So maybe you would agree with me if I added this also in cover letter
> and commit message :)

OK

...

> > > +int linear_range_get_selector_low(const struct linear_range *r,
> > > +                             unsigned int val, unsigned int
> > > *selector,
> > > +                             bool *found)

> > As far as I can see this is a bit different from _high counterpart.
>
> Yes. Because the logic is different. _low accepts selector for a
> closest value which is smaller or equal to given. _high accepts
> selector for a closest value which is higher or equal to given. This
> mean that both the _high and _low accept also input value which is not
> in the range - _low accepts input which is higher than range, _high
> accepts input which is lower than the range.

Thanks for elaboration.

> > > +   if (!r->step)
> >
> > Why not positive conditional?
>
> because we really want to test if step is zero.

> I can write it as
> if (r->step == 0) if that is preferred.

Yes, please. Then we will see that 0 has special meaning here.

>  But we definitely want to chek
> if r->step is zero and handle it as exception case. (We want to protect
> from division by zero - and in that case all selectors are Ok as range
> is constant)
>
>
> > > +           *selector = r->min_sel;
> > > +   else
> > > +           *selector = (val - r->min) / r->step + r->min_sel;
> > > +   return 0;
> > > +}

...

> > > +int linear_range_get_selector_low_array(const struct linear_range
> > > *r,
> > > +                                   int ranges, unsigned int val,
> > > +                                   unsigned int *selector, bool
> > > *found)
> > > +{
> > > +   int i;
> > > +   int ret = -EINVAL;
> > > +
> > > +   for (i = 0; i < ranges; i++) {
> > > +           int tmpret;
> > > +
> > > +           tmpret = linear_range_get_selector_low(&r[i], val,
> > > selector,
> > > +                                                  found);
> > > +
> > > +           if (!tmpret)
> > > +                   ret = 0;
> > > +
> > > +           if (*found)
> > > +                   break;
> > > +   }
> > > +
> > > +   return ret;
> > > +}
> >
> > Can we refactor this?
> >
> >       int i;
> >       int ret = -EINVAL;
> >
> >       for (i = 0; i < ranges; i++) {
> >               ret = linear_range_get_selector_low(&r[i], val,
> > selector, found);
> >               if (*found)
> >                       break;
> >       }
> >
> >       return break;
> >
> > This will unshadow the error code returned by the loop body.
>
> What is the return break; doing here? I don't understand the syntax.

Typo. return ret; should be.

> And we want the logic to be such that we return zero from this function
> if _any_ of the calls to linear_range_get_selector_low returned zero.
> (Even if further calls would return non-zero value). But we wan't to
> keep looking for better (in-range) match if *found is not true.

won't or want to? I'm confused with the last.
Is this logic described in the description? Sorry, I forgot, although
I had read it.
If no, perhaps it needs to be added either to description or as a
comment to the loop.

> > Or if ranges is guaranteed to be always positive number, convert this
> > to do {} while.
>
> I don't see the benefit :/

I see.
 do {
   ret = ...
 } while (++i < ranges && *found == false);

much better to read.

-- 
With Best Regards,
Andy Shevchenko

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
