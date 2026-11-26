Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67C23606A326
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Nov 2026 08:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kWfjw2hI;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=jA81KxLQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=/AZpVI7KIqymZwkfQLbTYKoY9euwaZTWbbcMfI47B/k=; b=kWfjw2hIVG+dzl
	eu5eK6Oh/3E4uNZX8dMeI5fIEfu1ssDuALuCvvsa+50rtR/WFxgmJmvcHuqcLeoDzDbqdwCf/WHdL
	75ELOxtpi6xHRJ2UgSyiOKRDmMB3JkaLV14I8MO+SYhle0ZRN76dCBo5ckKjXyokEXNvNZeafqp4r
	5ip4vUcl65DR6bTBZrh2vm0UGcDWm2KzW5PaE5AomKxmY3uFptpPlrQ4h3wu/+wPorGKv+KnB4geJ
	mN7c3QCvydRf035m6/KyxVCd/sDASCOIDs4Z18sG6wWsULmBPafAGUa4aSpX5dbdeUvvIr/u1q7a6
	ge/uXkjVEEys9TvIBgJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWV9G-0000000CQmT-1ZVi;
	Thu, 26 Nov 2026 08:48:12 +0000
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWV9E-0000000CQlG-2Sd1
	for linux-mediatek@lists.infradead.org;
	Thu, 26 Nov 2026 08:48:09 +0000
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-8b4fb5d96b3so104453117b3.1
        for <linux-mediatek@lists.infradead.org>; Thu, 26 Nov 2026 00:48:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795682887; cv=none;
        d=google.com; s=arc-20260327;
        b=nXTHRo+Bje9Mmfkt0Tmt4u799noiJ1muG4RtBTudMXXOa0fs4goRnkPoa89wkrMyWH
         UekuBg/KSFUXK2APHa82rhUGQPvjNfYdRyFp3WGov86U67gyKDmajRr3gZeEAibDyBct
         9b1Qto4qyXniVF2/9T4gX1gHdzCYGpCAM44YiOvSHO9gNyKDk2IoYbPiMtmUeGHS1xf7
         Y6Y1f/eWQ7plJiY5B8qETHK1WOCz+5v0qGTqVQCgUdlvtux9UwPDdzt8nyKkD4m8JZsW
         ipOHVXATNuJyXZQou3vKd9CVGLebIq2Z/LD8CaHR7jsdkKUoRLz4B0taKYM48RhAAuzj
         t11Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/AZpVI7KIqymZwkfQLbTYKoY9euwaZTWbbcMfI47B/k=;
        fh=BwxSRYPjO4FbJAOuIp/uih1j89wHZ8XxAHL1abSaVb0=;
        b=lol7QgvuIKkY5Ihc8w9OWOJ8JTasJ9qwLeYDy4FauS83IQjeU2RO+66RK6TP0RfWyn
         NXCXi/noV6BdOqZ9mTChC4PaXWCfp+47biB28KtC5/XpIrYzaC5fVhE7lOWukakSxn3c
         48hLR50QpPSY5Fp/3xz4Ze0nUkQ/OLdVpVicnqvqwBvo1ZPuYVOiJUPK3LhK8ZZJ+r30
         wIxY+1Qfd8PR4qzHL5OeRhjh6un+Q6kVG0oM6Zs+OnUNnInNbah1hicAPiUIT1dGn2TY
         KsD4tJCUmy/eVYJp4AkEMBwJpOYb4LKbtCq4P/Jk2Q3F6LNxYwP4Q5j7G8agUu5zWmwV
         en+w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795682887; x=1796287687; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/AZpVI7KIqymZwkfQLbTYKoY9euwaZTWbbcMfI47B/k=;
        b=jA81KxLQcPjmNe9sst1H9QOLmmtBo4Grs45EjD498i2eo8cigk0fVmVLN5Gxk47Dx2
         jEhjc9aPGlYQ9doxk/lwxMGCdY9p7b/xJS07wd27pBgvxFkoaCR1Zywa6Yd1M+WOC9Cu
         kk64Rf/R4txzrwMhzlPj1lRt/NxP/I5AOp/bA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795682887; x=1796287687;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/AZpVI7KIqymZwkfQLbTYKoY9euwaZTWbbcMfI47B/k=;
        b=KqgGkHdrr3s/3dBGYqvREUUq4FPGVtrAsnf2P+kjdVmNvOqEjrrpvXWjK6joyMHKyW
         vFn5Okb9dXMSb5RSZMeITwEJdNiti/yxRRZz82JEL2dz/wV8DrzYBw0LeZ3ueH7oO/CR
         06LrLVlGXyu9YXnHWoOA6gQYZKsnxUn8SJ+G6tolj9SFj2BxLcwmm5DFezn2RF9XkqY+
         m22TOqLjaQ70kb1nA4ldc65UXhgMoTAq9FwXUjcIlXdDaSxcMgTGWt+ozL1tmGzrTrMO
         VqBp1uhU5KSBvY9WLcWXXrddIDPrr7pTlG2PE9gvmQ3b5GCAximQkCGDdOUjt69IemLc
         /cmg==
