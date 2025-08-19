Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1DB8CA0EED
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Aug 2025 11:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tV6Flkuo2P/+55L7Kh0T7daOZ9uv2yK47XAxZBt9LOQ=; b=d4qsZmPSJ2YxAO6uKukCkQ8L7f
	eTlRxxctcZ2vShjYtMy3hRaYvbkyGbyqMcO6Li9kwhTrbNrFXmsIc6VqnJIg5OxAOxy6rqZP+iKUO
	madOcGbR3rWS+eQVG/aNh4uVyiN+DZ/27N94H9tFV7LWqPRWyceD820+798utWOTZX0jX8IcihC9J
	+Nyq9A2q6wyiPi/b37ZErxsXhICexe0l6i+T3jUd44rIBKzkh/+ms5DxkHp6TJlalfieoP937dKpk
	xUDx1aGEHAKTzOiJ1+0hYpoRuq1KA9seqY58h1OVSjcBFFwjaFaqGscl/0pT6J8YX92alzpdSyJWm
	/0PKidHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoKdT-0000000AItY-2tPf;
	Tue, 19 Aug 2025 11:36:15 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoIyV-0000000A1ej-1ksZ
	for linux-mediatek@lists.infradead.org;
	Tue, 19 Aug 2025 09:49:53 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-55ce5243f6dso5543713e87.2
        for <linux-mediatek@lists.infradead.org>; Tue, 19 Aug 2025 02:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755596990; x=1756201790; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tV6Flkuo2P/+55L7Kh0T7daOZ9uv2yK47XAxZBt9LOQ=;
        b=HAecnzSAYuktfEGhP0urncZsk2D7fsC1EROKXVJYciLQfJOtHZQ4jgThDqEg/5Mhbq
         z709xmiNanVSgPpWL8h/aEZiGpvUXFEOg4jNlp8s8zmkY0xk2o0j5jJEebcb+rMI2L+6
         G3u3Pp2pUuRoAF7H30JtOJVN5RVHtuVbe64yTd4314+NKaX1zpl8ckznY7L8eAA/INIG
         fXr3snmVMWLkxCeB3mSeacNdAWHvqAeaaYPe0/DCc7IVFQpyuDSy3c/HqFszLWa2CLPZ
         zaoE5BSzyJYuYkKW+7j0xnzQFNIbf0GAJ77iXeI6+Gp4ifSMDM4+1tw+LQH3RpASD5Pg
         qvrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755596990; x=1756201790;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tV6Flkuo2P/+55L7Kh0T7daOZ9uv2yK47XAxZBt9LOQ=;
        b=OsWkHP9SXy2iTrIRrGtUYHE0jOCAseMJLsvyr1EXrfq+pd8H39SDTJBjk7kIcCYduv
         D4kt7MS33RN848HlQiAmhlzckjV4fTpmDD8E9o+DCgtTGCaOy/Jd2nRLAZ/vvnzvxy0+
         Gz/rTQolK1PoHrqMhah9H+T2qsH85l6M1EtYsueOxzqC9IuTiQtU2XZ3Ay5ohAutXK1E
         cjHnLe7YHA+mdtjwdAYVPanMBahGajTBTTMkKND2gBcsyuW2O0nUC8NC1zeWD+qHm6Gt
         BO6PdNL+1jxYAuQZOwEQs2qgnfCjTGAKZN1DtrUYwK72dwlIOozXNtYj4deB5eanWKPU
         EdNg==
X-Forwarded-Encrypted: i=1; AJvYcCUMavfXaa5p2pzMn9dMcjPXSLdaPr4G6A+x6GOqn8DyxKMs6fR1Eb2Ws0aX1QgKBhgtYdTFCB5eHOgoLuPGnA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzf4AkQA4chlFSXLQPGuAaALQ3qQtDD0GHwasRTXnyw1OEScToM
	nYEG9tAP4SLgjHtI6R0sUCGCUH8mdnIgB292McFkOm0nF8e+3AlbA4wGxpaob7IWhu+1GVe/93j
	P5UbnueQzyqBU6ibxzrtG0/W2KiTLdwLGGQwInx5f6Q==
X-Gm-Gg: ASbGncs4TcdqHUpK11vBp/fwM+NhScFkxhNo30FYiT7dASir8RoZy6MrRX9GoCC5FOJ
	LCuSNJRKpPZcLZLFgaqJpMjwwDz6oXZDaN8x1Z25rgwKlD/aNSeAY2JvG/h6N7PbhDO7bbjHa9K
	rMrpQdTlpeQyTc/6Xy0jYf7OFEbcUEj1tVC1rvHl+r6LS6qRWALyJWlmYyiiUT3WvCi2ixAX97U
	1yMin62Q3xm
X-Google-Smtp-Source: AGHT+IEt8RlqWWvwC2uqrmb7EU75OBtpQ0q0kJ1zr3PFW1jsKW7QqgA/pBKXOLyxKfth/q0XXJuPhRlLhC58Y7ZaIjE=
X-Received: by 2002:a05:6512:ac9:b0:553:51a2:4405 with SMTP id
 2adb3069b0e04-55e00850835mr590681e87.45.1755596989499; Tue, 19 Aug 2025
 02:49:49 -0700 (PDT)
MIME-Version: 1.0
References: <20250811-clk-for-stephen-round-rate-v1-0-b3bf97b038dc@redhat.com> <20250811-clk-for-stephen-round-rate-v1-109-b3bf97b038dc@redhat.com>
In-Reply-To: <20250811-clk-for-stephen-round-rate-v1-109-b3bf97b038dc@redhat.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 19 Aug 2025 11:49:38 +0200
X-Gm-Features: Ac12FXyEOw7KCbkbFT2OqCP4TngpQPKLbvy9M6n90z-zmlM7tVP9PQNq8vVGJnI
Message-ID: <CACRpkdaW=f7xm+rsD8XUUx-qhuh8sk1mCU-erve-_9S4uUpHbA@mail.gmail.com>
Subject: Re: [PATCH 109/114] clk: versatile: vexpress-osc: convert from
 round_rate() to determine_rate()
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
	Chunyan Zhang <zhang.lyra@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Michal Simek <michal.simek@amd.com>, 
	Maxime Ripard <mripard@kernel.org>, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
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
	Liviu Dudau <liviu.dudau@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
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
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_024951_545442_4652AA45 
X-CRM114-Status: GOOD (  11.09  )
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

On Mon, Aug 11, 2025 at 5:21=E2=80=AFPM Brian Masney via B4 Relay
<devnull+bmasney.redhat.com@kernel.org> wrote:

> From: Brian Masney <bmasney@redhat.com>
>
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series.
>
> Signed-off-by: Brian Masney <bmasney@redhat.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

