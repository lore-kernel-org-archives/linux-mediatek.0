Return-Path: <SRS0=GVU/=5S=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E70C2C2D0F4
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Apr 2020 04:03:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B733820757
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Apr 2020 04:03:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jv13Kma6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B733820757
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=fi.rohmeurope.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:Subject:To:From:Reply-To:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SCEqdey4FlWuc6Mxu+Zxbu/jLQE/LvlNcpm06jj1w4k=; b=jv13Kma66mbRE9
	qE9AqG6uGLdKKrtIfhwo/l0FyyxjSmJtLiyi/3/VG7C3GM4fbX1wdVtHgEYDOvyvFTkEH14RNbm9B
	yUQnO65HrzV7ugpyykSbr94XAF5085vLdCjZrYQidWwnhPHRDK/GERh7X45nq6V1wKT+nqVcv9Iif
	1glxROo3yCjz/uSUlEn75ZoRPLwAiniqCoR/Fwi1XqYz7zbeT/oO2dDZHNF993A2fIq3YiVylyQVi
	Y0rIAu+C90Fvql7HnGjY9UfQAN9FrJR4PytnQ1/YTUE0fTB21tLKUys/AhRLuxX7xB1x2LylbqLIp
	Rb83TacG0cs2Q5GUwIaQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jJr4Y-0008FM-3C; Thu, 02 Apr 2020 04:03:18 +0000
Received: from mailgate1.rohmeurope.com ([87.129.152.131])
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jJr4U-0008E2-Fz; Thu, 02 Apr 2020 04:03:16 +0000
X-AuditID: c0a8fbf4-489ff70000004419-ea-5e8563fdb129
Received: from smtp.reu.rohmeu.com (will-cas002.reu.rohmeu.com
 [192.168.251.178])
 by mailgate1.rohmeurope.com (Symantec Messaging Gateway) with SMTP id
 18.A4.17433.DF3658E5; Thu,  2 Apr 2020 06:03:09 +0200 (CEST)
Received: from WILL-MAIL001.REu.RohmEu.com ([fe80::2915:304f:d22c:c6ba]) by
 WILL-CAS002.REu.RohmEu.com ([fe80::fc24:4cbc:e287:8659%12]) with mapi id
 14.03.0487.000; Thu, 2 Apr 2020 06:03:05 +0200
From: "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To: "andy.shevchenko@gmail.com" <andy.shevchenko@gmail.com>
Subject: Re: [SPF Softfail] Re: [PATCH v7 03/10] lib: add linear ranges helpers
Thread-Topic: [SPF Softfail] Re: [PATCH v7 03/10] lib: add linear ranges
 helpers
Thread-Index: AQHWB1cj+aMIIRocXUeZN2Io9Ehlr6himqGAgAFQhQCAACnkAIAACuYAgAAXZoCAAN+uAA==
Date: Thu, 2 Apr 2020 04:03:03 +0000
Message-ID: <bbdf3a3e12bd2ba11a019192e492d135f92634cc.camel@fi.rohmeurope.com>
References: <cover.1585656143.git.matti.vaittinen@fi.rohmeurope.com>
 <c4cd52979ec187c942fa5794aab11e6c7f944cbb.1585656143.git.matti.vaittinen@fi.rohmeurope.com>
 <20200331140523.GJ1922688@smile.fi.intel.com>
 <4e75e0fcc9782220798c90eee5e41788fe277cc1.camel@fi.rohmeurope.com>
 <CAHp75VcnK2A_qjBo3FEz-XC6Y=3z7ssSgT6AS-P_9EPyRXsFXQ@mail.gmail.com>
 <e2391c0749478d42ac7e2db4981b9d373a160323.camel@fi.rohmeurope.com>
 <CAHp75Vd24w6dqqCYH46GKnJ5Nzase6LdVgSSVwQ3FEzMd5gsYA@mail.gmail.com>