X-Forwarded-Encrypted: i=1; AL+hErEcxu88GMTQ8rm1OyZCCDrpz6d7KuR/G6ykwkuvVh9uyg7NCpnFLcZbroOAGYFTqCh8NAd4x42zvHGJQKL3Og==@lists.infradead.org
X-Gm-Message-State: APuU4Z/E/6gEYhyck0DIgzVxwlgr5Qa55wShQj/Ux/t7x/LgtDW4lK1I
	M3V9KAkmiHxVz5Qva9QLCb7R4t6I4WzjhsJ9NAVigcHmhMMKMDiOiIAVZ33i9aW+65LxMZd17N8
	dtiiJZ8nzwF5BvFK9pQomp0nmMqfsIUOY5+yuU7Wt
X-Gm-Gg: AZFdTZdhI0OI6RtOV8vcKRoA28riBjFNVxUJ9VgGk+VLHkSTiYooXnMlfYoQuG2zDA1
	5vO1nZ99O0RPF6W0YXEmDO7klI8Hka1UNDtq7NmAJwyYjF2cpywk8aRskbSMfsBOyHMrwvBRJUS
	voB48OKO99F9QobHeO3hitvfQon8xQ6RAcci6y+oxWr1HDMa2tvrDMn0febVcadTfaC6tpp38BQ
	TsaAz/uuZMIaOIZDeaTr7PL8vsMjFeulMELmJfm17kKomAkltr6eN7U52mBVk1ochiqdIJ5e1rd
	5yTGpWu+OFjZu4XzekabqZ6jHZaKPlfI2I+d8UnFnM8DxY/PI9Df+xLv06MZLD0K4jksHrDR1iE
	TBXTiim04dzrWUuuNrd/+Ocr+o+tvGpC0/kSoa/ZL/sx7shvvQJdqKpF5Tyt2YdHckl0=
X-Received: by 2002:a05:690c:3181:b0:8b0:e13c:2852 with SMTP id
 00721157ae682-8b518e8aa28mr76705587b3.7.1795682887386; Thu, 26 Nov 2026
 00:48:07 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261125-timer-mediatek-gpt-irq-order-v2-1-e9e793bd87d4@gmail.com>
In-Reply-To: <20261125-timer-mediatek-gpt-irq-order-v2-1-e9e793bd87d4@gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 26 Nov 2026 16:47:56 +0800
X-Gm-Features: Aa3M54qf4cs2aSjQ1h2bRvoduY7bxQ8dKJy1_2bbcHeKnvBYrvNW4fHBBOgXtRY
Message-ID: <CAGXv+5FEYqMrpL_Kze=Q30CEozpUQND-qX-hVi-gLZMpkd6r2A@mail.gmail.com>
Subject: Re: [PATCH v2] clocksource/drivers/timer-mediatek: Enable the GPT irq
 before registering
To: Ryan Brue <ryanbrue.dev@gmail.com>
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Luca Leonardo Scorcia <l.scorcia@gmail.com>, Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_004808_667279_EDB5E12D 
X-CRM114-Status: GOOD (  17.41  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 26, 2026 at 1:14=E2=80=AFPM Ryan Brue <ryanbrue.dev@gmail.com> =
wrote:
>
> Since the driver probes as a platform device, the GPT clock event is
> registered late in boot, when PSCI CPU idle may already have put CPUs
> into a state that stops their local timer. Those CPUs wait in the
> oneshot broadcast mask on the hrtimer broadcast, and
> tick_install_broadcast_device() arms the new broadcast device to expire
> at once so that it wakes them.
>
> mtk_gpt_init() sets the timer's bit in GPT_IRQ_EN only after
> clockevents_config_and_register(). The forced event fires while the bit
> is clear, the status register stays clear, and the waiting CPUs are
> never woken. On an MT8173 tablet with the CPU_SLEEP_0 idle state in
> use, this hung the boot in 20 of 40 boots; with this change it booted
> 16 of 16.
>
> Enable the interrupt before registering the clock event. The IRQ line
> stays disabled until enable_irq(), so the handler still can't run before
> the clock event is set up. With the bit set, the timer that
> mtk_gpt_setup() leaves running could latch an interrupt that
> registration doesn't acknowledge, the kind of pending interrupt that
> commit fc686d0037d7 ("clockevents/drivers/mtk: Fix spurious interrupt
> leading to crash") acknowledges in mtk_gpt_enable_irq(). So stop the
> timer before enabling the interrupt, until the core programs an event.
>
> Fixes: 7a097aba7255 ("clocksource/drivers/timer-mediatek: Convert to OF p=
robing")
> Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
Tested-by: Chen-Yu Tsai <wenst@chromium.org> # MT8173 Hana (Telesu)

