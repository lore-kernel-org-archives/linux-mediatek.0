Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 314ABCF3195
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Oct 2024 03:49:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nAEKTIpBmymWLR+e+hBkypCfwSNJotZOEB0oMjBgW3A=; b=aTaJncUT498P/RaAwbiMKCf2KL
	c1XGsyO/n7gSdE4DQY3ZEIQsxHBaRtSu6RdYuCeHCkjqlyxZ4beqdAP66Wm0Fr0D60TtBT6cpHDa8
	RZaXOuBD0TcOqr4W6WI/70tqfhoqcN7uhu55pMk6xdmu4V9HbZfo9UYcEcUF8tnHQV1H9cIw8SJaQ
	23m1dstL+gicc0BpQIsaBSVIuX9erbo2vowOunIsz8FUaFbseQg/Fv04ngL8+Mvl3sCuHOPaUNk98
	8d6GFhu8NsdKUZKegB4OjLZW0zKTrdh1XuLCMtcHrSYuws/T7UuKkvt46lRm3vvxBYA3IV+2kqkew
	igSt/YvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svqMP-00000004j7O-3zjo;
	Wed, 02 Oct 2024 03:49:09 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svqMM-00000004j6h-3PjO;
	Wed, 02 Oct 2024 03:49:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 8D0E0A4367E;
	Wed,  2 Oct 2024 03:48:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37384C4CED8;
	Wed,  2 Oct 2024 03:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727840945;
	bh=nAEKTIpBmymWLR+e+hBkypCfwSNJotZOEB0oMjBgW3A=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Af2UjTVfNh6y+KURqioy4b8Bj7Yu5BpvrE0pOuTAaCdsWVGE8VQdAPbay4eP9DqPg
	 vWMLCMNoxrjpq2dgf0Gkki5SuP7pwmk7jkH2meg7cuorJVxX/VF75raABEWvzkaMHi
	 vhhxdgRpR3b7B5ke0UhpF0oO9c3sZ7F6qfo5LaAZzh2DiImZJl6yUno80Km9y1f2VX
	 IIlH0yPKwIL8OBus0S8hdF72eqSA5xm2L3CztnHUgtzPMXEtvUhtadchDi41GC6Mt7
	 Ca1gozPG5gv1ZiW5uDRIVS53lJA/EuDl2IF4CK5RlPgdKNeNXNE2aGU70QMIY0HzW0
	 QHOaUeFAAHJ5A==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5398e7dda5fso3508050e87.0;
        Tue, 01 Oct 2024 20:49:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUP527V48VPJ4+P9bsq4+S0h61PPOQLSQOB+3fLQ3AxYZD062IlpO8XupGDmx+n3aWaWCBiO/DnfjUEC3RUEOU=@lists.infradead.org, AJvYcCV3tmX6tn19ikDAxiigLoUS3xmtxf7RiDdjfDyAL7vuUgvgBUolXY/eJm8SjBj6F5aX5vZnGcuK1OJIbuwgEos=@lists.infradead.org, AJvYcCVTDR6FbF/TVrAHWYGedAyJy51YMNprJL5isATLKCYjcDPH6db5Aa1t6qTqrWiFB7QtuILl8yOpUE8An5/w@lists.infradead.org, AJvYcCWIS+ZKrjsAkXLW+f0Phk0iVTGBHrbw4dV0u0UhkvmI2YGE9q7Z1VO9aioQdK2AE8GHQmiUWIIcdlhRndcXGn+jSg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxol8oc6hpRZUhpbxFm4w7IoU5azXx4BBRnFksjNxXxny9IKHT6
	phoeiS9sgp+rpDZkob6mNxjCpAmvzRQryL2yIkb44aKtXKaCkDmkEpaY6BnT8Mc6IPKTlJtwJJN
	n2yWBERc9yUVL+ncPEqElNNK49g==
