Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6EA4C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Jul 2022 09:08:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oSUen1zy2XKJLnLvpszCdjqmfTvZUFc64MJFQlVfVi0=; b=Q0Aqan/3jNlkCKcdJt9GNQs65f
	/F6d4E/Ob9bCcl4TknU5O9xbYqqqPWPjAu2Zfh+QGiWrrSN5nkJ2wfO9O9AZ9HrQ8qe0Ak0n1wkox
	fBlBvhActQzwD7TkeAgY+MsBKxmHZZ0GyNDUOzdNzVUv7xTE1mabiE8IDwKafslInlvOdPrVrLlfF
	aEoG1afDyRd18l3dE2fF5x7P/rKbufLnmaj7PFIu+u2scGmX0Gp5ewU3S4SAjXERUlfvjhfimWaDp
	3mbODecn/rgfGSpluOE1T2667yw8hX/heUwmSGumkd4Z7OY34cBU0Syycfuud9J9a0nqKi3mX3aM1
	Dhqwb1CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFu54-007LBv-52; Mon, 25 Jul 2022 09:08:50 +0000
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFu4e-007KtI-Pv
	for linux-mediatek@lists.infradead.org; Mon, 25 Jul 2022 09:08:27 +0000
Received: by mail-yb1-xb2f.google.com with SMTP id a82so13381821ybb.12
        for <linux-mediatek@lists.infradead.org>; Mon, 25 Jul 2022 02:08:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oSUen1zy2XKJLnLvpszCdjqmfTvZUFc64MJFQlVfVi0=;
        b=R69nZ9mZ0SdKoqNGRzCSjAak9yI9nBoYofz+j4xzGtlDFdv5pbDtadC57GP+GWd+9P
         jvhCpenqkQwVB3tTaOYKcydqfj+9lsXbXoAbyBEh70T1CIj21JlmchUawTfSerpP9itW
         GeoYN8ndVMhL6TBnSNlRrODo44no0yVdPH1l4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oSUen1zy2XKJLnLvpszCdjqmfTvZUFc64MJFQlVfVi0=;
        b=5ND9T2QVY8QEm7vl/jqymf5fqiZhSEoQyZ8OtEqA7KM4DTLPTBUpryQo/qZaa8cdax
         zPatEdvxstEwmnp2c7Itv0DiSsAGBwbmP4ZOssb3++gcfeA50y05HWNLXZEyMfDVBVD5
         JaQPq61bkbe57jR+iYgVbNasBwstf5sUk6L2Qb5nH5t/2q5doCRlVUq8Tl+QS94XN53y
         v+o2p7A7fazMyAU+xWHfq3tor18p9Nle6yU9SpHb9Jk7JS5w7Lk4Mxd72paoZffw7C/0
         rDTu45c+1z6A1Z6ZdOazFmchNjKyOwBZtd7xKdZtSeXbUsNUMWxKshjYEcx9kXftxp4H
         SU1Q==
X-Gm-Message-State: AJIora+HPHVUuRgSuf541Srz7CKZBfmanLvkg5xzjvhiyU3iN3ePYhjl
	SoSGoFdFe4+2JQdMJIP8idvd+IAojvmqhfKNMy1zhw==
X-Google-Smtp-Source: AGRyM1vV+DR9ya4OmfTlnujVAxn1Io5/3EeD5LRkPcGkkRMbp4gKM1lvDg7+uo4ATywMehanYHIO8iDairtqInRllbM=
X-Received: by 2002:a25:6a43:0:b0:66f:d259:7918 with SMTP id
 f64-20020a256a43000000b0066fd2597918mr8618720ybc.486.1658740101673; Mon, 25
 Jul 2022 02:08:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220721145017.918102-1-angelogioacchino.delregno@collabora.com> <20220721145017.918102-9-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220721145017.918102-9-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 25 Jul 2022 17:08:10 +0800
Message-ID: <CAGXv+5Gn4CP=iJ2M8vfstdHLb6JRsgYGXQiV5WtHzv3cFWSjqA@mail.gmail.com>
Subject: Re: [PATCH v2 8/8] arm64: dts: mediatek: cherry: Enable MT6315
 regulators on SPMI bus
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: matthias.bgg@gmail.com, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Tinghan Shen <tinghan.shen@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220725_020824_870141_68B0268E 
X-CRM114-Status: GOOD (  14.31  )
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

On Thu, Jul 21, 2022 at 10:54 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> All machines in the Cherry platform use MT6315 over SPMI: add the
> two instances, providing Vbcpu and Vgpu regulators.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Tested-by: Chen-Yu Tsai <wenst@chromium.org>

> ---
>  .../boot/dts/mediatek/mt8195-cherry.dtsi      | 42 +++++++++++++++++++
>  1 file changed, 42 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
> index 9086a440a995..6219544e9912 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
> @@ -5,6 +5,7 @@
>
>  #include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/leds/common.h>
> +#include <dt-bindings/spmi/spmi.h>
>  #include "mt8195.dtsi"
>  #include "mt6359.dtsi"
>
> @@ -979,6 +980,47 @@ usb_c1: connector@1 {
>         };
>  };
>
> +&spmi {
> +       #address-cells = <2>;
> +       #size-cells = <0>;
> +
> +       mt6315@6 {
> +               compatible = "mediatek,mt6315-regulator";
> +               reg = <0x6 SPMI_USID>;
> +
> +               regulators {
> +                       mt6315_6_vbuck1: vbuck1 {
> +                               regulator-compatible = "vbuck1";
> +                               regulator-name = "Vbcpu";
> +                               regulator-min-microvolt = <300000>;
> +                               regulator-max-microvolt = <1193750>;

Tinghan,

Could you help confirm these numbers? They must be valid for the
big cluster supply, not the PMIC.

> +                               regulator-enable-ramp-delay = <256>;
> +                               regulator-ramp-delay = <6250>;
> +                               regulator-allowed-modes = <0 1 2>;
> +                               regulator-always-on;
> +                       };
> +               };
> +       };
> +
> +       mt6315@7 {
> +               compatible = "mediatek,mt6315-regulator";
> +               reg = <0x7 SPMI_USID>;
> +
> +               regulators {
> +                       mt6315_7_vbuck1: vbuck1 {
> +                               regulator-compatible = "vbuck1";
> +                               regulator-name = "Vgpu";
> +                               regulator-min-microvolt = <625000>;
> +                               regulator-max-microvolt = <1193750>;

Same here for the GPU.


Thanks
ChenYu


> +                               regulator-enable-ramp-delay = <256>;
> +                               regulator-ramp-delay = <6250>;
> +                               regulator-allowed-modes = <0 1 2>;
> +                               regulator-always-on;
> +                       };
> +               };
> +       };
> +};
> +
>  &u3phy0 {
>         status = "okay";
>  };
> --
> 2.35.1
>
>

