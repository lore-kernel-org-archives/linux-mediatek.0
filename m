Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5C79C44501
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Jul 2026 09:39:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0CHRQwxG2g8NAYPuVqgPl5XkBCDxSDwrk5H6G4V1gVk=; b=EJq/M1mi/ze9W7jyVLxfzajEKZ
	bxvkGyGTVO/n4LdW5dz5VllIkIfL4+oXo5VWJHa5aZJREczUq1rK+qZ3cbaNsYZPnc+MQAf9pIhDI
	T6DUZ5jyYcWbc8dVfpSxBA4zaMoESnwJug3ySrfKjM26Nevrcf29bsU4+fDaqIQCUeSHgBnv1I+OE
	/SGESbDW0LR3gbViGk4G1/zmSJhoqlg9eYqqBxYyeLKiMFdo9wy6dzPH+P5fm4E1Yzp5/QLSJMHCa
	1CnT6bO/ezt1yAQmenSZYY9f/5AZiqIHC3JigEtrJjrREtNOY7hDVwNapqp3Y1UKZj12LW+P6diL/
	dRgbRBsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkIZ5-0000000GuD2-3Asp;
	Thu, 16 Jul 2026 09:39:35 +0000
Received: from mail-yx1-xb129.google.com ([2607:f8b0:4864:20::b129])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkIZ2-0000000GuBi-0glz
	for linux-mediatek@lists.infradead.org;
	Thu, 16 Jul 2026 09:39:33 +0000
Received: by mail-yx1-xb129.google.com with SMTP id 956f58d0204a3-66804667af2so2663970d50.0
        for <linux-mediatek@lists.infradead.org>; Thu, 16 Jul 2026 02:39:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784194770; cv=none;
        d=google.com; s=arc-20260327;
        b=e/JXiF7u9FoBceqPt0dviYxoIdUO/TCogPEqkHg+wjM0yzmmp0iYHz70K6Tvw5OQEa
         bSAe58a8fTCLY3aTtR0hpEFe5aARHP26NgW+bhxQjap/1bEgo+wUYjBlKFHvXrOEaEdH
         H8PNnqlbE8FfQcz4qbaxBlxBY3eSbMvKftUq7bk5ykRsiGZmmfj4oAPlrvs7oqw6nnD0
         U0CEoETSlrlPwuOUG1RmyVzQGYdxCJRrFRxMjLZeZ+MTqKmsQnjEvpZ4FajR7xUTycdZ
         sWHTehSz383pqrguQaI21Wot3ZvtrRbaqQJZpFklJOvsxQTE/PsF0UrXonhaSvhogqt6
         Nt8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0CHRQwxG2g8NAYPuVqgPl5XkBCDxSDwrk5H6G4V1gVk=;
        fh=hJB7fyJi7GnyrFemzmcTfnljoPSMaGPnhB8j6HSxVnU=;
        b=OcaTc7ME6PckkCXYKhXwfmx1GagVSM3YEZNmANPnuW/zloAGHFdLzFSx5z944AwI6/
         03uxMTmt+/bP3eeto3vK62ML3xB+iD+9WFijocmiDnafHzWxv3LMG/wBJvMB8hOk8Yhn
         AQU6zCVqafV/ENUzsvcZO6iP3/0VwvtMs1R+x0wONhJ89sap3kv9VC22tjVKkhGMM8fE
         bHFwGvxx1/qZE4BwZB81zvgq7GWRqFUiYDBJpMWFxB2faIWjZMAwnLw1NRPSEHDQbSCD
         AKv3vhIon3/fwnedUuJF9tMinSzVuxwhNqzj7WJFtSFwkbNZj57xI4kNtgK10tMS4XL2
         XqgQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784194770; x=1784799570; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0CHRQwxG2g8NAYPuVqgPl5XkBCDxSDwrk5H6G4V1gVk=;
        b=IpIVooidAb0YzfYdzQAGVQHAy9TSUXNzMmD9aJGpXRUHzePkhkm8bCPcOUgO+uqqzW
         pbJmvuWSu5juEGScWIjXIw7sYqw+mMSPJv7FbvVlNJ+E9tAdjYlWyofPee6jwPZl5Ztp
         M/9GgBaR+7bd+MgyIZWqiGYqJZh2xS6ANdt2s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784194770; x=1784799570;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0CHRQwxG2g8NAYPuVqgPl5XkBCDxSDwrk5H6G4V1gVk=;
        b=i//IfYOPqwAX2LM+ZxeH9vIuYvWB+57Cm3i8+C5vmRKLBWAGlZuVLZ95v+Sw0cnJRm
         z42/Ydgiul7aMB1nln/nKyztP3kG/UeGu3jGX8V2c1qM6jBv2yM/i5WPnyYEyh/rVmuO
         sP+SUAUQwBZHQ8kup9KWbwUZOLkcFfwwE/Dx9OOpRLTNSxtMMnIuU2jidgf6U/ZWWwf6
         FYPrV1thR90j6U7QkqELQGVQ+et1jls8PcxNvCCnYOVxIVHBedTeRaBc78CQnEsA0jZl
         ODOnrKwFrSr+BPU6h8PKXFYnsX4DkBGy/8A1JOTg3iaqbhr5VRNElvKsfnEUCn9MHzrS
         eYyw==
