Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A0E5C624C6
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Sep 2026 07:22:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jx+XoqcBBsA+m2qrM8HxfQHaaz8x8crvSJWq14ITrJ0=; b=GeVdlqFSlWVdB6PnXte9S74L5h
	jGmsSKFKRMiHZXKWhN0OD2+g2w2ZcU2XSdJgHvUgC27wYoOkjb4nhG3rv9nZHLrpGOrJ16983soci
	S63Q9p4N3Vcgtj19vP5Z70BqK/ODJyy6arJiLvChPj1Xz1vi5eGdWyQtd8G2IvhUvJ9+84zXuusc/
	v2M2vrHWXlW+oBaO4Ktv/lTISTClKpeQ4cXtlgjQ9Bich0yYtD5L504wQHqv3DctwHdeBpBPnIjyx
	aI8dLMjPHwqZVKTnv8AZCNi9ZIVimnksDF++m9opABalCzARKxpMu7KUxYXILc30qe7TeR91qbzYm
	VuS4RkzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1IpO-0000000B6rk-2qJn;
	Tue, 01 Sep 2026 07:22:42 +0000
Received: from mail-qv1-f50.google.com ([209.85.219.50])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1IpM-0000000B6r6-067H
	for linux-mediatek@lists.infradead.org;
	Tue, 01 Sep 2026 07:22:41 +0000
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-90cc372d6b2so40768706d6.3
        for <linux-mediatek@lists.infradead.org>; Tue, 01 Sep 2026 00:22:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788247359; x=1788852159;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jx+XoqcBBsA+m2qrM8HxfQHaaz8x8crvSJWq14ITrJ0=;
        b=mGx1t9zWrdPSqPyXyShzdpYa/bkd4A0EfwLZV4f4vqptbyqk8t0B4rBOHTE47IkSma
         WB/zKZ9qr4Anf10yodK8tETB+A5qnvQ9KVBrKAnq4g4W3CLjsbKwQceXiv4CrgNo6dht
         GaKlTeEryOf+km3kws9ypobg9OUMQCe+n1wKPer8lKkwxN8B/YQ/4LSnnvtDJzw+ENDa
         blGOOiUAMI/A6RhDlA1l9znBn4I88S/PUyc16w7ZsyAcw+CJmvPUVzGD+HqwLNGaiebx
         Nj0QjcVMe/gbs/zoJ+lpnJbs54A8yBVs6DOC2wSnHAp8a3WYGdwm2sfQZbOEUbg293S4
         LC0w==
X-Forwarded-Encrypted: i=1; AKwUvBwTwFTMrHOv04JTT+qukXJcUjXToPw06flxIOICnvYzlalr7kfk4vyCcfnE/2Uxr02YfUv1LEGswZD0YNMERg==@lists.infradead.org
X-Gm-Message-State: AFuF++mZsjfKID7WS8ogQN5ttbI3kWdb5LlmPxoY9RJ4NxF4dS75KERr
	nzwO5ej+k5jlkXvLDYlIQLUu017kXS6elQySdds4TFRwxXt6YqdVoEa5pJy9uVoz
X-Gm-Gg: AYBFou2bGHw442Am1+Y0Z881chmTvjB2TKkXsQ8JJ8u9i0qGtp1BZ6dgWHHSqMFG2L8
	2Oscb7sqbbNFGvDCEptCkRH2JiiCOorm5ypNvImmtEdX/wnNgQ8qyjm9NWmDRLc00h+XjqCcbf4
	W5VfWPcDIaty+Asf/bk5/STVhCyHd6eQ855ryak+7N5kzV3EN65JRSEQV3NU/2+kQJlgYy+HaQC
	ogM6BP7vCo/fouT9Fg4MuuhBXYYD6DN6BSm2BNRTIXykau4yGql98jL6qdzMP+ls2W+QHq8xxbW
	ZzMQV3TcRcmmpYf6YBN0eAxHHTvP6g1Apbrs31yxhdCA09KfXBkhP5OMCD0jFEj9I6VVWRP/bm3
	gAhZTCEmhQTzUK8HAaN+wq3OChb9jG6amCQ93s5aWsQXTnilGP7NKi9WTY7d4m0BlxXTaHahF/A
	kYp+TTpE9tIvPvqFtD9D8oTr/zEWBMYfbp1o48hSQzyp1xk9OjM3mSm9F3M5D2/9rkVhEXJkF3K
	JPgqKZeAYpeP+tOESgXvxfdSbkNXw==
