Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6641FC5DF81
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Aug 2026 12:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9ghuoduRfOzi+AYpDw8t1/oQryAhFbodaTAoc1849Hg=; b=YDwMp2Xv0pyQNX+rmh0t7JACuf
	lxH3DjSKnkmmCFBiDQYBaA3lNO9uMRRvtMVIqYlLZsGWW15qRQXgr8/cyFJV3T/zv88TS0lsNXNsk
	U+sNtDYwIGOxbyqCty3EjPWeT3a9lOq8FXVHXicv0dslO0U80QpX9CoKvkUPELZwbiaSo6B3OrMxW
	8yUSEvc4lZJ6hu4EkCRJ+kc3sC3CW/68CnCves0zTQhk4FkW8QegwLczm7knee6BMZgDhHKrwwpQ8
	ul982+pQk5xLxoyzkU4llx/mt5wsTplkEQM0vj2gC6gaQdNkC9pFriRDYaJ3lubBCcuyjfg2CdA4I
	Cvc2KBwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyU7d-0000000GcsS-0qTH;
	Mon, 24 Aug 2026 12:49:53 +0000
Received: from mail-yx1-f53.google.com ([74.125.224.53])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyU7a-0000000Gcs2-2qXk
	for linux-mediatek@lists.infradead.org;
	Mon, 24 Aug 2026 12:49:51 +0000
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-66c8e41f703so3979947d50.1
        for <linux-mediatek@lists.infradead.org>; Mon, 24 Aug 2026 05:49:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787575789; x=1788180589;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9ghuoduRfOzi+AYpDw8t1/oQryAhFbodaTAoc1849Hg=;
        b=dFOYU+E2zjEuEgRRv/6nTdl796+cVHKwaRq8EyNTRHCcBfaZZeQBp8+pIbMx1IQJkt
         p0y2PTacfXrJd66x39M/CM8eBPpziu8ZgPZi158KHXrPbmTFCxQ4UEX+APjBc0slEK9N
         dwpzXEFRfoDzLueuIGsU0RwJS/Xjq3bA5M4VEYF4ka/kd1/GgWEGFRyFk9ZQt4ZeIw6j
         AeMVDpjI+H8d6V1DwY2u8mxGs3W1gT0EnMa3R4PSOB2UosWPHnxU3DlmKGY0dtfq/zs4
         0Y51QkRJ4WJ/V+H3zYBb54alPI23X8V7ZV2DmqxHpywwIsVxez3tRI+iVqIwuq2Kl8sU
         aRQA==
X-Forwarded-Encrypted: i=1; AHgh+RrD9WIQmMSoEGDwPVWnRk7BQTZFri3fKMaEa1Kkqs1wvvjps+pUaw0o1GyGmxfJG94XwnOlA2n6D+EucP5BjQ==@lists.infradead.org
X-Gm-Message-State: AFuF++lbDAyNIqP/P41JDeCVsabTNR0jjlpzXjsM73bIY9hKMmqY7G6g
	rXHCI9gnyRVBBx7Lk1JxxWYE3Qt/iYWKzLSXhlI5Fj6TcBw11b+9AIi29crG0nws
X-Gm-Gg: AR+sD13VPxWzCvcONvbp32cWry/f2q458YWZnhXdoEmR5gNdX/Sn+kduEJPxzU+oiSO
	mMe0bwQ33Y6Cdh39409D6BXr3ArWxHf1d1crO1aKmh3FTeAJ7BLTDouL0qBf/3eBgS4GSao1HMS
	YAGcykpD8IXgv6CFpnNXQu10KNRqWJzRZ2dnrd+jkzl27UTNopSCY+kICVl04fICBrcx8pJQxD/
	9DFNCHC1lP22tNMLt2RKJ/mnRkOXWUDnRQhjxA2M5Ufkxe7YvkXADfLs7iVbyIS53tkrzoV52Ca
	Ut5veI56yp6VwIJxo1qGeT7f56ypdLZ5ezZvtTryI/by5qPdcVVzm03XzASjYg6Cei5sMx/3Bws
	UPwXysivrDj+33LgfyWdWu5peFmTEqsPXYCPqt+KQZDxluIFG6MD+HSJ/8iFjmbYYxkYQDWe3UN
	ef5GyoxnTepMkjvj5Azp40wV030gXSKCYFh4rI5W6dxZHiB/0X6RDNzTItpJZTfISBvR4kRDh2B
	mNT/O36p4g9Lq2MGfR4Uf+VsA==
