Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCD4BC77B61
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Apr 2023 08:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EagTYKGNK6lO5EWiNmyq6BDWbqfgu0PNzfW6Qz+RZcw=; b=cusfbW5DYvSQVut8sVpyuWygYw
	tmP4B31CVsSQJADt5qOTgRUI6JPSfzj+ZXinwB5MU9tw1a/SYrJu1o/rAHB3v0OkazFj+z1US0yCI
	vjEOCRmrB7GoYq1SfUXtla6TYIhi1yVBZtoq+SfjyhlFwMTvrtQbM7IFxgOEfMH5kKN/1d50v7ICu
	4+C5patRXCsreG2hszHRtBkH1PUBpUDYQTrt4P9VzxZQReF9wIff/tfH1vgKRByyL2vw2L7vXAIlV
	wnamQAnoaa7VUeJmFnnn5YuMBcARkAd/qkze7Ruf1cfnA4HdzySc8FxnMAG3hz5R44xXUIMVar+da
	hs+UIDtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prDzd-000Trq-0l;
	Tue, 25 Apr 2023 08:25:45 +0000
Received: from mail-vk1-xa2c.google.com ([2607:f8b0:4864:20::a2c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prDza-000TpL-08
	for linux-mediatek@lists.infradead.org;
	Tue, 25 Apr 2023 08:25:43 +0000
Received: by mail-vk1-xa2c.google.com with SMTP id 71dfb90a1353d-44307db5d24so1782208e0c.0
        for <linux-mediatek@lists.infradead.org>; Tue, 25 Apr 2023 01:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1682411136; x=1685003136;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EagTYKGNK6lO5EWiNmyq6BDWbqfgu0PNzfW6Qz+RZcw=;
        b=U6OrDrUM1GmENXF8WYe8ocV7bnUwN51NadjwaQUq2YR7VWexpqeK3cEcIzfQh6kaka
         HxpKew5iLlOP4m3q403RiJWu+3rtiA3VJaW/tPnVWjZ2rP0gOZDdsr6V7O9y0ne3NeZL
         L7VdvmMBdUiGjFzPp2XVUoWD18wndom4AncqI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682411136; x=1685003136;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EagTYKGNK6lO5EWiNmyq6BDWbqfgu0PNzfW6Qz+RZcw=;
        b=ctwnyE3vxmt5mzoRaGD3vncKrmx+Z7T7JqWJHqem2Vd+wGF55WqVCIaGa9MKgEXp1R
         s9JxvJ9w2tPjpXaSU8ma0p90i6wnrKbLsDBAcZl1vKfRfxVTeZSHGYjh3NsfUr353ENf
         Q3vPiCTCrG+GwoQ+HnCo1UO4JBK/n73/QHo/pUNb86d03ILml63dAHsp4YlHV6xKeBt7
         B7lvVD+hILGiijdrFH8AFStpqR18NTu3Us+5192Xi66UqMT5U0MDCWUyvv3FhsLzrpLL
         uVPhxkBT+gCOM6Sn/56Sl/9iWoP0ZKKMpjP0vo65unMblHbOUtyhmzf9qVwsGKCtFeCQ
         fUSQ==
X-Gm-Message-State: AAQBX9fktfl3Iy2EJnl1V2SAn7hNgOYBe27JvWSVovKD7asOpE7Dyh6H
	CItbalRpa5fLGImoglOtfJ9CXykc1C93uagKaYTiFw==
X-Google-Smtp-Source: AKy350YhcoGqhVqNt5WXPIhi5+U894y/gxCPIbGqm9Af3HXXxVtXCfd/efWsN5790EYhzuWriECmkqwACsF4uECb0hw=
X-Received: by 2002:a1f:c142:0:b0:432:2abc:fc2b with SMTP id
 r63-20020a1fc142000000b004322abcfc2bmr4178714vkf.0.1682411136465; Tue, 25 Apr
 2023 01:25:36 -0700 (PDT)
MIME-Version: 1.0
References: <20230424112523.1436926-1-angelogioacchino.delregno@collabora.com> <20230424112523.1436926-5-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230424112523.1436926-5-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 25 Apr 2023 16:25:25 +0800
Message-ID: <CAGXv+5GX1CqH4OEoL7tQ9bherzXOVpJrNGrSYQj4Oh3ecUJh3Q@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] arm64: dts: mediatek: cherry: Enable PCI-Express
 ports for WiFi
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: matthias.bgg@gmail.com, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230425_012542_073843_3A09DC8D 
X-CRM114-Status: GOOD (  15.02  )
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

On Mon, Apr 24, 2023 at 7:25=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> On the Cherry platform, a MT7621 WiFi+Bluetooth combo is connected
> over PCI-Express (for WiFi) and USB (for BT): enable the PCIe ports
> to enable enumerating this chip.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> Tested-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
>  .../boot/dts/mediatek/mt8195-cherry.dtsi      | 25 +++++++++++++++++++
>  1 file changed, 25 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64=
/boot/dts/mediatek/mt8195-cherry.dtsi
> index adbda4dccdd5..eca5df85fe33 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
> @@ -565,6 +565,13 @@ flash@0 {
>         };
>  };
>
> +&pcie1 {
> +       status =3D "okay";
> +
> +       pinctrl-names =3D "default";
> +       pinctrl-0 =3D <&pcie1_pins_default>;
> +};
> +
>  &pio {
>         mediatek,rsel-resistance-in-si-unit;
>         pinctrl-names =3D "default";
> @@ -959,6 +966,24 @@ pins-vreg-en {
>                 };
>         };
>
> +       pcie0_pins_default: pcie0-default-pins {
> +               pins-bus {
> +                       pinmux =3D <PINMUX_GPIO19__FUNC_WAKEN>,
> +                                <PINMUX_GPIO20__FUNC_PERSTN>,
> +                                <PINMUX_GPIO21__FUNC_CLKREQN>;
> +                                bias-pull-up;
> +               };
> +       };

I think we should remove this. We can add it later with the actual device
that has NVMe.

Otherwise,

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

> +       pcie1_pins_default: pcie1-default-pins {
> +               pins-bus {
> +                       pinmux =3D <PINMUX_GPIO22__FUNC_PERSTN_1>,
> +                                <PINMUX_GPIO23__FUNC_CLKREQN_1>,
> +                                <PINMUX_GPIO24__FUNC_WAKEN_1>;
> +                                bias-pull-up;
> +               };
> +       };
> +
>         pio_default: pio-default-pins {
>                 pins-wifi-enable {
>                         pinmux =3D <PINMUX_GPIO58__FUNC_GPIO58>;
> --
> 2.40.0
>

