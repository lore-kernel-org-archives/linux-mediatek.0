Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2A75C5DF8C
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Aug 2026 04:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aZ+YAW/hXFppA4FxL5IflpWDS7HfTYg8qTJoBoXjwNs=; b=abVKgzKjOEZrKVSPVKPKASN7xA
	ms78ApGTxWEVc/rR5GgxmLzS0kg2WJyuhr1x3fdK7o/xb7f6+mJgmuhu421OtjBrQIN1NX6oI5Exw
	hUzLPLWaGdjNkCR/6SO3+sTnHBJjBasFvZV1QzRLig7EkmtI7mwtdr3LJAT4sQdNEDQ55MUXdxLMK
	6kkq07MJko/vT0kvVltC2fmDHcM75YRtlNas8r1+1Cal4XaQEf1gr8OCl+To9K7/pxd4UgqWnupZA
	K2Rp9CSrT7Lg5ZXbdldg3dgV+wLBD7fZpk+oksVVnFd9Ei10Eg/UkUFeCo7sET7hxzSPAX5EzUIEg
	+XDVLnHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyLx3-0000000FtZs-2Y7k;
	Mon, 24 Aug 2026 04:06:26 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyLx0-0000000FtYr-3qFh
	for linux-mediatek@lists.infradead.org;
	Mon, 24 Aug 2026 04:06:24 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-cbb8b54fcf8so2888801a12.0
        for <linux-mediatek@lists.infradead.org>; Sun, 23 Aug 2026 21:06:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1787544381; x=1788149181; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aZ+YAW/hXFppA4FxL5IflpWDS7HfTYg8qTJoBoXjwNs=;
        b=GttA3kzxO4Yv/WcOOFGv2H+8cgCoOfNaCscQi4ztq2tnP5oRbbOu7LE9MxadIleKok
         tX2s6FU0MlfzHYCzdHetEhgOfWYNeWy4c+GChTg0gF7qhrSb370nxcXie+EJ3dRd38Ag
         JysFR8vS206NrfnS/NIwVVP2KLS1nO6uFyUCzZTjeIM+GiUMJuNi1r38Ge4b3nktANlJ
         zZKqn+kWsa+fPUCWI384btqFWsjtvQQkNDLw7yyKO9L1Gbh+3hdMmN6sWwaDgfmUiumV
         w+rC0jSxzIoSr3cmWHZzSanrBmiQ+SNTB7Jfrsw4p1Ob8FRcrJ8INX+ufDSG+tkbb0oh
         SKFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787544381; x=1788149181;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aZ+YAW/hXFppA4FxL5IflpWDS7HfTYg8qTJoBoXjwNs=;
        b=LiyuomAa/Imj0ZgXonm1L77tAxkM2VVDvZSXcN/2pe/2tz85GTuKGAX7mQnx1gHFXd
         JCKNTLpAilpMq4OZY+8/x3HhuCfsX4EXd7+cm7ynOyPDjEUncaT/KmdXV3C0l7SPyfEb
         nUKHGiwkk4HdLFPsrCvzsydCJpdn64khNqgVjGxaissr/tE4QeVy7KQv7dvfY6nxyWk1
         IGCMoRJQez95dnzS+7WLLl8UE4teZh53eLwXNux6DsGS9IdWVW224Rqn7nkZAvZyDtrO
         9nlbZOja6kpcB8mNppIRv6CQpaBl1YJ18YscHMC9ioS8fCQ35zYqAZxic7YD3LHPAZiB
         LpFQ==
X-Forwarded-Encrypted: i=1; AHgh+RqZ8SozDrF1pGtQEkBpxa+nfszEil3RMu3Hh4/oWNlSpXatW993bq9o1jMbtoXK7Hrvdj8jSZywTm7iCIL14A==@lists.infradead.org
X-Gm-Message-State: AFuF++n/Kmfucp7UkAVA7rGQcKsgbY9nl4mdsFAFkqkgy2QL92hnPPoe
	MlkVJWTlPU4U32hjqdDdUc0h914opHYgsHzSGxJeLCgdMxKWMg7cZ1Zx31Zav3XyXFw=
