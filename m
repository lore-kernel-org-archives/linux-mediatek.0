Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D4BDC36010
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Apr 2025 17:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rdLI4xLdMKIk5+aH2ShC4YXmxar43nmBcEhmGz0osts=; b=YpbTYvIgg/qUE8y8VuO2xijCRt
	pUtZWRRWX3cbqVbUoYLaXrCBBQq+4m0uw5dNaYsQHfIkI8rleFa00kCIVSRJn/zhSoQSt+8NrUoub
	kM3jZ54IbaqsrAlKjMek0Bj1OdJLuQc29XMirJCGj+eZZ7xQO8AeZ18Ryp3cght/XpopxrHBnkG1H
	b2aXhHHkalSAqM3144T6gr5a19z+/gqwpKaX/UbCwPAV4fMuODeQUcmKSJBVXIB0uJ6jQPUH5WLa9
	ZMiqGASXWhfQ4/XS18JcyW8glWDcROOckq5mTJNQgSsWG3C+fMA0I6bctam3CpdmF0eqbDI5VkrU7
	yFAaMpcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1q5u-00000001LTb-2oa9;
	Mon, 07 Apr 2025 17:17:10 +0000
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1pG7-000000019sq-3sZi
	for linux-mediatek@lists.infradead.org;
	Mon, 07 Apr 2025 16:23:41 +0000
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-6f7031ea11cso50836737b3.2
        for <linux-mediatek@lists.infradead.org>; Mon, 07 Apr 2025 09:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744043019; x=1744647819; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rdLI4xLdMKIk5+aH2ShC4YXmxar43nmBcEhmGz0osts=;
        b=I46ZxQYWm7syWJ9hda5WY63ox+9SU4VY7aCXCHCHW52T3n0PlEr2axhRPWLZBXmOOo
         iWgEyt4xfnYN196njxG9x6wuLH2ZT1j5sWduhERYJwHXTamCKo9kskLbgcYiWUEnq5lX
         y4abDzMKwRg/T63koFPeT/4pylQ1NYTBfp+2thqgt7eUIFNXlBaW/oOBWZUrD2eaCbfl
         P+JFZNuEuST10vYD0a3IY8eNhhHZHo6BPN5UWoSpqnrXo2PLGhbk2Q3WDUAigOE9voZw
         +97i3oHsmCww1j51R5Fk3bLH6lBTFpEnoDbu/V2CbW6MGJH59qtFT4eqdFj8TaJays4w
         nHUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744043019; x=1744647819;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rdLI4xLdMKIk5+aH2ShC4YXmxar43nmBcEhmGz0osts=;
        b=sXigAYICWOMLuHgn534Dzx0IQf3/oFrl9OGDFhPOjRpo4RHHNVoS0z4dG8RiG4Gx7h
         He2IuLqSEnSedXMTjG0BELH3CW7IKA1n4Mc2rJ2UTyZpxc4lhXsrWhi5y/BrKyHRYR98
         EVTjcgG3rPQYHUkqe72u1CcgdYiWaboDFbxsI1tymvVP4p8rKSs1X3s46aGALeG7o5l1
         OlaTdTJwGQwbVc8a1N7EhHlpE/mMF5cihmKWoPwj1DVtLIczk+GBOiCgNdcMtl+93KHY
         n4FzPTwn6eieadDmJymAJnAamh/z777BeVd1JhrKTcdEbgSd0fTyt2vJS5wKXYG3ClPL
         JlVg==
X-Forwarded-Encrypted: i=1; AJvYcCUI4D+zqPNin+2ZcXzH9NA+6BPmrs0czBs9RwGVD2gF2J126q+kIV4cWh773wl88eqJ+hvyHk2RIlHRlKSM3A==@lists.infradead.org
X-Gm-Message-State: AOJu0YxtDQEjeUP6mY8Ap1uLBJP48H8Kbl6tmqLSOM2XHs8/upVp2skO
	9ITODRC7YY8fMuEncFlId+yjLPXEw+ERdPXo4YNNBINf/uFJM9B+UXEXRvtIW0mtvJ5tHHW+TMR
	XpzCOnryoRyq2X/a1GtCrOqdS7HZWyMcOGM39zA==
X-Gm-Gg: ASbGncsDS+5PA4f8X/DV/aXrihBeDgIzN9qazg/ka8KpnAvLNwrGwJuEG9cRvmvOvtD
	p5AcGlskIWsrim/eKQuo0rV3G4p2WUydJ3XWW91/kDDpEoCG2b/NDo+2P7jct/LPHndbdKOKuRt
	TPWlBFgRQJnnyx9DGeQr/s7/9C8MM=
