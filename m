Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B0E6CA0EC4
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Aug 2025 16:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZNmGluZMVEODqqLey7tscfNEcE8jZgnd0oIotEJMQE8=; b=BbY8aweYC4bp4YjHi/EQrlz9OF
	wBVSUgl3AjBRCdb6xBiSkYlN6w4A988j1Cplancf8yBOFK+go7twa8dVkPBbPIFKoB35sOA7cdNV/
	1GMUcfSj6Et+Kfl8n/hxj7SU8+6BOj1JQ6RKBMdyw/ZS5IfN8wbe8SyukP2gwcY4EOtthiwvr+loL
	mlbY4uls2OuUXld9oZv5EAWlcsbtOxpvRfdpq6v3zqh+6J8tkqAMSQLV4P3ACgnkQVkEW65HapfPN
	31w6vYqW68K8MqgGNlBgJ585kTP49PoNX55T0OarKAtpZ7S1FuLDOD/ttHtbkMVz9qLt0fsf4jVWK
	pJaMN2Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulriy-0000000BIzY-1sqO;
	Tue, 12 Aug 2025 16:19:44 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulmQ6-0000000AWLD-1KSG
	for linux-mediatek@lists.infradead.org;
	Tue, 12 Aug 2025 10:39:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1754995192;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZNmGluZMVEODqqLey7tscfNEcE8jZgnd0oIotEJMQE8=;
	b=M54z3/5pXb5GkYjtJgbFCyL8oVz++zYOEMFk7MoeVj+Ck3Up5vVQVBEOn2WtAjJpz1FdGS
	0cNCkZnALwz1Ly1GaSTY4PWCcxiilmj6DgKixlIRmAn3MWYMMgl3srX7tRasxlxBZPstMA
	fVObDPq9hzFZPrUZfw7h7Eoo8W10X+I=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-121-5Ut3VTMFPjmblAiV8ld-LA-1; Tue, 12 Aug 2025 06:39:50 -0400
X-MC-Unique: 5Ut3VTMFPjmblAiV8ld-LA-1
X-Mimecast-MFC-AGG-ID: 5Ut3VTMFPjmblAiV8ld-LA_1754995190
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7e348600cadso1256035585a.3
        for <linux-mediatek@lists.infradead.org>; Tue, 12 Aug 2025 03:39:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754995190; x=1755599990;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZNmGluZMVEODqqLey7tscfNEcE8jZgnd0oIotEJMQE8=;
        b=nOVAIkJxiKx7JPTDSkG0w/jhpgCBYpdY8DfISwFlAdPRAvxbjyp2lJq2ca4VfDJ3om
         cBvH17Om1Zpgpl5pF9Yxbi0wAv0tGf0f325xmig8gCLpePmo33vm/FctlBwi3rnVyVai
         P28fHI9Kz3okGeI+yY1ppAwU98gp+rQQ6ZA+hkPxnYtlk8lLoy2+20+DcBIBH/bAjIvz
         gNBfYpAWUZjDW/91Q0EyWAAklj28AHpvut97LwVLDwYfgaKArdWvfLEuZ1AZkfLR54Gp
         Qwk0GdPg9O2REanf9Pipkxval2IHIAvR9u7eek+RHMCtYmRe5Rc8EczJXCEEjgz0yirm
         yZjQ==
X-Forwarded-Encrypted: i=1; AJvYcCV7l0gpeVL/+i1W7ni9PrhkKsO7uoOuLN3DE2e0auvN023b55HwK2AUIUQNoX1InlBw/EoZdMla40Ssxmd03A==@lists.infradead.org
X-Gm-Message-State: AOJu0YxYO4l6jcdfJZnw5aIBbBdTBOi0nMI9Rw4rn/GANJp8tniI4p1a
	MbWOdeMrLZabLLOuRPve5VR9gwxPzjIrasjSVbo+AoZzzymlg3GhftYaDs27vgFxrrVKx4MUnFN
	WcTyTnNReZM7t8tKHegv/p7SHLFMKmBpqAz1f74r8YA6XEuDDCAi57nWfJR2O+Pv+7kjAX7omsw
	==
X-Gm-Gg: ASbGncv1o7uqWEhSUH3qvVA1nWvRuiW/l7EMCrIjIpsIVckQfrjxkqljgLCImPgmb6h
	QpcBWcmxfgjNV9QEkJUj6EK4+DOTxP7iW6AQQ1gjrfJSP0qJDTJ67WSNGaRlqYiyr6n7b9T/LV5
	R60PZgzPJdyw3h0x6U38n6jwOpRNwQ9q3HzObSt5xwUylc4LnZ5pIrdGm/x0EdSgaY1vrOpjtBO
	goVsos8q2l6on7OJ1kbEOBCa6QdOJf5ccSBTKpNhaAyedswyCPVQC2vQffylOyi+7Er2cNYabTr
	NQFASDtTsLaWXIwXCJiIdh82m6l0ejRnBh3mO3M/WdDsKOGLWQczKXk/PiCInDw=
X-Received: by 2002:a05:620a:126c:b0:7e8:15ce:bf9f with SMTP id af79cd13be357-7e8588b064emr355642885a.33.1754995189855;
        Tue, 12 Aug 2025 03:39:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFnBK/VwO9xaDEZqPIr5Ki0EDBjQlgku4qoR/ofUy7muXwNiOHVcU/4sdcTQibJSWhG5zm1ew==
