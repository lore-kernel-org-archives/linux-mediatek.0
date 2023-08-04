Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5246C04A6A
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Aug 2023 15:04:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/l8mjvbY2Ki+4Tb7GK63bNwXO8roQow7emINs+UmEls=; b=jlC2IT/NFnxMt9ZnjJHp/HCuNq
	QG71OHnvk6Uv+JUGeZxvMUuBSz05bH6FqmszENF4prnbuqCI1Q5IIvgZgAZxA5KVDSgDJTtzMZtzW
	1zUDpF9oz3Oz9nOl+OOha/zhixt3JMZOZddtEZmV1H6ni7YraVbAdA7Rd0OqB1nHx8fzho8zl/X88
	reVgETCfSCMFJpxD9ghqbr+GRldul2wMtgXQIgxuqGAL4SUUSNfDPo0CbfNma07Kq/flAlPvAUWXk
	1WO+SUHfAvOb7hl8YJj5Z8V4NAR8xSllrIZ2Sx/QRzIT7laX2U7rRI0f8rhaxI6fMSWsKmQiOet+0
	ABwpqYiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRwLR-00Ceve-2R;
	Fri, 04 Aug 2023 15:04:01 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRwLN-00CeuB-2p;
	Fri, 04 Aug 2023 15:03:59 +0000
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 374Eo2VG029325;
	Fri, 4 Aug 2023 17:03:06 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	selector1; bh=/l8mjvbY2Ki+4Tb7GK63bNwXO8roQow7emINs+UmEls=; b=Zd
	4WDuisoN6vSXRACnvp2/VGWNtTpQsGB9xZ2KYVQCVJV9nMODt04ScwlNVd++0dQ8
	+SmB+iPBO+sJYllSey/4UOrdiVNGMBSTP81bgIOf4R1wuODLtf5SAQWFvaXoHT/m
	3SFTdQDt2XH2ytoOUfDHKoQLrh57h6iLKneYmbKUsKQJDoDCvB+t44SxYRNfv2G5
	CO9MDqDSxzcZWqMefoiT+3bkQC12oiYCgbNg5hfTl+vlqs5JiJePBtnlmjro7dZ5
	JyMJpO/XkUM3tOQTcWjU5NjeAM11bxpoiaH6xkAK9UA/GGsp7Obgo49mR7djiR0l
	Hg8pkHSv1olXQrqH1ikQ==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3s93en0269-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 04 Aug 2023 17:03:06 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 32FFF100057;
	Fri,  4 Aug 2023 17:03:00 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5175A2248C6;
	Fri,  4 Aug 2023 17:03:00 +0200 (CEST)
Received: from [10.201.20.38] (10.201.20.38) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Fri, 4 Aug
 2023 17:02:58 +0200
Message-ID: <baaebecd-d3d9-c3b1-dd7c-f5a39c194d4b@foss.st.com>
Date: Fri, 4 Aug 2023 17:02:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 02/23] ARM: sti: Drop unused includes
Content-Language: en-US
To: Rob Herring <robh@kernel.org>, <soc@kernel.org>,
        Tsahee Zidenberg
	<tsahee@annapurnalabs.com>,
        Antoine Tenart <atenart@kernel.org>,
        Jisheng
 Zhang <jszhang@kernel.org>,
        Sebastian Hesselbarth
	<sebastian.hesselbarth@gmail.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Gregory
 Clement <gregory.clement@bootlin.com>,
        Jean-Marie Verdun <verdun@hpe.com>,
        Nick Hawkins <nick.hawkins@hpe.com>, Lubomir Rintel <lkundrak@v3.sk>,
        Linus
 Walleij <linus.walleij@linaro.org>,
        Avi Fishman <avifishman70@gmail.com>,
        Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>,
        Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>,
        Benjamin
 Fair <benjaminfair@google.com>,
        Daniel Mack <daniel@zonque.org>,
        Haojian
 Zhuang <haojian.zhuang@gmail.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Heiko Stuebner <heiko@sntech.de>, Liviu Dudau <liviu.dudau@arm.com>,
        Sudeep
 Holla <sudeep.holla@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Viresh Kumar <vireshk@kernel.org>,
        Shiraz Has him
	<shiraz.linux.kernel@gmail.com>,
        Stuart Yoder <stuyoder@gmail.com>,
        Laurentiu
 Tudor <laurentiu.tudor@nxp.com>,
        Jay Fang <f.fangjian@huawei.com>, Chen-Yu
 Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel
 Holland <samuel@sholland.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio
 Estevam <festevam@gmail.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Florian
 Fainelli <florian.fainelli@broadcom.com>,
        Dinh Nguyen <dinguyen@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter
	<jonathanh@nvidia.com>,
        Michal Simek <michal.simek@amd.com>, Joel Stanley
	<joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        Ulf Hansson
	<ulf.hansson@linaro.org>, Li Yang <leoyang.li@nxp.com>,
        Qiang Zhao
	<qiang.zhao@nxp.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <openbmc@lists.ozlabs.org>, <linux-rockchip@lists.infradead.org>,
        <linux-sunxi@lists.linux.dev>, <linux-mediatek@lists.infradead.org>,
        <linux-rpi-kernel@lists.infradead.org>, <linux-tegra@vger.kernel.org>,
        <linux-aspeed@lists.ozlabs.org>, <linux-pm@vger.kernel.org>
References: <20230803-dt-header-cleanups-for-soc-v2-0-d8de2cc88bff@kernel.org>
 <20230803-dt-header-cleanups-for-soc-v2-2-d8de2cc88bff@kernel.org>
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20230803-dt-header-cleanups-for-soc-v2-2-d8de2cc88bff@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.201.20.38]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-04_15,2023-08-03_01,2023-05-22_02
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230804_080358_257008_3866980B 
X-CRM114-Status: GOOD (  13.94  )
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



On 8/4/23 00:42, Rob Herring wrote:
> Several includes are not needed, so drop them.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  arch/arm/mach-sti/board-dt.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/arch/arm/mach-sti/board-dt.c b/arch/arm/mach-sti/board-dt.c
> index ffecbf29646f..488084b61b4a 100644
> --- a/arch/arm/mach-sti/board-dt.c
> +++ b/arch/arm/mach-sti/board-dt.c
> @@ -4,8 +4,6 @@
>   * Author(s): Srinivas Kandagatla <srinivas.kandagatla@st.com>
>   */
>  
> -#include <linux/irq.h>
> -#include <linux/of_platform.h>
>  #include <asm/hardware/cache-l2x0.h>
>  #include <asm/mach/arch.h>
>  
> 
Acked-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice

