Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DF07C71153
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Sep 2023 17:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aos/hZG2kxxhYMB7Cd7Cd6lWeMYzVwziNvlCKk5Ckbo=; b=Sy+yUbDKVbM7mmXJmS4essu1LG
	paVZjCK8GhZNviJAPBZLqMrbg6lBB28WTpUAQEUUH7z4Ib0FdPUGbAFbBPCRA29pJz4IPDNeRM8Ft
	qxSxSviAN24r4GckcgMWTZGZx7sJ1m4Wmq9eLIaV9ghbWT0ZtG72l8OB0Sv6Z2oOCL/2MGFDbdJei
	fYnKBy2KOlXQJD1Dvl9/yh8D5aUq79pGMChbFcdT0/U8Yma+Ot1sBhSqwOUT/DeKHK5khogf7TVft
	agL1En06Vs6As/GQvkGbcDbhn3sj5R3bKg2JPGZNY2cGAS90IwIk34jwmPObaS+MsE6iZ4jyjymPY
	pTliFJow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdDgi-004XB5-2z;
	Mon, 04 Sep 2023 17:48:37 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdDgd-004XAM-2J
	for linux-mediatek@lists.infradead.org;
	Mon, 04 Sep 2023 17:48:34 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-307d58b3efbso1302914f8f.0
        for <linux-mediatek@lists.infradead.org>; Mon, 04 Sep 2023 10:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693849709; x=1694454509; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=aos/hZG2kxxhYMB7Cd7Cd6lWeMYzVwziNvlCKk5Ckbo=;
        b=CpwbQ72adeRlcKwNbRYjld2S4YbkRYZpI/b9AVrgRPZjnGnlQcoBaasx+1eWWQbPzh
         UOlm2448Ealh/hgf2Fdp3ZLfzdMC8mU7JOZg6vfAYAPA+bQQnnXzbqxTtqGPrZWEq+DA
         lEmQIIXh5n9h/hMB/J5elsbi2ZpstbVdqU7sxP34uSt3cVergKThpA/8sHulTSvql+vA
         AEUcTD5Vmi1zm2vOAPUXlDj5D98yIC7ZIRJR1xetkrixpZXyRW7Rbe43ElxNyYGyQcNc
         QywGp3EyK0VNb6fiPaWbA/EyVe6/jQIERP8qA9KlaUzWfkirwdEjqi4QlZn67Yw4EbVj
         X5IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693849709; x=1694454509;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aos/hZG2kxxhYMB7Cd7Cd6lWeMYzVwziNvlCKk5Ckbo=;
        b=fiasUI9NiGIdLhBPYvWWZPirfBzKf4b9ai/k3j2HwlReiJjhm3YWJxZDBB34bka5AF
         XIwnW0jM+HrlJHn59TrAzVjpt2X3lb1LCbCT4QN2+XJ6BjDLHeyQ9GkrHNCWJ3OKZi5S
         kbgoZ3nUx2N7TrZ5yyFk3R05E+ZuGPwQKHnLNc1/kuWwDCY2A0FYLsLcAWoCMCoTxS8Y
         ImWUQ1KDbmwPVOSD9nbsAAWygQAHfdVHKTxzCDAa2NUeG8Tb11JqjkARKJMRcsni5MUc
         SEzsxnFyMIkdjY5RSbFSbgS6w3edS6xoY5m8dUtgQr2i2efmFSkFWI8sq8cbdhzs5kph
         gZbw==
X-Gm-Message-State: AOJu0YwRbQWm/8eKNWu26e8Mn2ouxQvBowACkr3yMxx/W6GM0J47OE4G
	LAJshC3FB+d8RLLSWyQLCBBQrFVRh2miUfFaiQA2Ng==
X-Google-Smtp-Source: AGHT+IEamhDEaqdCoqAZliBTHkbNtM/UPtdEvq3fI3mlDWHw8b6KVLBWzPs4O5EcVL5Mv8O73aLmGArMs289GH4AkPk=
X-Received: by 2002:adf:f7c1:0:b0:314:1ce9:3c86 with SMTP id
 a1-20020adff7c1000000b003141ce93c86mr8302488wrq.0.1693849709037; Mon, 04 Sep
 2023 10:48:29 -0700 (PDT)
