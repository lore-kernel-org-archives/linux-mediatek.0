Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B33E3D5A6EC
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Nov 2024 08:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gmcqT3bZQMcjsucg2dQtWpXidNuyx+XXM3544HAZF0U=; b=4b3WM9rgPM4AZCGwiVB3X/GBpw
	rMHET3Y65UDnavNFro6B1IpFghSQkfWwMcM4uH6L5zbVbVkwDrSG0kc71jNiH4XD0psSiWKbwCoP2
	NZW4P/EwNFryHYyjLEHANGG+X3Zs9mvPu4Grxv0KzQiy/xo83U44MU2s1B9R7y5p+S3GKNj+65Y3f
	UG/tSL7Daqs205cS06gePKGaHsmOJdlSRztVtuYOL1IcSxnlIjBhTG+EUV3nY+mG5/6zz49DmW217
	m99M61cPzb4oLgiKDmM1jCaEwLZiNzg8VcjizzEBa4Viv11qKzvwyVXt10ubXOCzufcaTDVnYG95p
	V4TFUyxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFqeC-00000009w3X-3OGD;
	Tue, 26 Nov 2024 08:10:12 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFqag-00000009vQ5-0p3e
	for linux-mediatek@lists.infradead.org;
	Tue, 26 Nov 2024 08:06:35 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-aa560a65fd6so183420766b.0
        for <linux-mediatek@lists.infradead.org>; Tue, 26 Nov 2024 00:06:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1732608392; x=1733213192; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gmcqT3bZQMcjsucg2dQtWpXidNuyx+XXM3544HAZF0U=;
        b=Ldf/0SEXEELbKngya8bnqF+eDRautPrsnTAv+xSBdQ1DDpS8vFTRfAzJ7mZ0gy3Men
         xyQH9/6w4LxiWThg4HlnF2fO7zK+QnCLCOMkaiT2/NgbV60yxsUDq6MQOyjgMPansLNB
         L8B9b1nU78Rcd13VAYCZeDmxHskliAwua7l5c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732608392; x=1733213192;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gmcqT3bZQMcjsucg2dQtWpXidNuyx+XXM3544HAZF0U=;
        b=QLx9a31F72cM5Nrm1bViZmWXxjlY+zFd6ELLQIcHnhlbGn/gwG2HnEl+GOSCr6kqlw
         WqajTJmLNJh990N082S8tnvOh9RX/gxEDbWUnLUtKrFREbwLklw/e+9EUcv8ORjmIzRm
         89mfkvW8r8O423MORFOslFQqVEF7PjL2gy33wHShzwdaP2vlksCpOevJ9RA5DdieR6QJ
         tdwURfdb60RAQAAnKCRj4nDM18Zw70jXMbHX3qFciq3NlbwKp7iTbXjUVhSx97Px+Eoa
         6LjASexZCPOx/NetqNAGSIdNxcBEQ7q8l1nv6UCKgyscIPvErlfZ3TmM/4TwS1MZYJPn
         3SRQ==
X-Forwarded-Encrypted: i=1; AJvYcCVhTBHjxdSLTFT1HHVOpzQHy00jC1EIroCxVYvZC3bBfpYIHidOTCN/TVwwyIMGzXODHQ0P81rDWU8cObt92w==@lists.infradead.org
X-Gm-Message-State: AOJu0YzjOMSaxYfik8JD7SDRd7DIfzQbOL8BuT6enHgltJjN2Dwc+pDc
	GyOvgkwECtzi+f3T6QYE9ygXoxnzRMUuuzRwFDFgawlXdXBwc6ZMhPV1a6Rz6LBbkZLBboDE4+g
	=
