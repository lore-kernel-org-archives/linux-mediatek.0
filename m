Return-Path: <SRS0=ysX+=5R=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78CD3C43331
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Apr 2020 14:42:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4827520719
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Apr 2020 14:42:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="T3F0ZCLR";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KFqOSyug"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4827520719
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xEhK/iK0JU2ersJ6m/uxKfjbw05Cbft1nPMRk9vGdqg=; b=T3F0ZCLRN70yOh
	eUAlr/nLR9BcO16PDBTN9hn0le7SDqpS8cMj661DlxFz7If5ipn060eEO9zq8XwtlkUdAfhsq3FNm
	yacZgrKMLvMH3ocWzEl0w3cFYxH4ZiTMiPSiGUkZ6Nh9ZvJXIfyTkNQfsAxXS+XClyK9PHd14xfQz
	ZfqS2UUYl1N2shIhhAUs/svI7HT5JiR25xaUsoPP9RTTAiJS27hOSfITl5bxk8LBlDXgNOi+ECULe
	jyiTzjwjl6VguYxH09fcXg9ylOSzUCaBqj+cFZJNPcMkdN9vw5PwWzB7Mq5WoLDemo4EyZcwFBRFt
	W23NgkN4dlgQudgRQOXw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jJeZm-0003Ht-RW; Wed, 01 Apr 2020 14:42:42 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jJeZj-0003HK-JY; Wed, 01 Apr 2020 14:42:41 +0000
Received: by mail-pf1-x443.google.com with SMTP id n10so28330pff.3;
 Wed, 01 Apr 2020 07:42:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Q90hrgNcNJKYEC6yYa5bR0zS8Vf46EDEU9V74N3cOTU=;
 b=KFqOSyugBytV1r3v1kWOcCA23judvI3n85v+rvDwGoTaVk6SFZd/t2qp3oVZ4nbyCs
 iQcnGXIHOU/uIObN9B+06Za6yfXcHIFTJX9WCpNbAq314omU5Fwl8dmK32pXRFGS5a41
 yK6gJ99IHisBdRDbzFKHIpQp/x6zOFQlljK12vVmDOLypZyVKXpM+pJzG9MK0SmjPaLF
 4Nc+6hx1/9pO0f/TmI2PApw1BHimzfM3ITCoUlBTxQ18DFIWbm+CqC/IbLHCHBf17A3W
 dYuLXRqH6XqdtnRbFJpwGfkO3FjNM16w3MjYyVEoKsFgVV/UQYNrNtbT39jud0455yn5
 OIxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Q90hrgNcNJKYEC6yYa5bR0zS8Vf46EDEU9V74N3cOTU=;
 b=qqfw8xzO1+yJDYHsl94NL2dWT8hF1vE02fcbVQ82UhFMbcRYkFAluq3lm/i040IlZ6
 445ugWoiXVuFMGezAfIXHomat8HUpzvoTSBy/C0NvjAXxPwTrkYghjWwXsmtS2QbRK3l
 o/sVmoT7qb2HSDLgfx711w01ytG3iuExRKaWLJUanX8sqQkM5QOP3kCc3BgiCJ6HWyAP
 +4VUvgPcAY8JuEAn0sTIZOHYRbOEFGDUIO9N0y1BrpbtNvN6WYM1rax0JBE/c3M+T6GA
 VA56gbA55UOi5lgR7kriyLJwE7VSplbcmedrAT1oKs18KOM26tcXmEraU0No6DWMxy+m
 u1Og==
X-Gm-Message-State: ANhLgQ1OOnZwXlrhBZwL0Ke9FkJymJBr0gCV4p3GcDoHFwa833lwT5ZU
 v2roI3X8Exe12MVoxZzopoCjSh+pz4r/vgnExSI=
