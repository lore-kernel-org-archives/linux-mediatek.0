Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDB4AC4345F
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 May 2024 09:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IAWzFtfBZwMQoHv84/W+JImIB5vAq9WxgZXxmYPg6EU=; b=zgdRiJqMtho74g1xwHb8G0pjDl
	8qHzmFi/kLYAlNl5hTMTWTWo5qJMY66U13Fk+3akydeeWaVUDSTezqPkR+Uu886eQTtGJizZ6Y0Dr
	JKGaQK/1WeB6jTu6Gtwmrv1hAtNVEaid6qhybsyxqax/lJ7p21JH8WagFWKD2ZfLaHp91ad0ss64g
	B3L5hx7jQtGl7J3yaxB2vSshZTvFsSgY2Dyjt/Op5UavNg1i2M/yzdjyFdYFfoe1vkMcRFqS2TRtC
	DrTmBc6BDJhOsUhXWHu5BOdcT7+ASb5adLI0S8/JDP+nVRSmqQPLC8uNGy391MAn/U5IdBetLvSov
	hZeESBmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2TE8-0000000CFDK-1Ksh;
	Thu, 02 May 2024 09:59:44 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2TE4-0000000CFCT-3h1m
	for linux-mediatek@lists.infradead.org;
	Thu, 02 May 2024 09:59:42 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-5196c755e82so9576583e87.0
        for <linux-mediatek@lists.infradead.org>; Thu, 02 May 2024 02:59:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1714643979; x=1715248779; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IAWzFtfBZwMQoHv84/W+JImIB5vAq9WxgZXxmYPg6EU=;
        b=e3dktvYAsxqzlIQmVAxrJLwrgZZRMKYC7sa6c7+11Pn588/yjbTS0Lp/RkMW1ww35T
         3jgPcn4aQxI5/259N0IvuxNaa1hAwboJXlXxv0NMP4o8fXjmZMuMNpDau0orNG54XcU8
         UNcZfYqBGNAtwgpUi72w4ZC65XX1GK/PozmGY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714643979; x=1715248779;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IAWzFtfBZwMQoHv84/W+JImIB5vAq9WxgZXxmYPg6EU=;
        b=FOTLTbuPBNVrzH0e2Uy5CKN03PZ2isnqaEdz4rgQE4s0Yd9x3/eo5ZpgZHaicYwa/Y
         YQjJMnWlSNRX/kMazuiVMZ2X5Us6LnQDclmk2KeCj7q0aIhyL4osF2PZ1FulnV/ogsBv
         CbPG2c+SgV0QqdlmMW18y7cjNWoSOaddcfLFM9sB8H0Q2vHx4mbUGMqgs/z4RC+8pFRJ
         n5fVcHH2Q0kYiumjxYSiLK1/NUczAkfvj2HrZ0PRpGdguUZiANFXnTKMP72lH6fioTK4
         kVhu7obD/ZHv5+0Kapdl69WsM/+0QOq/kCXjgl6LloLvvzRLaa7yWiaRYJbXG0PRA2Z7
         wlSQ==
X-Forwarded-Encrypted: i=1; AJvYcCVepUDOYw/COiW96XWvB97fDAkm+nb4RWF9O+fIPqaBY80HH66K4Vq8FfaGGTQrwLoGs5k8mwxy7jKTlIJzNRj/YZmk8Uy+CuAA8+hQZwhHlzNX
X-Gm-Message-State: AOJu0YzSqzkheUdXlw4Ueq4JonzT8xbZiPUnHNcgQLgqBy3dmXLiqkdX
	835i/GoqT0VlcjKJtUzUW0VNeJ2eaubWzlJdOUSMNtOeQpGZmRmJ4OlEw6Zt/zQ4UC6S13qy0ks
	HDHen7lgwckAiXKD0Bws9ll9wsNVAplT1CTfE
X-Google-Smtp-Source: AGHT+IEGkMy9wnAsRv/sjRzs/mP6zDLzjdxZZenS550ahLeLjpaIxqNlXTywDzD62yFQysa3FGIxwKwuDOr1BNgiH+Q=
X-Received: by 2002:a05:6512:3c87:b0:51c:cd8d:2865 with SMTP id
 h7-20020a0565123c8700b0051ccd8d2865mr4075910lfv.44.1714643978564; Thu, 02 May
 2024 02:59:38 -0700 (PDT)
