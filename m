Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BAE2CA0EE6
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Aug 2025 11:35:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RdTVW2acL3x4TY+q3fiwzcKJmZ14PXDkj8EpJokxAbo=; b=lY2gjeXbGdbEUpneC+DAu5ASb0
	pauyk47DDu6/wReCf13KaQp465mpZoSU6pbna0iY8sj8IPrTJ8+ln31iMd+ny8Uhl1AHsqrB/2FNb
	jI70ru2cVuqMpKM8rxmckUzmfbjqsxtkNNoE3OnEmct38l8a2X9QW0KIy1/aeG0A3QN6HhYCs1eUF
	WJVgkB7H4DIfJebT7DiF1Bht2wzmY//pwTnFEMQbfMOcb3uJaP5HFDnuZjtxZt7cK3m/ijvEPeA+O
	JGveUyoddpNvu40sqvUUrBJp4WeBf5CI5YtLElK6pgvhUTgApcCW+L7wS0rKhT8K7eGG+J6zrlVzC
	BGM0jPQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoKd9-0000000AIi4-1OZX;
	Tue, 19 Aug 2025 11:35:55 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoIwm-0000000A1LD-1F1H
	for linux-mediatek@lists.infradead.org;
	Tue, 19 Aug 2025 09:48:06 +0000
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-333f8d3be05so35095871fa.0
        for <linux-mediatek@lists.infradead.org>; Tue, 19 Aug 2025 02:48:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755596882; x=1756201682; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RdTVW2acL3x4TY+q3fiwzcKJmZ14PXDkj8EpJokxAbo=;
        b=lXf18gYa4Bs0bPrmqC9hbXXB7hZQNHrK5ZlVQUvgnAI8NgcKjGznZM6qvOcsqnC9/8
         jHChTVfs7TfYQystA6stgJeO7S99Nz+HXUJC6IHyBcBCiKVBRX17JOQNpnOZWYkOU1LN
         y4hyjatQJEjwdaZO1DttPqWljuuoHV4bayJxqh14wOxyzpAGp08EOfrAoHKlna/3CSVi
         Iif66G99DQHP2LADxwWs86x4rNfeuToR+dzdCnUjwPov/vsHCKOQXkNeLUYNAaqhMmhq
         AHcnyg4OGefL8FFPxMYo5lU07kaVEDRxZ6tIzlvF2PJl9IfWjJzRXOPbfAgvtClBW7OE
         b5HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755596882; x=1756201682;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RdTVW2acL3x4TY+q3fiwzcKJmZ14PXDkj8EpJokxAbo=;
        b=ig/pXYHQ29t1nTdItnJpcNDuGe7pKOEglWErf14vqEC+L4K7In2GxRa4ECNW19r0XW
         2eqMQ7lwPEdNs/fz/OQulMcJZ410F1D20DZbk/dBATKchkukAe0dI6fz1D4rYMfz0sFG
         Dn6uid+mvXDObWPJ2dmi/q4WBCYLu8pqmzg3XDSuJcFNNXmrVubwOb6Olh5bTnDJa/bZ
         J+lScXii+t1vAIvBxUsyF6dPhDHlnwaH7detm+UM9Q7gbFjPbKlTGH+U3t3C/XVhth8f
         vt1vSmBbuq4VV2P3txxnDmm8eZGp5FYKdDB8eUWqfedoK1pnkd+VhpbhKu1XPjeFXYVc
         iKzA==
X-Forwarded-Encrypted: i=1; AJvYcCULoAcn1WjHghgj2qfUeTq0fVdf1MxD/ceuB1LJekqdW2DeyUBaVG8eweW2H4uciNyGz3fpP472wypqBT3bwQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxXg6sU+1hrI62IKCIPOTMKUUaIYHKrP3AiJMU9uiXwXySoNvQ5
	Qvr1nSnVEnunF2pdOqSiQnEr0m98f03yFto0dhKOCnXDqZ5BL3zeK7YSY6j++9SNMcY6iGHzhZm
	gMQFsmquBQvw0ph9ZXRAqpL6A0Z8yZ24IL67ffkQXag==
X-Gm-Gg: ASbGncsQV5uyBHmTWmY6QGBHpLDCVVHFaiZEAWmyyaBAW5UW17F+Ca3HhBNSDkJHNAr
	1UqnbGbsEPGCsZPqtPxGsGxdojoiExMAcq+45+ycDqreNtgTQnfFkUkKoBDmqRGvIjVEaOtBhwp
	gx2wo0MDv/97tdWL4IB2M23Xb18l0uYWK6rZpEXzXQpxjoajQDskbxad1Ir3mM/mso9stsJY/7w
	gKXqno=
X-Google-Smtp-Source: AGHT+IEolFO6aeJABYr1hNPxQasixpAjIgJqFl/o9dwJCRxvFjpbc3xagoFqiJPlswYsIWJYgR30Ss513xxDR9NTkTU=
X-Received: by 2002:a2e:b8c1:0:b0:332:45b5:d68a with SMTP id
 38308e7fff4ca-335305347e8mr6104861fa.5.1755596882380; Tue, 19 Aug 2025
 02:48:02 -0700 (PDT)
MIME-Version: 1.0
References: <20250811-clk-for-stephen-round-rate-v1-0-b3bf97b038dc@redhat.com> <20250811-clk-for-stephen-round-rate-v1-108-b3bf97b038dc@redhat.com>
In-Reply-To: <20250811-clk-for-stephen-round-rate-v1-108-b3bf97b038dc@redhat.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 19 Aug 2025 11:47:51 +0200
X-Gm-Features: Ac12FXyAMutAnmM6yYaTGFkQgGmOcrXudlcTGzS_av87nGHcGPs7Xb4FZygWAbE
Message-ID: <CACRpkdZonmP8rSQS-rwzthNPv_MyddMReZQaD13b1qkRexxWyA@mail.gmail.com>
Subject: Re: [PATCH 108/114] clk: versatile: icst: convert from round_rate()
 to determine_rate()
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
X-CRM114-CacheID: sfid-20250819_024804_369496_FA684344 
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

On Mon, Aug 11, 2025 at 5:19=E2=80=AFPM Brian Masney via B4 Relay
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

