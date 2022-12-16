Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4240C4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Dec 2022 10:55:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GrKknhuGa3KVuISNQ+0ldCwT2QjtfcVWcXhLlx6f2eg=; b=mNVMXURa562pMXqLGR8ipRtXOA
	FvNDZNnnrSpk5jwwdx01OnP0t3L/k17/Jy/WCI5WbjCFiE5/F4AjMZzbEj2xW5OKfmIQmFAPK0Z0F
	WwWDMjizpL8sF2vtjdmzXp8XhvcG+PB1Yimb7RlkLARzucqt1DnVoYBit/OiQSjF/moy3tw9VAdHB
	kmuf2bKq3Qbe6//nLddXj8r244MLEwTSh7x0FF44yX++NhJt/IZgQoDP1/y3ek+9bqiZ8bB8wsICj
	u/7iDJTkAvotjROl1mReFwQJmCQdysosNutzA8K7Rip3tzatewpbyyhoTUC0rvMLbv4hOQrVQrOkD
	mX0Te34Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p68Mv-00EFW9-IV; Fri, 16 Dec 2022 10:55:09 +0000
Received: from mail-qv1-xf35.google.com ([2607:f8b0:4864:20::f35])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p68Mt-00EFS9-7o
	for linux-mediatek@lists.infradead.org; Fri, 16 Dec 2022 10:55:08 +0000
Received: by mail-qv1-xf35.google.com with SMTP id u10so1402818qvp.4
        for <linux-mediatek@lists.infradead.org>; Fri, 16 Dec 2022 02:55:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GrKknhuGa3KVuISNQ+0ldCwT2QjtfcVWcXhLlx6f2eg=;
        b=d7a8PH68eC6OkPo1s2NDnur3yDuiRN2nKhYrrQ8VkeONotStBBQyQ/FhW5JqTQuVRZ
         0XuH2oEqemwTZNMa1tPrxQ9HRbZjbE3fr3H7eGNK/O3APxMvbCtXnNHNc9yViasf/DdK
         GCA2Rn7POemoUp0cqESl3r4eZN2iAVgRTU0mg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GrKknhuGa3KVuISNQ+0ldCwT2QjtfcVWcXhLlx6f2eg=;
        b=LYMZJg4K4/CtuFor7sQSqJGXrrDD4A8WTH9gQiVu5/6pQREedwWaGRmQM9IJqdkXkt
         mu+rIsLa2QTtIZ8TeefoJhHuFUW8gLmog38Dr+xrXOZjFfph5fcemGsYStGDTyMu4xlN
         +wl3b2NbhX1HcBzly/GT/haLjy6aMzOWSp/dh+4W1BLxOW/eXu2til7DpiJnxnOZicXt
         ZTbxMFQGdeGVyiav4vGefGsWCd4t7ZNB9WNGd4tKDD9ianEwOeCpxIjRA2ZA4EfwRxFr
         QcZA8+pGd9hLOMGFSoFrFHx+alKQd2ijJCGKypNTB4YQ3bgqNTHo9/woJZh4+PolspgU
         xFZg==
X-Gm-Message-State: AFqh2kr9S6xobPI0+zdzuWHZEjTk60eefHDfe5lSEnrR/DAm/g93FtTU
	OqDLAEiMVP7VKuUzlBk0fvjgSXpR4Z4KLyvydjgpCZC2MgiSFg==
X-Google-Smtp-Source: AMrXdXtxD2Dw69BXa3t7U8lA/jGeC3BWlJLYa99HnQcGLG9/wzipb95sBWc/+IdjkbP22LWRyfQhXpR7BrZhhq7VTQo=
X-Received: by 2002:a05:6214:3283:b0:4ff:d079:307c with SMTP id
 mu3-20020a056214328300b004ffd079307cmr55075qvb.18.1671188103515; Fri, 16 Dec
 2022 02:55:03 -0800 (PST)
MIME-Version: 1.0
References: <20220527045353.2483042-1-hsinyi@chromium.org>
In-Reply-To: <20220527045353.2483042-1-hsinyi@chromium.org>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Fri, 16 Dec 2022 18:54:37 +0800
Message-ID: <CAJMQK-jWwDm4dy-ELzJ5gzLby37Ztqn9qhGT9zqFhmowdok51g@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: mt8183: kukui: Split out keyboard node and
 describe detachables
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221216_025507_373438_78F48635 
X-CRM114-Status: GOOD (  17.43  )
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

On Fri, May 27, 2022 at 12:54 PM Hsin-Yi Wang <hsinyi@chromium.org> wrote:
>
> Kukui devices krane, kodana, and kakadu use detachable keyboards, which
> only have switches to be registered.
>
> Change the keyboard node's compatible of those boards to the newly
> introduced "google,cros-ec-keyb-switches", which won't include matrix
> properties.
>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---

hi Matthias,

Kindly ping on this patch. Thanks.


>  arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi | 2 ++
>  arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi  | 6 ++++++
>  arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama.dtsi  | 6 ++++++
>  arch/arm64/boot/dts/mediatek/mt8183-kukui-krane.dtsi   | 6 ++++++
>  arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi         | 1 -
>  5 files changed, 20 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi
> index 2d7a193272ae..981c889a22ea 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi
> @@ -4,6 +4,8 @@
>   */
>
>  #include "mt8183-kukui.dtsi"
> +/* Must come after mt8183-kukui.dtsi to modify cros_ec */
> +#include <arm/cros-ec-keyboard.dtsi>
>
>  / {
>         panel: panel {
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi
> index 28966a65391b..4b419623c8dc 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi
> @@ -372,6 +372,12 @@ pen_eject {
>         };
>  };
>
> +&cros_ec {
> +       keyboard-controller {
> +               compatible = "google,cros-ec-keyb-switches";
> +       };
> +};
> +
>  &qca_wifi {
>         qcom,ath10k-calibration-variant = "GO_KAKADU";
>  };
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama.dtsi
> index 06f8c80bf553..4864c39e53a4 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama.dtsi
> @@ -339,6 +339,12 @@ touch_pin_reset: pin_reset {
>         };
>  };
>
> +&cros_ec {
> +       keyboard-controller {
> +               compatible = "google,cros-ec-keyb-switches";
> +       };
> +};
> +
>  &qca_wifi {
>         qcom,ath10k-calibration-variant = "GO_KODAMA";
>  };
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-krane.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui-krane.dtsi
> index a7b0cb3ff7b0..d5f41c6c9881 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-krane.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-krane.dtsi
> @@ -343,6 +343,12 @@ rst_pin {
>         };
>  };
>
> +&cros_ec {
> +       keyboard-controller {
> +               compatible = "google,cros-ec-keyb-switches";
> +       };
> +};
> +
>  &qca_wifi {
>         qcom,ath10k-calibration-variant = "LE_Krane";
>  };
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> index 8d5bf73a9099..db1388550f98 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> @@ -986,5 +986,4 @@ hub@1 {
>         };
>  };
>
> -#include <arm/cros-ec-keyboard.dtsi>
>  #include <arm/cros-ec-sbs.dtsi>
> --
> 2.36.1.124.g0e6072fb45-goog
>

