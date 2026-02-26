Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E3C3FD8FC7
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Feb 2026 15:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O0ezGVOcarv9ScNAFNBu6P5NdLNkz1RoEz4XxD5dNpA=; b=rdO99jeo3gf+JgNtgBnDqnAgqF
	UgqjaySiOts1IahM/T+5Rt8zccJ+h89urMdP56BFAV3ZvdRV5utNRicUaghmu7mz6DrjlS6XGe0eu
	Yln6MjMUu8F8tFwe8fHjyDl8jNDBRhw4nCqkUDg48R2WkJM6l+z2ghBfpeRtKqYLpfeEEWfCps2Bc
	GO8UmGB+M8hNONDdSMKMsGhacm7ewHgevWt9NQYfZBU1AIgsAtEHISWTaYzMEJ8g6L4XDru82SCSA
	tGqb2Lyi0Wkz+tkVPwFa922/ly686EBQMgxvxkVw1R4mlz2WTy6+KbgJz4x5S0WqSQ4yftM7opMhc
	eoywoFKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvd9B-00000006UD1-0Iwi;
	Thu, 26 Feb 2026 15:19:25 +0000
Received: from mail-yw1-f181.google.com ([209.85.128.181])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvd99-00000006UCh-34Yz
	for linux-mediatek@lists.infradead.org;
	Thu, 26 Feb 2026 15:19:24 +0000
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-7985d11da10so9381597b3.3
        for <linux-mediatek@lists.infradead.org>; Thu, 26 Feb 2026 07:19:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772119162; x=1772723962;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O0ezGVOcarv9ScNAFNBu6P5NdLNkz1RoEz4XxD5dNpA=;
        b=s2lMCVBPvytamrCI/oyzvSYYIvL+z8Gz4WtZ7d7T8DJZ2NuEb9c/dZcf8tC4dkalXB
         ksaPHH35KLO90CXnapIku6RBmKn6fQuTuMk78BJeSmKC7EVGZ4auRXRBJybV3Qq/vj03
         J07U3N+Q4w3/HWaLdZDhadKcLAIuojgVVpvD0kypId1DiH8GPOUrs0otbmDtRouQ8plF
         Jjk214AVTmkNyudNXIpnlIoUTyRXJSHzfh9VJkzIE3U1iGT/7Tw67HVssSP1fODM1ry3
         N26HLtn0ghTMS/jpkr9cm6/FyuDDrQ5Gx/95gTpAZEQF2DWRlAlSRZRKD3WI8cjAnBad
         HieQ==
X-Forwarded-Encrypted: i=1; AJvYcCU0I+kpzHUeoWCE0z5Qeh2OWD3aYJROvD6EshZiEgvswzXV6BDL4Xc3XpqFku4P1IduVIOX/0l4fwJSTUDl3A==@lists.infradead.org
X-Gm-Message-State: AOJu0YwHeVatOQsQDL0OJ41hdBHlNNIQ/o8PZ3EgvcrrWD0zxP9uR5ds
	w7CJn1S6B/zMIsFMWf51i5PPPB1I5q9QWn6NvfGfnQ0biP7pAdLI7UhO8DkYurS0
X-Gm-Gg: ATEYQzzDBS/16fVTEJmSs9dPPwAFm6V02LJht2R/I0c0mhJIRHP3w/tBkiMwqO7hzSU
	uS10Ds/Vbo1XHXBhss1c5a0kFxY887kjcGh/iF96IKTEOZeYydxfUp041KtaJK+aMMgUXTjccai
	hYwKtaP4KJUome02Ttn+oKNJro0cnZfKIWQkgcyxTKEhXbAI632Nm7dVgvn2Bd09hnqkZCBPXxf
	0JWIY9N6DlO2L5y79AKiY97BT1Y2qFtOA6j0okjNucslTULwVJjdCE7TsJVR6nB9tB3Zkx+PDyz
	DLIXA6nMqnLmAgSFuPxwQWqcCSWzKyGa5kPXR9QzoCCWsJOFrERFXtX3c4+WifJm1HBSb34SPhP
	HveNDueFeTMso8v4MWo9tHFsn0GvcwuokCZr2hzEYHpUkFDhMJQJJaTRL/hIESu5bMdhJf9u4ld
	JtDVqfnFAuKhx2VD4CFsuTwBl+wwhrYZdoJQXdjEyfhfUh8hVIYHjVpeeCYvcf
X-Received: by 2002:a05:690c:1d:b0:798:2720:a6d6 with SMTP id 00721157ae682-79876c57f7cmr23886707b3.19.1772119162204;
        Thu, 26 Feb 2026 07:19:22 -0800 (PST)
Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com. [74.125.224.49])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79876c537e1sm9634487b3.41.2026.02.26.07.19.21
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Feb 2026 07:19:21 -0800 (PST)
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-64ae222d87dso794824d50.2
        for <linux-mediatek@lists.infradead.org>; Thu, 26 Feb 2026 07:19:21 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV4JSRx6oRU9d4vItYYBBQ2HBjCAe7sXrhgJa92ok3ZVrIsKxEN9qrtReTEQwh2xjTvXoi7uNRt6r4ZQak+vQ==@lists.infradead.org
