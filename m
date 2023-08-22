Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06B87EE49AB
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Aug 2023 22:38:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U15eYY76gsnD/RHRrRp2WW4I4OCWvlLasJey1YPS3bA=; b=iSESyPUns2Au13hphGVaBHWttL
	qADWT1OpaHQICwEIr+NNugu6MX/AsbkNLc4MgmtHd7o3SkYLQE2MNpdDZ9MBqVOa97udA0RX4WDkS
	wKQNqgcXXd3dG0s5NqHi4jDBtVI2e+OLbMkCo+AcvXdVCtWQF1abxQ+8Ap/Ljqop8EYrsaZZ/AYj2
	r4k6eLHwCJ+OR/EB19NmPFNzKzHopqX9rXhnhQl1p6jbJPpGePSavT2gk/JrmRqIpcVMwX8SxXJlg
	M2zJw5jtXBzm3bXvjeMQEdNlXH9AslzbVkJSGfFLl82PVYQx0yA+U2NmME6dd4NoOCnlZXqpEHIM+
	A6G/Fppw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYa1W-00Gsq0-2t;
	Tue, 22 Aug 2023 22:38:54 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYa1T-00Gsp0-1V;
	Tue, 22 Aug 2023 22:38:52 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id EB030642C9;
	Tue, 22 Aug 2023 22:38:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6C27C433AD;
	Tue, 22 Aug 2023 22:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692743929;
	bh=U15eYY76gsnD/RHRrRp2WW4I4OCWvlLasJey1YPS3bA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Jn4NXR0lfbWYS5Bph9NDsU+CUS6oKPixIBuJYm6y13c3Oey4zsZFxl5LEbilQxJik
	 FeYi4hk81hW93Pito7BlDOIWLAaYnB0RhnPhbkxJtYjIwxdi5/i0pNyJyNN/nCccuI
	 fmY+ssuFxpfa7I30gkLK8YDwU53i5SgxztwwtwOd89uEzAB/wmwwNcI4B7etE38nUX
	 1KT94QzqmI87253Kc52MD6Y8fou1jBGiX1pJkpWJMnTdedMpWf+KZdUDC39Y5QFc9X
	 pamJJqabcmOvoF7HZyud2tyJQOPli0tj7WP4SaXb0FkLx82tm9eotCxnMBwonE7SUu
	 gzqa24AIGrPmA==
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2bcb89b4767so43873001fa.3;
        Tue, 22 Aug 2023 15:38:49 -0700 (PDT)
X-Gm-Message-State: AOJu0YxdKahgtp8t5Ng4AbjJvSH2sjgplqjR0LOIiXoohvKweTPZCt+F
	n5ppaoW4HGz5UZeSeLa8/wbvfLzE9FmoJtcUIw==
X-Google-Smtp-Source: AGHT+IF0JLsyZnXZQBcgCFuF2kEmLMhxys3SoS78ueuZDPswTtorzz1H8NCRQqi/aO+jact/25/WQ07MKCBccdqUsKI=
X-Received: by 2002:a2e:9919:0:b0:2bb:8d96:6041 with SMTP id
 v25-20020a2e9919000000b002bb8d966041mr7975933lji.45.1692743927592; Tue, 22
 Aug 2023 15:38:47 -0700 (PDT)
MIME-Version: 1.0
References: <20230714175008.4064592-1-robh@kernel.org> <CAJZ5v0i-OByOSjpxrj5d9S9QHRySK-MEUo+bK_J_4ihsCBmnSg@mail.gmail.com>
 <CAL_JsqLy22S5bTFu-ZKXhSMtMPPq9z1Gdb5kJMVmhui55miDsQ@mail.gmail.com> <CAJZ5v0hM63nVphwkYK1bL4uf_dXSew2+LBuG9kuhvvLdrhLxAw@mail.gmail.com>
In-Reply-To: <CAJZ5v0hM63nVphwkYK1bL4uf_dXSew2+LBuG9kuhvvLdrhLxAw@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 22 Aug 2023 17:38:32 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJGoDPLKgu8awJfuWpqzg8HOuruDa1z4s-Swb7Cm5OaJw@mail.gmail.com>
Message-ID: <CAL_JsqJGoDPLKgu8awJfuWpqzg8HOuruDa1z4s-Swb7Cm5OaJw@mail.gmail.com>
Subject: Re: [PATCH] thermal: Explicitly include correct DT includes
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Guillaume La Roque <glaroque@baylibre.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Amit Kucheria <amitk@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Markus Mayer <mmayer@broadcom.com>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	NXP Linux Team <linux-imx@nxp.com>, Andy Gross <agross@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Thara Gopinath <thara.gopinath@gmail.com>, 
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
	Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Orson Zhai <orsonzhai@gmail.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Vasily Khoruzhick <anarsoul@gmail.com>, Yangtao Li <tiny.windzz@gmail.com>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, devicetree@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev, 
	linux-tegra@vger.kernel.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230822_153851_586979_6203C708 
X-CRM114-Status: GOOD (  17.32  )
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

On Thu, Jul 20, 2023 at 1:50=E2=80=AFPM Rafael J. Wysocki <rafael@kernel.or=
g> wrote:
>
> On Fri, Jul 14, 2023 at 9:53=E2=80=AFPM Rob Herring <robh@kernel.org> wro=
te:
> >
> > On Fri, Jul 14, 2023 at 12:54=E2=80=AFPM Rafael J. Wysocki <rafael@kern=
el.org> wrote:
> > >
> > > On Fri, Jul 14, 2023 at 7:51=E2=80=AFPM Rob Herring <robh@kernel.org>=
 wrote:
> > > >
> > > > The DT of_device.h and of_platform.h date back to the separate
> > > > of_platform_bus_type before it as merged into the regular platform =
bus.
> > > > As part of that merge prepping Arm DT support 13 years ago, they
> > > > "temporarily" include each other. They also include platform_device=
.h
> > > > and of.h. As a result, there's a pretty much random mix of those in=
clude
> > > > files used throughout the tree. In order to detangle these headers =
and
> > > > replace the implicit includes with struct declarations, users need =
to
> > > > explicitly include the correct includes.
> > > >
> > > > Signed-off-by: Rob Herring <robh@kernel.org>
> > >
> > > Acked-by: Rafael J. Wysocki <rafael@kernel.org>
> > >
> > > or please let me know if you want me to pick this up.
> >
> > Single patch in your subsystem with no dependencies. Please pick it up.
>
> Done, thanks!

I'm not seeing this in linux-next.

Rob

