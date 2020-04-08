Return-Path: <SRS0=Kof6=5Y=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26184C2BB1D
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Apr 2020 15:48:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F1FD0206F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Apr 2020 15:48:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rm3NQUAg";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fjG3bXlO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F1FD0206F5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/glYxCTGYTgqdIhqUIx7ZbTymWp1x9QHpBt0LaADoNI=; b=rm3NQUAgxjnsHm
	i5FmsFfa7pM3Fxzy3Z5v5Tl8vfJaujic51MaSNGZe1Pywe78rMOWkUBnHNU7Z5PtXGVGI4iZEHAm3
	6NMFPZr9VyIXbcmvX3hNUq7tFhWdCLJk1+Hw4vbx4DM606ZcLwwyj+8Tyd3p3IYXWFBdK8PsKJn57
	jsNg3a7U1Zb2E5o81XWR22FGLiIYjv2JhtpeS8KvE7PfeChYlHm4NnD8UqAJGOYtOeO2Py7YNksXX
	W3Qdob3VgbZCSsmIDXWUQiZnjNiq+N/6EY+/yqO3dA02tY8DbgEBcHinKxkdrRyfmxsAA+8d55b6D
	D1zcelKssf2+gDnf32rw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jMCwG-0008AQ-Ov; Wed, 08 Apr 2020 15:48:28 +0000
Received: from mail-qk1-x743.google.com ([2607:f8b0:4864:20::743])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jMCwD-00089J-Tj; Wed, 08 Apr 2020 15:48:27 +0000
Received: by mail-qk1-x743.google.com with SMTP id x66so585163qkd.9;
 Wed, 08 Apr 2020 08:48:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3+eGFsLGGWL0hFZoo3T4TQK9gJ4JHOSPbWbKxqCC7yc=;
 b=fjG3bXlOYQCEmTAhE3aDsX6GZwLes9ZflbLRHjwVFdgrveZ3HnI+b6RJBkuoDANCdj
 ZHulRjlfPetgLiQ8wTg7fsvhL49fIvhhhMC9x8t7sbB7KbKzf3d3MIbo+oNoBhW0a3PR
 s/IzUrBYCQRKSsl9hWq70bNlyV8qVDa8hQaAZSuEMyZiWeZBKL2gyF30vCK/Upwrif2D
 D0ZoaaiJCJ9xOgC9SUhk2m8AogAYKfvuEqJcwUlHnah9TBoSsgsgrxdH1dqmTa+MMwPG
 Zza8FsyB6tJQe4SL1NmRZ8eM1ybf16RTOck6iluSQIMDTkDdGnFZ7ED4SXZpuVKjbN/t
 5cdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3+eGFsLGGWL0hFZoo3T4TQK9gJ4JHOSPbWbKxqCC7yc=;
 b=CJrwLawF7ku65IsIOT6D3xvbdkLBRop2WFD+Wo3apl8zAVxeVD9Kp/Fxmw8m0YsM99
 5FZrWiyFpMMXY5xsnYTs2+5mitJXRVCrUvQtWSaBpeaMk4NBzLa87QP8iYB+kBaansWN
 WVK8/wCcO73K+kRheboOh4/M3gN1yREGb5hFPWNLVW1kzjl6LMBKRA6MU/2lqGX0C0YI
 lBZ1X/qmYE1lwnzgW3NYcNYvIBzuEizuJTM23p7K3OhD8a4hYIRZo+DsvHDIqn8pZ7ub
 mf5L171FsXvvfUXbB/A6ZlN/Bj8keZJ/UAVmPibzUfhy5tSJuMH3t3ftxFW8pm6ciY/F
 qhKA==
X-Gm-Message-State: AGi0PuZAz4kkKYlMbhxNSho6e2s5yIE0xWb5xHXtqzCYYbi/ybHLJeNk
 9OVYZi0KJWleb80EzEcByOcektXlSpW5ECAKeJc=
X-Google-Smtp-Source: APiQypJfn2wnXFL9j9EyznimHBwrBbDfxxbx3yC43znzRXh7g8S7mBwYqGH4WtP2+jqGLilI9BccVEwBZMw+aO7/ff8=
X-Received: by 2002:a37:6c81:: with SMTP id h123mr8156567qkc.290.1586360904353; 
 Wed, 08 Apr 2020 08:48:24 -0700 (PDT)
MIME-Version: 1.0
References: <20191118104252.228406-1-hsinyi@chromium.org>
In-Reply-To: <20191118104252.228406-1-hsinyi@chromium.org>
From: Enric Balletbo Serra <eballetbo@gmail.com>
Date: Wed, 8 Apr 2020 17:48:12 +0200
Message-ID: <CAFqH_528vidMhTFxNZ=b7SFD2K12UwtdX3uTUzW4YUgeDWkg5A@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: mt8173: Add gce setting in mmsys and display
 node
