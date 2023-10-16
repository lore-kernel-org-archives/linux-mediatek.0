Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D25F9CDB465
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Oct 2023 13:48:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NUeU0iErqaa5qk+xFDaFjl24jQwLWaAnjow5uV0snzI=; b=pONQMp2sBPURrKVMY1s4041VZN
	Fb6lu3NAn0DXBBrSg48z/BnHjyXxENIJ5CZQKsw6EHAlV9xI4TB76AXgsEpTmrB39Ar31lFA7ZnaN
	40ajqzNU6dJWOpqWqASGDG/DVQkHAAtUj3Ox5iNYUq4i1sW4PpL0I+xezDKgsCWkprlxDnl4mKKCa
	k4qYUj3LRafQTgKdJJRbNJ6sRHAppbZnGWehk1IhrE3brEROddtf2AISEKhuW6BLIBXw4DfKgMiTx
	reTzFE16Nkxg6vng2nks/WwvcdTDy4oqUkpeb6QAUHu24/c6hx+xCUQ+BwNWx1e+80s1T4dTTuFz9
	lcE1BnCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsNx4-009mgt-2N;
	Mon, 16 Oct 2023 13:48:10 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsNwy-009mfD-37;
	Mon, 16 Oct 2023 13:48:09 +0000
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3EDE6814;
	Mon, 16 Oct 2023 15:47:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1697464072;
	bh=f97DIqnul/BgQzKIc92p98PsvcgheZXYtkIIEDSitQg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hkY+O935WG4/lTsCXW1DTzUuFu9IGE3NfAAO9f/R3DH9d5HVLKMgqrksba/GoNZJl
	 o8uyAVyyFfy2K12+hJE6TTvTwTcbdFwkut0zmC6fPsWhysSNXy3BR2KZGwr0SR/Ove
	 aDTYRSjgpOamg/llJuUJZQt0BJ6FnLkhgMJ0z20E=
Date: Mon, 16 Oct 2023 16:48:04 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Bernhard =?utf-8?Q?Rosenkr=C3=A4nzer?= <bero@baylibre.com>
Cc: linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	angelogioacchino.delregno@collabora.com, matthias.bgg@gmail.com,
	gregkh@linuxfoundation.org, krzysztof.kozlowski+dt@linaro.org,
	robh+dt@kernel.org, maz@kernel.org, tglx@linutronix.de
Subject: Re: [PATCH v11 3/3] arm64: dts: mediatek: Initial mt8365-evk support
Message-ID: <20231016134804.GA15778@pendragon.ideasonboard.com>
References: <20230309213501.794764-1-bero@baylibre.com>
 <20230309213501.794764-4-bero@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230309213501.794764-4-bero@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231016_064805_165107_AB573257 
X-CRM114-Status: GOOD (  16.59  )
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

Hello,

A bit of a late reply, but I've just noticed an issue related to this
patch.

On Thu, Mar 09, 2023 at 10:35:01PM +0100, Bernhard Rosenkränzer wrote:
> From: Fabien Parent <fparent@baylibre.com>
> 
> This adds minimal support for the Mediatek 8365 SOC and the EVK reference
> board, allowing the board to boot to initramfs with serial port I/O.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> [bero@baylibre.com: Removed parts depending on drivers that aren't upstream yet, cleanups, add CPU cache layout, add systimer, fix GIC]
> Signed-off-by: Bernhard Rosenkränzer <bero@baylibre.com>
> [aouledameur@baylibre.com: Fix systimer properties]
> Signed-off-by: Amjad Ouled-Ameur <aouledameur@baylibre.com>
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> Tested-by: Kevin Hilman <khilman@baylibre.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  arch/arm64/boot/dts/mediatek/Makefile       |   1 +
>  arch/arm64/boot/dts/mediatek/mt8365-evk.dts | 168 +++++++++
>  arch/arm64/boot/dts/mediatek/mt8365.dtsi    | 377 ++++++++++++++++++++
>  3 files changed, 546 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt8365-evk.dts
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt8365.dtsi

[snip]

> diff --git a/arch/arm64/boot/dts/mediatek/mt8365.dtsi b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
> new file mode 100644
> index 0000000000000..351197c453c91
> --- /dev/null
> +++ b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
> @@ -0,0 +1,377 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/*
> + * (C) 2018 MediaTek Inc.
> + * Copyright (C) 2022 BayLibre SAS
> + * Fabien Parent <fparent@baylibre.com>
> + * Bernhard Rosenkränzer <bero@baylibre.com>
> + */
> +#include <dt-bindings/clock/mediatek,mt8365-clk.h>
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/phy/phy.h>
> +
> +/ {

[snip]

> +	soc {

[snip]

> +		infracfg: syscon@10001000 {
> +			compatible = "mediatek,mt8365-infracfg", "syscon";
> +			reg = <0 0x10001000 0 0x1000>;
> +			#clock-cells = <1>;
> +		};

[snip]

> +		infracfg_nao: infracfg@1020e000 {
> +			compatible = "mediatek,mt8365-infracfg", "syscon";
> +			reg = <0 0x1020e000 0 0x1000>;
> +			#clock-cells = <1>;
> +		};

These two nodes cause the infracfg clocks to be registered twice, with
the second probe of the clk-mt8365 driver failing with -EEXIST.

[snip]

> +	};

[snip]

> +};

-- 
Regards,

Laurent Pinchart

