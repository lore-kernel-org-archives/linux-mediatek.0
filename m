Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27E55C48BC1
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Feb 2024 14:36:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ieRFgVX+l5qNLg5VWXa9Hrv9zNfV92pS7+FucPfjsp8=; b=4qQHbv37YjoV3+b3AsYOGq9ahJ
	cGbX1uAzflBSEgNdzmzU+7eMSx9ZRtBFC8QJ1kSiHEKnuZANi3iHvMY6NuaPr12+zQVBRO9dp4/NY
	7vUGpNPcUmueuao26ta/hU29iAg207lnEiNQrou8nkxaX1mkVrklg2QraGLE0irPPoB3bwl7aPOhK
	B1daxgjOFiZxI9KHSALliDtx3hc+wCGAxcp9HEVitpkyE+QwrikDi9NgRWBzUW3JascIQHVnlBSKT
	uyyyuwj5X4c6XzVR5smn4fJhwpOkbI/4DbMQZuvhxIvzyFJp4lcHjKl0DceyRXIkR+O4rElfu3UOP
	P0utngLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raGNO-0000000DBV2-2DDG;
	Wed, 14 Feb 2024 14:36:42 +0000
Received: from mail-pl1-f181.google.com ([209.85.214.181])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raGNJ-0000000DBSm-46VO;
	Wed, 14 Feb 2024 14:36:39 +0000
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1d911c2103aso28655725ad.0;
        Wed, 14 Feb 2024 06:36:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707921396; x=1708526196;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ieRFgVX+l5qNLg5VWXa9Hrv9zNfV92pS7+FucPfjsp8=;
        b=KaXwuuPuxN7C+22JpvS5MU97VsPLNpnUtWTbWozkKcls1KCXbqkpN0bG4yoXUqB/Lj
         YDfi+S6n4yCwZgRm/0sZXGjX4srZ3F3wtcDGbufanG88NBGTpFRf277unIKJVEPPl3Tm
         TZr4EE2D5b9/tYTVFGLme4VjETx62PKIWGUg8KO1uelfaAOu1QQHG2va1Aj570a+jEBl
         NF+ob49Y2w8pkinCILC9KSbJhIJGLi42U0VZAFQJxC4Hgd3+dcTof+C1whnFOUThrwuA
         OCajVse3f4INHII27wwKB9iBR9YvES37+9uFRdmxSJITDZy7nH9XJGAoqlMvQm+ZMwVZ
         z36g==
X-Forwarded-Encrypted: i=1; AJvYcCWA4tVzJYH7wenfMbIAkwj+MZ4K3wb5x1lan0ra+uYxUaijJbmGtDmGFl2ABGvakxlPWMV4tHt2KQNyERb1a7b2QLHBZqzoyn/4RfjxMaBl8K1wQvLrzwmzOCOBhe6Vpr50lpVqSllmLI/LH3jMAGvjVdxIcyqQ054=
X-Gm-Message-State: AOJu0Yw+l8pWRhqswSfNKdaZu3eWkIEMMxqRVL4n8sIwwL3QUxzVb/Cz
	+IXJaW8OzqLIhrLlTVR2bsRXXHmhW7eqwOVrLZ7lVfT3pd6O5Xg9l5NxlH6aGUY=
X-Google-Smtp-Source: AGHT+IGpBFkTP3Wvq0WX3CRrnaUu9wSyPXjQ8CLwSdMCihf3zqzKuGFFnr3MECehPvMZeI3bG/RmOA==
X-Received: by 2002:a17:902:be0b:b0:1d9:9921:504a with SMTP id r11-20020a170902be0b00b001d99921504amr2785190pls.33.1707921395859;
        Wed, 14 Feb 2024 06:36:35 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXujOTizV15/yV2MptBFTW9VFqPIadPocnizmBck5aMgw99eVklcbXFXB32UMe0HG7+tIB16Q7DjMo+FrHVUvJPecJcijdsHed1C/ELJ34GVSb/PLdRsGGPptFRG9sa+111kklC9zpRzffrAVit+e+XNbGJ9lBHnxM=
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com. [209.85.210.169])
        by smtp.gmail.com with ESMTPSA id jv3-20020a170903058300b001db339f409bsm3049441plb.289.2024.02.14.06.36.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Feb 2024 06:36:35 -0800 (PST)
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-6e0eacc5078so1960998b3a.0;
        Wed, 14 Feb 2024 06:36:35 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXbpn4HXdF+5vQZd/NubRdk5nr8tk2Cikd3oEFo4cDJqATfH6PE4HM61uHaGO4RZ+sdyy1hMA+z/KcLZN7HYe+B+UFmTZoWJ1o7RucjVrkHFYSfUuj5clRzRawKfJrto3uijSo72Lycm9Us7U1/ov7LNGO/7/1Vx6E=
X-Received: by 2002:a25:8686:0:b0:dc7:4546:d107 with SMTP id
 z6-20020a258686000000b00dc74546d107mr2758581ybk.23.1707921374648; Wed, 14 Feb
 2024 06:36:14 -0800 (PST)
MIME-Version: 1.0
References: <20240213-arm-dt-cleanups-v1-0-f2dee1292525@kernel.org> <20240213-arm-dt-cleanups-v1-3-f2dee1292525@kernel.org>
In-Reply-To: <20240213-arm-dt-cleanups-v1-3-f2dee1292525@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 14 Feb 2024 15:36:03 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXjJcsFiusnBQmJg1p-oy-NPmr+qyt0znOk0n+wL8TrnA@mail.gmail.com>
Message-ID: <CAMuHMdXjJcsFiusnBQmJg1p-oy-NPmr+qyt0znOk0n+wL8TrnA@mail.gmail.com>
Subject: Re: [PATCH 3/6] arm64: dts: Fix dtc interrupt_provider warnings
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
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Linus Walleij <linusw@kernel.org>, Imre Kaloz <kaloz@openwrt.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, 
	linux-tegra@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-omap@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240214_063638_051290_C7680C23 
X-CRM114-Status: GOOD (  15.66  )
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

On Tue, Feb 13, 2024 at 8:35=E2=80=AFPM Rob Herring <robh@kernel.org> wrote=
:
> The dtc interrupt_provider warning is off by default. Fix all the warning=
s
> so it can be enabled.
>
> Signed-off-by: Rob Herring <robh@kernel.org>

>  arch/arm64/boot/dts/renesas/ulcb-kf.dtsi            | 4 ++++

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>

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

