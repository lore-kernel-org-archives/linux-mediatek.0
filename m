Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A94ACA0EDA
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Aug 2025 22:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HepA4l2VLL2ahLpWoV8gVaUs9oZFV/xKVn3GOH58US4=; b=kTMmyEp8Dj+tYXrLTCVcQGuYZQ
	OA725CIDHKPO7NQkgRT+bHOfg9A0Urtqe8KL1jt2TEn8fn+AeFHxtfQ2taoNhWFpLK3GaHEvRGVvF
	V2tFGkKr245vgFE/b7rDLcOhj8HUvKmZRJJlfbL9TIzwseUJrcOFZ6aqgHiBHJA9K9r6k0vvEAgmd
	tZn0QsFVwjqIMgaqQdUYA61fbCogwuG0ZE8TlSaxj16U0xUrUKbJxanlU7BE+VVjBN0qKI5FsmUf4
	nIVvAsPv3yFHX1sAAWgBLxLE1cHqTPLmtTGiMJ1LX6zq5W0IuZYUKdk8HKvAmz6cml8QZcHCpEUF8
	+JK5IU5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulaag-000000099K7-010U;
	Mon, 11 Aug 2025 22:02:02 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulUkL-00000008FvS-1w7Z;
	Mon, 11 Aug 2025 15:47:38 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-af93c3bac8fso641210966b.2;
        Mon, 11 Aug 2025 08:47:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754927256; x=1755532056; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=HepA4l2VLL2ahLpWoV8gVaUs9oZFV/xKVn3GOH58US4=;
        b=P3OBEAesmKK/AeAYSnKQDcMgTRLttj0Zq4jx1a7MEygMhBYhjUU01JdadFeTEEtFFF
         EuGdsn7rU5ybDb5tqcgmiMrHLZ53ihjFn3HhGldK1ImJISfEmh5+lpjerKRzzMxzba3M
         1CvZpJk7BM19XLEN3HvfiJxOEyDZMyBdhIERIstFchsNPY7HvLZz08zirDcwn4K5aOd5
         Hnjm3a8oT82jkbZ+/s8qGzwhu/vrW/6uaUcZOAuATPUg5AMGGkSkFCeU2jhbY+9CM3Aq
         2kA3S8z15WfgofWRQJ0DLWATUc+y15D+0KdQroFFhggmwkUm66M9jErVnEpYJBjNKkcG
         9Mdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754927256; x=1755532056;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HepA4l2VLL2ahLpWoV8gVaUs9oZFV/xKVn3GOH58US4=;
        b=XI0qxHJM8n7w6+QYiqf3xdUrzda+aCNJxMd+00NmiKKvZ8uci9AT52snSxPKEZgIzs
         A5sxAWHC1JS26zp1pU+r59rzb4zDET+8hxuAfbIoQ6Pg3mlxzqbGX3Pg/EtpguOMZYaN
         sKy9ESI69U2zbu03hONMneKxvKcLl7VM3noG2jCar58BoYvMq8bTGNDSKZ4NB2mWJ0ZT
         0n4AkFMiiri6qceTgKTbM/ZQgTnb/uta0KyS03RT7kZoC5iaatU7slIsmhYrmSJJzo4Z
         2XfjqgXbjGqaHEYOYk6FXvnv5SxiuzER5+bNKez4HLKYDspTC7i+GfMYsTMBCzxPXxu6
         n68Q==
X-Forwarded-Encrypted: i=1; AJvYcCUThfLbIE4OlSlrxzTCxbaXKBBqffYo0hmsUZl4WR6T2tbim3qP+my2sgrH9ZsDHEztRqk9Wnh/TYBHC4Z71SCSoQ==@lists.infradead.org, AJvYcCUWVxnrQG/1s/Q9WLgExv2cMVw4Cj3OE/3fa9aGKg/VfuP++8vSAcJdqDPr9dYJX7mKEMJrosP4PcVDqejlsp4=@lists.infradead.org, AJvYcCUsTT5jBiBrpb397Gu5mD3YEWFjCZ6PGuvHYQX0n1EiqxmjTZerm2uTMH49tmpd/UgpVtoE0o8+Dnw1rO5LN7o=@lists.infradead.org, AJvYcCVRpbNrciaypS0YUzpUIc3Dl/RJNm/v8YW3JIGAqx9y+OkX2t5R19VzZ5I4xdUe6uAk9MPcYA4l5sHKW4E=@lists.infradead.org, AJvYcCVltQOZSLIncHOKbAQpSYCli00l1jxTQ/CEylKSSkNgFb3wPWcEhYOv+TSBMOs+mEvpOp/mDD6XWgvk7e22@lists.infradead.org
X-Gm-Message-State: AOJu0YyhF+SUdrpYVrvrmtd0kOCRtMgCAkznvjSms35e6CK5YJWaK51+
	vz2HxPBxGh95U4hZGgPsdf8wibkImCGPYm6ewhBF/gST9mfhwGQo1RA4
