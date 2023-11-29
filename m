Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BCB9C07E97
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Nov 2023 08:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mLerLul424y9KF+UL/6zr3ivEhD1RgHSR/3xjytvLS8=; b=przx0nu49XTBp86VlFG7n/2UvK
	zKqWkVzWgAQRkRon9KCXFOs4Vz7B299SJtZz0dKfwshWkTq/CuDbiV2c5n+zHkxEkCSzRFd+/ZX5a
	OIbl0GUv7grxMzIEdrvgU3rGhs8PrpkhEugaE6X0EMwn7pRRmZoTWZj1dRvGGQ0n8wyqAmAwi1Iyn
	W59xm2r0ziKo7n8WiYF+L246pdewy8CeFWju8+9K/03MaXorCingBQgOVdscXqLChrMJW7QCher54
	DHrx/X2BPfQHYJf5VU3Mk/98Hp/Kl1VZTy5w0Mk0LxVfEVCsOIPYnoSYE/h0kXGKKDvXPHYpvC5yn
	dIkmB5jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8GEi-007WMW-29;
	Wed, 29 Nov 2023 08:48:00 +0000
Received: from mail-yb1-f170.google.com ([209.85.219.170])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8GEf-007WLX-0u;
	Wed, 29 Nov 2023 08:47:58 +0000
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-db49ab94768so3541010276.2;
        Wed, 29 Nov 2023 00:47:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701247675; x=1701852475;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mLerLul424y9KF+UL/6zr3ivEhD1RgHSR/3xjytvLS8=;
        b=YlTwkseC+ErGqKC+70PPJ0NOeVh68NzCW/47ZwuYNJQ7m/TqXgEg0vJy96T00FYu+5
         TL5UnBaKSI7PV9x9t/siFq4ZK1Pe78aEwOnMXuBsaPlwolSfd3HFCj1GTflAHyaP9o1j
         lZN0cg2Ll0xYgPp8udzYob8G/Y6kdDqoSCrgu5bqWuMhQPEO2C86857QyZJIGysoE/oY
         IzAeihEk7Z9v4vrbHc69Y8VzS7gRNqO+NDIHokJRXL7x8/vGXSXgJiCkVz9qf/GZm1iY
         5Kyf0/fzB6yCcNodtsavYEEYVoAn7FI1pkbRT8ZQLxCzqiT+SCQSKvFL1AYAW6d5SiPm
         gJIg==
X-Gm-Message-State: AOJu0YwWvX9vJm7jXO3FepECfKjU3o9tNFlNmLGkZvcfeQxYsfzg9zhi
	ZWJXSzW8mmY87tgTvvmbAQWLjMZsQgHpvg==
X-Google-Smtp-Source: AGHT+IHQbh2MXWmQFsE80rDz7IplsF+cRL4zHkgLE7MUjILC4McTBQcuwDU/ogQreY/evE8BO2f5Wg==
X-Received: by 2002:a25:d54:0:b0:daf:11cd:d54a with SMTP id 81-20020a250d54000000b00daf11cdd54amr16402099ybn.36.1701247674801;
        Wed, 29 Nov 2023 00:47:54 -0800 (PST)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com. [209.85.219.182])
        by smtp.gmail.com with ESMTPSA id n1-20020a254001000000b00d9a577d8434sm4096461yba.53.2023.11.29.00.47.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Nov 2023 00:47:54 -0800 (PST)
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-dae0ab8ac3eso5797200276.0;
        Wed, 29 Nov 2023 00:47:54 -0800 (PST)
X-Received: by 2002:a25:3d1:0:b0:db4:47e1:407d with SMTP id
 200-20020a2503d1000000b00db447e1407dmr16074846ybd.60.1701247673674; Wed, 29
 Nov 2023 00:47:53 -0800 (PST)
