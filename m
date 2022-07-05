Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8B81C43334
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Jul 2022 09:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZW5lLkL4JDDf9YU7h/GJGKjkCyTulUg7IkJ5X2M8OE0=; b=06VY09ExX8WhT2XTzOXaNUiAZV
	nQRYueKP5jjLx6/OPGje4dqpk9ZD6UmViGCwO3yKYFFdoc5CDFSvKoup3SvClozUvAJMUbbCzGsue
	za7HntVRE49wJh83HVTK2RYy2MApkugOj00sW37uIOYJyfEysJ4mHwqybV9bxoaeCK2VO1ILNTbEs
	eNFy6g3WlxY1Qrg/nOBpVz6LegzkF2AUCQ0eSzZcZ4AV+YTyeePxs4pzzb9xPnNWBeHlLwbffwtRk
	Qf6ctS+yxmXh3Pl3loWAdeCm5GYydKauffqomXN7NrIGPGtzERSh3pcr0t17nVvWcJsJvAO94OOPc
	9qMVKSwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8eo4-00GfkJ-8w; Tue, 05 Jul 2022 09:25:20 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8enr-00GfZY-BZ
	for linux-mediatek@lists.infradead.org; Tue, 05 Jul 2022 09:25:09 +0000
Received: by mail-wr1-x42a.google.com with SMTP id d16so10322138wrv.10
        for <linux-mediatek@lists.infradead.org>; Tue, 05 Jul 2022 02:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=ZW5lLkL4JDDf9YU7h/GJGKjkCyTulUg7IkJ5X2M8OE0=;
        b=CpNzyFgqsQd/DD8PMyj/53gIhGninW9JqnA2U3FFJTOPqE5SM3EkDrAdhwn+7ncT5v
         wKjohAnLgdC+n8Y+UXvJHDf7RYG5VaTRCd4Fc+uRINtx5aikqTNMbIqtV1nzjCPlk6nj
         D/0sZ0VLfEaIsUm3UnmE+bpDGWNXeaH/Lyw8ggXAyVBXoijGMVpfJlbrX4rfqEKD3bb6
         uhQFDW/Q7u7w3Yq0l4IgTZkgzhb28Gyrzno9rxTV0SenCO9ZTDV5UPfBNTAsvX9nsPC0
         qcyL9P/sBnSoRnd8AnS0YlfRh+Al/8plbYVUFILSlTeSfZmrUb+nZ0vZd+kObtXtFkp7
         viYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=ZW5lLkL4JDDf9YU7h/GJGKjkCyTulUg7IkJ5X2M8OE0=;
        b=A9smMjzdJwbxXxXgUkQu1NHH2jD4v9OeEuTup9CVRrymLP1Nqq888qa/jgWptlQn86
         Sr13v8eg/3Cr97GdlnRZPDcpTO/4ymJH8AvdaIGzLufi3wi8QQ/Erv6VOq0iXys+mF6N
         1B8gR5pN9vUOds05CdoNWXpCqAFkK4dZ5cHe/x8WarLZuq7B6IQpBHKb030qn7JgRvhc
         /3enRw92NJljmDhd0Q39JvszjilPgxWluB4gDQ9APFjFVgDt9nnxATfZVqpPCQ1FK/sf
         cZZWjCvlJo2qcw3pVUoV94xPfhUpcd0palrxnYi9/uH84a6k6jpxpL53DV+Ee06Lo3D/
         R3TQ==
X-Gm-Message-State: AJIora8NPMb7IEUmC1Vuk2s/g1beaRqbF23gWmtGNeFIw+sF3RdfA+yX
	fL7lr5DcOqHWRsXCf90oa5/iKA==
X-Google-Smtp-Source: AGRyM1ulejTrozItdDe8gUaSa6g97LeECzQY32rA9ATM/klopckLROa1qgzi/UICUNSR8vmGdeg9yQ==
X-Received: by 2002:a5d:4f0b:0:b0:21d:705c:caf with SMTP id c11-20020a5d4f0b000000b0021d705c0cafmr3189291wru.55.1657013103855;
        Tue, 05 Jul 2022 02:25:03 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id q7-20020a05600000c700b0021d76985929sm484157wrx.80.2022.07.05.02.25.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Jul 2022 02:25:03 -0700 (PDT)
