Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C9F4C04FFE
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 May 2024 06:14:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J3o804ncxF/enh0kdjgc+0YUwQx2VM+mClNeplniKwc=; b=Qgdp2YXrMcArkLOdtUrnL4oRJ4
	OqpnztfzFD80Os+oGi90c/L6Q5N9pydBnb4N9VYbBGmplQyoEHMTUaR51AClBn+LxnrK7/3GlKtag
	QFaS3J5gX8Ch4NAuTao9tKG02pmREadpJfZTLjkHfa23OTusa7x+bkOTLRaZiZXHJ1NJSafP1ZgFW
	J5jkwNsnIRztBz1nqE2ffLGmYYtAJ4NUYNhdCREGO5r8+f0swtiZ137l5lf5HKKOdsVzc/JrdIObN
	2A+L7ftYenRruZmrO3S5gtiPC9ia8GP4dhz+CZ95V1/HIzGiV4Qdm/lfcELDZqYV42dDG9DBEGNat
	8v+T2lIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7qrF-00000006vDi-185M;
	Fri, 17 May 2024 06:14:21 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7qr9-00000006vCh-33XF;
	Fri, 17 May 2024 06:14:17 +0000
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44H0O4Ye003261;
	Fri, 17 May 2024 08:13:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	selector1; bh=J3o804ncxF/enh0kdjgc+0YUwQx2VM+mClNeplniKwc=; b=CV
	xSZy930UTX7kDamAv2gi390UDjIU+WfLGT6+qTNZa8Hkd+yJK75cIjojTcNGENLI
	BZXukHl1cbO+xx0BClOTjP4+RS637PPEZfSGyM5gcLPtlikd9R82kz62BFQCUdjg
	hg7KKyl1iltJ7WLlSnl73hlsyoLrSH4JScIhCCz5Atn5dnoL4Qog2D57Ukm5e4ei
	7lGcFyD2wB2a/S/nX+IftdXds93oxlEx06x7ejgzCNxb1dAlqpVZ9aDQL7DgoNF3
	6W7MH/CNQYmJRAhI6UKq5f2XqI/btsPocfwEo0I/o9aUe09mZKEAIhrOAYKJFBSG
	bWg2Tl1y24/bmqSNujYQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3y4sxwghph-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 May 2024 08:13:35 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 924C54002D;
	Fri, 17 May 2024 08:13:20 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 79F8F20F54A;
	Fri, 17 May 2024 08:11:54 +0200 (CEST)
Received: from [10.48.87.62] (10.48.87.62) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 17 May
 2024 08:11:51 +0200
Message-ID: <124b75a6-d8da-4e29-8dce-79d18c355ba2@foss.st.com>
Date: Fri, 17 May 2024 08:11:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/20] pinctrl: stm32: Use scope based of_node_put()
 cleanups
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
        Linus Walleij
	<linus.walleij@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Dvorkin Dmitry <dvorkin@tibbo.com>, Wells Lu <wellslutw@gmail.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Emil Renner Berthing
	<kernel@esmil.dk>,
        Jianlong Huang <jianlong.huang@starfivetech.com>,
        Hal Feng
	<hal.feng@starfivetech.com>,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang
	<baolin.wang@linux.alibaba.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Viresh
 Kumar <vireshk@kernel.org>,
        Shiraz Hashim <shiraz.linux.kernel@gmail.com>, <soc@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Sylwester Nawrocki
	<s.nawrocki@samsung.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Geert
 Uytterhoeven <geert+renesas@glider.be>,
        Heiko Stuebner <heiko@sntech.de>, Damien Le Moal <dlemoal@kernel.org>,
        Ludovic Desroches
	<ludovic.desroches@microchip.com>,
        Nicolas Ferre
	<nicolas.ferre@microchip.com>,
        Alexandre Belloni
	<alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
        Jacky Bai <ping.bai@nxp.com>,
        Pengutronix
 Kernel Team <kernel@pengutronix.de>,
        Chester Lin <chester62515@gmail.com>,
        Matthias Brugger <mbrugger@suse.com>,
        Ghennadi Procopciuc
	<ghennadi.procopciuc@oss.nxp.com>,
        Sean Wang <sean.wang@kernel.org>,
        Matthias
 Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>,
        Sascha Hauer
	<s.hauer@pengutronix.de>,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        Joel
 Stanley <joel@jms.id.au>,
        Dan Carpenter <dan.carpenter@linaro.org>,
        Tony
 Lindgren <tony@atomide.com>,
        Stephen Warren <swarren@wwwdotorg.org>
CC: <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-samsung-soc@vger.kernel.org>,
        <linux-renesas-soc@vger.kernel.org>,
        <linux-rockchip@lists.infradead.org>,
        <linux-riscv@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>, <imx@lists.linux.dev>,
        <linux-aspeed@lists.ozlabs.org>, <openbmc@lists.ozlabs.org>,
        Peng Fan
	<peng.fan@nxp.com>
References: <20240504-pinctrl-cleanup-v2-0-26c5f2dc1181@nxp.com>
 <20240504-pinctrl-cleanup-v2-3-26c5f2dc1181@nxp.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20240504-pinctrl-cleanup-v2-3-26c5f2dc1181@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-16_07,2024-05-15_01,2023-05-22_02
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240516_231416_097085_612D8143 
X-CRM114-Status: GOOD (  13.81  )
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



On 5/4/24 15:20, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Use scope based of_node_put() cleanup to simplify code.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/pinctrl/stm32/pinctrl-stm32.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.c b/drivers/pinctrl/stm32/pinctrl-stm32.c
> index 978ccdbaf3d3..a8673739871d 100644
> --- a/drivers/pinctrl/stm32/pinctrl-stm32.c
> +++ b/drivers/pinctrl/stm32/pinctrl-stm32.c
> @@ -670,7 +670,6 @@ static int stm32_pctrl_dt_node_to_map(struct pinctrl_dev *pctldev,
>  				 struct device_node *np_config,
>  				 struct pinctrl_map **map, unsigned *num_maps)
>  {
> -	struct device_node *np;
>  	unsigned reserved_maps;
>  	int ret;
>  
> @@ -678,12 +677,11 @@ static int stm32_pctrl_dt_node_to_map(struct pinctrl_dev *pctldev,
>  	*num_maps = 0;
>  	reserved_maps = 0;
>  
> -	for_each_child_of_node(np_config, np) {
> +	for_each_child_of_node_scoped(np_config, np) {
>  		ret = stm32_pctrl_dt_subnode_to_map(pctldev, np, map,
>  				&reserved_maps, num_maps);
>  		if (ret < 0) {
>  			pinctrl_utils_free_map(pctldev, *map, *num_maps);
> -			of_node_put(np);
>  			return ret;
>  		}
>  	}
> 

Hi

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice

