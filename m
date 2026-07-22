Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCC20C4453B
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jul 2026 09:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BVQ32j56Dr60NJMwmM+X8AwJaAcbdmT9panK+KSnLpY=; b=G29oR7A7rVwZPe7k01b624jjXv
	a6km5A5nkJW2THpqcb0omWl3IQ6ZygjKnKiU3MumA0cPuZE524u9w3jA3xQtTOSjUhOObe70+9XUl
	GlOZTwG7SJ5l2t/KFQChjES57Ue+G8ENW8WKsht1VRdwp0UrYAVtDH+XI47sNYe+FnvuCYXN1ttd3
	2MD725uwe2BNm2WJ7tUBQCGXTGEHUVCyq55qtgevQPRwfFkcdm5X6th7KslnlJER/SFMuIhdllWxT
	7MTcVBkJ6NdbO45xwADa+5Hek0+03JCD0AwtQ99NzpXstOKnpC32HV6P5A2/xWxvmAjQunZsWxHJo
	uCbLBg2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmSpb-0000000BJyk-2XFU;
	Wed, 22 Jul 2026 09:01:35 +0000
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmSpY-0000000BJxG-24Yj
	for linux-mediatek@lists.infradead.org;
	Wed, 22 Jul 2026 09:01:34 +0000
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-81e69a2db34so74316967b3.0
        for <linux-mediatek@lists.infradead.org>; Wed, 22 Jul 2026 02:01:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784710891; cv=none;
        d=google.com; s=arc-20260327;
        b=avcccZjrH0FhrlhOuK2lSq0hRKz4kEziQ4B7sS/aqoUPuZ775YtLyL+GQALrn6R2YP
         Oo8u27V/14yu0gxl2G+an6sMqs0v+33Uzv5pY5fx9gzZhFoEzIJiUBnNrxUrk1SrfqrU
         CbBF6qhyqGJscbl1NuOelZUtum+WqLo0/uHUnc4N9sunzHqmaoqZW7oA0NMOODSdGzh4
         mfwbnyBQ1QHdFOV4yWuwgVGs5FWj1iGS4beb9rLXGD633xpA/KqVu+D2el+TJ4f6p71p
         GX68qReQi5wM1ikPUvSWqsuZkPAS+BZhUUFzMR6XtjVhv70Uc2mToqpN7yXdQSGez9p+
         1CUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BVQ32j56Dr60NJMwmM+X8AwJaAcbdmT9panK+KSnLpY=;
        fh=9ECiyQ1slo4sLrqGQueSnXBiDLpvWGUISzO2SHI5/Qg=;
        b=FA0L2XHl2BDfpoVo6VkrB0Uj7/HsrNhbTg5rZM5h9C8z5rZjgkYtqPE1kokKyd+OOt
         UpOS3MzdASzmUAG5wEg2T1s18PaADlMVoSpAeWof6hPCoxQPlVBKoIfcdQWRtYkLGDeN
         5jO3a6W/Q8VDOwMeIcwKKQNBs+d/iAZdE4m0ZOcDESmPmoVqMf73gx//g60SAV/d3utU
         GtL+9yAmOTXsIxTQiJubxcWUtp3AobaYysw+WHm41bdJY+Tdx5+u3QqBLKodICxHiUFq
         aaF8IGrBKop2d1vXeh9sae0jfjZ2hu+l66GGEizaj+t6vXUlL1hqrxqODhmQ+9Wqr+sm
         9UpA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784710891; x=1785315691; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BVQ32j56Dr60NJMwmM+X8AwJaAcbdmT9panK+KSnLpY=;
        b=lMgIcdugTHq9h1WJCJQU/0QfLyNwdKhrZmYjHs4eVhgJmZTXlVPcwmxasgYBhbnosc
         Lgd4bGUm54Si8DRV6kNr5yCGqCGYr+uaFFGzxg+7N9g/LT3f1/J8T+YhGChjN5lxbkeS
         7KExPyS2MFWU/nxOZVnHvgv1qu6F9+aP6ImAw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784710891; x=1785315691;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BVQ32j56Dr60NJMwmM+X8AwJaAcbdmT9panK+KSnLpY=;
        b=eeWsd3dayDtBhzYij7KrxDiOvQrZ2RHaDCMfIhHS8+P/GFZBtS0STFVYmFmhe8O3No
         WuWfMIlQFNDtGs3hPHCnp/1V/fVw0gZQJ9i73BNYlHrtiyodt7xyu2XXAp4B3LYMRGJw
         hpXOHhO+UcIb8kGEmhteBxJNCwpC9ovN0vkG51wWj/N+JlPz+rp+wbIc87J3blz5Na8C
         b/0Hegew/e4jm92sqhduhz9JspG665NlxUms2L5td1a0GUnpjTmQq1bFy3c4n0rNdDVu
         tGbGTLe/BS1liO4IbNejArVUqDHUbVNs3BNRBb3N6mRI44IdUc3tKlJ164UaVbgnDF84
         Vsmw==
X-Forwarded-Encrypted: i=1; AHgh+RoMQv25SdKOt8S1mBF7bNHJ8PRVz4yS3xLmGaL4bilm3lF0XX9YFZGHZzOn+XnN4l55ZDtO7BVtNA3Rs7VhaA==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywsg6zEvMNjtiO4h/ZXR5eslL30L0+yqVI1+Ug7WsRPEW56KnHo
	RkLaT7GJmsVAKTHHFXpXe7pw1RpP/mPKUgI2ce3qHqa+U8RIBoAC16NWvH4HmCTJYJiNCJIHuu/
	7vKCYQbNIbpV13MQ1pZfbUKRKssL445JR38kq9qR3
