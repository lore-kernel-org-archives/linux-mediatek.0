Return-Path: <SRS0=olbE=LX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3722EC11F66
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Jun 2021 06:18:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E8ABF61DA6
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Jun 2021 06:18:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E8ABF61DA6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LruYrZOW8PpLQLrzGMNVfKcz8Ux4sblXzlPDsF5NBx4=; b=Zj6klujotzTXUU
	vMDkFoKbpEnNp4JxO3v00qipulvi8594bp/llhG773OCa4OMxtiLAad7QGZY7qWwoz1Yf6J6Tjwvb
	ATXI+xkAZum3XIv5VHb+9hslNdkXi+Ih/BP3N/FY87yMJq8fLtizqiDdvxOef2XswOfpVf8VKtQtT
	SBKky+4bsbLxDAHcGXV3Bf9GU/tteLEUpeDP5dLKXuGFejSPgi8o/3Hm9YmAdHkpj7NUSUU1ysjWk
	atczA7/PdNC+GYd/Z/BiTdpDtRQP2FgDWwehyjKzz/VHDlEAHSFkuDXFKOW9tTi4E+Vu/TzXKxvSa
	3oUZsztOQb5Y5P1z/LKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ly74P-009uTz-9F; Tue, 29 Jun 2021 06:18:05 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ly74M-009uSa-B5
 for linux-mediatek@lists.infradead.org; Tue, 29 Jun 2021 06:18:03 +0000
Received: by mail-pj1-x1035.google.com with SMTP id l11so11741509pji.5
 for <linux-mediatek@lists.infradead.org>; Mon, 28 Jun 2021 23:18:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=hI1DeZ2pRK8aek3pSY+ZixxRt/uy7BhVNJwpyrPvK4U=;
 b=kVGPtew0Kx8eTy5szjyeACr/mtbC6DaMpT7oBhHleodDrSuAeIPnJJRJg/8ULx/Ug4
 miyM9Y33Nk8kTSd2gcZOEIK+yD2NbSqh1RWOiZCs1+2FjnZrn/UXhe7gt/OSDAcpS5iE
 gjWx5+xrYvSW8yx7Px8yi5+1T2pdpX7XR1E9lqBBhZZj9oI8vSih+hYfMSWylFGsdnl6
 1c/pZREkNYk7Hza1b1ZEw3wzjm5ou/k7B6cmPI0b+6O8dlCBOKJa6TembetnP+L8Ewoy
 DGIp5sYYtPHfcBSEY8iUzYqovqxQsAjPVoaoUUEMInLIGzvI848yhX7Ot/W4dQgJJxiE
 jQ4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=hI1DeZ2pRK8aek3pSY+ZixxRt/uy7BhVNJwpyrPvK4U=;
 b=Cxd+58S/tHWdJENJq9603Y+W66iSPdzoQ+1EjD1V9axbsHCdrh/es7Du+YPmfvcGfm
 fffTQIpfYW+Ejzp+vn05RBBGgeOYuLoVk+4W6ny1ssj3RjuA3D8A1qYtayAz+V27tt12
 VmC3S3DqJz82PCQMMbPXssv68OvktyS/H6/GgTPDhhGr8Dg8oldJUt2JXTJUHn1rAi18
 0qiuryL+intPVjil/HAkK6/HtMNwiri/AT05xTJnAaa15aCFEgSFWyRDZme+n3o/4tbK
 sAFxJdYZq63a6jbJ5jRfo1nZ1/xvWgly24SOYnYOqVemEOMHpLKsfoaYX6p3FEYBKnaA
 Suqg==
X-Gm-Message-State: AOAM533yhpYSi9e7Qy3dYjAUGP4t8f7VBt2tJjxn3kPDLFEukGk67QOo
 6YY+9v9lB1B+LOulsNrlAMveashv17f+mw==
X-Google-Smtp-Source: ABdhPJyfVA20O8oNr9ThebtXXkg4YVGPQnBLR6jQoWQ0+A/rjn+bS5SKjwFuYmN2Dc2Yxk82ratFFw==
X-Received: by 2002:a17:90a:ba91:: with SMTP id
 t17mr43507438pjr.89.1624947481144; 
 Mon, 28 Jun 2021 23:18:01 -0700 (PDT)
