Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B74F7FCE079
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Feb 2026 13:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5twdPm6qtk6BxBBh6eqwsmb5sfIcorWjwwVPoxGI8zc=; b=YifJMmV5G93J5raD3IDoHNtc5O
	BB33HjoPSNAE2DMNrg8fEO4B6LBJXuLOIlejOvZOrU95yZmw1tvu9Eu45yBoyK0AO49YpoQ4sqCYC
	vPnb9pCPPVQW7Im9sGdtSCSyKn+2jFFNUxxlP/xK9xzosWIKQs89ptBld94T/LFhk/MtGg2vFZFP5
	8MZwAQzyS9XJTrT2avYDuE16GGLo4NyXgNk45itQ/AVWJE+k4HIk2DrNdRClcZAn5OmzFkiv1BujL
	fYxO7JTst0PyJpZSjTIlPINJDHbyDWIkMgPcNdRQZhIQ/527+RKI1P55eqnSd+xa4twFAMYn+8RPd
	SdCiC/cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvbSE-00000006E1X-3hFV;
	Thu, 26 Feb 2026 13:30:58 +0000
Received: from mail-qv1-f47.google.com ([209.85.219.47])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvbSC-00000006E19-2zr1
	for linux-mediatek@lists.infradead.org;
	Thu, 26 Feb 2026 13:30:57 +0000
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-89549b2f538so15471206d6.2
        for <linux-mediatek@lists.infradead.org>; Thu, 26 Feb 2026 05:30:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772112655; x=1772717455;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5twdPm6qtk6BxBBh6eqwsmb5sfIcorWjwwVPoxGI8zc=;
        b=vQjsHx7VhjjDpmuxELdjwZw30rg1G1UdtH+ydrxrin8CTMvWeK9uNzl40NcSJYEQ5g
         3z9/Mih79+KvhS0xyTApH5otwedRHz1bYJ/5lrm77zU0ieAi6LAw37OVoSjid25Ek72r
         WF4HE5oaT2yISvu3ILqG+GDKRvqTywFkszCCcNmCc0PgBLn1v05n2gRP9qHI3VZOm7l6
         zPonW7dhFuwiR81n6z5MabfvWeXKuZW88eoDBLyADz3mltn95hIUfJCK7a41LaMRwvP+
         jNMFSzMv7aFuOrBsqlGttj14pUIt0VzzNhANAXZU71mjpwjTMCM0K+O0Lg/JMlfljod7
         nJzQ==
X-Forwarded-Encrypted: i=1; AJvYcCVuZ0zitzihD9uz57UP7jS6SnrZrCGt2iJ1nouBgl/Aw18Wto71kqzZEo39hECOTVzwvobFv4Uu6ny0VC5IBA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyWmAUW6OtwfyJPnHPbtwiqwTPJA7fiT+uf7z1vjWN30UBZ5QeJ
	sCdL/8CFG/JnpBNYGfjAV7ijUy6rrY7ETR9JNprDqFPtGyF0LO6fg2jVKCiKArzT
X-Gm-Gg: ATEYQzxa0lA/lrS92qA7Q9caBtUHG5jrhOGFcRNnB+7pQBgT3uUYBYAmOj1ECtpDATN
	pnU9aljc8FkM96T1qNf98IzQ2Xx/Rbad+nXL1ogAHG92NTdWY0laxPCSf9p48wF/TSuk2bzBRPf
	Ah9gkWkISlsXpqWr3gFy3krU142yWbq7WvzI4TRJQhFIRB42Gkc6q6lj11NWQ85IroJjkXnZNW8
	ALPLHswI6chvPcJaDcUlCr+B7YmQITYRN/oDwHo/r+92B4EQWMik1zrs4cCZ1sh5pbJJ4Qepb4/
	eTHYrYV77Zw16cQUg1LpFo98KSEJhx7/SDtUY38xRvmoKKMzAbrfsX8xa2e4EyyTEKdqZrkGEul
	/tGPJMvV/w83ILBtIX+pZ3Xq4x6ge/lGoQ/VtfHC07cZOkNSdGKZE6J1vdEf/ikgXLyo3wWxr3u
	vFU6kWcNdM9xZAP0NTh74TzVbOEzj3E38vCn7nPpjkTEp+CMA71lcJZK0alGLp/LIv