X-Forwarded-Encrypted: i=1; AHgh+RqODzrsPsczpia+gSkSUh8JI5RpFEwww9IVIcg3ofsJK6FFl0+cRhOZNIREj4a+wXNRaK9iLWLiN3dWCEsFTw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3av/DzUuAtNVH2bF1rJFQxlrBR8OcFWMTpxyqFx9x48pdx8in
	+0+bWaepuDuMFZOrcjYQMFeJ/iO97VoxQwoGshvv5dcQlC47qAsCPGCihtDrH54sWLTtMASxRvZ
	cdIErBqgykF8xVmFCDKFXSPEL+KKkc7pgMnGxO6Dg
X-Gm-Gg: AfdE7cnK/klZNpRHtAQ6T+Y41o2StNw67J+JjB1rfsb+A2D1xe8Kv7WLuH8uFpFeVT/
	9p9JiZoGWxrU/FsDprE4H+Iiw7sHLeAovM94yfe7+8XhqWKo6a3oNGbTjQHwZazXyyWOl8w19CH
	mXE6jxamnNVzS4WWsZz2bYdYk/x2eE7jq3APggANK9E667aNnP57r60u1zjdJHvI35IC8cyMW4U
	FKJKpL++t3/N/x6h0E0yZqEk3IpilmwoHJtzVQAd8dXb+JqGbN2SoxMJJUj9TifJEp0iDLva10J
	x1fio+gBosuVU9l1
X-Received: by 2002:a53:c80e:0:b0:667:bb38:d969 with SMTP id
 956f58d0204a3-667d7b0060amr9599454d50.16.1784194770410; Thu, 16 Jul 2026
 02:39:30 -0700 (PDT)
MIME-Version: 1.0
References: <20260715085348.3457359-1-wenst@chromium.org> <20260715085348.3457359-4-wenst@chromium.org>
 <aldS3qTympJuVXYj@ashevche-desk.local> <CAMRc=MfHmejks83bPfe3fKzAzFySGXk2GHMA9oZdMQj0f44eTA@mail.gmail.com>
 <CAGXv+5HGjGTrqqzJrpiQhLrCn3C6H20LXq3niPnoujQLOwgqPw@mail.gmail.com> <CAMRc=Mefxn81d0VUwmQgwFtffkL1=Er_1VQZCbC1Sa-Qph4t1w@mail.gmail.com>
In-Reply-To: <CAMRc=Mefxn81d0VUwmQgwFtffkL1=Er_1VQZCbC1Sa-Qph4t1w@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 16 Jul 2026 17:39:19 +0800
X-Gm-Features: AUfX_mzbe7WMgo0cPdR-Yi-m3qfqJETc7DH9Y1NWKQqSMqgCgHS_ReKsQ1v2DI0
Message-ID: <CAGXv+5G0Ffrh-8UohJuGPQ0e7KGpy11=X7t1JtDYLTJ_tZgMCA@mail.gmail.com>
Subject: Re: [PATCH v5 03/16] power: sequencing: Add pwrseq_power_is_on()
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Wei Deng <wei.deng@oss.qualcomm.com>, linux-acpi@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-pm@vger.kernel.org, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Manivannan Sadhasivam <mani@kernel.org>, 
	Alan Stern <stern@rowland.harvard.edu>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_023932_236240_0650D637 
X-CRM114-Status: GOOD (  39.60  )
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

