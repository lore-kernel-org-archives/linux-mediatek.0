Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85D3FCA0EC4
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Aug 2025 18:41:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gtZQ94WBszTISCSHtIKTauM3dit5VcpLWsofgTPpah4=; b=BEbF7wv9xCkKMeSNmivdbX8gGW
	NXlHk4b74IoS3S5RDyAZuNZiqX1b0u82GB9tUy6Sxe3ckcVQnAnWZrlb78M/OzKE7xWEPErTmG3NZ
	ORGIBjr9NJ0KUDBdEEPu8InTCc7p4/JBynx5y5aE30GJSV0VB02jVz+Pi/CiKC5reCV4SWjBxCboh
	AKi89x2b1AE2QOYEA6ZxYhQTo0bv6rCLwy6BnsXMDGNlpAmQEiokXaAsC1Cvanx+YA9t9lSDi0FVb
	41vMkJmT9RF7m66yWQDbDk9KE8dWPAeL7ef4Ar8RpXrbTAtQtmzqbjZZQ/c+R7jbpxMvL5T0nG4Up
	7dGz87jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulXSz-00000008oUe-2PzL;
	Mon, 11 Aug 2025 18:41:53 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulUnU-00000008HAz-1WhT;
	Mon, 11 Aug 2025 15:50:53 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-605b9488c28so8023266a12.2;
        Mon, 11 Aug 2025 08:50:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754927451; x=1755532251; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=gtZQ94WBszTISCSHtIKTauM3dit5VcpLWsofgTPpah4=;
        b=fFqJafzA13gU+78CW50eoeN2D+zBioIKIdfqCbGtBsNOKyMzFXW04TAL2HJJCrWzCk
         cc9POtW16jwwVqw57ysxvrk/RM7jeCKdRot3xeddu1iNYvV1k43ouzKyiJsZPFJcpNm9
         zw38j3NUXoM0/kNrTbMhHQr0/dvDHf+M+SNv4XrRw7qNG305SUQKlEf4gxNYQ0U89m6n
         1/QhzgC/A57dRCj8H9xtyZNkWdugA6eMZMoSE2SACdsyo9LK/H3i0/grcXFSxp7zM0uH
         bv3fNrafeqOcvcCqiK6Y68XCL072MfB0pRuoeuCfz8qoo46O4AmhL2dqzhk1UEqy9nuE
         9Dcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754927451; x=1755532251;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gtZQ94WBszTISCSHtIKTauM3dit5VcpLWsofgTPpah4=;
        b=C7YB3+voC/AKRszNKDNyNY7ByZq32loJcDOVgVP/zWeCsmIJ7QpR7pIqYloCYx6NkJ
         +D56+adnkl0XFiHtTy3tf2B9hDR2SPJ7PlRbucG7JqsyLFsueCZflPwy+AwIsqTPOh/r
         isR57T2KD4bHopj63FLEK6JUgMUCu81O2V64Re3eOXsu9hWPkx8g+l4I2FLghrWHzRH1
         i8XQVZB/CS1v+UdXTe710ft3eaSslj2yCULmVhla8wytj6aQdAVCKOKQOHs+yRWRCcRv
         zpklXms0CkA1ZoO5dBjZQW5p34bl5tbHicVBMvN+4blvFuITZ7aC9a2+qfcwkfXhuBmr
         /B4A==
X-Forwarded-Encrypted: i=1; AJvYcCU7tpwzxUdExPjSofluBFBgW2z5wN/jpvcM81mPaLF0mgHxu0VJMqToGpm2Hqww0EgmSg5ijAsDe2cd1Cw=@lists.infradead.org, AJvYcCUiQN+EFPItvefOpu7yduok2vI/DBoJyyiNj1lZ8XPnR19s/gAoYVz8TRiB2fGa178qefdYeBqtXT55xMdMkGmeJg==@lists.infradead.org, AJvYcCV4f0vFTrbVchljv9DeI+5arjVtTrTjfzfGgWHdUb1Uo/pC3lF87+cgB9rKdAvOIe92xMYQkY65MVzhO5NurQ4=@lists.infradead.org, AJvYcCVSMSISrV6oFj5ik/oG4Wa3qehCLu250NHd8zwDsEJjKWsQ4afSXhe/KD3X859nN2uPghB9FacffZA3T7uUiWE=@lists.infradead.org, AJvYcCXPesnwBjb9U7HtgqPahb+cQuCR+FzkWjto0enbsSA3uxKVemceg9D+xd4v4S3CH1zaFalIRpokJcU7gDpn@lists.infradead.org
X-Gm-Message-State: AOJu0YzcO91LkIsiWLbR7w8RG2McFAiAKgIxsAt1tZFrCTvsyLZPsBOU
	4k53eIBjqvAHXNQ2i5ie0v7iu6FQhamTvZIj5PGaRfK9ZYvvj4XLmgGc
