Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2CDEC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 May 2022 07:28:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LxgndIPO4xz2xWLcXykQwyU3SRCYpOwsmv2lhAGWyx8=; b=qOO52d11VlS7ZP
	cMwTfWsE42AW9Mvqiamu2PT5mS9TqNE6mxURyHjgfyp2yBj0uydq0xE85bKtlHcLH5ONdXF5g5md3
	/9C3ZC8GNnV9PIEdw8QqV1YgBaeRV8IHpcaGsli4buV3vKbU2BObowbuA3XRuz/9zEeF9I+ASXM1v
	cuOgM9DCayQyzMjlwxzV8xITvqCLbExeoWJmrNSwIqxNRytAmbFZsjUlUlS7pxh1Yb761atSUDVLH
	E2qVu7RSOxWPYU6MP/FjtnGVe8dU9cNEx22RRxXZq7N8M8AkPxTEebgnTVHXZFsyRifAwVbf7Muhc
	aO1ri25TLjciRjUU7mFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmVuZ-00EP5w-F7; Thu, 05 May 2022 07:28:31 +0000
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmVuW-00EP3o-29
 for linux-mediatek@lists.infradead.org; Thu, 05 May 2022 07:28:29 +0000
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-2f7c57ee6feso39488707b3.2
 for <linux-mediatek@lists.infradead.org>; Thu, 05 May 2022 00:28:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=48+VPlemZJQL+qvD7CaffUbdWdX7cgwHukCbmFSwzDA=;
 b=DlDNwa0ZgSuGFaPb9/5V4xdJuzdc1qvt84MDes0CBs0+t3E5jO2bQtLFtvOgOGVpY/
 K3EDNQt/lzJdGsDI2h1TldQhtUIJQXkflCiTjhHmgu7gIFp7yHW3fsp2Hy8uIf+2HBRV
 hoWXI70o7DYT+XVPsNsYYbmiaqG27BxNGD54j5VBu8oR9Bf5oY8ITksM2oLOiBgsP7JK
 4PnpFjptob373B7FmzkOO64UL0fF4fWokILUdrWeQb/9YKAQGLi36glJ1Tcqkox4VwDO
 kH48CKYKvfxteTh4CzEZxOUG6UN3tO4j0xfpWcogcQz0PXcxEY2jA5/ZuqOrYtquWhF0
 bobA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=48+VPlemZJQL+qvD7CaffUbdWdX7cgwHukCbmFSwzDA=;
 b=20/hyvOs8BycPCMu7YSwBkbnYDzcD8074GHgi+78+ZEcb0JX7VUz44H4tBkfnu/G4d
 ixHTNQ10dHPanMR6QY7YhfXxmWiqbXNKVSBWGEyS47UMbp26jeAEOm8Y7WowF0z9EzUM
 oyuQ6TfHSnRUg0kbPMpnA8wzxCHjYylBNdzw67qt7qna4+l7rHOOsuCE6J8kLn6Nt+It
 mRMfJg0kpj14xnVQl0gj/c4dvGNK7UMQujgeQliIuPIBiMDzPwYYl6srW1UgTjuxJhoN
 MFYQuFAs90fjJy8dLPWdxz9tE2kp8F3dXok6UbGbGDRg5LoxNAmjy2Zrzo69I4J5CPwH
 AvRQ==
X-Gm-Message-State: AOAM530kEBp2NBnP2014UYX0aJjYM2f6VzQHNpHmdRhUu5lEEPzny51j
 K4F7aGxJQgaSjbKwIv9ihIin5+spGsvwN4kxFFV0KQ==
X-Google-Smtp-Source: ABdhPJySMA4IYtf0tSy4AlHAEslsKT1Sgz5FwyhMbz396ZGiZIF5CHRLdSW+QVBf1xsup+mUhFKCXMJ8YCqPwplVMDA=
X-Received: by 2002:a81:6189:0:b0:2eb:deb5:9f63 with SMTP id
 v131-20020a816189000000b002ebdeb59f63mr21387188ywb.319.1651735705105; Thu, 05
 May 2022 00:28:25 -0700 (PDT)
MIME-Version: 1.0
References: <39e39a7d30c8ee6af81fb64670a330abeb87402e.1651652493.git.viresh.kumar@linaro.org>
In-Reply-To: <39e39a7d30c8ee6af81fb64670a330abeb87402e.1651652493.git.viresh.kumar@linaro.org>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Thu, 5 May 2022 09:28:13 +0200
Message-ID: <CAKfTPtDbsd+RLwY+0ZfnNWkQD+jOHmoX2K+ZfsOMnEH81ouVjw@mail.gmail.com>
Subject: Re: [PATCH] cpufreq: Avoid unnecessary frequency updates due to
 mismatch
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Rafael Wysocki <rjw@rjwysocki.net>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-pm@vger.kernel.org, 
 Rex-BC Chen <rex-bc.chen@mediatek.com>, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220505_002828_224718_35C0E2CC 
X-CRM114-Status: GOOD (  23.57  )
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

On Wed, 4 May 2022 at 10:21, Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> For some platforms, the frequency returned by hardware may be slightly
> different from what is provided in the frequency table. For example,

Do you have more details ?

Do you mean that between 2 consecutives reads you can get either
500Mhz or 499Mhz ?

Or is it a fixed mismatch between the table and the freq returned by HW ?

> hardware may return 499 MHz instead of 500 MHz. In such cases it is
> better to avoid getting into unnecessary frequency updates, as we may
> end up switching policy->cur between the two and sending unnecessary
> pre/post update notifications, etc.
>
> This patch has chosen allows the hardware frequency and table frequency
> to deviate by 1 MHz for now, we may want to increase it a bit later on
> if someone still complains.
>
> Reported-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> ---
>  drivers/cpufreq/cpufreq.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
> index 0d58b0f8f3af..233e8af48848 100644
> --- a/drivers/cpufreq/cpufreq.c
> +++ b/drivers/cpufreq/cpufreq.c
> @@ -28,6 +28,7 @@
>  #include <linux/suspend.h>
>  #include <linux/syscore_ops.h>
>  #include <linux/tick.h>
> +#include <linux/units.h>
>  #include <trace/events/power.h>
>
>  static LIST_HEAD(cpufreq_policy_list);
> @@ -1708,6 +1709,16 @@ static unsigned int cpufreq_verify_current_freq(struct cpufreq_policy *policy, b
>                 return new_freq;
>
>         if (policy->cur != new_freq) {
> +               /*
> +                * For some platforms, the frequency returned by hardware may be
> +                * slightly different from what is provided in the frequency
> +                * table, for example hardware may return 499 MHz instead of 500
> +                * MHz. In such cases it is better to avoid getting into
> +                * unnecessary frequency updates.
> +                */
> +               if (abs(policy->cur - new_freq) < HZ_PER_MHZ)
> +                       return policy->cur;
> +
>                 cpufreq_out_of_sync(policy, new_freq);
>                 if (update)
>                         schedule_work(&policy->update);
> --
> 2.31.1.272.g89b43f80a514
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
