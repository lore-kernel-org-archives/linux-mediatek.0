Return-Path: <SRS0=GXkz=C6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BBFCC43465
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Sep 2020 17:08:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8C2602073A
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Sep 2020 17:08:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uIq3GxQx";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nUT8tZNW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8C2602073A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=YDr8guFfr+cVER4phDtcTMqQknVxPqekW6MSlRnSHrI=; b=uIq3GxQxh22nD/nxvnbchAkv4
	r1hMOlvE67RwTR01NmR73G9lq5JvMZRSoR99AkEEg6Gaz8z9dqDPSZPYiqsRPFzcE4Bwl0eqzdsQJ
	nG4P7jwacgXNiR1iBOEjvXLC4zNKYhpljQO6L8lr5C1qO8IbKxTJJTB+FQY+pZSqzeIjlLmB4cbGf
	k6tAvL0neLbEZtltcEgHDxTdEwapcCr8r3qc8Mnrax98TUvAbqm+0EMramdfn0Da+W7n6l8Hqy1X1
	Kr6ORZea6ZzemLeLSXhZlDbHs9Gd7YoseTMP7Qq2K+6wru0yXZYGrbwX7PP5Ftiqbpq5s9gWgIAVg
	rZ83SVLDw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kKPIB-0007CB-P7; Mon, 21 Sep 2020 17:07:55 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kKPI9-0007Bh-Lg; Mon, 21 Sep 2020 17:07:54 +0000
Received: by mail-wr1-x444.google.com with SMTP id e16so13619359wrm.2;
 Mon, 21 Sep 2020 10:07:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=vFl858TYcn55xzrXdnmQ+FomaH6JEvpw1AWdFvODVLA=;
 b=nUT8tZNW20LCjfug52XrALM6AHptZk5DSf/DVG9fbq0EVKsLRSxg0oETXGkEEbWO94
 rwqX2+6amxcZa3iHnBNo+EGT9yUIfyOKYXMvpdlVLrGQpqO2Jbb7RJOQ6iXVdvfMj1pY
 4VXQpBqvQgz0qz31FhYcNaHEeaLoIsVJHJaWy0qvac/yL5VopDv+sX6vG2RmPQbWm17Y
 f1fX++CQeEl6TG8NCt+VqMd8cpNycaoAvvbxOQS0LRxk4/6K1ThOkhDa0n6OqTdSOquk
 7PRTzlsw5awF1jW24Rcbl4Vn2Es8o5Eion8f1mVya5vDQAFclt48l8Csn2q03RXQFS/R
 qbXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vFl858TYcn55xzrXdnmQ+FomaH6JEvpw1AWdFvODVLA=;
 b=F6+jTr/EwBYmiyhgng4sGyrggpiiS1Fg+fRlVfvngXKc6eSRWfbe1V3TNjOS6Un/U7
 6wtqYZCtTCFQ3/4/50hFYTDoofR1FcBg8ABImS8YUVvhTJYYd0c8DEoea2hmpo1igsu7
 6m2jL7wS/KYf9u89oPxAUNv0vDlqe4meSt/9p9V82e8eTO5TpSs+vvAJ/Mq0hzlzfV3j
 Dlpkfc4xOPjFaMLsLfGttMD+vCxuTor7j8JMPxxwUBaSEINR0PikWRqSfwvN0tqgzOfn
 GIlE9XwJyBxDlj8Qh2ku11rQfJLjHwa7bVgybRxtrKYCTv+uyTHqzdUYnLskmNmyW4nX
 KRvw==
X-Gm-Message-State: AOAM532xruoxvr6wbqAnLI10dwtrSRYmIZ53zBgdORD17nq8fEd493j4
 kgHD5/zk+uoik7yK0PCT5J0jgNtTS/6u6Q==
X-Google-Smtp-Source: ABdhPJzczz1HhvIKMvZrQuCfXkwUWiaoGgbThUT9hwhaj19hdyCz9z7u/hB1x8rLtLX9FtfLx6Fj8A==
X-Received: by 2002:adf:e58b:: with SMTP id l11mr836947wrm.210.1600708072063; 
 Mon, 21 Sep 2020 10:07:52 -0700 (PDT)
Received: from ziggy.stardust ([213.195.113.201])
 by smtp.gmail.com with ESMTPSA id b188sm873790wmb.2.2020.09.21.10.07.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Sep 2020 10:07:51 -0700 (PDT)
Subject: Re: [PATCH] soc: mediatek: Check if power domains can be powered on
 at boot time
To: Nicolas Boichat <drinkcat@chromium.org>
References: <20200730120054.1.I5e6f8c262031d0451fe7241b744f4f3111c1ce71@changeid>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <6549429e-bd3c-5249-2fbd-cd1c45b5b2c1@gmail.com>
Date: Mon, 21 Sep 2020 19:07:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200730120054.1.I5e6f8c262031d0451fe7241b744f4f3111c1ce71@changeid>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200921_130753_735531_A944E7F6 
X-CRM114-Status: GOOD (  23.84  )
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
Cc: Sascha Hauer <s.hauer@pengutronix.de>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Nicolas,

Thanks for the patch.

On 30/07/2020 06:01, Nicolas Boichat wrote:
> In the error case, where a power domain cannot be powered on
> successfully at boot time (in mtk_register_power_domains),
> pm_genpd_init would still be called with is_off=false, and the
> system would later try to disable the power domain again, triggering
> warnings as disabled clocks are disabled again (and other potential
> issues).
> 
> Fixes: c84e358718a66f7 ("soc: Mediatek: Add SCPSYS power domain driver")
> Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
> 
> ---
> 
>   drivers/soc/mediatek/mtk-scpsys.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/soc/mediatek/mtk-scpsys.c b/drivers/soc/mediatek/mtk-scpsys.c
> index f669d3754627dad..0055a52a49733d5 100644
> --- a/drivers/soc/mediatek/mtk-scpsys.c
> +++ b/drivers/soc/mediatek/mtk-scpsys.c
> @@ -524,6 +524,7 @@ static void mtk_register_power_domains(struct platform_device *pdev,
>   	for (i = 0; i < num; i++) {
>   		struct scp_domain *scpd = &scp->domains[i];
>   		struct generic_pm_domain *genpd = &scpd->genpd;
> +		bool on;
>   
>   		/*
>   		 * Initially turn on all domains to make the domains usable
> @@ -531,9 +532,9 @@ static void mtk_register_power_domains(struct platform_device *pdev,
>   		 * software.  The unused domains will be switched off during
>   		 * late_init time.
>   		 */
> -		genpd->power_on(genpd);
> +		on = genpd->power_on(genpd) >= 0;

Is this something we expect? On probing we realize that some domains can't be 
turned on?

I understand that this would be a bug in the driver. Therefore we should at most 
provide a warning instead of working around the bug, hiding it. Or do I got this 
wrong?

Regards,
Matthias

>   
> -		pm_genpd_init(genpd, NULL, false);
> +		pm_genpd_init(genpd, NULL, !on);
>   	}
>   
>   	/*
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
