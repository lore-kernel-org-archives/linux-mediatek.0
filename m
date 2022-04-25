Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 452CFC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Apr 2022 05:20:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I9CHzVglj7rCqG4IlIKJzP7BjFoXAORfL69qCy9AHes=; b=U2iRwzQvHs8rnx
	muLeiGgLSvYQxx8O0CwkU737M/U/dFEzPWK9MRi2A+s8BkSJ1Bh+ajWQyizdYdBofhC/fCxQbdK9b
	opIg8l8Dj7yWmdMPH/tqPFEABcSPArPDcqjJFgDcbg4hmVobrQVfxalPHWp5ikYg3l9buMa70gJHz
	LKS8ksdJ69CilQIkkHLfhb7SQzd5ch/1vpu4LRYPQoU4pqpPNhewxldBFat0ZMwvfO+awygIDnT50
	Esne5FtAAWpgQxEBsKFqzXVRiW7jYb3BETeINsbghQCURZElaelrYGkm3JxCqbtS1n8pULEt/dgHt
	S3d020yL7K5iR9/NGyBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nir9D-008Glu-P5; Mon, 25 Apr 2022 05:20:31 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nir9B-008GlI-QT
 for linux-mediatek@lists.infradead.org; Mon, 25 Apr 2022 05:20:31 +0000
Received: by mail-pl1-x62b.google.com with SMTP id q8so1332238plx.3
 for <linux-mediatek@lists.infradead.org>; Sun, 24 Apr 2022 22:20:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=wF5i8xk4P1LEOT63TuPgxEiYnBH2yC9okqwO1o9drxw=;
 b=iOF65cuSfSWhbypFbJBFBMJTl+UaUdhiF/7UOHTuj27ZNSz5/JxyOam6auVBEv4cwM
 bNZ2b3e3LEQcqJY1P5BraqF5BoLFOCGDxNqadUu3ikfZ6xwt7FIeKmjEm/VDqPTJiMOm
 LckAitENppa3vGr18CjGEslM09RD3rZxokOKrDszaN/Mp51F8cEmmOF0cQD+0/qzTTWY
 lOCySKh4JVBwV56+RKOu2qkZuUOd+hKnmUEatiHkpLU9uUgAiJ8G3NHXyIAYebk1N+5V
 TvJQ5rgItaUCxXT4RgXzBB0mhNbY3iDkO+x+hvS7M6E12XKIZxTFbi7V63odtA3jgOep
 fAMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=wF5i8xk4P1LEOT63TuPgxEiYnBH2yC9okqwO1o9drxw=;
 b=xxAr1Hy9is3t8ifDU1xGp6JdQ095Mx9HYfqouFF+XxHvVa7jnLHqmmq7JajswcfMKw
 pERV1j6g27xDDmBoNdAE2pN/lX4BWnPnaog0kHii/yKPs3iYEv5DggM3F/T0rxuJ+FR8
 NKDG656ux4aC0QpgGMFORyHYQ1PSRP5EqHtwAzRGDa9U2iwuWiytHBBCNPHjjpx/Y2zx
 arMtlRagaLx1TIHHW/zgK7laDri3O0opCsBv7gt7c8CwnO9JwA7AgH0VO/Zjp8KcbmJo
 G/no77drOm8TF0DX9Mr9BqrnSDN5oDWqueB2Fk4AF4gCtfHbWI6AQ2pjZw/IQCg/NEwp
 K+lA==
X-Gm-Message-State: AOAM530ishUrx7RRJRkV3zjhRruELrwolXB53Pg1zWAW9FikIkSR28aJ
 1mmFQyPPKaJTfg9ZaWckvvm8ug==
X-Google-Smtp-Source: ABdhPJyx3JUtvWx3NQpb52P2n8q+ehDq/Rx6PQG85kdtJ6/357ZDL4xO9WmowD2hC1CP5Xtun1KeEQ==
X-Received: by 2002:a17:902:690b:b0:159:65c:9044 with SMTP id
 j11-20020a170902690b00b00159065c9044mr16525727plk.47.1650864029110; 
 Sun, 24 Apr 2022 22:20:29 -0700 (PDT)
Received: from localhost ([122.171.250.232]) by smtp.gmail.com with ESMTPSA id
 y16-20020a63b510000000b00398d8b19bbfsm8323113pge.23.2022.04.24.22.20.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Apr 2022 22:20:28 -0700 (PDT)