Received: from localhost ([136.185.134.182])
 by smtp.gmail.com with ESMTPSA id fv8sm17093546pjb.21.2021.06.28.23.18.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Jun 2021 23:18:00 -0700 (PDT)
Date: Tue, 29 Jun 2021 11:47:58 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: TungChen Shih <tung-chen.shih@mediatek.com>
Cc: rjw@rjwysocki.net, matthias.bgg@gmail.com, wsd_upstream@mediatek.com,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 1/1] cpufreq: fix the target freq not in the range of
 policy->min & max
Message-ID: <20210629061758.wdavb2a4bpklmqi3@vireshk-i7>
References: <20210626162324.8236-1-tung-chen.shih@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210626162324.8236-1-tung-chen.shih@mediatek.com>
User-Agent: NeoMutt/20180716-391-311a52
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210628_231802_469261_E5757D5D 
X-CRM114-Status: GOOD (  28.11  )
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

On 27-06-21, 00:23, TungChen Shih wrote:
>     The function cpufreq_driver_resolve_freq() should return the lowest

Don't add extra spaces at the beginning of paragraphs here.

> supported freq greater than or equal to the given target_freq, subject
> to policy (min/max) and driver limitations. However, the index returned
> by cpufreq_frequency_table_target() won't subject to policy min/max in
> some cases.
> 
>     In cpufreq_frequency_table_target(), this function will try to find
> an index for @target_freq in freq_table, and the frequency of selected
> index should be in the range [policy->min, policy->max], which means:
> 
>     policy->min <= policy->freq_table[idx].frequency <= policy->max
> 
>     Though "clamp_val(target_freq, policy->min, policy->max);" would
> have been called to check this condition, when policy->max or min is
> not exactly one of the frequency in the frequency table,
> policy->freq_table[idx].frequency may still go out of the range
> 
>     For example, if our sorted freq_table is [3000, 2000, 1000], and
> suppose we have:
> 
>     @target_freq = 2500
>     @policy->min = 2000
>     @policy->max = 2200
>     @relation = CPUFREQ_RELATION_L
> 
> 1. After clamp_val(target_freq, policy->min, policy->max); @target_freq
> becomes 2200
> 2. Since we use CPUFREQ_REALTION_L, final selected freq will be 3000 which
> beyonds policy->max

Right so the problem does exist, and not only with
cpufreq_driver_resolve_freq(), but __cpufreq_driver_target() as well.
I have a sent a patchset to update both of these to start sharing some
code and we need to fix this for both now.

> Signed-off-by: TungChen Shih <tung-chen.shih@mediatek.com>
> ---
>  drivers/cpufreq/cpufreq.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
> index 802abc925b2a..8e3a17781618 100644
> --- a/drivers/cpufreq/cpufreq.c
> +++ b/drivers/cpufreq/cpufreq.c
> @@ -544,8 +544,23 @@ unsigned int cpufreq_driver_resolve_freq(struct cpufreq_policy *policy,
>  	if (cpufreq_driver->target_index) {
>  		unsigned int idx;
>  
> +		/*  to find the frequency >= target_freq */
>  		idx = cpufreq_frequency_table_target(policy, target_freq,
>  						     CPUFREQ_RELATION_L);
> +
> +		/* frequency should subject to policy (min/max) */
> +		if (policy->freq_table[idx].frequency > policy->max) {
> +			if (policy->freq_table_sorted == CPUFREQ_TABLE_SORTED_ASCENDING)
> +				idx--;
> +			else
> +				idx++;
> +		} else if (policy->freq_table[idx].frequency < policy->min) {
> +			if (policy->freq_table_sorted == CPUFREQ_TABLE_SORTED_ASCENDING)
> +				idx++;
> +			else
> +				idx--;
> +		}

This doesn't look clean to be honest.

Rafael, does it make sense to update cpufreq_frequency_table_target()
(and its internal routines) to take policy bounds in consideration, or
something else ?

-- 
viresh

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