X-Google-Smtp-Source: AGHT+IEqtnQCtoRUlnvKJ/juvutRb8LD+WF2Ji1IL7egoXyMFlaAGJMVK219VrK0qM0doCIPbjzZD5sR9nPD1sht5+g=
X-Received: by 2002:a05:6512:1113:b0:533:4638:df40 with SMTP id
 2adb3069b0e04-539a067f65cmr743356e87.27.1727840943291; Tue, 01 Oct 2024
 20:49:03 -0700 (PDT)
MIME-Version: 1.0
References: <20240930223550.353882-1-rosenp@gmail.com> <20240930223550.353882-3-rosenp@gmail.com>
In-Reply-To: <20240930223550.353882-3-rosenp@gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 1 Oct 2024 22:48:50 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKNMhUy3HUAanod27FnJAz35w7FLp7tp0Uo3SeVbG7EGw@mail.gmail.com>
Message-ID: <CAL_JsqKNMhUy3HUAanod27FnJAz35w7FLp7tp0Uo3SeVbG7EGw@mail.gmail.com>
Subject: Re: [PATCH 2/2] ARM: dts: assign reg to memory nodes
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Antoine Tenart <atenart@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Jesper Nilsson <jesper.nilsson@axis.com>, 
	Lars Persson <lars.persson@axis.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Viresh Kumar <vireshk@kernel.org>, Shiraz Hashim <shiraz.linux.kernel@gmail.com>, 
	"maintainer:SPEAR PLATFORM/CLOCK/PINCTRL SUPPORT" <soc@kernel.org>, Marek Vasut <marex@denx.de>, Jisheng Zhang <jszhang@kernel.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, David Lechner <david@lechnology.com>, Nishanth Menon <nm@ti.com>, 
	Santosh Shilimkar <ssantosh@kernel.org>, Tony Lindgren <tony@atomide.com>, 
	Enric Balletbo i Serra <eballetbo@gmail.com>, Javier Martinez Canillas <javier@dowhile0.org>, 
	Alexey Charkov <alchark@gmail.com>, Denis Burkov <hitechshell@mail.ru>, Arnd Bergmann <arnd@arndb.de>, 
	Stefan Wahren <wahrenst@gmx.net>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	=?UTF-8?Q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>, 
	Nicolas Chauvet <kwizart@gmail.com>, Tomasz Maciej Nowak <tmn505@gmail.com>, 
	Robert Eckelmann <longnoserob@gmail.com>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>, open list <linux-kernel@vger.kernel.org>, 
	"open list:ARM/Amlogic Meson SoC support" <linux-amlogic@lists.infradead.org>, 
	"moderated list:ARM/ASPEED MACHINE SUPPORT" <linux-aspeed@lists.ozlabs.org>, 
	"moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" <linux-rpi-kernel@lists.infradead.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, 
	"moderated list:ARM/NUVOTON NPCM ARCHITECTURE" <openbmc@lists.ozlabs.org>, 
	"open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>, 
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>, 
	"open list:TQ SYSTEMS BOARD & DRIVER SUPPORT" <linux@ew.tq-group.com>, 
	"open list:DH ELECTRONICS IMX6 DHCOM/DHCOR BOARD SUPPORT" <kernel@dh-electronics.com>, 
	"moderated list:ARM/STM32 ARCHITECTURE" <linux-stm32@st-md-mailman.stormreply.com>, 
	"open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>, 
	"open list:ARM/RISC-V/RENESAS ARCHITECTURE" <linux-renesas-soc@vger.kernel.org>, 
	"open list:ARM/Rockchip SoC support" <linux-rockchip@lists.infradead.org>, 
	"open list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES" <linux-samsung-soc@vger.kernel.org>, 
	"open list:OMAP DEVICE TREE SUPPORT" <linux-omap@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241001_204907_007517_0FF9C58E 
X-CRM114-Status: UNSURE (   9.61  )
X-CRM114-Notice: Please train this message.
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

On Mon, Sep 30, 2024 at 5:36=E2=80=AFPM Rosen Penev <rosenp@gmail.com> wrot=
e:
>
> Fixes dtc warnings:

Unfortunately we cannot make this change treewide. Any platform that
relies on the ATAGS to DT bootloader support in the kernel
decompressor expects /memory.

Rob

