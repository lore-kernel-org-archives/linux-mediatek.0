Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 040ECCA0FED
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Sep 2025 16:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y9Q/SBeaavLyqr+XPkX2WQCCkix4ESkAOHpRDrEhCu8=; b=NpbroA2ZR4+V6G4Iq0Pl0gvsW5
	LLfdfMHaPUbG/b2bbsdrwAGSEDmug5KrwGAugiWMkvcCcEKKkz1RJa/iicSLsJUs76VjtMcrLXxX5
	LklNOg231AKuR8Ws49r6P2GfWHzcHGC3BrGZRsEFoVb12ZexEEsyKjq35ZcKsvxwQzdopd6XuNc3y
	1O4Su9Cr9SBb5CkNMW2n9qeWZ+VdXV95MxtqPUG/g/hkisAnoiBJqYP226//qHnqOJeabRJ8mU+PV
	/oQVY4wshAcpyGm8tLrYCgOO2xme0TfUwVhgbVFRrNiRMMRYos4T3iC7gAbwsXaF2gqxdSKRN+vmo
	GnmPblmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw1QJ-00000008b4s-2j4U;
	Tue, 09 Sep 2025 16:42:27 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvv6s-00000006Bb4-3oFv
	for linux-mediatek@lists.infradead.org;
	Tue, 09 Sep 2025 09:58:00 +0000
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-337e1ce5dd1so40883251fa.3
        for <linux-mediatek@lists.infradead.org>; Tue, 09 Sep 2025 02:57:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1757411877; x=1758016677; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y9Q/SBeaavLyqr+XPkX2WQCCkix4ESkAOHpRDrEhCu8=;
        b=l+sV6SwNvVExMOn8slSlN6mfyalWD73VK8D6sIk707+tFSJrJJKmJj97ynOir2uOdq
         8/x5aRfbbaWqG/JtI6XLLDEKmNkbY5s8k8qj5hbUQ5VVdzo34yiPYz73/f8ATFaCoKmz
         QBu3PNdDcKXRZCRaR+Pi8dtAv30NQrf8EPhB0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757411877; x=1758016677;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y9Q/SBeaavLyqr+XPkX2WQCCkix4ESkAOHpRDrEhCu8=;
        b=FnTs3Q21WEhowK0VSKao/EsS6QIdpQGj3kgNeUEQLzuNIY//S1lHn5ymM3wj2DdY6O
         sfZcq9T+rNKGokmhXfKBuoqX10z875D4k44L1ZuFW5eWxfPpphIjWBPpmhNgGsk/7H6M
         ylQ8E5f/r3NxkvVpgA3nA77A2Lg8Es1DDIirOlv5/IlZ/oXhPa/QWJ/oww1SsCV2VOZE
         4gyMQtdqOTwTm6yhF2rp+z/aCXxoVQkQ+NL3XJ9KnXvGfAMn3KTKgtydV09HjzrPe6lK
         rhAoktz0b0ijHaUC8dylNl8/nAsi7ozYfVn4n6gJl4lxanvUEepdmw/bO+Spq/Tfxyxz
         UWkA==
X-Forwarded-Encrypted: i=1; AJvYcCXwk8jzv+/6PidPGbhIxgH7wv4n8bzYh5zUcGCRHBQzMMXiQuOHi0RJExsVyMN1qYYSQE2Rjr/LMn9cGn6ZxA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4SZHLXNx2bPzdv839fFpXIw4Gv3tdlsmJWvB8P3VYmozqCo3C
	b6gYZL3746Xr6IftdwmjzIL6o2nTgGP8VBECHf+NpNWbNhHbh8wfSXY5UghBQBCNbEABOosqpwa
	OOZ8web+YF3KM2VfVkiIWZECXZKnNGtVvtAtPJMcj
X-Gm-Gg: ASbGncs82k798czSwSDoprm/zq6Jwgf2c3hc/DKpK3MIFO6yiZBRMyh+eDG5cJVclGd
	lybvINKyXhA2anWF+wS0jjQsP5m+1m3jxnECYlXwKjvP64WyL5Qh89+x943niBFQvKYkbt0+cFH
	3wrr93DaPzUvYE7I+fANVjgyCruonVkAVGZ7YdIxrLOWp0YiE6N0tiJkMYa0u7msqAgJJRtSLGI
	Jgf0ewWZQUsQPIKjMaG/8wLKuX3wVv3vujsEu8svLobSRtT
