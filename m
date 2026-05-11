Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7023CD37BE
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 May 2026 20:01:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SidA+dUAZZZvheU90fCA8wbYd1elVlbPIUNjX+RGP3w=; b=MRd+0QIjzCJrjD2bj4oGTL0PDr
	3pJ9tnJM+S/AIInsBZR+2jirA66ofN/XHIjG2cGO6IAOj1iUsjiBPrXusppP0zM8IbRGWvuHYNpfL
	s+uVvtU7niJbjzKKlTy5OVcontVJQyJhComSGa6WelKIZzaDth7xO2smXQ5rPmzzNRgT5vyHJmNnK
	MSW1PqGif0uL6+oQ1JnwkPwSDuMszznsMK/ztosX90NOHptxl06VtTLyoPwxB1Z79XyQwJxikYTnS
	a+iqfQzsJad7g2FiVINsr7jKOp/TZsBJhPjKeUXDjCG/BoyCxdUDmr9SBRyJT2+Wf6dd5POtMDaqQ
	C05X3ZVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMWod-0000000EeqH-2zeq;
	Mon, 11 May 2026 20:01:23 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMWob-0000000EepD-28ra
	for linux-mediatek@lists.infradead.org;
	Mon, 11 May 2026 20:01:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2067144122
	for <linux-mediatek@lists.infradead.org>; Mon, 11 May 2026 20:01:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 033A1C2BCB0
	for <linux-mediatek@lists.infradead.org>; Mon, 11 May 2026 20:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778529681;
	bh=SidA+dUAZZZvheU90fCA8wbYd1elVlbPIUNjX+RGP3w=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=lFfnP2XZwjdBo4BTtgU8O72MJ2clLfMZEmrgu4EPtnG9wmNecb3uP3lL1p0qjlg/s
	 CRKMRlAcaVuJTRGosEXCfpKdoxLL2hInuLQRKbudZUW59x0Q+h0lv/O+/Ch1TowO5Q
	 C7Z1o6/ws/Bz/2C+AR/s2fDux1u+3Fn1p/l4dPz2Cfqu0nLbA2UqVSpr0AxwAowRHd
	 ozhfrqhlatOaTkxDHUvBUtmDFLMxF6o7h6UW40LropWMLQZszYnJc3ktkI2AXo3P2e
	 xt0XwPPYunL9X5OAZQQ1xPY3lqgAPOLfOQbSfAKJb4V5QFTT5p+q6GLy/EakVTxuTM
	 Qpt2sm3uqMlEw==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5a40d02b58bso3559574e87.3
        for <linux-mediatek@lists.infradead.org>; Mon, 11 May 2026 13:01:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8y1TzSaqriESn4eE3sF9WBCVEu5pWbQ5t2dnntsTeBZeFCG6ejlQ/3h4dwvHcrr4taifK8YLZskaxmFi/tZw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzvETAQDgxDp6pOSb0whiRmj0PPVfp45GNoPzmrUfiMLkGy+jl+
	LutN9EayPcpTwT43FSpf3Nm2qu8NRD4uZRCc7KjG52n9Q8X/crQ0IMh66Ho1noYp2Qbkr30wHEI
	vleM4kho+bzbHNJtwroR1fZB+vpLu+nc=
X-Received: by 2002:a05:6512:3186:b0:5a8:691e:abe with SMTP id
 2adb3069b0e04-5a8e31ec72bmr5414e87.30.1778529679763; Mon, 11 May 2026
 13:01:19 -0700 (PDT)
MIME-Version: 1.0
References: <20260505104056.1812343-1-wenst@chromium.org>
In-Reply-To: <20260505104056.1812343-1-wenst@chromium.org>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 11 May 2026 22:01:06 +0200
X-Gmail-Original-Message-ID: <CAD++jLkoiJN_gxv0y4ARBMG7bTc07OjvDR1d8DykkNp7g1LOUQ@mail.gmail.com>
X-Gm-Features: AVHnY4K7pYfonqtNSNtLkl02aFuSTA7FYZ67VUeH1tI-OzuQASo_yecrO3Z2b_c
Message-ID: <CAD++jLkoiJN_gxv0y4ARBMG7bTc07OjvDR1d8DykkNp7g1LOUQ@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: mediatek: common-v1: bypass pinctrl GPIO
 layer in set GPIO direction
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_130121_570551_14A75083 
X-CRM114-Status: GOOD (  14.64  )
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

On Tue, May 5, 2026 at 12:41=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.org> w=
rote:

> pinctrl_gpio_direction_input() / pinctrl_gpio_direction_output() take
> the pinctrl mutex. This causes a gpiochip operations to need to sleep.
> Worse yet, the .can_sleep field in the gpiochip is not set. This causes
> the shared GPIO proxy to trip over, as it uses gpiod_cansleep() to check
> whether it can use a spinlock or needs a mutex. In this case, it ends
> up taking a spinlock, then calls pinctrl_gpio_direction_output(), which
> takes a mutex. This causes a huge warning.
>
> Since the Mediatek hardware has separate clear/set registers, there is
> no risk of clobbering other bits like with a read-modify-write pattern.
> Also, once the GPIO function is selected / muxed in, further GPIO
> operations do not involve pinctrl operations or state. The GPIO direction
> and level values do not require toggling the pinmux or any other pin conf=
ig
> options.
>
> Switch to directly calling mtk_pmx_gpio_set_direction() in the GPIO set
> direction callbacks to avoid taking the pinctrl mutex. Drop the
> .gpio_set_direction field in mtk_pmx_ops to signal we are no longer using
> the pinctrl GPIO layer for setting the direction.
>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Patch applied.

Yours,
Linus Walleij

