Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC6CECD128A
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Apr 2024 16:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NKWbmnv6SxDP9tlVgHINWCDu40XftNmGokOibIuXS38=; b=utvQU4UlIILo8AdZSwIz5hVnu7
	VvBpuiPvYlJUJI4XgjosvYc8dH+R7DPfcd2UuHAwfGv2xFUQWGCuXMYcRx9wz/b3zAoD08RLvi4b+
	Wo4DGzLyXYDKr9dEusV00kUC7rlxjqHMwB29hMiZu+sNTKUdj19NCxbDOzEIwR8ByYw4pKudfcZH7
	aRQdlPEE1QFOZAGarlnz7FqcSQxtOF+OFKIbN3as6xTTl3J4gOvBVJJHjqeq6lRa6csQ6+lWtC1lV
	1Ho5P7WebJdjR1ZkqSGShrRrU739B9uWtMS/JXfhVFJxUbrwjkaAIf0ZsuHVPmSgJ66krJVrckcfQ
	IiFqifVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruaNR-00000007vVy-1M4P;
	Wed, 10 Apr 2024 16:00:45 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruaNN-00000007vUq-2Te3;
	Wed, 10 Apr 2024 16:00:42 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-5171a529224so4265283e87.0;
        Wed, 10 Apr 2024 09:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712764839; x=1713369639; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NKWbmnv6SxDP9tlVgHINWCDu40XftNmGokOibIuXS38=;
        b=RN6RCuDF12KdcSZ0NhyIAZElnd+KEvRSvCoXmVSjrQ51Zt12QkL78Ncvvmm2ocK0+3
         foMEz++vXcnEacpGSEJOKoQ2E7XAQPb8ctw0lys3s0vGtBlG7cQXqZlo8/wqZ32TU1Xi
         xkFzV3Qox2PCqfpw3WZ7XfglCJrIHhC/iIXjm47j1US6kZ8DAH/y6/UOW7OsXclWxayp
         r8qLrK+FnwWZwAsqxHIRT3dSE0OYTfez11YzeRvC5KFszUld03hHDvF9LbHBuenm6sNb
         HzbuCd0IGbFK9vWVVuVwHmUj+IKnoI55JFjKN4KtvwiR3uOAqIzsG3dTSZnO76tGFcfe
         Py5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712764839; x=1713369639;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NKWbmnv6SxDP9tlVgHINWCDu40XftNmGokOibIuXS38=;
        b=JbOSpOBkRIEoiY7KPtDDjQoxaSeipg3YNqvWNzyW8j1NpiiWsglIG0ITBva38xJXSo
         brJZFSq3YTnCMPQLRdWy9mEbrUSMtWx/vyWD8FR7iyguJzRFESqNLCLe8ZTPUp4Tijl8
         FvADmTTf/XCsEu0+/C2I0Z+448spf1N+V5ZmCaZdSQoJ9UvE3ACfVcubPw6V1Su2dhkI
         tm5af2qTzH6Mm1a6JGdsSJ2xdKrLfUYj62UJfA4vK9M3RJjhFEns3wK2YoemYuc+yZ2D
         C+Cg+auCCQOq7qf/ANN383iD/uHmsWsg/BlUnJJU2704ZmnZGsIQCdpCB35F1N9XztfD
         8tfw==
X-Forwarded-Encrypted: i=1; AJvYcCXQKVKl3sn4Aip6OJFIlpR4QVGTI1AufBRzy6L5MlB7IHIMJ1FGpnlY/opL01/vl+N4GuJuiP14LdpX53EV3NG3VDjCAEPLH+zobwxF6zHGEp5O5ju+rY8Akaij5CgfBKcZQ/411JChz/12WzLsd2Mio9g6v87KB8o=
X-Gm-Message-State: AOJu0YwI80UqnUdcui/wBoX0AIwaa3lCCJe9LowxXNjXWZC8qI6Wa3Ot
	rMw2wrv9Y9zr/i0nf5YvqvYH0YEZFEMgXfdfxknuj2rmwvlcllUKlHBp4LWwSsUGoSMK/S/IWTv
	c9cKlztwqxcVSpMGHnPZXLSsHptU=