X-Google-Smtp-Source: AGHT+IHtBPyRAgJpbhrMNhQvYhuKCwVHTEcLjpAEXVvG2Qe+VaW+WbYg4882F6R1NtG5see0MuJ+hLu/7q6vsaofizo=
X-Received: by 2002:a05:651c:50f:b0:336:e05c:e3d4 with SMTP id
 38308e7fff4ca-33b5e8f6aedmr36499581fa.23.1757411877143; Tue, 09 Sep 2025
 02:57:57 -0700 (PDT)
MIME-Version: 1.0
References: <20250909073819.25295-1-johan@kernel.org>
In-Reply-To: <20250909073819.25295-1-johan@kernel.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 9 Sep 2025 17:57:45 +0800
X-Gm-Features: Ac12FXySeIcZbJr55CfFDecjeH7ZG6WTjgfFt9EkkcubagtMiSJ1iQX0YbRtXW8
Message-ID: <CAGXv+5EcnLJHG_50mYb2YB0_q1XOztF84c9tAJJfKZxSCWuUCQ@mail.gmail.com>
Subject: Re: [PATCH] cpufreq: mediatek: fix device leak on probe failure
To: Johan Hovold <johan@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-pm@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Jia-Wei Chang <jia-wei.chang@mediatek.com>, Rex-BC Chen <rex-bc.chen@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_025758_991857_97BF57D8 
X-CRM114-Status: GOOD (  17.20  )
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

On Tue, Sep 9, 2025 at 5:40=E2=80=AFPM Johan Hovold <johan@kernel.org> wrot=
e:
>
> Make sure to drop the reference to the cci device taken by
> of_find_device_by_node() on probe failure (e.g. probe deferral).
>
> Fixes: 0daa47325bae ("cpufreq: mediatek: Link CCI device to CPU")
> Cc: Jia-Wei Chang <jia-wei.chang@mediatek.com>
> Cc: Rex-BC Chen <rex-bc.chen@mediatek.com>
> Signed-off-by: Johan Hovold <johan@kernel.org>
> ---
>  drivers/cpufreq/mediatek-cpufreq.c | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/cpufreq/mediatek-cpufreq.c b/drivers/cpufreq/mediate=
k-cpufreq.c
> index f3f02c4b6888..21537a05785d 100644
> --- a/drivers/cpufreq/mediatek-cpufreq.c
> +++ b/drivers/cpufreq/mediatek-cpufreq.c
> @@ -404,9 +404,11 @@ static int mtk_cpu_dvfs_info_init(struct mtk_cpu_dvf=
s_info *info, int cpu)
>         }
>
>         info->cpu_clk =3D clk_get(cpu_dev, "cpu");
> -       if (IS_ERR(info->cpu_clk))
> -               return dev_err_probe(cpu_dev, PTR_ERR(info->cpu_clk),
> -                                    "cpu%d: failed to get cpu clk\n", cp=
u);
> +       if (IS_ERR(info->cpu_clk)) {
> +               ret =3D PTR_ERR(info->cpu_clk);
> +               dev_err_probe(cpu_dev, ret, "cpu%d: failed to get cpu clk=
\n", cpu);
> +               goto out_put_cci_dev;
> +       }
>
>         info->inter_clk =3D clk_get(cpu_dev, "intermediate");
>         if (IS_ERR(info->inter_clk)) {
> @@ -552,6 +554,10 @@ static int mtk_cpu_dvfs_info_init(struct mtk_cpu_dvf=
s_info *info, int cpu)
>  out_free_mux_clock:
>         clk_put(info->cpu_clk);
>
> +out_put_cci_dev:
> +       if (info->soc_data->ccifreq_supported)
> +               put_device(info->cci_dev);

put_device() has a check for NULL, so the if isn't really needed.

Either way,

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

> +
>         return ret;
>  }
>
> @@ -569,6 +575,8 @@ static void mtk_cpu_dvfs_info_release(struct mtk_cpu_=
dvfs_info *info)
>         clk_put(info->inter_clk);
>         dev_pm_opp_of_cpumask_remove_table(&info->cpus);
>         dev_pm_opp_unregister_notifier(info->cpu_dev, &info->opp_nb);
> +       if (info->soc_data->ccifreq_supported)
> +               put_device(info->cci_dev);
>  }
>
>  static int mtk_cpufreq_init(struct cpufreq_policy *policy)
> --
> 2.49.1
>
>