On Thu, Jul 16, 2026 at 4:14=E2=80=AFPM Bartosz Golaszewski <brgl@kernel.or=
g> wrote:
>
> On Thu, 16 Jul 2026 06:59:01 +0200, Chen-Yu Tsai <wenst@chromium.org> sai=
d:
> > On Wed, Jul 15, 2026 at 8:10=E2=80=AFPM Bartosz Golaszewski <brgl@kerne=
l.org> wrote:
> >>
> >> On Wed, 15 Jul 2026 11:29:02 +0200, Andy Shevchenko
> >> <andriy.shevchenko@linux.intel.com> said:
> >> > On Wed, Jul 15, 2026 at 04:53:33PM +0800, Chen-Yu Tsai wrote:
> >> >> The power sequencing consumer API already does power on state track=
ing
> >> >> internally. Expose the state to consumers through pwrseq_power_is_o=
n()
> >> >> so that they don't have to reimplement it locally.
> >> >
> >> > Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> >> >
> >> > ...
> >> >
> >> >> +/**
> >> >> + * pwrseq_power_is_on() - Queries the last requested state of the =
power sequencer.
> >> >> + * @desc: Descriptor referencing the power sequencer.
> >> >> + *
> >> >> + * This returns the last requested state of the power sequencer.
> >> >> + *
> >> >> + * Returns:
> >> >> + * On success, 1 for on or desc is NULL (optional) and 0 for off;
> >> >> + * negative error number on failure.
> >> >
> >> > I would rephrase it a bit.
> >> >
> >> >  * On success, 1 for on and 0 for off; negative error number on fail=
ure.
> >> >  * If desc is NULL (means optional) return 1.
> >> >
> >> > And this rises a question: why 1? Shouldn't it be some "unknown" sta=
te?
> >> > (But since Bart Acked this, this doesn't prevent the patch to go, yo=
u
> >> >  got my tag above.)
> >> >
> >>
> >> No, this is good feedback. Maybe we should prefer an enum like so:
> >>
> >> enum pwrseq_state {
> >>         PWRSEQ_POWER_UNKNOWN,
> >>         PWRSEQ_POWER_ON,
> >>         PWRSEQ_POWER_OFF
> >> };
> >
> > Well I think the crux of it is whether the API considers the descriptor
> > optional. The power on/off functions suggest that is the case.
> >
>
> True. That may be an inconsistency of the API contract on my part. There'=
s no
> such thing as an optional variant of pwrseq_get() so perhaps pwrseq_power=
_on()
> and pwrseq_power_off() should be converted to returning -EINVAL on NULL
> descriptor.

OK. I guess the other resource subsystems allowed it more as a convenience
to consumers.

> > I modeled this on reset_control_status(). I believe the rationale is th=
at
> > if the reset control or pwrseq is optional, then either there is some
> > other mechanism to deal with the reset (GPIO) or pwrseq (GPIO + regulat=
or),
> > or it's always on and operational.
> >
> > In such cases and the rare case where one has to query the state, the
> > queries are possibly chained together and I think it makes sense to
> > assume the "operational" state as the fallback.
> >
> > If this returns an enum, then I think the previous approach of returnin=
g
> > an error value for an invalid descriptor is better. One doesn't need to
> > learn a new set of return values.
> >
> > I'm fine either way. I would just move the checks over to the consumer
> > side. But I think the principles guiding the overall API design is
> > something you need to provide:
> >
> >   - Is the descriptor optional? What should the action functions
> >     (power on / off , or query status) return when NULL is given?
> >   - Is the subsystem optional? Should the stub functions besides
> >     pwrseq_get() return 0 instead of -ENOSYS?
> >
> > Right now the API feels like the descriptor is optional but the
> > subsystem is not. One has to add IS_ENABLED(CONFIG_POWER_SEQUENCING)
> > around the consumer API to make it an optional feature.
> >
>
> There's one more use-case where the power state trully can be *unknown*.
> Please look at the proposed new function from Loic[1]. Here we deal with
> targets over which linux has no direct power control even though it may s=
till
> control some of its dependencies. This is where an UNKNOWN state may make
> sense.
>
> This is where I also floated an idea of renaming pwrseq_power_on/off() to
> pwrseq_vote_on/off() for better clarity of their purpose.

OK. Would it make sense to revert to returning -EINVAL if the descriptor
is NULL now, and then add a different error return value if !controllable
in the future?


Thanks
ChenYu

> Thanks,
> Bartosz
>
> [1] https://lore.kernel.org/all/20260710-monza-wireless-v3-3-46253587af64=
@oss.qualcomm.com/

