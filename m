Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2153DC9830E
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Sep 2026 17:27:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nrCZY+w8ZAuOgUKyJ5bzQ3lA0kZX185uW8oYwG5RuQA=; b=b2Z07wJLO2+qGyONmvi+KpVhlf
	c078DQQD1k8jILX0kQNX8LvOC5LdUwuN9QH6sF2UHluS0t5c6qnn+s3Fg9r69PHeN+5CyS3lFkG+2
	NzA5d4f1hQJZq2SShRJuzFsFraPgv1dQ1op/0EZsDjW7ltf3GYWQI+Ah50IT6l2+wIEdr/aAeuTWI
	LJMXLkNKNqPEIDZQ4+d2hShG9bJ+u0n4Yi3gaDxySVwcnh4fMnnal914y66J2Vky9gYjTQh34I14B
	wI31U5J5StIsG+9aX6ofbc4A1NNwHiJ+NM4LG2b9jCIURON9ixW+EHXoco7eR5tuJM9lEcdDWowsh
	T3zbVYDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA9hS-0000000E3vw-3ipG;
	Fri, 25 Sep 2026 17:27:06 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA9hR-0000000E3vi-157p
	for linux-mediatek@lists.infradead.org;
	Fri, 25 Sep 2026 17:27:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id EB22C44247
	for <linux-mediatek@lists.infradead.org>; Fri, 25 Sep 2026 17:27:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B67231F00901
	for <linux-mediatek@lists.infradead.org>; Fri, 25 Sep 2026 17:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790357224;
	bh=nrCZY+w8ZAuOgUKyJ5bzQ3lA0kZX185uW8oYwG5RuQA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=UfFKqsvK75p5eO5B5LPWqx7YmtHZp5SiX1PFOsrb/Rw7u/0QFbVRoYO3MBcG/t5cL
	 f0grYRNmRlCV/gnwPAuW3LI+ccOXT0MjTt7Y8FeHXxJ869jP4sIIJdGs5M2A3YPkRs
	 ukh/P2eflHnEpauu+zEccKoAmEXT4qeEDi7o0bJS06Qz1CCYGEgXO5YqMpVQhl3no4
	 lLRGB99pVq05PP0MRgcsH4//8wpFOz+qWgGYKGx2Z78V8f5l9jdhS4QzuPEDb8kFis
	 pnJBNA0VYqlKgjIBYJuffADzzi0g5B+u1BB7AUPs4ANGSHG8KVd1IE7vW4tmTi93D2
	 bENY6AcgbMT3A==
Received: by mail-lr2-f35.google.com with SMTP id 38308e7fff4ca-3a64e7f48e0so9534881fa.0
        for <linux-mediatek@lists.infradead.org>; Fri, 25 Sep 2026 10:27:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwTVncxNdtDaqzIkDQFq+e9Li7EJaXgdzhYUg4y+/ULH8eAYdH9t5qxSENXuJv7MMMqD9XG9JsQZYEWFYZtcQ==@lists.infradead.org
X-Gm-Message-State: AFuF++nP6BzAY0PT0YCv3d3pbLOaNUK9IGN4JhpB+R1mtgzmKfuyxq82
	810U79y9CCC0OxhbSpO8gy1uJbYeR2NQeJelNQ4tZu62tXPKXYSyllKcr9gyk386Q3Wz6OD38CN
	j2BXRsA83Yeo7y7k6krjwJwj8sY1nNGw=
X-Received: by 2002:a05:651c:43dc:10b0:3a6:95a:52ab with SMTP id
 38308e7fff4ca-3a63c0e006emr12420831fa.18.1790357222990; Fri, 25 Sep 2026
 10:27:02 -0700 (PDT)
MIME-Version: 1.0
References: <20260912191156.185448-1-sumeet4linux@gmail.com> <20260912191156.185448-5-sumeet4linux@gmail.com>
In-Reply-To: <20260912191156.185448-5-sumeet4linux@gmail.com>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Fri, 25 Sep 2026 19:25:25 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0inzDfF5zNba7BHnq=-xTH1ucHvBv-bJSKXW0dTF71Q0g@mail.gmail.com>
X-Gm-Features: AclHuK-zkJzcW3eTrPbI8n4uwvaOkU97xV6DSlSAXWBceH5EJVI8blUeGSzDawM
Message-ID: <CAJZ5v0inzDfF5zNba7BHnq=-xTH1ucHvBv-bJSKXW0dTF71Q0g@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] thermal: Use %pe to print error pointers symbolically
To: Sumeet Pawnikar <sumeet4linux@gmail.com>
Cc: rafael@kernel.org, krzk@kernel.org, amit.kachhap@gmail.com, 
	daniel.lezcano@kernel.org, thara.gopinath@gmail.com, talel@amazon.com, 
	hayashi.kunihiko@socionext.com, mhiramat@kernel.org, mmayer@broadcom.com, 
	viresh.kumar@linaro.org, sumitg@nvidia.com, peter.griffin@linaro.org, 
	myungjoo.ham@samsung.com, kyungmin.park@samsung.com, cw00.choi@samsung.com, 
	Frank.Li@nxp.com, s.hauer@pengutronix.de, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, sven@kernel.org, j@jannau.net, 
	marcan@marcan.st, casey.connolly@linaro.org, sre@kernel.org, wens@kernel.org, 
	t.schramm@manjaro.org, bcm-kernel-feedback-list@broadcom.com, 
	linux-samsung-soc@vger.kernel.org, kernel@pengutronix.de, imx@lists.linux.dev, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Sat, Sep 12, 2026 at 9:13=E2=80=AFPM Sumeet Pawnikar <sumeet4linux@gmail=
