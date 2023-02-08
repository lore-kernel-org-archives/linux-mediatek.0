Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6EF8C636CC
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Feb 2023 05:05:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ya5gJFL+sholpFu2gVvhEQXkb61wVgNoGrsK8xi1Z7M=; b=mBA716zMD3fqVXSb+USyQlPoRQ
	/BWN1mI+2HieHoL07B6iKBBNP7QUl5OINs3csnwHaciqCqmn2IAB90OHJYVkWDOHeASLkCTPDmca8
	koYLprSSSrHUjDchxRiIYd2jcEHZeNara5g8T5x2sxHZsRtZe46zcpjttVmtdF7UTUyR4llw+UDLA
	1csb631Avr8DdPV/liWXufavcpL+nrjTZassuhZMjxX88MBCFf9MvMQXMOWErjkD8vhOiboFisdl1
	oaZVoEW29iqDvzP3c3iL3VF6TVQDiE7TO7YVQ2o0t+SYilepHL8xNvbyilqnINnXR9SP3i1tCUOl4
	HPFKZkTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPceK-00E43N-L7; Wed, 08 Feb 2023 05:05:40 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPce9-00E426-K9
	for linux-mediatek@lists.infradead.org; Wed, 08 Feb 2023 05:05:30 +0000
Received: by mail-pg1-x534.google.com with SMTP id u75so5312228pgc.10
        for <linux-mediatek@lists.infradead.org>; Tue, 07 Feb 2023 21:05:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ya5gJFL+sholpFu2gVvhEQXkb61wVgNoGrsK8xi1Z7M=;
        b=YjTsp9kdEz13Y1GNS0O5pGEyWSuzSogMDi4e7ZZ7iv+IZANa948+CJPU+/06uYdiuI
         Gghb9yPK7hJNXzFNQ8ZfboZrNIcDAIhcUwDk3RZYsxZsLFbj9LctlgfufzZINBRdA8Xb
         SFapInnCj+0ungZBt7qV71G0MxFzBnw4U6krmO22nfdS7qe1F9BjFw3E5IXM7Aiyb3a1
         VW0Nd6hy1INXQ8Sx3iNmy7sGVZ2LxS8Oq4s+Dudnzi6YcZIab79I78dHNFYysALOEQ/j
         1sVe9PHlgzBQz1mAJURvaLQ5wJRIrFz6NP/d/9Q+cHPwjZVTkdIhguBLPi3UtOJy/ul1
         CukQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ya5gJFL+sholpFu2gVvhEQXkb61wVgNoGrsK8xi1Z7M=;
        b=c+Y0mb7s+NFiq7b/CsuzjGGxpT1ZBtVlF155xLr/QrR90qhedooYxwh5quXYE1uQae
         m+E6jionp7k9eULKcDJCs5tipcpjgjw1ZxQb2KTQrMatpla18ukr3dfZKZ9/qkVt1rwf
         1XSxhARwojRH4vVOpK/s2RKo9u9BKhlUoP+gB4sk9hukl5ZgJJz2amlseNB0BrQJlsoB
         hc43H0eJDBPBaqB9WAXWwNOCsWxxpd8Dfv8kaQ13wnHyViYkNVavEBATqz4ENAj6nmUW
         kiw4RNvgSYBWkuZRr0OjXeZfI09mDkTXj5k/5LabCZDip0tPjNANwtW5m9PL9rRrx/D9
         ncKA==
X-Gm-Message-State: AO0yUKXf0McWnsFxRVSQNmMvqTGJ5IIbRiWM3I0SAWdfJPv6OY+b37Gl
	AMTc9uaN4+c7tGwTzrXTxNuTNQ==
X-Google-Smtp-Source: AK7set9UuA7k0BjdlRO0q39ZKPIN4H6BAK2nzgdoKHGELVuwsO4MfgZ2/oEHq4b2N3zB9KZnbyJYyQ==
X-Received: by 2002:a62:1a89:0:b0:594:26a7:cbd2 with SMTP id a131-20020a621a89000000b0059426a7cbd2mr875118pfa.8.1675832725646;
        Tue, 07 Feb 2023 21:05:25 -0800 (PST)
Received: from localhost ([122.172.83.155])
        by smtp.gmail.com with ESMTPSA id x14-20020aa793ae000000b005a6cb51f240sm2867924pff.109.2023.02.07.21.05.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 21:05:25 -0800 (PST)
Date: Wed, 8 Feb 2023 10:35:23 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Markus Mayer <mmayer@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Kevin Hilman <khilman@kernel.org>, Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-omap@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-mediatek@lists.infradead.org, kernel@pengutronix.de
Subject: Re: [PATCH] cpufreq: Make cpufreq_unregister_driver() return void
Message-ID: <20230208050523.p6437bes6cmpd33k@vireshk-i7>
References: <20230207195909.474953-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230207195909.474953-1-u.kleine-koenig@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230207_210529_688872_057A1398 
X-CRM114-Status: GOOD (  15.00  )
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

On 07-02-23, 20:59, Uwe Kleine-König wrote:
> All but a few drivers ignore the return value of
> cpufreq_unregister_driver(). Those few that don't only call it after
> cpufreq_register_driver() succeeded, in which case the call doesn't
> fail.
> 
> Make the function return no value and add a WARN_ON for the case that
> the function is called in an invalid situation (i.e. without a previous
> successful call to cpufreq_register_driver()).
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---
>  drivers/cpufreq/brcmstb-avs-cpufreq.c | 5 +----
>  drivers/cpufreq/cpufreq.c             | 8 +++-----
>  drivers/cpufreq/davinci-cpufreq.c     | 4 +++-
>  drivers/cpufreq/mediatek-cpufreq-hw.c | 4 +++-
>  drivers/cpufreq/omap-cpufreq.c        | 4 +++-
>  drivers/cpufreq/qcom-cpufreq-hw.c     | 4 +++-
>  include/linux/cpufreq.h               | 2 +-
>  7 files changed, 17 insertions(+), 14 deletions(-)

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh

