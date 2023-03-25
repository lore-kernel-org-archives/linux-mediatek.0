Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F25D3C6FD1C
	for <linux-mediatek@archiver.kernel.org>; Sat, 25 Mar 2023 04:33:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+FwD1qe1aEhxGQwbkfsAcs59fzQAp+267YsErGDwRDQ=; b=XB9VeYhBIvrxoQOd9TA/mNecdh
	Nv2LdWt5EBd7BqmxjWF8+rXfUx7LSJhg4M2u50o5Vb93TlZpCs++BoKJigXvvWGtiaJ/uGkoPNpE8
	EMjMYixs4e9hcReM0FCVQ9G/jP+wUWS6qxqwvpZdBUm96h4J/IdS2nd1jZOvc0HeETaI92Zb2VG/m
	9SGY8ON5mMSKf5g0+NglzfSfbl+SUUsAVOGk7cIuzIEsxhPcgHO+ty1u+jPygpwua4+4vJuLHd9Gl
	BFEcTJ3oSwJ7vRFO1JUw1INy9k/GIcsJb5FWe9g1Kql7NYv2OGPcPoueDjMtPSULh2BoR+6NvY8md
	HBizQq/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfvb1-0065gk-0c;
	Sat, 25 Mar 2023 04:33:39 +0000
