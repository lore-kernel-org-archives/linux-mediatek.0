Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E78CCC36010
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Apr 2025 16:27:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6Tv18wJw5aVLdmgs3C9q9T0ZCDpqJmf243MJA8d/CSA=; b=AuiKAH8+kQulHq0hO+jcZFfMZ/
	3bgjlgr3LY0Yy1qj3NgoXc4LTzpYBv1+eHeExK5n30L4vfOerRMfrBTwfYLwAj0fvdhpKt2fKYgsw
	1H9MB6ijFIiMYdK7uLGIMyFYylmVeZU185/CVZ5YQgsfrK81yqglMu7da3AZwJeVpyZ3yvmVkG+1O
	ilByoox2k1nl/Z7fT0rj948PxiwrpeYUT1fYDLczpYEzQNvWj9luS3rV77HHHfiugB2Yq6v9Lfd10
	IjGYvPK+jqqXR5ghbXhp2IrR21HTr1r30iC93DpZB6Brbs0XUUZA546PXmnB5gHz3evfIP2n2XrjQ
	kx4/6IDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1pK1-00000001Afn-0Qxn;
	Mon, 07 Apr 2025 16:27:41 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1lul-00000000M0U-43Ho;
	Mon, 07 Apr 2025 12:49:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CCA0061156;
	Mon,  7 Apr 2025 12:49:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 964A2C4CEF5;
	Mon,  7 Apr 2025 12:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744030162;
	bh=+B7zKeUdb4vhO3I+2ufYAN6NeJofvMlAuG64Ted7aW4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=qK15qn+4XDBux6uFbNeNhwEi2hTl9qrQlhxa+iPQu3pfCNYk0TGSpt6kV7em1bTJM
	 vUljZeXsRzR7Jj8NuzkMZTYi/9u3Yh2lORMvrA2WvRMeyyoBzIohPTgjigRudqmNPN
	 WCmBlDx+nk5sKJyfK9ktF0xU8btt+NV60wmriw/nmO6i89bCszDcDKQbX7pX1j6TC0
	 Xd/3FGyHAth4HgZCQUn37Zqh6wg+Ro8M103g9aum/kNYd1KAOExeFkxcGRv+EeHVZ3
	 0RBql7KPbo+Oc3mCIikCkfjSG2W2lDAgrpUCmM33RaND4LwR3y6IonYd3dKod/jNWr
	 FKe526FHkDDIA==
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5e5cded3e2eso6888644a12.0;
        Mon, 07 Apr 2025 05:49:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU3xkKGSNYPRZ44/ghfh3zqgFk9YxOxjlPEJJwYuGPRBde7nchsWDSlOB5kKBJW0FYoeeTVnfTHLP9xLqooupA=@lists.infradead.org, AJvYcCU5mD3jF2qNW0x+RRmexLiM0PDvE09z7qoA4wgY3DLydROapI6aioKSm0gtdhE1rjKzbh5FPrxSUHh9rusW2wb16A==@lists.infradead.org, AJvYcCVrGmojpVe4/VqYxrvAVCwNT9Bl5a+WjsgRE0Iw1pUyEvry5eGWwE3YT2XUIOj1Dg0vaqMfZaJGbKh/XqTl@lists.infradead.org, AJvYcCXPp6DgtvWp/9QIwOk/uO0OtcNbDgetAnmybBEE0yegcrYkKSje5l9XASDqIcNPFKuXMS2VSwIY567cCCYQ8is=@lists.infradead.org
X-Gm-Message-State: AOJu0YxZBkUsbrcEXvRtpqNzRPReXjkvqwGDC5bktprPkW+mp6gvmuno
	DeFEUuJ0fu4JVUYXUNCsXJkOGGIt9ang4ohC32vhBrFADLNyuZPDolH20o7LrbaLfZqMcUVTsVm
	zbW+PrGY2Ym7jffWZDFytm4im8Q==
X-Google-Smtp-Source: AGHT+IHDXKnPQLm3ONu11Ll77borMYreC4A7vgRQSv5YVZin37244aX9wUO7LUzP2WcSyOBSKvvGgd7SCFS9hjbiqWA=
X-Received: by 2002:a17:907:7f0f:b0:ac7:3323:cfdc with SMTP id
 a640c23a62f3a-ac7e7120321mr823783266b.10.1744030161025; Mon, 07 Apr 2025
 05:49:21 -0700 (PDT)
MIME-Version: 1.0
References: <20250403-dt-cpu-schema-v1-0-076be7171a85@kernel.org>
 <20250403-dt-cpu-schema-v1-18-076be7171a85@kernel.org> <CAPDyKFrFRrPVJ_t0JrAE1VTbS02hwr=L-EHtqb7CQiWzB1MnQg@mail.gmail.com>
 <20250407-aloof-fox-of-relaxation-62963a@sudeepholla>
In-Reply-To: <20250407-aloof-fox-of-relaxation-62963a@sudeepholla>
From: Rob Herring <robh@kernel.org>
Date: Mon, 7 Apr 2025 07:49:09 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+6GG3j3_S94SYLwdGN7x8fjf5WuGL4uHfmgW-fFb=dKQ@mail.gmail.com>
X-Gm-Features: ATxdqUG97FKlHBXmze0JeAjms2C3uLqc9HHI86LZOz8ldRdp0AMtBpiWM_qROsw
Message-ID: <CAL_Jsq+6GG3j3_S94SYLwdGN7x8fjf5WuGL4uHfmgW-fFb=dKQ@mail.gmail.com>
Subject: Re: [PATCH 18/19] dt-bindings: arm/cpus: Add power-domains constraints
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>, 
	zhouyanjie@wanyeetech.com, Conor Dooley <conor@kernel.org>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Steen Hegelund <Steen.Hegelund@microchip.com>, Daniel Machon <daniel.machon@microchip.com>, 
	UNGLinuxDriver@microchip.com, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Heiko Stuebner <heiko@sntech.de>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
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

On Mon, Apr 7, 2025 at 7:30=E2=80=AFAM Sudeep Holla <sudeep.holla@arm.com> =
wrote:
>
> On Fri, Apr 04, 2025 at 12:36:33PM +0200, Ulf Hansson wrote:
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
> >
>
> +1, there are users using "perf" and "psci" together now.

Where? That's just wrong.

Rob