X-Google-Smtp-Source: AGHT+IGSHnOK96vFCJZzvUgQ3k6lZ3ILiLB0lx+xPZ8yyAfCfIUY48DwUBLftgt9NPbhHq8s1QzITneytfpnGjLKsOE=
X-Received: by 2002:ac2:59c1:0:b0:515:c190:140f with SMTP id
 x1-20020ac259c1000000b00515c190140fmr1842452lfn.14.1712764838860; Wed, 10 Apr
 2024 09:00:38 -0700 (PDT)
MIME-Version: 1.0
References: <20240410104002.1197-1-zhi.mao@mediatek.com> <20240410104002.1197-3-zhi.mao@mediatek.com>
In-Reply-To: <20240410104002.1197-3-zhi.mao@mediatek.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 10 Apr 2024 19:00:02 +0300
Message-ID: <CAHp75VfF0pbrKXjWZg7sTr-T=_CbjP+deFQP-VLCGX8ooahctg@mail.gmail.com>
Subject: Re: [PATCH 2/2] media: i2c: Add GT97xx VCM driver
To: Zhi Mao <zhi.mao@mediatek.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Heiko Stuebner <heiko@sntech.de>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Hans Verkuil <hverkuil-cisco@xs4all.nl>, Hans de Goede <hdegoede@redhat.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Alain Volmat <alain.volmat@foss.st.com>, 
	Paul Elder <paul.elder@ideasonboard.com>, Mehdi Djait <mehdi.djait@bootlin.com>, 
	Bingbu Cao <bingbu.cao@intel.com>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	shengnan.wang@mediatek.com, yaya.chang@mediatek.com, yunkec@chromium.org, 
	10572168@qq.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_090041_663186_E177AF0A 
X-CRM114-Status: GOOD (  20.21  )
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

On Wed, Apr 10, 2024 at 1:40=E2=80=AFPM Zhi Mao <zhi.mao@mediatek.com> wrot=
e:
>
> Add a V4L2 sub-device driver for Giantec GT97xx VCM.

...

> +/*
> + * Ring control and Power control register
> + * Bit[1] RING_EN
> + * 0: Direct mode
> + * 1: AAC mode (ringing control mode)
> + * Bit[0] PD
> + * 0: Normal operation mode
> + * 1: Power down mode
> + * gt97xx requires waiting time of Topr after PD reset takes place.
> + */
> +#define GT97XX_RING_PD_CONTROL_REG CCI_REG8(0x02)

> +#define GT97XX_PD_MODE_OFF 0x00

Okay, this seems to be bitmapped, but do you really need to have this
separate definition?

> +#define GT97XX_PD_MODE_EN BIT(0)
> +#define GT97XX_AAC_MODE_EN BIT(1)

...

> +#define GT97XX_TVIB_MS_BASE10 (64 - 1)

Should it be (BIT(6) - 1) ?

...

> +#define GT97XX_AAC_MODE_DEFAULT 2
> +#define GT97XX_AAC_TIME_DEFAULT 0x20

Some are decimal, some are hexadecimal, but look to me like bitfields.

...

> +#define GT97XX_MAX_FOCUS_POS (1024 - 1)

(BIT(10) - 1) ?

...

> +enum vcm_giantec_reg_desc {
> +       GT_IC_INFO_REG,
> +       GT_RING_PD_CONTROL_REG,
> +       GT_MSB_ADDR_REG,
> +       GT_AAC_PRESC_REG,
> +       GT_AAC_TIME_REG,

> +       GT_MAX_REG,

No comma for the terminator.

> +};

...

