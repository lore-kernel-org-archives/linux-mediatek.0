Return-Path: <SRS0=rIjB=KI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEC09C433ED
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 May 2021 14:52:40 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5438C61433
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 May 2021 14:52:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5438C61433
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=vanguardiasur.com.ar
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=36FhKv8G/7fSpGLu0Sc5AbLHaIGg9mypojLQx30Brx4=; b=dI/gT2i9GuOVdYcGxpPzOW6sX
	kqsq+9a6MDlrvkmqyBIhjULtXDyykWUcrN+qdYqIdQ/SUEYsS2f+1Auo03anqkKXwROMVkku0S00g
	WnQSTnSksMW7rQHJcIp4IJYbSxdLFcnvpfoRgzd1v3+hbPvAx5Wg6p/g2cq6co4klIVtBQSUXPJeE
	wRCCdoap9YamnD4L0+Q1KGA4NUy8dONUBv7rXeyZZG5Yw2POurYOWw0PSGZgXkELAALLVqwgPw9nU
	FtiBAy0DIfz6i9iJozspQc+QD3W3LVVaCFNz3siSWAGwLHcCMMqOBnRbCZJR9wCjvrOy4/a0/4dU2
	RXRlE82WA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lhChL-005nnS-JR; Thu, 13 May 2021 14:52:23 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lhCh9-005njh-Ky
 for linux-mediatek@desiato.infradead.org; Thu, 13 May 2021 14:52:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=0OfZKh7G4FCWvdITFgddq0jjch2im9fcQcbtcvyCbJ0=; b=vpEJkHuAe38gIqURl67Jw3wsso
 k/pvCWRoaa6PpKfNALcxyN19paDlR8h7fVtKth0ll4Ls5K/cov6AE+VXQon+YkNpgNp2tk04u0EgN
 65PnpF85xAzik0E3ab4feGJawp07tEJQnE1DkN3qe4+LQ3RlT7wJ+LdoJqcK56qhpOxZcKTLRTU5M
 S9tahdWbOUDVQdLBwt+R4i5zycoDuCvRYfpK4I66BZ23GGIm9NNyhSPOypK/NIAlTCSXaO85JFkcU
 7L+Xv7NwoAmcbzE2/oCeTA00MB0orfUIAqfgC/bHPrZEG3D4UVZX/0WFd2tlPwsoC0HOJeQtNGyE/
 zizWDYIg==;
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lhCh5-00BKsS-Aa
 for linux-mediatek@lists.infradead.org; Thu, 13 May 2021 14:52:09 +0000
Received: by mail-ej1-x636.google.com with SMTP id gx5so40231488ejb.11
 for <linux-mediatek@lists.infradead.org>; Thu, 13 May 2021 07:52:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vanguardiasur-com-ar.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0OfZKh7G4FCWvdITFgddq0jjch2im9fcQcbtcvyCbJ0=;
 b=yGER9sFeqImCRTjxagvrdLG2NXeJuvmnYhHyvT/N3ibkZ0cOji38G2r3ETIQg+Hjkh
 iWkFpwduPfMD3/zTiaVJ5R/D6Ok2eqmCn9maTaJ/XEGisZQmWko1EbbZbCNg/o0Xndbk
 UYvAC19wnmE2b1jbVkkvuAd/MEoAVq+usc6vd24X0pLgwurO+L6JcwXQUFVvnneLHfHE
 N8Wt49yUqefE6Hhrn/kIxCPfhOu7Ka1HDFak1FUkPbIMhdwRWDRVdLBwPcKzg6R38lYQ
 FHk8DwLtiXp6G+VquVP9NSbHCv4qUZ0WD4WJ/LjTrYVZ5SjRrsW51DB/8qINyepIGEV/
 r6Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0OfZKh7G4FCWvdITFgddq0jjch2im9fcQcbtcvyCbJ0=;
 b=E4t2VqRFftxG4ZJPuglI6ksWVtZoFsP5nuhgwe8g41XdY+Qyre6/qxpUm+baRMXhMx
 z2DHJnJB6u5ehr0frdA3+dLZZ1Sx+JehKO5nCt9tc7yTiCvrLb2pcPOAk2kBZvuzw8IV
 YkbwEGPjSByEF28HFkwxnFtSQVmEGMFCZZWZz8WxUSPuvgv1Ruu9dAiH2BC2Sj5hj3HY
 IeGtfbOKD4rSGdrSdT5kVhevf8U9rRaWl/SdnDE9pPYZG323xDdUFBNA+zav8yP4YwMj
 QxDiNw0qB32oyZx1pnEvnH+1WdcKkr7YoqTEgxklMSEBIFNZUhWOa6ktPaAUJrOR3vO+
 rlsw==
