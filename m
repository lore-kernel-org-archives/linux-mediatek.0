Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 457EDCA0ED1
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Aug 2025 18:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o2PLgwzqCzU4aYsyzpQU8Pmm9EwNqnw9dQ2/FdBe/4E=; b=hnq3/5FbUiL42QncszDO8S4DrJ
	L3sT8xGbMCHzDxXV8ZghoCw1kE33tpgwzt5pVUD+DLjx4uhOjijC2ThsPZpRwz0NVwg2SlUUDLDqO
	q9hboMJvgd5plNbUR4Gn2YMkUnxUH6i3T7quDDuqSwSMAFSaCSg7StZP6L7RLAgvxO3c9AchS04J9
	3q/fksJBN1JVKVBTPiRqq9A3XMod/54At1I+Gidt3fSBWGkcBgIFJGhnJWZeNR9H/R0FrG/b+mL/F
	ytR2cjkXJI6zk9fQqPvfC6ZdEooFEYnotSuGP+cbFMuHzgqzzbGjzS0+Wnn08W69cRn2id06ym5Ru
	YCC8lFmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulXKt-00000008nVQ-1Wyw;
	Mon, 11 Aug 2025 18:33:31 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulUZG-00000008DYM-3Y98;
	Mon, 11 Aug 2025 15:36:12 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-af922ab4849so671360266b.3;
        Mon, 11 Aug 2025 08:36:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754926569; x=1755531369; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=o2PLgwzqCzU4aYsyzpQU8Pmm9EwNqnw9dQ2/FdBe/4E=;
        b=kBBTbMxBTRFYNRLnazEc3vv/XUp/2gpLF/2R7qyf/x+XUdwLXeECgMw6MVToYRBNTn
         tGyWGlwZ0Q0kuMHeyizbfPfMRIVUwaAT9SAwdVMIOrfLOU2cSJ1DD3Niw5wrjL5AJ22M
         URXIiFxpQKBQlHRT8hTw/ofbbvqT2W48B9cxmyICBxQ9+ECzx6Xn/Po5YNKoixs/L7VM
         rVXwciyO8qW22kqiq7Yvx8FODGORWgv5pTZECi0dYWEwDls2VaJypICskSRzw+CNK3nr
         o2FkGNbJf3tK++r0omAsZL4xFhnzhWZRahKvk310CWOArbldPR2i8FmKYgoLdOAx/J6k
         4BGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754926569; x=1755531369;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o2PLgwzqCzU4aYsyzpQU8Pmm9EwNqnw9dQ2/FdBe/4E=;
        b=BRQ3E1A4aIG3at96FnqgNIbQ/aMvCb6EMQVx7AJdixaodU8Bm46EnyevAJOfItnk9s
         Eb5LXdFDxOYBzOa93thQarFNPTmnYnyKvJeGHGiJ8JcfT5zDgpfD9eK12gHGE5dzjNQ6
         SONGuT7KiGqvZ0iHx8Fsf3QVbvedyfV/rBb1PKciBL2Ohye9Iu+KQhQO+RxLAIJvcPvp
         A9ZfYPqWeaUhGCBXj4NIEciKYneX49CbO4zhzR7mMH/WoH4hhlIUXCwMdTTnRgZk1VlJ
         XeenBpT4/VH5H7h3KWqNf7Jx3Vl4EGl6D/RvB826PQSTek8AiGW0Oa08U8p2CnHwCAXk
         6PyA==
