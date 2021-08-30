Return-Path: <SRS0=Uf5e=NV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 868FBC432BE
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Aug 2021 05:05:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4CD5C60F44
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Aug 2021 05:05:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4CD5C60F44
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Hh94RJY0SMGJtMtS7LP2eLmnh5YRKDzmM+eL+0/vQ74=; b=yp0pfrCLm/NTwG
	lA3vs1D2fquwrorbs84uHw3bh6Lbx7Te3OokqS35/M3YGQn4tkthXM/6IkPPbxv7TCJbVRqiAI2JW
	cOXJiR7WcQu5LAuAy5ZbGc8CYMUV9cjx3aMJjMKOTU2F/t9qwnSdgcEp4869YLPQCNHaKSL43EAVc
	a8likLZukJZnUrWf5dTPpH4lIOkB1Eu0e2xNDYtOy0cMvY4XAL0cgES1SXt3a3uoRYlWimLsTys7N
	ecUCD2d04QNwOXTJ1YOv3WB5YubLUzGuYUoJV8k7P/Q5wjF8q1PZ4coyIMzBG+upafM4/PfqRTmqi
	MKMAkBSJB6gyaNyJCp3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mKZTq-00GRT4-U2; Mon, 30 Aug 2021 05:05:10 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mKZTb-00GRRX-4o
 for linux-mediatek@lists.infradead.org; Mon, 30 Aug 2021 05:04:58 +0000
Received: by mail-pj1-x102c.google.com with SMTP id
 n13-20020a17090a4e0d00b0017946980d8dso12969805pjh.5
 for <linux-mediatek@lists.infradead.org>; Sun, 29 Aug 2021 22:04:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=HziJP/dygEyNluPtXWKc6SpypCt4+2Y7o4pyW2rHfac=;
 b=Zp5ZiMV0CfOCgf2/iAtGJuoGZruRIVvGXo0zwkLhRqNGm2j98/jWGYO3CcQ7JzTty8
 YeBQMg8/vgV5n5MlWTvtEm1vg/F0it6S/Jq1xG2mzzgIcCA8IX+QuRayvC8QXG502Jgo
 /o66oy/NpG6jXjEzCSW2fmXw4iKkG8BfkbvDgCwGYOHPnV+7bSmZLrUyp6itAEfPVS+W
 slQAbuMAnE74l9jaPMWZP3au5bIV0FDIC+JdWFa5QyJKIuvbiLKZtW1zvuaJFuC9bZi6
 uB2/HyNvHuR0sJOUitPcz/xeYH0USq+Ge64MWtcia25BcGv0Kpx6BdYXOSeIz8a5qFnl
 sRpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=HziJP/dygEyNluPtXWKc6SpypCt4+2Y7o4pyW2rHfac=;
 b=OzAnemEtPchmG0E4Tnl4Y8nWNXRW+rseHVRIbxZoJ8MRDqLjT0WlJfnoktddw3YzfO
 uaylEuDwsVUOvky6IQaWCM0Nkotco4WGFNuz95EIw1Nw81wfFh8ABOwrjlpMYOi4+FOc
 fQtmpg6hw9atnOIE65FjQwSAJPG50YHgcauUPQ7rC6ZjhxshNlnSEEUHNEMeYIsfU9R0
 dMe8722lK6PJrS3K/vO3nC18SvM2f2YWbFVgAeIaoYbB71K5S7Ow7O/uZXfJcq0bb9fv
 PUSW2pl2XfitRjfqnV3M8PWLN/ND/fLD+rCLGJLujjwAVVpjvJIEhM83S5hb4xkE7aVD
 bulw==
X-Gm-Message-State: AOAM530YmulmkQuFqhcTGO/PR2pfxp5FgKC3nsDK7h6Iak+2j1WY4kUJ
 5fKHrvqysggukIXJLxvE7wkZCw==
X-Google-Smtp-Source: ABdhPJwZ6hgP4vm+aVcTn2qoaIgOSChZ2tiVNSCvx4/M6/3DGZv7qfs0o+VLPB6EuTqFVNGGXHD7JA==
X-Received: by 2002:a17:90a:191a:: with SMTP id
 26mr29224522pjg.118.1630299893596; 
 Sun, 29 Aug 2021 22:04:53 -0700 (PDT)
Received: from localhost ([122.172.201.85])
 by smtp.gmail.com with ESMTPSA id n24sm14943364pgv.60.2021.08.29.22.04.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Aug 2021 22:04:52 -0700 (PDT)
Date: Mon, 30 Aug 2021 10:34:50 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Hector Yuan <hector.yuan@mediatek.com>
Cc: linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, wsd_upstream@mediatek.com
Subject: Re: [PATCH v14 2/3] cpufreq: Add of_perf_domain_get_sharing_cpumask
Message-ID: <20210830050450.r4kfv72bsxsttnli@vireshk-i7>
References: <1630162872-25452-1-git-send-email-hector.yuan@mediatek.com>
 <1630162872-25452-3-git-send-email-hector.yuan@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1630162872-25452-3-git-send-email-hector.yuan@mediatek.com>
User-Agent: NeoMutt/20180716-391-311a52
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210829_220455_269358_E0159AC1 
X-CRM114-Status: GOOD (  14.41  )
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

On 28-08-21, 23:01, Hector Yuan wrote:
> From: "Hector.Yuan" <hector.yuan@mediatek.com>
> 
> Add of_perf_domain_get_sharing_cpumask function to group cpu
> to specific performance domain.
> 
> Signed-off-by: Hector.Yuan <hector.yuan@mediatek.com>
> ---
>  include/linux/cpufreq.h |   39 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 39 insertions(+)
> 
> diff --git a/include/linux/cpufreq.h b/include/linux/cpufreq.h
> index 9fd7194..4916d70 100644
> --- a/include/linux/cpufreq.h
> +++ b/include/linux/cpufreq.h
> @@ -13,6 +13,8 @@
>  #include <linux/completion.h>
>  #include <linux/kobject.h>
>  #include <linux/notifier.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>
>  #include <linux/pm_qos.h>
>  #include <linux/spinlock.h>
>  #include <linux/sysfs.h>
> @@ -1036,6 +1038,43 @@ void arch_set_freq_scale(const struct cpumask *cpus,
>  }
>  #endif
>  
> +#ifdef CONFIG_CPU_FREQ
> +static inline int of_perf_domain_get_sharing_cpumask(int index, const char *list_name,
> +						     const char *cell_name,
> +						     struct cpumask *cpumask)

What happened with the discussion we had about returning index and passing CPU
there ?

-- 
viresh

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
