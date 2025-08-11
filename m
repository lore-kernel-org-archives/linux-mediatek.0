Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 705DDCA0EC4
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Aug 2025 18:44:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cmIrlL5AjQp5OrtEkcw9eDi4LGiI7a6CtQnHd0I7Fpk=; b=ZRk/E4clM2YuPzsO2CLlPg3zPS
	Sn/T5ULPPTHmZbsSmtSHvr4c/lmdO/ySX8sxMjLwVQTmSBvkVNHTYbXhctu1Jb6T/8aE9+/b3bgyY
	YH5+d4xsFPfA9vqgGf8T6iTKN9jg4I+/c5wSy8lhsLSoAKhPQj2Mw04EiUYFaRQQiI4Xx0/OzLbXF
	NYplvMK5HICgvq1doJGrWxtMaLitvN77c9IxDjzZj7Ohgfi98UJXios/EytaJEry9p2tOu8NNoIG1
	LiTI72KJ6aYDhQyHTimLJN2gzIPHX5b7kYOjUkz11L31eGiUeIn9BDgIaYI8gFyi562j3Vxx7k6zi
	2XU8HRjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulXVg-00000008p4a-2DMk;
	Mon, 11 Aug 2025 18:44:40 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulUxA-00000008JUr-2spw;
	Mon, 11 Aug 2025 16:00:53 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-af937728c3eso867602366b.0;
        Mon, 11 Aug 2025 09:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754928051; x=1755532851; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=cmIrlL5AjQp5OrtEkcw9eDi4LGiI7a6CtQnHd0I7Fpk=;
        b=VnJ02d7tNH6HMr5V5N3VC1i8fat5VWxW1gdLy+TpQQuO1WmMApdO3I6O48uIkMFHND
         v7eOv8szHLuvIN+GOYY51TfIGmGnRaTJaTpdfXvdkU9+b4CgILEoJeRfNnGC6s0Rqoau
         Yaq8L5ly//qpQ/r16b7KWl+UxQ1JsLFA95tHomdhIWVj/kcL+16rNHZOT01u1M0k1KdW
         kQSfFhj7o/nv6HG0jNgA3wdj0VDGy3866HgwLlCP20by0u8nBF+2LSwP8LCWQlNuOHCv
         0nYO7+z6Gy4iRSgrTeKKocyh7xNUxkmor/4CXa6MfnQGvY55m0fWWFhYy3brWfSlNAH8
         2E+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754928051; x=1755532851;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cmIrlL5AjQp5OrtEkcw9eDi4LGiI7a6CtQnHd0I7Fpk=;
        b=a4kNvaMzB79/tOlOO3ECny7gKDx1UoDdNIZ8yXrAWeIpmJBbc+Fe2gh2szNz9zrqEq
         cjitLfSbyu2Zu3P3MQB2sdOm1Z53ZMD7cSRb0bTXj3+/AyPNPG70CgwhwMtpESjfZN2/
         W0q62/CCayVOZnhUdnn1ThibHSiua8R8Ed11qT1AEEHml/VNeJwuDkIBQ20Gn31r30OM
         uTjT7Bfit58EQ78yANWt/3OloGVZLTFORlhkepDXOp/abNyKwEW1hYRhmf1vk2eG0JSk
         L1JzLfYo9iDQcUqkzw8eyqy/SUSRCEVJrJb96WAKj3EAQ0YBOFuwGPuLDdk3VRdRqesQ
         ZNrA==
X-Forwarded-Encrypted: i=1; AJvYcCUlVDI+X2MjgXPu0FV2pCIiJR+TpjYy3I4cKLlqxd/wC5QUf/vuJx8zZw30+sogKoUJA1sBwYXtu6e8tmv2@lists.infradead.org, AJvYcCV94W8+C9rHO253EBp4KTH3CxvhqxkWQQ+X1uHz4dmEfCZpQzY+rbOZzN3qN9WczXURmPCTZo7xTXlm/qQ=@lists.infradead.org, AJvYcCV9HoSR3IPLbw7yVMCA77cY9M/pkTRefc7ei/E/lyUxxsHLr148UDgMmTzqewIhrsP+hqDcAD5DpPk/dvgkIKo=@lists.infradead.org, AJvYcCWv445W64HjOJhzhP4CdXnoi6QinPgl/Wr0doeYxjms3Ix/8TVVwH58v38MjPfAKZ7UEOWNsworld0QW1CyY/k=@lists.infradead.org, AJvYcCXohFReYcQY8LlIcaxiHqTtizH2WDORReSzhpQypa7rHwXP19GDt6esg2qVV7HXurgUKjt8rXrKGpJpl+095ON/1A==@lists.infradead.org
X-Gm-Message-State: AOJu0YxG7CaWqFohVxXhO8F7rcFq9uhJFeP+tj87V7DvAlD+M5vi4xWO
	fiYNgQ+H2DmIgBYhbNZMLIAdRq6s0EqkJSFO2ffI3KmJhm7dFi2zQX9D
