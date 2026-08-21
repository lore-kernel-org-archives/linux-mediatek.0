Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0129FC5DF89
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Aug 2026 13:40:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=snYMSQGLX7fdVb26BR0eBaIgLA3y4337AX1lKdDJKJA=; b=jJaiTVElUbp/8mrRkPS77cCIBN
	AndSmZW8oXDSdcwEBK6tf+dbf6bTSaRiMSdCcJCs6Sbg5ASjJZXFzwFoOFNm537yc4B+w2ArC+/Qd
	Ut+S5N7swebzR9DSKKIiCsZFFVoJnA8e1nKFbm6loRs+QtiQfqujrDmmtkBU2Frek3uBNqWgDldkc
	NdbmAtr2po8xcZMpOwsFrjOhnzXh13I2MXpiSPXA5ZqgFK1HXI8KrsPQLTPKes6dXb2PnYfHrfTo8
	foTIZbgerEmNF5pz3KlbodLBrUkAKnBAN7dzhev/xtZ7okKGJCbB0zdxhIGgmpLIPqyRmfHY+B59h
	fHe+hQgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxPTi-0000000DRXQ-1Ul6;
	Fri, 21 Aug 2026 13:40:14 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxPTe-0000000DRWS-253R;
	Fri, 21 Aug 2026 13:40:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1787319610; x=1818855610;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=nZtcGenSSy82MXscgS3TQDHNGhXxDRFUvHEV/XVmaDg=;
  b=HkCesPfiKW8TGknOzbSHutJsintlBZDqkwL7ahDn25sl2SwEfQuOYAah
   wQtU91KC8hkmXeqHCZU87PDyM7KUk5jrrtbMv7cg2SGarFm8LULSXR+J8
   xdci39QzCgusFXLn0pz0JYFcvmDIkHXC+ulcCqMorqa6Llxp/HNTHpZKG
   tQVUxdm8MehkltEZnbEuDkCyCbG0Z5C3vX6e7Rt4xKFllR2djLdqckcqC
   NB412aYSli6FOJL1+PmJV4OxfYgbWmw5HTIKcgPwGWKwCU53zQiB8BFQU
   DnabPDRliwLVKnPjFv1hPMr/g0mWK9/Y/EFSt0xtT+LFaMLu+XgSNlm5c
   w==;
X-CSE-ConnectionGUID: HyXRN8+nRO6IAOBi+2U6dQ==
X-CSE-MsgGUID: F1ngVutmTiOQH0sP1B/9VA==
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; 
   d="scan'208";a="62471628"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 21 Aug 2026 06:40:05 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Fri, 21 Aug 2026 06:40:04 -0700
Received: from [10.171.248.60] (10.10.85.11) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Fri, 21 Aug 2026 06:39:47 -0700
Message-ID: <0903bc22-e913-4e14-99f6-db6b97aa3a27@microchip.com>
Date: Fri, 21 Aug 2026 15:39:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/45] clk: at91: Make sure clk_init_data is fully
 initialized
To: Geert Uytterhoeven <geert+renesas@glider.be>, Ryan Chen
	<ryan_chen@aspeedtech.com>, Joel Stanley <joel@jms.id.au>, Stephen Boyd
	<sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet
	<jbrunet+clk@baylibre.com>, Andrew Jeffery <andrew@codeconstruct.com.au>,
	Billy Tsai <billy_tsai@aspeedtech.com>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Broadcom
 internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Taichi
 Sugaya <sugaya.taichi@socionext.com>, Takao Orito
	<orito.takao@socionext.com>, Linus Walleij <linusw@kernel.org>, Avi Fishman
	<avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, Tali Perry
	<tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, Nancy Yuen
	<yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, Sudeep Holla
	<sudeep.holla@kernel.org>, Cristian Marussi <cristian.marussi@arm.com>, David
 Lechner <david@lechnology.com>, Abel Vesa <abelvesa@kernel.org>, Peng Fan
	<peng.fan@nxp.com>, Frank Li <Frank.Li@nxp.com>, Sascha Hauer
	<s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Paul Cercueil <paul@crapouillou.net>,
	Santosh Shilimkar <ssantosh@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>, Sebastian Hesselbarth
	<sebastian.hesselbarth@gmail.com>, Vladimir Zapolskiy <vz@mleia.com>, Heiko
 Stuebner <heiko@sntech.de>, Krzysztof Kozlowski <krzk@kernel.org>, Sylwester
 Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>, Alim Akhtar
	<alim.akhtar@samsung.com>, Dinh Nguyen <dinguyen@kernel.org>, Viresh Kumar
	<vireshk@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre
 Torgue <alexandre.torgue@foss.st.com>, =?UTF-8?Q?Emilio_L=C3=B3pez?=
	<emilio@elopez.com.ar>, Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec
	<jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, Prashant
 Gaikwad <pgaikwad@nvidia.com>, Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>, Kunihiko Hayashi
	<hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>, Ulf
 Hansson <ulfh@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>, Lorenzo
 Pieralisi <lpieralisi@kernel.org>, Michal Simek <michal.simek@amd.com>,
	Matthias Brugger <matthias.bgg@gmail.com>
CC: <linux-clk@vger.kernel.org>, <linux-aspeed@lists.ozlabs.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<openbmc@lists.ozlabs.org>, <arm-scmi@vger.kernel.org>,
	<imx@lists.linux.dev>, <linux-mips@vger.kernel.org>,
	<linux-renesas-soc@vger.kernel.org>, <linux-rockchip@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>, <soc@lists.linux.dev>,
	<linux-stm32@st-md-mailman.stormreply.com>, <linux-sunxi@lists.linux.dev>,
	<linux-tegra@vger.kernel.org>, <linux-mediatek@lists.infradead.org>
References: <cover.1787239813.git.geert+renesas@glider.be>
 <f402b659481b7e5abe90340bb43adc427cdfe70f.1787239813.git.geert+renesas@glider.be>
From: Nicolas Ferre <nicolas.ferre@microchip.com>
Content-Language: en-US, fr
Organization: microchip
In-Reply-To: <f402b659481b7e5abe90340bb43adc427cdfe70f.1787239813.git.geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_064010_756416_1391E207 
X-CRM114-Status: GOOD (  14.62  )
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

On 21/08/2026 at 10:53, Geert Uytterhoeven wrote:
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
>   drivers/clk/at91/clk-audio-pll.c | 4 ++--
>   drivers/clk/at91/clk-h32mx.c     | 2 +-
>   drivers/clk/at91/clk-main.c      | 2 +-
>   drivers/clk/at91/clk-pll.c       | 2 +-
>   drivers/clk/at91/clk-plldiv.c    | 2 +-
>   drivers/clk/at91/clk-slow.c      | 2 +-
>   drivers/clk/at91/clk-smd.c       | 2 +-
>   drivers/clk/at91/clk-usb.c       | 6 +++---
>   drivers/clk/at91/sckc.c          | 2 +-
>   9 files changed, 12 insertions(+), 12 deletions(-)

Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>

Thanks Geert,
   Nicolas


