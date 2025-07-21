Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A847DC83F25
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Jul 2025 12:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZvD8IUqr+Bzg9GKWiYPMFuwvqaPjoCioCLoAukeES3o=; b=O7fqr39QhW3JnTIrHKbBFDjLVs
	2qJXdgl8eS0xPQxJ+VP1JBqHLdUq//TVoWHNdVWKKsh+Ga3Pq+I4azE5jxdVfmvutq3mOswA+ORJB
	BjyeYpm0pZiIBJhWHCGs7gKFir2QkTx8PXr2eAAeOUIyom9ddrHbgJ73JXTrUDtJcaSrJTwxtqwbW
	dGFWZMW00gq+5RpRbshgkF/461Nm+QqZi/TfZycfmw4lSuZsMoQjfdDLocu5vgZQdxF5JoCGd0gjJ
	24CYBBXa9EkxVXptlZU+SycYCiNbDGQ455/TiQnNH6hEhbZj8Fp6kPY/dIBqSrLdl6fNTJATbxtdz
	vpGvAt/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udpxt-0000000HI0m-1g83;
	Mon, 21 Jul 2025 12:49:57 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udoRS-0000000H36L-0ZAj
	for linux-mediatek@lists.infradead.org;
	Mon, 21 Jul 2025 11:12:24 +0000
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-32b43cce9efso35128211fa.3
        for <linux-mediatek@lists.infradead.org>; Mon, 21 Jul 2025 04:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1753096340; x=1753701140; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZvD8IUqr+Bzg9GKWiYPMFuwvqaPjoCioCLoAukeES3o=;
        b=gtODH4aed+y4EjYArTW4ziDhY9S1HqOqj/mtYrHzeiqLapuUzL8wlThIDPwZnIR5LX
         fJj7sZ1qSwVfOr19ir3eN3ULu7Fgt9wKwaPyNFDuxdFmKb2hroHwRZ92e+zhmIyBSZla
         8Zyqthm+B95pQl0wTuGaQL2n8W3vMBr1keQCo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753096340; x=1753701140;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZvD8IUqr+Bzg9GKWiYPMFuwvqaPjoCioCLoAukeES3o=;
        b=IjB0nlGn/dc3aSY+uxSklXFxWhG4/KC0NXa5dX9agHeQAOU8EwRivWmYsVUA+kIM0V
         rtgEXn5pVMmlRM+OokHlwB0oxbzxxEske4W9bv+Str+I6F3DoCRFvYVvS9D/VpnG0it8
         o/vSFg1Gf/H1YCNphxC0B+nCWQ8pg3VCoMmgAwxc1cr3FPZc96XJ7Ur11aYyJmHhEOCD
         2ESJrsqvgQqSam8mbjcKEBWflN6AHzQxtxQOLVJs1p9ExXzywNlnyJODKQsCLIuijz6D
         EA5Vt5IwHyYvrzeucp7uxmS2YsFqnRsG7goEgo8gzLb0SkE1A+w9f0ilqzkMWx+Bi6Jw
         Hmig==
X-Forwarded-Encrypted: i=1; AJvYcCWVNq8zmtZDFpuCL0qRXC0DCH0VZU3ne3cIFSj+Ojr7t1r+yVWBK9wF3nLWki9pCojiSWpj9e+JfYQAUKkosg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yysq36m0MzPqOe3vz+1P8jhRKnauVd//LiaTpQ7G/OC5N1yu88B
	gk9XB+m1nVU72JzK4/Ze6gVAjX3M9DTrkCkfSqoyCMZ3peq+OfpzPswpXFKaglba1VO9eK9jMHZ
	/BhUmAQOX5zs2s6cu7GrPBaHr4YEadR2s8wqDg7If
X-Gm-Gg: ASbGnct0v49gXHrr6xskZgo39ZGrECqIM3zquot7BHz1jtBjMI3u6i7CqCvt2L6qrv8
	DTtzi3AqBkUEPAFgd2ar/I3e7o4KdRHgSOj2l9Ri+KF85yF+l5hSL0MrYzu50ItOHHWq+ircrD+
	fcV9s9FfnIj8/CvBuIjUTjFRm0qyGyZ+vMIA3bBjhdx4NZUkuvjaLTYnrca0P3PwU4+SvyZaaLv
	Sz7rIsskrosUFKw8YSz98L2Tdtwb8jarqg=