X-Received: by 2002:a05:6102:3a09:b0:5ef:6550:e9f0 with SMTP id
 ada2fe7eead31-5ff20c71950mr1513822137.36.1772118850413; Thu, 26 Feb 2026
 07:14:10 -0800 (PST)
MIME-Version: 1.0
References: <20260111093940.975359-1-vladimir.oltean@nxp.com>
 <20260111093940.975359-6-vladimir.oltean@nxp.com> <CAMuHMdUBaoYKNj52gn8DQeZFZ42Cvm6xT6fvo0-_twNv1k3Jhg@mail.gmail.com>
 <20260226151036.x4z4bdlxwgsqlkhs@skbuf>
In-Reply-To: <20260226151036.x4z4bdlxwgsqlkhs@skbuf>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 26 Feb 2026 16:13:59 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXKbiKUkP=+FDA_-Kd_qx1X6vzSuyPU+Tdd9MgR=Q5WMw@mail.gmail.com>
X-Gm-Features: AaiRm50hl5iFqVfPGnJ3OyUGaG2ytMnVkvc4q6N2_1XHwxz7HIPlFh5Oi8AcHkM
Message-ID: <CAMuHMdXKbiKUkP=+FDA_-Kd_qx1X6vzSuyPU+Tdd9MgR=Q5WMw@mail.gmail.com>
Subject: Re: [PATCH v3 net-next 05/10] phy: add phy_get_rx_polarity() and phy_get_tx_polarity()
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Daniel Golle <daniel@makrotopia.org>, Horatiu Vultur <horatiu.vultur@microchip.com>, 
	=?UTF-8?Q?Bj=C3=B8rn_Mork?= <bjorn@mork.no>, Andrew Lunn <andrew@lunn.ch>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Eric Woudstra <ericwouds@gmail.com>, =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>, 
	Lee Jones <lee@kernel.org>, Patrice Chotard <patrice.chotard@foss.st.com>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, 
	KUnit Development <kunit-dev@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_071923_781070_23806979 
X-CRM114-Status: GOOD (  30.66  )
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

Hi Vladimir,

On Thu, 26 Feb 2026 at 16:10, Vladimir Oltean <vladimir.oltean@nxp.com> wrote:
> On Thu, Feb 26, 2026 at 02:22:29PM +0100, Geert Uytterhoeven wrote:
> > > +config PHY_COMMON_PROPS
> > > +       bool
> > > +       help
> > > +         This parses properties common between generic PHYs and Ethernet PHYs.
> > > +
> > > +         Select this from consumer drivers to gain access to helpers for
> > > +         parsing properties from the
> > > +         Documentation/devicetree/bindings/phy/phy-common-props.yaml schema.
> > > +
> > > +config PHY_COMMON_PROPS_TEST
> > > +       tristate "KUnit tests for PHY common props" if !KUNIT_ALL_TESTS
> > > +       select PHY_COMMON_PROPS
> >
> > This select means that enabling KUNIT_ALL_TESTS also enables extra
> > functionality, which may not be desirable in a production system.
> > As PHY_COMMON_PROPS is bool, this extra functionality is even part of
> > the base kernel if KUNIT_ALL_TESTS=m.  Unfortunately PHY_COMMON_PROPS is
> > invisible, so this cannot just be changed from "select" to "depends on".
> > But perhaps PHY_COMMON_PROPS can be made visible if KUNIT_ALL_TESTS,
> > so the select can be turned into a dependency?
>
> Is this what you're asking for?
>
> -- >8 --
> diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
> index 02467dfd4fb0..1875d5b784f6 100644
> --- a/drivers/phy/Kconfig
> +++ b/drivers/phy/Kconfig
> @@ -6,7 +6,7 @@
>  menu "PHY Subsystem"
>
>  config PHY_COMMON_PROPS
> -       bool
> +       bool "PHY common properties" if KUNIT_ALL_TESTS
>         help
>           This parses properties common between generic PHYs and Ethernet PHYs.
>
> @@ -16,8 +16,7 @@ config PHY_COMMON_PROPS
>
>  config PHY_COMMON_PROPS_TEST
>         tristate "KUnit tests for PHY common props" if !KUNIT_ALL_TESTS
> -       select PHY_COMMON_PROPS
> -       depends on KUNIT
> +       depends on KUNIT && PHY_COMMON_PROPS
>         default KUNIT_ALL_TESTS
>         help
>           This builds KUnit tests for the PHY common property API.
> -- >8 --

Yes, that would work.  Do you think it is acceptable?
Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

