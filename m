Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88652C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Feb 2022 10:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mNNpaF/RRSkLcanPfqlL/ADVPDNcr6+W6QRvl8qH9NM=; b=cJNPPSD44/bgVP
	jtiAiT6Y/BvMSpELJE+oRG3sJxL8SeaCaO1kne0wvWC9ZVupnrD2q7M/oAmSaUbKJlbnIEBSwNhxG
	aKcNIjh2PQiUmyFRBJyMHTRngKRJyNdD3w3d3+iYMOUSdtnYoCn7aY3rAF0UpJq9xYim7mJirqfbc
	5O8prRqsdyRAG4FQW2XU5PJQmT4R//NDlpY7r9DtjIVUeZnOz7hmt+kg5g8WeSvpqw17upWEs+pIw
	bHJFuOg7yyW7pMMZUIv8eMhjsj6a58LexHXpX6/h7N9Fo1RvIgwCp1AYA0yhWPJ64iVx479X4r7IV
	FbBQwFxE/hMHQwFQ6Nqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMSSA-0093zX-4x; Tue, 22 Feb 2022 10:31:30 +0000
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMSLZ-0090ph-SJ
 for linux-mediatek@lists.infradead.org; Tue, 22 Feb 2022 10:24:43 +0000
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-2d646fffcc2so168129297b3.4
 for <linux-mediatek@lists.infradead.org>; Tue, 22 Feb 2022 02:24:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=69eFH6spOTwBGKABYsbbrmb+Lpi5NbL+IMsR8wV2fQU=;
 b=HcQ+d0ZJ/JtQx+qYGvzS9hVynevZWtI7FbGk/0iwjEZDx6m4lGAAWq+Uw7uz5YW6Po
 /pwn4tDSMF4vCWmjm4DnesJ23mj3CdFloQGFLINcu1Zt+JtAl5MoivJ8wK98sETyfENq
 +pndWzIXS/yLatEpX4NMiOTFLWwKlQBJS5u5E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=69eFH6spOTwBGKABYsbbrmb+Lpi5NbL+IMsR8wV2fQU=;
 b=OTbN1I5hhi3hrVwCuu6CG7EqCt1/Xfm0h5jXo8/OfAYLBlMXzngZYfnsg/leTFlVZI
 pRymvqhWAB62biChCQYAC2gIzTcuJz13fc55aEuefQe3gRzaCCI/gijPwBub/x2R5uvr
 UVbD5HABVaDRqlemXt5UlYs5QZIWf2SKWfkmjIjziB0rZTCzaSj/0Pr4ubq+9NzskNbM
 JIBLP039NIVrBGfaFjffLbhGmKRqMRxwCuoeBWXqlnPeG4S090iGkFKs+0GCVo9ecndn
 AKUPCTSaIfXtEnshlwJbLd9b57d232HlGhG7QZVv9RHrPFH76bjJKC3zVmHboPWaUS34
 Vk9w==
X-Gm-Message-State: AOAM531jvsfYed++Frp/MUDqqwim+2lbfy28xEgy1LkYzSuOkaya3iAH
 7tOVNOMK9o12hL+ANq3BpkgiCZEbkQ27fO2cHS/YHA==
X-Google-Smtp-Source: ABdhPJz68mpmxTWnXQ4sCxmsI+dEugOJ1Iyt555rWWgvyVmRIezO951j51SxTwtOaI+GoDLQNC4lG1WyXxLqX6GGVsE=
X-Received: by 2002:a81:35d8:0:b0:2d6:b5aa:217 with SMTP id
 c207-20020a8135d8000000b002d6b5aa0217mr20755538ywa.286.1645525480023; Tue, 22
 Feb 2022 02:24:40 -0800 (PST)
MIME-Version: 1.0
References: <20220218091633.9368-1-allen-kh.cheng@mediatek.com>
 <20220218091633.9368-21-allen-kh.cheng@mediatek.com>
In-Reply-To: <20220218091633.9368-21-allen-kh.cheng@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 22 Feb 2022 18:24:29 +0800
Message-ID: <CAGXv+5H8WY6=qvcz1CARfjf5UREH7i7v2Uz99frby5S=eqV6gQ@mail.gmail.com>
Subject: Re: [PATCH v2 20/23] arm64: dts: mt8192: Add display nodes
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 "--to=Krzysztof Kozlowski" <krzysztof.kozlowski@canonical.com>, 
 Project_Global_Chrome_Upstream_Group@mediatek.com, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, Ryder Lee <ryder.lee@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220222_022441_999791_C8EB1759 
