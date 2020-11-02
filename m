Return-Path: <SRS0=vtlS=EI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8658FC00A89
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Nov 2020 04:47:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0053B222B9
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Nov 2020 04:47:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="wyBjUW9p";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eJFCRZDh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0053B222B9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=uF6hOwLUI6huRKeFPr1VvMHtZS71hlJljwC1ccFDu4U=; b=wyBjUW9pu3pnVX3MW1BJU7fKn
	cSSfDEYZ41ERuN4vO9BX2SY7MKNE8rDFZdFBqLJDdhybFIsOOcT5/BYast5r9iwlRK/j1Hh6fBYGF
	Lyf91ZL+PLVYo9GC/mJHDk9mMbludRr51r1ocCh7pxm8fcEZ1dlqNn/0xpBzFRlAJT2crBItGDtZE
	+XAuy64GnRAqsvUUpg4D9k+rI9cQPQPEXsVJacLor1ximjLWbbRtdxGq7lM4EAO1JHgUBSIwFN2i3
	/VJtSwoZ4AvB4Ee6HKYMaVh1Qg/fIm7STDEuT6FvT1oNeJIp90VsdXfvl1dQZh+1pVNmM0VAKaA3L
	33uMISsMg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZRjv-0004PM-SD; Mon, 02 Nov 2020 04:46:43 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZRjt-0004Oc-Hk
 for linux-mediatek@lists.infradead.org; Mon, 02 Nov 2020 04:46:42 +0000
Received: by mail-pf1-x443.google.com with SMTP id 13so10014749pfy.4
 for <linux-mediatek@lists.infradead.org>; Sun, 01 Nov 2020 20:46:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=AQ3iOk8BoCoi2iqvb/hLP0oQvCh6DVO14yrJFe2O1m8=;
 b=eJFCRZDh+rqxFEmeiJqlTNffj8ChdNtV8mn2K3wgSiJ8wB1OgUKZMeMn4+jaFHRJ7C
 phGn87B91MscIk3ErGbRRKHJsOZJi7JUSJ+nyIvGIUjjMVCPnbxMEuv3UHYKdlAsX15Y
 1iibyJr7WiD4mqp0/rEaFZ3G+Xyk/qipW6qRGlZtkWVDY/iOqpQ6wDaPGND5POthHPrM
 Lt8Q/TTyfdQIAJccOk0BYdVF0KN31Ox9c7O/+Rw+clocGf+ZgrH450x0ySoUV2CaETa8
 217wsGhoZQoDGYkwVyGSEZjRA34FhN8jYv4QjSJgUQmN+XF65DVt7v+ryKYBhx8e+KaJ
 P/VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=AQ3iOk8BoCoi2iqvb/hLP0oQvCh6DVO14yrJFe2O1m8=;
 b=rKoyIyNyQUFGHXswBvqS3q2FE0dw89qphIiyFDIMX+arrgjGXjfaDoFTWS/dMMx8LI
 PKOty7fEvBRLphorn5CZK3bYmoLDziynA5IJNKTFOjw7W0wqJPXLdTqkNwzLkf7x6SqL
 SpFky3zdOORUuWOe5GX1Q/AlbALY6rl0/MMIf7kf5jsjjP2FICfC3f1it+9ZLLcDym6q
 0O92f0DZIrHagg8BCEo20VsYC+YRDR95zF+3DOX5IhRs/NLhCeU4JzpBSTy8pSj4zLwH
 nPy8puQrrgoS3sNzFWj/YrzBpuw1jg9iaPkNyDldfS9qY89kOIiBaNl1B5UF0aj/IM/q
 QgbA==
X-Gm-Message-State: AOAM5327ynjjFOMhsNBsaIKYgsgUX/2pw8BBxpP0CA88Zm2NA4kn+RCC
 8exi4AUP2f/nsg1m+HRTxA5ehQ==
X-Google-Smtp-Source: ABdhPJz3jcatIWWoon+TrrMLm8fQmtiU5y1+YWus4gi+3rBSHZR2HWHip7D9EadzNqdtUsKN8bQShA==
X-Received: by 2002:a62:3782:0:b029:15d:2c3e:ca14 with SMTP id
 e124-20020a6237820000b029015d2c3eca14mr20170899pfa.38.1604292399735; 
 Sun, 01 Nov 2020 20:46:39 -0800 (PST)
Received: from localhost ([122.181.54.133])
 by smtp.gmail.com with ESMTPSA id t15sm12401285pfq.201.2020.11.01.20.46.38
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 01 Nov 2020 20:46:38 -0800 (PST)
Date: Mon, 2 Nov 2020 10:16:36 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Qinglang Miao <miaoqinglang@huawei.com>
Subject: Re: [PATCH] cpufreq: mediatek: add missing
 platform_driver_unregister() on error in mtk_cpufreq_driver_init
Message-ID: <20201102044636.2hwblwjxrfll6w5h@vireshk-i7>
References: <20201031011854.137261-1-miaoqinglang@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201031011854.137261-1-miaoqinglang@huawei.com>
User-Agent: NeoMutt/20180716-391-311a52
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201101_234641_937145_16131A12 
X-CRM114-Status: GOOD (  18.76  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: linux-pm@vger.kernel.org, "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 31-10-20, 09:18, Qinglang Miao wrote:
> Add the missing platform_driver_unregister() before return from
> mtk_cpufreq_driver_init in the error handling case when failed
> to register mtk-cpufreq platform device
> 
> Signed-off-by: Qinglang Miao <miaoqinglang@huawei.com>
> ---
>  drivers/cpufreq/mediatek-cpufreq.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/cpufreq/mediatek-cpufreq.c b/drivers/cpufreq/mediatek-cpufreq.c
> index 7d1212c9b..c03c76a0c 100644
> --- a/drivers/cpufreq/mediatek-cpufreq.c
> +++ b/drivers/cpufreq/mediatek-cpufreq.c
> @@ -572,6 +572,7 @@ static int __init mtk_cpufreq_driver_init(void)
>  	pdev = platform_device_register_simple("mtk-cpufreq", -1, NULL, 0);
>  	if (IS_ERR(pdev)) {
>  		pr_err("failed to register mtk-cpufreq platform device\n");
> +		platform_driver_unregister(&mtk_cpufreq_platdrv);
>  		return PTR_ERR(pdev);
>  	}

Applied. Thanks.

-- 
viresh

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
