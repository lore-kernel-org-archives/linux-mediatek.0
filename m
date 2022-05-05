Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AA12C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 May 2022 08:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vAb+e6wHU6lKW4xTTC3837yh/xsF4z3tGHaK/Nrmp/0=; b=r3S7uzy9cD89Mk
	XuXr/WwKkl7oUTOg/2jUZCAObgJ1wCCcesKvflS+kgaEmy8ByzWZ/aAc5qUQTf4W2LOC5DSPGgzBr
	WhUazaYp4KBEEpiLpUlcYq9W9uc2fpHQI47lRGK7iKX85MwhPmHCU3U8hbKatZuHKyh502xcc97JV
	5FxJwyRxuhR5Uv5YSv4ZxV6Q7hJFlykAwRk8VVDtdBuPHnJbffCYa3mTJ1yxl8lc/8NAWN3WMVkdk
	2wlnV0SkukvzF957aSC0QikmNEs7mjkWlYpRIfZh0gGiLFbsOvWW+dkU6G4H0xWQEUxtwFFncA7z4
	lXbyYx5jnmG5nO1rh6wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmWjo-00EePw-0Y; Thu, 05 May 2022 08:21:28 +0000
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmWjc-00EeMP-Ps
 for linux-mediatek@lists.infradead.org; Thu, 05 May 2022 08:21:18 +0000
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-2f7c424c66cso40617267b3.1
 for <linux-mediatek@lists.infradead.org>; Thu, 05 May 2022 01:21:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KWHwsHAH/QNPAWhLW8VZQ58/vBlErs9/usiIXf3KUrM=;
 b=gfOnepr9p4T6e4DX9fXIsS/lXlfXLPOIMboG7QC7AhvSQqXD9OUAMPpF0z3/waGD0D
 XeQghg5wasvlfwxOCcj1rq9vEqnZIz3MmdkM/lmUPiNgpIs29AEmze8LbdMbZjG6Ppl6
 990cMEYj3x/t49XSKjftcWTDQn/E5JEpgrRT0u9kzb0//RgKeNF0xOmu9sYKwX8ShEPq
 hFM/BtKmE6wilxejb0d/p4INQ2MlR3IqynuzdsiDhc+m6cs/zCnQPmRssYb1J/Dt3g5o
 BUVFbMbCW93dS5zoMWZdOjlnAr2xmD0pCgGD+c7QRrbEmXlo4/wFaHNxx58GA4nDLwsR
 xPuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KWHwsHAH/QNPAWhLW8VZQ58/vBlErs9/usiIXf3KUrM=;
 b=bPrOZ5Fce0Gg88A3ImJ+Pkq4L9Vh5kAHtHbVKte/e2gx2vy+6uA5NH5wvvzk77RugP
 VBfCROStF6MtS4JJT1qdUEE/QkB4HSm88KB+SqKDooX+mtIwKuwnwtutQ+euChkFF9+Z
 nGz2+6ZhpV4Fj5JYEaBWvoR5KP8vQ4enVLD3QMgh88bUrak77SMOLwzR1XBlN6N6aNTJ
 NxAjtYloovvxwQwa+TJYtgJy+8QdIfI+fl9itVGBu52Q/EVBRFp6j+z3/MZqwSERwDfp
 psGhgdS3xTkqb5wixzjb6O849LwtBTyrK8RSw649LqD78OXB/d/5/xVn9VGjzMlsO06g
 uXrA==
X-Gm-Message-State: AOAM530WEbEj2tsxVhW9yq7w0pwcz0yPiKdyUGegayC9ZDvqwIQFXfTo
 j6IBRLvjJOL/5bMJ4Q6e0kcj5DWJEjDWWgB5LCrH9w==
X-Google-Smtp-Source: ABdhPJzui0KnZztjb5KstyzUpmWxsYAZfym4/bUssFwP1MMh4zPXCOqTOLPEIjR0Y/5C69tQGwJC+KpVlnbcmXo2J/Q=
X-Received: by 2002:a81:6189:0:b0:2eb:deb5:9f63 with SMTP id
 v131-20020a816189000000b002ebdeb59f63mr21498742ywb.319.1651738873208; Thu, 05
 May 2022 01:21:13 -0700 (PDT)
MIME-Version: 1.0
References: <39e39a7d30c8ee6af81fb64670a330abeb87402e.1651652493.git.viresh.kumar@linaro.org>
 <CAKfTPtDbsd+RLwY+0ZfnNWkQD+jOHmoX2K+ZfsOMnEH81ouVjw@mail.gmail.com>
 <20220505074408.ayzmd5kdbw2fagbq@vireshk-i7>
In-Reply-To: <20220505074408.ayzmd5kdbw2fagbq@vireshk-i7>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Thu, 5 May 2022 10:21:01 +0200
Message-ID: <CAKfTPtCuJGsrsBJ2jACr_YeKN3RXNVMkgRgo+cw9t7CAyGwHWQ@mail.gmail.com>
Subject: Re: [PATCH] cpufreq: Avoid unnecessary frequency updates due to
 mismatch
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Rafael Wysocki <rjw@rjwysocki.net>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-pm@vger.kernel.org, 
 Rex-BC Chen <rex-bc.chen@mediatek.com>, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220505_012116_903229_61C9DEC3 
X-CRM114-Status: GOOD (  20.09  )
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

On Thu, 5 May 2022 at 09:44, Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> On 05-05-22, 09:28, Vincent Guittot wrote:
> > On Wed, 4 May 2022 at 10:21, Viresh Kumar <viresh.kumar@linaro.org> wrote:
> > >
> > > For some platforms, the frequency returned by hardware may be slightly
> > > different from what is provided in the frequency table. For example,
> >
> > Do you have more details ?
>
> This is where the problem was discussed.
>
> https://lore.kernel.org/lkml/20220422075239.16437-8-rex-bc.chen@mediatek.com/

Thanks for the link

>
> > Do you mean that between 2 consecutives reads you can get either
> > 500Mhz or 499Mhz ?
>
> No, the hardware always returns something like 499,999,726 Hz, but the

Part of your problem is that cpufreq use khz whereas clock uses hz

Would it be better to do something like below in cpufreq_generic_get

(clk_get_rate(policy->clk) + 500) / 1000

so you round to closest instead of always floor rounding


> OPP table contains the value 500 MHz. The field policy->cur is set
> based on opp table eventually (target_index) and so contains 500MHz,
> almost always. But when cpufreq_get() is called, it finds the current
> freq is 499 MHz, instead of 500 MHz. And so the issue.
>
> > Or is it a fixed mismatch between the table and the freq returned by HW ?
>
> Yes.
>
> --
> viresh

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
