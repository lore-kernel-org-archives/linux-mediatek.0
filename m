Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7568FC25B75
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 May 2024 11:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z24B9qDTJHEobEGC/70CrM/eVAoUVzOxiy7onUzGbVU=; b=bcc7d3fckRtPKM9oyx7NMMj5VF
	hCYfnm8GZU/Xbf5QpWy6Oo04rBLXH8jNZkZ2LPBQi1iJY90B1Ju+FVPWQAlIUqknXvHs9cdDB80qV
	SbHSpzaDtg8yG1aI3/uqusTBYIth9fDrI7o2p1P2MLIllRJkp/UsViwOQtAweWc22Ehg6l2oBlOqI
	gOv6OsbIM/cOX/2TelEICtDZ2y/8w3SJ3ARKSXO8nRjG1adwsvg8GpBwoII568hvksD5Q8XzDVPjZ
	R0JzoTX9nTeVfwc3gOYxtWWtVnxCys4NzlsnIDbGjnuGhmx/Ptt/zr44t89pu5X8ubxxLxjE+T2D8
	oQ/pw66A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6ULL-0000000Cjxv-1ios;
	Mon, 13 May 2024 11:59:47 +0000
Received: from mail-pl1-f178.google.com ([209.85.214.178])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6ULF-0000000Cjvu-1Jkl;
	Mon, 13 May 2024 11:59:42 +0000
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1edfc57ac0cso33381035ad.3;
        Mon, 13 May 2024 04:59:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715601578; x=1716206378;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z24B9qDTJHEobEGC/70CrM/eVAoUVzOxiy7onUzGbVU=;
        b=Rhj2lXhx7vJVZrV1V8BXTCARgJlJd85lI36XLK5u2j+dZCHp3DScvCz36erGFdloJo
         7ZHpt2eminhWseDdIdCwjqdXuIKNxB/XzqZKJGrBgcOAddH7GGUiMbosKoM5lJ9xh8Bs
         TGpzn0VIsA7E0QsSTFsxDAnp5xye7NC6LNRjOY564+ChZ40lwIl88JE4t+NXLQO6JeiA
         GJyKbn3KcEirjXuPy478RDjjNYpxLIBL8ksGQJh9iVdsru/tPZSzmCKRHch4auR0PzP+
         mmBWI9oKA6G5sqmVpLbTh8x5xoIp1K7IA3u9rV+uo+XNRje7z7AnVi+Xt90KmTNHzvBf
         asiQ==
X-Forwarded-Encrypted: i=1; AJvYcCVvpw912xGgUfR/Vodp/2zFV/HVsq72hSqtejTu/zQ/eDPBIxanMKEroSxivUMn/9/N8wZLLCXzhs8QGdNG+5LO57HOYb5xdqO6Kse1yfzYo5VAvSxn+30YrdLyHZ3bztl37owjxmg8/bZCvUo+HJVUOBQuNVqdsHSfr361g2vTCqxY4CNqhuwyje2ew0n1GMicH+TqYzE8TnWeaUqGYPfNr9NCOn3wP+TL/d+UR2rKRD4eojIYj7FNMNFB94Y=
X-Gm-Message-State: AOJu0YyzKTy35Er2+QMWnCfWnLuFivgWaFi7uyGDXwOL+1iwvcEcOGqR
	fj/+8fGC9IAR8MhoZPHWbNeDd8UZ0p0B0ZkCyZ60bvqJ1DHSY5Dbux6ZPiL4
