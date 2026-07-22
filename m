Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8A39C4453A
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jul 2026 09:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fzc7jLJOwKFZM50nrRR9HIoeoA67mID89Z/e+R2bL4o=; b=uqmNPOHhZ47mjQ6WpGQ7LYBxV1
	edDx+vpZ9VoNFay0aEyt12s3yZayU+js4iEm52PSMbsMvbhqqOIypRiJvbt6E/xG9SyJC4/1SqCrd
	FYM795E54aj/0lb5G3C/nXkRsnGobpJ7m3e8Zr3QDEgUngeJqwLVwSkaQdEdukE97MYOnD9baREZr
	50PSGfgflwWfPUtFJOvR9HXkaoPz+v3bKjwy2uNrPNexbKcBMUJYZycJWeGsuliWHKhXDIG4CeZSo
	MPB3sPCkP/vcvDgk95IMs2nbNfbhpcCAv656f3DbMGNavQfUvP86b8oyZ8fyecMfJWjBw3RkBYcdl
	kACVPj5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmSuD-0000000BKx8-2PFt;
	Wed, 22 Jul 2026 09:06:21 +0000
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmSuA-0000000BKvK-1IYf
	for linux-mediatek@lists.infradead.org;
	Wed, 22 Jul 2026 09:06:20 +0000
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-81ecf499af9so89707577b3.1
        for <linux-mediatek@lists.infradead.org>; Wed, 22 Jul 2026 02:06:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784711177; cv=none;
        d=google.com; s=arc-20260327;
        b=GqKGtqmL2XnVjD2fNKybZRrk228kK4xWOw8ETlO+qxJv0MUnKmRb8X6o7BGwHxKj/x
         F/wf5Tv7dFVSJyniOFoKUXoIEbVrw70vBTPmCFu2b+kribpeNImAmYetGRBrSRe8lmbe
         GqhUm/Kcqh7yNkoCjIQ38rVMYecvS3Byd0jfuMyNBORIJpjiUJgFUfenIJMkVk1XctyB
         aGaTY2zV+944HW4WzIfH+/le8sbjdwwncT1W+FtrVkPsmF2P9rZnxtw9C836VNxjmwfd
         0hubahjxXIJvKivbxzwrzdIki/TiwiZ4vaCmWRaHNtFDvM5Sn3iVHQbRpCWmMywJeh8P
         r7TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Fzc7jLJOwKFZM50nrRR9HIoeoA67mID89Z/e+R2bL4o=;
        fh=9Ltvc9fyp8VUMPGUO07wKEY70EeVEuQNTG+mz7xXYNc=;
        b=U4f78kQoylvUsSN6jwC3XS7KhrQjDaPeuIuJuXKw+/4bE1NqZ9BSQLt+Gkr++hd13T
         bjOhNfc50yD+mWvz7ExknwaRWKFbjc0uV76GQ2zq77rmmlxW6SmnHQpeUTuHo4e5oCJY
         2+md6+OqDfE4JASrbNMuJ9ZZndXNyRsvSJqQdERHQGNbc+yR1h/bIS2iVAC2yqlkKiyz
         NLhM+1JxIgCcxIsp7ORck3iHlAw9Zc3+BVzWOZvg7yIaJnJ927bGil7SjYSaIg2aADth
         B/jwWYPyfBqU3bum+E3xiOMgpOW10GPrgtWQVcV2XV22Q0JUB5r6zEX4e4DM/EsMYHX/
         iDzg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784711177; x=1785315977; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Fzc7jLJOwKFZM50nrRR9HIoeoA67mID89Z/e+R2bL4o=;
        b=DmPbVlCbzcbMkl+ge8OusYFCLCoztYqGQoy+fQ4C+P3LJ3qoCjVMoF1L+O5HJvgnPA
         n9OxKN502zjLruuyM90O2Bf2VhUU123TLcuzgKFnqS3xpa/SlTtzKCP8oGqiO/HS3HIa
         SkTz+2OqJqduumyr/GZL9CxL3tH/2umz5eB1w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784711177; x=1785315977;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Fzc7jLJOwKFZM50nrRR9HIoeoA67mID89Z/e+R2bL4o=;
        b=Lqhr/4TZId3VggnLL+yO01pjBXTGLuBZSEl17oz4lRgCQ+qTZLgIbMbxb5Ssurb92t
         7B7if0xXcPNgl6BSxEGz2zBhO3SALD8pEili+fgPo1eJXn9hEcOST7/aukGCofey9BiG
         PKCoD+21rDtMABO24FNjRzlxaZVUXeZQNbzr73CumtAiwhwlxmKZXRrPUuXfL2HGjt/6
         ezjdQoeiZAbyHEigjCXsSFZ40psSkuF7VJE8TmY+OD7BcmQzqlcc4Wp2JjabyWwu3TnE
         CedZAg8rp8PK0+jOHyY2MTOd1oOdTT6ylyIRNCmYfLLlRkCrOxzKeW/Zlc5eQlPKR9uc
         DiUg==