X-Gm-Gg: ASbGnct26HZtZVM0de8IWLRc2rd9PYTWryjMZ+Oms3qpTHUCHa8dGk/YEwjUEQ4jVki
	F6+42KSWKQO6R2MfvacoCZEe4fXjkP+BFKDEoffHZhuB4y7w+wy9QK7HjXLm6cn65+6e2qjQs3t
	ooffHSP25IcsQ0MSAdTbCId4N5exmoqGJGx5uCl01E4+7FnF8Z3VpH/9PFaUQHsot5B62JQmTmR
	tdxowfXAmDPBiO9x5vi87CEBTsBnUwBbhuihSgfl/1WoUcUg1VvrZzhL0M+19JmeLmKEUAyAkNo
	+ldjRTtMqwV3qyVM
X-Google-Smtp-Source: AGHT+IGO09LVSxjqpBqQQyQoN7accmFloo60DeFaywTzqpfoXkrjXYYG0rw0VCUsFDst4GUaQTAf3Q==
X-Received: by 2002:a17:907:9386:b0:a9a:5b84:ac81 with SMTP id a640c23a62f3a-aa5648ff805mr215206766b.31.1732608392407;
        Tue, 26 Nov 2024 00:06:32 -0800 (PST)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com. [209.85.208.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa54a6c627dsm284209366b.139.2024.11.26.00.06.32
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Nov 2024 00:06:32 -0800 (PST)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5cfb81a0af9so4859a12.0
        for <linux-mediatek@lists.infradead.org>; Tue, 26 Nov 2024 00:06:32 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX/GX9nWsMqeMywaIaWFkfqlk2i9j1uUR7ZFpDvp7K4PN746YS3fuujiML86Ia3rWPIamaiStx3v5lDWXSzTQ==@lists.infradead.org
X-Received: by 2002:aa7:c48d:0:b0:5cf:c93f:36f3 with SMTP id
 4fb4d7f45d1cf-5d06f511712mr30786a12.7.1732608078885; Tue, 26 Nov 2024
 00:01:18 -0800 (PST)
MIME-Version: 1.0
References: <20241125-mt8192-lvts-filtered-suspend-fix-v1-0-42e3c0528c6c@collabora.com>
 <20241125-mt8192-lvts-filtered-suspend-fix-v1-1-42e3c0528c6c@collabora.com>
In-Reply-To: <20241125-mt8192-lvts-filtered-suspend-fix-v1-1-42e3c0528c6c@collabora.com>
From: Hsin-Te Yuan <yuanhsinte@chromium.org>
Date: Tue, 26 Nov 2024 16:00:42 +0800
X-Gmail-Original-Message-ID: <CAHc4DNKmGA-MjTWdZhKygiaRwN7mHnMCf8UPUxH_V16uZifzFg@mail.gmail.com>
Message-ID: <CAHc4DNKmGA-MjTWdZhKygiaRwN7mHnMCf8UPUxH_V16uZifzFg@mail.gmail.com>
Subject: Re: [PATCH 1/5] thermal/drivers/mediatek/lvts: Disable monitor mode
 during suspend
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Alexandre Mergnat <amergnat@baylibre.com>, Balsam CHIHI <bchihi@baylibre.com>, kernel@collabora.com, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Hsin-Te Yuan <yuanhsinte@chromium.org>, Chen-Yu Tsai <wenst@chromium.org>, 
	=?UTF-8?Q?Bernhard_Rosenkr=C3=A4nzer?= <bero@baylibre.com>, 
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_000634_245624_9C83D006 
X-CRM114-Status: GOOD (  26.52  )
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

On Tue, Nov 26, 2024 at 5:21=E2=80=AFAM N=C3=ADcolas F. R. A. Prado
<nfraprado@collabora.com> wrote:
>
> When configured in filtered mode, the LVTS thermal controller will
> monitor the temperature from the sensors and trigger an interrupt once a
> thermal threshold is crossed.
>
> Currently this is true even during suspend and resume. The problem with
> that is that when enabling the internal clock of the LVTS controller in
> lvts_ctrl_set_enable() during resume, the temperature reading can glitch
> and appear much higher than the real one, resulting in a spurious
> interrupt getting generated.
>
This sounds weird to me. On my end, the symptom is that the device
sometimes cannot suspend.
To be more precise, `echo mem > /sys/power/state` returns almost
immediately. I think the irq is more
likely to be triggered during suspension.


> Disable the temperature monitoring and give some time for the signals to
> stabilize during suspend in order to prevent such spurious interrupts.
>
> Cc: stable@vger.kernel.org
> Reported-by: Hsin-Te Yuan <yuanhsinte@chromium.org>
> Closes: https://lore.kernel.org/all/20241108-lvts-v1-1-eee339c6ca20@chrom=
ium.org/
> Fixes: 8137bb90600d ("thermal/drivers/mediatek/lvts_thermal: Add suspend =
and resume")
> Signed-off-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> ---
>  drivers/thermal/mediatek/lvts_thermal.c | 36 +++++++++++++++++++++++++++=
++++--
>  1 file changed, 34 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/thermal/me=
diatek/lvts_thermal.c
> index 1997e91bb3be94a3059db619238aa5787edc7675..a92ff2325c40704adc537af69=
95b34f93c3b0650 100644
> --- a/drivers/thermal/mediatek/lvts_thermal.c
> +++ b/drivers/thermal/mediatek/lvts_thermal.c
> @@ -860,6 +860,32 @@ static int lvts_ctrl_init(struct device *dev, struct=
 lvts_domain *lvts_td,
>         return 0;
>  }
>
> +static void lvts_ctrl_monitor_enable(struct device *dev, struct lvts_ctr=
l *lvts_ctrl, bool enable)
> +{
> +       /*
> +        * Bitmaps to enable each sensor on filtered mode in the MONCTL0
> +        * register.
> +        */
> +       u32 sensor_filt_bitmap[] =3D { BIT(0), BIT(1), BIT(2), BIT(3) };
> +       u32 sensor_map =3D 0;
> +       int i;
> +
> +       if (lvts_ctrl->mode !=3D LVTS_MSR_FILTERED_MODE)
> +               return;
> +
> +       if (enable) {
> +               lvts_for_each_valid_sensor(i, lvts_ctrl)
> +                       sensor_map |=3D sensor_filt_bitmap[i];
> +       }
> +
> +       /*
> +        * Bits:
> +        *      9: Single point access flow
> +        *    0-3: Enable sensing point 0-3
> +        */
> +       writel(sensor_map | BIT(9), LVTS_MONCTL0(lvts_ctrl->base));
> +}
> +
>  /*
>   * At this point the configuration register is the only place in the
>   * driver where we write multiple values. Per hardware constraint,
> @@ -1381,8 +1407,11 @@ static int lvts_suspend(struct device *dev)
>
>         lvts_td =3D dev_get_drvdata(dev);
>
> -       for (i =3D 0; i < lvts_td->num_lvts_ctrl; i++)
> +       for (i =3D 0; i < lvts_td->num_lvts_ctrl; i++) {
> +               lvts_ctrl_monitor_enable(dev, &lvts_td->lvts_ctrl[i], fal=
se);
> +               usleep_range(100, 200);
>                 lvts_ctrl_set_enable(&lvts_td->lvts_ctrl[i], false);
> +       }
>
>         clk_disable_unprepare(lvts_td->clk);
>
> @@ -1400,8 +1429,11 @@ static int lvts_resume(struct device *dev)
>         if (ret)
>                 return ret;
>
> -       for (i =3D 0; i < lvts_td->num_lvts_ctrl; i++)
> +       for (i =3D 0; i < lvts_td->num_lvts_ctrl; i++) {
>                 lvts_ctrl_set_enable(&lvts_td->lvts_ctrl[i], true);
> +               usleep_range(100, 200);
> +               lvts_ctrl_monitor_enable(dev, &lvts_td->lvts_ctrl[i], tru=
e);
> +       }
>
>         return 0;
>  }
>
> --
> 2.47.0
>