X-Gm-Gg: AR+sD13qIUjr6+Gz/0RlIGehTJoDDIOhUaQ3aWj5I6qdvKhsPkV7aeLggQUyECF5hnS
	lN1xZsrZLtFsHacxjidG2QTOZVN1bqCXBQXr4PEBpqzhjXg+mzx5j4jMQW0CcjnbNtl3acxKEjx
	ddXqSNRRvbp53BAbLGlEQMEfNSmUunietdDz0/2I5LDi65vMyC2nbM5dlX5QlY8AAR9ABjEU6yz
	/quNPuYwZdoqcr0uPJMu+hJiW4fXww8Zj+sxwLLDLDIzsv96l/w9GGJk2cLVORd1Z6xsKOTuATz
	xRfIrTe9Ny9UhBJg
X-Received: by 2002:a05:690c:e0c:b0:81e:6a1c:e30b with SMTP id
 00721157ae682-81ef28da7b0mr69266347b3.67.1784710891191; Wed, 22 Jul 2026
 02:01:31 -0700 (PDT)
MIME-Version: 1.0
References: <20260721065413.2306137-1-wenst@chromium.org> <20260721065413.2306137-4-wenst@chromium.org>
 <CAMRc=McsCRBxXMj0xC8H0cgdZZ=Z9_4u_DS9b2z0pLE0=gZr+g@mail.gmail.com>
In-Reply-To: <CAMRc=McsCRBxXMj0xC8H0cgdZZ=Z9_4u_DS9b2z0pLE0=gZr+g@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 22 Jul 2026 17:01:20 +0800
X-Gm-Features: AUfX_mzymMOrnzz3ZSisQQjvbDECVUbqfaXF7TwtpwvIT3XYymwiPHVmpWvFgt8
Message-ID: <CAGXv+5H_V+J0cvrYjMFdKAQVrPKxPdtimXMc+hwHenwxhb9mDQ@mail.gmail.com>
Subject: Re: [PATCH v6 03/16] power: sequencing: Add pwrseq_power_is_on()
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-acpi@vger.kernel.org, driver-core@lists.linux.dev, 
	linux-pm@vger.kernel.org, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Manivannan Sadhasivam <mani@kernel.org>, Alan Stern <stern@rowland.harvard.edu>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_020132_579190_22EE45FF 
X-CRM114-Status: GOOD (  26.20  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Jul 21, 2026 at 5:08=E2=80=AFPM Bartosz Golaszewski <brgl@kernel.or=
g> wrote:
>
> On Tue, 21 Jul 2026 08:53:58 +0200, Chen-Yu Tsai <wenst@chromium.org> sai=
d:
> > The power sequencing consumer API already does power on state tracking
> > internally. Expose the state to consumers through pwrseq_power_is_on()
> > so that they don't have to reimplement it locally.
> >
> > Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> > ---
> > Changes since v5:
> > - Reverted back to returning -EINVAL if descriptor is NULL
> >
> > Changes since v4:
> > - Make pwrseq_power_is_on() return 1 if descriptor is NULL, i.e. if
> >   the descriptor is optional, matching the other pwrseq consumer APIs
> >
> > Changes since v3:
> > - Added missing stub function for !POWER_SEQUENCING
> >
> > Changes since v2:
> > - New patch
> >
> > Needs to go in with "usb: hub: Power on connected M.2 E-key connectors"
> > as it is a build time dependency. Bartosz wants the change on an
> > immutable branch to pull into the pwrseq tree.
> > ---
> >  drivers/power/sequencing/core.c | 18 ++++++++++++++++++
> >  include/linux/pwrseq/consumer.h |  6 ++++++
> >  2 files changed, 24 insertions(+)
> >
> > diff --git a/drivers/power/sequencing/core.c b/drivers/power/sequencing=
/core.c
> > index 02f42da91598..72b96d36920e 100644
> > --- a/drivers/power/sequencing/core.c
> > +++ b/drivers/power/sequencing/core.c
> > @@ -968,6 +968,24 @@ int pwrseq_power_off(struct pwrseq_desc *desc)
> >  }
> >  EXPORT_SYMBOL_GPL(pwrseq_power_off);
> >
> > +/**
> > + * pwrseq_power_is_on() - Queries the last requested state of the powe=
r sequencer.
> > + * @desc: Descriptor referencing the power sequencer.
> > + *
> > + * This returns the last requested state of the power sequencer.
> > + *
> > + * Returns:
> > + * On success, 1 for on and 0 for off; negative error number on failur=
e.
> > + */
> > +int pwrseq_power_is_on(struct pwrseq_desc *desc)
> > +{
> > +     if (!desc)
> > +             return -EINVAL;
> > +
> > +     return desc->powered_on;
> > +}
> > +EXPORT_SYMBOL_GPL(pwrseq_power_is_on);
> > +
>
> Didn't we agree on introducing an enum to make it future-proof for when w=
e
> also pull in pwrseq_is_controllable() from Loic?

My bad. I misunderstood and thought it wasn't needed yet.

> I think this should work like so:
>
> enum {
>         PWRSEQ_STATE_UNKNOWN,
>         PWRSEQ_STATE_ON,
>         PWRSEQ_STATE_OFF,
> };
>
> int pwrseq_get_state(struct pwrseq_desc *desc)
> {

I think you still want this here?

          if (!desc)
                    return -EINVAL;


>         /* Only once this is upstream. */
>         if (!pwrseq_is_controllable(desc))
>                 return PWRSEQ_STATE_UNKNOWN;
>
>         return desc->powred_on ? PWRSEQ_STATE_ON : PWRSEQ_STATE_OFF;
> }
>
> Bart


Thanks
ChenYu

