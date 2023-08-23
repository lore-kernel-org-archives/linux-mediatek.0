Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2516CEE49B0
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Aug 2023 12:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3ApOaAU2C11Pn2qOxjg2kIqTJJ7VnWEqUmde/1TenZQ=; b=GvbYMloXg46T6IRXp+vGujEDJg
	s/BpAHELGL3g4t7yZHDfkz2LB4tDYZ8v595yv1ZoLk831D+7taWigX67ZGhpqr2OfzkSe8SvZtoMK
	gJJVZwj8MFnHeHdVVqOcdET/7lNz/ieoX19UahMJpE8IA6o6Tf33O2dkj9tLtW0Sb907l55neGlP4
	1XNlL1oKLyqLlPfNZcJGoyuoJECeI/FP2pE3xjhS6EFrZfZ7XOwuK18NqhBqR19CwhhjG6SwpWBz0
	aWsvCxnjYH4L09lI32Um7tOgpDTyqPAoeEgK3fXX8Mj4+d2kInl9tq45/SDlur0MsgA1UEI7k+X3n
	iKR8lCXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYn1o-000YAV-22;
	Wed, 23 Aug 2023 12:32:04 +0000
Received: from mail-oo1-f51.google.com ([209.85.161.51])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYn1k-000Y9W-06;
	Wed, 23 Aug 2023 12:32:01 +0000
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-56cae50792fso556704eaf.1;
        Wed, 23 Aug 2023 05:31:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692793917; x=1693398717;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3ApOaAU2C11Pn2qOxjg2kIqTJJ7VnWEqUmde/1TenZQ=;
        b=DiFohPbHRTClbJOG+ncFJH5plPzI5WGHSQ1voxBKCxpH7AxSu7oBdWkvsdn1/aOZxe
         kqWjyYnYa+o9+Jrvvk6agEpIRUI26XG2mlYw9DOHEQtVWdxh1l7Md15Y4jSnnaB7b2s9
         QboiFqN1rMQ7f3bb9YQagisMg9egWf7gM4ZKXJxfb0oxmtVIKhU1ZdLlrdkl/4RksU7J
         6kzMqy4xMaBPRLd6aUEAKVUFw6PBj+DE5HaUKX/PoP+iqE1pBOp7RVY21TV9dD3Q9alC
         0JuE2TGkopk4xnxgLxd/S580JJm4JLSnBBQpjvFiMFBuhWaxrQxDf70diP2LL5MRkiFa
         L0Vg==
X-Gm-Message-State: AOJu0YyFQ3nbWbQCZcWAy6gIXyP2rWEZ9kXFmLGngqeS2R3JtGIpjXbM
	KHpLOmJoR3Xu3HOkxLhIs1t1zjtD5Lxw4hUT2Ak=
X-Google-Smtp-Source: AGHT+IHhMwKmKIBwwvi/YmGkSAgu5efCUMytt4QejM22SViosU4j5VAi4fORzp0+24y420UMM8bLIkI7yh9A1hX+wbo=
X-Received: by 2002:a4a:e741:0:b0:56e:94ed:c098 with SMTP id
 n1-20020a4ae741000000b0056e94edc098mr12003584oov.0.1692793917062; Wed, 23 Aug
 2023 05:31:57 -0700 (PDT)
MIME-Version: 1.0
References: <20230714175008.4064592-1-robh@kernel.org> <CAJZ5v0i-OByOSjpxrj5d9S9QHRySK-MEUo+bK_J_4ihsCBmnSg@mail.gmail.com>
 <CAL_JsqLy22S5bTFu-ZKXhSMtMPPq9z1Gdb5kJMVmhui55miDsQ@mail.gmail.com>
 <CAJZ5v0hM63nVphwkYK1bL4uf_dXSew2+LBuG9kuhvvLdrhLxAw@mail.gmail.com> <CAL_JsqJGoDPLKgu8awJfuWpqzg8HOuruDa1z4s-Swb7Cm5OaJw@mail.gmail.com>
In-Reply-To: <CAL_JsqJGoDPLKgu8awJfuWpqzg8HOuruDa1z4s-Swb7Cm5OaJw@mail.gmail.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 23 Aug 2023 14:31:44 +0200
Message-ID: <CAJZ5v0j2psZUYF1gYTK3G=+MdrLOg1QhOxENhSvWbvGcjzLizg@mail.gmail.com>
Subject: Re: [PATCH] thermal: Explicitly include correct DT includes
To: Rob Herring <robh@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Guillaume La Roque <glaroque@baylibre.com>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Amit Kucheria <amitk@kernel.org>, 
	Zhang Rui <rui.zhang@intel.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
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
X-CRM114-CacheID: sfid-20230823_053200_066640_F5F6BE0C 
X-CRM114-Status: GOOD (  17.83  )
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

On Wed, Aug 23, 2023 at 12:38=E2=80=AFAM Rob Herring <robh@kernel.org> wrot=
e:
>
> On Thu, Jul 20, 2023 at 1:50=E2=80=AFPM Rafael J. Wysocki <rafael@kernel.=
org> wrote:
> >
> > On Fri, Jul 14, 2023 at 9:53=E2=80=AFPM Rob Herring <robh@kernel.org> w=
rote:
> > >
> > > On Fri, Jul 14, 2023 at 12:54=E2=80=AFPM Rafael J. Wysocki <rafael@ke=
rnel.org> wrote:
> > > >
> > > > On Fri, Jul 14, 2023 at 7:51=E2=80=AFPM Rob Herring <robh@kernel.or=
g> wrote:
> > > > >
> > > > > The DT of_device.h and of_platform.h date back to the separate
> > > > > of_platform_bus_type before it as merged into the regular platfor=
m bus.
> > > > > As part of that merge prepping Arm DT support 13 years ago, they
> > > > > "temporarily" include each other. They also include platform_devi=
ce.h
> > > > > and of.h. As a result, there's a pretty much random mix of those =
include
> > > > > files used throughout the tree. In order to detangle these header=
s and
> > > > > replace the implicit includes with struct declarations, users nee=
d to
> > > > > explicitly include the correct includes.
> > > > >
> > > > > Signed-off-by: Rob Herring <robh@kernel.org>
> > > >
> > > > Acked-by: Rafael J. Wysocki <rafael@kernel.org>
> > > >
> > > > or please let me know if you want me to pick this up.
> > >
> > > Single patch in your subsystem with no dependencies. Please pick it u=
p.
> >
> > Done, thanks!
>
> I'm not seeing this in linux-next.

f6a756e8fb12 thermal: Explicitly include correct DT includes

It's there in my linux-next branch (and in my thermal branch) and it
should be there in linux-next too.

