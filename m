Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48E5EC87FC9
	for <linux-mediatek@archiver.kernel.org>; Thu, 31 Jul 2025 03:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IQz3EwDsCOo1XFmvxHoa4HIcyhVHPzzMG2oMGGNImxA=; b=lQ+jVUqo54e95K/62p505kcDX4
	kpFgZkgLTDp5EVomvph9oOCSPzpMRkVt1eFd+C0/jxj6Js1Bhf6l/4TycjJD2/7za9Ph5EPEjZVsj
	SqdmXtbhQmXS2XZpS8Zv2YaRcdEHVPfUBtAZYvK0fiLeq8WOvZ1I9r8u9Vofm5VXtjPs+z5/Xu1IF
	WnMiUEZAqR/MrBFRCsrGnIqkYTnHuYcwnlQyBQIQYukbiMJ2Og1vyHcRkYP0JrZ6FmTlDHQ9XPLa9
	feHT4ebQrCFfU6h88YcyGKCnm3WjDpKQoVugEAK8B0VU9ehg/b9gdpT9ZJYpWHMPAuzdNLuWlzLjY
	oECmXfoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhJh2-00000002oOU-2EWH;
	Thu, 31 Jul 2025 03:10:56 +0000
Received: from mail-vk1-xa2b.google.com ([2607:f8b0:4864:20::a2b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhJh0-00000002oO4-2jAu
	for linux-mediatek@lists.infradead.org;
	Thu, 31 Jul 2025 03:10:55 +0000
Received: by mail-vk1-xa2b.google.com with SMTP id 71dfb90a1353d-537904b0c74so179374e0c.3
        for <linux-mediatek@lists.infradead.org>; Wed, 30 Jul 2025 20:10:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1753931453; x=1754536253; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IQz3EwDsCOo1XFmvxHoa4HIcyhVHPzzMG2oMGGNImxA=;
        b=Don5VHEYigMZfK2sUqVsy70iCcE/kOB4rwBc4CgzDe54PsHmL31sfkFRRYyyECa89n
         LazLTSUDs9tiIOf4ZqxPugYQHHTj4oVDR8O5zchhm1OMI8rBBMCiyNjX2pDb0y1HWFfH
         EPUL5Uu8HwsPfI7/1d5te97HUTODZXJQGw9GI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753931453; x=1754536253;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IQz3EwDsCOo1XFmvxHoa4HIcyhVHPzzMG2oMGGNImxA=;
        b=i2DvnVSBoWvyGl+fyT2xfMOIsvDTKlWfr5jtCaqKRCB8OQcUKnFze9Ejkn4nql1luU
         5Lh1fkNa4Bh0ubsnKgP0MzexRVDmvfdi6N0i6KkFe4k6aI/m9VoYYj0S0a4DkoufbjKU
         5UFXKgENFXhGjeWNP0zx78hi+QxeOSNhOO29ZdYkV5eu2j4GjPXGBoUOjnNRrU7acC7G
         gfWRoU6G3335B5pY4IB3wjWSnBrC+zCzGIbDhJnyfq6Y3431PcjtQ1jhPwschUCtnthp
         EEtD9T+YL4KDuWbIy6kCWINtMpkKFhI5LjH8bcV+fXQbrVcknK05cXcSrtx+2GcpMORY
         kmiA==
X-Forwarded-Encrypted: i=1; AJvYcCVmARabJdG6l/P/oI4Xl00gTKpaWc3yn449kZdzEr0ZIOXb/5YE1b8WWaYcs01dAktl6Lm5jmNtokgjoZWtzQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx67Ztw+sA4FQmcc6JszMXZxTOBg1bPfr2cRpw5FEb53UOLW+xM
	ppPeOSNtt9PTQMehc7zcigmXzusgzFKJm0zBfj2c7rxoDSWyOqN557NztpLAxhC6hbGYMxu2IAR
	RV2M=
X-Gm-Gg: ASbGncsvNqoywMDdXaywS0jlnslONWqvnriAlieAuPFsL+VhsDQHew9f5Da02LWsBsc
	TQqnls4nlz5g2Un7gjk9P85y2a/7iipmR4dKedmfFtzOcnhHg2GvtnRK/oDGdgmLtHIPgpKBvs9
	4hiJKHHKyu30iMB2jXlIr9YRcBLmCJGf4ogst6n0m/QAf+Q+zZeHBZAsLr+WdBP8Z3k4vwe+w1q
	LaE44k1Im12HAZxcz7YZxSTdgHMH/oNGMyD8A/YTi+rh/m1MiihZbyMOvCqEHprsIovhT89sRHa
	lLaqshvOOSaP6W2DR7zf1wsCP+VKOSgQ5wVbxReEluU0fh9COPhd4zJHS979v+UmqH5n+yH3ZDd
	iSuWzXyiWdwRQgdT16d7X7+rV7cLOrXDl6FdRqpmJ85E3QXtn6dyWtF23eg==
X-Google-Smtp-Source: AGHT+IFfDwkv/J5C+RLF6LoUBV+lB3M5gTGuLMEmBMvDYfAAOL1/YU4ZLW3yA3UczxAJRGYZmw4RDA==
X-Received: by 2002:a05:6122:8ce:b0:531:2f9f:8026 with SMTP id 71dfb90a1353d-5391ce9632dmr3555160e0c.1.1753931452803;
        Wed, 30 Jul 2025 20:10:52 -0700 (PDT)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com. [209.85.217.52])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-53936d4c6f3sm165354e0c.33.2025.07.30.20.10.52
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Jul 2025 20:10:52 -0700 (PDT)
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-4fbed2d9e61so190983137.3
        for <linux-mediatek@lists.infradead.org>; Wed, 30 Jul 2025 20:10:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXy4U05aVkIXFy59dETsbZnYvILVBsmQ5iMpqGRMrXxmmSrEmf4aXu/uybXLhFS0ZEL08odufoLSt4m2zogeQ==@lists.infradead.org
X-Received: by 2002:a05:6102:3e86:b0:4f9:d929:8558 with SMTP id
 ada2fe7eead31-4fbe7f5a8ecmr3674144137.10.1753931451474; Wed, 30 Jul 2025
 20:10:51 -0700 (PDT)
MIME-Version: 1.0
References: <20250730152128.311109-1-laura.nao@collabora.com> <20250730152128.311109-3-laura.nao@collabora.com>
In-Reply-To: <20250730152128.311109-3-laura.nao@collabora.com>
From: Fei Shao <fshao@chromium.org>
Date: Thu, 31 Jul 2025 11:10:15 +0800
X-Gmail-Original-Message-ID: <CAC=S1nhEiWmFkVMVGqg97TqXQqLhP0KZkQvq+F=k_hS_Jg297Q@mail.gmail.com>
X-Gm-Features: Ac12FXxQNf_MHWgJFTLhQCBFRAD1HLcfHVxkjg6vNoUDqC6XlmkmVeEw5sZ-QQw
Message-ID: <CAC=S1nhEiWmFkVMVGqg97TqXQqLhP0KZkQvq+F=k_hS_Jg297Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/9] thermal/drivers/mediatek/lvts: Make number of
 calibration offsets configurable
