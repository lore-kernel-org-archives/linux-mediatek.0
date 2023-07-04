Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A33DEB64DA
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Jul 2023 06:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xu1Hflpla9IkbLaoY1CW/Ds3THRDk4wCMUEZUDRnIkc=; b=c3OD+e9AWswsdMiglFTgL4zAy0
	KOJc9pcHdeNd66b47kdN0vDrL2Rd3/HXbOTDBiTGbyVqgRM/fiLBJ3PDavhMyFR0vPub39kHz7x3b
	fSZHxoIxsaLCqtaWi3UGn6qJLCsz5kY7orKOAKdln1PM5JWltZB6keYFiBy5idvxVb8z1wPskz1Lf
	I5kx1+Cz1o3isY193/9ZLPkCshODRK/pSnXfQGd9McwGU/f+A9RmspD3YYnQBrpknKk+yGzjLqe29
	PuIiN5+95Yh6ZfnUC4kQHqHHlogAvRayzzTOllM7zDmCEBpYyb3LJ1kIcasRDWwJ1yx3KqqFWcyfi
	jJrJVMpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGZQy-00CImd-12;
	Tue, 04 Jul 2023 06:22:44 +0000
Received: from mail-ua1-x92c.google.com ([2607:f8b0:4864:20::92c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGZQv-00CIks-0o
	for linux-mediatek@lists.infradead.org;
	Tue, 04 Jul 2023 06:22:42 +0000
Received: by mail-ua1-x92c.google.com with SMTP id a1e0cc1a2514c-791a0651fa3so1575894241.0
        for <linux-mediatek@lists.infradead.org>; Mon, 03 Jul 2023 23:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1688451759; x=1691043759;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xu1Hflpla9IkbLaoY1CW/Ds3THRDk4wCMUEZUDRnIkc=;
        b=EyJBpj/cvSN6wh7lrRNAIhUyFjtEAjyj4fjarlA3vEwtvtFK73gvcpz0ZkXd1HKhRC
         6myzp4jURi1zf7S7n5fNUAAOZ5RUuq/AU+/m9UWl2j2xGq2EFA9CeYR0BESYJ18zHmCs
         dKml2Ruj5Lzv9FuOMWONvFC8GxTCCH+E2e1Xs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688451759; x=1691043759;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xu1Hflpla9IkbLaoY1CW/Ds3THRDk4wCMUEZUDRnIkc=;
        b=iP7qUKjbci1FL/Xo7vtd3m3EKCLusj2t7Uu3IXfKKVjcD67s+0xqdnG1j8rcP+5O+b
         uoBPOL8oFsqVmCfQLl25/7tsMAQw1sXzcsKcH8CpnMIkdZszJMF3y7LM01uFQxBcCuHr
         2Jmy/S1WCmjSKAbLNHTmXQYCwCUoXVr4kA6Bn6Bgkt28Tl7AEphoC0TebLPntb3zmS2z
         1mMM0iLZxPP0K95sDTel+nex0CyWkESUNyA3AwnrDMC4l+XdO2BWypK4xFaVvWdbG9SE
         eekdNwn4lSwVuRPgC1LKX/pBR4IOKY0zSdv7jq894418NckTNKm6qtqKTDc5eHgXs9u/
         peKw==
X-Gm-Message-State: ABy/qLbemZFBC7fgpqNdogT0mT5ct9Qnmqk53a8oDsvCfFayn17mydrq
	bdU535mARtG9hIPQ5ySJAhn0dfNauyRyF0wkNwwzbw==
X-Google-Smtp-Source: APBJJlG2WIR0Xf2B86fezEVK9rhJjCRRaXN0MCsUzHBlJi4WGPwFClWX8K6+042osTp1PPpiviozMFsIZkM1y7N3fHA=
X-Received: by 2002:a67:e3d9:0:b0:443:874b:7d60 with SMTP id
 k25-20020a67e3d9000000b00443874b7d60mr4345894vsm.26.1688451759378; Mon, 03
 Jul 2023 23:22:39 -0700 (PDT)
MIME-Version: 1.0
References: <20230530195132.2286163-1-bero@baylibre.com> <20230530195132.2286163-4-bero@baylibre.com>
In-Reply-To: <20230530195132.2286163-4-bero@baylibre.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 4 Jul 2023 14:22:28 +0800
Message-ID: <CAGXv+5HCQ+S8ZNP1nLH9jYnzMhg5MfjWdiTevghGZjdK=pC2Zw@mail.gmail.com>
Subject: Re: [PATCH v4 3/5] thermal/drivers/mediatek/lvts_thermal: Add mt8192 support
To: =?UTF-8?Q?Bernhard_Rosenkr=C3=A4nzer?= <bero@baylibre.com>
Cc: daniel.lezcano@linaro.org, angelogioacchino.delregno@collabora.com, 
	rafael@kernel.org, amitk@kernel.org, rui.zhang@intel.com, 
	matthias.bgg@gmail.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	rdunlap@infradead.org, ye.xingchen@zte.com.cn, p.zabel@pengutronix.de, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	devicetree@vger.kernel.org, james.lo@mediatek.com, rex-bc.chen@mediatek.com, 
	nfraprado@collabora.com, abailon@baylibre.com, amergnat@baylibre.com, 
	khilman@baylibre.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230703_232241_317458_FCBDD5AD 
X-CRM114-Status: GOOD (  17.95  )
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

On Wed, May 31, 2023 at 3:51=E2=80=AFAM Bernhard Rosenkr=C3=A4nzer <bero@ba=
ylibre.com> wrote:
>
> From: Balsam CHIHI <bchihi@baylibre.com>
>
> Add LVTS Driver support for MT8192.
>
> Co-developed-by : N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> Signed-off-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> Signed-off-by: Balsam CHIHI <bchihi@baylibre.com>
> Reviewed-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> Signed-off-by: Bernhard Rosenkr=C3=A4nzer <bero@baylibre.com>
> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
> ---
>  drivers/thermal/mediatek/lvts_thermal.c | 95 +++++++++++++++++++++++++
>  1 file changed, 95 insertions(+)
>
> diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/thermal/me=
diatek/lvts_thermal.c
> index 5ea8a9d569ea6..d5e5214784ece 100644
> --- a/drivers/thermal/mediatek/lvts_thermal.c
> +++ b/drivers/thermal/mediatek/lvts_thermal.c
> @@ -80,6 +80,7 @@
>  #define LVTS_MSR_FILTERED_MODE         1
>
>  #define LVTS_HW_SHUTDOWN_MT8195                105000
> +#define LVTS_HW_SHUTDOWN_MT8192                105000
>
>  static int golden_temp =3D LVTS_GOLDEN_TEMP_DEFAULT;
>  static int coeff_b =3D LVTS_COEFF_B;
> @@ -1280,6 +1281,88 @@ static const struct lvts_ctrl_data mt8195_lvts_ap_=
data_ctrl[] =3D {
>         }
>  };
>
> +static const struct lvts_ctrl_data mt8192_lvts_mcu_data_ctrl[] =3D {
> +       {
> +               .cal_offset =3D { 0x04, 0x08 },
> +               .lvts_sensor =3D {
> +                       { .dt_id =3D MT8192_MCU_BIG_CPU0 },
> +                       { .dt_id =3D MT8192_MCU_BIG_CPU1 }
> +               },
> +               .num_lvts_sensor =3D 2,
> +               .offset =3D 0x0,
> +               .hw_tshut_temp =3D LVTS_HW_SHUTDOWN_MT8192,
> +               .mode =3D LVTS_MSR_FILTERED_MODE,
> +       },
> +       {
> +               .cal_offset =3D { 0x0c, 0x10 },
> +               .lvts_sensor =3D {
> +                       { .dt_id =3D MT8192_MCU_BIG_CPU2 },
> +                       { .dt_id =3D MT8192_MCU_BIG_CPU3 }
> +               },
> +               .num_lvts_sensor =3D 2,
> +               .offset =3D 0x100,
> +               .hw_tshut_temp =3D LVTS_HW_SHUTDOWN_MT8192,
> +               .mode =3D LVTS_MSR_FILTERED_MODE,
> +       },
> +       {
> +               .cal_offset =3D { 0x14, 0x18, 0x1c, 0x20 },
> +               .lvts_sensor =3D {
> +                       { .dt_id =3D MT8192_MCU_LITTLE_CPU0 },
> +                       { .dt_id =3D MT8192_MCU_LITTLE_CPU1 },
> +                       { .dt_id =3D MT8192_MCU_LITTLE_CPU2 },
> +                       { .dt_id =3D MT8192_MCU_LITTLE_CPU3 }
> +               },
> +               .num_lvts_sensor =3D 4,
> +               .offset =3D 0x200,
> +               .hw_tshut_temp =3D LVTS_HW_SHUTDOWN_MT8192,
> +               .mode =3D LVTS_MSR_FILTERED_MODE,
> +       }
> +};
> +
> +static const struct lvts_ctrl_data mt8192_lvts_ap_data_ctrl[] =3D {
> +               {
> +               .cal_offset =3D { 0x24, 0x28 },
> +               .lvts_sensor =3D {
> +                       { .dt_id =3D MT8192_AP_VPU0 },
> +                       { .dt_id =3D MT8192_AP_VPU1 }
> +               },
> +               .num_lvts_sensor =3D 2,
> +               .offset =3D 0x0,
> +               .hw_tshut_temp =3D LVTS_HW_SHUTDOWN_MT8192,
> +       },
> +       {
> +               .cal_offset =3D { 0x2c, 0x30 },
> +               .lvts_sensor =3D {
> +                       { .dt_id =3D MT8192_AP_GPU0 },
> +                       { .dt_id =3D MT8192_AP_GPU1 }
> +               },
> +               .num_lvts_sensor =3D 2,
> +               .offset =3D 0x100,
> +               .hw_tshut_temp =3D LVTS_HW_SHUTDOWN_MT8192,
> +       },
> +       {
> +               .cal_offset =3D { 0x34, 0x38 },
> +               .lvts_sensor =3D {
> +                       { .dt_id =3D MT8192_AP_INFRA },
> +                       { .dt_id =3D MT8192_AP_CAM },
> +               },
> +               .num_lvts_sensor =3D 2,
> +               .offset =3D 0x200,
> +               .hw_tshut_temp =3D LVTS_HW_SHUTDOWN_MT8192,
> +       },
> +       {
> +               .cal_offset =3D { 0x3c, 0x40, 0x44 },
> +               .lvts_sensor =3D {
> +                       { .dt_id =3D MT8192_AP_MD0 },
> +                       { .dt_id =3D MT8192_AP_MD1 },
> +                       { .dt_id =3D MT8192_AP_MD2 }
> +               },
> +               .num_lvts_sensor =3D 3,
> +               .offset =3D 0x300,
> +               .hw_tshut_temp =3D LVTS_HW_SHUTDOWN_MT8192,
> +       }
> +};
> +
>  static const struct lvts_data mt8195_lvts_mcu_data =3D {
>         .lvts_ctrl      =3D mt8195_lvts_mcu_data_ctrl,
>         .num_lvts_ctrl  =3D ARRAY_SIZE(mt8195_lvts_mcu_data_ctrl),
> @@ -1290,9 +1373,21 @@ static const struct lvts_data mt8195_lvts_ap_data =
=3D {
>         .num_lvts_ctrl  =3D ARRAY_SIZE(mt8195_lvts_ap_data_ctrl),
>  };
>
> +static const struct lvts_data mt8192_lvts_mcu_data =3D {
> +       .lvts_ctrl      =3D mt8192_lvts_mcu_data_ctrl,
> +       .num_lvts_ctrl  =3D ARRAY_SIZE(mt8192_lvts_mcu_data_ctrl),
> +};
> +
> +static const struct lvts_data mt8192_lvts_ap_data =3D {
> +       .lvts_ctrl      =3D mt8192_lvts_ap_data_ctrl,
> +       .num_lvts_ctrl  =3D ARRAY_SIZE(mt8192_lvts_ap_data_ctrl),
> +};
> +
>  static const struct of_device_id lvts_of_match[] =3D {
>         { .compatible =3D "mediatek,mt8195-lvts-mcu", .data =3D &mt8195_l=
vts_mcu_data },
>         { .compatible =3D "mediatek,mt8195-lvts-ap", .data =3D &mt8195_lv=
ts_ap_data },
> +       { .compatible =3D "mediatek,mt8192-lvts-mcu", .data =3D &mt8192_l=
vts_mcu_data },
> +       { .compatible =3D "mediatek,mt8192-lvts-ap", .data =3D &mt8192_lv=
ts_ap_data },

Could you reorder everything so that they follow the order of the chip
model name? That includes the entries here, and the data structures above.
That would help with readability once this driver supports more chips.

ChenYu

>         {},
>  };
>  MODULE_DEVICE_TABLE(of, lvts_of_match);
> --
> 2.41.0.rc2
>