X-Google-Smtp-Source: AGHT+IHRsIcqCnz9va1XDqS6tYIDVAPAzFjXjfMzw3777MYj1rgFChB6xIp3H/4MihleudIArUTeQQ==
X-Received: by 2002:a17:902:784e:b0:1eb:3daf:ebaf with SMTP id d9443c01a7336-1ef4404a932mr87857785ad.57.1715601578543;
        Mon, 13 May 2024 04:59:38 -0700 (PDT)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com. [209.85.215.180])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0bad6176sm78116325ad.76.2024.05.13.04.59.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 May 2024 04:59:38 -0700 (PDT)
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-5f80aa2d4a3so3330161a12.0;
        Mon, 13 May 2024 04:59:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX+cJqJM1Z5k20d1afQy95NOQA0BCVFR2l6SGV58VpjZyQBlsLaIfpOCsLTgRgNJlQ8uMjPxYFFAvWqCbYklHaQH8Fsk40FR6oZLknD3ybGD4u35O+FuTcyER850JyA/u4WKdtBAuH9d0XIu5mNquD9HWCKDNtB80lPMKBSsqFDZU8q0v6Ps8Lm6Y8SZN+g62+sdQaZDI3rzHEHV5B8j3QIzqik0KGlSh3vvWa7RXHeI6LD+vv/h4WEy+A9p4w=
X-Received: by 2002:a25:d048:0:b0:dcd:551f:1e2 with SMTP id
 3f1490d57ef6-dee4f3694bbmr8978126276.34.1715601555547; Mon, 13 May 2024
 04:59:15 -0700 (PDT)
MIME-Version: 1.0
References: <20240504-pinctrl-cleanup-v2-0-26c5f2dc1181@nxp.com> <20240504-pinctrl-cleanup-v2-7-26c5f2dc1181@nxp.com>
In-Reply-To: <20240504-pinctrl-cleanup-v2-7-26c5f2dc1181@nxp.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 13 May 2024 13:59:03 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUD=1rpns_mLF2rMM-x5EnOK7TExaJxoJVkbXjVz1H8uQ@mail.gmail.com>
Message-ID: <CAMuHMdUD=1rpns_mLF2rMM-x5EnOK7TExaJxoJVkbXjVz1H8uQ@mail.gmail.com>
Subject: Re: [PATCH v2 07/20] pinctrl: renesas: Use scope based of_node_put() cleanups
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Dvorkin Dmitry <dvorkin@tibbo.com>, Wells Lu <wellslutw@gmail.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Emil Renner Berthing <kernel@esmil.dk>, Jianlong Huang <jianlong.huang@starfivetech.com>, 
	Hal Feng <hal.feng@starfivetech.com>, Orson Zhai <orsonzhai@gmail.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Viresh Kumar <vireshk@kernel.org>, Shiraz Hashim <shiraz.linux.kernel@gmail.com>, soc@kernel.org, 
	Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Patrice Chotard <patrice.chotard@foss.st.com>, Heiko Stuebner <heiko@sntech.de>, 
	Damien Le Moal <dlemoal@kernel.org>, Ludovic Desroches <ludovic.desroches@microchip.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
	Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Chester Lin <chester62515@gmail.com>, 
	Matthias Brugger <mbrugger@suse.com>, Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>, 
	Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Joel Stanley <joel@jms.id.au>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Tony Lindgren <tony@atomide.com>, Stephen Warren <swarren@wwwdotorg.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-samsung-soc@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	imx@lists.linux.dev, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, 
	Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240513_045941_383599_603A13DD 
X-CRM114-Status: GOOD (  17.47  )
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

Hi Peng,

On Sat, May 4, 2024 at 3:14=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.nxp.com=
> wrote:
> From: Peng Fan <peng.fan@nxp.com>
>
> Use scope based of_node_put() cleanup to simplify code.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Thanks for your patch!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/drivers/pinctrl/renesas/pinctrl-rzn1.c
> +++ b/drivers/pinctrl/renesas/pinctrl-rzn1.c

You missed one trivial conversion, presumably because no error handling
and thus no of_node_put() is involved?

@@ -737,13 +737,12 @@ static int rzn1_pinctrl_parse_groups(struct
device_node *np,

 static int rzn1_pinctrl_count_function_groups(struct device_node *np)
 {
-       struct device_node *child;
        int count =3D 0;

        if (of_property_count_u32_elems(np, RZN1_PINS_PROP) > 0)
                count++;

-       for_each_child_of_node(np, child) {
+       for_each_child_of_node_scoped(np, child) {
                if (of_property_count_u32_elems(child, RZN1_PINS_PROP) > 0)
                        count++;
        }

If you prefer not to include this, I will send a small patch myself later.

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