X-Gm-Gg: ASbGncs4iCn3br6bUa5hGwwnzuC/LUFiO2LP3PvIFlhTxDBcKfc/Xxq8V827hKPJpFL
	XAdunqX4IYKq5dXG2O0UQjtKvEzKNjDxr/BkX7XCB/18LDQsvdi8fqkPk0BPWFeAHiYfppyZ8rS
	DVrlogbiMmsvyHLcI5K3hJcYysQNoKo1Dw+pTU+FJEEPujCqaaqIQ0XjQcrQhiuIeMQS6h/abEw
	DrRlkxVFkvaBFmaGQgd+SHpsIa96i+doGqDRgI2tl+pD4LiGpeGOf4R5LDyGI5Q94dTbb3QjwUe
	bbVQ+uKPtMrQ9ib1zwAi8jWLn80hOyVJJDzUGk5L4FIMhKtfJE1bUFPWj/hL1WSBPwXi5dOzK3T
	70z7aRtGL74+YJsfbgIcO2VqxdeeZgPIkLN9zkek=
X-Google-Smtp-Source: AGHT+IF0QNexCp3wac3HqRrzYFcQwTmRLRgzyDHjNrtoHTrtc/DjgfXz7LJ4ALK6NtSRdUvSvS+HtQ==
X-Received: by 2002:a17:906:9f91:b0:af9:7823:620b with SMTP id a640c23a62f3a-af9c6517c2cmr1234169966b.44.1754927255767;
        Mon, 11 Aug 2025 08:47:35 -0700 (PDT)
Received: from giga-mm.home ([2a02:1210:8642:2b00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a076409sm2048822966b.12.2025.08.11.08.47.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 08:47:35 -0700 (PDT)
Message-ID: <597d4a777a13c2b67effaf5ba32959710d2f58f8.camel@gmail.com>
Subject: Re: [PATCH 047/114] clk: sophgo: cv18xx-ip: convert from
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
Date: Mon, 11 Aug 2025 17:47:31 +0200
In-Reply-To: <20250811-clk-for-stephen-round-rate-v1-47-b3bf97b038dc@redhat.com>
References: <20250811-clk-for-stephen-round-rate-v1-0-b3bf97b038dc@redhat.com>
	 <20250811-clk-for-stephen-round-rate-v1-47-b3bf97b038dc@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_084737_503892_27734A6A 
X-CRM114-Status: GOOD (  16.63  )
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

Reviewed-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>

> ---
> =C2=A0drivers/clk/sophgo/clk-cv18xx-ip.c | 10 ++++++----
> =C2=A01 file changed, 6 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/clk/sophgo/clk-cv18xx-ip.c b/drivers/clk/sophgo/clk-=
cv18xx-ip.c
> index b186e64d4813e2701b17520e544c453fc13d0e77..c2b58faf0938b7d537dc3a81a=
ef59c549b9c9c79 100644
> --- a/drivers/clk/sophgo/clk-cv18xx-ip.c
> +++ b/drivers/clk/sophgo/clk-cv18xx-ip.c
> @@ -45,10 +45,12 @@ static unsigned long gate_recalc_rate(struct clk_hw *=
hw,
> =C2=A0	return parent_rate;
> =C2=A0}
> =C2=A0
> -static long gate_round_rate(struct clk_hw *hw, unsigned long rate,
> -			=C2=A0=C2=A0=C2=A0 unsigned long *parent_rate)
> +static int gate_determine_rate(struct clk_hw *hw,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct clk_rate_request *req)
> =C2=A0{
> -	return *parent_rate;
> +	req->rate =3D req->best_parent_rate;
> +
> +	return 0;
> =C2=A0}
> =C2=A0
> =C2=A0static int gate_set_rate(struct clk_hw *hw, unsigned long rate,
> @@ -63,7 +65,7 @@ const struct clk_ops cv1800_clk_gate_ops =3D {
> =C2=A0	.is_enabled =3D gate_is_enabled,
> =C2=A0
> =C2=A0	.recalc_rate =3D gate_recalc_rate,
> -	.round_rate =3D gate_round_rate,
> +	.determine_rate =3D gate_determine_rate,
> =C2=A0	.set_rate =3D gate_set_rate,
> =C2=A0};

--=20
Alexander Sverdlin.

