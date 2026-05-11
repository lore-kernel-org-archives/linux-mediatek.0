Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3278CD484E
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 May 2026 20:01:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=afMhjAzIKP5bcnZSy3KWIznLuKc6kIGzKnWy48IwObo=; b=fkcfHLkWB180yZfvpyCKc/RE+a
	hdY+ZYpHWQNelpuclbK3+mNlMEIqWIdxVSSXHYCOKJ7wMKkx9Qk1TlfDoepZVdIkKOgvrS/43M59C
	ZWY9i/RxNHRpLCdbjVEHKECq8wgi6AJBj2xpjrsuhgJepZNJOjU2T7Qt9Aqi1Xna1JvY7TdVG6c2g
	jtfbHwAGXPh3Fx7I2/I6qb7WiCRMHLiFlzVGUWJtiq/d4flBUibQbBirIxX97ko7uXx1UAW0pifpb
	hXvhC7wodre/4F3KJfkW+YtIQsKF2jyk9t9DDxj97AwAQ0zCx0DLIdj0u29t8v2JID78wtf9LTkUH
	kYa5pAHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMWoM-0000000Eemt-2Ma9;
	Mon, 11 May 2026 20:01:06 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMWoH-0000000Eels-1xmv
	for linux-mediatek@lists.infradead.org;
	Mon, 11 May 2026 20:01:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8360C41705
	for <linux-mediatek@lists.infradead.org>; Mon, 11 May 2026 20:01:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 662BEC2BCC9
	for <linux-mediatek@lists.infradead.org>; Mon, 11 May 2026 20:01:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778529660;
	bh=afMhjAzIKP5bcnZSy3KWIznLuKc6kIGzKnWy48IwObo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ZjSMW4AVnQL/NQhwz+ZpLjM8Hk9JMOKws3Spz8ouELIc+Bu9KqBJDlfrPHMktFTim
	 Vb4ZH+2KCTkTF/lb22lBG9p+eKe6tHw1UTPhNHH62QHGjDClYKvn1OwUMmNRFG+SST
	 jQPwXzj2U79XuxIVNtekGd9FnWj9Hc4Cl7WgZ5/uzY8JTgW/z3Rh3S6nKpwg6862V3
	 dUeuMr9pQe76NrilzH41A/u5OKYW/W/Cax5E1OAqHVUj1+9M/SOkwPmPhT7NupiyV4
	 HfuGfmHXERRdoxl1UoTJY+PwrKgnU/uBhivXGHpwYdtY5IE7kKYpaWBef0HoPAURMo
	 p9Lotrc22yfZQ==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5a8d1f43432so1848164e87.3
        for <linux-mediatek@lists.infradead.org>; Mon, 11 May 2026 13:01:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8u1RHtB82veAtw8iQDQw7Sem6NHMl8k7Klq0TUxx+cgtJ1QGK7LUAxsYUm6zhhM0IGPkSeMSMFMrI8e1xV4g==@lists.infradead.org
X-Gm-Message-State: AOJu0YwUiOe2xeJA/90TGx6ptODeAuUjLsdaTbSC8iUkg4BLEPTVwDb6
	06kaIXl2+QW1QwZIg6CpUauOmtkKJAq8WRQKz0igz3oX4fFC0T72OqEW7B7NBlOYcLmmCz78Fke
	WmzmtqeBFRQo6FhgSMgMQ7k32xIzRUqU=
X-Received: by 2002:a05:6512:3b86:b0:5a4:d9:88a5 with SMTP id
 2adb3069b0e04-5a887cde895mr8789758e87.24.1778529658964; Mon, 11 May 2026
 13:00:58 -0700 (PDT)
MIME-Version: 1.0
References: <20260505104003.1811841-1-wenst@chromium.org>
In-Reply-To: <20260505104003.1811841-1-wenst@chromium.org>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 11 May 2026 22:00:46 +0200
X-Gmail-Original-Message-ID: <CAD++jLnpsmV=yqjrFZiqqRxHVM-7pG3SZ15DKakj_3ODnP4wkg@mail.gmail.com>
X-Gm-Features: AVHnY4KLb5dofKxjtoMouq5Gr8Qpwowhm7jBE9YnqDOByoiTwxk2QEGRigVxcuI
Message-ID: <CAD++jLnpsmV=yqjrFZiqqRxHVM-7pG3SZ15DKakj_3ODnP4wkg@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: mediatek: paris: bypass pinctrl GPIO layer in
 set GPIO direction
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_130101_528661_3710E64D 
X-CRM114-Status: GOOD (  16.24  )
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

On Tue, May 5, 2026 at 12:40=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.org> w=
rote:

> pinctrl_gpio_direction_input() / pinctrl_gpio_direction_output() take
> the pinctrl mutex. This causes a gpiochip operations to need to sleep.
> Worse yet, the .can_sleep field in the gpiochip is not set. This causes
> the shared GPIO proxy to trip over, as it uses gpiod_cansleep() to check
> whether it can use a spinlock or needs a mutex. In this case, it ends
> up taking a spinlock, then calls pinctrl_gpio_direction_output(), which
> takes a mutex. This causes a huge warning.
>
> While this class of Mediatek hardware does not have separate clear/set
> registers, the pinctrl context has a spinlock that is taken whenever
> a register read-modify-write is done. Also, once the GPIO function is
> selected / muxed in, further GPIO operations do not involve pinctrl
> operations or state. The GPIO direction and level values do not require
> toggling the pinmux or any other pin config options.
>
> Switch to directly calling mtk_pinmux_gpio_set_direction() in the GPIO
> set direction callbacks to avoid taking the pinctrl mutex. Drop the
> .gpio_set_direction field in mtk_pmxops to signal we are no longer using
> the pinctrl GPIO layer for setting the direction.
>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Patch applied, thanks for your perseverance Chen-Yu!

Yours,
Linus Walleij