In-Reply-To: <CAHp75Vd24w6dqqCYH46GKnJ5Nzase6LdVgSSVwQ3FEzMd5gsYA@mail.gmail.com>
Accept-Language: en-US, de-DE
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [62.78.225.252]
Content-ID: <3D13BA28F4027B4DB279FD920FA6548A@de.rohmeurope.com>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA02TfUwTdxjH87u7tgfS5SgwfivMadUtYCaiZnmSmUWTxd0W4tsStpCMWuSg
 zNKyvhgwWUKEbgoZAuNtBeRNXnQESnE6kFLTMecgUDs6kM2ZIcgEJ2zQQYDBdkdV+Ofue8/3
 +Tzf54/naFJWRMvpFK2R02tVGoXYn7rZtGx7feWkOX63Z2IPDIwtU1DR2iyGvNlaEibzv0Ow
 UnhLAm1lrSLwVvZS0OeYpqDgQgS4735JQvHouBg8ZhuC0uI7CCpc2RTcbrNSUNUzIIKsulYx
 5E6Fg8tllcC85xwBRf82EmAbGxJBgaNfAoOdFWIYzHIjKL90gYK5L3oQlLm6CagfdhNwNnsv
 VNTfpqCu8VVoXGqhwNq+QMDcjEMEld5iEp7cK6XAXeYiwWzvkYC7yUuAvbRBBH03jGA3u0ko
 qbRLoN3G9zo878Hw7C98w+oiBYtOF6/uzyG49fciOrCXbb7YjNjlpULEzv9TSLEzd80S1vrg
 axF79fIIwTbNRrEdlt8k7LWbO9hqm4ltb4pk67omCdZ25byYLWyoFbH3hrrE7PTAgORoeNym
 /Qkq4+n3U5K1UW+d2KSeaWok0+5Eprd6FiWZqCciB/nRmNmH8/p7RTnIn5YxQwjn3195+vED
 wlOf1UhyEE2Lmf04Z0QiAMHMm7j2+2pS6CGZRyH4xuMSsWAEMcfw564Bwtd0HHf/aUU+HYsb
 urxrMMVsxzXVuWt1KXMYO7xtIkHLmL9IfPWPg4L24+dcHC5bqyPmZXw+c3ptJsmEYtvEgsi3
 NYMvdblInw7Bk2OrT+tb8fWFFkrYmWQicGtnlA89gLNqpsQ+vRUX5Y5KfCsE4h+/Gqfy0YuW
 DQmWddqygbZsoC0b6GokuoJwqipFk6wyctG79Jxpl16nTuVfJ3WpNuS7b++36D/nu05E0MiJ
 XqIJRYg0K94cL3shQZeYoVYZ1Eq9ScMZnAjTpCJYWv52drxMmqjKOMPpdc+sMJpShEpfGy34
 SMYIWac4Lo3TP3PDaVqBpUEJ/NBAPZfMpSelaIzrNkH7CcP95cEGTpvI6VUmo1op3IfSwB+I
 YAXwuasqHpca0lSpfNWH9qJoOn+yspakeyrr+efwjL2elFFanZaTh0p7BYARALVJ+zxuCoXS
 SBEkbVHybgD/qz+fNsUHEXzQz+lZQpBRtW7JM1F42okdMyXFcY/Yh2rY+cmZmN2pR96R2TPK
 t4svD5nmf9/TkXlKWXVoXKY5cvaVQeWnHYf6d/46ts2dmWR9LJZvPvwgivvmA2PgltifhsKu
 beuLNXk+1p12PTwmHzHvCzie9KQ7Jc9Zoj4X5ohb6pyv2rxl0po4MR2jOfhG7vWY7oIP+xWU
 Qa2KjiT1BtX/6kwhg6cEAAA=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200401_210314_685516_F5DE5002 
X-CRM114-Status: GOOD (  21.94  )
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

