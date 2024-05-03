Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E433CC4345F
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 May 2024 07:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9wIaPeFAaUloh+tV0Kf/Zmc8dIfcbAIB89NynZIAYBA=; b=TJuoLkwlG78DOD/tODxXQ2dQHE
	a1B9jmfTQxeKRqPyhysL5cCSqWYQzcagRo+0E25K0UaoGejIoMa/ZFNweiouFrg/TPADZ2S6+GyD2
	c0YDA/yda+uremytNYAFmk5WxJ489LsXi3sOjBXYqBAfOOKbjH2q9aOkY1twVf8y2EIKGvz/Rpj3L
	UlBKXcW58OxwvBiP5IFkw/hJ9ZGd3nI2DBYcqNIYUSf/c+eZOyiOirsz2iQBskfGMr/qekPQzvFbp
	DyRkfIIIessK3Ddc2yuuAJOk+z4CZ/7uoP68ZvGvou2OD4qSbR6wcfO4Eb9ItZypvMbJUMHfMfYt9
	h/ngn3bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2nDM-0000000FRIT-23YZ;
	Fri, 03 May 2024 07:20:16 +0000
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2nDI-0000000FREz-0gEn
	for linux-mediatek@lists.infradead.org;
	Fri, 03 May 2024 07:20:14 +0000
Received: by mail-yb1-xb2b.google.com with SMTP id 3f1490d57ef6-de45dba157cso8187916276.3
        for <linux-mediatek@lists.infradead.org>; Fri, 03 May 2024 00:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714720810; x=1715325610; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9wIaPeFAaUloh+tV0Kf/Zmc8dIfcbAIB89NynZIAYBA=;
        b=Bd4DWwcpMjbYZ2PjOXGK34TZlZJRuysXnvzGteBuhZPOwZshICPCQKg1DQphhEZvko
         2g6DkouojqWT1/J8Hs032XwHuOnl5SRws/kpnpiyPURPUfdsnPVZmp09dIrgcB3mJiQP
         vHHF4N4P0+Yq+ckDxfoVfg+7aLeu3vpG25MAt3RzLhsuoh9uCqKhbDhytFjuuVembrGx
         MthO8wVpTjobvZnSO+GbgX4zE2UvTUGKW28XI+J4aNrVgYshyBRqJ/2oAWvqnAXpQdCr
         4XtxvtfCsahMCdVrAGzZaVJesjF9BElb4kIt5xlqEIOFxp3/cBor7zOI38ciYpTZuJzW
         MOyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714720810; x=1715325610;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9wIaPeFAaUloh+tV0Kf/Zmc8dIfcbAIB89NynZIAYBA=;
        b=sbB/IEX202hgnqguAknc0fAkfftGkt0SWQKc8zGrd7QS4dyor8lfJcCdK/gBx7nKL3
         HiOig1GOzcvOQq7ic9irrxGesuRXG+UHF8/EOnNuUI7Qol0t76pX6tEZIlw2nhZI8C2I
         8DM01pEtgcJWPzCA78p/TtunwB+UlWVmlvpBzyudbFbk+jtI+kjSHUL9VENgh7jtSkkK
         OEEtMZHL2Qsfe7nlRs2L+CbmSyMcshmjJnIMe2V9BmzjhFt6aldPfl/uAL4BmMF3zddb
         h2fYm4dn2pBWo7tJqPrYQMh4fTi7gzvqx4h78XmITjd20b6St30CI5xga4Bexakrda7I
         Ab6A==
X-Forwarded-Encrypted: i=1; AJvYcCWOH3C/TMDmX6F94aa4PLv6jCsH43C70H69ibkDk8Pi4GrykrQgVlxXicWj1XtUFkeLY4S76+StKdFshjoAlIWOgKhlfCI6lDqsmq+IGICFRGjH
X-Gm-Message-State: AOJu0Yzem6iQJrBI0B/xoOf3ZwV72eBDaPirP/HtYts1CQ4XrtxReVoL
	fDeZ1//Sl1qXPZWqTBWwqkZ2taIG8qw34YxcMCN2JuLiFV0gAuj3aakAsj5dht7eI3A/9usZxS2
	hNGnKll7xAT8DyE3bORwJl1TkO3tHO9s9FvItrQ==
X-Google-Smtp-Source: AGHT+IG2e9YB/XnLTQbvqj0kK4ATPxoJ7R6aIP282PPsbZXF297lXvACY/w/LCEjCFtAwBrhBmRU/mc6jno/5QoxHeQ=
X-Received: by 2002:a05:6902:2203:b0:dc2:2b0d:613e with SMTP id
 dm3-20020a056902220300b00dc22b0d613emr2388159ybb.10.1714720809843; Fri, 03
 May 2024 00:20:09 -0700 (PDT)
MIME-Version: 1.0
References: <20240501-pinctrl-cleanup-v1-0-797ceca46e5c@nxp.com>
In-Reply-To: <20240501-pinctrl-cleanup-v1-0-797ceca46e5c@nxp.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 3 May 2024 09:19:58 +0200
Message-ID: <CACRpkdaRpJw=kHtya2iww7vvm+Bt6-oPMmz-6VzfhZniSoMP3w@mail.gmail.com>
Subject: Re: [PATCH 00/21] pinctrl: Use scope based of_node_put() cleanups
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Dvorkin Dmitry <dvorkin@tibbo.com>, Wells Lu <wellslutw@gmail.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Emil Renner Berthing <kernel@esmil.dk>, Jianlong Huang <jianlong.huang@starfivetech.com>, 
	Hal Feng <hal.feng@starfivetech.com>, Orson Zhai <orsonzhai@gmail.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Viresh Kumar <vireshk@kernel.org>, Shiraz Hashim <shiraz.linux.kernel@gmail.com>, soc@kernel.org, 
	Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Patrice Chotard <patrice.chotard@foss.st.com>, Heiko Stuebner <heiko@sntech.de>, 
	Damien Le Moal <dlemoal@kernel.org>, Ludovic Desroches <ludovic.desroches@microchip.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
	Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Chester Lin <chester62515@gmail.com>, 
	Matthias Brugger <mbrugger@suse.com>, Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>, 
	Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Joel Stanley <joel@jms.id.au>, Dan Carpenter <dan.carpenter@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-samsung-soc@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	imx@lists.linux.dev, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, 
	Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240503_002012_322586_F08B0BB0 
X-CRM114-Status: GOOD (  10.42  )
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

Hi Peng,

thanks for doing this! I am very much in favor of using
scoped management of resources where it makes it easier to
do the right thing.

I agree with Krzysztof's comment that we should avoid scoping
in cases where there is a clear path grab/use/release so the
code is easy to read already as it is. Let's drop those.

I saw there was some patch that was even a fix, perhaps I
should pick that one separately for fixes, but probably it is
non-urgent.

I suppose we will just apply v2 after people had some time to
look at it!

Yours,
Linus Walleij

