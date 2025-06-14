Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16E9AC71135
	for <linux-mediatek@archiver.kernel.org>; Sat, 14 Jun 2025 11:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RPZ3RlrueAMYij2NSwOGonjmf8MVh3if82AjaQDL10Y=; b=2N8hw7qFwGXgWBA6S5gzo/Gzk1
	XP4XLCtSxDUFie2X+lnNu/iKk9GdalKDkn3co8rPcCeLFHXmANUHDUos4RXPkC3MeMjg6E/dWzrZ9
	/ZLe9YdsT3jBcbZZQ7nU4vxcryRn4Zudm46ydfN3BgAIJzdDInXTLQh4BeKESS2Ya4yXaOo9zXSE5
	wZeU7HjCP+VDffhLuQD9CIn9CvgBb5j+OAPlVsD06Alf4pcO+YphiSdN/LKSrcMrhcpANiqjveeB3
	0lKwXaCDISKk+F1SMKZ/Brf1d/XqG4hUY2KpcaHVUj3JUOaVi5D8bFOnvrNQCn/rjiOqXon91mhxq
	vSv0qLWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQOxI-00000001BFo-0Oh8;
	Sat, 14 Jun 2025 11:21:48 +0000
Received: from mout02.posteo.de ([185.67.36.66])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQOsu-00000001AvX-2kWH
	for linux-mediatek@lists.infradead.org;
	Sat, 14 Jun 2025 11:17:17 +0000
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 9A35D240101
	for <linux-mediatek@lists.infradead.org>; Sat, 14 Jun 2025 13:17:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net;
	s=1984.ea087b; t=1749899832;
	bh=d4gNp/0M9SMRUX5Vo9jyFaZjMh959oqzUg9NU3r341s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:From;
	b=Lca7QKh6j957WM9z2uGhxtJ0SvljdRqwb2jlCuWb67exWTonQombxmqnjTCtYsFh5
	 6wowc8OD7y1uR6Sw0DHc7nc4rp52t+Rbn3jb8JHD0rUjXbYpYuHB6gfPsHghCVQg1k
	 eoJ2CP6AwhUzFU59QB2uLKmOd0CwOSpJvr0YtHsIyquoZKeJuhyOZNpWCPA4H4ipdP
	 KEYfc6osVgjdgmG7N53P3rDmLbHF3QmOvxWttVVH1aYepo6ts9ge+t/1ITkpW3xiIE
	 OHDYljxwR+Lhl8ZCW+tPbDXSFrQr2DSLCWhJX3lyb+i+/pdDQS+Ax41Ro/PF3TLz9K
	 y2dTiXxYmjplrVYGQDEaSFRCtGqFFCT9vExXL/7K/c1Y2Z6bK2+IJ6VSkVp5GvKZjh
	 Bn/uUwVyKxJfvKsYREBojzFDxPlooV9wHrXo+vNfSvVFZ3+IvmSSjjFfG6mUDw76eY
	 lsDFOq2AlyLTUZ+oeOO8HjF1lzN2TVUesC7UWC4oFZB9vL+7jLv
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4bKDHh1hfPz6tsf;
	Sat, 14 Jun 2025 13:17:04 +0200 (CEST)
Date: Sat, 14 Jun 2025 11:17:03 +0000
From: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Joel Stanley <joel@jms.id.au>, Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>,
	Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.ne@posteo.net>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Sean Wang <sean.wang@kernel.org>,
	Jesper Nilsson <jesper.nilsson@axis.com>,
	Lars Persson <lars.persson@axis.com>,
	Damien Le Moal <dlemoal@kernel.org>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Michal Simek <michal.simek@amd.com>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Jianlong Huang <jianlong.huang@starfivetech.com>,
	Hal Feng <hal.feng@starfivetech.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Manivannan Sadhasivam <mani@kernel.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
	openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org, linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@axis.com, linux-riscv@lists.infradead.org,
	linux-rtc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v2 06/17] pinctrl: nuvoton: Constify static 'pinctrl_desc'
Message-ID: <aE1aL_ff1230w2DL@probook>
References: <20250611-pinctrl-const-desc-v2-0-b11c1d650384@linaro.org>
 <20250611-pinctrl-const-desc-v2-6-b11c1d650384@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250611-pinctrl-const-desc-v2-6-b11c1d650384@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250614_041716_972280_8356D8B8 
X-CRM114-Status: GOOD (  14.80  )
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

On Wed, Jun 11, 2025 at 08:13:38AM +0200, Krzysztof Kozlowski wrote:
> The local static 'struct pinctrl_desc' is not modified, so can be made
> const for code safety.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: J. Neuschäfer <j.ne@posteo.net>

Thanks!


> ---
>  drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c | 2 +-
>  drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c | 2 +-
>  drivers/pinctrl/nuvoton/pinctrl-wpcm450.c | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c b/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
> index dfd32feb34286b7a4d807e9033a11f507e277dce..b8872d8f5930ad931dad208afec4e08a23c3d653 100644
> --- a/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
> +++ b/drivers/pinctrl/nuvoton/pinctrl-npcm7xx.c
> @@ -1817,7 +1817,7 @@ static const struct pinconf_ops npcm7xx_pinconf_ops = {
>  };
>  
>  /* pinctrl_desc */
> -static struct pinctrl_desc npcm7xx_pinctrl_desc = {
> +static const struct pinctrl_desc npcm7xx_pinctrl_desc = {
>  	.name = "npcm7xx-pinctrl",
>  	.pins = npcm7xx_pins,
>  	.npins = ARRAY_SIZE(npcm7xx_pins),
> diff --git a/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c b/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
> index be3db8ab406c416f0709d06eb864e33e3208541a..3c3b9d8d3681c64c21927615e1bb49f157f156b5 100644
> --- a/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
> +++ b/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
> @@ -2299,7 +2299,7 @@ static const struct pinconf_ops npcm8xx_pinconf_ops = {
>  };
>  
>  /* pinctrl_desc */
> -static struct pinctrl_desc npcm8xx_pinctrl_desc = {
> +static const struct pinctrl_desc npcm8xx_pinctrl_desc = {
>  	.name = "npcm8xx-pinctrl",
>  	.pins = npcm8xx_pins,
>  	.npins = ARRAY_SIZE(npcm8xx_pins),
> diff --git a/drivers/pinctrl/nuvoton/pinctrl-wpcm450.c b/drivers/pinctrl/nuvoton/pinctrl-wpcm450.c
> index 4264ca749175a2ce0f3603c1d7aa271d98e6cd89..8d8314ba0e4cb55db2b1d3adf2de07e6fb93c279 100644
> --- a/drivers/pinctrl/nuvoton/pinctrl-wpcm450.c
> +++ b/drivers/pinctrl/nuvoton/pinctrl-wpcm450.c
> @@ -989,7 +989,7 @@ static const struct pinconf_ops wpcm450_pinconf_ops = {
>  	.pin_config_set = wpcm450_config_set,
>  };
>  
> -static struct pinctrl_desc wpcm450_pinctrl_desc = {
> +static const struct pinctrl_desc wpcm450_pinctrl_desc = {
>  	.name = "wpcm450-pinctrl",
>  	.pins = wpcm450_pins,
>  	.npins = ARRAY_SIZE(wpcm450_pins),
> 
> -- 
> 2.45.2
> 

