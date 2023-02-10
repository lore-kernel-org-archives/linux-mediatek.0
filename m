Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DC36C05027
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Feb 2023 02:44:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RxKcD5MHPeq8MW1BxCC2B2HCW247AyxiuibPeYpJLy0=; b=4xah8PApWuofUtLcO63bZQr4r/
	FvmTaNogpPbMggZkdmJC1L0F8UwHfXJSdhfqZ+XEnNMBCZmttzkiiDqy2wP8eG7Njz4yzijQ+M8y6
	m8nMebFhZwABORx1TbbZhNBlE+DOcOnLyqGOLUyY+PIwp4tBUmkFnoCAJczOZ6T3wnUwbHgH4+tNB
	HS8+CLrA8lAghfj0YeqI6deht+zFVVQaP/bBKNI7O8xQpvFnOoW9WnM/bi1xrU9bnoYKyVv8U8z/c
	AlzYyfDBG6erElZzxC0Q/qeKO8H8CbylxqZFln8iDJc5e0m2tr7xZzysjRFNNkaMkN73PKPJgLIn0
	RHg4lI6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQJOy-003yc1-7z; Fri, 10 Feb 2023 02:44:40 +0000
Received: from mail-vs1-xe2d.google.com ([2607:f8b0:4864:20::e2d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQJOv-003yaw-5O
	for linux-mediatek@lists.infradead.org; Fri, 10 Feb 2023 02:44:38 +0000
Received: by mail-vs1-xe2d.google.com with SMTP id p24so3433755vsn.12
        for <linux-mediatek@lists.infradead.org>; Thu, 09 Feb 2023 18:44:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RxKcD5MHPeq8MW1BxCC2B2HCW247AyxiuibPeYpJLy0=;
        b=WQkeb8HRZt6mt0Ws9HllUpsfUrgKa8s9at6qO+rVthEmiAc9amoTtOnzqJEmH1BFeZ
         asqVFIfptZupwd2MwiZ2DDmlc/9w3dKQTrZnnsmQiigaSBMnimX0pciG3LuyWeI4fUjT
         DCfgGNGZeXGPitNNKFNOaOJh6uI8dktnbgnGU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RxKcD5MHPeq8MW1BxCC2B2HCW247AyxiuibPeYpJLy0=;
        b=S/gF/wK/8mhQaOLwAVQEL3xY9xqcIkUixgWEiU6h1ciloxpT9AN0ZUEwKV1FgMDhq3
         VRbZuwtMaI9EM/2CuuCuEp+bth09BxAXdQXXbPxlzWWr1Y+iXime8icCE5OBcP3TR08N
         UnCwBKoyMJQmeazppAwmXu+1N+DNxyeA2pe2XcQD+wht3+GaFkjrmxPbzRDk48I8IY2M
         F+dFIX8sA9oIl4FRn8MQW9NuOcLwnAdwLmMAllWvQXZPvp0ypEkFKamwGCUUu9yOFBOX
         fwI1qGW1YUYz7bIRDCE1eDB6lpVuENkViUXdMjlq/cR35CfFN/cCyjtsMNgSQyTh0/0q
         7x7A==
X-Gm-Message-State: AO0yUKUt/sCnd38s9q019QfLzLTZS/MxUHvdicQzkzu81HfqG8sOWQ0o
	WKEl/wPDkBrArw1XqrV2eqB60PkcFoWpeHBzfo9v9g==
X-Google-Smtp-Source: AK7set8rmT5dBRiIMSgQxob4EVFEZikOUhOwE5/3kSmzkpF4EKHK+ockF47cKpiLEoE6PwJMZW4tFwy49H4pgkx46b8=
X-Received: by 2002:a67:d202:0:b0:411:c830:e5b5 with SMTP id
 y2-20020a67d202000000b00411c830e5b5mr952691vsi.65.1675997076332; Thu, 09 Feb
 2023 18:44:36 -0800 (PST)
MIME-Version: 1.0
References: <20230209160357.19307-1-matthias.bgg@kernel.org> <20230209160357.19307-4-matthias.bgg@kernel.org>
In-Reply-To: <20230209160357.19307-4-matthias.bgg@kernel.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 10 Feb 2023 10:44:25 +0800
Message-ID: <CAGXv+5FnXtR+KP6GZ2ut1cUwo0z-SBs1zTPWMSvm9dF-NNn--g@mail.gmail.com>
Subject: Re: [PATCH v1 4/4] Revert "arm64: dts: mt8173: add mmsel clocks for
 4K support"
To: matthias.bgg@kernel.org
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	matthias.bgg@gmail.com, devicetree@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230209_184437_220848_5EE63553 
X-CRM114-Status: GOOD (  16.05  )
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

On Fri, Feb 10, 2023 at 12:05 AM <matthias.bgg@kernel.org> wrote:
>
> From: Matthias Brugger <matthias.bgg@gmail.com>
>
> This reverts commit fc6634ac0e5380aeb1063275a2e9a583d41b2306.
>
> The mmsys is a clock provider but does not have any clocks connected to
> it. Therefore assigned-clock properties should be applied to the users of mmsys.

If there are multiple users that need this, then it should be moved to
the clock provider node topckgen.

> This fixes the DT schema check:
> mediatek/mt8173-elm.dtb: syscon@14000000: 'assigned-clock-rates', 'assigned-clocks' do not match any of the regexes: 'pinctrl-[0-9]+'
>
> Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>
> ---
>
>  arch/arm64/boot/dts/mediatek/mt8173.dtsi | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> index c47d7d900f283..b753547e250fe 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> @@ -988,8 +988,6 @@ mmsys: syscon@14000000 {
>                         compatible = "mediatek,mt8173-mmsys", "syscon";
>                         reg = <0 0x14000000 0 0x1000>;
>                         power-domains = <&spm MT8173_POWER_DOMAIN_MM>;
> -                       assigned-clocks = <&topckgen CLK_TOP_MM_SEL>;
> -                       assigned-clock-rates = <400000000>;
>                         #clock-cells = <1>;
>                         #reset-cells = <1>;
>                         mboxes = <&gce 0 CMDQ_THR_PRIO_HIGHEST>,
> --
> 2.39.0
>
>

