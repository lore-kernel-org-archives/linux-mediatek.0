Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4898CD5BD1
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Jun 2026 16:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zCciMA4f/2leknE0hevkJM9c0pFZpflJQvPHBF72s8k=; b=DGtu6SHq3aGsTQrdiqCx0tToBT
	3OzY4ABGECEsmw1pmATpkeomB/yaj07Pa84QnCSa0WPbxKnlBB9eJglo/+E7GMYt7MuvEEdJNTw8z
	q5025UE6QPnPq4ADjV9wpkPCXy/4vHc6usoYPYuGnfyO9Z3cmzjCCF7vwBJbKL8KKMxKYiFLs2Tc+
	rQ8bo/6F919YwayEYqhhpLbaUWHE4Psm07kQ5fo+t8yIITZcizfnhkXpCHcgbUmgMHJSEePtkVNBw
	CRfXsx+FRjfz3PvsghOiRswuzfasC/+qloDquaHYzFx80GP5sqHaHa4taZU+S2gn8YXJXDVlrTgvI
	w5xKeb5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUSC3-0000000DTqX-35zO;
	Tue, 02 Jun 2026 16:42:19 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUSC0-0000000DTpG-44n9
	for linux-mediatek@lists.infradead.org;
	Tue, 02 Jun 2026 16:42:18 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-490aebf33e9so11777545e9.3
        for <linux-mediatek@lists.infradead.org>; Tue, 02 Jun 2026 09:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780418535; x=1781023335; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=zCciMA4f/2leknE0hevkJM9c0pFZpflJQvPHBF72s8k=;
        b=mIGaP6OVZBfmiZFwdeI1+KFwbhWPuqQkBBRjhSp3i0BCGSKck3thxRG87m8xcV6ifP
         Kp5HzbqGQ/BGu5xSJK0BHVShw1tKAR2lWsTGo03vyNq3mKCDNhHW8c3mNm0tEJSAgdjT
         TxrRypBaZxCh9CEb7eqGlRw5A+gRsuC1GC1Vr2SPc7QcFub0s0XenGS5rAs4aC1sqdFu
         CeIS21Rv4sdJIg/WiJSnA/lDIvPfh+QbZ9U7ncTd96o0CPEFn/Spy/R+RSatiFZyDsqb
         ZssNVtap+Ht6N/zeaaHyZKdO0J8CM+HvnG3SMuS2P2qUucRi3RPzSlV5KrufEm6Rm1Jn
         q2aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780418535; x=1781023335;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zCciMA4f/2leknE0hevkJM9c0pFZpflJQvPHBF72s8k=;
        b=S1Op5uuUM/o6/P3DUhY65pCZfXEK+KK+9Z5fFil95NN5PmuHnfKXrkCuYW210bZHXU
         6UPITmty4dJu+0SgEf5Rhfy+eY21i3gQapu13Na4AM0oDb/ympeLoXx8G+0td6ltHbmY
         ijYr+s92yPSo4+KAPtu7JUsqnrUb69ZQsRgtC/Ile3DFbnhj3t4e9bdAAS2UR8sIWGL5
         +CnPxfedq5kKQvCHsG6aSSpni3rQHQbdf1iytxAXtg7vDOWsizlgkbC0sa0obSqN1S59
         jHae55CKs0xs+USJsH6BE4olQkNo+ZniO0iCof6j6Ey+4XoTjUMiPhEcIZJe45fgw+c3
         fL7Q==
X-Forwarded-Encrypted: i=1; AFNElJ/okQkKS3iv2FrKTgnAlbvR/z8WLJTqov9U/nZOhMJHrSl16Xku/WhV08/XHC5f0RLeTmV+kaT615XSj/GdUA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwhUDWdysHz5DxP7wl/8HNNe3QO+f0IzhnWhFFMXekDF9mZHZuJ
	AwGlBMi21ANh43mnGa0TELWlIFRxL2lM08jXY5Y1dcOeyql2Ef2ASk2S
X-Gm-Gg: Acq92OGbqD/O//FPZ2alCGAWMjIjyDmfSzaHdd99tpDF8YSqWpaJXZJhbUVrZBaoMXz
	jMis5VQcIXjVpRUnt5Bcja60CjRHBbSDzFqChbE6P7+4eMjywHjHNhNP87IbhNBae8AaqU8MYIE
	Qbfcj8l8rJBAXAWvT3CQOMhMKFRQ4KV/HP5+Loxw3i+mz4W3Ov53m8hRBPWo6q5g3tEpFKMcog3
	+aBY+iY3qElYQ0Tr89yA4reqCW5A2m2Skpqnx/ZIE+qaLQKDqz3GsuO3X2G3SN0E74Po+Ath7P3
	mOzrP18duvXyRqhGqgUntqrnBW35s+CoqBxiEpjD3c+N3tAyF+r0JheE94vcU/N2aqXvxXyo9KT
	6aXufLJWh4X+5vHhQihct5oTRyZ/E+4D6KpRpTUlIidkmSiTfRoiBf3WEisdzHRt8fYmnkmMPVB
	Ae9r8HM0VddJNSTUAYgC3tun/lJBrFhuZ4NNpks7OlrJMaWfG1iPef2YofHSR2qcxMnn5b/KYl6
	eZVJQQ1ZdRxcNdzVNXuzQ4=
