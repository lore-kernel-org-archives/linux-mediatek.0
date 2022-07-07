Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E80E5C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Jul 2022 10:53:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o2TkSbcKxozTBX+199C68EfPygrcFe2Tw030jZ4Z9vM=; b=ZflplIDbrgJlL2Tc6PqFeYuKd0
	7UxIBpTa30rieEetcId07D8TaZAta2qcZY6pvMPWtCYZFhrdquBdavEo10XyWH4tAaTIhJr/Z4gaX
	AGIc7eOObZ3O5hM/tOtjsrx5qkHvokvr56W6AXC/FDAWTpeWJ3jsFScTEvNkqWsdHThApEqBUOn7R
	OVqHqmpig9SSf4Quh1WeEfqcy4EWddSxypcFLybxK5IRili4VDzcJQHozOTZmuaYc5yGPZ9i3w1j8
	eWSgCNGfL0SiecROnjYsI+d93CGQdWD8y3usZZwo6QmpbS9W9rJ4cVJHuELrUr3dbsCK22RLGz/ZH
	+W0Bwn0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9P8G-00FgEn-Oq; Thu, 07 Jul 2022 10:53:16 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9P8B-00FgCX-NP
	for linux-mediatek@lists.infradead.org; Thu, 07 Jul 2022 10:53:13 +0000
Received: by mail-pf1-x433.google.com with SMTP id o12so5030579pfp.5
        for <linux-mediatek@lists.infradead.org>; Thu, 07 Jul 2022 03:53:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=o2TkSbcKxozTBX+199C68EfPygrcFe2Tw030jZ4Z9vM=;
        b=GgGDiY3sxbPO69gH48Dooa8AKF4BOxgykhbQ+1ouSF8dLGeghVSxbRuSNK0BPAx24f
         APydzglFENyyildEjJPmyUFjC3ALeywiRgIWzCsL0tD6jlJw7wgdw5SPOpK13mOYQp1m
         iRE8czv4iIOBp8tHhVqGmvMQtjgmCQQP57BnEdZHwyNe49xS3VcFh0QSulsNKyyMgCPW
         m9xDOwuQqIdAk3VF7wOBs1NrObJARy3N3uedK5oGEldvOtNMJf+FjcuB3iPYSAB5BZg5
         zMj+O7USQ4J2eFtVwGZENKFjQzn1jraVue4zr1H3BuKAKaC0F8j1hN7HCCb152wGGCzu
         POoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=o2TkSbcKxozTBX+199C68EfPygrcFe2Tw030jZ4Z9vM=;
        b=mNCDfEGD9WpS8plPa98oZ7MFue+jI3C/Tvzi5PhGUfCxpVsoRDGdYV+3no/DC5dBSu
         y8NHjrnjjgKmhb+auDyHafDlCBGRIy70Gzmge7p+KktDeqTmINZYXHv//7OEqB9mIWWG
         96K04U1qrZmSg7kqJ03CU2nfaeyXETcggNpQvFN/91aEYdG1mPdWbQ/PXMoiIaXBjVsj
         /v40eBpd1gKhQcZUD/r/0khUBefq5LbploagKY5ZCsBjWaxnsBVv5FukINNVRpT3aonv
         RoPSMWXCpukYCvZz8zpI9lfiBkRa+xoGtDxNpuDdPLTS1HVW47thiNN7FroOj/AhkBSg
         Q0jw==
X-Gm-Message-State: AJIora/0AbiiIeKhvXjbpJUbMfodALX0qxjxRG9IL8cCEotFaogk4bkc
	4I3R5dGX++uPeSDcXSe0l1VK7w==
X-Google-Smtp-Source: AGRyM1tpqLIhCdElS4dIR3n1+S+tHgSxDTJ1ClIjp5xZogOgUFu5j/N9tejt6VOIggYIE9m6DdN9ow==
X-Received: by 2002:a17:902:e885:b0:16c:408:9317 with SMTP id w5-20020a170902e88500b0016c04089317mr7760209plg.62.1657191189998;
        Thu, 07 Jul 2022 03:53:09 -0700 (PDT)