To: Hsin-Yi Wang <hsinyi@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200408_084825_981526_163FF8C5 
X-CRM114-Status: GOOD (  15.48  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Bibby Hsieh <bibby.hsieh@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Missatge de Hsin-Yi Wang <hsinyi@chromium.org> del dia dl., 18 de nov.
2019 a les 11:43:
>
> In order to use GCE function, we need add some informations
> into display node (mboxes, mediatek,gce-client-reg, mediatek,gce-events).
>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>

With the fix provided by Hsin-Yi [1] and after the mmsys patches
landed I get GCE function working on mt8173, so

Tested-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>

[1] https://lore.kernel.org/lkml/20200406051131.225748-1-hsinyi@chromium.org/

Thanks,
 Enric

> ---
> - This is based on series "support gce on mt8183 platform"
>   https://patchwork.kernel.org/cover/11208309/
> - gce setting in 8183:
>   https://patchwork.kernel.org/patch/11127105/
> ---
>  arch/arm64/boot/dts/mediatek/mt8173.dtsi | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> index 15f1842f6df3..e84ec3f95d81 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
> @@ -911,6 +911,11 @@ mmsys: clock-controller@14000000 {
>                         assigned-clocks = <&topckgen CLK_TOP_MM_SEL>;
>                         assigned-clock-rates = <400000000>;
>                         #clock-cells = <1>;
> +                       mboxes = <&gce 0 CMDQ_THR_PRIO_HIGHEST 1>,
> +                                <&gce 1 CMDQ_THR_PRIO_HIGHEST 1>;
> +                       mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0 0x1000>;
> +                       mediatek,gce-events = <CMDQ_EVENT_MUTEX0_STREAM_EOF>,
> +                                             <CMDQ_EVENT_MUTEX1_STREAM_EOF>;
>                 };
>
>                 mdp_rdma0: rdma@14001000 {
> @@ -991,6 +996,7 @@ ovl0: ovl@1400c000 {
>                         clocks = <&mmsys CLK_MM_DISP_OVL0>;
>                         iommus = <&iommu M4U_PORT_DISP_OVL0>;
>                         mediatek,larb = <&larb0>;
> +                       mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0xc000 0x1000>;
>                 };
>
>                 ovl1: ovl@1400d000 {
> @@ -1001,6 +1007,7 @@ ovl1: ovl@1400d000 {
>                         clocks = <&mmsys CLK_MM_DISP_OVL1>;
>                         iommus = <&iommu M4U_PORT_DISP_OVL1>;
>                         mediatek,larb = <&larb4>;
> +                       mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0xd000 0x1000>;
>                 };
>
>                 rdma0: rdma@1400e000 {
> @@ -1011,6 +1018,7 @@ rdma0: rdma@1400e000 {
>                         clocks = <&mmsys CLK_MM_DISP_RDMA0>;
>                         iommus = <&iommu M4U_PORT_DISP_RDMA0>;
>                         mediatek,larb = <&larb0>;
> +                       mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0xe000 0x1000>;
>                 };
>
>                 rdma1: rdma@1400f000 {
> @@ -1021,6 +1029,7 @@ rdma1: rdma@1400f000 {
>                         clocks = <&mmsys CLK_MM_DISP_RDMA1>;
>                         iommus = <&iommu M4U_PORT_DISP_RDMA1>;
>                         mediatek,larb = <&larb4>;
> +                       mediatek,gce-client-reg = <&gce SUBSYS_1400XXXX 0xf000 0x1000>;
>                 };
>
>                 rdma2: rdma@14010000 {
> @@ -1031,6 +1040,7 @@ rdma2: rdma@14010000 {
>                         clocks = <&mmsys CLK_MM_DISP_RDMA2>;
>                         iommus = <&iommu M4U_PORT_DISP_RDMA2>;
>                         mediatek,larb = <&larb4>;
> +                       mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX 0 0x1000>;
>                 };
>
>                 wdma0: wdma@14011000 {
> @@ -1041,6 +1051,7 @@ wdma0: wdma@14011000 {
>                         clocks = <&mmsys CLK_MM_DISP_WDMA0>;
>                         iommus = <&iommu M4U_PORT_DISP_WDMA0>;
>                         mediatek,larb = <&larb0>;
> +                       mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX 0x1000 0x1000>;
>                 };
>
>                 wdma1: wdma@14012000 {
> @@ -1051,6 +1062,7 @@ wdma1: wdma@14012000 {
>                         clocks = <&mmsys CLK_MM_DISP_WDMA1>;
>                         iommus = <&iommu M4U_PORT_DISP_WDMA1>;
>                         mediatek,larb = <&larb4>;
> +                       mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX 0x2000 0x1000>;
>                 };
>
>                 color0: color@14013000 {
> @@ -1059,6 +1071,7 @@ color0: color@14013000 {
>                         interrupts = <GIC_SPI 187 IRQ_TYPE_LEVEL_LOW>;
>                         power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
>                         clocks = <&mmsys CLK_MM_DISP_COLOR0>;
> +                       mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX 0x3000 0x1000>;
>                 };
>
>                 color1: color@14014000 {
> @@ -1067,6 +1080,7 @@ color1: color@14014000 {
>                         interrupts = <GIC_SPI 188 IRQ_TYPE_LEVEL_LOW>;
>                         power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
>                         clocks = <&mmsys CLK_MM_DISP_COLOR1>;
> +                       mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX 0x4000 0x1000>;
>                 };
>
>                 aal@14015000 {
> @@ -1075,6 +1089,7 @@ aal@14015000 {
>                         interrupts = <GIC_SPI 189 IRQ_TYPE_LEVEL_LOW>;
>                         power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
>                         clocks = <&mmsys CLK_MM_DISP_AAL>;
> +                       mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX 0x5000 0x1000>;
>                 };
>
>                 gamma@14016000 {
> @@ -1083,6 +1098,7 @@ gamma@14016000 {
>                         interrupts = <GIC_SPI 190 IRQ_TYPE_LEVEL_LOW>;
>                         power-domains = <&scpsys MT8173_POWER_DOMAIN_MM>;
>                         clocks = <&mmsys CLK_MM_DISP_GAMMA>;
> +                       mediatek,gce-client-reg = <&gce SUBSYS_1401XXXX 0x6000 0x1000>;
>                 };
>
>                 merge@14017000 {
> --
> 2.24.0.432.g9d3f5f5b63-goog
>
>
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