X-Forwarded-Encrypted: i=1; AJvYcCUuzs0JGZwryEpqgaShDKwn6+K8ZV9p1IMMbt1rUh/MdOFSZpq+xmpKjoT79SQfFX8OU27Z/H3EKxJ//3/W53A=@lists.infradead.org, AJvYcCV307DQe9jWGiR1DoJ94NeI9lWN1r+zQJC91FNuvuBvkxOjTTIrbZ6x9kt0xLDUnQ8IP7tbDGyvBcVJDjE=@lists.infradead.org, AJvYcCVf0jf71Az3HvgHI8zmPAzAE49h+akzZ6GqkUipcs+2HBIX257CIlD6V1KzUJNsxUsbKi3QAO918ph1LNED244Jog==@lists.infradead.org, AJvYcCW6r+wjgvt9DKfTyo3SRO+2MMYGymJV9UeaW/NSd9v/1UfnKv0p24H5+Ho4RL36h57QFKIdAMeZHI8ZMY3d@lists.infradead.org, AJvYcCW6tWSnZRNPtjgM+h3x7hve8VAIfXbZa/JPmHISE6WyGq1kEfml+GVusz1YsOcRrNz+ko7RF7qzF4faZ/KBaq0=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw1FJG+CS1l1nrKuf4lexH99n9MUXm9EtSffScMpq7Zny03GzLd
	yivHVYcvt5qV1hUZZRSiWIfOEDw5wmFPK9BWHnRy43nofiB09vpkOb8q
X-Gm-Gg: ASbGncvlB2jd34Fc39AaFK4RFNE/pMrD7t5BDcDzbg6KCXsyR7TuKDYBErnblo4yEwP
	u4RQOsw6JoRIvazsnLuRb8qMYW0L76NFBXWLKht3wDyjuP3fngNbeITW3GJeCGCzhnrYEtGiz7S
	FFM3ZqX0D/SQjTJa00GZlKEUZVEkz8yQkptzlzwFuK4qyEnWccTibNyIMvPIw3nL8yifhkZUoQ5
	Yfc+wu1eTo3cY5IU4rGGozopla1SuudTPZb9oV18/4Gkijxn34+0XNVzLK5S93n03zIyAa7UjrW
	8s//qvqlaKQEkQ4W04Pk+9didTycfx7JeC8LNOPUm631qstjGR+ulQKWxLwPWzfuXqVvNMcoLgQ
	jqV7+XAq7AB035hHN9yt5yxZ9YO8YHPWUqCJ4Rh0=
X-Google-Smtp-Source: AGHT+IEWXGSRjdy4RAu+IcFqNFLSigtkUTeWRQg71jQOmauDsjSiWhFOxk2+KAgssZQX1ci7YH+4nA==
X-Received: by 2002:a17:907:7fa4:b0:ae3:c767:da11 with SMTP id a640c23a62f3a-af9c65de7eemr1091487766b.50.1754926568473;
        Mon, 11 Aug 2025 08:36:08 -0700 (PDT)
