Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 686ABC27C4F
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Jun 2024 10:02:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UIal9mSNuB7WVuajAQysXy9I34dokLqqKQSl/SD8Ip0=; b=kmUOU1h2Ksk3gysh/UPtJQW3WE
	+p4F7btQbmot9nKh0+JSndsLIbYUIqjV8dpFX6bQJosSQdor3o7vpO/UdQFrEdjPw2tUDeDYp1RKp
	HFok2HA5tDV5SW46HP97DaYimizKmv9a94aaL5Fd9qaY1dJ+TNBduIZ6sA2b1nZ2TsNjMUIu7GeVX
	VMWOY1sMMeJVC8QjC3UbnEjHpaa4NpnAuErzc1iHgnJUvqj1cX9wSnuxTCALCxZn3DQnFD1pRMuw5
	zqy25VuxGcR009U72ocg8wbny/HrAN+tOrkw+hLrqZIKolOm9zeXtiBcGgglxOpoD2LzJwtC52kQ6
	AjxU35Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMPTu-00000006E97-3qxc;
	Wed, 26 Jun 2024 10:02:26 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMPTr-00000006E6Z-1zpA
	for linux-mediatek@lists.infradead.org;
	Wed, 26 Jun 2024 10:02:25 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-52caebc6137so6171842e87.0
        for <linux-mediatek@lists.infradead.org>; Wed, 26 Jun 2024 03:02:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719396141; x=1720000941; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UIal9mSNuB7WVuajAQysXy9I34dokLqqKQSl/SD8Ip0=;
        b=qNqesiAC1X7e1EkVCSz62k+JFehhes2NlVG/hHoy85saQmO8K7zhG02Me767JypiZM
         sc6fPACY2nQGAdHO+awWUXeFR/hIr/tCF/DkCRuVGqx88Q8OLHb9q0h++sGlaao7cas0
         vqFBQ37EZrIYiUFIVJDvM3iDeg/1uuxC39itKAEYrMVoY42tjTSXD1GV++QA93n8EUqr
         iAT5L0VEmo+AG+Da1/Ro/gVI4DngXS+Dx7BIXusa564HZ25KuevWOwMThRRRqxjhry8E
         T20q05XDjwmdspCK1LBWN2UbwKpFySrj7g/cwGAoWjAh8cnRKCA+y2OecBg4IyV4J2oU
         SN2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719396141; x=1720000941;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UIal9mSNuB7WVuajAQysXy9I34dokLqqKQSl/SD8Ip0=;
        b=eQjmvf5T2D7YQ0JSi2L79qgj62vSA+dM+rMfeycoYnqM7iP/x8pNkLOImr+cIpijtZ
         elEbCzNK3jzHz58/OtTwZ9So7JXyeURbrYJ0umOaYMnQ/43nXQG4Yn8SHVHhgCTQE0sj
         DeI5yusGdvgKrIInmChO/32FS9MLfPN//8ekGUmpmJpZzHkAHuSzHy9+ibX/eFv3VuB9
         VS+k70vfbkxdesKj0StaJYHi/E9KNVlPnkSvIm7zNMq/jyGl0qcNKViFCiJlgWwXLgni
         gnQG4jVIWhV+2zsvoyLwk7swVZIISy8ty6Bpn57AVC9ZGIlpkxHh+Lu2z4/BG2sYozUK
         CUDA==
X-Forwarded-Encrypted: i=1; AJvYcCU7I8gMvM9sgQZBM5TF4sdqKMaXhq0C9niwpXUw2Jog4jMlVUP8LiGPNc3KFo/fK8OPNeBtdhuR5J95lfDe3W5SjKJ8yuq8+hp5GIrRWx5GDqss
X-Gm-Message-State: AOJu0YxUvX1zdDDp7KiIUoNfulCawy/Upw1e9+oY5oeuBUorIQGobNU2
	1NfUB6CyUTepnGyW+uYXRjCTKMShitGZdedxO5XFf/X1+vG8R0zCcAkdpT68udLy/eEQgvtMp35
	sm9k1EHFnCOJ52hFL75Qz5OnL2tviqTxKAR4YCg==
X-Google-Smtp-Source: AGHT+IEEH1F7Tv7LomODsunYV84Dtc4zLrPpgRRnnl78k+rzuBYmNhragIOzGe8Zi41e1oTPofFlhnZh4uvVT5y70J8=
X-Received: by 2002:a05:6512:2254:b0:52c:8fd7:2252 with SMTP id
 2adb3069b0e04-52ce18324cdmr7591081e87.11.1719396141307; Wed, 26 Jun 2024
 03:02:21 -0700 (PDT)