X-Google-Smtp-Source: AGHT+IFBcIrODyu5ElS2DkB5XwLAm0Yi8m6vfMTv3g3vNlbCwrZrTFNYjxARMwbJuH0gzP751/Mkg4oUm0Irdkz6hQA=
X-Received: by 2002:a05:651c:154a:b0:32a:7270:5c29 with SMTP id
 38308e7fff4ca-3308f4c5293mr49883741fa.2.1753096340224; Mon, 21 Jul 2025
 04:12:20 -0700 (PDT)
MIME-Version: 1.0
References: <20250721081459.16278-1-laura.nao@collabora.com> <20250721081459.16278-6-laura.nao@collabora.com>
In-Reply-To: <20250721081459.16278-6-laura.nao@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 21 Jul 2025 19:12:08 +0800
X-Gm-Features: Ac12FXwjyLsGb66oW3wQunTIZj2TIT6qrKAAeEzwRJZc_WREeNFVgKGeEo3jG4M
Message-ID: <CAGXv+5F9NwJ7uGFPWZM-Dywbbk4f6aiYS5M4m6_VFETVGEwr9A@mail.gmail.com>
Subject: Re: [PATCH 5/9] thermal/drivers/mediatek/lvts: Add lvts_temp_to_raw
 variant for positive temp_factor
To: Laura Nao <laura.nao@collabora.com>
Cc: srini@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	rafael@kernel.org, daniel.lezcano@linaro.org, rui.zhang@intel.com, 
	lukasz.luba@arm.com, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, andrew-ct.chen@mediatek.com, 
	lala.lin@mediatek.com, arnd@arndb.de, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, nfraprado@collabora.com, 
	devicetree@vger.kernel.org, u.kleine-koenig@baylibre.com, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	kernel@collabora.com, colin.i.king@gmail.com, bchihi@baylibre.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_041222_199257_608320B9 
X-CRM114-Status: GOOD (  22.07  )
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

On Mon, Jul 21, 2025 at 4:31=E2=80=AFPM Laura Nao <laura.nao@collabora.com>=
 wrote:
>
> The current lvts_temp_to_raw() implementation assumes a negative
> temperature-to-raw slope (temp_factor), which holds for the SoCs
> currently supported by the driver. However, this assumption breaks on
> MT8196/MT6991, where the slope is positive.

I don't think that's really a problem. The formula is:

    temp =3D (raw * factor) >> 14 + golden

If we move the terms around we get

    ((temp - golden) << 14) / factor =3D raw

Or

    raw =3D ((golden - temp) << 14) / -factor


The calculations should work regardless of whether the factor is positive
or negative, as long as the intermediate and final values are within
the range of s64.

> Add a variant of the function that inverts the calculation logic
> accordingly. This ensures accurate raw value generation for temperature
> thresholds,avoiding spurious thermal interrupts or unintended hardware
> resets on MT8196/MT6991.
>
> Signed-off-by: Laura Nao <laura.nao@collabora.com>
> ---
>  drivers/thermal/mediatek/lvts_thermal.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/thermal/me=
diatek/lvts_thermal.c
> index db83137c7537..3c34956e37c1 100644
> --- a/drivers/thermal/mediatek/lvts_thermal.c
> +++ b/drivers/thermal/mediatek/lvts_thermal.c
> @@ -296,6 +296,18 @@ static u32 lvts_temp_to_raw(int temperature, int tem=
p_factor)
>         return div_s64(raw_temp, -temp_factor);
>  }
>
> +static u32 lvts_temp_to_raw_v2(int temperature, int temp_factor)
> +{
> +       u32 raw_temp;
> +
> +       if (temp_factor =3D=3D 0)
> +               return temperature;
> +
> +       raw_temp =3D temperature - golden_temp_offset;
> +
> +       return div_s64((s64)temp_factor << 14, raw_temp);
> +}

Here you have

    raw =3D (factor << 14) / (temp - golden)

which, barring integer arithmetic limitations, is actually the
multiplicative inverse of the original version.

So I think the commit message is misleading. It's not negative or
positive that matters, but that the hardware expects the
multiplicative inverse in this version.

(or the downstream code is just botched.)

ChenYu

> +
>  static int lvts_get_temp(struct thermal_zone_device *tz, int *temp)
>  {
>         struct lvts_sensor *lvts_sensor =3D thermal_zone_device_priv(tz);
> --
> 2.39.5
>
>

