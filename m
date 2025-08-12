Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9EF2CA0EDC
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Aug 2025 14:52:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rOGKCteFZMAy3LeuWf1j/2F5b+EEOJ9yxzrgy674/8c=; b=Q4xK5RLo3/47ZVO2eJjSUYLC5X
	bpMhPUejlpVsDhb5Pu72BQbzst2GmLznC2blArRzqXc+qdImjUb7c1c+NLNfaTOGOfbhCe+q+Sys5
	w3PBnByuCh6M7sqHwmz6eV5DuM5kqsyRsBzapJs0Ibg5dTd+OSW99ni931nshugEzEZL/QnEsIk7m
	SNwgsJsDchI7DVaSS3NdNXeXDS1cFV0t/HfxHQx2/rznYbNzU9SYx0DKz0GN7AX1sqhiGcq+d+Slh
	YQnVfuxUXiJBH8jIQiQ1XrNUz6/Sc5clv6SrFIGTptS+fbKabeOZsk1lVVhzPAQmKKtmQKQQhbe0t
	JnSRalTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulqMl-0000000B6wr-2CgP;
	Tue, 12 Aug 2025 14:52:43 +0000
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ull7e-0000000ALoN-3DyO;
	Tue, 12 Aug 2025 09:16:47 +0000
Received: by mail-ot1-x32c.google.com with SMTP id 46e09a7af769-741aeba62ccso1211560a34.0;
        Tue, 12 Aug 2025 02:16:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754990205; x=1755595005; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rOGKCteFZMAy3LeuWf1j/2F5b+EEOJ9yxzrgy674/8c=;
        b=IJB8Jp74ZVLNkbp+TYDbhwMgAertXW2EyIJ47r3waZ2hOZUbr9JW2NjLXagZ5Wtoan
         paIi2OPisDTP1o3oLqgsLVs1ktqy0V/iuMQ0v3TbpN1jfJituPc0qU4cgguxR6cU8okJ
         nx+tI2+1YyfdopP37IepVY5DO38kSDFQzEq145I9W9WN/s2b8iLzCXzifnPaVQwSs7dF
         PxYrHnNEcSlKt/in+Jp+LvSiH6zD2LIZTDSNPIikv+SmOGgnxVra5M30TbG3KiXU2KaW
         RiU+Lsb5i1yUCS3CBiTxZVOPEMgAKQgtXO7T26t+6zJlHl3IbVFHdjJR3jfEJiDDzVJU
         LC1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754990205; x=1755595005;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rOGKCteFZMAy3LeuWf1j/2F5b+EEOJ9yxzrgy674/8c=;
        b=CioFSKn/T4qydR3lex9Pt/peeOfvSkarraigciRh9ZsiAHgw2R/0N8xET7AlnlKyQo
         orG61UvftcX7RwvRp/9sNUUVBmGIBYDQx442UrKHHmgxE/zMF4MJJNozttAw1NwEWqM9
         SNvXh0vBJCQEueo6Pq8neyloPJlQCrBIrDsF3PBwvIAaPCOZbAMcJjAk8+MAtIG2dnbB
         gYylo9zSl+LD8uLGZbtst0v2YgMMY0CtW1ZW2Vt47CBt1RQOg077aMhVjfTEGYky+oc1
         l6fWIruAowhPgBkp4TuEEKfYoQO3dSimLP8wocIU8JS9qePfg5H5uVE4p/RlT2jlZbLC
         hAkQ==
X-Forwarded-Encrypted: i=1; AJvYcCUvxIVRgLcKen8NcMqmB4lCIamKZClmCzeqbqKb1VuXI3vO1cIIyUlWE5ve5xwDQL50PudsS8LpoSxUqx+XFEg=@lists.infradead.org, AJvYcCVeXdsw1mXT9Pu/a1QN8VY++UGHcphFD2kHUM82KyMFS5klID4UpW6/rn4UGrxUVqcCAfInUP5Vy079PVzr@lists.infradead.org, AJvYcCVm7fTpZtpNI8xQdlvHCn/W8I1s64W73Fvb8VzIqYDDSjU/l8jl5BzXdpjN8JXW3lBkcpkkETOGh+Ni+p8=@lists.infradead.org, AJvYcCVq8rsABjsnqVnJz2Z30rWrOntB+OaGwo1E8TlD+AuIpvNYonKuJvsFg1npjTSUqn5k9NAwJMQJKim5Hs2b9ms=@lists.infradead.org, AJvYcCX0bZA0Y2zLGZCW4xlkrB3U9MqC8I4dUJpvJuiNm22CVYijx5QXmUGdnARqQMKqnDysVbm1EqUuUxPdUKWHQyhxfw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxHon+tHdQol/8DkkLa7bjOkfdoJvYdsA7KQM2zOybtauBgw+HE
	bq+8qYQ02mrL8f0uTMn9xJw/ujcmVp+SLYEMFaYLYoWVSZkbPKx/23vOrV2uKU5be2eFX04vHy+
	Up6eV0DgY+Wmm2Cguoa2uSHXAIHNrXSc=
X-Gm-Gg: ASbGncvfv1u0eZc2G5nndwJm2pzpiE9ASlXnVxGNoAvAbTRjZiy62A6SamxtO9UIFxL
	g3giqRlJctegWa+mllZ3dDkIF8xjx/MFOjS/NWseSq+kgdK6+WD+YHeuU8+RfTr+j5UFc/8MxzF
	l1qy1HtwSNvxG/cCnOQ2PaWcVFRnbt0KBHe3TmuzPq/AQvebQCuX53DzlsthHI6fnzN9YnUveQi
	TIxmA==
