Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97CBCC433FE
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Apr 2022 11:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EhWX2LRgUI4g4VzyZxortEc/aRlMhpWgM71sbIAh7R0=; b=H8smtkVTp21KBuUYQ7L18QEkpQ
	dpWWkDdLuv6tm2kTBDuc57D6g6pBJQwNMbT6NwwY3MiKax0H9L/9bdI7CKXLsObCP2SBMInZ0L1ye
	dXA67gi7nXzxT9Lwo2TP+gvm+ShXzsA2VIHkiDA7yu0xSSR4wW1g0uKgg9sjJoC3ajR4jxWkL7DjC
	IVwdkxumUW4bduyeloxqJvXYUlboB8oEjx2qf+68Yv5WdMjThcnvHVKpEDzeC8SvCxbDgfZl95Gw8
	WvZa1vStjOe3wDiX3OQIdF56raMlgmgnCUoGkK64zwVXsM7uF21uzZ1xL8i5BEni7mcHJOaOu5hmI
	DOd1+r+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njJWd-00E6fz-OJ; Tue, 26 Apr 2022 11:38:35 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njJWS-00E6dD-ND; Tue, 26 Apr 2022 11:38:26 +0000
Received: by mail-wm1-x331.google.com with SMTP id
 1-20020a05600c248100b00393fbf11a05so287730wms.3; 
 Tue, 26 Apr 2022 04:38:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=l7SZN+gn+w67vIMUfY98UKAbA7uOnpDqNzGrHL+gC5c=;
 b=eoStLUnb7CeMxd9hbZy/U6QAaT5n5EugAremR3+IdPRp5H5amqgs/NWJ65/XbyxCiV
 tA/Ghtpc2H3RiqPHoA155YmW+UXiIZtbvlw1Qn7HAk7cBCEY85vBckZprdXODtn72NX4
 yFLxdwDX1l8JJnRUAroTga4EF3mIaMWj8lgpS9FEPmd6KtD+dFgOQ2khtMwoZ64h3mXr
 ponXh4dwjbuGcQah0m5tJJK++QdejeORxZin/gto1x9Wsk0WTEOyaXZsO26r9WCErmcC
 xy93F4s3SEn4/EJNvs//LAEHVpxT2SgHLGIv2xMV6+P5Cq+OsZfeDfHJbHkJtZ/rU+dF
 zGmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=l7SZN+gn+w67vIMUfY98UKAbA7uOnpDqNzGrHL+gC5c=;
 b=yZIo/Ar1lqs4s1PHEFA9/ColRFvWRPq5FHaSkc8fix1Pr5HemgQAG4Br4vzY86QFFS
 rSalqx4GrrwlTMvrBQWRGt/ig9cNv8PCl/FPPOi89xwpdRYoiK0f9xxOc4ujGWXV6neE
 77BqcYibNwuM4STaiIybdRkKgVea6T/6i2YXAZ8FkQvMb03wJLucIQkRYHyI00W5sMlC
 jSOMO0+u+aCDfRyUlVUN3Ta2NFyL7O9pxOwUMtB2V5rzetPZSjNWt0a7f/VdmorQUA+k
 5R4kZGZHE8F6FQzvsSuuaguSgJKM7yMnZc+S75w8VANZzS4JWGdcn374sbFujENwJ7/0
 rQEw==
X-Gm-Message-State: AOAM532+jl90KJsrqQqVs2ZIXcMQ9i0sPsFguvF3AvFnjNfgbQScXOBF
 Fxkjxcbw/q+LGJ4IHSVI9XE=
X-Google-Smtp-Source: ABdhPJzlJ/ygsvmUV/0F3Ng+ZTbfSop588wEeRpKx1ZJ5wlB2aCBxL7+8NSqY0vDH3NutnV/DdmyJA==
X-Received: by 2002:a1c:5401:0:b0:38e:bf1c:d25c with SMTP id
 i1-20020a1c5401000000b0038ebf1cd25cmr20730810wmb.119.1650973101751; 
 Tue, 26 Apr 2022 04:38:21 -0700 (PDT)
Received: from [192.168.0.43] (static-35-180-85-188.ipcom.comunitel.net.
 [188.85.180.35]) by smtp.gmail.com with ESMTPSA id
 e17-20020adfa451000000b0020ada1a7c82sm5508369wra.11.2022.04.26.04.38.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Apr 2022 04:38:21 -0700 (PDT)
Message-ID: <1e951bad-1f26-6de2-43be-b1b5dc384794@gmail.com>
Date: Tue, 26 Apr 2022 13:38:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] cpufreq: mediatek: Fix NULL pointer dereference in
 mediatek-cpufreq
Content-Language: en-US
To: Wan Jiabing <wanjiabing@vivo.com>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Rex-BC Chen <rex-bc.chen@mediatek.com>, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20220426111715.627609-1-wanjiabing@vivo.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220426111715.627609-1-wanjiabing@vivo.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220426_043824_826103_C3768F22 
X-CRM114-Status: GOOD (  16.14  )
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



On 26/04/2022 13:17, Wan Jiabing wrote:
> Fix following coccicheck error:
> drivers/cpufreq/mediatek-cpufreq.c:464:16-23: ERROR: info is NULL but dereferenced.
> 
> Use pr_err instead of dev_err to avoid dereferring a NULL pointer.
> 
> Fixes: f52b16ba9fe4 ("cpufreq: mediatek: Use device print to show logs")
> Signed-off-by: Wan Jiabing <wanjiabing@vivo.com>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>   drivers/cpufreq/mediatek-cpufreq.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/cpufreq/mediatek-cpufreq.c b/drivers/cpufreq/mediatek-cpufreq.c
> index bcabb3726a5b..901042e9a240 100644
> --- a/drivers/cpufreq/mediatek-cpufreq.c
> +++ b/drivers/cpufreq/mediatek-cpufreq.c
> @@ -461,8 +461,8 @@ static int mtk_cpufreq_init(struct cpufreq_policy *policy)
>   
>   	info = mtk_cpu_dvfs_info_lookup(policy->cpu);
>   	if (!info) {
> -		dev_err(info->cpu_dev,
> -			"dvfs info for cpu%d is not initialized.\n", policy->cpu);
> +		pr_err("dvfs info for cpu%d is not initialized.\n",
> +			policy->cpu);
>   		return -EINVAL;
>   	}
>   

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
