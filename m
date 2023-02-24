Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8702C64ED8
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Feb 2023 09:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EGhxiBvwlysDww0NUkbaD1EgWkWQWozQvNu9Svx0vuY=; b=VDU7bTcQ8q02OROZ4qwAPHFD6e
	6yMeZITLoKGawq5ylfjCH2aqhWMeI3lM5cq14uTHjBOsaNss8203W/dp+N76/7bG73/s1tuUpX9eO
	dZvKfrpD/bugVumi8O7ikJxeoCMT8bLVzBLwtiSzeqbK7mkI+XotHIdV1CR8+g8HSvdsCP2Vq1VxS
	7hdgMevJCBxU27Fn73JqQIumRlDCFvkSR7CpYDDCevYk0cSfNjRR0EiHBygBkMjvCPiqZlV6L7NGW
	2oxylew3FOtFexnEWHUqTKK4aodNWcta9kIkY0dOlscIDEci7gbg99hOQ3CVN+rPBa/18J00H/rpm
	52XQ4EIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVUme-001m5E-7B; Fri, 24 Feb 2023 09:54:32 +0000
Received: from mail-vs1-xe30.google.com ([2607:f8b0:4864:20::e30])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVUmP-001lyM-GO
	for linux-mediatek@lists.infradead.org; Fri, 24 Feb 2023 09:54:19 +0000
Received: by mail-vs1-xe30.google.com with SMTP id x14so20679059vso.9
        for <linux-mediatek@lists.infradead.org>; Fri, 24 Feb 2023 01:54:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EGhxiBvwlysDww0NUkbaD1EgWkWQWozQvNu9Svx0vuY=;
        b=D3GH0KvrLUvkVfbxeEIVAP+CJofNMYe8WmlSIRzitgtkGbjRg8uAMjvGWGs+LMyHd9
         U3Iuune1Q1VOsXq9MdE0FJhRl4Tz7uKupk3oSpicX7piqldrtoN7Hl6YUONITY8TkpSa
         bN78cOIPILAJmC+DyhJUmjhEhN6dgYnHUpqoY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EGhxiBvwlysDww0NUkbaD1EgWkWQWozQvNu9Svx0vuY=;
        b=bSfv1ury9i0JRsTKD3xdiAP4ANddfQYzRRb4twV82iknKAuP/8nXL4cMxQuaYeWC1H
         mvlzsbFoj36Rk2kP4DNWGeGwNfx4frRPynM4UhBhRK3q5t/OCzDTxje+16u1+6OJ4nF7
         GXhvBgvqP0+YybgW/jVqRQ/OfOLGBLFzZyd2MavTBDzP4Me0yT2SHtILm9/+UrSRSFuw
         pLzrWrTctHhW+2wIz2HNgbri6tppm/kOF3BM+aFFsDwEBwtcG15kuoVkFZphScpTCQNf
         DXHpSLloctzHY/vW0LgWJekbpp74dqfGh+RULrZNe64tea+VKkHxfA/OhDfPHfZLjDol
         FqVg==
X-Gm-Message-State: AO0yUKVN5fXDqJhw2rMyLDxFntrxMIowefslnugzikSAukR9bHR9M4ik
	HVpiuWXmnnx9I/aJubCAH79qjV4+ohstYFhCX3VZUqxfHVV04w==
X-Google-Smtp-Source: AK7set+o5jIf8Aj61FB8vAB2PdpYzNYuxYZ6/LTUlZDsdUUZw9q6Oh65MnWKnlXUt71n3M1/wKW7aTFFkhxzCUPZiKc=
X-Received: by 2002:ab0:38d3:0:b0:67a:2833:5ceb with SMTP id
 l19-20020ab038d3000000b0067a28335cebmr6005761uaw.0.1677232455998; Fri, 24 Feb
 2023 01:54:15 -0800 (PST)
MIME-Version: 1.0
References: <20230223134345.82625-1-angelogioacchino.delregno@collabora.com> <20230223134345.82625-6-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230223134345.82625-6-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 24 Feb 2023 17:54:05 +0800
Message-ID: <CAGXv+5GPWzCsMb3mK7detuBnX8H_FsvbPYTROW1qzkoi8sq0Ng@mail.gmail.com>
Subject: Re: [PATCH v2 05/16] arm64: dts: mediatek: mt8183-evb: Couple VGPU
 and VSRAM_GPU regulators
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: matthias.bgg@gmail.com, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230224_015417_551245_33789D10 
X-CRM114-Status: GOOD (  14.20  )
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

On Thu, Feb 23, 2023 at 9:43 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Add coupling for these regulators, as they have a strict voltage output
> relation to satisfy in order to ensure GPU stable operation.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  arch/arm64/boot/dts/mediatek/mt8183-evb.dts | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-evb.dts b/arch/arm64/boot/dts/mediatek/mt8183-evb.dts
> index 52dc4a50e34d..fd327437e932 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183-evb.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt8183-evb.dts
> @@ -52,7 +52,6 @@ &auxadc {
>
>  &gpu {
>         mali-supply = <&mt6358_vgpu_reg>;
> -       sram-supply = <&mt6358_vsram_gpu_reg>;
>  };
>
>  &i2c0 {
> @@ -138,6 +137,16 @@ &mmc1 {
>         non-removable;
>  };
>
> +&mt6358_vgpu_reg {
> +       regulator-coupled-with = <&mt6358_vsram_gpu_reg>;
> +       regulator-coupled-max-spread = <100000>;
> +};
> +
> +&mt6358_vsram_gpu_reg {
> +       regulator-coupled-with = <&mt6358_vgpu_reg>;
> +       regulator-coupled-max-spread = <100000>;

Should we also fix up the constraints?

ChenYu

> +};
> +
>  &pio {
>         i2c_pins_0: i2c0{
>                 pins_i2c{
> --
> 2.39.2
>