.com> wrote:
>
> Replace PTR_ERR() and %ld with %pe and pass the original pointer directly
> to pr_err() and dev_err(). The %pe format specifier prints a symbolic err=
or
> name (e.g. -ENOMEM) when CONFIG_SYMBOLIC_ERRNAME is enabled, otherwise it
> falls back gracefully and prints the raw integer value. This makes messag=
es
> more readable without any functional change.
>
> Signed-off-by: Sumeet Pawnikar <sumeet4linux@gmail.com>
> ---
>  drivers/thermal/cpufreq_cooling.c        | 4 ++--
>  drivers/thermal/devfreq_cooling.c        | 4 ++--
>  drivers/thermal/qcom/qcom-spmi-adc-tm5.c | 4 ++--
>  3 files changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/thermal/cpufreq_cooling.c b/drivers/thermal/cpufreq_=
cooling.c
> index 768859a7aed0..856d619370db 100644
> --- a/drivers/thermal/cpufreq_cooling.c
> +++ b/drivers/thermal/cpufreq_cooling.c
> @@ -661,8 +661,8 @@ of_cpufreq_cooling_register(struct cpufreq_policy *po=
licy)
>
>                 cdev =3D __cpufreq_cooling_register(np, policy, em);
>                 if (IS_ERR(cdev)) {
> -                       pr_err("cpufreq_cooling: cpu%d failed to register=
 as cooling device: %ld\n",
> -                              policy->cpu, PTR_ERR(cdev));
> +                       pr_err("cpufreq_cooling: cpu%d failed to register=
 as cooling device: %pe\n",
> +                              policy->cpu, cdev);
>                         cdev =3D NULL;
>                 }
>         }
> diff --git a/drivers/thermal/devfreq_cooling.c b/drivers/thermal/devfreq_=
cooling.c
> index 0330a8112832..9ada52cbf7dd 100644
> --- a/drivers/thermal/devfreq_cooling.c
> +++ b/drivers/thermal/devfreq_cooling.c
> @@ -156,8 +156,8 @@ static unsigned long get_voltage(struct devfreq *df, =
unsigned long freq)
>                 opp =3D dev_pm_opp_find_freq_exact(dev, freq, false);
>
>         if (IS_ERR(opp)) {
> -               dev_err_ratelimited(dev, "Failed to find OPP for frequenc=
y %lu: %ld\n",
> -                                   freq, PTR_ERR(opp));
> +               dev_err_ratelimited(dev, "Failed to find OPP for frequenc=
y %lu: %pe\n",
> +                                   freq, opp);
>                 return 0;
>         }
>
> diff --git a/drivers/thermal/qcom/qcom-spmi-adc-tm5.c b/drivers/thermal/q=
com/qcom-spmi-adc-tm5.c
> index af72db6299cd..4554a6fa55d1 100644
> --- a/drivers/thermal/qcom/qcom-spmi-adc-tm5.c
> +++ b/drivers/thermal/qcom/qcom-spmi-adc-tm5.c
> @@ -680,8 +680,8 @@ static int adc_tm5_register_tzd(struct adc_tm5_chip *=
adc_tm)
>                                 continue;
>                         }
>
> -                       dev_err(adc_tm->dev, "Error registering TZ zone f=
or channel %d: %ld\n",
> -                               adc_tm->channels[i].channel, PTR_ERR(tzd)=
);
> +                       dev_err(adc_tm->dev, "Error registering TZ zone f=
or channel %d: %pe\n",
> +                               adc_tm->channels[i].channel, tzd);
>                         return PTR_ERR(tzd);
>                 }
>                 adc_tm->channels[i].tzd =3D tzd;
> --

Applied as 7.4 material, thanks!

