Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A12B7EB64DC
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Jul 2023 19:38:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L9SWkpnSN35koKOx8Hk+jXlyJjgAa+96Jhb8hQdYanQ=; b=h4IveHtERC1ltjDp8kYRp7gWh+
	yWqYfqRY/Te6gtbhD8gL06AVd+3NzSSqsH3EkrLf/co1WwfhBUQsGKvGydUBHs72nNKdSjqPtugsm
	jQENl9PCQp1lzMIqbt+khlbuxJZumhBnC0igw7Ii7HdyL1GK1+5FxSLib9IoOMqiLvWBxCLOLuf88
	h3a7it5R2Hp5hrPzmWPzWVXzSwGwocFBy+sDZBNrcZzE4QXTAcvbDdGWQAvyLC9pr7XZDjahINE5j
	kbVrwL9Ad2jANttEaf7+mTRSZobHzJMCf02j0qdSEto94HDnnaqJInh4DI/kmtlcEZec1F6TBnnZ0
	LW0rAudw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qKOcB-0076gO-2s;
	Fri, 14 Jul 2023 19:38:07 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qKOc7-0076f7-1V;
	Fri, 14 Jul 2023 19:38:04 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id F02D761D9C;
	Fri, 14 Jul 2023 19:38:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A62D9C433C8;
	Fri, 14 Jul 2023 19:37:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689363482;
	bh=fGJ6F5Ae/YFoT2UWCrLli9PCtviQD9Op8m1EXI3LXXU=;
	h=Date:Subject:List-Id:To:Cc:References:From:In-Reply-To:From;
	b=jYE5HJQE/PMLG3EMjSGfoDEwwkgTHcoohATsRj1fUayKeLvR07xfOCkIHjOGvykxm
	 aip3QDRPq8Tte2DkfUmSHZYsHmLZJYvw4RHnWKjN7H2k5XufcmIyNXAFFJMVZrttGD
	 RwkO5eJzf2pXSQ2UeEaJGCNH9HxiH5dE3rgoNoRCk/bpzPFDEAUAN4F2aWvXFzP6uF
	 tvaRkjiJZkfD3yK3nyeb0QlgICDJAPAZxEupkfWlQU8Kq+ab2l8pDvgNxcFZ047/q1
	 vlJYGOonIcEBT5Vbwjoja/4Hd8/U5hzQGy29Oq3Jn4cYJW1LHKlpFNKSD0YpAjZmSP
	 Vh/AAsrUwaumg==
Message-ID: <2d001d37-90f8-4a44-5573-ea1667f44108@kernel.org>
Date: Fri, 14 Jul 2023 14:37:52 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] clk: Explicitly include correct DT includes
Content-Language: en-US
To: Rob Herring <robh@kernel.org>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>, Neil Armstrong
 <neil.armstrong@linaro.org>, Sudeep Holla <sudeep.holla@arm.com>,
 Cristian Marussi <cristian.marussi@arm.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Alex Helms <alexander.helms.jy@renesas.com>, Abel Vesa
 <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>,
 Santosh Shilimkar <ssantosh@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Heiko Stuebner <heiko@sntech.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Tomasz Figa <tomasz.figa@gmail.com>, Chanwoo Choi <cw00.choi@samsung.com>,
 Alim Akhtar <alim.akhtar@samsung.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Viresh Kumar <vireshk@kernel.org>,
 Shiraz Hashim <shiraz.linux.kernel@gmail.com>, soc@kernel.org,
 Orson Zhai <orsonzhai@gmail.com>, Baolin Wang
 <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>,
 Emil Renner Berthing <kernel@esmil.dk>, Hal Feng
 <hal.feng@starfivetech.com>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, =?UTF-8?Q?Emilio_L=c3=b3pez?=
 <emilio@elopez.com.ar>, Peter De Schrijver <pdeschrijver@nvidia.com>,
 Prashant Gaikwad <pgaikwad@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Masami Hiramatsu <mhiramat@kernel.org>, Michal Simek <michal.simek@amd.com>
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-actions@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, linux-oxnas@groups.io,
 linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-tegra@vger.kernel.org
References: <20230714174342.4052882-1-robh@kernel.org>
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <20230714174342.4052882-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230714_123803_607042_E1E679C3 
X-CRM114-Status: GOOD (  12.55  )
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



On 7/14/23 12:43, Rob Herring wrote:
> The DT of_device.h and of_platform.h date back to the separate
> of_platform_bus_type before it as merged into the regular platform bus.
> As part of that merge prepping Arm DT support 13 years ago, they
> "temporarily" include each other. They also include platform_device.h
> and of.h. As a result, there's a pretty much random mix of those include
> files used throughout the tree. In order to detangle these headers and
> replace the implicit includes with struct declarations, users need to
> explicitly include the correct includes.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
...
>   drivers/clk/sifive/sifive-prci.c                 | 2 +-
>   drivers/clk/socfpga/clk-agilex.c                 | 3 +--
>   drivers/clk/socfpga/clk-s10.c                    | 3 +--

For SoCFPGA

Acked-by: Dinh Nguyen <dinguyen@kernel.org>

