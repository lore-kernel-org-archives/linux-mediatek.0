Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25D5CC36018
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Apr 2025 18:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6OrvsvEYA+XXB2xdTLTpIAwjv43X6JKiVZsB2NNpFGM=; b=mF34A8iW0KdXACcLv6BpWeejvg
	CfyM6INvU0/pH1k9aD4yoEBAGiHKjoiWCIi96k1UA6VukVxCQba5ZNqJoKLczCw8J81aAPOC5bazB
	VBC7CYpXOwRbXdxt6snQq20rjTUq9Ntbf9DcHs8+oYh0R/ITk/Qn6V+61x7+ItgvPiCoZiwZQA9Qw
	RoZvG4NBtWobpNnHzcdpUmGxjRtyCpq+Wlk9QJRO2OklVaxkGfmTjzzLvvUwx+EWwxxTImROQFf1H
	45chcq2VYp4UKkKuhhd8z4jUQm4RubtplUhtaVj47fW+k+LuTHT9COXK9paurXvnDXucwNUmBIq3z
	WOAeZRjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1rYe-00000001dO5-2AYG;
	Mon, 07 Apr 2025 18:50:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1pgV-00000001HG2-2Lx1;
	Mon, 07 Apr 2025 16:50:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=6OrvsvEYA+XXB2xdTLTpIAwjv43X6JKiVZsB2NNpFGM=; b=SdsvFv6JTyqowC2RqDU4pOeOJL
	/bZnRo43dmp+OU5D6lYdtC/AVXB8au06J684P2SiV5rQFB9ikUFzx/6WWZsXbbtTx0sRtKySuf5SU
	kVwBa+zg7ZFU5iTpkMZOk5ymsDjjD4zjHaZIgCDtOOLlTfnylftNNU38y6n1Jn68m9KEHVBWBRi8i
	Z4WnxHwKPNSt0S3/2eakTVvBut3G8zr88vYidRgMqd0d4AredKAKD3ObMQIC1I33bjfbk1Fn8t061
	3Ij7QltmzYxHXac3ctDbDqFaOGaEJAVIEb26kanSCOekz/SLhCdPhngDv5nexC3odpl7kxpnKSOEl
	N++4RJtA==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1pgS-000000084cJ-1aWz;
	Mon, 07 Apr 2025 16:50:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6655C49FA6;
	Mon,  7 Apr 2025 16:50:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAB5FC4AF10;
	Mon,  7 Apr 2025 16:50:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744044650;
	bh=9rKDfEvc7K+7LzU7nTcuoqeYfX0y7c5G08Njz5uF/Vo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Sp9MSWDJaaAqP1q2SYIWKIo2g5ROm+6P5tR7LFd8E50X8gK4zuhxBadi53VkyP+Ic
	 Mjsmlr7jxLIM1qBo59vxeEqPR6FZPe9YVLx4CPyU2A4DHmeFfsEwHB8BxVshIFEmeC
	 12MMo2b3egIrNo05eXUirOJt6tvZCoIHerm6NWQWppuvtrt7Sdv8HQefioWs1cgwOv
	 mkQpF5mP4YM/Mqvyo83b7cKwtpLn0eBZTzXGJBE6sjFWjRkVl9Js0s32ghUeE+0pJ2
	 vKcR/Tzpjum/ZIgOGGfWTmbdDSesqQEtB6FpedtzQIqOmygCuQe1BApOBiIe8k3tMk
	 ZEfSj8h17KEtg==
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5edc07c777eso5986597a12.3;
        Mon, 07 Apr 2025 09:50:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUL95JFS3q6Il1E1xYKws+l+u5pYtV7PW2mFx+hOTTkBVmXFxfQ7t+W0ytEGWlk21Iwh0+X5Umn9fMyXs5/@lists.infradead.org, AJvYcCW6aM7hPzWGI01jUr5PsI/wa0vrhMv9Rd6WUbbLcs8YFMsr7XiN+DgsZOgp0/n3WrZMJMpUISH1Ll4GOXmz2+ZJnw==@lists.infradead.org, AJvYcCWKR7e0NsXM1rhR76SlacnAOdVOPwwBCavz3lbnoKzgz88RMlIMeI5ao2PxEuophTzou8Di+cWV4/g/2Jd9siI=@lists.infradead.org, AJvYcCXPfmge4uHex2/N0jaRxHDa/vNtUnNZ8B0s1sxZ/cezS/du89lhEHHcDMc3i5QxTojMTYiS654l7PFl8uFWNb4=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw28fLRSltbGjJpkMmEm8BZ038uC1snBgStlnbFLcpxWnt0E4C1
	Wq/aZVGa74d6N6rDovFuL9sEUdQKo4QU16PyMpzKpT6TK8ySSxNuQvgo3vwSj18etYIC93xZAZ3
	Q+D5G20mf/tUV7UavriKUPqTn6g==
