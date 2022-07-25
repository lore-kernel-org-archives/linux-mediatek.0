Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BA5AC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Jul 2022 04:22:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tRIMLhNzniGmJDLr8hgDHMMmDqECr4wHUSe1ln5hTXc=; b=lRuqDLkUwIFzMRTeVaMMm7qQWe
	RTRJ3zspMGfTnP0INm6ivV3t+Mxk8mb21vYrdoQdFI8pfK+KpC3p8hyKlH+AGjFuBgeklEqZnMeNa
	7eDaGQffP9+v/A526l2wT5ZZmKhWinx77iwaP2Oj6hMSUHjjvKTRdEpdhP7cgeJ5G9qnl+OkgP+LW
	jkJxL2ZCYFLX5EG2tcUgy701q7NSWynGOe9OKpM5TBQsX71lzlV4MkExsUoGmisBTQaaLuXh4yg/H
	nGagwrjBzRhp+0AdDD890aYdETNvLsBl9kmQIpi3vD98fNUpqUlWjkeRn5v25/2HUvOdfaXnzvBOt
	09/DFyBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFpbN-003ZnF-I9; Mon, 25 Jul 2022 04:21:53 +0000
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFpbL-003Zhz-Pl
	for linux-mediatek@lists.infradead.org; Mon, 25 Jul 2022 04:21:53 +0000
Received: by mail-yb1-xb29.google.com with SMTP id d124so609913ybb.5
        for <linux-mediatek@lists.infradead.org>; Sun, 24 Jul 2022 21:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tRIMLhNzniGmJDLr8hgDHMMmDqECr4wHUSe1ln5hTXc=;
        b=LHtwlJ3eJ6pjY+AynHuB4CDUtC3Qp3Qkh41InQCw2XREHd6Ffh+ONhZQFQ1fZVAd6c
         ASZsDRB0J1GNNLMyGemQUUp4iKn+AjzsIU1eOHoSezrukvqJR25JC9SB8nwaTKWFpSc6
         vq+jcN0BqUFvZ1LLW8gk6cRJtXAczlJO9PY3o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tRIMLhNzniGmJDLr8hgDHMMmDqECr4wHUSe1ln5hTXc=;
        b=r8Paij5E108m79x11Iy3ktQGLHhriLVP0uuTRe77FbsYsWjbZ6fGLzp3ccnOluTk5V
         TcbisBDCN/6jSRYk4VpOBwYFoRtpsQg/oS1dfeQ4NBzb93DR3iEC95B76NHoVcqDtTYu
         Limv6hpn99nPq+Suzo8x5Tv4wUsMwaGOFCHV0dNNKW9Djrqh9ACnd0uyH6kNC6oQ+alK
         jg56zoEdaMviqJWSPmkhaYx0HbVtTBCjQSJBlCBaeGyK3qF2AYqWChrLEZyD/L/KECw8
         146tGHIqgngVq5ypqKxmzZn0qfL31C5lyGHhoEOckd8GGo1JkCFAeAIlcYj5XvAaivVW
         q1qg==
X-Gm-Message-State: AJIora9VjVIkFLTcHnVRSY/eG1HEaEnWnKudkzz0ytlB4xYgP7J63Ufw
	K8jGsS7UHiaR24NlGWOTVtVGlavlD3/f19EnbBiAdA==
X-Google-Smtp-Source: AGRyM1v35hu3rl303nhQ3bWU0cZJvL9HOCZggvpIMDexKusxxOIzAzbt0gFlEdWmAHpTdC7Oyyrh1kSabGi4UCNkr3M=
X-Received: by 2002:a25:cc11:0:b0:670:851a:7e5e with SMTP id
 l17-20020a25cc11000000b00670851a7e5emr7555299ybf.501.1658722909063; Sun, 24
 Jul 2022 21:21:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220721145017.918102-1-angelogioacchino.delregno@collabora.com> <20220721145017.918102-2-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220721145017.918102-2-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 25 Jul 2022 12:21:38 +0800
Message-ID: <CAGXv+5Ekk_ndyPGVmWWRFkE3uveDHSczyf2OsdhOtqfSHxvnMw@mail.gmail.com>
Subject: Re: [PATCH v2 1/8] arm64: dts: mediatek: cherry: Enable the System
 Companion Processor
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Tinghan Shen <tinghan.shen@mediatek.com>
Cc: matthias.bgg@gmail.com, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220724_212151_886396_FBBB75F0 
X-CRM114-Status: GOOD (  16.54  )
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

On Thu, Jul 21, 2022 at 10:50 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> MT8195 features a SCP like some other older SoCs, and Cherry uses it
> for various tasks. Add the required pin configuration and DMA pool
> and enable the node.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../boot/dts/mediatek/mt8195-cherry.dtsi      | 28 +++++++++++++++++++
>  1 file changed, 28 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
> index fcc600674339..feebbe367e93 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
> @@ -104,6 +104,18 @@ usb_vbus: regulator-5v0-usb-vbus {
>                 enable-active-high;
>                 regulator-always-on;
>         };
> +
> +       reserved_memory: reserved-memory {
> +               #address-cells = <2>;
> +               #size-cells = <2>;
> +               ranges;
> +
> +               scp_mem: memory@50000000 {
> +                       compatible = "shared-dma-pool";
> +                       reg = <0 0x50000000 0 0x2900000>;
> +                       no-map;
> +               };
> +       };
>  };
>
>  &i2c0 {
> @@ -600,6 +612,14 @@ pins-low-power-pupd {
>                 };
>         };
>
> +       scp_pins: scp-default-pins {
> +               pins-vreq {
> +                       pinmux = <PINMUX_GPIO76__FUNC_SCP_VREQ_VAO>;
> +                       bias-disable;
> +                       input-enable;
> +               };
> +       };
> +
>         spi0_pins: spi0-default-pins {
>                 pins-cs-mosi-clk {
>                         pinmux = <PINMUX_GPIO132__FUNC_SPIM0_CSB>,
> @@ -643,6 +663,14 @@ &pmic {
>         interrupts-extended = <&pio 222 IRQ_TYPE_LEVEL_HIGH>;
>  };
>
> +&scp {
> +       status = "okay";
> +
> +       memory-region = <&scp_mem>;
> +       pinctrl-names = "default";
> +       pinctrl-0 = <&scp_pins>;

firmware-name = "mediatek/mt8195/scp.img";

Or maybe this should be added to the base mt8195.dtsi?

The entry for mt8192 was added to mt8192-asurada.dtsi though.

Tinghan, could you ask internally whether the SCP firmware should be
tied to the SoC or the projects involving the SoC?

Thanks
ChenYu

> +};
> +
>  &spi0 {
>         status = "okay";
>
> --
> 2.35.1
>
>

