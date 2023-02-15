Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35B8DC636CC
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Feb 2023 21:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PU7uQjOcJI1X0s6XD/UlR1JC6w4DuroYdHadnqtLfV8=; b=Dyth2fTUg734eRgJTBHnUlem4J
	mnfypMHJSkN8z6Ng6FkTSvMlF+Cl+gMGpxXu4OaxJ7TDbH73x0HTbwRpYuOu+n4MBAJ1nP7PDtDmU
	4NNxXzrfm57xHN6C24N6/qPGrgTNk8a/LPos3iYUfkvo9406IW48Rd643yjFURHRK6a5WYKXFmWxi
	L3qQu+1CdDHbpvUSBYrz5WHY9Zc0R39WxeR7/zracJXLzru31okICzmnXR1ZPcm2h3qyIyWc0Za38
	notRNkeFWRy9q/59UmSe+fh38f0nYbtTWEwXd9sk5nE3EdTjHc0ZEBa62DLyDMOczrc4XP2C8mdah
	V3tZVZQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSOxI-007NK9-7e; Wed, 15 Feb 2023 21:04:44 +0000
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSOsl-007KnB-5B
	for linux-mediatek@lists.infradead.org; Wed, 15 Feb 2023 21:00:04 +0000
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-52eb7a5275aso290489997b3.2
        for <linux-mediatek@lists.infradead.org>; Wed, 15 Feb 2023 13:00:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PU7uQjOcJI1X0s6XD/UlR1JC6w4DuroYdHadnqtLfV8=;
        b=c1BMLkgVY3uKTU5PQmO5ZxkzyjKc1+NU3fHYy4ga4wpUdsQk+fspTUj0Lv5C2dJeYG
         vVTGmdwdmdCjrO95C7rVatz5dt6aqYT8KnA5Mx2MocLBk1hroCs+r/CbJ2m4daCu864E
         LfH9cc1CF88VjAiJJoknIMpCCbbwNQD9FK7Dl7FM8L2SF+MLoheYfX9TgP7Bu0pDJGq/
         sls3jSl0X5/mzO9TXCbvrMYQxbD9VXjl4T4HiAEa7AcgWuwXo4Sv/hVPSN/HvGxhoBT/
         YjtjBO4vOx2z+f3buo9vf4Iy7uiHim5uzr/rPfweCzVmLCsdqLejJ99ru+CIRrTelsj0
         K+QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PU7uQjOcJI1X0s6XD/UlR1JC6w4DuroYdHadnqtLfV8=;
        b=01uQjmXUu+FRSC9LqC4vLKGQwjocVwcmGKM2GdwFghVk7RzWeqV4kZAoyTjrDnZR8C
         Vttaun442Et2F0eALA1vNcMDTq9duf4MEFeowCEQCALADxEwQt4syn9RZk9shzhbkQya
         /HFnSThVRQzygaVboekSAq5MCeoz6c+J7eb4ezCzzhXiH5xH4Dpz0A6DT3ja1uI1hpom
         9PdgaDQBpQXPPD5ZcLDJK44IS89sMy3QCIxOMG4vwLSxlwiWhtb3WK74dvxQrAXtH27Y
         1dTN6juVYJ9LWd5SGy3m7h/DUjiUETTXbL+A5fXWdrKFpg6k1o8XZ5Fj6Ve8E9xK7uwz
         Qp2w==
X-Gm-Message-State: AO0yUKXODKGRwcB0YIshgNzOZebr4zwRM2d6vDQMkuiML8tuuf3Kc9OH
	8ecHf4nAmjC9oQVVJcJNV86csliTRYLv1lfdsHfB
X-Google-Smtp-Source: AK7set9GgevWTYzK7KxUtPnop6l7D3ePMYWT6Tcj3no/q3eFuol33EfVOuzpuSp95+V08yI21W6HfQtCjFkRF0yLUpU=
X-Received: by 2002:a81:7306:0:b0:52a:92b6:e24b with SMTP id
 o6-20020a817306000000b0052a92b6e24bmr483218ywc.179.1676494801022; Wed, 15 Feb
 2023 13:00:01 -0800 (PST)
