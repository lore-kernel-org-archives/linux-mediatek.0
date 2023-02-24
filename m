Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E04EC61DA3
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Feb 2023 09:51:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bn55ww5zH0WVNWxa7yQLcFqUy+v9EZjhhlwgJ2gi7tw=; b=sNKaSKO5kB2FZZgmiEv8nqNHTt
	Cv326KbwXYnEPT6RBjQdajl2fOmjBlbV193+Slsvd0qUSbxdHkO/sOdl3FvyRtfjQ2MHpmAXfPKuv
	nc0/lHKY3snrTCL2/LEg5NHuvbmAPnARjdZZlidpH2vLfqGabqwHJtYHiJa+Tc6j5ulP7ddLxqWjs
	ehAwy2KOCeFUhIxlYrPPEPLVrHUvjrIrSzVgSAVm0FQqPWtpqVW5CTHnPczAEtIClc7ZKytrk4rHx
	O38SkEOCMq+U9k0IzTvx8m0UHBugJ5kXRCiQApj6oDRnhhqfMBZzq8OHX18vUxOz0FUSG3zwOtnXG
	GO39+14A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVUjK-001khI-Vm; Fri, 24 Feb 2023 09:51:06 +0000
Received: from mail-vs1-xe35.google.com ([2607:f8b0:4864:20::e35])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVUjI-001kgQ-AD
	for linux-mediatek@lists.infradead.org; Fri, 24 Feb 2023 09:51:05 +0000
Received: by mail-vs1-xe35.google.com with SMTP id s1so4311539vsk.5
        for <linux-mediatek@lists.infradead.org>; Fri, 24 Feb 2023 01:51:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Bn55ww5zH0WVNWxa7yQLcFqUy+v9EZjhhlwgJ2gi7tw=;
        b=WkpEqh8DFF0lRYLZd3bfKv3ja8dYdPmt1b7Sw6iSShCMvpuOogd75QOU3cHgSgf4N7
         eCZfBMZLMf4VF42tqmGAP5xYAFdN1gHEhm+dEwpTf2pHS83CngImW+gncRJFs266EdT0
         qbJL5X2vuRFHE69kJhjJg9Sh3axMfXRrpCO5U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bn55ww5zH0WVNWxa7yQLcFqUy+v9EZjhhlwgJ2gi7tw=;
        b=oYt/AaLGNtEMSgV1tFsHCkmR5NgvQf2PmQO8oNJg1I9qvQsQxw+MpxhkCTAZttmff6
         Z7FtfOHLWAaCqflDDc8S8gUrx0o+3m1gStTc0Cqa/4Hf0E4OoVCVG7bay9ngQRkMK8Xm
         FVPRS3Tyf+sddyFiB7Xz1GH8yXO3UMK8FQFz4ay86bySO1uj2AiG6sFYAeFCeFpO3DSc
         VN1gL0ITgRKHRs7Tv/MZTV54xb66vGP2S1Tca8SUmlPmNTLHUXLV6MxF13janZqhIeUu
         ts8pug2YKoqczQiCG1kdODasTYs0oi8yADfAVeMy5G58ptVtkiCaRJz1EwR5HHZxYPwr
         9nLA==
X-Gm-Message-State: AO0yUKU9oDlw7y+9QuWagMCVnFm6CCSTuQOSRbfEeSOwWlAKm/kzbUr7
	Yr4xDem9kBSPXvNhIRxlngcKOsdWmWVdVM7vmFHuwA==
X-Google-Smtp-Source: AK7set8bF/QXq2q9q2pvSMabMKLNjY0IhFjR5RiG9wUkuT+BcXIqnZhOYN1xW9AZI6HYLdpi3wfZKN0lO3jcBXibgKE=
X-Received: by 2002:a05:6102:1592:b0:412:5424:e58e with SMTP id
 g18-20020a056102159200b004125424e58emr2373657vsv.0.1677232263235; Fri, 24 Feb
 2023 01:51:03 -0800 (PST)
MIME-Version: 1.0
References: <20230223134345.82625-1-angelogioacchino.delregno@collabora.com> <20230223134345.82625-3-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230223134345.82625-3-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 24 Feb 2023 17:50:52 +0800
Message-ID: <CAGXv+5FUzeB1SPDt+Ys8ALA_y5ZAPQGnz43NnLCPorvurF3eYg@mail.gmail.com>
Subject: Re: [PATCH v2 02/16] arm64: dts: mediatek: mt8183-kukui: Override
 vgpu/vsram_gpu constraints
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: matthias.bgg@gmail.com, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230224_015104_370846_9324068D 
X-CRM114-Status: GOOD (  13.48  )
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
> Override the PMIC-default voltage constraints for VGPU and VSRAM_GPU
> with the platform specific vmin/vmax for the highest possible SoC
> binning.

The maximum voltage numbers don't match the existing OPP table though.

> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> index de9778c85b94..63952c1251df 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> @@ -401,6 +401,9 @@ &mt6358codec {
>  };
>
>  &mt6358_vgpu_reg {
> +       regulator-min-microvolt = <625000>;
> +       regulator-max-microvolt = <900000>;
> +
>         regulator-coupled-with = <&mt6358_vsram_gpu_reg>;
>         regulator-coupled-max-spread = <100000>;
>  };
> @@ -416,6 +419,9 @@ &mt6358_vsim2_reg {
>  };
>
>  &mt6358_vsram_gpu_reg {
> +       regulator-min-microvolt = <850000>;
> +       regulator-max-microvolt = <1000000>;
> +
>         regulator-coupled-with = <&mt6358_vgpu_reg>;
>         regulator-coupled-max-spread = <100000>;
>  };
> --
> 2.39.2
>