X-Google-Smtp-Source: AGHT+IEvCyoULSP8GtunUj7XByE2xLEZApny/EX5BI9r2HNnS7M/lF2l9CVPZCF8J2YyYgCczjPfSOPcnUbnSfgNgFc=
X-Received: by 2002:a05:690c:6481:b0:702:627c:94ec with SMTP id
 00721157ae682-703e3357786mr243332367b3.35.1744043018812; Mon, 07 Apr 2025
 09:23:38 -0700 (PDT)
MIME-Version: 1.0
References: <20250403-dt-cpu-schema-v1-0-076be7171a85@kernel.org>
 <20250403-dt-cpu-schema-v1-18-076be7171a85@kernel.org> <CAPDyKFrFRrPVJ_t0JrAE1VTbS02hwr=L-EHtqb7CQiWzB1MnQg@mail.gmail.com>
 <CAL_JsqKygxhcQ=PZW84sfiW7BVXKF839vfNyxS9GwAXuqmN=8g@mail.gmail.com>
In-Reply-To: <CAL_JsqKygxhcQ=PZW84sfiW7BVXKF839vfNyxS9GwAXuqmN=8g@mail.gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 7 Apr 2025 18:23:02 +0200
X-Gm-Features: ATxdqUG4iYRDoX1uSepWjxp_lc67AACZn0NdIUwL4_627lSdYio0uG7PYHZfOMA
Message-ID: <CAPDyKFoHQdHED0hHUR7VKin0XG6SVnYXuvPjB=Xe+1o2hpiPJA@mail.gmail.com>
Subject: Re: [PATCH 18/19] dt-bindings: arm/cpus: Add power-domains constraints
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Viresh Kumar <viresh.kumar@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
	Sudeep Holla <sudeep.holla@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Viresh Kumar <vireshk@kernel.org>, 
	Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>, zhouyanjie@wanyeetech.com, 
	Conor Dooley <conor@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Claudiu Beznea <claudiu.beznea@tuxon.dev>, Steen Hegelund <Steen.Hegelund@microchip.com>, 
	Daniel Machon <daniel.machon@microchip.com>, UNGLinuxDriver@microchip.com, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Heiko Stuebner <heiko@sntech.de>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-mips@vger.kernel.org, 
	imx@lists.linux.dev, linux-rockchip@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_092339_960101_D830F730 
X-CRM114-Status: GOOD (  17.86  )
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

On Fri, 4 Apr 2025 at 15:09, Rob Herring <robh@kernel.org> wrote:
>
> On Fri, Apr 4, 2025 at 5:37=E2=80=AFAM Ulf Hansson <ulf.hansson@linaro.or=
g> wrote:
> >
> > On Fri, 4 Apr 2025 at 05:06, Rob Herring (Arm) <robh@kernel.org> wrote:
> > >
> > > The "power-domains" and "power-domains-names" properties are missing =
any
> > > constraints. Add the constraints and drop the generic descriptions.
> > >
> > > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> > > ---
> > >  Documentation/devicetree/bindings/arm/cpus.yaml | 8 ++------
> > >  1 file changed, 2 insertions(+), 6 deletions(-)
> > >
> > > diff --git a/Documentation/devicetree/bindings/arm/cpus.yaml b/Docume=
ntation/devicetree/bindings/arm/cpus.yaml
> > > index 6f74ebfd38df..5bd5822db8af 100644
> > > --- a/Documentation/devicetree/bindings/arm/cpus.yaml
> > > +++ b/Documentation/devicetree/bindings/arm/cpus.yaml
> > > @@ -313,19 +313,15 @@ properties:
> > >      maxItems: 1
> > >
> > >    power-domains:
> > > -    description:
> > > -      List of phandles and PM domain specifiers, as defined by bindi=
ngs of the
> > > -      PM domain provider (see also ../power_domain.txt).
> > > +    maxItems: 1
> >
> > There are more than one in some cases. The most is probably three, I th=
ink.
>
> Unless I missed it, testing says otherwise. What would the names be if
> more than 1 entry?

"psci", "perf", "cpr", etc

The "psci" is always for CPU power management, the other is for CPU
performance scaling (which may be more than one power-domain in some
cases).

I would suggest changing this to "maxItems: 3". That should be
sufficient I think.

Kind regards
Uffe

