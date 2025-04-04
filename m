Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6C2AC36010
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Apr 2025 14:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nPYlQn0VW0pN1l46FpkNlTR/VrDNwWI6liMIF/TsdII=; b=rCWEosoF30rWL83qzv9sCInXXh
	t7/Gc4WbpvbiiXiS6WDHEoI7HNWonbDY1Wd32tpM4GJ8o3Vsvoaz1FKkfXz63+eKmkqpgxDViaikq
	yr82tmsSlaHG9hre8Q0yIZvdBYnoSsZEfeQvw+xu3FXkJf7jKUkwIb2Iut5SHmFIZ19d8SHtiNn0W
	QU9M5SJ3oEA9cEMLBN57So5cbLrfnEPVVFCM3BpHeN0UTZWe7dVsdwSFjm/fvUCZqCuJ7IAGBglSx
	kUbcnlYsWCoA2825Uy76dteWZPoJ4SOe5Cc3i9aMcTQ1//33ZmZYsplAvd5AHw6KLUfa/1vTZdBZB
	W/AvDDrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0hkg-0000000Bwt3-3Kpv;
	Fri, 04 Apr 2025 14:10:34 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0hkf-0000000BwsV-0wIa;
	Fri, 04 Apr 2025 14:10:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EF34261136;
	Fri,  4 Apr 2025 14:10:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC096C4CEEC;
	Fri,  4 Apr 2025 14:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743775831;
	bh=l2lzsNRrga+hAwlZPw2hZyVI7hOngQ48zjWgc72CGr4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=MhXqLqpa43mJjzUE+SiXJTbXwmVJ/HY6gBTctJU9FfRezIv1qLjartTS85rOgNg9a
	 ZhN4HzOepVa85NDLlDWJODei3AOF6LINQBifXsj/9vcNkRNTNwOPyODWr//oY7SEXN
	 pqbYfSz27XnI8DD+h0GaWdbcrDerOqpp+11Vuj4JYUOWKhgGITX67L3hbAOFtsPvzb
	 xSZsVs/S+Pr54A87UysNCn/RkaXJaFv8XaW0L8BHyTXXNGj+g0awaZqTwq7UI8BMyg
	 xtscO/vdTlk2M4zdjpWE5iml8FERUp0D7y1vv/91pL6IP0dkPhJrxNVtmC/K/73oRz
	 naujA3WQObjpA==
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5e8be1c6ff8so3930499a12.1;
        Fri, 04 Apr 2025 07:10:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUGDRh2xgauy5zgvxdxdXf3nkEq3lOYsxYlbgM0gKF98ef+nTYbpcI0IOXKcrFGz7ijVva1E5+n5lOT2PZJ@lists.infradead.org, AJvYcCVdjP2pieNiJ4kqYOcKWEj/vhTF16bxKWk1IIDZ5JMI4zrr81IZivcjRaWQyjlMTwXly6r4Dex6fKmbfDZ2r7w=@lists.infradead.org, AJvYcCW3uSgswGc+lCOC/MmALyuBQejAHDQpNZh/H2PpULYhcxipYfhq5xjvUiyDOxuMYMbSsCJZlIMYvwIDLwp1jWLq7A==@lists.infradead.org, AJvYcCW91qWSdDN8o/+GbxrnBSzS2EsHliUrEe8Eb1/7fNdum21cU212Tom2kRhCnCvGamEIx6ktDNLD/hMv5gFqFBE=@lists.infradead.org
X-Gm-Message-State: AOJu0YzuwECURqnE/iqLHH6tQzXtTy6tb28SgrjePgCrqSuyB9ZHTFtB
	J7zHAHeIKkNoTgmUxC0ByJzZAoSQ8aefupuRHi8e7POlAFhlrHiPO3cTlnSoH7t/Ud0FeWk4id+
	nAxsqEaUU/67txM/JvM6xBo70AQ==
X-Google-Smtp-Source: AGHT+IGYXjl+q1G3Ghk1zMOjaKXndZfqYp9hiiK7OTWs/zAZNM/+0QVdqEQQ+zuW4YRtKHDm+WaT1WT3knVA25eifPc=
X-Received: by 2002:a05:6402:3481:b0:5ed:921a:ded6 with SMTP id
 4fb4d7f45d1cf-5f0b657862emr2694084a12.18.1743775830233; Fri, 04 Apr 2025
 07:10:30 -0700 (PDT)
MIME-Version: 1.0
References: <20250403-dt-cpu-schema-v1-0-076be7171a85@kernel.org>
 <20250403-dt-cpu-schema-v1-6-076be7171a85@kernel.org> <Z-_K2XDEcbtcCMVM@linaro.org>
 <CAL_JsqJT-0gwvJnMb63izy6WwJpBVsswkauL8OMLCrF08q9HYQ@mail.gmail.com>
In-Reply-To: <CAL_JsqJT-0gwvJnMb63izy6WwJpBVsswkauL8OMLCrF08q9HYQ@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Fri, 4 Apr 2025 09:10:18 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJDkoj4d-aKvZ92kZ1mikqjJV4J4w=-3eNk3z6q6g0ssw@mail.gmail.com>
X-Gm-Features: ATxdqUGgk50-VgqfiN2r-WHP1-0cyp1Dem4hGHbf6672N4-b5gggSNdLRbwnjDg
Message-ID: <CAL_JsqJDkoj4d-aKvZ92kZ1mikqjJV4J4w=-3eNk3z6q6g0ssw@mail.gmail.com>
Subject: Re: [PATCH 06/19] arm64: dts: qcom: msm8939: Fix CPU node
 "enable-method" property dependencies
To: Stephan Gerhold <stephan.gerhold@linaro.org>
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

On Fri, Apr 4, 2025 at 8:18=E2=80=AFAM Rob Herring <robh@kernel.org> wrote:
>
> On Fri, Apr 4, 2025 at 7:04=E2=80=AFAM Stephan Gerhold
> <stephan.gerhold@linaro.org> wrote:
> >
> > On Thu, Apr 03, 2025 at 09:59:27PM -0500, Rob Herring (Arm) wrote:
> > > The "qcom,acc" and "qcom,saw" properties aren't valid with "spin-tabl=
e"
> > > enable-method nor are they used on 64-bit kernels, so they can be
> > > dropped.
> > >
> >
> > The bootloader we currently use on these devices reads these properties
> > to set up the spin-table, so removing these will break booting secondar=
y
> > CPU cores.
> >
> > The motivation for implementing it that way was that 32-bit vs 64-bit
> > kernel shouldn't be relevant for the describing the hardware blocks in
> > the device tree. The code in the bootloader is generic and handles
> > different SoCs (e.g. msm8916 with 4 cores and msm8939 with 8 cores, the
> > enable sequences are identical).
> >
> > Can we keep this in somehow? To be fair, I'm not sure what property we
> > could match on to check if these properties are allowed ...
>
> Yes, we can keep them. We'll have to allow them with "spin-table" and
> "psci" I guess.

I came up with something like this instead:

- if:
  # 2 Qualcomm platforms bootloaders need qcom,acc and qcom,saw yet use
  # "spin-table" or "psci" enable-methods. Disallowing the properties for
  # all other CPUs is the best we can do as there's not any way to
  # distinguish these Qualcomm platforms.
    properties:
      compatible:
        not:
          const: arm,cortex-a53
  then:
    properties:
      qcom,acc: false
      qcom,saw: false

Not ideal as there are lots of A53s, but better than enabling for
every 64-bit platform.


Also, is adding the cpu-release-addr fine? It could trip up a
bootloader tests if the property is already present and doesn't update
it in that case.

Rob