X-CRM114-Status: GOOD (  14.10  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi,

On Fri, Feb 18, 2022 at 5:16 PM Allen-KH Cheng
<allen-kh.cheng@mediatek.com> wrote:
>
> Add display nodes for mt8192 SoC.
>
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> ---
>  arch/arm64/boot/dts/mediatek/mt8192.dtsi | 115 +++++++++++++++++++++++
>  1 file changed, 115 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> index e3314cdc7c1a..026f2d8141b0 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> @@ -32,6 +32,11 @@
>                 i2c7 = &i2c7;
>                 i2c8 = &i2c8;
>                 i2c9 = &i2c9;
> +               ovl0 = &ovl0;
> +               ovl-2l0 = &ovl_2l0;
> +               ovl-2l2 = &ovl_2l2;
> +               rdma0 = &rdma0;
> +               rdma4 = &rdma4;
>         };
>
>         clk26m: oscillator0 {
> @@ -1224,6 +1229,13 @@
>                         #clock-cells = <1>;
>                 };
>
> +               mutex: mutex@14001000 {
> +                       compatible = "mediatek,mt8192-disp-mutex";
> +                       reg = <0 0x14001000 0 0x1000>;
> +                       interrupts = <GIC_SPI 252 IRQ_TYPE_LEVEL_HIGH 0>;
> +                       clocks = <&mmsys CLK_MM_DISP_MUTEX0>;
> +               };
> +
>                 smi_common: smi@14002000 {
>                         compatible = "mediatek,mt8192-smi-common";
>                         reg = <0 0x14002000 0 0x1000>;
> @@ -1255,6 +1267,109 @@
>                         power-domains = <&spm MT8192_POWER_DOMAIN_DISP>;
>                 };
>
> +               ovl0: ovl@14005000 {
> +                       compatible = "mediatek,mt8192-disp-ovl";
> +                       reg = <0 0x14005000 0 0x1000>;
> +                       interrupts = <GIC_SPI 254 IRQ_TYPE_LEVEL_HIGH 0>;
> +                       clocks = <&mmsys CLK_MM_DISP_OVL0>;
> +                       iommus = <&iommu0 M4U_PORT_L0_OVL_RDMA0>,
> +                                <&iommu0 M4U_PORT_L0_OVL_RDMA0_HDR>;
> +                       power-domains = <&spm MT8192_POWER_DOMAIN_DISP>;
> +               };
> +
> +               ovl_2l0: ovl@14006000 {
> +                       compatible = "mediatek,mt8192-disp-ovl-2l";
> +                       reg = <0 0x14006000 0 0x1000>;
> +                       interrupts = <GIC_SPI 255 IRQ_TYPE_LEVEL_HIGH 0>;
> +                       power-domains = <&spm MT8192_POWER_DOMAIN_DISP>;
> +                       clocks = <&mmsys CLK_MM_DISP_OVL0_2L>;
> +                       iommus = <&iommu0 M4U_PORT_L1_OVL_2L_RDMA0>,
> +                                <&iommu0 M4U_PORT_L1_OVL_2L_RDMA0_HDR>;
> +               };
> +
> +               rdma0: rdma@14007000 {
> +                       compatible = "mediatek,mt8192-disp-rdma";
> +                       reg = <0 0x14007000 0 0x1000>;
> +                       interrupts = <GIC_SPI 256 IRQ_TYPE_LEVEL_HIGH 0>;
> +                       clocks = <&mmsys CLK_MM_DISP_RDMA0>;
> +                       iommus = <&iommu0 M4U_PORT_L0_DISP_RDMA0>;
> +                       mediatek,larb = <&larb0>;
> +                       mediatek,rdma-fifo-size = <5120>;
> +                       power-domains = <&spm MT8192_POWER_DOMAIN_DISP>;
> +               };
> +
> +               color0: color@14009000 {
> +                       compatible = "mediatek,mt8192-disp-color",
> +                                    "mediatek,mt8173-disp-color";
> +                       reg = <0 0x14009000 0 0x1000>;
> +                       interrupts = <GIC_SPI 258 IRQ_TYPE_LEVEL_HIGH 0>;
> +                       power-domains = <&spm MT8192_POWER_DOMAIN_DISP>;
> +                       clocks = <&mmsys CLK_MM_DISP_COLOR0>;
> +               };
> +
> +               ccorr0: ccorr@1400a000 {
> +                       compatible = "mediatek,mt8192-disp-ccorr";
> +                       reg = <0 0x1400a000 0 0x1000>;
> +                       interrupts = <GIC_SPI 259 IRQ_TYPE_LEVEL_HIGH 0>;
> +                       power-domains = <&spm MT8192_POWER_DOMAIN_DISP>;
> +                       clocks = <&mmsys CLK_MM_DISP_CCORR0>;
> +               };
> +
> +               aal0: aal@1400b000 {
> +                       compatible = "mediatek,mt8192-disp-aal";

git.kernel.org/chunkuang.hu/c/4ed545e7d10049b5492afc184e61a67e478a2cfd

suggests that there should be a fallback compatible? Otherwise this
doesn't probe.

ChenYu

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
