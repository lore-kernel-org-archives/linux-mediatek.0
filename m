Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6321EC43217
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Dec 2022 08:58:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gAHU+obH6I+iGnv6YAFhQgkeKBQcF4Y1zkbhIvFN4iA=; b=i8qUj9WhAQ27LwLK2VB4CjIij6
	r3E9u+xCX1ctMewoaXudJaVoXZKxylXxKdVLu7L27lulDLQ9/2p/NuAmeQ6lcY9nLkVNuJNFinhPS
	UI2xM4pEqeGE6SK9ZcBBURtaNQWHvKrMUcBvZZYLZOzJo8r0nqyeuJOCluYu+AFRzsKh9pSqtmAOG
	NbVr+m0+A3U0Lsgon9984Bxt6DY4U8khAc+kkmrUyLFpdMmzKLnZZDRnYzaOyooxptwvRV+CUS7MM
	P+qFIb6q8qCHBNRI1Exo/lkVZw71jwtLcfhxUscxIzBXr7+tLGSsXrtfgK65QWpLB4l8hoT0I5cCE
	NHo/tb1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0fOn-0066al-RD; Thu, 01 Dec 2022 08:58:29 +0000
Received: from mail-vk1-xa29.google.com ([2607:f8b0:4864:20::a29])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0fOl-0066XX-1A
	for linux-mediatek@lists.infradead.org; Thu, 01 Dec 2022 08:58:28 +0000
Received: by mail-vk1-xa29.google.com with SMTP id t185so521182vkb.7
        for <linux-mediatek@lists.infradead.org>; Thu, 01 Dec 2022 00:58:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gAHU+obH6I+iGnv6YAFhQgkeKBQcF4Y1zkbhIvFN4iA=;
        b=mNNU1ZCcD2hOY5+CL69baaLmZlwX4asgqShmaFT8CS1ojh94DP+8nF0yKqn1FZ9V6v
         JT6j54iCOXcxMkAd9SqA02dbEUzu0Mld/ZBLA3CkvhhSplN0s7HDxR4PrkA8Vw0/S9mb
         B9MBGhm1dPImMAwKs4okXFSllMh5XQrV2rE7Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gAHU+obH6I+iGnv6YAFhQgkeKBQcF4Y1zkbhIvFN4iA=;
        b=Fg49B4GQP4fTHfE8vb8DURLPWE1xShlHaLBqOk/sVb0kp2IpI/86pc/SepWVvJvvCw
         g/Wq6our6Ja5bTlx+YGK+bnBkPIcJXmryOhIhw5YVmJKeges3u8W0tlddKEfelYgSpmt
         ZT18/L6x4HFlfZSIyX+2oki1J2lQkqft93fLHrxX+06P59+vtCFZ7ukj67Mg+aIT4RN+
         ml0FXffBrbm3jgcIHU62SkHgJbHqQWda13gtEDnclULhtBV7l6vgnEHaXSgU31hayrnG
         rZrSnwmGJznVzaKoLkhToU+PqjMxreprMv68WK9BLYi2SYsGG5FnBsSKpQe9ejqTZZHi
         94Ig==
X-Gm-Message-State: ANoB5plEOJMkhi0ifZZUCTsJZoQ41wpfKJdYFT1OVCJdW0xJ1Y/9d+Gw
	wsxtEKBNOq6L3GvNbJwD8nu892UJdR319mNq2Q/CQg==
X-Google-Smtp-Source: AA0mqf7DtI9hqZnvt7gRxwSAglieDVbP/0L9cQJYUTA/n0PwNQiSB2HxC2cnMKjnyV+izOosMmuhp9N0atEjVAVT+CQ=
X-Received: by 2002:a05:6122:904:b0:3bc:e1c0:469b with SMTP id
 j4-20020a056122090400b003bce1c0469bmr9896962vka.18.1669885103582; Thu, 01 Dec
 2022 00:58:23 -0800 (PST)
MIME-Version: 1.0
References: <20221201073328.1559-1-allen-kh.cheng@mediatek.com>
In-Reply-To: <20221201073328.1559-1-allen-kh.cheng@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 1 Dec 2022 16:58:12 +0800
Message-ID: <CAGXv+5HtR-bAJJC2cdqiPAVbiKPT7oGd0Xj9UjbciXt+szE_pg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: mt8192: Add adsp power domain controller
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Project_Global_Chrome_Upstream_Group@mediatek.com, 
	angelogioacchino.delregno@collabora.com, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_005827_096391_F191A586 
X-CRM114-Status: GOOD (  16.34  )
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

On Thu, Dec 1, 2022 at 3:33 PM Allen-KH Cheng
<allen-kh.cheng@mediatek.com> wrote:
>
> Add adsp power domain controller node for mt8192 SoC.
>
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> ---
> Ref: https://lore.kernel.org/all/2ec80bd8-dfef-d2e6-eb41-6e6088043e33@collabora.com/
>     [Allen-KH Cheng <allen-kh.cheng@mediatek.com>]
> ---
> ---
>  arch/arm64/boot/dts/mediatek/mt8192.dtsi | 8 ++++++++
>  include/dt-bindings/power/mt8192-power.h | 1 +
>  2 files changed, 9 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> index 424fc89cc6f7..e71afba871fc 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> @@ -514,6 +514,14 @@
>                                                 };
>                                         };
>                                 };
> +
> +                               power-domain@MT8192_POWER_DOMAIN_ADSP {
> +                                       reg = <MT8192_POWER_DOMAIN_ADSP>;
> +                                       clocks = <&topckgen CLK_TOP_ADSP_SEL>;
> +                                       clock-names = "adsp";
> +                                       mediatek,infracfg = <&infracfg>;
> +                                       #power-domain-cells = <0>;
> +                               };
>                         };
>                 };
>

Please also tie the new power domain to the SCP_ADSP clock.

ChenYu

> diff --git a/include/dt-bindings/power/mt8192-power.h b/include/dt-bindings/power/mt8192-power.h
> index 4eaa53d7270a..63e81cd0d06d 100644
> --- a/include/dt-bindings/power/mt8192-power.h
> +++ b/include/dt-bindings/power/mt8192-power.h
> @@ -28,5 +28,6 @@
>  #define MT8192_POWER_DOMAIN_CAM_RAWA   18
>  #define MT8192_POWER_DOMAIN_CAM_RAWB   19
>  #define MT8192_POWER_DOMAIN_CAM_RAWC   20
> +#define MT8192_POWER_DOMAIN_ADSP       21
>
>  #endif /* _DT_BINDINGS_POWER_MT8192_POWER_H */
> --
> 2.18.0
>

