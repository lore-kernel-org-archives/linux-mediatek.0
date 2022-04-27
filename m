Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F304FC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Apr 2022 03:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Am3kO3cD99cfUN7ixwodmCjpYhWeKJdyOq5kUL2chOM=; b=n7PaZ+wd3dTmIK
	9hprC9hhms6nfVaDATZ3hCaKSGV/6XmbH9W2Rn/RBE7ceQkqQ2Y5CHn0z/IxnNdWQVDmohSJNXiow
	qOJjy3fN9+2Aghjf4lAI7JWkcgEetrItI0w8rydkeVqzxZSIoC4RQDufO5uLU5J52NWlqZ4VtoAe9
	LfiRI8cJs/7dmkbbLjgEP1ZlJ/tmZHpHR7Hr0CmUeilI5zku4ILJPspsACHAWp5IVKNyXcU9ZjdRC
	46SxKH6sJdf8lMt/fZwSt44NvG9kKwuUS+Nb/1jSoMv1csCVuiVs1cbyspelvmoCa8p02sKQFcRvO
	pJ5txdciylcCZih8+T4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njYC7-00HB2D-Kd; Wed, 27 Apr 2022 03:18:23 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njYBp-00HAwa-AG
 for linux-mediatek@lists.infradead.org; Wed, 27 Apr 2022 03:18:06 +0000
Received: by mail-pl1-x636.google.com with SMTP id h12so445514plf.12
 for <linux-mediatek@lists.infradead.org>; Tue, 26 Apr 2022 20:18:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=XTLOas78RQ0/UyRSC2YDKTpbOeiAeOZCtumqdgYp4Z4=;
 b=mqSgWBPiZA5AOZKT6FykeD6jPdOPAmSH9NV6sFOFz8a3i0AnRvCiTCjNYuwdZ+tCCv
 gdE8VRhUJ1oNfG49hKS+xFeQCJFqTPR+nGg32RdalHPbCtc04r2U6JmyfhYwR+z8ou5m
 4SnX8J6xEUt2YGkfpLEX0TGC8aaSGfCSFpEE0+KmW8uI4Bb/QPUCzL+gWClk2JGHjQpz
 cVZQCTFmoR3RKcmVKCSvRTV3H8WEBItqH9wYErn1W2xSRGex0COZsSCofAonYxX3KTtI
 U0yxOkGL5qvKzKZ3GoAcCZ8ny3+D0vAJ2+PiStmirta8ou5U2iW+YVvBU17MqF2twsC9
 BBVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=XTLOas78RQ0/UyRSC2YDKTpbOeiAeOZCtumqdgYp4Z4=;
 b=CYol2Ua2pzeWAtaicnJVrjuENcfuNP4QU9OKWyztPLhh/d/NFcZ05hHrQ+KMkeMGsK
 dHuCJSZkNaxgzsEjJMqFcvba1D07OOdb00zS2FuHFzK2nJPq8tAL4wPHY5TOsd6hSUCf
 TMuAq964cvYiJhBY6KRBlMtmDgFtRXCo642GP4I5tmVAcMyBaq2nyIbeu+aoMKpt7ZOo
 /ZDsz38tbgBIOvEZ3f8ZamF/7srnWlZ5YO782kyaTX3UQEUJNUhfuOhPtA3Caj/8nJ4d
 n5ImKVjplRhC3adjatFW3Gq3r/GYSqhCYTX2Y7ZW7pM6SjGiXUDrwILDczf9ZIMROxpO
 JExA==
X-Gm-Message-State: AOAM533Seu2PEDfh7QwOclNjwZMSXtcqLg44NdvVz30QhASXnecZCeNm
 e7PblbB04bU7gT9zqg1edE8IFg==
X-Google-Smtp-Source: ABdhPJwUEsxKcRCpJmBZnAvMHtBIhDnOJS4DjfdCieo7LC2EPJV6RP0uzxjZi6XmsQoPF1XA84D7ag==
X-Received: by 2002:a17:90b:17c6:b0:1d2:8450:49b3 with SMTP id
 me6-20020a17090b17c600b001d2845049b3mr41331569pjb.246.1651029483817; 
 Tue, 26 Apr 2022 20:18:03 -0700 (PDT)
Received: from localhost ([122.177.141.190]) by smtp.gmail.com with ESMTPSA id
 e17-20020a637451000000b003c144b70a7csm609775pgn.77.2022.04.26.20.18.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 20:18:03 -0700 (PDT)
Date: Wed, 27 Apr 2022 08:48:01 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Wan Jiabing <wanjiabing@vivo.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Rex-BC Chen <rex-bc.chen@mediatek.com>, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] cpufreq: mediatek: Fix NULL pointer dereference in
 mediatek-cpufreq
Message-ID: <20220427031801.tlph5uyougr55yri@vireshk-i7>
References: <20220426111715.627609-1-wanjiabing@vivo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220426111715.627609-1-wanjiabing@vivo.com>
User-Agent: NeoMutt/20180716-391-311a52
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220426_201805_381547_EC803E9C 
X-CRM114-Status: GOOD (  16.26  )
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

On 26-04-22, 19:17, Wan Jiabing wrote:
> Fix following coccicheck error:
> drivers/cpufreq/mediatek-cpufreq.c:464:16-23: ERROR: info is NULL but dereferenced.
> 
> Use pr_err instead of dev_err to avoid dereferring a NULL pointer.
> 
> Fixes: f52b16ba9fe4 ("cpufreq: mediatek: Use device print to show logs")
> Signed-off-by: Wan Jiabing <wanjiabing@vivo.com>
> ---
>  drivers/cpufreq/mediatek-cpufreq.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/cpufreq/mediatek-cpufreq.c b/drivers/cpufreq/mediatek-cpufreq.c
> index bcabb3726a5b..901042e9a240 100644
> --- a/drivers/cpufreq/mediatek-cpufreq.c
> +++ b/drivers/cpufreq/mediatek-cpufreq.c
> @@ -461,8 +461,8 @@ static int mtk_cpufreq_init(struct cpufreq_policy *policy)
>  
>  	info = mtk_cpu_dvfs_info_lookup(policy->cpu);
>  	if (!info) {
> -		dev_err(info->cpu_dev,
> -			"dvfs info for cpu%d is not initialized.\n", policy->cpu);
> +		pr_err("dvfs info for cpu%d is not initialized.\n",
> +			policy->cpu);
>  		return -EINVAL;
>  	}

Applied. Thanks.

-- 
viresh

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
