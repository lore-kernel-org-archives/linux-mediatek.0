Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 647C0C61DB3
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Jan 2023 11:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nc90MP0lO5NabKtarT67wAhel1LbFD1g72FNi8Kcmco=; b=BA5VoMdPdm3iRvtkeU2Zp2+22Z
	sxS0DOyAv1K2oNfcKYC4p2FhsP6w6zFtuac9kaJY5UhhyEdrIYrcbzyv3usiMdADHcmqPDZpLKZRL
	ls+arUtiO6KCEkm9g/dK0W+bQwOlHdBwJ2ehmCPTImFAP2xghCwFRjvKm4qmRImtll5LGcN8fD6c5
	IgbetdoTgCTc8DDMF/q1hqw64sGDoBgDzpnzQbLtQ/twEoZrKSdYpOy1y4SkwuKFsc6y0jkqg7oFL
	8hLeGvI//YCuOmpe8akUfO1eLOwDNDVPHJswYk3zEgfOnfRltrTGhfxOxRGHoQvpzksrF3KHP/4+x
	o7SRgcZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFw54-00EuDf-5g; Thu, 12 Jan 2023 11:49:14 +0000
Received: from mail-ua1-x92b.google.com ([2607:f8b0:4864:20::92b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFw51-00EuBp-FQ
	for linux-mediatek@lists.infradead.org; Thu, 12 Jan 2023 11:49:12 +0000
Received: by mail-ua1-x92b.google.com with SMTP id l13so4433175uai.8
        for <linux-mediatek@lists.infradead.org>; Thu, 12 Jan 2023 03:49:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Nc90MP0lO5NabKtarT67wAhel1LbFD1g72FNi8Kcmco=;
        b=Yl4EI4pWEgqt9ywJRpKAJkTPHZ/G6JZI899Id1waManNh6rr1948RRx9EqT9tgD5H5
         0Fh1H+AMG/3VsmPENHCYilSRmFW9feZyBn9DyRxWOJekUc37VM1yMiKwAkJgmtkmC9vv
         SFwU4AGjhBQ/CuWHa32sVYMCkfQ6ktX28hCF4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Nc90MP0lO5NabKtarT67wAhel1LbFD1g72FNi8Kcmco=;
        b=PliSj5ruA+MfFUkr9yEYknEH3vNfeXEfa1n63ixgBwne9DZw9aRjYLeOHhpbQA1ENQ
         GLKBDgcRumDDg8FU5OXOB6DiDFJXXZo5bAZ1dONAC6MlvutExjoHM+BL4+OBhGtw+tAr
         EB/xi6pM2qGHb2itylgXtWul3WW5wy6LdwSYuPzNEDE7B+676RMFuauD5MnkYRbOHWB2
         lAkgnr2nD5VsHylIwz2ZF5hOBGqHejO1zQoJnBJIR4zbnMxurBY5m2zaxDhgCV3WsAYZ
         sy3WjbwwFeK0Q95NM11oCbO0D1ACqZiJXApJ+gb2hN0kx1wC+t/E93fg5s908qeeB8qx
         gGzw==
X-Gm-Message-State: AFqh2krzWZ5bEt1Gw8wY36SnL+FRoQgH0QBczhHcubOT2A5DrEWwABDI
	NeccuINAo8zhRlaamJD0DrMX7DnOntrhEC++8lr3rw==
X-Google-Smtp-Source: AMrXdXuItCuiLhRlSwBuSQxSx2uJ8oOcDFtg4BL5xBWj9NfAfa5/6Fit2CP85TF5iq9Cpoxi5wxTi1BTvSSFUBclgq0=
X-Received: by 2002:ab0:738b:0:b0:469:f0ea:c1f7 with SMTP id
 l11-20020ab0738b000000b00469f0eac1f7mr7626458uap.0.1673524149333; Thu, 12 Jan
 2023 03:49:09 -0800 (PST)
MIME-Version: 1.0
References: <20230111123711.32020-1-allen-kh.cheng@mediatek.com> <20230111123711.32020-8-allen-kh.cheng@mediatek.com>
In-Reply-To: <20230111123711.32020-8-allen-kh.cheng@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 12 Jan 2023 19:48:58 +0800
Message-ID: <CAGXv+5EDW9jZxWZW-9nYeK+2UnMR6UE28wASNFZ8MfdDhVKhxg@mail.gmail.com>
Subject: Re: [PATCH 7/9] arm64: dts: mediatek: mt8186: Add DPI node
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Stephen Boyd <sboyd@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com, 
	linux-mediatek@lists.infradead.org, hsinyi@chromium.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230112_034911_535340_9046B050 
X-CRM114-Status: GOOD (  15.77  )
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

On Wed, Jan 11, 2023 at 8:37 PM Allen-KH Cheng
<allen-kh.cheng@mediatek.com> wrote:
>
> Add DPI node for MT8186 SoC.
>
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> ---
>  arch/arm64/boot/dts/mediatek/mt8186.dtsi | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8186.dtsi b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
> index c52f9be1e750..eab30ab01572 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8186.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
> @@ -1230,6 +1230,23 @@
>                         power-domains = <&spm MT8186_POWER_DOMAIN_DIS>;
>                 };
>
> +               dpi0: dpi@1400a000 {

You could drop the trailing 0 in the label, since there is only one
instance.

Tested-by: Chen-Yu Tsai <wenst@chromium.org>

> +                       compatible = "mediatek,mt8186-dpi";
> +                       reg = <0 0x1400a000 0 0x1000>;
> +                       clocks = <&topckgen CLK_TOP_DPI>,
> +                                <&mmsys CLK_MM_DISP_DPI>,
> +                                <&apmixedsys CLK_APMIXED_TVDPLL>;
> +                       clock-names = "pixel", "engine", "pll";
> +                       assigned-clocks = <&topckgen CLK_TOP_DPI>;
> +                       assigned-clock-parents = <&topckgen CLK_TOP_TVDPLL_D2>;
> +                       interrupts = <GIC_SPI 309 IRQ_TYPE_LEVEL_LOW 0>;
> +                       status = "disabled";
> +
> +                       port {
> +                               dpi_out: endpoint { };
> +                       };
> +               };
> +
>                 dsi0: dsi@14013000 {
>                         compatible = "mediatek,mt8186-dsi";
>                         reg = <0 0x14013000 0 0x1000>;
> --
> 2.18.0
>