X-Gm-Gg: AR+sD10pVdxLu+LS1RBaxVGk6iYMaY+eHzxb4ecExz8+65jwkNlAUZ2+g0Dbx/K0Tu7
	b9X8CsFFN9Gukq90qkiopKO0OHFfngau0qopUeF75Z6bjdCZiO4EhYWuS/PP9Jzl/xMhuWVTtvV
	Sh9dhQ66jGRjyIlcfrzvHzu/ESdhhGJaX3PRF/TwVzAnPfDK9XALMXsEOs4U7iioRd09XMd/0Og
	qhJoFcGKTMBhwJz9iYxfCYu2Kz+Y6yl3QTf0vCAI6ugUBVB8aTHkj2Hpf0YKcgI9M9+RViJWW1c
	KVlQvFyepylt/aJIBEw38WK98gzPqfNR3LB0ipxmUGvRQFfu18bTnDqjiM+bEdHecfHjxTWeOHs
	ACU4bRRVPQDla6JvMbarJ4j5pfNFdsZ2n8qVUSotiyA6ptNmEmRCPY+54TRWFlu35oCDn3iLyeO
	Of/KlFkuNEuFYDtRW2+b50+9A5Webgl/v5YYaZCmEPL9RqJrmCCRwMfVXJLGbD+5s=
X-Received: by 2002:a05:6a20:7288:b0:3c3:6b6e:8ba0 with SMTP id adf61e73a8af0-3cd3008a6f1mr36995990637.11.1787544381391;
        Sun, 23 Aug 2026 21:06:21 -0700 (PDT)
Received: from localhost ([122.172.87.224])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1418619d6ecsm19733419c88.14.2026.08.23.21.06.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2026 21:06:20 -0700 (PDT)
Date: Mon, 24 Aug 2026 09:36:17 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Ryan Chen <ryan_chen@aspeedtech.com>, Joel Stanley <joel@jms.id.au>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Billy Tsai <billy_tsai@aspeedtech.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Taichi Sugaya <sugaya.taichi@socionext.com>,
	Takao Orito <orito.takao@socionext.com>,
	Linus Walleij <linusw@kernel.org>,
	Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	David Lechner <david@lechnology.com>,
	Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Paul Cercueil <paul@crapouillou.net>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Vladimir Zapolskiy <vz@mleia.com>, Heiko Stuebner <heiko@sntech.de>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Viresh Kumar <vireshk@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Emilio =?iso-8859-1?Q?L=F3pez?= <emilio@elopez.com.ar>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Ulf Hansson <ulfh@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-clk@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org, arm-scmi@vger.kernel.org,
	imx@lists.linux.dev, linux-mips@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, soc@lists.linux.dev,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 33/45] clk: spear: Make sure clk_init_data is fully
 initialized
Message-ID: <aovDOSMKhHLI70dW@vireshk-B250M-D3H>
References: <cover.1787239813.git.geert+renesas@glider.be>
 <d4500d249021013d52aa87407f875dc203a251df.1787239813.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d4500d249021013d52aa87407f875dc203a251df.1787239813.git.geert+renesas@glider.be>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260823_210622_963972_F834D1AE 
X-CRM114-Status: GOOD (  15.44  )
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

On 21-08-26, 10:53, Geert Uytterhoeven wrote:
> The clk_init_data structure contains several mutually-exclusive members
> for different methods to specify the possible parents of a clock,
> prompting drivers to initialize only the members they need.  However,
> not initializing all members may cause subtle issues, which are only
> exposed when CONFIG_INIT_STACK_ALL_PATTERN or CONFIG_INIT_STACK_NONE is
> enabled.
> 
> Make sure all members are fully initialized, to avoid such bugs, and to
> prevent future breakage when converting drivers to a different method
> for specifying the parents.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Compile-tested only.
> ---
>  drivers/clk/spear/clk-aux-synth.c  | 2 +-
>  drivers/clk/spear/clk-frac-synth.c | 2 +-
>  drivers/clk/spear/clk-gpt-synth.c  | 2 +-
>  drivers/clk/spear/clk-vco-pll.c    | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh

