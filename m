Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED3BAC48BC1
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Feb 2024 15:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3f3eO7AWKrMUXfn2g7yysKU/u59S3OfGVqhsP80atCw=; b=Jh2e3U6BpfdQWIIWHiYZSAQall
	ppsDRGZMlpIeO/JwJKhC/dFYgZHWOF8smvQLJgjCnt/q81qJAiUy6WoiSD4A3wDHh7c1ZA+x32fP4
	bJdNqBBsWr9g4o+3BrN4idkNEd3EfYgncCyG+hFfuVVl//WQkyemLsd5T3gXdSml1ZbH6ngDpV77/
	adf0e8dc+GL2jBDgXVl0Lj1SBfi+X/SWB8rxhsb66Cul/RnBoXgXHUw8+cYQJU+L8fn4F2iEL6N7z
	uSlIm+9XqNGiTwddDBuJi0p3Vju1ik/XAUgpgCt94Z4E1Gx/KeNU06gP+ijuL5goSe4nYF2ZabZ5f
	jVG3GpuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raHEa-0000000DKPC-0Wfa;
	Wed, 14 Feb 2024 15:31:40 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raHEV-0000000DKLz-2E4H;
	Wed, 14 Feb 2024 15:31:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C5A8661A27;
	Wed, 14 Feb 2024 15:31:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B46AC43390;
	Wed, 14 Feb 2024 15:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707924694;
	bh=4JlFA01oQWdtvRaP+CnWQqdwr1cP142uEyw13TLrbN8=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=REdAzMQNUKQthunqIYd1xXRZvyRazfzeeHO6U9IdkqpQocmGPZO0MqL1dce3y5y1b
	 PFeEIPsWTolML15+QzASJcdeWR5n3IAnWbJf7gcLrasH+H8HI8o4G8CRjOmNuEAXXZ
	 JPJN0CaZp3PLCjJjy61EfrhMHYHUHlJL+wd+mTzJYfZGvX6odSfmQZTFtUVb0aybMe
	 ViowSODx6riqYuR9wKjBYsEm3o3VxzwN8Mp3sn9zRKC3cerkcEYU/VGXs0MoG5uQuI
	 g6xuLSibBrZHt98G3dsRPMywRLrzlLMAc3Dp44/uxlOpcqrH3cKuiu41UkhGcoS0W2
	 /cPQAX+TUIULg==
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a34c5ca2537so725010666b.0;
        Wed, 14 Feb 2024 07:31:34 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUsFs7KEU59o0kcDBLN7YaodW2oB7Oys2dITpQ46yve2CJL6xZidFQiEqK0LZOy9JcaurfhivBOUZ99V6zkyuyTExH3JOj3WieNIUDTcO+cryHd6kX+GJVCbOAtl2B49daOAzpeWMQynpzGWTlfdS8LSBkAXePyxtM=
X-Gm-Message-State: AOJu0Yws3TFNr7hiXR/ahowWRes6k1pixVUZaQ6EFgZDxuS24G8DG63h
	yTgGio6f9d/HiG0tvsQ03IAMtjtUozkkd+JklCVLohGBgEwOcg01gzveLUADolOehh+fEBsaieK
	P5x0qeagxcOi+ZCVYaZDhiRmFJQ==
X-Google-Smtp-Source: AGHT+IH8/isML9jhNTe8vUWU49jrNm4p0HUKpD8NeE7Izp0zgWowWPvoVR9vvZmOadC5fdJrnpVWN3J0XGbdjt6xmGE=
X-Received: by 2002:a2e:b888:0:b0:2d0:dfad:2863 with SMTP id
 r8-20020a2eb888000000b002d0dfad2863mr2522106ljp.46.1707924672118; Wed, 14 Feb
 2024 07:31:12 -0800 (PST)
MIME-Version: 1.0
References: <20240213-arm-dt-cleanups-v1-0-f2dee1292525@kernel.org> <CAMuHMdWgvD9szXksK+jzyvwLQ8ufWWf1TPQ7s-5z4JWgrvXmkg@mail.gmail.com>
In-Reply-To: <CAMuHMdWgvD9szXksK+jzyvwLQ8ufWWf1TPQ7s-5z4JWgrvXmkg@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 14 Feb 2024 15:30:57 +0000
X-Gmail-Original-Message-ID: <CAL_JsqKbDdUzkuSBrBTYm0PF8KehK0DnUwTBHqJ6tZfaE=B2_w@mail.gmail.com>
Message-ID: <CAL_JsqKbDdUzkuSBrBTYm0PF8KehK0DnUwTBHqJ6tZfaE=B2_w@mail.gmail.com>
Subject: Re: [PATCH 0/6] dts: Fix dtc interrupt warnings
To: Geert Uytterhoeven <geert@linux-m68k.org>
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
	Magnus Damm <magnus.damm@gmail.com>, Linus Walleij <linusw@kernel.org>, 
	Imre Kaloz <kaloz@openwrt.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-aspeed@lists.ozlabs.org, 
	openbmc@lists.ozlabs.org, linux-tegra@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-omap@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240214_073135_713537_5ECC9DB1 
X-CRM114-Status: GOOD (  16.47  )
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

On Wed, Feb 14, 2024 at 9:01=E2=80=AFAM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Rob,
>
> On Tue, Feb 13, 2024 at 8:35=E2=80=AFPM Rob Herring <robh@kernel.org> wro=
te:
> > I had a branch with most of these changes sitting in my tree for some
> > time. Geert's asking about some errors not getting found prompted me to
> > clean it up and send it out. This series fixes all* interrupt related
> > warnings and enables the check by default.
>
> > *There's a few Renesas warnings still Geert said he would fix.
>
> Thanks, fix sent
> https://lore.kernel.org/r/a351e503ea97fb1af68395843f513925ff1bdf26.170792=
2460.git.geert+renesas@glider.be
>
> >       dtc: Enable dtc interrupt_provider check
>
> >  scripts/Makefile.lib                                  |  3 +--
>
> Just wondering, can the remaining disabler be removed, too?
>
> Documentation/devicetree/bindings/Makefile:     -Wno-interrupt_provider \

I was too. Shockingly, that too will require some fixes. Though I
remember when configuring the warnings for bindings, trying to make
them stricter. So there must have been some case where
no-interrupt_provider was needed. It may have been related to how we
parse interrupts in examples, but that changed back when switching to
validate dtbs directly.

Rob

