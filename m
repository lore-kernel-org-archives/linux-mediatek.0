Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93054C44539
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jul 2026 10:03:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:References:MIME-Version:
	In-Reply-To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v2nl4VWueEk9cKUhbw+kqvh7s/L/Uh+km+tAT2bP7fg=; b=JoNQQk3iwbTiLMXQvt22rVCm9v
	IzyyCXRi2HUyp/G3pnYxBn3WarTe895MOQja+I25eo4KtxCKdvf4DVy4WiD9x6zNh08FXxpkdAUj/
	ON1TqWmq+Q0Kby+8NI8YwlBsN+vTAHbJD8FnSoScEKQSz87kmX4yIyVlFDIQzeWDUteHzxmoAa0Hv
	uYxaahH+gL2mV6t/3EY4Utb0aIDnZ793g5jt7BBRhjP4HEAQ3Z6vVU4tReJg2qRlTA7nxjmPahxRH
	Sd512zpVDQUqiBqU94S3OzGiLTSv9YbrzwNKpktU87eWW0dd4nqBsXpYRsV7kRxfyWRR9MY6RdK7G
	6EUDwnXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmTnJ-0000000BUTh-1KN4;
	Wed, 22 Jul 2026 10:03:17 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmTnH-0000000BUTE-2UB6
	for linux-mediatek@lists.infradead.org;
	Wed, 22 Jul 2026 10:03:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B65E360A7A
	for <linux-mediatek@lists.infradead.org>; Wed, 22 Jul 2026 10:03:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63CB51F0155C
	for <linux-mediatek@lists.infradead.org>; Wed, 22 Jul 2026 10:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784714594;
	bh=v2nl4VWueEk9cKUhbw+kqvh7s/L/Uh+km+tAT2bP7fg=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=aGMuUyLHguxVRr1lFjeEqsXxI5a3BDv/DaaV4zoODVdfUElN6OPq6bkx5ATub1s7X
	 NqCOBztx6noD+QfHAvSgTWe7vgJnIbtFqRfBncNwEd8MZhJAPkwQ6o1PmCErDh2eSF
	 54ujH4MI/X8WrSdzSMvJdDCh0pZpi+hUqSU2T1bUPAGLbQO4yixldnti713LXPNkci
	 YythZGNmbpNbSYX0SZ1YxdtUM26wau81e41aUGstklcHdYCONGNwfqBX6p8ICowp/6
	 g9HicL6hWe6OdIC4YCD4+8eDDyuWsnOkh3GMzOh/RFUuABV1W9tcDEy8Izwff+b8ok
	 dcHRMOjcvphAQ==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5b2aab18795so599959e87.2
        for <linux-mediatek@lists.infradead.org>; Wed, 22 Jul 2026 03:03:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RroIoh2wYpozvP+m77ybJGpXOVKMo8hSlmCuiKySjdNGdF4pNXtUWRHc9WiihL62x8vJJ5rQFYAysCQhQkmaQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YytfVixQ0ab1sGby3UxD1KzdHU10Ww8Ppz/0qv7HqFJgidzTERB
	d9OZqOmoN4DjoFW1hww+jYB2jA/7WwTSFfub3oGw36P2VSHWDWi23SCQ1mVdxLdbRQAG46mEcfS
	UIuwWus+y3VDm2cInOf/rJViG8/sAgyeEvMiZGHAETQ==
X-Received: by 2002:a05:6512:3185:b0:5ae:b2e3:fc24 with SMTP id
 2adb3069b0e04-5b28fabb0afmr5670333e87.60.1784714593132; Wed, 22 Jul 2026
 03:03:13 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 22 Jul 2026 03:03:08 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 22 Jul 2026 03:03:08 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <CAGXv+5H_V+J0cvrYjMFdKAQVrPKxPdtimXMc+hwHenwxhb9mDQ@mail.gmail.com>
MIME-Version: 1.0
References: <20260721065413.2306137-1-wenst@chromium.org> <20260721065413.2306137-4-wenst@chromium.org>
 <CAMRc=McsCRBxXMj0xC8H0cgdZZ=Z9_4u_DS9b2z0pLE0=gZr+g@mail.gmail.com> <CAGXv+5H_V+J0cvrYjMFdKAQVrPKxPdtimXMc+hwHenwxhb9mDQ@mail.gmail.com>
Date: Wed, 22 Jul 2026 03:03:08 -0700
X-Gmail-Original-Message-ID: <CAMRc=MfZ1Yk6OJaCGphTYToMVfe_UU4dhOGmGVCbwqBV9S-a2g@mail.gmail.com>
X-Gm-Features: AUfX_mz93U1zn17dWP9tyqRdXvFYbDQgxlYVyw0vjRryfcxfP9O2fsTk4G3zrhY
Message-ID: <CAMRc=MfZ1Yk6OJaCGphTYToMVfe_UU4dhOGmGVCbwqBV9S-a2g@mail.gmail.com>
Subject: Re: [PATCH v6 03/16] power: sequencing: Add pwrseq_power_is_on()
To: Chen-Yu Tsai <wenst@chromium.org>
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
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Wed, 22 Jul 2026 11:01:20 +0200, Chen-Yu Tsai <wenst@chromium.org> said:
> On Tue, Jul 21, 2026 at 5:08=E2=80=AFPM Bartosz Golaszewski <brgl@kernel.=
org> wrote:
>>
>> >
>> > +/**
>> > + * pwrseq_power_is_on() - Queries the last requested state of the pow=
er sequencer.
>> > + * @desc: Descriptor referencing the power sequencer.
>> > + *
>> > + * This returns the last requested state of the power sequencer.
>> > + *
>> > + * Returns:
>> > + * On success, 1 for on and 0 for off; negative error number on failu=
re.
>> > + */
>> > +int pwrseq_power_is_on(struct pwrseq_desc *desc)
>> > +{
>> > +     if (!desc)
>> > +             return -EINVAL;
>> > +
>> > +     return desc->powered_on;
>> > +}
>> > +EXPORT_SYMBOL_GPL(pwrseq_power_is_on);
>> > +
>>
>> Didn't we agree on introducing an enum to make it future-proof for when =
we
>> also pull in pwrseq_is_controllable() from Loic?
>
> My bad. I misunderstood and thought it wasn't needed yet.

It's not technically needed *yet* but since we know where we're going, it
makes sense to be proactive.

>
>> I think this should work like so:
>>
>> enum {
>>         PWRSEQ_STATE_UNKNOWN,
>>         PWRSEQ_STATE_ON,
>>         PWRSEQ_STATE_OFF,
>> };
>>
>> int pwrseq_get_state(struct pwrseq_desc *desc)
>> {
>
> I think you still want this here?
>
>           if (!desc)
>                     return -EINVAL;
>
>

Yes.

Bart