X-Gm-Gg: ASbGncteGG1q0p/G1m6dYcEg+vsJO2J1gc0xEMrSMdd/71MNpk6SclzolA4XvviZdbH
	cA7DoRa9TSX37RuGWD5qAfvOq5mwvkABKMikUPGoyaxxFFrGrZstD9p+OV7ltFyPMsnSLO+HBdf
	CtiwRknEvcqdcno65NdyIOZkDUPz/X2cdF/NSEtuKnKF8otiP2JQmvonlX8W32qgnv9BuNiNMaU
	ZgJe0gBD363W377/pyOmu77KACKTSNqTv2oMat/IKYj9X6UKDzPl3HfyMVHU1zXJUXj9PkdwhLq
	dEUy6iNacbA06QHA4Q7l84p5GTmbd+kvLNkv1W9O3IhHssEi+m+wJZnfUf3Tj+uzOhw4utjoISy
	5dPN4WmaLJdVlzXenf6AVkAmwQvEo6pAA3ZZrWRqWeVNWv3TnAA==
X-Google-Smtp-Source: AGHT+IHe8ajBJUyXwu1jxvqnFBotZVZqGKDHQgYwFn+fyltnooA7uDIcyyMAL7hOfbd71etw3G4PSg==
X-Received: by 2002:a05:6402:26c2:b0:618:3a61:b1c with SMTP id 4fb4d7f45d1cf-6183a610b1fmr2169187a12.31.1754927450586;
        Mon, 11 Aug 2025 08:50:50 -0700 (PDT)
Received: from giga-mm.home ([2a02:1210:8642:2b00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-615a8f000c3sm18680418a12.4.2025.08.11.08.50.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 08:50:50 -0700 (PDT)
Message-ID: <d3b0ae61d0bb5dc4e115ace27e1672444ae90d83.camel@gmail.com>
Subject: Re: [PATCH 014/114] clk: ep93xx: convert from round_rate() to
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
Date: Mon, 11 Aug 2025 17:50:46 +0200
In-Reply-To: <20250811-clk-for-stephen-round-rate-v1-14-b3bf97b038dc@redhat.com>
References: <20250811-clk-for-stephen-round-rate-v1-0-b3bf97b038dc@redhat.com>
	 <20250811-clk-for-stephen-round-rate-v1-14-b3bf97b038dc@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_085052_403742_3481738D 
X-CRM114-Status: GOOD (  18.67  )
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
> =C2=A0drivers/clk/clk-ep93xx.c | 18 ++++++++++--------
> =C2=A01 file changed, 10 insertions(+), 8 deletions(-)
>=20
> diff --git a/drivers/clk/clk-ep93xx.c b/drivers/clk/clk-ep93xx.c
> index 4bd8d6ecf6a2bde26287e4e949b062a5660139e6..b081ef920e250dd99134af684=
5c443ee11266da8 100644
> --- a/drivers/clk/clk-ep93xx.c
> +++ b/drivers/clk/clk-ep93xx.c
> @@ -389,23 +389,25 @@ static unsigned long ep93xx_div_recalc_rate(struct =
clk_hw *hw,
> =C2=A0	return DIV_ROUND_CLOSEST(parent_rate, clk->div[index]);
> =C2=A0}
> =C2=A0
> -static long ep93xx_div_round_rate(struct clk_hw *hw, unsigned long rate,
> -				=C2=A0=C2=A0 unsigned long *parent_rate)
> +static int ep93xx_div_determine_rate(struct clk_hw *hw,
> +				=C2=A0=C2=A0=C2=A0=C2=A0 struct clk_rate_request *req)
> =C2=A0{
> =C2=A0	struct ep93xx_clk *clk =3D ep93xx_clk_from(hw);
> =C2=A0	unsigned long best =3D 0, now;
> =C2=A0	unsigned int i;
> =C2=A0
> =C2=A0	for (i =3D 0; i < clk->num_div; i++) {
> -		if ((rate * clk->div[i]) =3D=3D *parent_rate)
> -			return rate;
> +		if (req->rate * clk->div[i] =3D=3D req->best_parent_rate)
> +			return 0;
> =C2=A0
> -		now =3D DIV_ROUND_CLOSEST(*parent_rate, clk->div[i]);
> -		if (!best || is_best(rate, now, best))
> +		now =3D DIV_ROUND_CLOSEST(req->best_parent_rate, clk->div[i]);
> +		if (!best || is_best(req->rate, now, best))
> =C2=A0			best =3D now;
> =C2=A0	}
> =C2=A0
> -	return best;
> +	req->rate =3D best;
> +
> +	return 0;
> =C2=A0}
> =C2=A0
> =C2=A0static int ep93xx_div_set_rate(struct clk_hw *hw, unsigned long rat=
e,
> @@ -437,7 +439,7 @@ static const struct clk_ops ep93xx_div_ops =3D {
> =C2=A0	.disable =3D ep93xx_clk_disable,
> =C2=A0	.is_enabled =3D ep93xx_clk_is_enabled,
> =C2=A0	.recalc_rate =3D ep93xx_div_recalc_rate,
> -	.round_rate =3D ep93xx_div_round_rate,
> +	.determine_rate =3D ep93xx_div_determine_rate,
> =C2=A0	.set_rate =3D ep93xx_div_set_rate,
> =C2=A0};

--=20
Alexander Sverdlin.

