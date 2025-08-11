Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17DCFCA0EC4
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Aug 2025 22:02:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0XIy5fUomSBPaFsng7WEyeMEK8C2loF9IYDTwEHeIQg=; b=aOKw9GfycTfZb2H59tAT3Iwxgy
	Wp39NCweNknneFDPoOtSpR3+APhIx6yYdpuu61h/lR5ssw3R5l46eqw1lp+2wlBQn+rWUcYvNTIXG
	bsQarKsQVA99I7PaXazfHtY/wCvxaDey/Wj3UMTyMDxHy+M9Q1Sum2l5kAmVacguYE8KfGwuJ1PKd
	x5kCyU0YoopfOhg5CFjfZlL4WHCqIkJE7GDZNtGas7IYNIFb8qzYp7BSeHhP+6y1u63EnKpzXs3UR
	iyOJzKi7Pl9uTj7ftpAhdyBCPgnDCeTMYQ9OtPhZXvqv7QJNJUkkouliJJmJp+600tlVIskrh9ct1
	oGHqKFow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulaad-000000099FG-432f;
	Mon, 11 Aug 2025 22:01:59 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulUip-00000008Fgv-2zwG;
	Mon, 11 Aug 2025 15:46:04 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-6180b9e4e74so4216446a12.2;
        Mon, 11 Aug 2025 08:46:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754927162; x=1755531962; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0XIy5fUomSBPaFsng7WEyeMEK8C2loF9IYDTwEHeIQg=;
        b=MnYY+41GSK6v45q93muDG2a+PinBtAv/IeS7atZ3ZvzLjtNvkskaHy6XWeHppYanFx
         h1IKzgDzlxNl5wFWJf0LSyNhc+lpeMVSkZR6Kk/mrECQ6SIuKtSoy3UFKf3t0lth77W3
         +aFebRwmdIzqfIE9H9WL1qhSTRyBIkyfCJrCGgto5zggdXugFij2HhFRbrHepuyfeNMa
         VV/pDMIzw9jXPkAuj5pfexaQhIg5vrUW6hEPx9oSr9sNzDKn6FOoiBOzRzIHbIhPPILu
         EAKA0snSfyVtJnkwRFAXF+3s2ChR8l8+NYQBxUwS8V1m4eSVlJ/EUbLgqitVTCHLIX90
         IGPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754927162; x=1755531962;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0XIy5fUomSBPaFsng7WEyeMEK8C2loF9IYDTwEHeIQg=;
        b=nrpdTcY3dOL2WOUU8vjlPJBeWPtIEa1faB1QQCLo5oPbx6b/FB3ZYK6RroxfQv4Abw
         QsW6QJu6rIXsmsJsyQzoAqeEArldbK2tfsKG5FvqW9jIlfQlzMYGTnTSQwIqsrvGK/rc
         GUx4ZmqBp9d9amvp5n52xqPz5+KibMUMhaHplvymTjzYWlu0e6ASQ1FmOksyGqGDviR6
         Aidt0d6IP+SNGpp4sAaVda4MhOZeiGioEgSv93e/PYwEQwHs06pcf3X5qs8NSKD5xU4C
         UOZLwOft390rqVUZhDq5xtUKtWe4HlGTv+XCQ5buMJD2fBp8hrORWjvxk48PaO+u0uKh
         cFTg==
X-Forwarded-Encrypted: i=1; AJvYcCUK0QR2Y2Q0LwWhoZgvPkwiVhoWlb6PLik76IM7KZXYDqIgzkFekt45CpYgodpLaIMP7XLtvcmieSUje+9B@lists.infradead.org, AJvYcCUg125Lds7AJQyQPCWcrnSdny0t7OMtyMlIFYDkH4uJXK6bz1cYkBT2e3BYvAGgJ0uDN1OJKDZL4J2vYaOPjx8ufA==@lists.infradead.org, AJvYcCWM8VLTudSZS/CiU61uDhQS92+TtmWXr2ibdz44O2LTwGv5i1xlX9B/e33UNivfAkvttqd95pS765wAgOW+UdM=@lists.infradead.org, AJvYcCWxSt+WkbfP2/ON5l5MkUskere8DsaTpDxgt7zdYVmfuKTvht6veGTozifHi9cm3h4M7a5xSGacUmcAsCyeP1o=@lists.infradead.org, AJvYcCXF+Mn+AQ9g3OYnegsvEucxjKR37UHd8Yf+61cqnmm2f2XBSN9TPlJ6V8ZaUpvDmXM+yJs5CV11TKFUWa0=@lists.infradead.org
X-Gm-Message-State: AOJu0YwvPlKsYKwiVuStkLNW/znaC80jiGjQZQHeBd81jM0tEzXgGU73
	iuMMAHyw32nANEIWTEo5LWZ2YtR2LeSTj58UMx7E7iAGOK22uyga+74a
