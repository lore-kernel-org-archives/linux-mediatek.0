Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4151DC36010
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Apr 2025 13:09:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IJjtKvB0rLaMskvFNiRzxuSDpey4a4TgSRaXThNqTac=; b=FXQvURxYkcMo5dHnZ7ZpdVFMGZ
	9qbo6V0iWp7/Pd8op5ykKnXoq1HnrmbgxxM1uAM8oR3W76Z/g+gfG+b7ZU2e3rU1VXOWFRobyVtNI
	eVS3ovBoDWYtEoJSS5TrdNrw3pZtRnJWF2gRzMCckn8rFYLVdtrLcoc1XKkUwJRnBXEwA5rZAFsEp
	nr70zu7ydfa85ZsTGhPYX8LFEkPBfKTO04P0wfJ37/irUsfDxllFcx+No6pFijZME7peRwrbtoJfg
	HX/bENRscf/6uZ4+E5Qsyo8w8VmU34y25Az61VYUbcye9wz8oITkRx+MBJKmj1j6jnXuzCc5g0szi
	fOnstsCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0gnc-0000000BluT-1Ki6;
	Fri, 04 Apr 2025 13:09:32 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0gnZ-0000000Bltl-1el0;
	Fri, 04 Apr 2025 13:09:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7C09945053;
	Fri,  4 Apr 2025 13:09:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEA23C4CEF3;
	Fri,  4 Apr 2025 13:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743772168;
	bh=dXvLo65uum190+DYUNNlALy+j1eqU6jZE1YhXB2VRzw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=GDd3H0n4Z0vbzhOAKBtX4aBm2VvNF3+IHAlBZcY+prFuXi8cUpHIAmcgMJANZtdgc
	 SadmKjqoeeP3emGC4LnYFxHT6I2Z5k4Qigi/ixTpN0IjDgoC2YwqzWaLtiFw6MVdWY
	 R51uqx4Vo1nBKrHVzBG0y29dCta48Jc5BLa59kSTc1THSL1yXM0eoSE65ifw4Hc4m9
	 SWymD+qBgYbMWGz01AIzxcp4EAbHrwklRmWGHBAZsGAPODfBKuc22jPpwnuD0PsKUb
	 4WzCQ8fABsmztu+A1EYwZSW/Iy8dxRsSFMwWpTf8Ntbimo0rh1MzNq8RAHcck28ns7
	 PlZqBwK10PG0Q==
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ac7bd86f637so330850766b.1;
        Fri, 04 Apr 2025 06:09:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV7u+haG7jWTke96wzQRe+lBxqYWPbA4ZkMn7koL/JeK3Y75WmnIbti3K+/KkdfGEC6qRbs3qZo9IS9+e5NGCY=@lists.infradead.org, AJvYcCWT2aCIi4i6lnO8VZqvp1K4QcmQhUt7T9p6DTtzz0gYhyUvUcS2qri+SoZZioprSVj6dhDaIyDU6UfvnY2wjPs=@lists.infradead.org, AJvYcCXBtgZn4aoQtMlQIC8njIuRSMCnTtZaa1t6tBIuQ5vETggp1AciE82i1QTzWp4dilPGX56tFpKvQud5QXudsxsaHA==@lists.infradead.org, AJvYcCXkgbPZv4c5kYQswuLbircMpqhFT9bZGBaVOkM+tmKU6y7cjxwj7Z7/q5E0h+xR7650hpcQirgbJ99La7ss@lists.infradead.org
X-Gm-Message-State: AOJu0YxoiwQIC6OoAEhZgP52gNSDmS6osb9VDcGb0an8Sk6kqnQ7pHN/
	1SRRLL2FCl5SpsFUsIGURpWfRcw9C7opMdU0eS1YDWxsEHOUe95Ri+Q6C7wfCsy9CsC0vMF6OsE
	jlHL9f0P874c6muHiMUDX0BxqHA==
X-Google-Smtp-Source: AGHT+IFIyAD0iksJ2rEYwVDKxfXp9paMa26qoweWItquite8ZOPf4g5g6GK5SE+pbTwu/1QEMoBYtzOxpeaG2eY6PCU=
X-Received: by 2002:a17:907:6e8e:b0:ac2:d5d3:2b77 with SMTP id
 a640c23a62f3a-ac7d2e1b9c5mr344142866b.8.1743772167150; Fri, 04 Apr 2025
 06:09:27 -0700 (PDT)
MIME-Version: 1.0
References: <20250403-dt-cpu-schema-v1-0-076be7171a85@kernel.org>
 <20250403-dt-cpu-schema-v1-18-076be7171a85@kernel.org> <CAPDyKFrFRrPVJ_t0JrAE1VTbS02hwr=L-EHtqb7CQiWzB1MnQg@mail.gmail.com>
In-Reply-To: <CAPDyKFrFRrPVJ_t0JrAE1VTbS02hwr=L-EHtqb7CQiWzB1MnQg@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Fri, 4 Apr 2025 08:09:15 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKygxhcQ=PZW84sfiW7BVXKF839vfNyxS9GwAXuqmN=8g@mail.gmail.com>
X-Gm-Features: ATxdqUFqb3GyPW1xY4MYIKArvKkAjEGffj80G84cX0XvObx4_cAf9jnDsr6emp0
Message-ID: <CAL_JsqKygxhcQ=PZW84sfiW7BVXKF839vfNyxS9GwAXuqmN=8g@mail.gmail.com>
Subject: Re: [PATCH 18/19] dt-bindings: arm/cpus: Add power-domains constraints
To: Ulf Hansson <ulf.hansson@linaro.org>
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
X-CRM114-CacheID: sfid-20250404_060929_474191_9EFD747A 
X-CRM114-Status: GOOD (  15.79  )
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

On Fri, Apr 4, 2025 at 5:37=E2=80=AFAM Ulf Hansson <ulf.hansson@linaro.org>=
 wrote:
>
> On Fri, 4 Apr 2025 at 05:06, Rob Herring (Arm) <robh@kernel.org> wrote:
> >
> > The "power-domains" and "power-domains-names" properties are missing an=
y
> > constraints. Add the constraints and drop the generic descriptions.
> >
> > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> > ---
> >  Documentation/devicetree/bindings/arm/cpus.yaml | 8 ++------
> >  1 file changed, 2 insertions(+), 6 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/arm/cpus.yaml b/Document=
ation/devicetree/bindings/arm/cpus.yaml
> > index 6f74ebfd38df..5bd5822db8af 100644
> > --- a/Documentation/devicetree/bindings/arm/cpus.yaml
> > +++ b/Documentation/devicetree/bindings/arm/cpus.yaml
> > @@ -313,19 +313,15 @@ properties:
> >      maxItems: 1
> >
> >    power-domains:
> > -    description:
> > -      List of phandles and PM domain specifiers, as defined by binding=
s of the
> > -      PM domain provider (see also ../power_domain.txt).
> > +    maxItems: 1
>
> There are more than one in some cases. The most is probably three, I thin=
k.

Unless I missed it, testing says otherwise. What would the names be if
more than 1 entry?

Rob