X-Gm-Message-State: AOAM532pz8h4ufRTTX7n1XQNlRpuANb1DbkI/BEgWGjkEXwIMG8ZKaue
 BkrPIdeLIgmjfxc3O9c2i5C6Z6ET/ofXUYESaY2YE8OFKfDvXQ==
X-Google-Smtp-Source: ABdhPJxM3ATiNSUpOAOJ9eWZOuQdhYbDZCWVTt9AZfZgddggWQHRJ7iT1otIC6/tIvl+X8AGtpE7CYg8qTpqn1cHFCY=
X-Received: by 2002:a17:907:b09:: with SMTP id
 h9mr13061663ejl.430.1620917525095; 
 Thu, 13 May 2021 07:52:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210421052855.1279713-1-drinkcat@chromium.org>
 <20210421132841.v13.2.I9f45f5c1f975422d58b5904d11546349e9ccdc94@changeid>
In-Reply-To: <20210421132841.v13.2.I9f45f5c1f975422d58b5904d11546349e9ccdc94@changeid>
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Thu, 13 May 2021 11:51:53 -0300
Message-ID: <CAAEAJfBQzTQmZxTeq3gQcDgNbvMtzgNXegnY0MWUOC1MZ-W1mw@mail.gmail.com>
Subject: Re: [PATCH v13 2/4] arm64: dts: mt8183: Add node for the Mali GPU
To: Nicolas Boichat <drinkcat@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>, 
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>, fshao@chromium.org,
 hsinyi@chromium.org, 
 hoegsberg@chromium.org, Tomeu Vizoso <tomeu.vizoso@collabora.com>, 
 Neil Armstrong <narmstrong@baylibre.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
 devicetree <devicetree@vger.kernel.org>, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210513_075207_802784_1DFE4C8E 
X-CRM114-Status: GOOD (  22.99  )
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

Hi Nicolas,

