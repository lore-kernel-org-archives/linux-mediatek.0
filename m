Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B216CA0ED1
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Aug 2025 13:42:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vF8oVy6/ZMtowVhAnxsrKfpp6JXqFRBEiZTXs8imWKc=; b=cCQXZQCDy8+EXCDTfdYut9TOac
	u8gDMuvef2ji+vHQsD0jgxixUG1rrPO3YO1yBy8eGaE8xsnCw3J4eFv8owMK8UQiCjJ4M3rpKP9lI
	FYse4jvhHnZjYJsZTynFiljW7kUIdw9NSWQBZ7layRjFogJ40iTjhl2eR5jFb6lS6ft9Qgne1Oj32
	3rxphZhEqq3aW9Nw1q1WEc2tO+YETzNivDCZEjON/iwETJ9oxJC2FyGpK4ouSG2oEBAAb91qJewUc
	YOGy66BMqj3Vimbf7PTnimtKp69BAGMpdAvvT57fKnAVvHAzlhyE8tE+iKC+VZkiUS8v6Jmhxc/zw
	uBvmWsuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo08U-00000007coS-2GMq;
	Mon, 18 Aug 2025 13:42:54 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unyl0-00000007JAm-0KQk;
	Mon, 18 Aug 2025 12:14:36 +0000
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57IBp2wx008182;
	Mon, 18 Aug 2025 14:13:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	vF8oVy6/ZMtowVhAnxsrKfpp6JXqFRBEiZTXs8imWKc=; b=PSxNhDdZaYr8EoNw
	8aZMzG+HAc5zZ/G6iGzm7FWO+i9981Jvk6JfEpE+hG0VOKlKZPoIa46QiLFU4DYx
	sUznRsmqgIiHeCSbPJoiisAuzQzZ6hgkO4CmmJIHG7kce+fJ4nFBIscnYKnoIKbX
	3aYq4auNUAVqWfPNpND0uGOiy/LN0NcMei0rDbyUEd+d+AzIAj5hnYsC2UnS0xR7
	owFelE/4Cju4Q5ND97wzWltji6xPXOGJ9DX+MuHSSWyyGgT9iyzcWsaxj1P2gIhN
	ZoZAmieb/bp+Dh/tSZAo0g1gI8TJ7Cp2gxhDUWfG1cXNsAamFT96b+DTHpo8oG9Y
	4YsXyw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48jgvewyyw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Aug 2025 14:13:21 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 0A47540053;
	Mon, 18 Aug 2025 14:10:12 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id CD98B6D4186;
	Mon, 18 Aug 2025 14:08:47 +0200 (CEST)
Received: from [10.48.87.121] (10.48.87.121) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 18 Aug
 2025 14:08:43 +0200
Message-ID: <20437dbf-9d45-4a51-815f-ad1d1d15346e@foss.st.com>
Date: Mon, 18 Aug 2025 14:08:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 058/114] clk: stm32: stm32-core: convert from round_rate()
 to determine_rate()
To: <bmasney@redhat.com>, Michael Turquette <mturquette@baylibre.com>,
        "Stephen Boyd" <sboyd@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>,
        "Cristian Marussi" <cristian.marussi@arm.com>,
        Chen Wang
	<unicorn_wang@outlook.com>,
        Inochi Amaoto <inochiama@gmail.com>,
        Nicolas
 Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni
	<alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        Paul Cercueil <paul@crapouillou.net>,
        Keguang Zhang
	<keguang.zhang@gmail.com>,
        Taichi Sugaya <sugaya.taichi@socionext.com>,
        "Takao Orito" <orito.takao@socionext.com>,
        Shawn Guo <shawnguo@kernel.org>,
        "Sascha Hauer" <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team
	<kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Jacky Huang
	<ychuang3@nuvoton.com>,
        Shan-Chun Hung <schung@nuvoton.com>,
        "Vladimir
 Zapolskiy" <vz@mleia.com>,
        Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Samuel Holland
	<samuel.holland@sifive.com>,
        Yixun Lan <dlan@gentoo.org>,
        Steen Hegelund
	<Steen.Hegelund@microchip.com>,
        Daniel Machon <daniel.machon@microchip.com>,
        <UNGLinuxDriver@microchip.com>, Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang
	<baolin.wang@linux.alibaba.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        "Maxime Coquelin" <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>,
        Michal Simek <michal.simek@amd.com>,
        "Maxime
 Ripard" <mripard@kernel.org>,
        =?UTF-8?Q?Andreas_F=C3=A4rber?=
	<afaerber@suse.de>,
        Manivannan Sadhasivam <mani@kernel.org>, Sven Peter
	<sven@kernel.org>,
        Janne Grunau <j@jannau.net>, Alyssa Rosenzweig
	<alyssa@rosenzweig.io>,
        Neal Gompa <neal@gompa.dev>,
        Eugeniy Paltsev
	<Eugeniy.Paltsev@synopsys.com>,
        Ray Jui <rjui@broadcom.com>, Scott Branden
	<sbranden@broadcom.com>,
        Broadcom internal kernel review list
	<bcm-kernel-feedback-list@broadcom.com>,
        Max Filippov <jcmvbkbc@gmail.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>,
        Daniel Palmer <daniel@thingy.jp>,
        Romain Perier <romain.perier@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth
	<sebastian.hesselbarth@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Heiko Stuebner
	<heiko@sntech.de>,
        Andrea della Porta <andrea.porta@suse.com>,
        "Krzysztof
 Kozlowski" <krzk@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Alim Akhtar <alim.akhtar@samsung.com>, Qin Jian <qinjian@cqplus1.com>,
        Viresh Kumar <vireshk@kernel.org>,
        "Ulf
 Hansson" <ulf.hansson@linaro.org>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Alex Helms <alexander.helms.jy@renesas.com>,
        Linus Walleij
	<linus.walleij@linaro.org>,
        Liviu Dudau <liviu.dudau@arm.com>,
        "Lorenzo
 Pieralisi" <lpieralisi@kernel.org>,
        Nobuhiro Iwamatsu
	<nobuhiro1.iwamatsu@toshiba.co.jp>