X-Gm-Gg: ASbGncsylB6mdvmNlRwEzUlgZJp3OHctjKPIp0wru6E23tw86G88GNrbEEDRo+JObcx
	Ga2X1MbLfRsvkHbG9p8yRhcRE3d0GXiddf1CORP0f4Fdh34hHvx/JP8CQcUml3DCu4zIVHTr1A4
	5Qj2rA8mzIZHYZyWPfHYlu4u67brceQX0Yz9qpx+ooj5Bk2QYMFQxWbvdJlwQtxEEPuYzp7d9xO
	7ig8qpLaY/8YuEUWGfVJSy4UAJIAdbpypCDPBoxCU6yWEBqRAQF+xV1FYpRCi+Djz0paZ6UOdYG
	W9SooajRvqUyV5rb7F+eQRH/n92xxBlBU4JxPT0mePPi/U95frATJcPjgKSazKvAzaD/ztWc3dA
	vJmBsxjWB1gl43uRHe7bRqM0KDHzO/B+xlLteWwQ48yWRseKp6g==
X-Google-Smtp-Source: AGHT+IGh6yl4CupkZ+bbkqrg8mnCZBWOoNaEnJApexkC1cSCi5mW8bJYL756B85cuxjEowuHPJgNRQ==
X-Received: by 2002:a17:907:9486:b0:af2:31a9:c981 with SMTP id a640c23a62f3a-afa1d7233bdmr11410366b.23.1754928050948;
        Mon, 11 Aug 2025 09:00:50 -0700 (PDT)
