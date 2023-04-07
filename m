Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08344C6FD1D
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Apr 2023 13:13:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bf5pLslbtdeYLIBav9Q4n1LWSY2rIYqcHA2Pww/eWJg=; b=4VQuVqicqnFIi4x+CJAagbihuE
	5j+YDVPnLv2Y9cGW5FRze+QH3wr0PaelVJV0391XkybLxdLMHeMtxZZtxF41Lz+eDw88Tkx+svNv/
	kifavx7JPIYO+Mc7XGLTaecC5QA3ea24CRtdjW5N1uiwwlR2DVFQWlpX/r7RZPks+WH4ms1jbmUZg
	sBnyo+S5DzRgpy61EhLDbMgXyp/Xv/Pb4lmz1+fxmdRKbL2MqJlLOCDmo6hIN6RAxBaCyDS78WZDl
	LBeM1drgHACJ8VxlZYGVqLfvjLMsNSEx19V52LRzz42WIeJU2Uv4km6vM4vdxkMlatBpbkdHL1k4t
	gfVOZcDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkluM-00AGkU-1j;
	Fri, 07 Apr 2023 13:13:38 +0000
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkluG-00AGh6-2f
	for linux-mediatek@lists.infradead.org;
	Fri, 07 Apr 2023 13:13:35 +0000
Received: by mail-yb1-xb29.google.com with SMTP id cf7so48980633ybb.5
        for <linux-mediatek@lists.infradead.org>; Fri, 07 Apr 2023 06:13:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1680873212; x=1683465212;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bf5pLslbtdeYLIBav9Q4n1LWSY2rIYqcHA2Pww/eWJg=;
        b=aIWXZD8qO6c8F/XQe/9bJTSOdBP5zW1qOfbX3BkKFerdWseMYXJG419xOdGmj4qkcF
         BQfI2Fp7/QVleMlEAubkIWeUqdzJiYV2o+6csPe9Gwl8zT2qRlw9mEqyMaAJ7rRBbiWD
         CiX53X2W7iUg09VfMnqPTx0eyhNpzfepcZWUVFIER+HWR+ntkGWv6BCnCBdqDUcpX5Ky
         hRD5NvGJC2BHTcnBpFSTWkqu8pfHEYRTXkOMOQSSID921xZxZcius+5YXiDRcwLPB3If
         l0b8gA7AH6vsLLj/6FI9VGgrGvWfBt+LFbQgqQoW3O+Zs6K38+moqFRo/VwMt3FpSaZw
         M+wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680873212; x=1683465212;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bf5pLslbtdeYLIBav9Q4n1LWSY2rIYqcHA2Pww/eWJg=;
        b=1zseFlU4rqyA3gJwQnkrEB4u3zDcB1ZjW0W1sJYBHjWDfJG0yfJiXbQn/hYZbfLDLB
         Y2/ZxUu3w5O3AxSG6mRn4oyNtuxqJULeqN30UDhNe/TO7iE7Eej8bTR3KE+pIm2HkPTj
         Hu5fIeq90oh92w/onbm8A0eQkuE9hcDANBngg7iWtLJQEG+C673v62JwbL/YN7IS4x5j
         t9fWI+lQoRNgCIsRogVxE0Z3KDotEk69ZjCCmSkaijjaLt107+Bk5GUOv/LRZljomSRi
         IAvxksovbLa1vcPCoGYMD7FjYjXOk3mQ24F2uzOjrnDW6ZOE+qeMxJ8i78HE1Yxns0pS
         KZdQ==
X-Gm-Message-State: AAQBX9eweePHOBvVf97zOuuFg1CyyqslMjTDsVqr0544rt/5wyIzJNWb
	VZINjZFlFP4JY9wyJmVfGwobe28NuLJf+WRijDUMhw==
X-Google-Smtp-Source: AKy350YKEEfJQWX1GeUa5EIHq4VHQwjHUmval/5WC9MouV84sA3alh+Vugt+1dChC3aMBSnGARWLKAL8BsYMtlCPvGM=
X-Received: by 2002:a25:d994:0:b0:b33:531b:3dd4 with SMTP id
 q142-20020a25d994000000b00b33531b3dd4mr1373821ybg.1.1680873211869; Fri, 07
 Apr 2023 06:13:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230203-evk-board-support-v5-0-1883c1b405ad@baylibre.com> <20230203-evk-board-support-v5-8-1883c1b405ad@baylibre.com>
In-Reply-To: <20230203-evk-board-support-v5-8-1883c1b405ad@baylibre.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Fri, 7 Apr 2023 15:13:20 +0200
Message-ID: <CAFGrd9oohBtNi5YNm+FP7bsfEqgHwfXnp9kGJEwvP_Wc_xD-Ug@mail.gmail.com>
Subject: Re: [PATCH v5 08/12] arm64: dts: mediatek: add usb controller support
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
X-CRM114-CacheID: sfid-20230407_061332_901787_4A6D8C9B 
X-CRM114-Status: GOOD (  14.78  )
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
> This patch add support for SuperSpeed USB, in OTG mode, on micro connecto=
r.
> It also add support for the Extensible Host Controller Interface USB.
>
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>  arch/arm64/boot/dts/mediatek/mt8365-evk.dts | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts b/arch/arm64/boo=
t/dts/mediatek/mt8365-evk.dts
> index 1c36d8f19525..9760f181eb34 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
> @@ -314,6 +314,28 @@ &pwm {
>         status =3D "okay";
>  };
>
> +&ssusb {
> +       dr_mode =3D "otg";
> +       maximum-speed =3D "high-speed";
> +       pinctrl-0 =3D <&usb_pins>;
> +       pinctrl-names =3D "default";
> +       usb-role-switch;
> +       vusb33-supply =3D <&mt6357_vusb33_reg>;
> +       status =3D "okay";
> +
> +       connector {
> +               compatible =3D "gpio-usb-b-connector", "usb-b-connector";
> +               id-gpios =3D <&pio 17 GPIO_ACTIVE_HIGH>;
> +               type =3D "micro";
> +               vbus-supply =3D <&usb_otg_vbus>;
> +       };
> +};
> +
> +&usb_host {
> +       vusb33-supply =3D <&mt6357_vusb33_reg>;
> +       status =3D "okay";
> +};
> +
>  &uart0 {
>         pinctrl-0 =3D <&uart0_pins>;
>         pinctrl-names =3D "default";
>
> --
> 2.25.1
>