On Wed, 2020-04-01 at 17:42 +0300, Andy Shevchenko wrote:
> On Wed, Apr 1, 2020 at 4:18 PM Vaittinen, Matti
> <Matti.Vaittinen@fi.rohmeurope.com> wrote:
> > On Wed, 2020-04-01 at 15:39 +0300, Andy Shevchenko wrote:
> > > On Wed, Apr 1, 2020 at 1:09 PM Vaittinen, Matti
> > > <Matti.Vaittinen@fi.rohmeurope.com> wrote:
> > > > On Tue, 2020-03-31 at 17:05 +0300, Andy Shevchenko wrote:
> > > > > On Tue, Mar 31, 2020 at 03:23:03PM +0300, Matti Vaittinen
> > > > > wrote:
> > > > > > +int linear_range_get_selector_low_array(const struct
> > > > > > linear_range
> > > > > > *r,
> > > > > > +                                   int ranges, unsigned
> > > > > > int
> > > > > > val,
> > > > > > +                                   unsigned int *selector,
> > > > > > bool
> > > > > > *found)
> > > > > > +{
> > > > > > +   int i;
> > > > > > +   int ret = -EINVAL;
> > > > > > +
> > > > > > +   for (i = 0; i < ranges; i++) {
> > > > > > +           int tmpret;
> > > > > > +
> > > > > > +           tmpret = linear_range_get_selector_low(&r[i],
> > > > > > val,
> > > > > > selector,
> > > > > > +                                                  found);
> > > > > > +
> > > > > > +           if (!tmpret)
> > > > > > +                   ret = 0;
> > > > > > +
> > > > > > +           if (*found)
> > > > > > +                   break;
> > > > > > +   }
> > > > > > +
> > > > > > +   return ret;
> > > > > > +}
> 
> Looked again at the code of the callee.
> So, *found becomes true if and only if the return is 0

Yes. If found is true, then ret is 0.

>  (or other way
> around if you prefer).

No. Not other way around. Ret can be 0 and found false. This is what we
need to handle. Ret means we found range value smaller than given
input. Found means also the given input was in range.

> Now I'm wondering why you need 'found' at all?

To separate case where given input was in range.

> It means above may be as simple as
> 
>       int i;
>       int ret = -EINVAL;
> 
>       for (i = 0; i < ranges; i++) {
>                ret = linear_range_get_selector_low(&r[i], val,
> selector, found);
>                if (*found)
>                        break;
>       }

No. It can't. Here we get wrong return value if one of the calls to
linear_range_get_selector_low() return zero with found being false and
subsequent calls return non zero ret. Then we actually found lower-
than-given-input value from one of the ranges and updated the selector
(that would be usable for example for regulator voltage control) but
end up returning non zero ret as the subsequent calls to
linear_range_get_selector_low() do overwrite the ret.

OTOH, we should not stop for first range having zero ret if found is
false because some of the ranges may have range where given input is
in-range (and this is considered better value).

> 
>       return ret;
> 
> or assuming 'found' will gone

No. We should not drop the 'found'.

> 
>   int i
>   int ret = -EINVAL;
> 
>   for (i = 0; i < ranges && ret; i++) {
>       ret = linear_range_get_selector_low(&r[i], val, selector);
>   }
>   return ret;
> 
> ...
> 
> >  * value. If given value is found to be in a range scannins is
> > I think it is but I am open to all suggestions how to improve doc!
> 
> Thanks. At least fix a typo: scannins -> scannings
> 

Thanks :) I'll fix it

> ...
> 
> > Compared to:
> > for (i = 0; i < ranges; i++) {
> >         ret = ...
> > }
> > 
> > I wouldn't say so.
> > 
> > As I explained, we need to have "temporary" return value in any
> > case
> > because we need to return 0 if any of the calls to
> > linear_range_get_selector_low() returned 0. Return value 0 from
> > linear_range_get_selector_low() means we found "matching" value
> > (lower
> > than input) and selector was updated (although input value was not
> > in
> > range).
> 
> See above.


Best Regards
	--Matti
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