MIME-Version: 1.0
References: <20240504-pinctrl-cleanup-v2-0-26c5f2dc1181@nxp.com> <AM6PR04MB594163BAB898D8689A94056F88CE2@AM6PR04MB5941.eurprd04.prod.outlook.com>
In-Reply-To: <AM6PR04MB594163BAB898D8689A94056F88CE2@AM6PR04MB5941.eurprd04.prod.outlook.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 26 Jun 2024 12:02:09 +0200
Message-ID: <CACRpkdb17buPQVupCRDthvAgMKpvKvRWEN5GbA7pyF9NxymGEg@mail.gmail.com>
Subject: Re: [PATCH v2 00/20] pinctrl: Use scope based of_node_put() cleanups
To: Peng Fan <peng.fan@nxp.com>
Cc: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Dvorkin Dmitry <dvorkin@tibbo.com>, Wells Lu <wellslutw@gmail.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Emil Renner Berthing <kernel@esmil.dk>, Jianlong Huang <jianlong.huang@starfivetech.com>, 
	Hal Feng <hal.feng@starfivetech.com>, Orson Zhai <orsonzhai@gmail.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Viresh Kumar <vireshk@kernel.org>, Shiraz Hashim <shiraz.linux.kernel@gmail.com>, 
	"soc@kernel.org" <soc@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Patrice Chotard <patrice.chotard@foss.st.com>, 
	Heiko Stuebner <heiko@sntech.de>, Damien Le Moal <dlemoal@kernel.org>, 
	Ludovic Desroches <ludovic.desroches@microchip.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Aisheng Dong <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
	Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Chester Lin <chester62515@gmail.com>, 
	Matthias Brugger <mbrugger@suse.com>, 
	"Ghennadi Procopciuc (OSS)" <ghennadi.procopciuc@oss.nxp.com>, Sean Wang <sean.wang@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Joel Stanley <joel@jms.id.au>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Tony Lindgren <tony@atomide.com>, Stephen Warren <swarren@wwwdotorg.org>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-stm32@st-md-mailman.stormreply.com" <linux-stm32@st-md-mailman.stormreply.com>, 
	"linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>, 
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, 
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
	"imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, 
	"openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, 
	Emil Renner Berthing <emil.renner.berthing@canonical.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240626_030223_594841_65A27E4C 
X-CRM114-Status: UNSURE (   9.87  )
X-CRM114-Notice: Please train this message.
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

On Tue, Jun 18, 2024 at 1:52=E2=80=AFPM Peng Fan <peng.fan@nxp.com> wrote:

> > Subject: [PATCH v2 00/20] pinctrl: Use scope based of_node_put()
> > cleanups
>
> st/stm32/renesas patches are picked. Would you handle the remaining
> ones?

Hm right, I applied all that apply cleanly:
971c8b4c08e7 (HEAD -> devel) pinctrl: samsung: Use scope based
of_node_put() cleanups
3a882554a3bb pinctrl: k210: Use scope based of_node_put() cleanups
7f500f2011c0 pinctrl: freescale: mxs: Fix refcount of child
d7f5120a944a pinctrl: pinconf-generic: Use scope based of_node_put() cleanu=
ps
240c5f238d59 pinctrl: bcm: bcm63xx: Use scope based of_node_put() cleanups
3a0278cfb448 pinctrl: mediatek: Use scope based of_node_put() cleanups
c957ae7e7e68 pinctrl: nomadik: Use scope based of_node_put() cleanups
3dcc01b36f18 pinctrl: s32cc: Use scope based of_node_put() cleanups
7c2aabb56f92 pinctrl: at91: Use scope based of_node_put() cleanups
56c42f6c7b2c pinctrl: rockchip: Use scope based of_node_put() cleanups
8c5dc2a5b3a7 pinctrl: spear: Use scope based of_node_put() cleanups
794e5dc533b0 pinctrl: sprd: Use scope based of_node_put() cleanups
8fa99c00351c pinctrl: starfive: Use scope based of_node_put() cleanups
11eefc0ac884 pinctrl: tegra: Use scope based of_node_put() cleanups

Can you look into rebasing the remaining ones?

I am a bit unsure about Samsung, Krzysztof usually pick these, but no big
deal I guess, if he objects I can just take it out again.

Yours,
Linus Walleij