X-Gm-Gg: ASbGncu7zGUc0b4q3ocGpxR+8IJqtOQTE2Elm0xDuuUr2vErLBWBZ1kZlJhoo5yp2qH
	P0LbJ1+z+wRCqrON+C3vGz6XttrxgDTgkIX6bIuXeerk8WiL6l2NGaYHk3jYSEOASIR9CY6lGJB
	h5efLrqcvsNMEj58VtTpbDrMgQ/KsheKkvNpNH/cb/RffP8rDdc3CYKcfiJfI/GyXBUWsfapDCb
	qmwh4kwd5ti4fB88kcuR6Sw90o1MbaQZksIM2zDorfmYGEQwEamOl2ZESieD+6YBaN92R7wFUSv
	j72oUcgxyJzLUvN+QPgVX11Acvxwa4YC1tKZsc+jyUvWHD0p+zDTEYNc4o+Ge6uwy75SOvG0ESQ
	0XrMZcZoPbAsEUHXM8e8b0yiDlKhqLBndMFkL138=
X-Google-Smtp-Source: AGHT+IGKOhTznscGhTdRt3W/yuNZg42+gjVjgTXKMoiUalIdY18fOpSzUHq5EIPnFUdAaOuOrYQZJA==
X-Received: by 2002:a05:6402:2106:b0:615:5353:5e2c with SMTP id 4fb4d7f45d1cf-617e2e5311dmr11886624a12.19.1754927161809;
        Mon, 11 Aug 2025 08:46:01 -0700 (PDT)