Received: from mail-ua1-x92b.google.com ([2607:f8b0:4864:20::92b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfvay-0065fi-0z
	for linux-mediatek@lists.infradead.org;
	Sat, 25 Mar 2023 04:33:37 +0000
Received: by mail-ua1-x92b.google.com with SMTP id 89so2836820uao.0
        for <linux-mediatek@lists.infradead.org>; Fri, 24 Mar 2023 21:33:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1679718814;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+FwD1qe1aEhxGQwbkfsAcs59fzQAp+267YsErGDwRDQ=;
        b=iOFPi2EpJxYYxobOHGqjcpDoFg3I0Cf9cCiHsWV6gSJJ/2aZpe6HW9DB/PQLkXxGzN
         qj2kCyi+v1dUPETrWiILCcrZHHflu9iCIqKBzkAHRMM9GRgZ/m/uLOtcWmX4mAJDumVZ
         UNpPB7YoMkihR/Bvc44JXgVgX8VjDhAwXtAfY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679718814;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+FwD1qe1aEhxGQwbkfsAcs59fzQAp+267YsErGDwRDQ=;
        b=P4JTJMl5EBasIHu7VLCah1xKvyItsu5M5LfW76L+paVUEMMQxQASreJASxUgkMKvXX
         ouJfbea3OCjPfhscrCbQD4DO28f8eowo9b3dhpVmxfQWqmfs5UIM7oD90N2qWLVRSA06
         QcxupK8oegeNEiZXxL9O6PNLM+iII0XG84kHBQHDncITjGBxamNxTSrdUCt9Ir+Rt7LR
         rDBvv8fwx8gQWBTrWfkR3ZcyZSpHv7XMKUg+6cqH23nonh1MnKY2+wfZf2l2P9s7TGix
         s+tYvBqNiw/dx1Ev0Tqm/VueLRBBxFajX+DvogY+6j9oqBjUjBgU4jb+t5Y7+RDDRo3A
         6MiQ==
X-Gm-Message-State: AO0yUKXAkpv9Ujj8AZ0fn/eszTeu3lfVBZnC+stYraOySHQeqCdciRYy
	GiRCpQfe8eFfE27LsVUynjzValyPziRmYme4nVyV0Q==
X-Google-Smtp-Source: AK7set8snxwLMBw9XRJSwzZ8WvoC9Kq12OK3/hxUxctwmRuEURtsmj8QD8ZysLyTsXXDQnMndDgdvCTkYeUbBR3rXP4=
X-Received: by 2002:a05:6122:7c9:b0:401:7625:e9e3 with SMTP id
 l9-20020a05612207c900b004017625e9e3mr7173590vkr.1.1679718814257; Fri, 24 Mar
 2023 21:33:34 -0700 (PDT)
MIME-Version: 1.0
References: <20230307163413.143334-1-bchihi@baylibre.com> <CAGXv+5E0wUJYUVD3wx3-=uES612ARQmUE0rxgAruFHxpZCBjzA@mail.gmail.com>
 <CAGuA+ooi7Kx05gagLzXAN3upDiSqDUNOM_djYdGftw6ogVx5gw@mail.gmail.com> <CAGuA+oqDPPYFJef_8=YrOpHQNVJ3xgm_zXS6fq_HG2Jy_6t-Zg@mail.gmail.com>
In-Reply-To: <CAGuA+oqDPPYFJef_8=YrOpHQNVJ3xgm_zXS6fq_HG2Jy_6t-Zg@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Sat, 25 Mar 2023 12:33:23 +0800
Message-ID: <CAGXv+5EZPWohGN5CaEiqVrM4MyAar3cPEUhHtGY_9wTJSJNVFQ@mail.gmail.com>
Subject: Re: [PATCH 0/4] Add LVTS support for mt8192
To: Balsam CHIHI <bchihi@baylibre.com>
Cc: daniel.lezcano@linaro.org, angelogioacchino.delregno@collabora.com, 
	rafael@kernel.org, amitk@kernel.org, rui.zhang@intel.com, 
	matthias.bgg@gmail.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	rdunlap@infradead.org, ye.xingchen@zte.com.cn, p.zabel@pengutronix.de, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	devicetree@vger.kernel.org, khilman@baylibre.com, james.lo@mediatek.com, 
	rex-bc.chen@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230324_213336_372752_5EFC27F4 
X-CRM114-Status: GOOD (  19.34  )
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

On Wed, Mar 22, 2023 at 8:48=E2=80=AFPM Balsam CHIHI <bchihi@baylibre.com> =
wrote:
>
> Hi Chen-Yu,
>
> I suspect the bug comes from incorrect calibration data offsets for AP
> Domain because you confirm that MCU Domain probe runs without issues.
> Is it possible to test something for us to confirm this theory (i
> don't have an mt8192 board on hand now), when you have the time of
> course?
> We would like to test AP Domain's calibration data offsets with a
> working one, for example :
>
>  static const struct lvts_ctrl_data mt8192_lvts_ap_data_ctrl[] =3D {
>                 {
> -               .cal_offset =3D { 0x25, 0x28 },
> +               .cal_offset =3D { 0x04, 0x04 },
>                 .lvts_sensor =3D {
>                         { .dt_id =3D MT8192_AP_VPU0 },
>                         { .dt_id =3D MT8192_AP_VPU1 }
> @@ -1336,7 +1336,7 @@ static const struct lvts_ctrl_data
> mt8192_lvts_ap_data_ctrl[] =3D {
>                 .hw_tshut_temp =3D LVTS_HW_SHUTDOWN_MT8192,
>         },
>         {
> -               .cal_offset =3D { 0x2e, 0x31 },
> +               .cal_offset =3D { 0x04, 0x04 },
>                 .lvts_sensor =3D {
>                         { .dt_id =3D MT8192_AP_GPU0 },
>                         { .dt_id =3D MT8192_AP_GPU1 }
> @@ -1346,7 +1346,7 @@ static const struct lvts_ctrl_data
> mt8192_lvts_ap_data_ctrl[] =3D {
>                 .hw_tshut_temp =3D LVTS_HW_SHUTDOWN_MT8192,
>         },
>         {
> -               .cal_offset =3D { 0x37, 0x3a },
> +               .cal_offset =3D { 0x04, 0x04 },
>                 .lvts_sensor =3D {
>                         { .dt_id =3D MT8192_AP_INFRA },
>                         { .dt_id =3D MT8192_AP_CAM },
> @@ -1356,7 +1356,7 @@ static const struct lvts_ctrl_data
> mt8192_lvts_ap_data_ctrl[] =3D {
>                 .hw_tshut_temp =3D LVTS_HW_SHUTDOWN_MT8192,
>         },
>         {
> -               .cal_offset =3D { 0x40, 0x43, 0x46 },
> +               .cal_offset =3D { 0x04, 0x04, 0x04 },
>                 .lvts_sensor =3D {
>                         { .dt_id =3D MT8192_AP_MD0 },
>                         { .dt_id =3D MT8192_AP_MD1 },
>
> This example is tested and works for mt8195,
> (all sensors use the same calibration data offset for testing purposes).
>
> Thank you in advance for your help.

The MCU ones are still tripping though. If I change all of them to 0x04,
then nothing trips. There's also a bug in the interrupt handling code
that needs to be dealt with.

AFAICT the calibration data is stored differently. If you look at ChromeOS'=
s
downstream v5.10 driver, you'll see mt6873_efuse_to_cal_data() for MT8192,
and mt8195_efuse_to_cal_data() for MT8195. The difference sums up to:
MT8195 has all data sequentially stored, while MT8192 has most data stored
in lower 24 bits of each 32-bit word, and the highest 8 bits are then used
to pack data for the remaining sensors.

Regards
ChenYu

