Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CC3EC4829A
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Feb 2024 20:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W6l4xnF0btj0uaDr+7RYU8P5E/4Iq8DR+UwRz94UfB0=; b=NXU7j62pn8CRDZVSUzFgHCX53b
	M+9hHmUskQBMJTHPbqB7SapoehMv3qozrADHsTSYehqjGIeZu2o4AqSnHUlcUhs2jBTdDySOlfqth
	LuwzV2lln3FJh9u3CWQay/2d4PysDzn9m1T08ejxoLX/2sC6jAEkeNuXdpl0cpFrbjCD6NW/dG6iA
	duommW3hbuTYZPEc3WRIZpQ6voOtrICJx6bSrxC0pkw841kMsU2MXjA2f3k8Akx+CHGwrXcqR8wlu
	lW6heiLG2K92icPxS5GK9KLiuSxamNsbOvtta8kk/TEL8VT7IzbhCsHiGORxYtskxuuYp1Ad9m9yi
	xPnyxBEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZzpc-0000000AeRe-3VXY;
	Tue, 13 Feb 2024 20:56:44 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZzpY-0000000AeQm-4BFr;
	Tue, 13 Feb 2024 20:56:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id EA172CE1C6D;
	Tue, 13 Feb 2024 20:56:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39958C433C7;
	Tue, 13 Feb 2024 20:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707857798;
	bh=D4LSaj+s1Zug+tnZej27exr9mIRN2BETmj/yUE3GRW0=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=M009CAqx6Zq+bU3B0slxzBX4LYSGGAZlLcuMORtlOdd1kPRADV0yPtV0MDcvh/71i
	 eKKoQaL4IsBOouhURFlM7bXuQ1D+e7yiNAbxs/G05NqAm2BjmuGEY/P1HIx/MQdVN6
	 9/uohBcFpABqa62lO3DqYEuiChWq5V/oECVXlNWCANYY5X9R/C9Nws/8iKKgLLeHWI
	 q+gvXX6qfTY1DgMimsbt8BAPRBa8NoqLAC1nvSX6dK0At+XS3rq+B5Tk0i6eLbMBEH
	 N59MOVh1jaHbHqW0UyPdMbEaABRBPAKSbb1MqwD1LTiA0FoW4hgfJEmvHJ/Elhf/J6
	 Trj6bzLhSmhMg==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-51182f8590bso3955060e87.0;
        Tue, 13 Feb 2024 12:56:38 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV5g5rvrB20qJNNztLSS506B1TBSdsK1a+9DB6jMGYNGm5e0Viz0YPUKB6XOz8wpUUnsVsYFCBriI2w0kDQtBAhBQLt1fnDFsfPWyoNCmgM8CcHMQz4zR6AnfpM2eDpUoxMeqETyRIDSrQQ5pYy8U3jxUDO4/TqEjY=
X-Gm-Message-State: AOJu0YzZLPeE/lTVO296iPcyj/iorsLg3U/NiJ2UijTvZniL0j53r4Ad
	GUppk+pKBfpb7HGqGrZcZ6oPtqgAZGDg1/BnwwAj62xU9FQ4c2ng0USzouKDbkubAWK54iW67n+
	9SCOsrOn7rDhzvSIx53fkzKd01Q==
X-Google-Smtp-Source: AGHT+IHaVnixOZOBNn0WypWTPscuLN4ELDvcVIU+BZ+gCn9OLEVbEJc+WSHECitxZrPyjoAQls55JHpdFFIbqmURVBc=
X-Received: by 2002:a2e:9bc7:0:b0:2d1:107b:3bbd with SMTP id
 w7-20020a2e9bc7000000b002d1107b3bbdmr506655ljj.9.1707857776326; Tue, 13 Feb
 2024 12:56:16 -0800 (PST)
MIME-Version: 1.0
References: <20240213-arm-dt-cleanups-v1-0-f2dee1292525@kernel.org> <20240213-wafer-garnish-88287bc5d4a5@spud>
In-Reply-To: <20240213-wafer-garnish-88287bc5d4a5@spud>
From: Rob Herring <robh@kernel.org>
Date: Tue, 13 Feb 2024 20:56:03 +0000
X-Gmail-Original-Message-ID: <CAL_Jsq+9BwYyV9Vu1gfCnK_QjdRHvw2anM==Z6fsJvjyqLYFLw@mail.gmail.com>
Message-ID: <CAL_Jsq+9BwYyV9Vu1gfCnK_QjdRHvw2anM==Z6fsJvjyqLYFLw@mail.gmail.com>
Subject: Re: [PATCH 0/6] dts: Fix dtc interrupt warnings
To: Conor Dooley <conor@kernel.org>
Cc: soc@kernel.org, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, 
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
X-CRM114-CacheID: sfid-20240213_125641_403598_71898941 
X-CRM114-Status: GOOD (  17.62  )
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

On Tue, Feb 13, 2024 at 2:27=E2=80=AFPM Conor Dooley <conor@kernel.org> wro=
te:
>
> On Tue, Feb 13, 2024 at 01:34:24PM -0600, Rob Herring wrote:
> > I had a branch with most of these changes sitting in my tree for some
> > time. Geert's asking about some errors not getting found prompted me to
> > clean it up and send it out. This series fixes all* interrupt related
> > warnings and enables the check by default.
> >
> > SoC maintainers, Can you please take this series directly.
> >
> > Rob
> >
> > *There's a few Renesas warnings still Geert said he would fix.
> >
> > Signed-off-by: Rob Herring <robh@kernel.org>
> > ---
> > Rob Herring (6):
> >       arm64: dts: freescale: Disable interrupt_map check
> >       arm: dts: Fix dtc interrupt_provider warnings
> >       arm64: dts: Fix dtc interrupt_provider warnings
> >       arm: dts: Fix dtc interrupt_map warnings
> >       arm64: dts: qcom: Fix interrupt-map cell sizes
> >       dtc: Enable dtc interrupt_provider check
>
> Only fixing it for arm, Sadge.

I was assuming you had things in order. ;)

> Co-incidentally I noticed there was one for riscv while looking at
> Krzysztof's underscore in node name patch earlier, so I'd already
> written a patch to fix it :)

See, I was right.

Actually, I did remember to check right after I sent this and noticed the s=
ame.

For powerpc, no one else can be bothered to care, so neither do I. I
think powerpc has been spewing dtc warnings by default for some time
now.

Rob