> +static u32 gt97xx_find_ot_multi(u32 aac_mode_param)
> +{
> +       u32 cur_ot_multi_base100 =3D 70;
> +       unsigned int i;
> +
> +       for (i =3D 0; i < ARRAY_SIZE(aac_mode_ot_multi); i++) {
> +               if (aac_mode_ot_multi[i].aac_mode_enum =3D=3D aac_mode_pa=
ram) {
> +                       cur_ot_multi_base100 =3D
> +                               aac_mode_ot_multi[i].ot_multi_base100;
> +               }

No break / return here?

> +       }
> +
> +       return cur_ot_multi_base100;
> +}
> +
> +static u32 gt97xx_find_dividing_rate(u32 presc_param)

Same comments as per above function.

...

> +static inline u32 gt97xx_cal_move_delay(u32 aac_mode_param, u32 presc_pa=
ram,
> +                                       u32 aac_timing_param)

Why inline?

...

> +       return tvib_us * ot_multi_base100 / 100;

HECTO ?

...

> +       val =3D ((unsigned char)read_val & ~mask) | (val & mask);

Why casting?

...

> +static int gt97xx_power_on(struct device *dev)
> +{
> +       struct v4l2_subdev *sd =3D dev_get_drvdata(dev);
> +       struct gt97xx *gt97xx =3D sd_to_gt97xx(sd);
> +       int ret;
> +
> +       ret =3D regulator_bulk_enable(ARRAY_SIZE(gt97xx_supply_names),
> +                                   gt97xx->supplies);
> +       if (ret < 0) {
> +               dev_err(dev, "failed to enable regulators\n");

> +               return ret;

Dup.

> +       }
> +
> +       return ret;
> +}
> +
> +static int gt97xx_power_off(struct device *dev)
> +{
> +       struct v4l2_subdev *sd =3D dev_get_drvdata(dev);
> +       struct gt97xx *gt97xx =3D sd_to_gt97xx(sd);
> +       int ret;
> +
> +       ret =3D regulator_bulk_disable(ARRAY_SIZE(gt97xx_supply_names),
> +                                    gt97xx->supplies);
> +       if (ret < 0) {
> +               dev_err(dev, "failed to disable regulators\n");

> +               return ret;

Ditto.

> +       }
> +
> +       return ret;
> +}

...

> +static int gt97xx_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh=
)
> +{
> +       return pm_runtime_resume_and_get(sd->dev);
> +}
> +
> +static int gt97xx_close(struct v4l2_subdev *sd, struct v4l2_subdev_fh *f=
h)
> +{
> +       return pm_runtime_put(sd->dev);
> +}

Hmm... Shouldn't v4l2 take care about these (PM calls)?

...

> +       gt97xx->chip =3D of_device_get_match_data(dev);

device_get_match_data()

...

> +       fwnode_property_read_u32(dev_fwnode(dev), "giantec,aac-mode",
> +                                &gt97xx->aac_mode);

No, use device_property_read_u32() directly.

...

> +       fwnode_property_read_u32(dev_fwnode(dev), "giantec,clock-presc",
> +                                &gt97xx->clock_presc);

Ditto.

...

> +       fwnode_property_read_u32(dev_fwnode(dev), "giantec,aac-timing",
> +                                &gt97xx->aac_timing);

Ditto.

...

> +       /*power on and Initialize hw*/

Missing spaces (and capitalisation?).

...

> +       ret =3D gt97xx_runtime_resume(dev);
> +       if (ret < 0) {
> +               dev_err(dev, "failed to power on: %d\n", ret);

Use dev_err_probe() to match the style of the messages.

> +               goto err_clean_entity;
> +       }

...

> +       ret =3D v4l2_async_register_subdev(&gt97xx->sd);
> +       if (ret < 0) {
> +               dev_err(dev, "failed to register V4L2 subdev: %d", ret);

Ditto.

> +               goto err_power_off;
> +       }

--
With Best Regards,
Andy Shevchenko

