Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8665C48BC1
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Feb 2024 15:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h6upARWbXs1k8V4Vnc/YI44n6rxziwjW/OPtXVVY76s=; b=3mg/IsM3Bmg/X64pi+sykkBisY
	xSMGm9ZCUeZA064337h52Qi5zP/1jzZLucVMaI/hVbo2TGYS2wfunypXkXQtiOL9B/1+3ARuAxoDL
	W8zPXmEowHLzxQAaKFVyCzBrcOHN/MRgM3L0vbvWflutyp6qnJe1PMcOobyhK5L+3WnWplQ+jAocM
	zdOYAnhQcmjgE03sukwZajkou8+USxyjMzcRgkfVVoDBMPsQkPjm0X0pAsafWfheLjHP7ggAAo+Ji
	NZYv2zIO+0GSAXFMokoQxoJqbNYiWl3SStG9++Fv3+TQBML3WTmlVkJDhuPmUiUVb18D3lnWWkthb
	vTB9QSqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raGlT-0000000DEuL-0j3o;
	Wed, 14 Feb 2024 15:01:35 +0000
Received: from mail-oa1-f48.google.com ([209.85.160.48])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raGlI-0000000DEn8-3jYh;
	Wed, 14 Feb 2024 15:01:30 +0000
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-21a9bd0859cso645865fac.0;
        Wed, 14 Feb 2024 07:01:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707922881; x=1708527681;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h6upARWbXs1k8V4Vnc/YI44n6rxziwjW/OPtXVVY76s=;
        b=uCSj1GCe/bNZrYAsjGHavCT4yj6PpGZuqH2LNSDJzpBGxj2VDmu0hMcNXNLmTgO86V
         uKPcJMdBKhHtcXsBAkijM/iqrgenbmBbdRQe09UEVzuJBf5QL5mezXYOqIdAaciXftUx
         EBpvOUklGX800cOPYIfMQWrcaI3b1qyRcxRnR76cfP5CpAgEF0idfJL6Lm90qQ4eewwe
         f7Qf6bBiagRjmQnaQbKwZJNMKgEsPqPldP2ckgMdK7M+5lGgtuz4WYDjCJxK6c36Wpi8
         gL2A4ZNCYSOhTUneT3mCiSy6hWs4SNiGVu7HvC/nWTlsgejvfXsjr+UELAxWUlW/BNgT
         II+Q==
X-Forwarded-Encrypted: i=1; AJvYcCVBS0Cx2PKR5WTjEvLVylzPOIWOHdeBuNdbE49gZpgiNisUF31ar83R/ogV4jSWZK3Zc8Wdnl3wSi/Na+UbtoAqFaCWSbSwEmaeZhKilxPiltAwsnII+t578JO1c99SLzUALu/e/JUGsIa9LBSO2nwmqbgdCJIlovk=
X-Gm-Message-State: AOJu0YwudXQyt/4sHW/DaZxM+Dz0IU7peeqYbKis0GYncV4hQACFHQUH
	U0YfyF6giCPCCqfdh5KL63bKL9dkNq+ReTE13I2C7vjdL5i1PMW6caH7CFoVGBM=
X-Google-Smtp-Source: AGHT+IFSaUNALEWlou7k5aaJR4Jt3P2cz+2w2XFEjPmUv0STTtMprFmO/vE6WlJoAaRGdfEjpBgMrw==
X-Received: by 2002:a05:6870:a7a0:b0:21a:21a4:6f34 with SMTP id x32-20020a056870a7a000b0021a21a46f34mr2780977oao.8.1707922878449;
        Wed, 14 Feb 2024 07:01:18 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWwJH/MgqYuqhYCP12vTNb/asfeEz1LdbwsZxV1E7duNp8kVWITuUgCBkdD9gp6rxbbN4pnCYsUU9JyPsg9yZl49lzwCBdPYtKKhHUNtJ+jrjLJ0D3Yu5cnQN5XqDxCoJwR301q+CFP7gy7K4N4y5MLf8Fg5DRrNhw=
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com. [209.85.210.44])
        by smtp.gmail.com with ESMTPSA id lf7-20020a0568700c4700b00219c95d6036sm2328448oab.28.2024.02.14.07.01.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Feb 2024 07:01:18 -0800 (PST)
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-6e2f990c8b5so647966a34.1;
        Wed, 14 Feb 2024 07:01:17 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWxbQ5uTp63czaJoZVNc4+v5+eFF5J2WbqyEgz4dXPC8gJQKQQArZ42WqhmeBSbgSxIyn9i9jZFgcNY2FqnxUt5/QZKG+g0M5vG7Y/Gw0nMHrzFaf/brYh2AEMHZzkJqKbGBQhHuNJQbqZIV6FjKoBRDeZQfoo8v4g=
X-Received: by 2002:a25:84c9:0:b0:dc2:3fbd:82fe with SMTP id
 x9-20020a2584c9000000b00dc23fbd82femr2322270ybm.46.1707922857034; Wed, 14 Feb
 2024 07:00:57 -0800 (PST)
MIME-Version: 1.0
References: <20240213-arm-dt-cleanups-v1-0-f2dee1292525@kernel.org>
In-Reply-To: <20240213-arm-dt-cleanups-v1-0-f2dee1292525@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 14 Feb 2024 16:00:45 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWgvD9szXksK+jzyvwLQ8ufWWf1TPQ7s-5z4JWgrvXmkg@mail.gmail.com>
Message-ID: <CAMuHMdWgvD9szXksK+jzyvwLQ8ufWWf1TPQ7s-5z4JWgrvXmkg@mail.gmail.com>
Subject: Re: [PATCH 0/6] dts: Fix dtc interrupt warnings
To: Rob Herring <robh@kernel.org>
Cc: soc@kernel.org, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Tsahee Zidenberg <tsahee@annapurnalabs.com>, Antoine Tenart <atenart@kernel.org>, 
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Andrew Lunn <andrew@lunn.ch>, 
	Gregory Clement <gregory.clement@bootlin.com>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
	=?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Stefan Agner <stefan@agner.ch>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, =?UTF-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>, 
	Tony Lindgren <tony@atomide.com>, Chanho Min <chanho.min@lge.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Magnus Damm <magnus.damm@gmail.com>, Linus Walleij <linusw@kernel.org>, 
	Imre Kaloz <kaloz@openwrt.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-aspeed@lists.ozlabs.org, 
	openbmc@lists.ozlabs.org, linux-tegra@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-omap@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240214_070125_038521_F0AC9118 
X-CRM114-Status: GOOD (  17.74  )
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

Hi Rob,

On Tue, Feb 13, 2024 at 8:35=E2=80=AFPM Rob Herring <robh@kernel.org> wrote=
:
> I had a branch with most of these changes sitting in my tree for some
> time. Geert's asking about some errors not getting found prompted me to
> clean it up and send it out. This series fixes all* interrupt related
> warnings and enables the check by default.

> *There's a few Renesas warnings still Geert said he would fix.

Thanks, fix sent
https://lore.kernel.org/r/a351e503ea97fb1af68395843f513925ff1bdf26.17079224=
60.git.geert+renesas@glider.be

>       dtc: Enable dtc interrupt_provider check

>  scripts/Makefile.lib                                  |  3 +--

Just wondering, can the remaining disabler be removed, too?

Documentation/devicetree/bindings/Makefile:     -Wno-interrupt_provider \

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