MIME-Version: 1.0
References: <20230901080935.14571-1-tinghan.shen@mediatek.com> <20230901080935.14571-15-tinghan.shen@mediatek.com>
In-Reply-To: <20230901080935.14571-15-tinghan.shen@mediatek.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Mon, 4 Sep 2023 11:48:18 -0600
Message-ID: <CANLsYkxhmY=TZqiyt=gr7JrQa2ZMgqjESeH0sx3orxK7CLN94w@mail.gmail.com>
Subject: Re: [PATCH v17 14/14] arm64: dts: mediatek: mt8195: Add SCP 2nd core
To: Tinghan Shen <tinghan.shen@mediatek.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-remoteproc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230904_104832_249154_586BFB64 
X-CRM114-Status: GOOD (  15.31  )
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

Hey Matthias - will you pick up this one or should I get it through
the remoteproc tree?

On Fri, 1 Sept 2023 at 02:10, Tinghan Shen <tinghan.shen@mediatek.com> wrote:
>
> Rewrite the MT8195 SCP device node as a cluster and
> add the SCP 2nd core in it.
>
> Since the SCP device node is changed to multi-core structure,
> enable SCP cluster to enable probing SCP core 0.
>
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../boot/dts/mediatek/mt8195-cherry.dtsi      |  6 +++-
>  arch/arm64/boot/dts/mediatek/mt8195.dtsi      | 34 ++++++++++++++-----
>  2 files changed, 30 insertions(+), 10 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
> index 37a3e9de90ff..4584077d3a4c 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
> @@ -991,7 +991,11 @@
>         interrupts-extended = <&pio 222 IRQ_TYPE_LEVEL_HIGH>;
>  };
>
> -&scp {
> +&scp_cluster {
> +       status = "okay";
> +};
> +
> +&scp_c0 {
>         status = "okay";
>
>         firmware-name = "mediatek/mt8195/scp.img";
> diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> index 48b72b3645e1..7809118f74fb 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> @@ -922,14 +922,30 @@
>                         clocks = <&infracfg_ao CLK_INFRA_AO_GCE2>;
>                 };
>
> -               scp: scp@10500000 {
> -                       compatible = "mediatek,mt8195-scp";
> -                       reg = <0 0x10500000 0 0x100000>,
> -                             <0 0x10720000 0 0xe0000>,
> -                             <0 0x10700000 0 0x8000>;
> -                       reg-names = "sram", "cfg", "l1tcm";
> -                       interrupts = <GIC_SPI 462 IRQ_TYPE_LEVEL_HIGH 0>;
> +               scp_cluster: scp@10500000 {
> +                       compatible = "mediatek,mt8195-scp-dual";
> +                       reg = <0 0x10720000 0 0xe0000>, <0 0x10700000 0 0x8000>;
> +                       reg-names = "cfg", "l1tcm";
> +                       #address-cells = <1>;
> +                       #size-cells = <1>;
> +                       ranges = <0 0 0x10500000 0x100000>;
>                         status = "disabled";
> +
> +                       scp_c0: scp@0 {
> +                               compatible = "mediatek,scp-core";
> +                               reg = <0x0 0xa0000>;
> +                               reg-names = "sram";
> +                               interrupts = <GIC_SPI 462 IRQ_TYPE_LEVEL_HIGH 0>;
> +                               status = "disabled";
> +                       };
> +
> +                       scp_c1: scp@a0000 {
> +                               compatible = "mediatek,scp-core";
> +                               reg = <0xa0000 0x20000>;
> +                               reg-names = "sram";
> +                               interrupts = <GIC_SPI 463 IRQ_TYPE_LEVEL_HIGH 0>;
> +                               status = "disabled";
> +                       };
>                 };
>
>                 scp_adsp: clock-controller@10720000 {
> @@ -2374,7 +2390,7 @@
>
>                 video-codec@18000000 {
>                         compatible = "mediatek,mt8195-vcodec-dec";
> -                       mediatek,scp = <&scp>;
> +                       mediatek,scp = <&scp_c0>;
>                         iommus = <&iommu_vdo M4U_PORT_L21_VDEC_MC_EXT>;
>                         #address-cells = <2>;
>                         #size-cells = <2>;
> @@ -2540,7 +2556,7 @@
>                                  <&iommu_vdo M4U_PORT_L19_VENC_REF_LUMA>,
>                                  <&iommu_vdo M4U_PORT_L19_VENC_REF_CHROMA>;
>                         interrupts = <GIC_SPI 341 IRQ_TYPE_LEVEL_HIGH 0>;
> -                       mediatek,scp = <&scp>;
> +                       mediatek,scp = <&scp_c0>;
>                         clocks = <&vencsys CLK_VENC_VENC>;
>                         clock-names = "venc_sel";
>                         assigned-clocks = <&topckgen CLK_TOP_VENC>;
> --
> 2.18.0
>