To: Laura Nao <laura.nao@collabora.com>
Cc: srini@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	rafael@kernel.org, daniel.lezcano@linaro.org, rui.zhang@intel.com, 
	lukasz.luba@arm.com, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, andrew-ct.chen@mediatek.com, 
	kernel@collabora.com, nfraprado@collabora.com, arnd@arndb.de, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, u.kleine-koenig@baylibre.com, 
	linux-arm-kernel@lists.infradead.org, wenst@chromium.org, 
	linux-mediatek@lists.infradead.org, bchihi@baylibre.com, 
	colin.i.king@gmail.com, lala.lin@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250730_201054_710443_C63D7F8E 
X-CRM114-Status: GOOD (  20.97  )
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

On Wed, Jul 30, 2025 at 11:30=E2=80=AFPM Laura Nao <laura.nao@collabora.com=
> wrote:
>
> MT8196/MT6991 use 2-byte eFuse calibration data, whereas other SoCs
> supported by the driver rely on 3 bytes. Make the number of calibration
> bytes per sensor configurable, enabling support for SoCs with varying
> calibration formats.
>
> Signed-off-by: Laura Nao <laura.nao@collabora.com>

Reviewed-by: Fei Shao <fshao@chromium.org>

> ---
>  drivers/thermal/mediatek/lvts_thermal.c | 32 +++++++++++++++++--------
>  1 file changed, 22 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/thermal/me=
diatek/lvts_thermal.c
> index f4d1e66d7db9..05aa8895ccce 100644
> --- a/drivers/thermal/mediatek/lvts_thermal.c
> +++ b/drivers/thermal/mediatek/lvts_thermal.c
> @@ -96,12 +96,14 @@
>
>  #define LVTS_MINIMUM_THRESHOLD         20000
>
> +#define LVTS_MAX_CAL_OFFSETS           3
> +
>  static int golden_temp =3D LVTS_GOLDEN_TEMP_DEFAULT;
>  static int golden_temp_offset;
>
>  struct lvts_sensor_data {
>         int dt_id;
> -       u8 cal_offsets[3];
> +       u8 cal_offsets[LVTS_MAX_CAL_OFFSETS];
>  };
>
>  struct lvts_ctrl_data {
> @@ -127,6 +129,7 @@ struct lvts_data {
>         const struct lvts_ctrl_data *lvts_ctrl;
>         const u32 *conn_cmd;
>         const u32 *init_cmd;
> +       int num_cal_offsets;
>         int num_lvts_ctrl;
>         int num_conn_cmd;
>         int num_init_cmd;
> @@ -711,7 +714,7 @@ static int lvts_calibration_init(struct device *dev, =
struct lvts_ctrl *lvts_ctrl
>                                         u8 *efuse_calibration,
>                                         size_t calib_len)
>  {
> -       int i;
> +       int i, j;
>         u32 gt;
>
>         /* A zero value for gt means that device has invalid efuse data *=
/
> @@ -720,17 +723,18 @@ static int lvts_calibration_init(struct device *dev=
, struct lvts_ctrl *lvts_ctrl
>         lvts_for_each_valid_sensor(i, lvts_ctrl_data) {
>                 const struct lvts_sensor_data *sensor =3D
>                                         &lvts_ctrl_data->lvts_sensor[i];
> +               u32 calib =3D 0;
>
> -               if (sensor->cal_offsets[0] >=3D calib_len ||
> -                   sensor->cal_offsets[1] >=3D calib_len ||
> -                   sensor->cal_offsets[2] >=3D calib_len)
> -                       return -EINVAL;
> +               for (j =3D 0; j < lvts_ctrl->lvts_data->num_cal_offsets; =
j++) {
> +                       u8 offset =3D sensor->cal_offsets[j];
> +
> +                       if (offset >=3D calib_len)
> +                               return -EINVAL;
> +                       calib |=3D efuse_calibration[offset] << (8 * j);
> +               }
>
>                 if (gt) {
> -                       lvts_ctrl->calibration[i] =3D
> -                               (efuse_calibration[sensor->cal_offsets[0]=
] << 0) +
> -                               (efuse_calibration[sensor->cal_offsets[1]=
] << 8) +
> -                               (efuse_calibration[sensor->cal_offsets[2]=
] << 16);
> +                       lvts_ctrl->calibration[i] =3D calib;
>                 } else if (lvts_ctrl->lvts_data->def_calibration) {
>                         lvts_ctrl->calibration[i] =3D lvts_ctrl->lvts_dat=
a->def_calibration;
>                 } else {
> @@ -1763,6 +1767,7 @@ static const struct lvts_data mt7988_lvts_ap_data =
=3D {
>         .temp_factor    =3D LVTS_COEFF_A_MT7988,
>         .temp_offset    =3D LVTS_COEFF_B_MT7988,
>         .gt_calib_bit_offset =3D 24,
> +       .num_cal_offsets =3D 3,
>  };
>
>  static const struct lvts_data mt8186_lvts_data =3D {
> @@ -1776,6 +1781,7 @@ static const struct lvts_data mt8186_lvts_data =3D =
{
>         .temp_offset    =3D LVTS_COEFF_B_MT7988,
>         .gt_calib_bit_offset =3D 24,
>         .def_calibration =3D 19000,
> +       .num_cal_offsets =3D 3,
>  };
>
>  static const struct lvts_data mt8188_lvts_mcu_data =3D {
> @@ -1789,6 +1795,7 @@ static const struct lvts_data mt8188_lvts_mcu_data =
=3D {
>         .temp_offset    =3D LVTS_COEFF_B_MT8195,
>         .gt_calib_bit_offset =3D 20,
>         .def_calibration =3D 35000,
> +       .num_cal_offsets =3D 3,
>  };
>
>  static const struct lvts_data mt8188_lvts_ap_data =3D {
> @@ -1802,6 +1809,7 @@ static const struct lvts_data mt8188_lvts_ap_data =
=3D {
>         .temp_offset    =3D LVTS_COEFF_B_MT8195,
>         .gt_calib_bit_offset =3D 20,
>         .def_calibration =3D 35000,
> +       .num_cal_offsets =3D 3,
>  };
>
>  static const struct lvts_data mt8192_lvts_mcu_data =3D {
> @@ -1815,6 +1823,7 @@ static const struct lvts_data mt8192_lvts_mcu_data =
=3D {
>         .temp_offset    =3D LVTS_COEFF_B_MT8195,
>         .gt_calib_bit_offset =3D 24,
>         .def_calibration =3D 35000,
> +       .num_cal_offsets =3D 3,
>  };
>
>  static const struct lvts_data mt8192_lvts_ap_data =3D {
> @@ -1828,6 +1837,7 @@ static const struct lvts_data mt8192_lvts_ap_data =
=3D {
>         .temp_offset    =3D LVTS_COEFF_B_MT8195,
>         .gt_calib_bit_offset =3D 24,
>         .def_calibration =3D 35000,
> +       .num_cal_offsets =3D 3,
>  };
>
>  static const struct lvts_data mt8195_lvts_mcu_data =3D {
> @@ -1841,6 +1851,7 @@ static const struct lvts_data mt8195_lvts_mcu_data =
=3D {
>         .temp_offset    =3D LVTS_COEFF_B_MT8195,
>         .gt_calib_bit_offset =3D 24,
>         .def_calibration =3D 35000,
> +       .num_cal_offsets =3D 3,
>  };
>
>  static const struct lvts_data mt8195_lvts_ap_data =3D {
> @@ -1854,6 +1865,7 @@ static const struct lvts_data mt8195_lvts_ap_data =
=3D {
>         .temp_offset    =3D LVTS_COEFF_B_MT8195,
>         .gt_calib_bit_offset =3D 24,
>         .def_calibration =3D 35000,
> +       .num_cal_offsets =3D 3,
>  };
>
>  static const struct of_device_id lvts_of_match[] =3D {
> --
> 2.39.5
>
>

