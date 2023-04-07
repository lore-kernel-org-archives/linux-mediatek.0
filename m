Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 858DAC6FD1D
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Apr 2023 13:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ogQ5usDGrCKMp6sdTMfv6hF4yE9d0BXCPBRsX3VFOJg=; b=nbz9JerA3R3SrtPbzktAm20B5l
	sbgOJn1qMNtiEDaGLiR+E7hmGI8/F3gcErwQJ5C592wRxlcdo+dZnggpuANnH4YKpDD8VLfWsvpG0
	RhtDB7Tvqy7Iu/BW/xhaHXTos/AfYhQn2MtT+AxdUSr0vhqxsk1dD5Rw+yb/Ao6T1Kw5yW1FMFv+n
	vQpjQoM6sTWawrHvidX6DfkyCW989SXmy1ouhK0CXl/g6QSIwqsaOEKnQuq0k78vfp8Z8XtPvE52p
	haswy+NmCN45wTi8agfmLHkj9b9//w82KMd0YH5MD3o8mD80vXJv8LMbYiJFZb/qVr/Xx5XBAPYPn
	aPjY3dWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkltK-00AGFV-2a;
	Fri, 07 Apr 2023 13:12:34 +0000
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkltG-00AGDt-2w
	for linux-mediatek@lists.infradead.org;
	Fri, 07 Apr 2023 13:12:32 +0000
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-54c0dd7e2f3so88973187b3.8
        for <linux-mediatek@lists.infradead.org>; Fri, 07 Apr 2023 06:12:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1680873150; x=1683465150;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ogQ5usDGrCKMp6sdTMfv6hF4yE9d0BXCPBRsX3VFOJg=;
        b=P9gZnXO27CwpgcUfdKWvFIDMy/W3wouPPvS5NhKMlQ31/HlgFF6HmqZAW4LxrKdDm2
         MCSHoLXRiNShIve9a/IAvQ2YjsHF3NUtLutP+Qmhs+M5YaGP1dJu5AHhWqrp/B/LTnQf
         O5mEL7f7/cbD7pR3igsBtPcLMaSbFHoUAlAOTbIE/4j2CoWpjL7mrRh3Se61Aafz9k9H
         YjLK9sMIFV1yQkY5PsSntO4Y7X13C/RXAFiMnsC+tus+ViauzcfMB4IyaiZoJDqYBiZ1
         GbDdUY1PwLSY0mdkDv1eReYn/2IKX0kdWWPdwQchrLGIGJt2O9iAQ8eKfBIG43X6YCuS
         dz3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680873150; x=1683465150;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ogQ5usDGrCKMp6sdTMfv6hF4yE9d0BXCPBRsX3VFOJg=;
        b=iyJ5QzKQU3scWJkPJ+irSmDE3fZt0jLkDbQeahaiMNrsY7zpOOUJGRSGRGirFXBWoH
         IzuglbNUA8a3HpxLdo2l2Vxu56w8gubJ6pDyKcD/J8wNViKGwPoYjdFl1QTkZuSF112f
         P8ISWJPIo2n3IQqolKVouKBIQpdq29JR1banflyHPGsgDF/LsihNCgAocXxVyQZFaCiI
         JkbgN7N70vVgegC9635CAvXUZ6l6yZMhrpmcVGMz+GPKX47l0NBQ99GLD7HXKmW1LVYJ
         ennCPJfo4QoMCqF7/74ydknQEYV1l7ldciPPT1OPoijWSjmAR3PdEcDuzvKFQ6E97pE2
         zYNQ==
X-Gm-Message-State: AAQBX9dNA5PDnQCOiuXq6OC8btnadVjWdhFRgt76q9v4cKLL0sBS9jEI
	EuAESM/47TWuyAROb9LvbrGKxocrSUsG34A+jr2q1Q==
X-Google-Smtp-Source: AKy350a6iLgXjWlIFd9DThiMyVaE47Ir0ycsgta9477LJp6DoDsN83S7+YnAB9ANVsDi2u6A+bcIz6yJ9JbuVxehUZE=
X-Received: by 2002:a81:af65:0:b0:544:b864:5532 with SMTP id
 x37-20020a81af65000000b00544b8645532mr1033760ywj.3.1680873150121; Fri, 07 Apr
 2023 06:12:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230203-evk-board-support-v5-0-1883c1b405ad@baylibre.com> <20230203-evk-board-support-v5-5-1883c1b405ad@baylibre.com>
In-Reply-To: <20230203-evk-board-support-v5-5-1883c1b405ad@baylibre.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Fri, 7 Apr 2023 15:12:19 +0200
Message-ID: <CAFGrd9oKiyJE_313MEKLf_PeWreg8gs92Mntos1C13_B-m4Ykg@mail.gmail.com>
Subject: Re: [PATCH v5 05/12] arm64: dts: mediatek: add mt6357 PMIC support
 for mt8365-evk
To: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Chaotian Jing <chaotian.jing@mediatek.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Wenbin Mei <wenbin.mei@mediatek.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Zhiyong Tao <zhiyong.tao@mediatek.com>, =?UTF-8?Q?Bernhard_Rosenkr=C3=A4nzer?= <bero@baylibre.com>, 
	catalin.marinas@arm.com, Will Deacon <will@kernel.org>
Cc: linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-mmc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Alexandre Bailon <abailon@baylibre.com>, 
	Fabien Parent <fparent@baylibre.com>, Amjad Ouled-Ameur <aouledameur@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230407_061230_955219_F42827FC 
X-CRM114-Status: GOOD (  13.18  )
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

+ To: Catalin Marinas <catalin.marinas@arm.com>
+ To: Will Deacon <will@kernel.org>

Sorry for the noise.

Regards,
Alexandre

Le ven. 7 avr. 2023 =C3=A0 14:59, Alexandre Mergnat <amergnat@baylibre.com>=
 a =C3=A9crit :
>
> This power management system chip integration helps to manage regulators
> and keys.
>
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>  arch/arm64/boot/dts/mediatek/mt8365-evk.dts | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts b/arch/arm64/boo=
t/dts/mediatek/mt8365-evk.dts
> index dd7da86420cf..a238bd0092d2 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
> @@ -12,6 +12,7 @@
>  #include <dt-bindings/input/input.h>
>  #include <dt-bindings/pinctrl/mt8365-pinfunc.h>
>  #include "mt8365.dtsi"
> +#include "mt6357.dtsi"
>
>  / {
>         model =3D "MediaTek MT8365 Open Platform EVK";
> @@ -94,6 +95,12 @@ &i2c0 {
>         status =3D "okay";
>  };
>
> +&mt6357_pmic {
> +       interrupts-extended =3D <&pio 145 IRQ_TYPE_LEVEL_HIGH>;
> +       interrupt-controller;
> +       #interrupt-cells =3D <2>;
> +};
> +
>  &pio {
>         gpio_keys: gpio-keys-pins {
>                 pins {
>
> --
> 2.25.1
>

