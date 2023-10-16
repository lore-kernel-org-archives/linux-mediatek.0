Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B95ABCDB465
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Oct 2023 13:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SZV4EDZxu11ZehAURzaqAFVqCrv5j+mo+YLi4NuuYYs=; b=ANbsvOcN8X+WxKILbKsgR6LSiT
	D2D5xM4x86JDF/hNcw4hdE2KmX9/CYEdwuL3ObWfmqIphaQ5ReUDWbOjYScVRuR+HlGW5Qi/Js73m
	1OjNEznD0RA6oojYohpHJIPO/o+OZZqjb5XeeC/M+HmnS3Gk2kbLTimwYQSKI4JK8OkshpvFidL6g
	rlijgBw0IbKLlq5Fx+z9jyHHwKmzXYENO+j/BavIGRZGFCIa3yVzikNODB2MZA7Qj9LUumI6N7FUg
	THncKrNoAelJj5JaQrvozF+TkWbmy0wVbhAvq1/XF4A8i6p/8m4fh8ItJyWzcXB7z/tPmyV869E9c
	SlL9WrmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsNyC-009mtj-2K;
	Mon, 16 Oct 2023 13:49:20 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsNy8-009msi-2q;
	Mon, 16 Oct 2023 13:49:19 +0000
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A23CC814;
	Mon, 16 Oct 2023 15:49:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1697464149;
	bh=t+PLOpuYLM9fzpu9xviRvNQwyTYfO+G1IWfy8+wyL2Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nGDLclfqRR8+n8ZgI6ljy/el2KWIiCfzcS913xdb/xuu5px5BBNqyK4DHaPvlDA52
	 rvkIZZvLdIkQJ3h8kM6OcJ1WfBqfDNkBgooQEgQO3dOK+GumUmBmC+Oy5VYmLJUW4u
	 vy6niDqta9QmRoC7+yzNLMDzOk4VEfMxikxlAsyE=
Date: Mon, 16 Oct 2023 16:49:22 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Bernhard =?utf-8?Q?Rosenkr=C3=A4nzer?= <bero@baylibre.com>
Cc: linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	angelogioacchino.delregno@collabora.com, matthias.bgg@gmail.com,
	gregkh@linuxfoundation.org, krzysztof.kozlowski+dt@linaro.org,
	robh+dt@kernel.org, maz@kernel.org, tglx@linutronix.de
Subject: Re: [PATCH v11 3/3] arm64: dts: mediatek: Initial mt8365-evk support
Message-ID: <20231016134922.GA6523@pendragon.ideasonboard.com>
References: <20230309213501.794764-1-bero@baylibre.com>
 <20230309213501.794764-4-bero@baylibre.com>
 <20231016134804.GA15778@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231016134804.GA15778@pendragon.ideasonboard.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231016_064917_059429_53361690 
X-CRM114-Status: GOOD (  20.18  )
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

On Mon, Oct 16, 2023 at 04:48:06PM +0300, Laurent Pinchart wrote:
> Hello,
> 
> A bit of a late reply, but I've just noticed an issue related to this
> patch.
> 
> On Thu, Mar 09, 2023 at 10:35:01PM +0100, Bernhard Rosenkränzer wrote:
> > From: Fabien Parent <fparent@baylibre.com>
> > 
> > This adds minimal support for the Mediatek 8365 SOC and the EVK reference
> > board, allowing the board to boot to initramfs with serial port I/O.
> > 
> > Signed-off-by: Fabien Parent <fparent@baylibre.com>
> > [bero@baylibre.com: Removed parts depending on drivers that aren't upstream yet, cleanups, add CPU cache layout, add systimer, fix GIC]
> > Signed-off-by: Bernhard Rosenkränzer <bero@baylibre.com>
> > [aouledameur@baylibre.com: Fix systimer properties]
> > Signed-off-by: Amjad Ouled-Ameur <aouledameur@baylibre.com>
> > Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> > Tested-by: Kevin Hilman <khilman@baylibre.com>
> > Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> > ---
> >  arch/arm64/boot/dts/mediatek/Makefile       |   1 +
> >  arch/arm64/boot/dts/mediatek/mt8365-evk.dts | 168 +++++++++
> >  arch/arm64/boot/dts/mediatek/mt8365.dtsi    | 377 ++++++++++++++++++++
> >  3 files changed, 546 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/mediatek/mt8365-evk.dts
> >  create mode 100644 arch/arm64/boot/dts/mediatek/mt8365.dtsi
> 
> [snip]
> 
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8365.dtsi b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
> > new file mode 100644
> > index 0000000000000..351197c453c91
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
> > @@ -0,0 +1,377 @@
> > +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> > +/*
> > + * (C) 2018 MediaTek Inc.
> > + * Copyright (C) 2022 BayLibre SAS
> > + * Fabien Parent <fparent@baylibre.com>
> > + * Bernhard Rosenkränzer <bero@baylibre.com>
> > + */
> > +#include <dt-bindings/clock/mediatek,mt8365-clk.h>
> > +#include <dt-bindings/interrupt-controller/arm-gic.h>
> > +#include <dt-bindings/interrupt-controller/irq.h>
> > +#include <dt-bindings/phy/phy.h>
> > +
> > +/ {
> 
> [snip]
> 
> > +	soc {
> 
> [snip]
> 
> > +		infracfg: syscon@10001000 {
> > +			compatible = "mediatek,mt8365-infracfg", "syscon";
> > +			reg = <0 0x10001000 0 0x1000>;
> > +			#clock-cells = <1>;
> > +		};
> 
> [snip]
> 
> > +		infracfg_nao: infracfg@1020e000 {
> > +			compatible = "mediatek,mt8365-infracfg", "syscon";
> > +			reg = <0 0x1020e000 0 0x1000>;
> > +			#clock-cells = <1>;
> > +		};
> 
> These two nodes cause the infracfg clocks to be registered twice, with
> the second probe of the clk-mt8365 driver failing with -EEXIST.

These are the messages printed by v6.6-rc6:

[    0.540254] Failed to register clk ifr_pmic_tmr: -EEXIST
[    0.541003] clk-mt8365: probe of 1020e000.infracfg failed with error -17

> [snip]
> 
> > +	};
> 
> [snip]
> 
> > +};

-- 
Regards,

Laurent Pinchart

