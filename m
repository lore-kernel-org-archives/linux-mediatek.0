Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FC07C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Apr 2022 12:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I+kMoX+EAsdSQyLypUWljzn2Ox6xXf1MvqIXrTjCXIo=; b=k10+8RWtXH3WGo
	eoefNLl7I4PFQWvsXLX4pyAzP92Vt2+eGjwhIIZ1lLZOHGGfZUPnYNC4TXs/oJpfiNUwqElcTdz/P
	03lFJKJE8pQzQN0sAQ6lB9sH4/7bqwCpI2Y6M4G3KaAz1ChQF3ELPdZJVnRV7anQHaDQVmskqenvo
	Fvqxz+/T6J0oYOXp9wDQeKE6L9MONaRAAEH4X9qY9oPCdTcIxeZ8MGw+mtM0KXO1RgHeTJCq/tUK3
	kutP6vxO+5Er4loLxFC4CDHOMoGc1xophI17lThpNSNUX9ImFMljCw2DIGAJVpCxwPtu5TZghJnUP
	8cSRmQwbaQd/fIU8Ee+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nfL1V-009xRA-4X; Fri, 15 Apr 2022 12:26:01 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nfKzt-009wM8-3H; Fri, 15 Apr 2022 12:24:22 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id EDEE71F47DFD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1650025460;
 bh=ye+4fdRe53S0QH+OP5c/z3Iob+laLZgHFEm+D3U1sFk=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=FDNeHvdSzM94W/WjgTPbkKBW/YJS/dBhPOMdmnBFLDamE+6xg0daIXguGDn21Te/R
 2yEU/RXycV0XBOy35hiS5zGs6AbUrXLTsQ88PYoq808Q+4HHa/aPMc6o4cKb/QBZTS
 QFPiWY2IhpIUnxnAfcM1yvbXJVyiK6jJwlMNbfl4UyR/JkM+bYSZ+ymYGIPhka79db
 OO++dBH/m6/kLZIsMOsMPLKxPCukFSb9dIabSz6Q13fqd07zdPSnyUexwrc6iL6lCR
 JBlQ7C1L/zQbhBQMN0lHXwNxxQOTkCjOhvMcGUk+x1yf30ONwC4ht8NkWB3faOPjho
 EcpcEtiPvB6Eg==
Message-ID: <6f5e44e3-c690-5e39-bbb6-fb6bd0091099@collabora.com>
Date: Fri, 15 Apr 2022 14:24:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH V3 05/15] cpufreq: mediatek: Add opp notification support
Content-Language: en-US
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, rafael@kernel.org,
 viresh.kumar@linaro.org, robh+dt@kernel.org, krzk+dt@kernel.org,
 matthias.bgg@gmail.com
Cc: jia-wei.chang@mediatek.com, roger.lu@mediatek.com, hsinyi@google.com,
 khilman@baylibre.com, linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 "Andrew-sh.Cheng" <andrew-sh.cheng@mediatek.com>
References: <20220415055916.28350-1-rex-bc.chen@mediatek.com>
 <20220415055916.28350-6-rex-bc.chen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220415055916.28350-6-rex-bc.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220415_052421_320334_D75F5B1C 
X-CRM114-Status: GOOD (  15.13  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 15/04/22 07:59, Rex-BC Chen ha scritto:
> From: "Andrew-sh.Cheng" <andrew-sh.cheng@mediatek.com>
> 
>  From this opp notifier, cpufreq should listen to opp notification and do
> proper actions when receiving events of disable and voltage adjustment.
> 
> One of the user for this opp notifier is MediaTek SVS.
> The MediaTek Smart Voltage Scaling (SVS) is a hardware which calculates
> suitable SVS bank voltages to OPP voltage table.
> 
> Signed-off-by: Andrew-sh.Cheng <andrew-sh.cheng@mediatek.com>
> Signed-off-by: Jia-Wei Chang <jia-wei.chang@mediatek.com>
> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> ---
>   drivers/cpufreq/mediatek-cpufreq.c | 93 +++++++++++++++++++++++++++---
>   1 file changed, 85 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/cpufreq/mediatek-cpufreq.c b/drivers/cpufreq/mediatek-cpufreq.c
> index fa8b193bf27b..221f249f8d21 100644
> --- a/drivers/cpufreq/mediatek-cpufreq.c
> +++ b/drivers/cpufreq/mediatek-cpufreq.c
> @@ -41,6 +41,11 @@ struct mtk_cpu_dvfs_info {
>   	int intermediate_voltage;
>   	bool need_voltage_tracking;
>   	int pre_vproc;
> +	/* Avoid race condition for regulators between notify and policy */
> +	struct mutex reg_lock;
> +	struct notifier_block opp_nb;
> +	int opp_cpu;

This should be unsigned int because:
1. A negative CPU number is impossible;
2. The only usage is as a parameter of cpufreq_cpu_get(unsigned int cpu).

Please change this to unsigned int, after which:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
