Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 841D3C74A5B
	for <linux-mediatek@archiver.kernel.org>; Sat, 18 Mar 2023 08:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ok0/fcUUjYf3VJvre1cNZ96FcwH4JhSJwBxsOnlRNhc=; b=h7fv3AuOKLEztx/dgw8+H7j/Rl
	B/3y3Qpv2kAkzrNnaGduXeSGkI4MI/KslCAIbZk8/bT9dvwA5MOEt98M24gUUFMG8yLWmDler0HZg
	A4jicY6h//9uxj7icNfs8l5RcC3o0juGPyvdXXHFmphhGL1lb71cCQQLdXWKJtgIpgumLrmdK/eKt
	xG/7ZmkBtqpJU99+jQOdh3m0ZTIDELSuXrrlN9/1H+ZCPthDvg22sGexBFA2pIhCJe6Ygn/GVPA5/
	r9TSVTy0q1BqXJa4E0OxcnRuNkDx+wJEipAvk8NyssstfX8U8Rt2N5KZYPvXpnGAmGLYt6/QnKb7r
	not3j1MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pdRoR-004QBn-0z;
	Sat, 18 Mar 2023 08:21:15 +0000
Received: from mail-oa1-f50.google.com ([209.85.160.50])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pdRoM-004QAd-2Y;
	Sat, 18 Mar 2023 08:21:12 +0000
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-17aeb49429eso7788879fac.6;
        Sat, 18 Mar 2023 01:21:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679127667;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ok0/fcUUjYf3VJvre1cNZ96FcwH4JhSJwBxsOnlRNhc=;
        b=kwX+dpk8Jc9yaRpyfiKLSp9Xi1yQqY502rMhXVtzxHbX1DPIYKhnazr3t13HTqlPgk
         IcupCCF9SeJwjwvbY1AvFu5sI6xDMn9AExz5NEJ/bHK02mMsIbL8KDvq3jYkatmjwaRZ
         QXBfPUc+P0r9FMKISaNOvkcOeObQbdLINQY74gymPIFEfciqgmVLWMlNx3kwQLvcFQCd
         z2YeP7aXhE9CSP7ggi2RhduQN7TakbnQ6EZltB9uOHeRJnAIb05mEh4WOI6RUCXMoi15
         7plc3/OIElWDTsZNXf7mLFVvUlC0Dwlec6b8dgkB5svX3P9WFxTIIS6L5djd0p02w8PB
         1PMg==
X-Gm-Message-State: AO0yUKWM7kTlUukdVIYSkoaSZ+V76xaFgo0E/b3lMz91Y5kQNheGkYE6
	QcoMy7Q5qK7IVIoiYdzMNXEMvnA2HhcxLA==
X-Google-Smtp-Source: AK7set8QswN+mb6qv57xD2wBNEn2vqUt11QmKyOt6AIwt7UXLi8yLG/uzze83w4vz325o0tfmi4AhQ==
X-Received: by 2002:a05:6871:892:b0:17a:d4f9:4c77 with SMTP id r18-20020a056871089200b0017ad4f94c77mr756912oaq.55.1679127666983;
        Sat, 18 Mar 2023 01:21:06 -0700 (PDT)
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com. [209.85.161.49])
        by smtp.gmail.com with ESMTPSA id aw8-20020a0568707f8800b001762d1bf6a9sm1577760oac.45.2023.03.18.01.21.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 18 Mar 2023 01:21:06 -0700 (PDT)
Received: by mail-oo1-f49.google.com with SMTP id h1-20020a4aa741000000b0053acdd3325bso17396oom.11;
        Sat, 18 Mar 2023 01:21:06 -0700 (PDT)
X-Received: by 2002:a5b:c47:0:b0:b56:1f24:7e9f with SMTP id
 d7-20020a5b0c47000000b00b561f247e9fmr897441ybr.12.1679127645593; Sat, 18 Mar
 2023 01:20:45 -0700 (PDT)
MIME-Version: 1.0
References: <20230317233623.3968172-1-robh@kernel.org>
In-Reply-To: <20230317233623.3968172-1-robh@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sat, 18 Mar 2023 09:20:34 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU8uu=2EZ1dmtY-eGj+ORGdepsKgpNcL7qKfW3FkVJw7g@mail.gmail.com>
Message-ID: <CAMuHMdU8uu=2EZ1dmtY-eGj+ORGdepsKgpNcL7qKfW3FkVJw7g@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: Drop unneeded quotes
To: Rob Herring <robh@kernel.org>
Cc: =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
	Manivannan Sadhasivam <mani@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>, 
	Damien Le Moal <damien.lemoal@wdc.com>, Charles Keepax <ckeepax@opensource.cirrus.com>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, Dong Aisheng <aisheng.dong@nxp.com>, 
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, 
	NXP Linux Team <linux-imx@nxp.com>, Sean Wang <sean.wang@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Andy Gross <agross@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Heiko Stuebner <heiko@sntech.de>, 
	Tomasz Figa <tomasz.figa@gmail.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Emil Renner Berthing <kernel@esmil.dk>, 
	Jianlong Huang <jianlong.huang@starfivetech.com>, Dvorkin Dmitry <dvorkin@tibbo.com>, 
	Wells Lu <wellslutw@gmail.com>, Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>, 
	Michal Simek <michal.simek@xilinx.com>, linux-arm-kernel@lists.infradead.org, 
	linux-actions@lists.infradead.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, asahi@lists.linux.dev, 
	linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, patches@opensource.cirrus.com, 
	alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230318_012110_831933_07C8148F 
X-CRM114-Status: GOOD (  15.61  )
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

On Sat, Mar 18, 2023 at 12:37=E2=80=AFAM Rob Herring <robh@kernel.org> wrot=
e:
>
> Cleanup bindings dropping unneeded quotes. Once all these are fixed,
> checking for this can be enabled in yamllint.
>
> Signed-off-by: Rob Herring <robh@kernel.org>

>  .../devicetree/bindings/pinctrl/renesas,pfc.yaml       |  2 +-
>  .../bindings/pinctrl/renesas,rza1-ports.yaml           |  2 +-
>  .../bindings/pinctrl/renesas,rza2-pinctrl.yaml         |  2 +-
>  .../bindings/pinctrl/renesas,rzg2l-pinctrl.yaml        |  2 +-
>  .../bindings/pinctrl/renesas,rzn1-pinctrl.yaml         |  2 +-
>  .../bindings/pinctrl/renesas,rzv2m-pinctrl.yaml        |  2 +-

Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