X-Received: by 2002:a05:600c:35c9:b0:490:3d62:f5e1 with SMTP id 5b1f17b1804b1-490b50b972amr8330945e9.22.1780418534540;
        Tue, 02 Jun 2026 09:42:14 -0700 (PDT)
Received: from ?IPv6:2001:818:ea56:d000:56e0:ceba:7da4:6673? ([2001:818:ea56:d000:56e0:ceba:7da4:6673])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b0e20bacsm74368025e9.6.2026.06.02.09.42.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 09:42:14 -0700 (PDT)
Message-ID: <2df4cad5e29fbcb4c5c5f59ea0bf322c7a301bdc.camel@gmail.com>
Subject: Re: [PATCH 2/4] iio: adc: mt6323-auxadc: add mt6323 PMIC AUXADC
 driver
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: rva333@protonmail.com, Jonathan Cameron <jic23@kernel.org>, David
 Lechner	 <dlechner@baylibre.com>, Nuno =?ISO-8859-1?Q?S=E1?=
 <nuno.sa@analog.com>,  Andy Shevchenko	 <andy@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger	 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno	 <angelogioacchino.delregno@collabora.com>, Lee
 Jones <lee@kernel.org>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, Ben Grisdale <bengris32@protonmail.ch>
Date: Tue, 02 Jun 2026 17:43:18 +0100
In-Reply-To: <20260602-mt6323-adc-v1-2-68ec737508ee@protonmail.com>
References: <20260602-mt6323-adc-v1-0-68ec737508ee@protonmail.com>
	 <20260602-mt6323-adc-v1-2-68ec737508ee@protonmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_094217_037938_5A14455A 
X-CRM114-Status: GOOD (  22.26  )
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

On Tue, 2026-06-02 at 15:46 +0300, Roman Vivchar via B4 Relay wrote:
> From: Roman Vivchar <rva333@protonmail.com>
>=20
> The mt6323 AUXADC is a 15-bit ADC used for system monitoring. This driver
> provides support for reading various channels including battery and
> charger voltages, battery and chip temperature, current sensing and
> accessory detection.
>=20
> Add a driver for the AUXADC found in the MediaTek mt6323 PMIC.
>=20
> Tested-by: Ben Grisdale <bengris32@protonmail.ch> # Amazon Echo Dot (2nd
> Generation)
> Signed-off-by: Roman Vivchar <rva333@protonmail.com>
> ---
> =C2=A0MAINTAINERS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=
=C2=A0 8 ++
> =C2=A0drivers/iio/adc/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0 11 ++
> =C2=A0drivers/iio/adc/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
|=C2=A0=C2=A0 1 +
> =C2=A0drivers/iio/adc/mt6323-auxadc.c | 299 +++++++++++++++++++++++++++++=
+++++++++++
> =C2=A04 files changed, 319 insertions(+)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index d1cc0e12fe1f..c9ad2417a3ef 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -16256,6 +16256,14 @@ S:	Maintained
> =C2=A0F:	Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> =C2=A0F:	drivers/mmc/host/mtk-sd.c
> =C2=A0
> +MEDIATEK MT6323 PMIC AUXADC DRIVER
> +M:	Roman Vivchar <rva333@protonmail.com>
> +L:	linux-iio@vger.kernel.org
> +L:	linux-mediatek@lists.infradead.org=C2=A0(moderated for non-subscriber=
s)
> +S:	Maintained
> +F:	drivers/iio/adc/mt6323-auxadc.c
> +F:	include/dt-bindings/iio/adc/mediatek,mt6323-auxadc.h

The above file was not added in this patch

...