Received: from giga-mm.home ([2a02:1210:8642:2b00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-615c57f9fd0sm17432655a12.11.2025.08.11.08.36.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 08:36:08 -0700 (PDT)
Message-ID: <f6d130cac25b794e0fad1a8f0267d38acf8ee465.camel@gmail.com>
Subject: Re: [PATCH 113/114] clk: sophgo: sg2042-pll: remove round_rate() in
 favor of determine_rate()
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
Date: Mon, 11 Aug 2025 17:36:04 +0200
In-Reply-To: <20250811-clk-for-stephen-round-rate-v1-113-b3bf97b038dc@redhat.com>
References: <20250811-clk-for-stephen-round-rate-v1-0-b3bf97b038dc@redhat.com>
	 <20250811-clk-for-stephen-round-rate-v1-113-b3bf97b038dc@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_083610_885650_B84DC59F 
X-CRM114-Status: GOOD (  19.76  )
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

Hi Brian!

On Mon, 2025-08-11 at 11:19 -0400, Brian Masney via B4 Relay wrote:
> From: Brian Masney <bmasney@redhat.com>
>=20
> This driver implements both the determine_rate() and round_rate() clk
> ops, and the round_rate() clk ops is deprecated. When both are defined,
> clk_core_determine_round_nolock() from the clk core will only use the
> determine_rate() clk ops, so let's remove the round_rate() clk ops since
> it's unused.
>=20
> The implementation of sg2042_clk_pll_determine_rate() calls
> sg2042_clk_pll_round_rate(), so this folds the two into a single
> function.
>=20
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---
> =C2=A0drivers/clk/sophgo/clk-sg2042-pll.c | 24 ++++++++----------------
> =C2=A01 file changed, 8 insertions(+), 16 deletions(-)
>=20
> diff --git a/drivers/clk/sophgo/clk-sg2042-pll.c b/drivers/clk/sophgo/clk=
-sg2042-pll.c
> index e5fb0bb7ac4f97616f3b472fcab45e5729eb653e..b2cbd50ac73c7538b1acbca51=
7f4259cba885fcc 100644
> --- a/drivers/clk/sophgo/clk-sg2042-pll.c
> +++ b/drivers/clk/sophgo/clk-sg2042-pll.c
> @@ -346,37 +346,30 @@ static unsigned long sg2042_clk_pll_recalc_rate(str=
uct clk_hw *hw,
> =C2=A0	return rate;
> =C2=A0}
> =C2=A0
> -static long sg2042_clk_pll_round_rate(struct clk_hw *hw,
> -				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long req_rate,
> -				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long *prate)
> +static int sg2042_clk_pll_determine_rate(struct clk_hw *hw,
> +					 struct clk_rate_request *req)
> =C2=A0{
> =C2=A0	struct sg2042_pll_ctrl pctrl_table;
> =C2=A0	unsigned int value;
> =C2=A0	long proper_rate;
> =C2=A0	int ret;
> =C2=A0
> -	ret =3D sg2042_get_pll_ctl_setting(&pctrl_table, req_rate, *prate);
> +	ret =3D sg2042_get_pll_ctl_setting(&pctrl_table,
> +					 min(req->rate, req->max_rate),
> +					 req->best_parent_rate);
> =C2=A0	if (ret) {
> =C2=A0		proper_rate =3D 0;
> =C2=A0		goto out;
> =C2=A0	}
> =C2=A0
> =C2=A0	value =3D sg2042_pll_ctrl_encode(&pctrl_table);
> -	proper_rate =3D (long)sg2042_pll_recalc_rate(value, *prate);
> +	proper_rate =3D (long)sg2042_pll_recalc_rate(value, req->best_parent_ra=
te);
> =C2=A0
> =C2=A0out:
> =C2=A0	pr_debug("--> %s: pll_round_rate: val =3D %ld\n",
                          ^^^^^^^^^^^^^^
Now that round_rate has gone, should the above become "pll_determine_rate"?

> =C2=A0		 clk_hw_get_name(hw), proper_rate);
> -	return proper_rate;
> -}
> +	req->rate =3D proper_rate;
> =C2=A0
> -static int sg2042_clk_pll_determine_rate(struct clk_hw *hw,
> -					 struct clk_rate_request *req)
> -{
> -	req->rate =3D sg2042_clk_pll_round_rate(hw, min(req->rate, req->max_rat=
e),
> -					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &req->best_parent_rate);
> -	pr_debug("--> %s: pll_determine_rate: val =3D %ld\n",
> -		 clk_hw_get_name(hw), req->rate);
> =C2=A0	return 0;
> =C2=A0}
> =C2=A0
> @@ -417,14 +410,13 @@ static int sg2042_clk_pll_set_rate(struct clk_hw *h=
w,
> =C2=A0
> =C2=A0static const struct clk_ops sg2042_clk_pll_ops =3D {
> =C2=A0	.recalc_rate =3D sg2042_clk_pll_recalc_rate,
> -	.round_rate =3D sg2042_clk_pll_round_rate,
> =C2=A0	.determine_rate =3D sg2042_clk_pll_determine_rate,
> =C2=A0	.set_rate =3D sg2042_clk_pll_set_rate,
> =C2=A0};
> =C2=A0
> =C2=A0static const struct clk_ops sg2042_clk_pll_ro_ops =3D {
> =C2=A0	.recalc_rate =3D sg2042_clk_pll_recalc_rate,
> -	.round_rate =3D sg2042_clk_pll_round_rate,
> +	.determine_rate =3D sg2042_clk_pll_determine_rate,
> =C2=A0};

--=20
Alexander Sverdlin.