X-Google-Smtp-Source: AGHT+IEYKsKGhFSJY/Ew6wLedApBd8mm5Tfxxs3oUxIJoVcHTWnGkb+RbDSqCHxLGxft/yGwgIdnVVemND8kyOfPXZI=
X-Received: by 2002:a05:6402:26ca:b0:5e7:c779:85db with SMTP id
 4fb4d7f45d1cf-5f0db7fc898mr8148611a12.4.1744044649254; Mon, 07 Apr 2025
 09:50:49 -0700 (PDT)
MIME-Version: 1.0
References: <20250403-dt-cpu-schema-v1-0-076be7171a85@kernel.org>
 <20250403-dt-cpu-schema-v1-18-076be7171a85@kernel.org> <CAPDyKFrFRrPVJ_t0JrAE1VTbS02hwr=L-EHtqb7CQiWzB1MnQg@mail.gmail.com>
 <CAL_JsqKygxhcQ=PZW84sfiW7BVXKF839vfNyxS9GwAXuqmN=8g@mail.gmail.com> <CAPDyKFoHQdHED0hHUR7VKin0XG6SVnYXuvPjB=Xe+1o2hpiPJA@mail.gmail.com>
In-Reply-To: <CAPDyKFoHQdHED0hHUR7VKin0XG6SVnYXuvPjB=Xe+1o2hpiPJA@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Mon, 7 Apr 2025 11:50:37 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+Oa7MvVO7Y-RG+qrY2e86B_q0XGq1LWoy5Mq+G72ZHzQ@mail.gmail.com>
X-Gm-Features: ATxdqUFxTokrKuT9iYBdxHBpsv0NfQo4Eim7mTXXSg7aEaclQFxJWUQS1crmjko
Message-ID: <CAL_Jsq+Oa7MvVO7Y-RG+qrY2e86B_q0XGq1LWoy5Mq+G72ZHzQ@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20250407_175052_836112_0F8BB617 
X-CRM114-Status: GOOD (  20.26  )
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

On Mon, Apr 7, 2025 at 11:23=E2=80=AFAM Ulf Hansson <ulf.hansson@linaro.org=
> wrote:
>
> On Fri, 4 Apr 2025 at 15:09, Rob Herring <robh@kernel.org> wrote:
> >
> > On Fri, Apr 4, 2025 at 5:37=E2=80=AFAM Ulf Hansson <ulf.hansson@linaro.=
org> wrote:
> > >
> > > On Fri, 4 Apr 2025 at 05:06, Rob Herring (Arm) <robh@kernel.org> wrot=
e:
> > > >
> > > > The "power-domains" and "power-domains-names" properties are missin=
g any
> > > > constraints. Add the constraints and drop the generic descriptions.
> > > >
> > > > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> > > > ---
> > > >  Documentation/devicetree/bindings/arm/cpus.yaml | 8 ++------
> > > >  1 file changed, 2 insertions(+), 6 deletions(-)
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/arm/cpus.yaml b/Docu=
mentation/devicetree/bindings/arm/cpus.yaml
> > > > index 6f74ebfd38df..5bd5822db8af 100644
> > > > --- a/Documentation/devicetree/bindings/arm/cpus.yaml
> > > > +++ b/Documentation/devicetree/bindings/arm/cpus.yaml
> > > > @@ -313,19 +313,15 @@ properties:
> > > >      maxItems: 1
> > > >
> > > >    power-domains:
> > > > -    description:
> > > > -      List of phandles and PM domain specifiers, as defined by bin=
dings of the
> > > > -      PM domain provider (see also ../power_domain.txt).
> > > > +    maxItems: 1
> > >
> > > There are more than one in some cases. The most is probably three, I =
think.
> >
> > Unless I missed it, testing says otherwise. What would the names be if
> > more than 1 entry?
>
> "psci", "perf", "cpr", etc
>
> The "psci" is always for CPU power management, the other is for CPU
> performance scaling (which may be more than one power-domain in some
> cases).
>
> I would suggest changing this to "maxItems: 3". That should be
> sufficient I think.

Again, my testing says 1 is enough. So where is a .dts file with 3 or 2?

Rob