X-Forwarded-Encrypted: i=1; AHgh+RpTwr9nAGDXkHZUbbFrT3p7rIyiPGECA0tWHtj6jV6gfvGFYHgpP2TaC4MPjbr4/wSuqAHXQIzZw+E5LUopCg==@lists.infradead.org
X-Gm-Message-State: AOJu0YziDfIg3N0GoHb0xG/AZmir6SFUoK+jIpKHAOjzDsfxw5RLj+u4
	J+sh51zQPHhs98hCrfuO3VMTEKMVogqbc4nx0a8dRr2wT6rNlPb1C4KPfgorD2clEt0GLVZruV0
	q3UOwzMRyNpAPBKx9G2iv4JFkiEjB4w+iZZcZRksc
X-Gm-Gg: AR+sD123nQu/e9EREcP7D6TFDzXabj4EP3OnkCludACEcO1BP/DCY7EPkQIedNQmEs7
	WvQhxV8xLEL845P8LHSStR9cB2CrGOh6lfuHQ9DUpEJomV1FEXve2SV0C35VpbmOPhcTQShsVau
	vgHLpSy+xtpFOAwwHM1qCWWiRhdXAqSh5Hqi33Ly918V44yeLCVVEXfMd1fOP1ecuGYR6etAZEJ
	5ejQfpVfXwov7BEHizCmgwOUiB08EksxnTuXfIgtITHvxoRNkKkC+EQlZswzJgAKH9RgGMGVCFQ
	IWIndQ8kapMBXMYS
X-Received: by 2002:a05:690c:6c8d:b0:81e:6d03:40cf with SMTP id
 00721157ae682-81ef26ae40bmr73897997b3.54.1784711177267; Wed, 22 Jul 2026
 02:06:17 -0700 (PDT)
MIME-Version: 1.0
References: <20260721075226.2347933-1-wenst@chromium.org> <20260721075226.2347933-2-wenst@chromium.org>
 <al9BwHbG5IX0mIem@ashevche-desk.local>
In-Reply-To: <al9BwHbG5IX0mIem@ashevche-desk.local>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 22 Jul 2026 17:06:06 +0800
X-Gm-Features: AUfX_mw54F9BihKerjVbrM-HX0v6EAfSTuk3G7vvEfoFi_SJki_3pQoN0j1OPTM
Message-ID: <CAGXv+5HXtSovddkws58oUfUcucC3GKqTt-GgvXs27ALFjyFRrw@mail.gmail.com>
Subject: Re: [PATCH v3 1/9] regulator: core: Add "enable and wait" functions
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Jiri Kosina <jikos@kernel.org>, 
	Andi Shyti <andi.shyti@kernel.org>, linux-mediatek@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	chrome-platform@lists.linux.dev, linux-input@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_020618_357225_C3095EE8 
X-CRM114-Status: GOOD (  27.95  )
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

On Tue, Jul 21, 2026 at 5:54=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Tue, Jul 21, 2026 at 03:52:15PM +0800, Chen-Yu Tsai wrote:
> > In device power sequencing and initialization use cases, it is common
> > for the driver to enable the regulator and then wait for a certain
> > period of time to pass before continuing.
> >
> > In cases where the regulator supply is always on, or has been turned on
> > or left on by another consumer, the driver could shorten the delay or
> > skip it altogether, provided that enough time has already passed since
> > the regulator was _actually_ turned on.
> >
> > Tracking this requires support from the regulator core. Introduce a
> > "last turned on" timestamp field to the regulator device, and "enable
> > and wait" functions to the single and bulk regulator consumer APIs.
> > The existing "enable without wait" functions are then converted to
> > macros that expand to the new functions.
> >
> > One case in particular is not optimized yet: a regulator left on either
> > by hardware reset default or by the bootloader, but does not have the
> > "regulator-boot-on" property set. As the enable timestamp only gets
> > updated when enabled by a consumer or by the core, the first enablement
> > always needs to wait.
>
> ...
>
> > -/* locks held by regulator_enable() */
> > -static int _regulator_enable(struct regulator *regulator)
> > +/* locks held by regulator_enable_and_wait() */
> > +static int _regulator_enable_and_wait(struct regulator *regulator, uns=
igned int wait_us)
>
> Hmm...
> This comment a bit confusing, perhaps adding some lockdep annotations hel=
p?
>
> ...

It's already there, just outside the diff context, the first line after
the variable declarations:

        lockdep_assert_held_once(&rdev->mutex.base);

> > +     if (wait_us) {
> > +             ktime_t end =3D ktime_add_us(rdev->last_on, wait_us);
> > +             s64 remaining =3D ktime_us_delta(end, ktime_get_boottime(=
));
> > +
> > +             if (remaining > 0)
> > +                     fsleep(remaining);
>
> This style is discouraged as it makes maintenance harder. Better
>
>                 s64 remaining;
>
>                 remaining =3D ktime_us_delta(end, ktime_get_boottime());
>                 if (remaining > 0)
>                         fsleep(remaining);

Ack. FYI this will be rewritten based on concerns from Sashiko. The
wait will be pushed over to regulator_enable(), i.e. outside the scope
of the lock.

> > +     }
>
> ...
>
> >       /* private: Internal use */
> >       int ret;
> > +     unsigned int wait_us;
>
> If you want to make it more private (the above is only for kernel-doc) ad=
d
> __private annotation that will affect how sparse will check this.

Nice. Will add that.

> ...
>
> > -int __must_check regulator_enable(struct regulator *regulator);
> > +int __must_check regulator_enable_and_wait(struct regulator *regulator=
, unsigned int ms);
>
> ms or us? Please, double check all units.

Yeah this should be us.


Thanks
ChenYu