CC: <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <arm-scmi@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <sophgo@lists.linux.dev>, <linux-mips@vger.kernel.org>,
        <imx@lists.linux.dev>, <linux-riscv@lists.infradead.org>,
        <spacemit@lists.linux.dev>, <linux-stm32@st-md-mailman.stormreply.com>,
        <patches@opensource.cirrus.com>, <linux-actions@lists.infradead.org>,
        <asahi@lists.linux.dev>, <linux-mediatek@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-renesas-soc@vger.kernel.org>,
        <linux-rockchip@lists.infradead.org>,
        <linux-samsung-soc@vger.kernel.org>, <soc@lists.linux.dev>
References: <20250811-clk-for-stephen-round-rate-v1-0-b3bf97b038dc@redhat.com>
 <20250811-clk-for-stephen-round-rate-v1-58-b3bf97b038dc@redhat.com>
Content-Language: en-US
From: Gabriel FERNANDEZ <gabriel.fernandez@foss.st.com>
In-Reply-To: <20250811-clk-for-stephen-round-rate-v1-58-b3bf97b038dc@redhat.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.87.121]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-18_05,2025-08-14_01,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_051434_385832_7AF14858 
X-CRM114-Status: GOOD (  17.43  )
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


On 8/11/25 17:18, Brian Masney via B4 Relay wrote:
> From: Brian Masney <bmasney@redhat.com>
>
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series.
>
> Signed-off-by: Brian Masney <bmasney@redhat.com>
Reviewed-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>

> ---
>   drivers/clk/stm32/clk-stm32-core.c | 28 ++++++++++++++++++----------
>   1 file changed, 18 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/clk/stm32/clk-stm32-core.c b/drivers/clk/stm32/clk-stm32-core.c
> index 933e3cde0795386c3e5e6902aa0989cf3dffc01e..72825b9c36a4d3b8ba3f7615b9026c09ffaf88d1 100644
> --- a/drivers/clk/stm32/clk-stm32-core.c
> +++ b/drivers/clk/stm32/clk-stm32-core.c
> @@ -351,14 +351,14 @@ static int clk_stm32_divider_set_rate(struct clk_hw *hw, unsigned long rate,
>   	return ret;
>   }
>   
> -static long clk_stm32_divider_round_rate(struct clk_hw *hw, unsigned long rate,
> -					 unsigned long *prate)
> +static int clk_stm32_divider_determine_rate(struct clk_hw *hw,
> +					    struct clk_rate_request *req)
>   {
>   	struct clk_stm32_div *div = to_clk_stm32_divider(hw);
>   	const struct stm32_div_cfg *divider;
>   
>   	if (div->div_id == NO_STM32_DIV)
> -		return rate;
> +		return 0;
>   
>   	divider = &div->clock_data->dividers[div->div_id];
>   
> @@ -369,14 +369,22 @@ static long clk_stm32_divider_round_rate(struct clk_hw *hw, unsigned long rate,
>   		val =  readl(div->base + divider->offset) >> divider->shift;
>   		val &= clk_div_mask(divider->width);
>   
> -		return divider_ro_round_rate(hw, rate, prate, divider->table,
> -				divider->width, divider->flags,
> -				val);
> +		req->rate = divider_ro_round_rate(hw, req->rate,
> +						  &req->best_parent_rate,
> +						  divider->table,
> +						  divider->width,
> +						  divider->flags, val);
> +
> +		return 0;
>   	}
>   
> -	return divider_round_rate_parent(hw, clk_hw_get_parent(hw),
> -					 rate, prate, divider->table,
> -					 divider->width, divider->flags);
> +	req->rate = divider_round_rate_parent(hw, clk_hw_get_parent(hw),
> +					      req->rate,
> +					      &req->best_parent_rate,
> +					      divider->table,
> +					      divider->width, divider->flags);
> +
> +	return 0;
>   }
>   
>   static unsigned long clk_stm32_divider_recalc_rate(struct clk_hw *hw,
> @@ -392,7 +400,7 @@ static unsigned long clk_stm32_divider_recalc_rate(struct clk_hw *hw,
>   
>   const struct clk_ops clk_stm32_divider_ops = {
>   	.recalc_rate	= clk_stm32_divider_recalc_rate,
> -	.round_rate	= clk_stm32_divider_round_rate,
> +	.determine_rate = clk_stm32_divider_determine_rate,
>   	.set_rate	= clk_stm32_divider_set_rate,
>   };
>   
>