X-Google-Smtp-Source: ADFU+vuwdIPZMv4HrN9NwaYQLMOxpFkdOH5mKIcx8PDHQjGmtCyUnxQdQqZrzehIH1fF3GlTx/PASqdNSMzwk8zOuKk=
X-Received: by 2002:aa7:9097:: with SMTP id i23mr23057323pfa.170.1585752158433; 
 Wed, 01 Apr 2020 07:42:38 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1585656143.git.matti.vaittinen@fi.rohmeurope.com>
 <c4cd52979ec187c942fa5794aab11e6c7f944cbb.1585656143.git.matti.vaittinen@fi.rohmeurope.com>
 <20200331140523.GJ1922688@smile.fi.intel.com>
 <4e75e0fcc9782220798c90eee5e41788fe277cc1.camel@fi.rohmeurope.com>
 <CAHp75VcnK2A_qjBo3FEz-XC6Y=3z7ssSgT6AS-P_9EPyRXsFXQ@mail.gmail.com>
 <e2391c0749478d42ac7e2db4981b9d373a160323.camel@fi.rohmeurope.com>
In-Reply-To: <e2391c0749478d42ac7e2db4981b9d373a160323.camel@fi.rohmeurope.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 1 Apr 2020 17:42:31 +0300
Message-ID: <CAHp75Vd24w6dqqCYH46GKnJ5Nzase6LdVgSSVwQ3FEzMd5gsYA@mail.gmail.com>
Subject: Re: [SPF Softfail] Re: [PATCH v7 03/10] lib: add linear ranges helpers
To: "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200401_074239_640911_399E92C2 
X-CRM114-Status: GOOD (  17.29  )
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

On Wed, Apr 1, 2020 at 4:18 PM Vaittinen, Matti
<Matti.Vaittinen@fi.rohmeurope.com> wrote:
> On Wed, 2020-04-01 at 15:39 +0300, Andy Shevchenko wrote:
> > On Wed, Apr 1, 2020 at 1:09 PM Vaittinen, Matti
> > <Matti.Vaittinen@fi.rohmeurope.com> wrote:
> > > On Tue, 2020-03-31 at 17:05 +0300, Andy Shevchenko wrote:
> > > > On Tue, Mar 31, 2020 at 03:23:03PM +0300, Matti Vaittinen wrote:
> > > > > +int linear_range_get_selector_low_array(const struct
> > > > > linear_range
> > > > > *r,
> > > > > +                                   int ranges, unsigned int
> > > > > val,
> > > > > +                                   unsigned int *selector,
> > > > > bool
> > > > > *found)
> > > > > +{
> > > > > +   int i;
> > > > > +   int ret = -EINVAL;
> > > > > +
> > > > > +   for (i = 0; i < ranges; i++) {
> > > > > +           int tmpret;
> > > > > +
> > > > > +           tmpret = linear_range_get_selector_low(&r[i], val,
> > > > > selector,
> > > > > +                                                  found);
> > > > > +
> > > > > +           if (!tmpret)
> > > > > +                   ret = 0;
> > > > > +
> > > > > +           if (*found)
> > > > > +                   break;
> > > > > +   }
> > > > > +
> > > > > +   return ret;
> > > > > +}

Looked again at the code of the callee.
So, *found becomes true if and only if the return is 0 (or other way
around if you prefer).
Now I'm wondering why you need 'found' at all?

It means above may be as simple as

      int i;
      int ret = -EINVAL;

      for (i = 0; i < ranges; i++) {
               ret = linear_range_get_selector_low(&r[i], val, selector, found);
               if (*found)
                       break;
      }

      return ret;

or assuming 'found' will gone

  int i
  int ret = -EINVAL;

  for (i = 0; i < ranges && ret; i++) {
      ret = linear_range_get_selector_low(&r[i], val, selector);
  }
  return ret;

...

>  * value. If given value is found to be in a range scannins is

> I think it is but I am open to all suggestions how to improve doc!

Thanks. At least fix a typo: scannins -> scannings

...

> Compared to:
> for (i = 0; i < ranges; i++) {
>         ret = ...
> }
>
> I wouldn't say so.
>
> As I explained, we need to have "temporary" return value in any case
> because we need to return 0 if any of the calls to
> linear_range_get_selector_low() returned 0. Return value 0 from
> linear_range_get_selector_low() means we found "matching" value (lower
> than input) and selector was updated (although input value was not in
> range).

See above.

--
With Best Regards,
Andy Shevchenko

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