X-Received: by 2002:ad4:5765:0:b0:897:1ff:a6c with SMTP id 6a1803df08f44-899c13b90a6mr59038076d6.10.1772112654766;
        Thu, 26 Feb 2026 05:30:54 -0800 (PST)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com. [209.85.222.181])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cbbf6f6950sm204004685a.27.2026.02.26.05.30.54
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Feb 2026 05:30:54 -0800 (PST)
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-8cb4136d865so100667285a.1
        for <linux-mediatek@lists.infradead.org>; Thu, 26 Feb 2026 05:30:54 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXS2Meb3056tlWV/x2P/npxSMmKG3LXrLuIxHyuWKFoV7zFiF1YI1oUWXuPRXtWkJkgFTfwE7lIjkAvY0ifUg==@lists.infradead.org
X-Received: by 2002:a05:6102:ccf:b0:5fd:ed98:cf0f with SMTP id
 ada2fe7eead31-5ff14157fafmr2006779137.34.1772112160689; Thu, 26 Feb 2026
 05:22:40 -0800 (PST)
MIME-Version: 1.0
References: <20260111093940.975359-1-vladimir.oltean@nxp.com> <20260111093940.975359-6-vladimir.oltean@nxp.com>
In-Reply-To: <20260111093940.975359-6-vladimir.oltean@nxp.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 26 Feb 2026 14:22:29 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUBaoYKNj52gn8DQeZFZ42Cvm6xT6fvo0-_twNv1k3Jhg@mail.gmail.com>
X-Gm-Features: AaiRm523jRWdOCfOPJhqksDewbEoHD_GTMJ0xjyZsvboq3n-XWtXIhj4iGm1B4M
Message-ID: <CAMuHMdUBaoYKNj52gn8DQeZFZ42Cvm6xT6fvo0-_twNv1k3Jhg@mail.gmail.com>
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
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_053056_758070_F254ADA1 
X-CRM114-Status: GOOD (  29.26  )
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

CC kunit

On Sun, 11 Jan 2026 at 10:44, Vladimir Oltean <vladimir.oltean@nxp.com> wro=
te:
> Add helpers in the generic PHY folder which can be used using 'select
> GENERIC_PHY_COMMON_PROPS' from Kconfig, without otherwise needing to
> enable GENERIC_PHY.
>
> These helpers need to deal with the slight messiness of the fact that
> the polarity properties are arrays per protocol, and with the fact that
> there is no default value mandated by the standard properties, all
> default values depend on driver and protocol (PHY_POL_NORMAL may be a
> good default for SGMII, whereas PHY_POL_AUTO may be a good default for
> PCIe).
>
> Push the supported mask of polarities to these helpers, to simplify
> drivers such that they don't need to validate what's in the device tree
> (or other firmware description).
>
> Add a KUnit test suite to make sure that the API produces the expected
> results. The fact that we use fwnode structures means we can validate
> with software nodes, and as opposed to the device_property API, we can
> bypass the need to have a device structure.
>
> Co-developed-by: Bj=C3=B8rn Mork <bjorn@mork.no>
> Signed-off-by: Bj=C3=B8rn Mork <bjorn@mork.no>
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>

Thanks for your patch, which is now commit e7556b59ba651796
("phy: add phy_get_rx_polarity() and phy_get_tx_polarity()") in
v7.0-rc1.

> --- a/drivers/phy/Kconfig
> +++ b/drivers/phy/Kconfig
> @@ -5,6 +5,28 @@
>
>  menu "PHY Subsystem"
>
> +config PHY_COMMON_PROPS
> +       bool
> +       help
> +         This parses properties common between generic PHYs and Ethernet=
 PHYs.
> +
> +         Select this from consumer drivers to gain access to helpers for
> +         parsing properties from the
> +         Documentation/devicetree/bindings/phy/phy-common-props.yaml sch=
ema.
> +
> +config PHY_COMMON_PROPS_TEST
> +       tristate "KUnit tests for PHY common props" if !KUNIT_ALL_TESTS
> +       select PHY_COMMON_PROPS

This select means that enabling KUNIT_ALL_TESTS also enables extra
functionality, which may not be desirable in a production system.
As PHY_COMMON_PROPS is bool, this extra functionality is even part of
the base kernel if KUNIT_ALL_TESTS=3Dm.  Unfortunately PHY_COMMON_PROPS is
invisible, so this cannot just be changed from "select" to "depends on".
But perhaps PHY_COMMON_PROPS can be made visible if KUNIT_ALL_TESTS,
so the select can be turned into a dependency?

> +       depends on KUNIT
> +       default KUNIT_ALL_TESTS
> +       help
> +         This builds KUnit tests for the PHY common property API.
> +
> +         For more information on KUnit and unit tests in general,
> +         please refer to the KUnit documentation in Documentation/dev-to=
ols/kunit/.
> +
> +         When in doubt, say N.
> +
>  config GENERIC_PHY
>         bool "PHY Core"
>         help

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

