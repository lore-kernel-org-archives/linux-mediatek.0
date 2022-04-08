Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1617EC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Apr 2022 13:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:From:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z9YlgimOPTP+EKNeVBffFzKq85mercM7wKAJYD0yuVw=; b=EIbvNwy2+W5PeR
	tr6enLDG2QsizXoNKBZsowYfmmumQS2gVxeaztJD3q9wksL64KsUP9uy199LXCRXQby+XEbTnnvDM
	KFSCVKRMdIuK4G80llSeXWnlolHIFJuP4tuiCf7zFC76/otV23T1Zz6dbsYQ8PAf/EUCxc0w+fP6L
	h/jiwlZ7AWbIMRazPmDn+QazaWggJ5vs0lc2mazILmK6FEaXErArzfoILWSo+lMUwsfLZzhDsgVZU
	iKILkfTbG1oJCksAdHLZWAZJU7lK9da8QZLPdmip7WhinuISI+WTSWFGOTLy9DSBnx0TcLcSTrJFD
	hi6c3EzmqjCjZOOXEWXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncoqN-00HQTF-6P; Fri, 08 Apr 2022 13:40:07 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nconJ-00HOZX-Pb; Fri, 08 Apr 2022 13:36:59 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id A1B391F471A5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1649425016;
 bh=VvRgQU54sdZ6ehxT8S+IpL97VlFITMD9eiM6MHExd5I=;
 h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
 b=JLJtOd+gq+xF78yvrkucBm4n9+EqJG4+UWfNQ+13TWtxOSWCSkZG4bBCca7oAtJUr
 WsbiIZo65B0lOnB3hrUpiHmTjnq0u4BTZ8JyA8QTN2kF2LChNENiKPz0I8Cefb6ri4
 z0BfERmefGj3CafuhEzULsoKgtIQAFjiwTabuRf2rqkg7jV09dS4BzFvg5x/haLM79
 Szsjb5syEVisdwhlbQ2Me6J/zgrpt9xuYaiGLdnIuFoHhQpD+w1VUhjg2l4psazjrC
 EErT4sfDbx3GY0CJp1YtmXkKa/9So+HKzyXuCVKpSDOI97chqiSJ0FLGRucT5K7O0i
 aY/jszgQIRABA==
Message-ID: <d9f514b6-1116-30d3-274f-11e04a2dc8e9@collabora.com>
Date: Fri, 8 Apr 2022 15:36:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH V2 07/15] cpufreq: mediatek: Add opp notification for SVS
 support
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, rafael@kernel.org,
 viresh.kumar@linaro.org, robh+dt@kernel.org, krzk+dt@kernel.org
Cc: matthias.bgg@gmail.com, jia-wei.chang@mediatek.com,
 roger.lu@mediatek.com, hsinyi@google.com, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 "Andrew-sh.Cheng" <andrew-sh.cheng@mediatek.com>
References: <20220408045908.21671-1-rex-bc.chen@mediatek.com>
 <20220408045908.21671-8-rex-bc.chen@mediatek.com>
Content-Language: en-US
In-Reply-To: <20220408045908.21671-8-rex-bc.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220408_063658_051014_246EB368 
X-CRM114-Status: GOOD (  16.15  )
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

Il 08/04/22 06:59, Rex-BC Chen ha scritto:
> From: "Andrew-sh.Cheng" <andrew-sh.cheng@mediatek.com>
> 
> The Smart Voltage Scaling (SVS) is a hardware which calculates suitable
> SVS bank voltages to OPP voltage table.
> 
> When the SVS is enabled, cpufreq should listen to opp notification and do
> proper actions when receiving events of disable and voltage adjustment.
> 
> Signed-off-by: Andrew-sh.Cheng <andrew-sh.cheng@mediatek.com>
> Signed-off-by: Jia-Wei Chang <jia-wei.chang@mediatek.com>
> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> ---
>   drivers/cpufreq/mediatek-cpufreq.c | 90 +++++++++++++++++++++++++++---
>   1 file changed, 82 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/cpufreq/mediatek-cpufreq.c b/drivers/cpufreq/mediatek-cpufreq.c
> index 472f4de29e5f..1369da62780a 100644
> --- a/drivers/cpufreq/mediatek-cpufreq.c
> +++ b/drivers/cpufreq/mediatek-cpufreq.c

..snip..

> +
>   static int mtk_cpu_dvfs_info_init(struct mtk_cpu_dvfs_info *info, int cpu)
>   {
>   	struct device *cpu_dev;
> @@ -392,6 +455,17 @@ static int mtk_cpu_dvfs_info_init(struct mtk_cpu_dvfs_info *info, int cpu)
>   	info->intermediate_voltage = dev_pm_opp_get_voltage(opp);
>   	dev_pm_opp_put(opp);
>   
> +	info->opp_cpu = cpu;
> +	info->opp_nb.notifier_call = mtk_cpufreq_opp_notifier;
> +	ret = dev_pm_opp_register_notifier(cpu_dev, &info->opp_nb);

You are registering this notifier, but never unregistering it.
Please unregister it in error conditions and also upon runtime removal of the
mediatek-cpufreq module.

-> dev_pm_opp_unregister_notifier()

Regards,
Angelo

> +	if (ret) {
> +		dev_warn(cpu_dev, "cpu%d: failed to register opp notifier\n", cpu);
> +		goto out_disable_inter_clock;
> +	}
> +
> +	mutex_init(&info->reg_lock);
> +	info->opp_freq = clk_get_rate(info->cpu_clk);
> +
>   	/*
>   	 * If SRAM regulator is present, software "voltage tracking" is needed
>   	 * for this CPU power domain.



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