X-Received: by 2002:a05:6214:2342:b0:8c9:c38a:20e1 with SMTP id 6a1803df08f44-90ce0c4dd2cmr327965606d6.10.1788247358578;
        Tue, 01 Sep 2026 00:22:38 -0700 (PDT)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com. [209.85.222.178])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90ce4512dcasm101992556d6.34.2026.09.01.00.22.38
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 00:22:38 -0700 (PDT)
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-9382fbb1208so464737985a.0
        for <linux-mediatek@lists.infradead.org>; Tue, 01 Sep 2026 00:22:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RofaB6qtUD5ejMoAJkUEmsGFkXei9xudGx40Kxl2WTMW0rbjnCz7NEnGAuvvmDDAMLH6BP0Ws+pzwKOEFl2HA==@lists.infradead.org
X-Received: by 2002:a05:6102:a50:b0:77e:6f90:4aad with SMTP id
 ada2fe7eead31-785962b2f0fmr9912673137.2.1788246874251; Tue, 01 Sep 2026
 00:14:34 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1787239813.git.geert+renesas@glider.be> <apWfW5ahiYagw0OR@redhat.com>
In-Reply-To: <apWfW5ahiYagw0OR@redhat.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 1 Sep 2026 09:14:23 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX8YidsoHudY54RQW4J=G446WNgRG6Q-P5f1YEHd3sHkg@mail.gmail.com>
X-Gm-Features: AcwNN1V5M0ZQ_v_xaH6RI1jedVGh-HNyKWbpGWR_Rc-YS9IPBF0NOfuHqPh0NM0
Message-ID: <CAMuHMdX8YidsoHudY54RQW4J=G446WNgRG6Q-P5f1YEHd3sHkg@mail.gmail.com>
Subject: Re: [PATCH 00/45] clk: Make sure clk_init_data is fully initialized
 (part two)
To: Brian Masney <bmasney@redhat.com>
Cc: Ryan Chen <ryan_chen@aspeedtech.com>, Joel Stanley <joel@jms.id.au>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Billy Tsai <billy_tsai@aspeedtech.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Taichi Sugaya <sugaya.taichi@socionext.com>, Takao Orito <orito.takao@socionext.com>, 
	Linus Walleij <linusw@kernel.org>, Avi Fishman <avifishman70@gmail.com>, 
	Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>, 
	Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, 
	Benjamin Fair <benjaminfair@google.com>, Sudeep Holla <sudeep.holla@kernel.org>, 
	Cristian Marussi <cristian.marussi@arm.com>, David Lechner <david@lechnology.com>, 
	Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Paul Cercueil <paul@crapouillou.net>, 
	Santosh Shilimkar <ssantosh@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
	Gregory Clement <gregory.clement@bootlin.com>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Vladimir Zapolskiy <vz@mleia.com>, 
	Heiko Stuebner <heiko@sntech.de>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, 
	Peter Griffin <peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Dinh Nguyen <dinguyen@kernel.org>, Viresh Kumar <vireshk@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	=?UTF-8?Q?Emilio_L=C3=B3pez?= <emilio@elopez.com.ar>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Prashant Gaikwad <pgaikwad@nvidia.com>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Ulf Hansson <ulfh@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Michal Simek <michal.simek@amd.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, linux-clk@vger.kernel.org, 
	linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, 
	arm-scmi@vger.kernel.org, imx@lists.linux.dev, linux-mips@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, soc@lists.linux.dev, 
	linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev, 
	linux-tegra@vger.kernel.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_002240_071809_D89FF4CA 
X-CRM114-Status: GOOD (  30.55  )
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

Hi Brian,

On Mon, 31 Aug 2026 at 17:36, Brian Masney <bmasney@redhat.com> wrote:
> On Fri, Aug 21, 2026 at 10:53:10AM +0200, Geert Uytterhoeven wrote:
> > The clk_init_data structure contains several mutually-exclusive members
> > for different methods to specify the possible parents of a clock,
> > prompting drivers to initialize only the members they need.  However,
> > not initializing all members may cause subtle issues, which are only
> > exposed when CONFIG_INIT_STACK_ALL_PATTERN or CONFIG_INIT_STACK_NONE is
> > enabled.
> >
> > Hence this series aims to make sure all members are fully initialized,
> > to avoid such bugs, and to prevent future breakage when converting
> > drivers to a different method for specifying the parents.
> >
> > Part One[1] fixed all cases that I identified to be real bugs, in
> > response to a crash I saw on BeagleBone Black.
> >
> > This series is the clock subpart of Part Two, which fixes remaining
> > cases that are currently harmless.  These are still fragile, and may
> > cause future breakage when converting drivers to a different method for
> > specifying the parents.

[...]

> 44 / 45 patches have been added to clk-next. I took it all for simplicity
> rather than everyone trying to cherry pick just their parts.

Thanks!

> Geert: The only patch that didn't apply was:
>
>   [PATCH 27/45] clk: renesas: Make sure clk_init_data is fully initialized
>
> I didn't look into it too much.

No worries, I have queued it in renesas-clk for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

