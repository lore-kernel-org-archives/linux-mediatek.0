Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5459DC43334
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Jul 2022 12:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d7+MTfcD+NFc2y/OEnklb7H3XSxJGRWVeSRrvmC4apM=; b=ww881Hc3S/kXrsWAUysnHEirEF
	/P2WxXPpned68JoFyCF8GC/u0wXbDsAamrSj1ua8dPrcJU9xmMeDCnYKXTYjn91e/tTW+WyoLaNV9
	RhWFs21XS7GuRKjQjLC9FY7HAr50nUuAgRZei+9CEMhB5v2eXG4iTYdfaiK12tKH5fxiuTv+J87SR
	wVffWLOpvTUQGLG8XFKce43lcqrOcuycgK/EywjWo/nwuAXCJuSLUe76RTan0Gtjs1Xq3ZZaSXo8r
	F0x4ZtjT7+XmRIyGk3IRq8dltPQZ9TmyjTTtJLu4Xtc0PjwXmoObvoseQyA2qcp/6vL6ao+WCl/b7
	+l9TvnPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFxU8-009gw8-Qj; Mon, 25 Jul 2022 12:46:56 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFxTx-009gn8-N8
	for linux-mediatek@lists.infradead.org; Mon, 25 Jul 2022 12:46:47 +0000
Received: by mail-ej1-x629.google.com with SMTP id bp15so20361572ejb.6
        for <linux-mediatek@lists.infradead.org>; Mon, 25 Jul 2022 05:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=d7+MTfcD+NFc2y/OEnklb7H3XSxJGRWVeSRrvmC4apM=;
        b=fEQX5UAxkfq+09coTXrN6rrW74oy24rWf11QXf2XtJpNLY7S8dqceObl3gEhdPrrvS
         MEdzc0jCz3s/8NdcOP34pFUfYlB+YV8EqpnYwLpwfauXAnlpmuEt+Fsyayt6i2dCLwSv
         wSq+e61Wk8owPJsRezgnp2Mj1p3r+zG7ZaYcDFYuFjl0LhVPOM/MouK0pyUasJb2M5Ni
         fSsvqKn47kYlyPOlfymvKRpuPtqmVZX1utFQHQMeWJRTxw5AlQZfPxvsWIxb2CDDY3Oh
         9c/UowiLKOEYLK8IU7oWM9tR9vynkrDxXEEpONfa34gV3kLDiGQBB7M3BjtJj6Vhy5FF
         PICg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=d7+MTfcD+NFc2y/OEnklb7H3XSxJGRWVeSRrvmC4apM=;
        b=WgsMGapyq3xqcsuulv8BmVmWu0LVR/Lb2Gjy8KSVbeRZ67q7O+SIoZm9FaOb37aIck
         mSEnhGlTny6r0UtP/+vBdLDuFsmRnL7dNVvIoL0DUBzigP8DSnZnGKvOuO9OOR9iUjo/
         lyxghT5M5mHzIl8OBY3W0wNcrolEqXlAilrEtSvz3le2ERkOM1ynCDa9pHJwKQn4WkFW
         Kr9vj+YUwokChqhdUei+OZ62vOMBMYlxPXFpHqXemPDk1j1uRRKkpLeyXDYTjT5ACdbu
         dWV8+EwGD5GGO9jVoqbZJ7DP+K/N/1sNjVWSi28m48La3EnAkh5DUy9TWuW+3rZ3Pmal
         dKUA==
X-Gm-Message-State: AJIora+9gyzcjmbyK2Skfqbpw8aTbB+j8Nn0Web7spaAFULjKrLBJ1dW
	dzyYRQaG5+zR0Gilu8mitlU15cenHLEyye5zf+O5CA==
X-Google-Smtp-Source: AGRyM1sCu21K/w1G5XojAxSlYHNjLDCufI94j1Lxyx/oXRqmlY5vGOzH/4OVrcFYM3tG0TTlufO236behkk0QeQyTjM=
X-Received: by 2002:a17:907:a053:b0:72b:3051:b79b with SMTP id
 gz19-20020a170907a05300b0072b3051b79bmr9552157ejc.690.1658753202304; Mon, 25
 Jul 2022 05:46:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220623090445.1401-1-axe.yang@mediatek.com> <20220623090445.1401-4-axe.yang@mediatek.com>
 <CACRpkdZ5G2fMCqvkXANVEmZjNcF4U4mSDzZk6aXbqFjYVN3hcA@mail.gmail.com> <3747f246650622ef65787159af5271a79401a855.camel@mediatek.com>
In-Reply-To: <3747f246650622ef65787159af5271a79401a855.camel@mediatek.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 25 Jul 2022 14:46:30 +0200
Message-ID: <CACRpkdZP-FBP8hsBfeMn1M8=VR_cYG+j9GQc9VdV-HjkvSo73w@mail.gmail.com>
Subject: Re: [PATCH v13 3/3] mmc: mediatek: add support for SDIO eint wakup IRQ
To: Axe Yang <axe.yang@mediatek.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	Chaotian Jing <chaotian.jing@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Satya Tangirala <satyat@google.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Lucas Stach <dev@lynxeye.de>, 
	Eric Biggers <ebiggers@google.com>, Andrew Jeffery <andrew@aj.id.au>, 
	Stephen Boyd <swboyd@chromium.org>, Kiwoong Kim <kwmad.kim@samsung.com>, Yue Hu <huyue2@yulong.com>, 
	Tian Tao <tiantao6@hisilicon.com>, angelogioacchino.delregno@collabora.com, 
	linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com, 
	Yong Mao <yong.mao@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220725_054645_764214_119F6D22 
X-CRM114-Status: GOOD (  20.27  )
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

On Mon, Jul 25, 2022 at 11:13 AM Axe Yang <axe.yang@mediatek.com> wrote:
> On Fri, 2022-07-22 at 13:21 +0200, Linus Walleij wrote:
> > On Thu, Jun 23, 2022 at 11:10 AM Axe Yang <axe.yang@mediatek.com>
> > wrote:

> SDIO DAT1 pin mode is changed to GPIO mode in
> dev_pm_set_dedicated_wake_irq_reverse():
>
> https://elixir.bootlin.com/linux/latest/source/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c#L339
>
> dev_pm_set_dedicated_wake_irq_reverse() -> ... ->request_threaded_irq()
> -> __setup_irq() -> irq_request_resources() ->
> mtk_eint_irq_request_resources()-> mtk_xt_set_gpio_as_eint()

This doesn't seem to have much to do with pin control?
No pin control functions are called on this execution path,
no pin control state is changed, right?

If what you mean is that
it happens to poke into the same hardware registers that is
mainly a matter of concurrency in the driver, sometimes two
abstractions happen to have to poke into the same hardware
registers and then it is up to the driver to maintain state for
the hardware, this is not a question for the framework.

How is Mediatek developers thinking about this thing in general?
You are a few people who developed the driver so certainly
you must have some design idea to why irq_request_resources()
poke around in these registers? Does it even perform pin
control behind the back of the pin control framework?

> To restore SDIO DAT1 pin to uhs mode. I have to call
> pinctrl_select_state() twice(change pinctrl to another state, then
> change back to uhs mode). Ulf worried we might be doing something at
> the mmc driver level, which should really be managed at the pinctrl
> layer.
>
> Do you have any comment or suggestion on this?

The pin control state transitions are really just finite automata.

Your pin control needs to be different when using wakeup from
when being used for SDIO and this is perfectly fine, it's no
different from the fact that the regulator and clock might need
to be in different states, so I don't quite understand the
question?

Yours,
Linus Walleij