MIME-Version: 1.0
References: <20230214105412.5856-1-walter.chang@mediatek.com>
 <20230214105412.5856-5-walter.chang@mediatek.com> <1726f1d2-7411-2b49-79cd-f5aecff2d19e@linaro.org>
 <CANDhNCrYaepM3d-xHybqc9n5j0q0iMfPiTGPZKskEWjqjD6nRA@mail.gmail.com> <12f2d6a8-e16f-5bac-10ee-035c1b4b0356@linaro.org>
In-Reply-To: <12f2d6a8-e16f-5bac-10ee-035c1b4b0356@linaro.org>
From: John Stultz <jstultz@google.com>
Date: Wed, 15 Feb 2023 12:59:49 -0800
Message-ID: <CANDhNCrae9=8-w9-Qaq527-j8qMYzHGiAXAmKpxsoxD4=UP5zg@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] clocksource/drivers/timer-mediatek: Make
 timer-mediatek become loadable module
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: walter.chang@mediatek.com, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	"Maciej W . Rozycki" <macro@orcam.me.uk>, wsd_upstream@mediatek.com, stanley.chu@mediatek.com, 
	Chun-hung.Wu@mediatek.com, Freddy.Hsin@mediatek.com, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230215_130003_290082_266CF6A1 
X-CRM114-Status: GOOD (  33.68  )
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

On Wed, Feb 15, 2023 at 10:35 AM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 15/02/2023 00:20, John Stultz wrote:
> > On Tue, Feb 14, 2023 at 3:09 AM Krzysztof Kozlowski
> > <krzysztof.kozlowski@linaro.org> wrote:
> >> On 14/02/2023 11:53, walter.chang@mediatek.com wrote:
> >>> From: Chun-Hung Wu <chun-hung.wu@mediatek.com>
> >>>
> >>> Make the timer-mediatek driver which can register
> >>> an always-on timer as tick_broadcast_device on
> >>> MediaTek SoCs become loadable module in GKI.
> >>
> >> Other questions are unanswered. Please do not ignore feedback and
> >> respond to it.
> >>
> >
> > Apologies, I know it can be a pain to repeat yourself, but would you
> > clarify which questions were unanswered?
> > My initial skim made it seem like the items you raised were addressed
> > in some form (though maybe not sufficiently?).
>
> Questions were:
>
> 1. IOW, does the system boot fine? What's the impact of this being a module?

I believe this was answered in the cover letter.
" If the system does not load this module at startup, system will also
boot normally by using built-in architecture timer (in this case is
Arm Generic Timer) instead."

> 2. It is not the first time there is a proposal to convert the timers to
> modules. After asking, nobody came with a real study regarding the
> impact of the modularization of these drivers vs the time core framework
> and the benefit.

Maybe it would be helpful to be more specific in the criteria you're
looking for in such a study?

At least with the GKI, there is a need to support a wide array of
hardware, while minimizing the memory overhead of unnecessary code on
each device. As I mentioned in an earlier reply, this is kernel wide,
so while moving a single driver out to being a module isn't going to
be very substantial, the cumulative effect of not having to build in
every driver needed adds up.

So I think asking to see how much the kernel size changes by
modularizing this one initial driver is a reasonable request, though
I'd not expect it to be a huge gain on its own, but a reduction is a
reduction, and I'm not sure there are many clear downsides.

Again, it's not expected that every driver can be moved to a module,
as there are a number of cases where we need the functionality to be
present early in boot, and that's fine.

> 3. We need to tests that involve loading and unloading of such
> modules to see if the transition between this timer as broadcast and one
> CPU itself as broadcast happens correctly and system survives across such
> loading and unloading of the modules.

Modules may be permanent and not unloadable (this patch doesn't
provide a remove hook). While unloadable modules are abstractly nicer,
for supporting a wide array of hardware with minimal memory impact,
permanent modules are equally beneficial (only load them on hardware
that needs them, from that point there is no need to unload them). So
I'm not sure there's much practical value in unloading them.

As for testing the loading side, that sounds fair, though I'd expect
that to be done as part of developing the patch.

So maybe Walter can confirm the device works appropriately across many
boot ups where the module is loaded in their testing? If there is a
specific test criteria you would like to see, please clarify.

And, many thanks for re-outlining your concerns here! I appreciate it!

thanks
-john