Received: from giga-mm.home ([2a02:1210:8642:2b00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-615a8f25739sm18957452a12.21.2025.08.11.08.45.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 08:46:01 -0700 (PDT)
Message-ID: <9379f132e52c972b2735cad768242cb784b0ed2b.camel@gmail.com>
Subject: Re: [PATCH 048/114] clk: sophgo: sg2042-clkgen: convert from
 round_rate() to determine_rate()
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: bmasney@redhat.com, Michael Turquette <mturquette@baylibre.com>, Stephen
 Boyd <sboyd@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>, Cristian
 Marussi	 <cristian.marussi@arm.com>, Chen Wang <unicorn_wang@outlook.com>,
 Inochi Amaoto	 <inochiama@gmail.com>, Nicolas Ferre
 <nicolas.ferre@microchip.com>,  Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Paul Cercueil	 <paul@crapouillou.net>, Keguang Zhang
 <keguang.zhang@gmail.com>, Taichi Sugaya	 <sugaya.taichi@socionext.com>,
 Takao Orito <orito.takao@socionext.com>,  Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team	
 <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Jacky Huang	
 <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, Vladimir
 Zapolskiy	 <vz@mleia.com>, Piotr Wojtaszczyk
 <piotr.wojtaszczyk@timesys.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Samuel Holland <samuel.holland@sifive.com>, Yixun Lan	 <dlan@gentoo.org>,
 Steen Hegelund <Steen.Hegelund@microchip.com>, Daniel Machon	
 <daniel.machon@microchip.com>, UNGLinuxDriver@microchip.com, Orson Zhai	
 <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan
 Zhang <zhang.lyra@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue	 <alexandre.torgue@foss.st.com>, Michal Simek
 <michal.simek@amd.com>, Maxime Ripard <mripard@kernel.org>, Andreas
 =?ISO-8859-1?Q?F=E4rber?= <afaerber@suse.de>,  Manivannan Sadhasivam	
 <mani@kernel.org>, Sven Peter <sven@kernel.org>, Janne Grunau
 <j@jannau.net>,  Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa
 <neal@gompa.dev>, Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,  Ray Jui
 <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Broadcom
 internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Max
 Filippov <jcmvbkbc@gmail.com>, Matthias Brugger	 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno	 <angelogioacchino.delregno@collabora.com>,
 Daniel Palmer <daniel@thingy.jp>,  Romain Perier <romain.perier@gmail.com>,
 Andrew Lunn <andrew@lunn.ch>, Gregory Clement	
 <gregory.clement@bootlin.com>, Sebastian Hesselbarth	
 <sebastian.hesselbarth@gmail.com>, Bjorn Andersson <andersson@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, Heiko Stuebner
 <heiko@sntech.de>, Andrea della Porta <andrea.porta@suse.com>,  Krzysztof
 Kozlowski	 <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi	 <cw00.choi@samsung.com>, Alim Akhtar
 <alim.akhtar@samsung.com>, Qin Jian	 <qinjian@cqplus1.com>, Viresh Kumar
 <vireshk@kernel.org>, Ulf Hansson	 <ulf.hansson@linaro.org>, Luca Ceresoli
 <luca.ceresoli@bootlin.com>, Alex Helms	 <alexander.helms.jy@renesas.com>,
 Linus Walleij <linus.walleij@linaro.org>,  Liviu Dudau
 <liviu.dudau@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, Nobuhiro
 Iwamatsu	 <nobuhiro1.iwamatsu@toshiba.co.jp>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	sophgo@lists.linux.dev, linux-mips@vger.kernel.org, imx@lists.linux.dev, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-stm32@st-md-mailman.stormreply.com, patches@opensource.cirrus.com, 
	linux-actions@lists.infradead.org, asahi@lists.linux.dev, 
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, soc@lists.linux.dev
Date: Mon, 11 Aug 2025 17:45:57 +0200
In-Reply-To: <20250811-clk-for-stephen-round-rate-v1-48-b3bf97b038dc@redhat.com>
References: <20250811-clk-for-stephen-round-rate-v1-0-b3bf97b038dc@redhat.com>
	 <20250811-clk-for-stephen-round-rate-v1-48-b3bf97b038dc@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_084603_764073_E34E4CB2 
X-CRM114-Status: GOOD (  17.35  )
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

On Mon, 2025-08-11 at 11:18 -0400, Brian Masney via B4 Relay wrote:
> From: Brian Masney <bmasney@redhat.com>
>=20
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series.
>=20
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---
> =C2=A0drivers/clk/sophgo/clk-sg2042-clkgen.c | 17 +++++++++--------
> =C2=A01 file changed, 9 insertions(+), 8 deletions(-)
>=20
> diff --git a/drivers/clk/sophgo/clk-sg2042-clkgen.c b/drivers/clk/sophgo/=
clk-sg2042-clkgen.c
> index 9e61288d34f3757315702c355f2669577b29676f..1d3b1656bcf2e6655e0299e68=
ab39f32189744dc 100644
> --- a/drivers/clk/sophgo/clk-sg2042-clkgen.c
> +++ b/drivers/clk/sophgo/clk-sg2042-clkgen.c
> @@ -176,9 +176,8 @@ static unsigned long sg2042_clk_divider_recalc_rate(s=
truct clk_hw *hw,
> =C2=A0	return ret_rate;
> =C2=A0}
> =C2=A0
> -static long sg2042_clk_divider_round_rate(struct clk_hw *hw,
> -					=C2=A0 unsigned long rate,
> -					=C2=A0 unsigned long *prate)
> +static int sg2042_clk_divider_determine_rate(struct clk_hw *hw,
> +					=C2=A0=C2=A0=C2=A0=C2=A0 struct clk_rate_request *req)
> =C2=A0{
> =C2=A0	struct sg2042_divider_clock *divider =3D to_sg2042_clk_divider(hw)=
;
> =C2=A0	unsigned long ret_rate;
> @@ -192,15 +191,17 @@ static long sg2042_clk_divider_round_rate(struct cl=
k_hw *hw,
> =C2=A0			bestdiv =3D readl(divider->reg) >> divider->shift;
> =C2=A0			bestdiv &=3D clk_div_mask(divider->width);
> =C2=A0		}
> -		ret_rate =3D DIV_ROUND_UP_ULL((u64)*prate, bestdiv);
> +		ret_rate =3D DIV_ROUND_UP_ULL((u64)*&req->best_parent_rate, bestdiv);
                                                 ^^
May "*&" be redundand?


> =C2=A0	} else {
> -		ret_rate =3D divider_round_rate(hw, rate, prate, NULL,
> +		ret_rate =3D divider_round_rate(hw, req->rate, &req->best_parent_rate,=
 NULL,
> =C2=A0					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 divider->width, divider->div_fl=
ags);
> =C2=A0	}
> =C2=A0
> =C2=A0	pr_debug("--> %s: divider_round_rate: val =3D %ld\n",
> =C2=A0		 clk_hw_get_name(hw), ret_rate);
> -	return ret_rate;
> +	req->rate =3D ret_rate;
> +
> +	return 0;
> =C2=A0}
> =C2=A0
> =C2=A0static int sg2042_clk_divider_set_rate(struct clk_hw *hw,
> @@ -258,13 +259,13 @@ static int sg2042_clk_divider_set_rate(struct clk_h=
w *hw,
> =C2=A0
> =C2=A0static const struct clk_ops sg2042_clk_divider_ops =3D {
> =C2=A0	.recalc_rate =3D sg2042_clk_divider_recalc_rate,
> -	.round_rate =3D sg2042_clk_divider_round_rate,
> +	.determine_rate =3D sg2042_clk_divider_determine_rate,
> =C2=A0	.set_rate =3D sg2042_clk_divider_set_rate,
> =C2=A0};
> =C2=A0
> =C2=A0static const struct clk_ops sg2042_clk_divider_ro_ops =3D {
> =C2=A0	.recalc_rate =3D sg2042_clk_divider_recalc_rate,
> -	.round_rate =3D sg2042_clk_divider_round_rate,
> +	.determine_rate =3D sg2042_clk_divider_determine_rate,
> =C2=A0};

--=20
Alexander Sverdlin.