X-Received: by 2002:a05:620a:126c:b0:7e8:15ce:bf9f with SMTP id af79cd13be357-7e8588b064emr355631785a.33.1754995188996;
        Tue, 12 Aug 2025 03:39:48 -0700 (PDT)
Received: from x1 (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e67f73101asm1727614485a.68.2025.08.12.03.39.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 03:39:47 -0700 (PDT)
Date: Tue, 12 Aug 2025 06:39:41 -0400
From: Brian Masney <bmasney@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Paul Cercueil <paul@crapouillou.net>,
	Keguang Zhang <keguang.zhang@gmail.com>,
	Taichi Sugaya <sugaya.taichi@socionext.com>,
	Takao Orito <orito.takao@socionext.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Yixun Lan <dlan@gentoo.org>,
	Steen Hegelund <Steen.Hegelund@microchip.com>,
	Daniel Machon <daniel.machon@microchip.com>,
	UNGLinuxDriver@microchip.com, Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Michal Simek <michal.simek@amd.com>,
	Maxime Ripard <mripard@kernel.org>,
	Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Neal Gompa <neal@gompa.dev>,
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Daniel Palmer <daniel@thingy.jp>,
	Romain Perier <romain.perier@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Heiko Stuebner <heiko@sntech.de>,
	Andrea della Porta <andrea.porta@suse.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Qin Jian <qinjian@cqplus1.com>, Viresh Kumar <vireshk@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Alex Helms <alexander.helms.jy@renesas.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	sophgo@lists.linux.dev, linux-mips@vger.kernel.org,
	imx@lists.linux.dev, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com,
	patches@opensource.cirrus.com, linux-actions@lists.infradead.org,
	asahi@lists.linux.dev, linux-mediatek@lists.infradead.org,
	linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, soc@lists.linux.dev
Subject: Re: [PATCH 000/114] clk: convert drivers from deprecated
 round_rate() to determine_rate()
Message-ID: <aJsZ7bs0OMXcrStU@x1>
References: <20250811-clk-for-stephen-round-rate-v1-0-b3bf97b038dc@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20250811-clk-for-stephen-round-rate-v1-0-b3bf97b038dc@redhat.com>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: xqu037BeYkULbIDiX1jy-c3aUIYg6t-_m60CRPcx7XY_1754995190
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_033954_432256_4CE3B1E8 
X-CRM114-Status: GOOD (  16.42  )
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

On Mon, Aug 11, 2025 at 11:17:52AM -0400, Brian Masney via B4 Relay wrote:
> Once all of my conversion patches across the various trees in the kernel
> have been merged, I will post a small series that removes the
> round_rate() op from the clk core and the documentation. Here's the
> other patch series that are currently in flight that need to be merged
> before we can remove round_rate() from the core.
> 
> - arm32 (3): https://lore.kernel.org/linux-clk/20250710-arm32-clk-round-rate-v1-0-a9146b77aca9@redhat.com/T/
> - clk/tegra (6): https://lore.kernel.org/linux-clk/20250710-clk-tegra-round-rate-v1-0-e48ac3df4279@redhat.com/T/
> - clk/ti (7): https://lore.kernel.org/linux-clk/20250811-b4-clk-ti-round-rate-v1-0-cc0840594a49@redhat.com/T/
> - clocksource (1): https://lore.kernel.org/linux-clk/20250810-clocksource-round-rate-v1-1-486ef53e45eb@redhat.com/T/
> - drm (9): https://lore.kernel.org/linux-clk/20250811-drm-clk-round-rate-v2-0-4a91ccf239cf@redhat.com/T/
> - drm/msm (7): https://lore.kernel.org/linux-clk/20250810-drm-msm-phy-clk-round-rate-v2-0-0fd1f7979c83@redhat.com/T/
> - i2c (1): https://lore.kernel.org/linux-clk/20250810-i2c-round-rate-v1-1-9488b57153e7@redhat.com/T/
> - media (4): https://lore.kernel.org/linux-clk/20250710-media-clk-round-rate-v1-0-a9617b061741@redhat.com/T/
> - mips (1): https://lore.kernel.org/linux-clk/20250810-mips-round-rate-v1-1-54e424c520dd@redhat.com/T/
> - net (1): https://lore.kernel.org/linux-clk/20250810-net-round-rate-v1-1-dbb237c9fe5c@redhat.com/T/
> - peci (1): https://lore.kernel.org/linux-clk/20250810-peci-round-rate-v1-1-ec96d216a455@redhat.com/T/
> - phy (9): https://lore.kernel.org/linux-phy/20250810-phy-clk-round-rate-v2-0-9162470bb9f2@redhat.com/T/
> - pmdomain (1): https://lore.kernel.org/linux-clk/20250810-pmdomain-round-rate-v1-1-1a90dbacdeb6@redhat.com/T/
> - tty (1): https://lore.kernel.org/linux-clk/20250810-tty-round-rate-v1-1-849009f3bdfd@redhat.com/T/

Konrad noticed on patch 90 the space after the cast. I thought I fixed
all of those by hand, but apparently not. I looked through this series
(and the others above) with `grep "u64) "` and `grep "long) "`, and found
4 other cases.

Patch 38: clk: nxp: lpc32xx: convert from round_rate() to determine_rate()
Patch 64: clk: x86: cgu: convert from round_rate() to determine_rate()
Patch 68: clk: zynqmp: divider: convert from round_rate() to determine_rate()
Patch 95: clk: rockchip: half-divider: convert from round_rate() to determine_rate()

Brian


