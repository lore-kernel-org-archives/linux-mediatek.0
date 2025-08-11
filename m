Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97AF3CA0ED1
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Aug 2025 18:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qD3PnaCJHe7CAGf98jDIpzJE6HGS8eh/nvSCm5VXAxc=; b=Ct680r3Cld9tpH4V7fg9QA/6tZ
	zvmpwi4K3flw+CIgKeCLRUkgPUC1wxtRadNcRLevIxx6yQGTzXO6VGalErG65kusoaVoJjWuYW3GG
	N3ZzSeGuWgjAnx/1JVAKIaGfanKUUrZIBAkGQOU1FXIgJ6CXz2ty5tb4z8j9H7HLoiG/7ZEnhKx3X
	nlNtHu2+PaZfvObXEpp+RfWhvSTHXUAIAG78K0F17qpNj8YOoAAjLhm+HEO6Fye+mUnQ3vaRnK4Mq
	SnqFjE0tN1r8FK9d7EjOosK7PUwCaD+/GZHeo7gWjDBQBa/C4wyoUyjVUhxvEO1NKexDs9lbiFysx
	gIB3eKOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulXNd-00000008ntv-2cUl;
	Mon, 11 Aug 2025 18:36:21 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulUbp-00000008E9g-2nze;
	Mon, 11 Aug 2025 15:38:50 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-af93381a1d2so726758366b.3;
        Mon, 11 Aug 2025 08:38:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754926728; x=1755531528; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qD3PnaCJHe7CAGf98jDIpzJE6HGS8eh/nvSCm5VXAxc=;
        b=fhoAf4Pr7QA/YO6wqWh8rb2wQUPOZT6h8rpWpV3LJk241HcSvl7Jx7+WKOKVq+a/SW
         ZwKz7PMf8dbYSIe6XuUgNCMsTIxt38LYyxqCWorcU5OxhTYzz/6Qtt0iqi8j6uDKgtRb
         Z0UzE6Hd9JzndBPl7vhoPKc59uhBBwMcJ00FcXcxgd/M/3V6tYgxzsvx8jSeKeReWNKy
         vhg0A+UpQOlVk4WLIQMRwEbWU18csBfyyU2Uo6X8frAsZ+13/MncgVTPNY5897ElYBU0
         THawwmwaeGhJcw8EDkvvWDBiz+T90TEVgn8pp0ZL2wuMjNEV9FgS0rQyu2Bnnr+yNBpC
         Rypg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754926728; x=1755531528;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qD3PnaCJHe7CAGf98jDIpzJE6HGS8eh/nvSCm5VXAxc=;
        b=otgyud60/gRaWx9zPL7YewcktVtfhwMyxJknqUo2HZA8GX6WOgHZQKV2owM162oKWg
         kIsS2s7S5nAeiRoT4HhqUx8BfT0tmV+6BJghli62KIzP+aVqVWqF5NSOcA2cWVdE3QDu
         oIpeX8T4rXgIVBE3l6y37utjNt1LPxqDDYnNI8up8kav+XZgZvPTB+FM9PRWh5J2Loww
         /aY8s5ZceyWwEy67c6yTWWXSq1VLw57k2R+kg+bsp26EROj4nLbIJzu3kyqxsCS1UUsU
         Wl1dmdICCyhTfJHQUxQDc0/2hX/6x8TB9BpgY2TIwD+UAMxe3zpACyYyqzGw0IOgtnOE
         SNrg==
X-Forwarded-Encrypted: i=1; AJvYcCU6RFWFaUuvA6gGKgkTX7fMphlZve4RNN+EUhsga9Bwet41DYowwHR2l9AKPnj2DWQ/wgRcUVrLumckkepN1K8=@lists.infradead.org, AJvYcCUHkcHB/ymwSoXo7aSa1g1HeMDrQMtjgZGp8KZv/sB4pmbqK4Fvlc7eS9c3K6bnVAfYqGdFHudc9wKZVRBNY5tEmg==@lists.infradead.org, AJvYcCUiP/yEiAx/DRXrZpI+2BQH+rL59wprNCgYO0dabkFbZxwU+RN6H1djT6Nv0uninsdI3Wagz5Mji6MyA/0=@lists.infradead.org, AJvYcCW8pAOygQa5WwIRxMVnKhEAQ/jCctR0dd/AJxINNHX/F6hSY3sTmOhWRT4RsXh0Ow7CIu77UyLds09sB39j@lists.infradead.org, AJvYcCXliUNHG5/ajC8ChlefR8QDVuIWUjj5U60c399oBi4ONcHBRKhSqjgNkRBTeRoZAb6X+2wViO0Itz2Njd20RyI=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5DMxVvMzXJVHV5BPVgEnwNHHvnxHqwmy3R8hZ9nhBDZvoVgIA
	Kz6INy13LBVeKIDmMKDDR5TPneP2PBe2kGR3lth6xQhgq2kMnIRjpDyg