X-Received: by 2002:a53:b804:0:b0:66c:7aec:7d12 with SMTP id 956f58d0204a3-66ce4b4ab11mr6151729d50.47.1787575789330;
        Mon, 24 Aug 2026 05:49:49 -0700 (PDT)
Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com. [74.125.224.44])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66cf46460a1sm3643846d50.5.2026.08.24.05.49.49
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 05:49:49 -0700 (PDT)
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-66c71239c48so4734670d50.2
        for <linux-mediatek@lists.infradead.org>; Mon, 24 Aug 2026 05:49:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrS62isAbDYtke13vsQMytI4I7rBtS+7BKsvkeBYRZUvNjJgRrlN1ABq2N/+xeeNCxZ2u04P7GrJm/boEXlZA==@lists.infradead.org
X-Received: by 2002:a05:6102:26c5:b0:772:5acc:b848 with SMTP id
 ada2fe7eead31-77a62c46273mr7826182137.6.1787575289120; Mon, 24 Aug 2026
 05:41:29 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1787239813.git.geert+renesas@glider.be> <87b3e83137e1a987f3c69d214706e93ef3898cab.1787239813.git.geert+renesas@glider.be>
 <60a8d05a-76fa-43c3-a0f7-fb26a3b659b8@kernel.org>
In-Reply-To: <60a8d05a-76fa-43c3-a0f7-fb26a3b659b8@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 24 Aug 2026 14:41:17 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWnXTAVZ_eBfoWNe-sy6BC1X+5EHkDw9R0TAA65Opzi_Q@mail.gmail.com>
X-Gm-Features: AcwNN1UOdKQEkPlARJoVF2UurscVPaHj9T1_AXs-3b7YtVRMAHuDfcVjJgM-XPk
Message-ID: <CAMuHMdWnXTAVZ_eBfoWNe-sy6BC1X+5EHkDw9R0TAA65Opzi_Q@mail.gmail.com>
Subject: Re: [PATCH 29/45] clk: samsung: Make sure clk_init_data is fully initialized
To: Krzysztof Kozlowski <krzk@kernel.org>
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
	Heiko Stuebner <heiko@sntech.de>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Peter Griffin <peter.griffin@linaro.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Dinh Nguyen <dinguyen@kernel.org>, 
	Viresh Kumar <vireshk@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, =?UTF-8?Q?Emilio_L=C3=B3pez?= <emilio@elopez.com.ar>, 
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
X-CRM114-CacheID: sfid-20260824_054950_746034_97EEF3BA 
X-CRM114-Status: GOOD (  24.95  )
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

Hi Krzysztof,

On Fri, 21 Aug 2026 at 13:04, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> On 21/08/2026 10:53, Geert Uytterhoeven wrote:
> > The clk_init_data structure contains several mutually-exclusive members
> > for different methods to specify the possible parents of a clock,
> > prompting drivers to initialize only the members they need.  However,
> > not initializing all members may cause subtle issues, which are only
> > exposed when CONFIG_INIT_STACK_ALL_PATTERN or CONFIG_INIT_STACK_NONE is
> > enabled.
> >
> > Make sure all members are fully initialized, to avoid such bugs, and to
> > prevent future breakage when converting drivers to a different method
> > for specifying the parents.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Thank you!

> Let me know if I should take it via Samsung SoC clock tree. I assume by
> default this will go directly via clock tree.

In that case, please provide your Acked-by, so the clock maintainers
don't have to parse your English response to find out ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