Received: from giga-mm.home ([2a02:1210:8642:2b00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a07643asm2049410666b.15.2025.08.11.09.00.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 09:00:50 -0700 (PDT)
Message-ID: <c7f1fb05a6b7703ab18770bb5b58af0c58154f1f.camel@gmail.com>
Subject: Re: [PATCH 002/114] clk: at91: peripheral: convert from
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
Date: Mon, 11 Aug 2025 18:00:47 +0200
In-Reply-To: <20250811-clk-for-stephen-round-rate-v1-2-b3bf97b038dc@redhat.com>
References: <20250811-clk-for-stephen-round-rate-v1-0-b3bf97b038dc@redhat.com>
	 <20250811-clk-for-stephen-round-rate-v1-2-b3bf97b038dc@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_090052_731949_56C58BED 
X-CRM114-Status: GOOD (  25.46  )
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

On Mon, 2025-08-11 at 11:17 -0400, Brian Masney via B4 Relay wrote:
> From: Brian Masney <bmasney@redhat.com>
>=20
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series.
>=20
> This driver already has a clk_sam9x5_peripheral_determine_rate()
> implementation, however it can change the parent rate. The existing
> round rate does not have this functionality. I could add a check
> for CLK_SET_RATE_PARENT, and combine the two functions, however there
> are some other minor differences in the two implementations. I don't
> have access to this particular hardware. I believe that they could
> be combined, however it would need to be tested on real hardware.
> So, let's play it safe and convert the existing round rate
> implementation to ensure that the driver keeps the same functionality
> as before.
>=20
> Signed-off-by: Brian Masney <bmasney@redhat.com>

Reviewed-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>

> ---
> =C2=A0drivers/clk/at91/clk-peripheral.c | 41 +++++++++++++++++++++++-----=
-----------
> =C2=A01 file changed, 24 insertions(+), 17 deletions(-)
>=20
> diff --git a/drivers/clk/at91/clk-peripheral.c b/drivers/clk/at91/clk-per=
ipheral.c
> index 629f050a855aaebfd1a03ff87c2b016cd2284a5a..e700f40fd87f9327365f25036=
6f7f7bde01f5987 100644
> --- a/drivers/clk/at91/clk-peripheral.c
> +++ b/drivers/clk/at91/clk-peripheral.c
> @@ -335,50 +335,57 @@ static int clk_sam9x5_peripheral_determine_rate(str=
uct clk_hw *hw,
> =C2=A0	return 0;
> =C2=A0}
> =C2=A0
> -static long clk_sam9x5_peripheral_round_rate(struct clk_hw *hw,
> -					=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long rate,
> -					=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long *parent_rate)
> +static int clk_sam9x5_peripheral_no_parent_determine_rate(struct clk_hw =
*hw,
> +							=C2=A0 struct clk_rate_request *req)
> =C2=A0{
> =C2=A0	int shift =3D 0;
> =C2=A0	unsigned long best_rate;
> =C2=A0	unsigned long best_diff;
> -	unsigned long cur_rate =3D *parent_rate;
> +	unsigned long cur_rate =3D req->best_parent_rate;
> =C2=A0	unsigned long cur_diff;
> =C2=A0	struct clk_sam9x5_peripheral *periph =3D to_clk_sam9x5_peripheral(=
hw);
> =C2=A0
> -	if (periph->id < PERIPHERAL_ID_MIN || !periph->range.max)
> -		return *parent_rate;
> +	if (periph->id < PERIPHERAL_ID_MIN || !periph->range.max) {
> +		req->rate =3D req->best_parent_rate;
> +
> +		return 0;
> +	}
> =C2=A0
> =C2=A0	if (periph->range.max) {
> =C2=A0		for (; shift <=3D PERIPHERAL_MAX_SHIFT; shift++) {
> -			cur_rate =3D *parent_rate >> shift;
> +			cur_rate =3D req->best_parent_rate >> shift;
> =C2=A0			if (cur_rate <=3D periph->range.max)
> =C2=A0				break;
> =C2=A0		}
> =C2=A0	}
> =C2=A0
> -	if (rate >=3D cur_rate)
> -		return cur_rate;
> +	if (req->rate >=3D cur_rate) {
> +		req->rate =3D cur_rate;
> +
> +		return 0;
> +	}
> =C2=A0
> -	best_diff =3D cur_rate - rate;
> +	best_diff =3D cur_rate - req->rate;
> =C2=A0	best_rate =3D cur_rate;
> =C2=A0	for (; shift <=3D PERIPHERAL_MAX_SHIFT; shift++) {
> -		cur_rate =3D *parent_rate >> shift;
> -		if (cur_rate < rate)
> -			cur_diff =3D rate - cur_rate;
> +		cur_rate =3D req->best_parent_rate >> shift;
> +		if (cur_rate < req->rate)
> +			cur_diff =3D req->rate - cur_rate;
> =C2=A0		else
> -			cur_diff =3D cur_rate - rate;
> +			cur_diff =3D cur_rate - req->rate;
> =C2=A0
> =C2=A0		if (cur_diff < best_diff) {
> =C2=A0			best_diff =3D cur_diff;
> =C2=A0			best_rate =3D cur_rate;
> =C2=A0		}
> =C2=A0
> -		if (!best_diff || cur_rate < rate)
> +		if (!best_diff || cur_rate < req->rate)
> =C2=A0			break;
> =C2=A0	}
> =C2=A0
> -	return best_rate;
> +	req->rate =3D best_rate;
> +
> +	return 0;
> =C2=A0}
> =C2=A0
> =C2=A0static int clk_sam9x5_peripheral_set_rate(struct clk_hw *hw,
> @@ -430,7 +437,7 @@ static const struct clk_ops sam9x5_peripheral_ops =3D=
 {
> =C2=A0	.disable =3D clk_sam9x5_peripheral_disable,
> =C2=A0	.is_enabled =3D clk_sam9x5_peripheral_is_enabled,
> =C2=A0	.recalc_rate =3D clk_sam9x5_peripheral_recalc_rate,
> -	.round_rate =3D clk_sam9x5_peripheral_round_rate,
> +	.determine_rate =3D clk_sam9x5_peripheral_no_parent_determine_rate,
> =C2=A0	.set_rate =3D clk_sam9x5_peripheral_set_rate,
> =C2=A0	.save_context =3D clk_sam9x5_peripheral_save_context,
> =C2=A0	.restore_context =3D clk_sam9x5_peripheral_restore_context,

--=20
Alexander Sverdlin.