Date: Mon, 25 Apr 2022 10:50:26 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Rex-BC Chen <rex-bc.chen@mediatek.com>
Cc: rafael@kernel.org, robh+dt@kernel.org, krzk+dt@kernel.org,
 matthias.bgg@gmail.com, jia-wei.chang@mediatek.com,
 roger.lu@mediatek.com, hsinyi@google.com, khilman@baylibre.com,
 angelogioacchino.delregno@collabora.com, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 "Andrew-sh.Cheng" <andrew-sh.cheng@mediatek.com>
Subject: Re: [PATCH V4 05/14] cpufreq: mediatek: Add opp notification support
Message-ID: <20220425052026.k3xfmmil4ujqeynh@vireshk-i7>
References: <20220422075239.16437-1-rex-bc.chen@mediatek.com>
 <20220422075239.16437-6-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220422075239.16437-6-rex-bc.chen@mediatek.com>
User-Agent: NeoMutt/20180716-391-311a52
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220424_222029_907350_7B76B58F 
X-CRM114-Status: GOOD (  21.69  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 22-04-22, 15:52, Rex-BC Chen wrote:
> From: "Andrew-sh.Cheng" <andrew-sh.cheng@mediatek.com>
> 
> >From this opp notifier, cpufreq should listen to opp notification and do

Why the extra ">" here ?

> proper actions when receiving events of disable and voltage adjustment.
> 
> One of the user for this opp notifier is MediaTek SVS.
> The MediaTek Smart Voltage Scaling (SVS) is a hardware which calculates
> suitable SVS bank voltages to OPP voltage table.
> 
> Signed-off-by: Andrew-sh.Cheng <andrew-sh.cheng@mediatek.com>
> Signed-off-by: Jia-Wei Chang <jia-wei.chang@mediatek.com>
> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  drivers/cpufreq/mediatek-cpufreq.c | 92 +++++++++++++++++++++++++++---
>  1 file changed, 84 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/cpufreq/mediatek-cpufreq.c b/drivers/cpufreq/mediatek-cpufreq.c
> +static int mtk_cpufreq_opp_notifier(struct notifier_block *nb,
> +				    unsigned long event, void *data)
> +{
> +	struct dev_pm_opp *opp = data;
> +	struct dev_pm_opp *new_opp;
> +	struct mtk_cpu_dvfs_info *info;
> +	unsigned long freq, volt;
> +	struct cpufreq_policy *policy;
> +	int ret = 0;
> +
> +	info = container_of(nb, struct mtk_cpu_dvfs_info, opp_nb);
> +
> +	if (event == OPP_EVENT_ADJUST_VOLTAGE) {

I don't see any call to dev_pm_opp_adjust_voltage() for your platform, how is
this ever going to get called ?

> +		freq = dev_pm_opp_get_freq(opp);
> +
> +		mutex_lock(&info->reg_lock);
> +		if (info->opp_freq == freq) {
> +			volt = dev_pm_opp_get_voltage(opp);
> +			ret = mtk_cpufreq_set_voltage(info, volt);
> +			if (ret)
> +				dev_err(info->cpu_dev,
> +					"failed to scale voltage: %d\n", ret);
> +		}
> +		mutex_unlock(&info->reg_lock);
> +	} else if (event == OPP_EVENT_DISABLE) {
> +		freq = dev_pm_opp_get_freq(opp);
> +
> +		/* case of current opp item is disabled */
> +		if (info->opp_freq == freq) {
> +			freq = 1;
> +			new_opp = dev_pm_opp_find_freq_ceil(info->cpu_dev,
> +							    &freq);
> +			if (IS_ERR(new_opp)) {
> +				dev_err(info->cpu_dev,
> +					"all opp items are disabled\n");
> +				ret = PTR_ERR(new_opp);
> +				return notifier_from_errno(ret);
> +			}
> +
> +			dev_pm_opp_put(new_opp);
> +			policy = cpufreq_cpu_get(info->opp_cpu);
> +			if (policy) {
> +				cpufreq_driver_target(policy, freq / 1000,
> +						      CPUFREQ_RELATION_L);
> +				cpufreq_cpu_put(policy);

IIUC, then you are trying to change the frequency if a currently used OPP is
getting removed ? In that case, this problem is generic enough not to be fixed
in a end driver. This should be fixed in core somehow.

-- 
viresh

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
