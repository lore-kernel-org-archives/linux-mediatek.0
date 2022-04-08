Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB6F6C433FE
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Apr 2022 13:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:From:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KHU+egRPFSzQ8eM5hDQRVBURMi+4GJzZhSWnyM6V0QI=; b=R5IcRTbfVeYQyr
	hK3VCPkZtXFePHHRXnkm/Q4HrTn5QV754k3w9swh9qT8bUetSnF8gncd6Fm83m9tO1j6YwQtdVdZk
	5Yil2sY7tKpDvrDRJ07wcde6so56hZsweQTnjB93jVCIHipn4BVyEe2DcBQq/M+76lzQOea0Lt1DT
	JgmOqZZKakUjLZcSjE6/lL62y3Et1ythPGl7JK5qji4NiFkKxs6dQSL0FNgVWWTxXk5TH8eljvsP2
	NINNKy0tmGwWaL+NtKydxssNUOmXNsPNk69f08qNaNlZR/BHE6U4G7C9QF6XNTB05ELOQHp7GExy7
	mpm/QGU/MY4MyAMCvgWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncopq-00HQ8u-KF; Fri, 08 Apr 2022 13:39:34 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nconE-00HOWE-VB; Fri, 08 Apr 2022 13:36:56 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id B97F11F47188
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1649425011;
 bh=PIJNcGwrF6HuxDb11oOTw9f1ZSeNuaYGIFc0+4/olJQ=;
 h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
 b=gVW76N9wfn14hZEjm3jOIj1kFpmgYzU02KWNXq/cGX/4ARvUX5O17sfSrAyCMzHCx
 ccakmCBSDKbEiQtdVQndZWtIdKrH8ovob5nHxt3fVoE1buAZx2IzqOwhSxTxSQ7CAU
 RVEy6t7KTrZgPo7yYfodJwsYpytrI2qRon3+layUTmkjWOQ5a5a5hXj0ZRoU/GvZQ6
 evT88/rT6M/zKxvXNhinA/CbBTgz84dOK2TZLxQm5WrQUHREHymxFOYqaqFBdUWatg
 B2l2dFgFovq+7x5pOAZCtBRgh5MvYSO/0QtmZadFZkM3Ckv1BqMIqBX8ViaplUf1ye
 p44HQ9m8VjctQ==
Message-ID: <4cc24333-3985-5efe-cc5f-c7b8492f6c1e@collabora.com>
Date: Fri, 8 Apr 2022 15:36:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH V2 06/15] cpufreq: mediatek: Record previous target vproc
 value
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, rafael@kernel.org,
 viresh.kumar@linaro.org, robh+dt@kernel.org, krzk+dt@kernel.org
Cc: matthias.bgg@gmail.com, jia-wei.chang@mediatek.com,
 roger.lu@mediatek.com, hsinyi@google.com, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 "Andrew-sh . Cheng" <andrew-sh.cheng@mediatek.com>
References: <20220408045908.21671-1-rex-bc.chen@mediatek.com>
 <20220408045908.21671-7-rex-bc.chen@mediatek.com>
Content-Language: en-US
In-Reply-To: <20220408045908.21671-7-rex-bc.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220408_063653_233295_0A81CDDC 
X-CRM114-Status: GOOD (  21.91  )
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

Il 08/04/22 06:58, Rex-BC Chen ha scritto:
> From: Jia-Wei Chang <jia-wei.chang@mediatek.com>
> 
> We found the buck voltage may not be exactly the same with what we set
> because CPU may share the same buck with other module.
> Therefore, we need to record the previous desired value instead of reading
> it from regulators.
> 
> Signed-off-by: Andrew-sh.Cheng <andrew-sh.cheng@mediatek.com>
> Signed-off-by: Jia-Wei Chang <jia-wei.chang@mediatek.com>
> ---
>   drivers/cpufreq/mediatek-cpufreq.c | 31 +++++++++++++++++++-----------
>   1 file changed, 20 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/cpufreq/mediatek-cpufreq.c b/drivers/cpufreq/mediatek-cpufreq.c
> index dc4a87e68940..472f4de29e5f 100644
> --- a/drivers/cpufreq/mediatek-cpufreq.c
> +++ b/drivers/cpufreq/mediatek-cpufreq.c
> @@ -40,6 +40,7 @@ struct mtk_cpu_dvfs_info {
>   	struct list_head list_head;
>   	int intermediate_voltage;
>   	bool need_voltage_tracking;
> +	int old_vproc;
>   };
>   
>   static LIST_HEAD(dvfs_info_list);
> @@ -190,11 +191,17 @@ static int mtk_cpufreq_voltage_tracking(struct mtk_cpu_dvfs_info *info,
>   
>   static int mtk_cpufreq_set_voltage(struct mtk_cpu_dvfs_info *info, int vproc)
>   {
> +	int ret;
> +
>   	if (info->need_voltage_tracking)
> -		return mtk_cpufreq_voltage_tracking(info, vproc);
> +		ret = mtk_cpufreq_voltage_tracking(info, vproc);
>   	else
> -		return regulator_set_voltage(info->proc_reg, vproc,
> -					     vproc + VOLT_TOL);
> +		ret = regulator_set_voltage(info->proc_reg, vproc,
> +					    MAX_VOLT_LIMIT);
> +	if (!ret)
> +		info->old_vproc = vproc;
> +
> +	return ret;
>   }
>   
>   static int mtk_cpufreq_set_target(struct cpufreq_policy *policy,
> @@ -211,15 +218,7 @@ static int mtk_cpufreq_set_target(struct cpufreq_policy *policy,
>   
>   	inter_vproc = info->intermediate_voltage;
>   
> -	old_freq_hz = clk_get_rate(cpu_clk);
> -	old_vproc = regulator_get_voltage(info->proc_reg);
> -	if (old_vproc < 0) {
> -		pr_err("%s: invalid Vproc value: %d\n", __func__, old_vproc);
> -		return old_vproc;
> -	}
> -
>   	freq_hz = freq_table[index].frequency * 1000;
> -
>   	opp = dev_pm_opp_find_freq_ceil(cpu_dev, &freq_hz);
>   	if (IS_ERR(opp)) {
>   		pr_err("cpu%d: failed to find OPP for %ld\n",
> @@ -229,6 +228,16 @@ static int mtk_cpufreq_set_target(struct cpufreq_policy *policy,
>   	vproc = dev_pm_opp_get_voltage(opp);
>   	dev_pm_opp_put(opp);
>   
> +	old_freq_hz = clk_get_rate(cpu_clk);
> +	old_vproc = info->old_vproc;
> +	if (old_vproc == 0)
> +		old_vproc = regulator_get_voltage(info->proc_reg);
> +	if (old_vproc < 0) {
> +		dev_err(cpu_dev, "%s: invalid Vproc value: %d\n",
> +			__func__, old_vproc);
> +		return old_vproc;
> +	}

 From my understandment, if this fails once, it fails forever!

info->old_vproc is set only if info->need_voltage_tracking is true, and only
in mtk_cpufreq_set_voltage(): this function is called only after the checks
that you've introduced there, and that's on previously stored values.
While this was fine in the previous version, because it was always calling
regulator_get_voltage(), here it's not.

I think that a good option here is to:

old_vproc = info->old_vproc;
if (old_vproc <= 0)
	old_vproc = regulator_get_voltage(info->proc_reg);
if (old_vproc < 0) {
	dev_err and return
}

...or, if this is not applicable, we should still find another way to not
let this driver to simply fail forever in case anything goes wrong.

Regards,
Angelo

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
