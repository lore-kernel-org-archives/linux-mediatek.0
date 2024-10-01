Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CB54CEACFB
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Oct 2024 20:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Txj9X25LmbjQ//MeIX5ksz2p7RxnM6sQFO6w2mk7FrQ=; b=xmg0Jd84WK27RpkdQgKS3Zjzf8
	8XcLHUo/TrZNQ3GcNQrr+aOuGONDDzYyPl9/4khb45EAIgOCUXd3XUrkLQc5Wyp7QJQ3UIplsvpIf
	GGvENZDMr3TYyQrJ83KLDh2NsYSfeXf1lMu0UGi/Mwl7wjGvotWF5Y5ylJhhih54G+EvLVGaAIyHv
	wxLapgsYwARQ7+U9MDHdEFv6abkf9ZoRuRmln7olfyXyPEtojXZm/mFYSVxLMMa2Av7rM47NvzQhH
	Aqr3de0W5qOdf7RA5GzOyc1KqFoaIpnRTzvBxmmoly5/xFBGM0beoYLvcLTQjSyDloNKZC7yBs0+X
	JSIu44TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svj2d-00000003wQV-0SgW;
	Tue, 01 Oct 2024 20:00:15 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svj2Y-00000003wPQ-3Afe;
	Tue, 01 Oct 2024 20:00:12 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-20b7259be6fso32127955ad.0;
        Tue, 01 Oct 2024 13:00:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1727812810; x=1728417610; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Txj9X25LmbjQ//MeIX5ksz2p7RxnM6sQFO6w2mk7FrQ=;
        b=jH22kuu6/bunURGQqsMuXwLQxV3R6n3/Bia7KyIVnJh6U9wNiK7Lo3v5AB1Ap72jKs
         +ZzqyWH888er7eE30uQmvqPdhq6GLUMBUpiIRjceumPhEWC+75oqSXuLMagPg8WNXuso
         1SgY1Ev5XksBX3GjgLi+j+6H768zC7dlHVHWisszEJXb6Z44g2CXMEvVBV8c7PM8TnDK
         YblquqRibJV7PmrMgsZUzcvaBTNrWxQjsFmCdEaRktNrlnfiwcxfukLknsF1BwjfXDPW
         gHisqh1AwqW5b4QSAO7VdjoA34R5qh+zP54U09cMitQ0ChOtc4Vizem2nb2n1wLICuUw
         l/mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727812810; x=1728417610;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Txj9X25LmbjQ//MeIX5ksz2p7RxnM6sQFO6w2mk7FrQ=;
        b=bouqX9xGRYR9eaOn8mHDPGd4eQJoqZHcKyaOsFc1wvAj5Cs21mrsnTBnyYoo047sTc
         a9hmJ4XHnT4v6FHVXK/52uBsW3r5Vwf/ZtpxbpFI3NY6VAOiVB+1pkNMOEI8CBMTLyfr
         lyaK40SpLSfrT8yQP7ZZbS4nhV5TIHAFiplgOaWICh4YXFLjjiQ0n3qieeePJfXOsOGJ
         vBF8ccJNvqSwqhOjLTfLjzYsGtdu7E6DVaJOOlv2Wf6DtObCA1vJ0p8AT5CaNrRZDHio
         52gSudVnfQBxYDFGWEQVxmDBkh+Dvv550X3myga6og+a+9nirp73ZLSjZ7d80iXxu3N8
         48ow==
X-Forwarded-Encrypted: i=1; AJvYcCVG96omvWwWPeSOflA/cu5TJT/1787ze+ZUgxewQJ3jEOABYqGDQQDsZUHz9qy1s1Up2kNdYgEHkMWVN1Q3Ojw=@lists.infradead.org, AJvYcCVRlWcEycg0Qls6NK8MdnhtViOVGoa/DBOPiWdBEisjnE8XimGXK5nEduCPKfJN2kJ4KKe5odu2dRXd+kP1rV0=@lists.infradead.org, AJvYcCWxmbUL0v0qS/jj8aTMvtjcjeWT/zvmXAeG2nVD9u+1n9HjESXaD1xhsecwV/NGHgGJnid+8ZzDvpQpkBgbKVp1Kg==@lists.infradead.org, AJvYcCXuEctKjnx3vSiJBRv2atjgg0H6GEAv3tZttSjt3/fS6ILQ5PoHs8j1lvEV9NIoZWCTzE8XGjM1O9Zjfryu@lists.infradead.org
X-Gm-Message-State: AOJu0YzdrAy2nZvlFhUlmNAFA03qPVELFyfijKVkK2v5XbW0JnCoc8KL
	+Rb0MYzhx4gwfQuvjVUfwzy0osCwepTLsPXY1eAHt6Hym6E9xeedPVlzevLfzheuNIAkp5MvxaX
	tzm5cIO73NgC/UnfPUPV6PDtIcSQ=
X-Google-Smtp-Source: AGHT+IEzN68oFH6UETNrpbvCGpopcDsigqPvgYKygFNF7D6FUqPz4x1zQ8ZA7UoZNXXUi84OPMM6AhdceSvhM1DdNJ4=
X-Received: by 2002:a17:902:e550:b0:20b:720d:734 with SMTP id
 d9443c01a7336-20bc5a5cd06mr11151925ad.41.1727812809889; Tue, 01 Oct 2024
 13:00:09 -0700 (PDT)
MIME-Version: 1.0
References: <20240930223550.353882-1-rosenp@gmail.com> <20240930223550.353882-3-rosenp@gmail.com>
In-Reply-To: <20240930223550.353882-3-rosenp@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 1 Oct 2024 21:59:58 +0200
Message-ID: <CAFBinCB1Rz+C=Tj+RJAL5KZbk9K7cnpF_uR6rKkMeqyCuDBo4A@mail.gmail.com>
Subject: Re: [PATCH 2/2] ARM: dts: assign reg to memory nodes
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Antoine Tenart <atenart@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
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
X-CRM114-CacheID: sfid-20241001_130010_843979_D4F3CD41 
X-CRM114-Status: UNSURE (   9.49  )
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

Hello Rosen,

when you re-send this, please drop the Amlogic files.

On Tue, Oct 1, 2024 at 12:36=E2=80=AFAM Rosen Penev <rosenp@gmail.com> wrot=
e:
[...]
>  arch/arm/boot/dts/amlogic/meson6-atv1200.dts                    | 2 +-
This file was dropped with [0]

>  arch/arm/boot/dts/amlogic/meson8-minix-neo-x8.dts               | 2 +-
>  arch/arm/boot/dts/amlogic/meson8b-ec100.dts                     | 2 +-
>  arch/arm/boot/dts/amlogic/meson8b-mxq.dts                       | 2 +-
>  arch/arm/boot/dts/amlogic/meson8b-odroidc1.dts                  | 2 +-
>  arch/arm/boot/dts/amlogic/meson8m2-mxiii-plus.dts               | 2 +-
These got updated with [1]


[0] https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git/commi=
t/?h=3Dv6.13/arm-dt&id=3De2a3f11ae11c9f9ee780bf49f00a69f12dce3529
[1] https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git/commi=
t/?h=3Dv6.13/arm-dt&id=3D7947fd2d350e6057e7514459c7ee2db39d1096a2