On Wed, 21 Apr 2021 at 02:29, Nicolas Boichat <drinkcat@chromium.org> wrote:
>
> Add a basic GPU node for mt8183.
>
> Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
> ---
> The binding we use with out-of-tree Mali drivers includes more
> clocks, this is used for devfreq: the out-of-tree driver switches
> clk_mux to clk_sub_parent (26Mhz), adjusts clk_main_parent, then
> switches clk_mux back to clk_main_parent:
> (see https://chromium.googlesource.com/chromiumos/third_party/kernel/+/chromeos-4.19/drivers/gpu/arm/midgard/platform/mediatek/mali_kbase_runtime_pm.c#423)
> clocks =
>         <&topckgen CLK_TOP_MFGPLL_CK>,
>         <&topckgen CLK_TOP_MUX_MFG>,
>         <&clk26m>,
>         <&mfgcfg CLK_MFG_BG3D>;
> clock-names =
>         "clk_main_parent",
>         "clk_mux",
>         "clk_sub_parent",
>         "subsys_mfg_cg";
> (based on discussions, this probably belongs in the clock core)
>
> This only matters for devfreq, that is disabled anyway as we don't
> have platform-specific code to handle >1 supplies.
>

Nit: I think some of this info could be relevant, so I'd make
it part of the commit description.

> (no changes since v12)
>
> Changes in v12:
>  - Add gpu node to mt8183-pumpkin.dts as well (Neil Armstrong).
>
> Changes in v11:
>  - mt8183*.dts: remove incorrect supply-names
>
> Changes in v6:
>  - Add gpu regulators to kukui dtsi as well.
>  - Power domains are now attached to spm, not scpsys
>  - Drop R-B.
>
> Changes in v5:
>  - Rename "2d" power domain to "core2" (keep R-B again).
>
> Changes in v4:
>  - Add power-domain-names to describe the 3 domains.
>    (kept Alyssa's reviewed-by as the change is minor)
>
> Changes in v2:
>  - Use sram instead of mali_sram as SRAM supply name.
>  - Rename mali@ to gpu@.
>
>  arch/arm64/boot/dts/mediatek/mt8183-evb.dts   |   5 +
>  .../arm64/boot/dts/mediatek/mt8183-kukui.dtsi |   5 +
>  .../boot/dts/mediatek/mt8183-pumpkin.dts      |   5 +
>  arch/arm64/boot/dts/mediatek/mt8183.dtsi      | 105 ++++++++++++++++++
>  4 files changed, 120 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-evb.dts b/arch/arm64/boot/dts/mediatek/mt8183-evb.dts
> index edff1e03e6fe..7bc0a6a7fadf 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183-evb.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt8183-evb.dts
> @@ -42,6 +42,11 @@ &auxadc {
>         status = "okay";
>  };
>
> +&gpu {
> +       mali-supply = <&mt6358_vgpu_reg>;
> +       sram-supply = <&mt6358_vsram_gpu_reg>;
> +};
> +
>  &i2c0 {
>         pinctrl-names = "default";
>         pinctrl-0 = <&i2c_pins_0>;
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> index ff56bcfa3370..e4e54be1c2b2 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
> @@ -279,6 +279,11 @@ dsi_out: endpoint {
>         };
>  };
>
> +&gpu {
> +       mali-supply = <&mt6358_vgpu_reg>;
> +       sram-supply = <&mt6358_vsram_gpu_reg>;
> +};
> +
>  &i2c0 {
>         pinctrl-names = "default";
>         pinctrl-0 = <&i2c0_pins>;
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts b/arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts
> index 0aff5eb52e88..ee912825cfc6 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts
> @@ -68,6 +68,11 @@ &auxadc {
>         status = "okay";
>  };
>
> +&gpu {
> +       mali-supply = <&mt6358_vgpu_reg>;
> +       sram-supply = <&mt6358_vsram_gpu_reg>;
> +};
> +
>  &i2c0 {
>         pinctrl-names = "default";
>         pinctrl-0 = <&i2c_pins_0>;
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> index c5e822b6b77a..c75fdeea8aa4 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> @@ -1118,6 +1118,111 @@ mfgcfg: syscon@13000000 {
>                         #clock-cells = <1>;
>                 };
>
> +               gpu: gpu@13040000 {
> +                       compatible = "mediatek,mt8183-mali", "arm,mali-bifrost";
> +                       reg = <0 0x13040000 0 0x4000>;
> +                       interrupts =
> +                               <GIC_SPI 280 IRQ_TYPE_LEVEL_LOW>,
> +                               <GIC_SPI 279 IRQ_TYPE_LEVEL_LOW>,
> +                               <GIC_SPI 278 IRQ_TYPE_LEVEL_LOW>;
> +                       interrupt-names = "job", "mmu", "gpu";
> +
> +                       clocks = <&topckgen CLK_TOP_MFGPLL_CK>;
> +
> +                       power-domains =
> +                               <&spm MT8183_POWER_DOMAIN_MFG_CORE0>,
> +                               <&spm MT8183_POWER_DOMAIN_MFG_CORE1>,
> +                               <&spm MT8183_POWER_DOMAIN_MFG_2D>;
> +                       power-domain-names = "core0", "core1", "core2";
> +
> +                       operating-points-v2 = <&gpu_opp_table>;
> +               };
> +
> +               gpu_opp_table: opp_table0 {

If my eyes don't fool me, the OPP table being here means it's a child
of the "soc" node. Given it's not an SoC peripheral,
it'd make more sense to move it to root "/".

Other than that, I think it looks good:

Reviewed-by: Ezequiel Garcia <ezequiel@collabora.com>

Thanks!
Ezequiel

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