MIME-Version: 1.0
References: <20240416071410.75620-1-angelogioacchino.delregno@collabora.com> <20240416071410.75620-19-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240416071410.75620-19-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 2 May 2024 17:59:27 +0800
Message-ID: <CAGXv+5GddLeYr-CZBFUcpUMR_NV0=0fu6Qp71hvKO6tJdJjF6w@mail.gmail.com>
Subject: Re: [PATCH v5 18/18] arm64: dts: mediatek: mt8186-corsola: Specify
 sound DAI links and routing
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, robh@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
	matthias.bgg@gmail.com, perex@perex.cz, tiwai@suse.com, 
	trevor.wu@mediatek.com, maso.huang@mediatek.com, 
	xiazhengqiao@huaqin.corp-partner.google.com, arnd@arndb.de, 
	kuninori.morimoto.gx@renesas.com, shraash@google.com, amergnat@baylibre.com, 
	nicolas.ferre@microchip.com, u.kleine-koenig@pengutronix.de, 
	dianders@chromium.org, frank.li@vivo.com, allen-kh.cheng@mediatek.com, 
	eugen.hristev@collabora.com, claudiu.beznea@tuxon.dev, 
	jarkko.nikula@bitmer.com, jiaxin.yu@mediatek.com, alpernebiyasak@gmail.com, 
	ckeepax@opensource.cirrus.com, zhourui@huaqin.corp-partner.google.com, 
	nfraprado@collabora.com, alsa-devel@alsa-project.org, 
	shane.chien@mediatek.com, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240502_025941_148209_15C728CD 
X-CRM114-Status: GOOD (  15.99  )
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

On Tue, Apr 16, 2024 at 3:15=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> The drivers and bindings acquired support for specifying audio hardware
> and links in device tree: describe and link the sound related HW of this
> machine.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>  .../boot/dts/mediatek/mt8186-corsola.dtsi     | 42 ++++++++++++++++---
>  1 file changed, 37 insertions(+), 5 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi b/arch/arm6=
4/boot/dts/mediatek/mt8186-corsola.dtsi
> index 1807e9d6cb0e..afdab5724eaa 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi
> @@ -42,7 +42,7 @@ backlight_lcd0: backlight-lcd0 {
>                 default-brightness-level =3D <576>;
>         };
>
> -       bt-sco-codec {
> +       bt-sco {

I remember changing this node from "bt-sco" to "bt-sco-codec" because
of a review comment when I submitted the Corsola dts series.

>                 compatible =3D "linux,bt-sco";
>                 #sound-dai-cells =3D <0>;
>         };
> @@ -223,12 +223,44 @@ sound: sound {
>                 mediatek,adsp =3D <&adsp>;
>                 mediatek,platform =3D <&afe>;
>
> -               playback-codecs {
> -                       sound-dai =3D <&it6505dptx>, <&rt1019p>;
> +               audio-routing =3D
> +                       "Headphone", "HPOL",
> +                       "Headphone", "HPOR",
> +                       "IN1P", "Headset Mic",
> +                       "Speakers", "Speaker",
> +                       "HDMI1", "TX";
> +
> +               hs-playback-dai-link {
> +                       link-name =3D "I2S0";
> +                       dai-format =3D "i2s";
> +                       mediatek,clk-provider =3D "cpu";
> +                       codec {
> +                               sound-dai =3D <&rt5682s 0>;
> +                       };
> +               };
> +
> +               hs-capture-dai-link {
> +                       link-name =3D "I2S1";
> +                       dai-format =3D "i2s";
> +                       mediatek,clk-provider =3D "cpu";
> +                       codec {
> +                               sound-dai =3D <&rt5682s 0>;
> +                       };
>                 };
>
> -               headset-codec {
> -                       sound-dai =3D <&rt5682s 0>;
> +               spk-share-dai-link {
> +                       link-name =3D "I2S2";
> +                       mediatek,clk-provider =3D "cpu";
> +               };
> +
> +               spk-hdmi-playback-dai-link {
> +                       link-name =3D "I2S3";
> +                       dai-format =3D "i2s";
> +                       mediatek,clk-provider =3D "cpu";
> +                       /* RT1019P and IT6505 connected to the same I2S l=
ine */
> +                       codec {
> +                               sound-dai =3D <&it6505dptx>, <&rt1019p>;
> +                       };
>                 };
>         };
>
> --
> 2.44.0
>

