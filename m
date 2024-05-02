Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8B85C4345F
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 May 2024 09:45:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BggNaQJ5GQ+jmFR5m3Y/yrh3MsWyNNVQDV3jNQjfMgc=; b=bk1Tp6t3XVlDJSaxjgEplUONKK
	Jxy6OAPTDYWLq+cN2CLlHj8QPF27UGSAvdJb/keDOla80fBZHVkISr6H+dKrIIuOLDR518q3Ilx99
	96l3smh/7MTI7kuxzi71ut3pptwaNxAyKGIEezeZTI8UPunEwHGfQ/K/b2R8Ko9FmsrD0ousIITLp
	to5EZW6wvUKPkk7ApjQLLfrQ9+ep4npr7d2JWYPjQrniXOGbnYiUZjHQW2gYM6iaNGAu4Ao3DPjdh
	jLeR/vvTGQFk9HFvZeHU4kZBYqCfDk3ZwNQEqD5FqE6L19jkZP6+v8fC/2t8/OXNoqLd904qL4VZS
	8I8gYtmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2T0H-0000000CCp7-0ZcZ;
	Thu, 02 May 2024 09:45:25 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2T0D-0000000CCoU-2Np7;
	Thu, 02 May 2024 09:45:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 063AE61283;
	Thu,  2 May 2024 09:45:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC6A9C113CC;
	Thu,  2 May 2024 09:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714643119;
	bh=KMKmbjNxDjaQW/0y4bty5ahkkoXZGQdtL8KqJYUhwyE=;
	h=Date:Subject:List-Id:To:Cc:References:From:In-Reply-To:From;
	b=oAfQwcFEFQ4YSvMqY1Xbh/lsc5LPNSzumgD/oGqD14ngGgVPaEs7MibpgzzKx9oki
	 Zagn8sEO8gj46WZhp4lLi4tBXFTB+pnYiA73nYZaFmp60rxFnqFwc6JU+DjWzL67dG
	 /MZ0o36PB32nJVFZyZuANe63Rb2438n1oBk0vqlifHQrplthsktdyd/SJ9MqUjTqSh
	 S4MhcJVVnSWRNuZQtI579Q7AgypadRVel2Bn/9DPwLpuM9kooXWaDgrnlLnFOcgFi9
	 WcmGesxwuIsoxe8I2o27QKIei0xaWcNAItuJ4mp51iYpDI3BxfZTFiHOR9LfE7YUv9
	 8qqWoV1TVGUXg==
Message-ID: <dfde41a3-9d7d-4253-8297-c7684372f6f0@kernel.org>
Date: Thu, 2 May 2024 18:45:09 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/21] pinctrl: k210: Use scope based of_node_put()
 cleanups
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Dvorkin Dmitry <dvorkin@tibbo.com>,
 Wells Lu <wellslutw@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Emil Renner Berthing <kernel@esmil.dk>,
 Jianlong Huang <jianlong.huang@starfivetech.com>,
 Hal Feng <hal.feng@starfivetech.com>, Orson Zhai <orsonzhai@gmail.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>, Viresh Kumar <vireshk@kernel.org>,
 Shiraz Hashim <shiraz.linux.kernel@gmail.com>, soc@kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 Heiko Stuebner <heiko@sntech.de>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Chester Lin <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>,
 Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
 Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 Dan Carpenter <dan.carpenter@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-samsung-soc@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-mediatek@lists.infradead.org,
 imx@lists.linux.dev, linux-aspeed@lists.ozlabs.org,
 openbmc@lists.ozlabs.org, Peng Fan <peng.fan@nxp.com>
References: <20240501-pinctrl-cleanup-v1-0-797ceca46e5c@nxp.com>
 <20240501-pinctrl-cleanup-v1-12-797ceca46e5c@nxp.com>
From: Damien Le Moal <dlemoal@kernel.org>
Content-Language: en-US
Organization: Western Digital Research
In-Reply-To: <20240501-pinctrl-cleanup-v1-12-797ceca46e5c@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240502_024521_735555_E6DB0A94 
X-CRM114-Status: GOOD (  18.60  )
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

On 5/1/24 21:56, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Use scope based of_node_put() cleanup to simplify code.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/pinctrl/pinctrl-k210.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/pinctrl/pinctrl-k210.c b/drivers/pinctrl/pinctrl-k210.c
> index b6d1ed9ec9a3..2753e14c3e38 100644
> --- a/drivers/pinctrl/pinctrl-k210.c
> +++ b/drivers/pinctrl/pinctrl-k210.c
> @@ -849,7 +849,6 @@ static int k210_pinctrl_dt_node_to_map(struct pinctrl_dev *pctldev,
>  				       unsigned int *num_maps)
>  {
>  	unsigned int reserved_maps;
> -	struct device_node *np;
>  	int ret;
>  
>  	reserved_maps = 0;
> @@ -861,13 +860,11 @@ static int k210_pinctrl_dt_node_to_map(struct pinctrl_dev *pctldev,
>  	if (ret < 0)
>  		goto err;
>  
> -	for_each_available_child_of_node(np_config, np) {
> +	for_each_available_child_of_node_scoped(np_config, np) {
>  		ret = k210_pinctrl_dt_subnode_to_map(pctldev, np, map,
>  						     &reserved_maps, num_maps);
> -		if (ret < 0) {
> -			of_node_put(np);

Personally, I am really not a fan of things that hide code like that scoped
thing... If I want a language that hides code, I would be doing C++ :)
That said, I am not opposed to this so I will let Linus (Walleij) decide.

Also, I think that "for_each_available_child_of_node" is a bad name... It really
should be something like for_each_available_child_of_node_get() to make it clear
that a of_node_put() is needed.

> +		if (ret < 0)
>  			goto err;
> -		}
>  	}
>  	return 0;
>  
> 

-- 
Damien Le Moal
Western Digital Research