Message-ID: <653f63e5-c794-27fb-115a-7b051850991b@linaro.org>
Date: Tue, 5 Jul 2022 11:25:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 4/4] cpufreq: scmi: Support the power scale in micro-Watts
 in SCMI v3.1
Content-Language: en-US
To: Lukasz Luba <lukasz.luba@arm.com>, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org
Cc: amitk@kernel.org, rui.zhang@intel.com, viresh.kumar@linaro.org,
 rafael@kernel.org, dietmar.eggemann@arm.com, nm@ti.com, sboyd@kernel.org,
 sudeep.holla@arm.com, cristian.marussi@arm.com, matthias.bgg@gmail.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
References: <20220622145802.13032-1-lukasz.luba@arm.com>
 <20220622145802.13032-5-lukasz.luba@arm.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20220622145802.13032-5-lukasz.luba@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220705_022507_445939_125D8B00 
X-CRM114-Status: GOOD (  20.26  )
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

On 22/06/2022 16:58, Lukasz Luba wrote:
> The SCMI v3.1 adds support for power values in micro-Watts. They are not
> always in milli-Watts anymore (ignoring the bogo-Watts). Thus, the power
> must be converted conditionally before sending to Energy Model. Add the
> logic which handles the needed checks and conversions.
> 
> Signed-off-by: Lukasz Luba <lukasz.luba@arm.com>
> ---
>   drivers/cpufreq/scmi-cpufreq.c | 15 ++++++++++-----
>   1 file changed, 10 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/cpufreq/scmi-cpufreq.c b/drivers/cpufreq/scmi-cpufreq.c
> index bfd35583d653..513a071845c2 100644
> --- a/drivers/cpufreq/scmi-cpufreq.c
> +++ b/drivers/cpufreq/scmi-cpufreq.c
> @@ -100,7 +100,7 @@ static int __maybe_unused
>   scmi_get_cpu_power(struct device *cpu_dev, unsigned long *power,
>   		   unsigned long *KHz)
>   {
> -	bool power_scale_mw = perf_ops->power_scale_mw_get(ph);
> +	enum scmi_power_scale power_scale = perf_ops->power_scale_get(ph);
>   	unsigned long Hz;
>   	int ret, domain;
>   
> @@ -114,8 +114,8 @@ scmi_get_cpu_power(struct device *cpu_dev, unsigned long *power,
>   	if (ret)
>   		return ret;
>   
> -	/* Provide bigger resolution power to the Energy Model */
> -	if (power_scale_mw)
> +	/* Convert the power to uW if it is mW (ignore bogoW) */
> +	if (power_scale == SCMI_POWER_MILLIWATTS)
>   		*power *= MICROWATT_PER_MILLIWATT;
>   
>   	/* The EM framework specifies the frequency in KHz. */
> @@ -255,8 +255,9 @@ static int scmi_cpufreq_exit(struct cpufreq_policy *policy)
>   static void scmi_cpufreq_register_em(struct cpufreq_policy *policy)
>   {
>   	struct em_data_callback em_cb = EM_DATA_CB(scmi_get_cpu_power);
> -	bool power_scale_mw = perf_ops->power_scale_mw_get(ph);
> +	enum scmi_power_scale power_scale = perf_ops->power_scale_get(ph);
>   	struct scmi_data *priv = policy->driver_data;
> +	bool em_power_scale = false;

Just pass 'false' to em_dev_register_perf_domain()

>   	/*
>   	 * This callback will be called for each policy, but we don't need to
> @@ -268,9 +269,13 @@ static void scmi_cpufreq_register_em(struct cpufreq_policy *policy)
>   	if (!priv->nr_opp)
>   		return;
>   
> +	if (power_scale == SCMI_POWER_MILLIWATTS
> +	    || power_scale == SCMI_POWER_MICROWATTS)
> +		em_power_scale = true;
> +
>   	em_dev_register_perf_domain(get_cpu_device(policy->cpu), priv->nr_opp,
>   				    &em_cb, priv->opp_shared_cpus,
> -				    power_scale_mw);
> +				    em_power_scale);
>   }
>   
>   static struct cpufreq_driver scmi_cpufreq_driver = {


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

