Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAA2C606A33F
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Nov 2026 09:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jXxRZGNU;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=l/39h8mY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=6+yKcd34YBJDbehP0dz+di+4vqNJ4KlYRH/PR+seNMI=; b=jXxRZGNULPDAaA
	162PuhF3wLYWqt66831VMBhesRaCrLsGOArzsihdci73+HJRUW99WrkOG6QAd//5aMitLeYh9uAOq
	baTVtOqK3xYauwsaB/GJw0o2sRoJdiW0Ya3AjHItE32N0OlG0/b1F2HuhTesEwfmWVRvdwETEXrex
	cyNfZAPfjDMJoLb0u8xS8T78Nq6XqeXZv3to1SbHgainrupM/JP4DhZjhzjRI7/vH1a1xfw+C6TCD
	Kw6kzL+bOhIJ0Awod0bVskTdryLCjJUi23xANw8FE4nlUCPYJx+VXgm+PsYsYPx3lay6xZJ5YAuZn
	TZhlRibv6nLnRCatwAOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQM5q-00000000JOD-2Vrd;
	Mon, 09 Nov 2026 09:55:14 +0000
Received: from mail-yx1-xb12d.google.com ([2607:f8b0:4864:20::b12d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQM5n-00000000JN3-2u8L
	for linux-mediatek@lists.infradead.org;
	Mon, 09 Nov 2026 09:55:13 +0000
Received: by mail-yx1-xb12d.google.com with SMTP id 956f58d0204a3-679a2b5fe87so692052d50.3
        for <linux-mediatek@lists.infradead.org>; Mon, 09 Nov 2026 01:55:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794218110; cv=none;
        d=google.com; s=arc-20260327;
        b=P3mfhIRACU1okuwDMzWzKwUuRs4p1j1pJkpWgHeVJiVObq9CNwemgrnvyW+xIhGFAJ
         fe8B1h9UAUrkzhIA17YtRII7qbB/c6fYQ4e2EzOhWF35yRaSeKd73A5r3NWJTwjTrYb5
         tj7SSylKiLAF3UQHbLbT0ihFjJsC47MpyFrVlc5HZJP/sOKHKmZAZZb7ZUP7EMMexMaO
         itohNq+BOlQVpCgpQxJCO2lkaCn7QNp0Iz1rPvWBlC/cvLWWJuekOVdBN+AWBv5sh/Nd
         glnXxCUDOLJOOcgFPR8v/xGbw22wVOhphRVidQ6nm7q/vJrQlJkdNg7GYy+yFt3dXIE5
         UgAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6+yKcd34YBJDbehP0dz+di+4vqNJ4KlYRH/PR+seNMI=;
        fh=ZynzH4cSk1okIAiw+OC3s5T9f3oaaN78ZGliJ9cUQfQ=;
        b=QGhglMsPR80V3s0pcqTU6xKII7+jRBStyNAvRP3ojCCBrw+9J9RfGAlkAXsToKYNQY
         4974vN54OPzWTCaRwvM4PfBC1qlCERhfi077MEJ8vqHjKWBvDc1ODHEu/k8KfwP3JdbX
         2+lDvA8ZzjiQVya8+PGnok0KldT2vycGR801Ggmc6wUJjNUpYLOIN7C3eSb/pJd5rCNO
         zEjelJJ7DNh7/I+J74m5J0u3u7G1m/nmF5IWC8aPy4b8zes3GpOhcaQd0TZxqph4ksQi
         oH3IGSS6v2IA1O4iBEg0JVRWKWBfQPkjmBDsg0H1SZqWTpzyfrqLV1XDrG7I7zsNPa5Z
         RauQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794218110; x=1794822910; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6+yKcd34YBJDbehP0dz+di+4vqNJ4KlYRH/PR+seNMI=;
        b=l/39h8mYNFIY/cAkPooxvjHlo+PB9Ld+pcPqc30KirIIm6IsNrf2/+o1Gkr2g2IigB
         pvFI9LlTtRiWzsAY+bDRn3bv0NZjuiExWnXMQA6hf6VgjuOXJKwFFuO2p8GDvbtYjvwh
         GQs8iN58/6iQXed/2czsAjQwps56f0KNvk180=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794218110; x=1794822910;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6+yKcd34YBJDbehP0dz+di+4vqNJ4KlYRH/PR+seNMI=;
        b=vZBaIAJqJLtfI2H+EgavYsizUj1NGk7IZqHgqqyfwCp3b+7ycuyxkEqhxGYmb7pV87
         OzUQl4E3QDJAns8CJ5pp7juu/K6nfcCX91Hx5MnQ7XnXO8V0bK5Uq3XYpXfDNY5l9Jtv
         1xz9ngG+xrE4HyijqnJCZDuGe4j03Ol1OkTMlG2OP4t7mRreu0RnHWkZsNE2pwoz+WyZ
         OmdPZe1RJEvmfk1UAk9M9/EFdBzdEOUtg4QZFAQumRc2SMyHM9Fjix8B8wqbdReeB+pm
         BEkCcTOr7lvMvELFmQ2V49x7CgD2uJmHwwuwl1Q7Z33LDKly9k/JzgviQVbld0TVl9j8
         nPvg==
X-Forwarded-Encrypted: i=1; AL+hErHaRphl93PiM6vqgeJe8pyzxoxQUK1pFaWGuzoInB5XB87JmrH4ksda1Cu0Ppc545gaZj7H5ZZqDCLWG+aflw==@lists.infradead.org
X-Gm-Message-State: APuU4Z9WJ7qovkPiQ5SLMBW5TeeRHGf55qKdXIakGE02sYbiDhMQsQVp
	kfq16XFTlrykId96BzjV4eu64wpVE3h/o6CUDk3fKqf2hEjM1cnrLg5NAZzFydkhuzKilhyIZyb
	fjaP++scNBM+QuOeW1uP4bT+PN3jz9KEiS7IYGIX1
X-Gm-Gg: AYBFou3pIb8t065gbQcN5uECMi+pc7011nKP4XdQ5nrNqI1bey1bbxPLrtwcXQjbowB
	Smc1+PeQbLGdTpK6aq5eeo2CbGgJq6S8vAtjOyBmeM3gvq+0fL9pX/NLwGYCkLbYFmyVwzUWGZE
	F9LV975NXin8dfrB4ytbqSDiQVtvrJmCretxshL7ynZtj8WLbeOzEu73Ol9o+sCvuPsCX2l5Na3
	gH764hv6rab6KFahnGf8+0qT0af0BHPMpY+71I4aEOccgEHMW6vEyncRVOKy8f+VphOF/zXpxjL
	24JC2QagFztzwYq2UISwr7np3qMdIPT/i9CsmlhH0E42vBr6TlG0p+3QoWdIBb45Kc/+pXeM8P4
	hv4AWPepeplQyBOFfOjyU50bh6fc0gckYr759Fw==
X-Received: by 2002:a05:690e:304:b0:679:9ad9:b103 with SMTP id
 956f58d0204a3-67c3da632ffmr1254960d50.136.1794218110297; Mon, 09 Nov 2026
 01:55:10 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261103-timer-mediatek-gpt-irq-order-v1-1-6d1ddf977224@gmail.com>
In-Reply-To: <20261103-timer-mediatek-gpt-irq-order-v1-1-6d1ddf977224@gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 9 Nov 2026 18:54:59 +0900
X-Gm-Features: AclHuK-bIXuY3rwirQbdsttFwHYyj6lmMzuR08wUI0ixSLbLjL_ihv4G533qIVU
Message-ID: <CAGXv+5FSG5P3-4-eijurDA68NzcFOXJN5k12WV9SJ+_3wmTjPQ@mail.gmail.com>
Subject: Re: [PATCH] clocksource/drivers/timer-mediatek: Enable the GPT irq
 before registering
To: Ryan Brue <ryanbrue.dev@gmail.com>
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Luca Leonardo Scorcia <l.scorcia@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_015511_744959_E11BE52C 
X-CRM114-Status: GOOD (  30.18  )
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wed, Nov 4, 2026 at 8:18=E2=80=AFAM Ryan Brue <ryanbrue.dev@gmail.com> w=
rote:
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
> is clear, nothing is latched in the status register, and the waiting
> CPUs are never woken. On an MT8173 tablet with the CPU_SLEEP_0 idle
> state in use, this hung the boot in 20 of 40 boots, and in none of 16
> with this change.
>
> Enable the interrupt before registering the clock event. The IRQ line
> stays disabled until enable_irq(), so the handler still can't run before
> the clock event is set up.
>
> Fixes: 7a097aba7255 ("clocksource/drivers/timer-mediatek: Convert to OF p=
robing")
> Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>

This seems to have fixed the cpuidle related stalls I was seeing. I
didn't do that many rounds of boot tests though.

Tested-by: Chen-Yu Tsai <wenst@chromium.org> # on Hana (Telesu)
Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

I do think we should expedite this into the kernel, as a 50% chance
of stalling is not great. It was even higher for me and somehow I
had to do a hard power cycle by rebooting the EC to get it unstuck.

> ---
> Since v7.4-rc1 the MediaTek timer probes as a platform device, and on
> MT8173 with PSCI CPU idle the boot then hangs about half the time: the
> broadcast device is armed at once to wake CPUs that are already idle,
> and that event is lost because the GPT's interrupt is enabled only after
> registration. Traced on the board with prints in
> tick_install_broadcast_device() and mtk_gpt_init().
> ---
>  drivers/clocksource/timer-mediatek.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/clocksource/timer-mediatek.c b/drivers/clocksource/t=
imer-mediatek.c
> index 842d6ee4259e..1b2cbcc2795a 100644
> --- a/drivers/clocksource/timer-mediatek.c
> +++ b/drivers/clocksource/timer-mediatek.c
> @@ -339,10 +339,10 @@ static int mtk_gpt_init(struct platform_device *pde=
v)
>
>         /* Configure clock event */
>         mtk_gpt_setup(&to, TIMER_CLK_EVT, GPT_CTRL_OP_REPEAT);
> +       mtk_gpt_enable_irq(&to, TIMER_CLK_EVT);
>         clockevents_config_and_register(&to.clkevt, timer_of_rate(&to),
>                                         TIMER_SYNC_TICKS, 0xffffffff);
>
> -       mtk_gpt_enable_irq(&to, TIMER_CLK_EVT);
>         enable_irq(timer_of_irq(&to));
>
>         return 0;
>
> ---
> base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
> change-id: 20261103-timer-mediatek-gpt-irq-order-a878ed869f84
>
> Best regards,
> --
> Ryan Brue <ryanbrue.dev@gmail.com>
>
>