X-Google-Smtp-Source: AGHT+IETTIJEQRSUprmEW/PZ43+7aaIWslt+bYkWZi3Waoz2cOUzGNm7S8/l4wJRhakmB2sfTn3K3AA6daLwKG1Ea8M=
X-Received: by 2002:a05:6808:181a:b0:433:fd1b:73f1 with SMTP id
 5614622812f47-435c90f0e8fmr1519318b6e.6.1754990205351; Tue, 12 Aug 2025
 02:16:45 -0700 (PDT)
MIME-Version: 1.0
References: <20250811-clk-for-stephen-round-rate-v1-0-b3bf97b038dc@redhat.com> <20250811-clk-for-stephen-round-rate-v1-54-b3bf97b038dc@redhat.com>
In-Reply-To: <20250811-clk-for-stephen-round-rate-v1-54-b3bf97b038dc@redhat.com>
From: Chunyan Zhang <zhang.lyra@gmail.com>
Date: Tue, 12 Aug 2025 17:16:09 +0800
X-Gm-Features: Ac12FXzs0-qDCA0x0Aw1aZmy8texiIAG_F4IY6MycSoBtAjQ1ujDKaGaSXI8gxQ
Message-ID: <CAAfSe-u-YkkwKyS4+6EU+-zg5ghemk-4VJVE8p4Sky1-e4Y13g@mail.gmail.com>
Subject: Re: [PATCH 054/114] clk: sprd: pll: convert from round_rate() to determine_rate()
To: bmasney@redhat.com
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Sudeep Holla <sudeep.holla@arm.com>, Cristian Marussi <cristian.marussi@arm.com>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Paul Cercueil <paul@crapouillou.net>, Keguang Zhang <keguang.zhang@gmail.com>, 
	Taichi Sugaya <sugaya.taichi@socionext.com>, Takao Orito <orito.takao@socionext.com>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
	Vladimir Zapolskiy <vz@mleia.com>, Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Samuel Holland <samuel.holland@sifive.com>, 
	Yixun Lan <dlan@gentoo.org>, Steen Hegelund <Steen.Hegelund@microchip.com>, 
	Daniel Machon <daniel.machon@microchip.com>, UNGLinuxDriver@microchip.com, 
	Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Michal Simek <michal.simek@amd.com>, Maxime Ripard <mripard@kernel.org>, 
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
	Manivannan Sadhasivam <mani@kernel.org>, Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Max Filippov <jcmvbkbc@gmail.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Daniel Palmer <daniel@thingy.jp>, 
	Romain Perier <romain.perier@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
	Gregory Clement <gregory.clement@bootlin.com>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Bjorn Andersson <andersson@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Heiko Stuebner <heiko@sntech.de>, 
	Andrea della Porta <andrea.porta@suse.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Qin Jian <qinjian@cqplus1.com>, 
	Viresh Kumar <vireshk@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, Alex Helms <alexander.helms.jy@renesas.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Liviu Dudau <liviu.dudau@arm.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, sophgo@lists.linux.dev, 
	linux-mips@vger.kernel.org, imx@lists.linux.dev, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-stm32@st-md-mailman.stormreply.com, patches@opensource.cirrus.com, 
	linux-actions@lists.infradead.org, asahi@lists.linux.dev, 
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, soc@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_021646_808461_B27DCD01 
X-CRM114-Status: GOOD (  20.29  )
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

On Mon, 11 Aug 2025 at 23:18, Brian Masney via B4 Relay
<devnull+bmasney.redhat.com@kernel.org> wrote:
>
> From: Brian Masney <bmasney@redhat.com>
>
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series.
>
> Signed-off-by: Brian Masney <bmasney@redhat.com>

Reviewed-by: Chunyan Zhang <zhang.lyra@gmail.com>

> ---
>  drivers/clk/sprd/pll.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/clk/sprd/pll.c b/drivers/clk/sprd/pll.c
> index 13a322b2535ac37ecb17f2c39d17d2c03532cfcb..bc6610d5fcb72faa7406ea78dca4cd9b848e9392 100644
> --- a/drivers/clk/sprd/pll.c
> +++ b/drivers/clk/sprd/pll.c
> @@ -254,16 +254,16 @@ static int sprd_pll_clk_prepare(struct clk_hw *hw)
>         return 0;
>  }
>
> -static long sprd_pll_round_rate(struct clk_hw *hw, unsigned long rate,
> -                               unsigned long *prate)
> +static int sprd_pll_determine_rate(struct clk_hw *hw,
> +                                  struct clk_rate_request *req)
>  {
> -       return rate;
> +       return 0;
>  }
>
>  const struct clk_ops sprd_pll_ops = {
>         .prepare = sprd_pll_clk_prepare,
>         .recalc_rate = sprd_pll_recalc_rate,
> -       .round_rate = sprd_pll_round_rate,
> +       .determine_rate = sprd_pll_determine_rate,
>         .set_rate = sprd_pll_set_rate,
>  };
>  EXPORT_SYMBOL_GPL(sprd_pll_ops);
>
> --
> 2.50.1
>
>