MIME-Version: 1.0
References: <20231125184422.12315-1-krzysztof.kozlowski@linaro.org> <ZWboWqELHbIrblnz@francesco-nb.int.toradex.com>
In-Reply-To: <ZWboWqELHbIrblnz@francesco-nb.int.toradex.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 29 Nov 2023 09:47:42 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVSAgihFAuPecyrR+Wvzqr58z_fkWkShOSu+HnHzZnW2g@mail.gmail.com>
Message-ID: <CAMuHMdVSAgihFAuPecyrR+Wvzqr58z_fkWkShOSu+HnHzZnW2g@mail.gmail.com>
Subject: Re: [PATCH v3] docs: dt-bindings: add DTS Coding Style document
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, Andrew Davis <afd@ti.com>, 
	Andrew Lunn <andrew@lunn.ch>, Arnd Bergmann <arnd@arndb.de>, Bjorn Andersson <andersson@kernel.org>, 
	Chen-Yu Tsai <wens@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Heiko Stuebner <heiko@sntech.de>, Jonathan Corbet <corbet@lwn.net>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Michal Simek <michal.simek@amd.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Nishanth Menon <nm@ti.com>, Olof Johansson <olof@lixom.net>, 
	=?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, 
	linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	workflows@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231129_004757_323339_47261C48 
X-CRM114-Status: GOOD (  29.71  )
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

Hi Francesco,

On Wed, Nov 29, 2023 at 8:29=E2=80=AFAM Francesco Dolcini <francesco@dolcin=
i.it> wrote:
> On Sat, Nov 25, 2023 at 07:44:22PM +0100, Krzysztof Kozlowski wrote:
> > Document preferred coding style for Devicetree sources (DTS and DTSI),
> > to bring consistency among all (sub)architectures and ease in reviews.
>
> Thank Krzysztof, we had most of this collected as BKM in some internal
> documents and it's great to see the effort to consolidate this and add
> it to the kernel documentation.
>
> > ---
> > +Following order of properties in device nodes is preferred:
> > +
> > +1. compatible
> > +2. reg
> > +3. ranges
> > +4. Standard/common properties (defined by common bindings, e.g. withou=
t
> > +   vendor-prefixes)
> > +5. Vendor-specific properties
> > +6. status (if applicable)
> > +7. Child nodes, where each node is preceded with a blank line
>
> On point 4, do you have a more explicit way to define what is an actual
> standard/common property? You mention the vendor-prefixes as an example,
> is this just an example or this is the whole definition?

I think there are three classes of standard properties:
  1. Device Tree Specification (from devicetree.org)
  2. dt-schema
  3. Common subsystem bindings (Documentation/devicetree/bindings/)
     (may be moved to 2).

> What would be the order for this for example (from an existing DTS file)?
>
>         reg_sdhc1_vmmc: regulator-sdhci1 {
>                 compatible =3D "regulator-fixed";
>                 pinctrl-names =3D "default";
>                 pinctrl-0 =3D <&pinctrl_sd1_pwr_en>;
>                 enable-active-high;
>                 gpio =3D <&main_gpio0 29 GPIO_ACTIVE_HIGH>;
>                 off-on-delay-us =3D <100000>;
>                 regulator-max-microvolt =3D <3300000>;
>                 regulator-min-microvolt =3D <3300000>;
>                 regulator-name =3D "+V3.3_SD";
>                 startup-delay-us =3D <2000>;
>         };
>
> I guess the point that is not obvious to me here is where do we want
> pinctrl. I like it at position between 3 and 4, the rationale is that is
> a very frequent property and this way it will be in a similar place for
> every node.

The pinctrl properties are only present in board DTS files, not in
SoC DTSi files.  There are two classes of them:
  1. Extension of on-SoC devices, where they are added to already
     existing nodes, defined in the SoC DTSi files, e.g. (from the same
     existing DTS file):

         &cpsw3g {
                 pinctrl-names =3D "default";
                 pinctrl-0 =3D <&pinctrl_rgmii1>;
                 status =3D "disabled";
         };

  2. Pure board devices, in new nodes (e.g. your regulator example).
     These are less common, so I don't even know from the top of my
     mind when I last added one, and where ;-)
     I'd guess after all standard properties?

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