Received: from localhost ([122.171.18.80])
        by smtp.gmail.com with ESMTPSA id f8-20020a170902ab8800b0016a0bf0ce2esm27552884plr.92.2022.07.07.03.53.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Jul 2022 03:53:09 -0700 (PDT)
Date: Thu, 7 Jul 2022 16:23:07 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Lukasz Luba <lukasz.luba@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
	daniel.lezcano@linaro.org, amitk@kernel.org, rui.zhang@intel.com,
	rafael@kernel.org, dietmar.eggemann@arm.com, nm@ti.com,
	sboyd@kernel.org, sudeep.holla@arm.com, cristian.marussi@arm.com,
	matthias.bgg@gmail.com, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/4] PM: EM: convert power field to micro-Watts
 precision and align drivers
Message-ID: <20220707105307.wl2pnqbf3j4fo75z@vireshk-i7>
References: <20220707071555.10085-1-lukasz.luba@arm.com>
 <20220707071555.10085-2-lukasz.luba@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220707071555.10085-2-lukasz.luba@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220707_035311_823379_7EF838CB 
X-CRM114-Status: GOOD (  17.87  )
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

On 07-07-22, 08:15, Lukasz Luba wrote:
> The milli-Watts precision causes rounding errors while calculating
> efficiency cost for each OPP. This is especially visible in the 'simple'
> Energy Model (EM), where the power for each OPP is provided from OPP
> framework. This can cause some OPPs to be marked inefficient, while
> using micro-Watts precision that might not happen.
> 
> Update all EM users which access 'power' field and assume the value is
> in milli-Watts.
> 
> Solve also an issue with potential overflow in calculation of energy
> estimation on 32bit machine. It's needed now since the power value
> (thus the 'cost' as well) are higher.
> 
> Example calculation which shows the rounding error and impact:
> 
> power = 'dyn-power-coeff' * volt_mV * volt_mV * freq_MHz
> 
> power_a_uW = (100 * 600mW * 600mW * 500MHz) / 10^6 = 18000
> power_a_mW = (100 * 600mW * 600mW * 500MHz) / 10^9 = 18
> 
> power_b_uW = (100 * 605mW * 605mW * 600MHz) / 10^6 = 21961
> power_b_mW = (100 * 605mW * 605mW * 600MHz) / 10^9 = 21
> 
> max_freq = 2000MHz
> 
> cost_a_mW = 18 * 2000MHz/500MHz = 72
> cost_a_uW = 18000 * 2000MHz/500MHz = 72000
> 
> cost_b_mW = 21 * 2000MHz/600MHz = 70 // <- artificially better
> cost_b_uW = 21961 * 2000MHz/600MHz = 73203
> 
> The 'cost_b_mW' (which is based on old milli-Watts) is misleadingly
> better that the 'cost_b_uW' (this patch uses micro-Watts) and such
> would have impact on the 'inefficient OPPs' information in the Cpufreq
> framework. This patch set removes the rounding issue.
> 
> Signed-off-by: Lukasz Luba <lukasz.luba@arm.com>
> ---
>  drivers/cpufreq/mediatek-cpufreq-hw.c |  7 ++--
>  drivers/cpufreq/scmi-cpufreq.c        |  6 +++
>  drivers/opp/of.c                      | 15 ++++----
>  drivers/powercap/dtpm_cpu.c           |  5 +--
>  drivers/thermal/cpufreq_cooling.c     | 13 ++++++-
>  drivers/thermal/devfreq_cooling.c     | 19 ++++++++--
>  include/linux/energy_model.h          | 54 +++++++++++++++++++--------
>  kernel/power/energy_model.c           | 24 ++++++++----
>  8 files changed, 100 insertions(+), 43 deletions(-)

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh

