Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9A65C001DB
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Aug 2023 05:20:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ldE8qOBwh1y7PWVjhUoFCaGJK1VblQjo0GJwUi6utEY=; b=eUZzka7OUmUd2S3RDyLKoLWzu6
	BhiIvfWGnviWIjHaFnbTL8szZ8wpzcxJ2MVdsXHiIvMwY68J9Jor6RGVVEeWONvDMMVQJnN577Uft
	BlqGIJPUZ9GA+JV48Rcq2kiptsqc4dLjMvBlvJNwlnn3xZLnMKD3lC8fLC1mp3o3sWamf6z2wpoj8
	O33LFTw2TUNSa9I2tTZ5TgtsBH+apIV39044X9GcpqVMfImPD/76l3CAIGK9v1DDKBrax4fQwXpR+
	i58QZY6gRI4JezgBHLqmmU+ASRENhbIdWhUbyiA3zAbaSA4OfrT/iIBcvQ33W7r0Yit+odklPsfTu
	uiquHYVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qVQ0E-00GBc2-2K;
	Mon, 14 Aug 2023 05:20:30 +0000
Received: from mail-vs1-xe2a.google.com ([2607:f8b0:4864:20::e2a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qVQ0B-00GBbI-0L
	for linux-mediatek@lists.infradead.org;
	Mon, 14 Aug 2023 05:20:28 +0000
Received: by mail-vs1-xe2a.google.com with SMTP id ada2fe7eead31-447abb2f228so1424306137.0
        for <linux-mediatek@lists.infradead.org>; Sun, 13 Aug 2023 22:20:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1691990425; x=1692595225;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ldE8qOBwh1y7PWVjhUoFCaGJK1VblQjo0GJwUi6utEY=;
        b=Zbtk6rkBw8HM6+xKzgvCmJLkqWs+ewglI5SUHNv17MdQhmreyFIw7dHqD2kGNX7yr7
         z9CInA4M3PZ6HSN71ANoj9zNdZnufXAS1ZqHdqjN94dSeKWq7PN36/3646znxNolzXKl
         cG8590x91xXbknAoO+U+YJatb85wyn92GqGxs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691990425; x=1692595225;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ldE8qOBwh1y7PWVjhUoFCaGJK1VblQjo0GJwUi6utEY=;
        b=izqNj7t1EhdDsd1xfTXatKrR9lgESsC2tNjG2MXhva18GuaFZ+/GpC9T4En78zahtO
         aGQZmPulFgTfnO18f91zEkJUIEwwjE4JTldbk5/OBbhvyYIn/ACbVmDZ9Nw0es4zq4Zy
         HDlQqWq5YfzjEZ08eW+F/QxSNVmLHqF3ZHRwDSRTUrz6UQdqeA2ikAjXKbsZqvwOHBvO
         3kJjyNXwaeHGSe7trE5/HDLECakVo9URrqF0UpTPqQI252oFpumDIwjjIY42bnPFE8at
         /OcPKluqWzXHMMXOXyIUdJB98eXgeYOoS0vSneta+loz7IijVhbsU47l+HxbOjsrc8ue
         GH4Q==
X-Gm-Message-State: AOJu0YyQC+tp0/p82h0eLc6qDeHkLCzdhiZdFTv2F8p0q+lKzE5meOY7
	7q/ajq0T8JFnGpq6B6JoWIs7P1zcNe+bTZUA7Fnm/Q==
X-Google-Smtp-Source: AGHT+IH/yH76PlnuVqLFpXQ7PucJ3pxTFjkPU6MLyXBUxtaUIJbcdk1Yo71+F/jREDnYnK7jfoaaiGen2gwtpA9rPdo=
X-Received: by 2002:a67:eb57:0:b0:443:8eab:c664 with SMTP id
 x23-20020a67eb57000000b004438eabc664mr8438403vso.13.1691990424769; Sun, 13
 Aug 2023 22:20:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230813190845.49738-1-alex@shruggie.ro>
In-Reply-To: <20230813190845.49738-1-alex@shruggie.ro>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 14 Aug 2023 13:20:13 +0800
Message-ID: <CAGXv+5F8HZOawAKoDvVCx7+mGmEPsELzp-r-6c5tw64c87Aa_A@mail.gmail.com>
Subject: Re: [PATCH] thermal/drivers/mediatek: remove redundant dev_warn in probe
To: Alexandru Ardelean <alex@shruggie.ro>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	rafael@kernel.org, daniel.lezcano@linaro.org, amitk@kernel.org, 
	rui.zhang@intel.com, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, aouledameur@baylibre.com, 
	daniel@makrotopia.org, void0red@hust.edu.cn, aboutphysycs@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230813_222027_186724_18B2A8D4 
X-CRM114-Status: GOOD (  22.56  )
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

On Mon, Aug 14, 2023 at 3:09=E2=80=AFAM Alexandru Ardelean <alex@shruggie.r=
o> wrote:
>
> There's no need to print any extra messages in the driver if
> devm_thermal_add_hwmon_sysfs() fails.
> If this function has any failures, they will already be printed.
>
> While looking inside 'drivers/thermal/mediatek/auxadc_thermal.c', the
> failure will be either be one of:
>   'Failed to allocate device resource data'
> or
>   'Failed to add hwmon sysfs attributes'
>
> Also, the failure will be reported on the 'dev' object passed to
> 'devm_thermal_add_hwmon_sysfs()', so it should be clear which device this
> error belongs to.
>
> Signed-off-by: Alexandru Ardelean <alex@shruggie.ro>
> ---
>  drivers/thermal/mediatek/auxadc_thermal.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
>
> diff --git a/drivers/thermal/mediatek/auxadc_thermal.c b/drivers/thermal/=
mediatek/auxadc_thermal.c
> index f59d36de20a0..55f7fde470e5 100644
> --- a/drivers/thermal/mediatek/auxadc_thermal.c
> +++ b/drivers/thermal/mediatek/auxadc_thermal.c
> @@ -1290,11 +1290,7 @@ static int mtk_thermal_probe(struct platform_devic=
e *pdev)
>         if (IS_ERR(tzdev))
>                 return PTR_ERR(tzdev);
>
> -       ret =3D devm_thermal_add_hwmon_sysfs(&pdev->dev, tzdev);
> -       if (ret)
> -               dev_warn(&pdev->dev, "error in thermal_add_hwmon_sysfs");
> -
> -       return 0;
> +       return devm_thermal_add_hwmon_sysfs(&pdev->dev, tzdev);

You changed the logic here. The original logic is to print a warning
if the hwmon sysfs stuff failed, but continue to probe the driver. In
other words, hwmon sysfs failing is a non-fatal error.

Your changes make it fatal.

ChenYu

>  }
>
>  static struct platform_driver mtk_thermal_driver =3D {
> --
> 2.41.0
>
>