> +
> +static const struct iio_chan_spec mt6323_auxadc_channels[] =3D {
> +	MTK_PMIC_IIO_CHAN(baton2,=C2=A0=C2=A0=C2=A0 MT6323_AUXADC_BATON2,=C2=A0=
=C2=A0=C2=A0 MT6323_AUXADC_ADC6,=C2=A0
> IIO_VOLTAGE),
> +	MTK_PMIC_IIO_CHAN(ch6,=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 MT6323_AUXAD=
C_CH6,=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 MT6323_AUXADC_ADC11,
> IIO_VOLTAGE),
> +	MTK_PMIC_IIO_CHAN(bat_temp,=C2=A0 MT6323_AUXADC_BAT_TEMP,=C2=A0 MT6323_=
AUXADC_ADC5,=C2=A0
> IIO_VOLTAGE),
> +	MTK_PMIC_IIO_CHAN(chip_temp, MT6323_AUXADC_CHIP_TEMP, MT6323_AUXADC_ADC=
4,=C2=A0
> IIO_VOLTAGE),
> +	MTK_PMIC_IIO_CHAN(vcdt,=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 MT6323_AUXADC_VCD=
T,=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 MT6323_AUXADC_ADC2,=C2=A0
> IIO_VOLTAGE),
> +	MTK_PMIC_IIO_CHAN(baton1,=C2=A0=C2=A0=C2=A0 MT6323_AUXADC_BATON1,=C2=A0=
=C2=A0=C2=A0 MT6323_AUXADC_ADC3,=C2=A0
> IIO_VOLTAGE),
> +	MTK_PMIC_IIO_CHAN(isense,=C2=A0=C2=A0=C2=A0 MT6323_AUXADC_ISENSE,=C2=A0=
=C2=A0=C2=A0 MT6323_AUXADC_ADC1,=C2=A0
> IIO_VOLTAGE),
> +	MTK_PMIC_IIO_CHAN(batsns,=C2=A0=C2=A0=C2=A0 MT6323_AUXADC_BATSNS,=C2=A0=
=C2=A0=C2=A0 MT6323_AUXADC_ADC0,=C2=A0
> IIO_VOLTAGE),
> +	MTK_PMIC_IIO_CHAN(accdet,=C2=A0=C2=A0=C2=A0 MT6323_AUXADC_ACCDET,=C2=A0=
=C2=A0=C2=A0 MT6323_AUXADC_ADC7,=C2=A0
> IIO_VOLTAGE),
> +};

All of the above are IIO_VOLTAGE. Just remove _ch_type then.

> +
> +/**
> + * struct mt6323_auxadc - Main driver structure
> + * @regmap:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Regmap from PWRAP
> + * @lock:=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Mutex to=
 serialize AUXADC reading vs configuration
> + *
> + * The MediaTek MT6323 (as well as a lot of other PMICs) has the followi=
ng
> hierarchy:
> + * PMIC AUXADC <- PMIC MFD <- SoC PWRAP (wrapper for PWRAP FSM)
> + *
> + * Therefore, PWRAP regmap should be obtained using dev->parent->parent.
> + */

The above kerneldoc seems unnecessary to me.

> +struct mt6323_auxadc {
> +	struct regmap *regmap;
> +	struct mutex lock;
> +};

...

>=20
> +
> +static int mt6323_auxadc_read_raw(struct iio_dev *indio_dev,
> +				=C2=A0 const struct iio_chan_spec *chan,
> +				=C2=A0 int *val, int *val2, long mask)
> +{
> +	struct mt6323_auxadc *auxadc =3D iio_priv(indio_dev);
> +	int ret, mult;
> +
> +	switch (mask) {
> +	case IIO_CHAN_INFO_SCALE:
> +		if (chan->channel =3D=3D MT6323_AUXADC_ISENSE ||
> +		=C2=A0=C2=A0=C2=A0 chan->channel =3D=3D MT6323_AUXADC_BATSNS)
> +			mult =3D 4;
> +		else
> +			mult =3D 1;
> +
> +		/* 1800mV full range with 15-bit resolution. */
> +		*val =3D mult * 1800;
> +		*val2 =3D 15;
> +
> +		return IIO_VAL_FRACTIONAL_LOG2;
> +	case IIO_CHAN_INFO_RAW:
> +		scoped_guard(mutex, &auxadc->lock) {
> +			ret =3D mt6323_auxadc_prepare_channel(auxadc);
> +			if (ret)
> +				return ret;
> +
> +			ret =3D mt6323_auxadc_request(auxadc, chan->channel);
> +			if (ret)
> +				return ret;
> +
> +			/* Hardware limitation: the AUXADC needs a delay to become
> ready. */
> +			fsleep(300);
> +
> +			ret =3D mt6323_auxadc_read(auxadc, chan, val);
> +			if (ret)
> +				return ret;

Could be return mt6323_auxadc_read(...)

- Nuno S=C3=A1
>=20
> +
> +MODULE_LICENSE("GPL");
> +MODULE_DESCRIPTION("MediaTek MT6323 PMIC AUXADC Driver");