X-Gm-Gg: ASbGnct6zH5NOcuMyAvDYNcO6OFkeLxSa3JgY79X5nVv2EVLJX9X4S82mZDw8IGxVar
	MDzK+pM8QH5DZkcdSqMSwjeHwEVJ/adFHuW9JRsEawAYq21bUMNvrokiUf6a3LK2BdD25wfOfGL
	zNosvIb+VON/kJG8HxzJBFGo5i7BpFqmO/nsQZlEwteFoKqIQ8X1p3JwDdXdlsj6cDpy7ot5f1m
	rl3Y/WAwAX5o719udV31GZpTYbzPjhNEuGq6tQAtrORVygCr11+X7xHDk3TBR1IWywnqDtLOaus
	PTleheMAGoCw8foyMRbvFF6DIw1CdGJRtQcmtbryiafDACwtdbdFSujbTBy37L0ReQehva74bTP
	rZgSNU+stwb4gsRHr/G9/dI1c9fW+wYMOL6J2c1s=
X-Google-Smtp-Source: AGHT+IEwAIMMmXMguO85CuFME8BHuByHpdLqU2yJrGASpVc+AuhN3x1kaE4ymuvmmSr6MxnWK7LVvA==
X-Received: by 2002:a17:906:b07:b0:afa:1453:6632 with SMTP id a640c23a62f3a-afa14536b03mr150166866b.50.1754926727869;
        Mon, 11 Aug 2025 08:38:47 -0700 (PDT)
Received: from giga-mm.home ([2a02:1210:8642:2b00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a21c157sm2047222366b.100.2025.08.11.08.38.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 08:38:47 -0700 (PDT)
Message-ID: <09635747dcd29f45a90dd33a74a9902d7bfa9649.camel@gmail.com>
Subject: Re: [PATCH 112/114] clk: scmi: remove round_rate() in favor of
 determine_rate()
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
Date: Mon, 11 Aug 2025 17:38:43 +0200
In-Reply-To: <20250811-clk-for-stephen-round-rate-v1-112-b3bf97b038dc@redhat.com>
References: <20250811-clk-for-stephen-round-rate-v1-0-b3bf97b038dc@redhat.com>
	 <20250811-clk-for-stephen-round-rate-v1-112-b3bf97b038dc@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_083849_708557_683B6EBF 
X-CRM114-Status: GOOD (  20.36  )
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

On Mon, 2025-08-11 at 11:19 -0400, Brian Masney via B4 Relay wrote:
> From: Brian Masney <bmasney@redhat.com>
>=20
> This driver implements both the determine_rate() and round_rate() clk
> ops, and the round_rate() clk ops is deprecated. When both are defined,
> clk_core_determine_round_nolock() from the clk core will only use the
> determine_rate() clk ops, so let's remove the round_rate() clk ops since
> it's unused.
>=20
> Signed-off-by: Brian Masney <bmasney@redhat.com>

Reviewed-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>

> ---
> =C2=A0drivers/clk/clk-scmi.c | 30 ------------------------------
> =C2=A01 file changed, 30 deletions(-)
>=20
> diff --git a/drivers/clk/clk-scmi.c b/drivers/clk/clk-scmi.c
> index d2408403283fc72f0cf902e65f4c08bcbc7b4b0b..6c6ddb92e7cf6a0cfac2c7e19=
c0f15f777bb8c51 100644
> --- a/drivers/clk/clk-scmi.c
> +++ b/drivers/clk/clk-scmi.c
> @@ -54,35 +54,6 @@ static unsigned long scmi_clk_recalc_rate(struct clk_h=
w *hw,
> =C2=A0	return rate;
> =C2=A0}
> =C2=A0
> -static long scmi_clk_round_rate(struct clk_hw *hw, unsigned long rate,
> -				unsigned long *parent_rate)
> -{
> -	u64 fmin, fmax, ftmp;
> -	struct scmi_clk *clk =3D to_scmi_clk(hw);
> -
> -	/*
> -	 * We can't figure out what rate it will be, so just return the
> -	 * rate back to the caller. scmi_clk_recalc_rate() will be called
> -	 * after the rate is set and we'll know what rate the clock is
> -	 * running at then.
> -	 */
> -	if (clk->info->rate_discrete)
> -		return rate;
> -
> -	fmin =3D clk->info->range.min_rate;
> -	fmax =3D clk->info->range.max_rate;
> -	if (rate <=3D fmin)
> -		return fmin;
> -	else if (rate >=3D fmax)
> -		return fmax;
> -
> -	ftmp =3D rate - fmin;
> -	ftmp +=3D clk->info->range.step_size - 1; /* to round up */
> -	do_div(ftmp, clk->info->range.step_size);
> -
> -	return ftmp * clk->info->range.step_size + fmin;
> -}
> -
> =C2=A0static int scmi_clk_set_rate(struct clk_hw *hw, unsigned long rate,
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long parent_rate)
> =C2=A0{
> @@ -300,7 +271,6 @@ scmi_clk_ops_alloc(struct device *dev, unsigned long =
feats_key)
> =C2=A0
> =C2=A0	/* Rate ops */
> =C2=A0	ops->recalc_rate =3D scmi_clk_recalc_rate;
> -	ops->round_rate =3D scmi_clk_round_rate;
> =C2=A0	ops->determine_rate =3D scmi_clk_determine_rate;
> =C2=A0	if (feats_key & BIT(SCMI_CLK_RATE_CTRL_SUPPORTED))
> =C2=A0		ops->set_rate =3D scmi_clk_set_rate;

--=20
Alexander Sverdlin.

