Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F4117C0015E
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Jul 2023 19:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DnEjVGiuXfP3swFolvK4a+TN59hjw2gEVcLZQUXBvDY=; b=gbhbAoMik19jO4nkkTT2ZvYvbE
	yomgq8AdbExQDC17vrBUbCmSPCfomRBEgbA36IezZGcUWSduYEQf1e6fl9os6v1j1oyjoXwjzKS0W
	KLiMQuPB48qt4HE6IBGV7EOWdGtFzBOn3BgUpC0uGRcuiqAoYPLjYWcVoDV8d1nq7SEEEob4PYdn4
	ZPQXkWIX2ruOkn5IYX2S49UuJwHnrRDfkmXl2hR+hQE3P/j2lRl8mhPS5Er4x+jDCrSZrZpHTsJS+
	uRvjdZInqcxITS9UUHw0sNa+SmSdgM8RFqRz0NFoR1czFqcrzZjNDgv8EUn1u0NmNUYOOVsnyncC0
	rw+eLWgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qKOqr-0078pl-0f;
	Fri, 14 Jul 2023 19:53:17 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qKOqn-0078om-1X;
	Fri, 14 Jul 2023 19:53:14 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id EBD8B61DE2;
	Fri, 14 Jul 2023 19:53:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4BB2C433CA;
	Fri, 14 Jul 2023 19:53:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689364391;
	bh=DnEjVGiuXfP3swFolvK4a+TN59hjw2gEVcLZQUXBvDY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=mn87tiPgZ6ilmAUhV977eN8ghu423vnPb3bEQXiueuJFlG6WzckKVMBYgx1XXxNaX
	 uZLBgaozxXIxTjMwwZNV48AJ6IMuBYZoVyzOzjRfheSwy+adVIZ73Ma7GMH/LYoiS8
	 hcOEgR57LDhoIb4QTvPCf/wCVxc3h7Kvt4VD/k4D0c/wK97+sjzu6mr25aZQsYNWl3
	 098AiK51OpiCy2cNMNRiacvZN6BEPN3mg7PfGgRH9OxiHBDW8JTYfTM1FqidsDFTCm
	 d1GulW7sULPhNG45eCQXrmcwpCNJF/mD+Y+rb0JwswPdlZCblEQ5fjs6Gv1LtynJYb
	 iJzdclHBcYkvA==
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2b701dee4bfso36715231fa.0;
        Fri, 14 Jul 2023 12:53:11 -0700 (PDT)
X-Gm-Message-State: ABy/qLZDZTT+g+8XEohGTQ+aARfHqqvwjXkl6pxXAYRhm3PFpL2DlHwg
	k75DLAGNaMwmiIoIBuD0Edd1NE0KwHSjkwpUIA==
X-Google-Smtp-Source: APBJJlFIVq6SSfDGp/7zlzMmel1HUM1zDWT3EoUpkE1rCFI61SUoU0+rrNxJc3PIb6p4Jh4x1E4RyP9tWO4eKUbbP0E=
X-Received: by 2002:a2e:9a8a:0:b0:2b4:765b:f6ee with SMTP id
 p10-20020a2e9a8a000000b002b4765bf6eemr4915096lji.41.1689364389871; Fri, 14
 Jul 2023 12:53:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230714175008.4064592-1-robh@kernel.org> <CAJZ5v0i-OByOSjpxrj5d9S9QHRySK-MEUo+bK_J_4ihsCBmnSg@mail.gmail.com>
In-Reply-To: <CAJZ5v0i-OByOSjpxrj5d9S9QHRySK-MEUo+bK_J_4ihsCBmnSg@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Fri, 14 Jul 2023 13:52:57 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLy22S5bTFu-ZKXhSMtMPPq9z1Gdb5kJMVmhui55miDsQ@mail.gmail.com>
Message-ID: <CAL_JsqLy22S5bTFu-ZKXhSMtMPPq9z1Gdb5kJMVmhui55miDsQ@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20230714_125313_603796_64E57531 
X-CRM114-Status: GOOD (  13.75  )
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

On Fri, Jul 14, 2023 at 12:54=E2=80=AFPM Rafael J. Wysocki <rafael@kernel.o=
rg> wrote:
>
> On Fri, Jul 14, 2023 at 7:51=E2=80=AFPM Rob Herring <robh@kernel.org> wro=
te:
> >
> > The DT of_device.h and of_platform.h date back to the separate
> > of_platform_bus_type before it as merged into the regular platform bus.
> > As part of that merge prepping Arm DT support 13 years ago, they
> > "temporarily" include each other. They also include platform_device.h
> > and of.h. As a result, there's a pretty much random mix of those includ=
e
> > files used throughout the tree. In order to detangle these headers and
> > replace the implicit includes with struct declarations, users need to
> > explicitly include the correct includes.
> >
> > Signed-off-by: Rob Herring <robh@kernel.org>
>
> Acked-by: Rafael J. Wysocki <rafael@kernel.org>
>
> or please let me know if you want me to pick this up.

Single patch in your subsystem with no dependencies. Please pick it up.

Rob

