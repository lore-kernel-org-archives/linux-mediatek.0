Return-Path: <SRS0=95qJ=OR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30E37C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Sep 2021 12:41:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DFE7D60184
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Sep 2021 12:41:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DFE7D60184
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0YfJZ6Ny/hYdsOZYkaZVW4ultONo+viWK6DAbCJmqdE=; b=bojF/2KpuTdIgLPeZXQVv4Kewf
	CSXWlVj3DVLghaZxJrfEg8U4oaAsxiO3UzJ6DqR1aUG6Y52Bs6kyCtwJpZhdDOms9uJFzJiao+xrF
	Hd0o3dnA+itE4jNuooW2uBcQvpcSCkzcfR5H/7O12DQW1su0I9kUmdl1WXkQHpkJrRo0Jad3a7/H7
	XbJ+KeE1+J3CfzVgI0DzRaVQ78nSlWGvLpl2eAhl6BQoBUvaxXZ9lz8I9VIhUQX6h3PG9ArntJQA6
	s+JnCzWxd/uJPxv0M5ef2ajyL8KfDEg0wsjcSRDLt2vUxuyclJVvTkmIuHLNf4nMsrW+xX1MVdRlH
	HW4MDrHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mUpwt-002ejI-6S; Mon, 27 Sep 2021 12:41:35 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mUpwd-002ef9-P8; Mon, 27 Sep 2021 12:41:21 +0000
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [51.254.78.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7C64260F46;
 Mon, 27 Sep 2021 12:41:19 +0000 (UTC)
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
 by disco-boy.misterjones.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <maz@kernel.org>)
 id 1mUpwb-00DF4m-GL; Mon, 27 Sep 2021 13:41:17 +0100
MIME-Version: 1.0
Date: Mon, 27 Sep 2021 13:41:17 +0100
From: Marc Zyngier <maz@kernel.org>
To: Sam Shih <sam.shih@mediatek.com>
Cc: matthias.bgg@gmail.com, Ryder.Lee@mediatek.com,
 devicetree@vger.kernel.org, enric.balletbo@collabora.com,
 fparent@baylibre.com, gregkh@linuxfoundation.org,
 herbert@gondor.apana.org.au, hsinyi@chromium.org, john@phrozen.org,
 linus.walleij@linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-crypto@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-serial@vger.kernel.org,
 linux-watchdog@vger.kernel.org, linux@roeck-us.net, mpm@selenic.com,
 mturquette@baylibre.com, robh+dt@kernel.org, sboyd@kernel.org,
 sean.wang@kernel.org, seiya.wang@mediatek.com, wim@linux-watchdog.org
Subject: Re: [v3,8/9] arm64: dts: mediatek: add mt7986a support
In-Reply-To: <20210924112017.14107-1-sam.shih@mediatek.com>
References: <016b501b-a4bf-c74d-9f7f-8145800ca6e0@gmail.com>
 <20210924112017.14107-1-sam.shih@mediatek.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <0459da08cddc579f069a28e659e614fd@kernel.org>
X-Sender: maz@kernel.org
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: sam.shih@mediatek.com, matthias.bgg@gmail.com,
 Ryder.Lee@mediatek.com, devicetree@vger.kernel.org,
 enric.balletbo@collabora.com, fparent@baylibre.com, gregkh@linuxfoundation.org,
 herbert@gondor.apana.org.au, hsinyi@chromium.org, john@phrozen.org,
 linus.walleij@linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-crypto@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-serial@vger.kernel.org,
 linux-watchdog@vger.kernel.org, linux@roeck-us.net, mpm@selenic.com,
 mturquette@baylibre.com, robh+dt@kernel.org, sboyd@kernel.org,
 sean.wang@kernel.org, seiya.wang@mediatek.com, wim@linux-watchdog.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
 SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210927_054119_913354_1A451528 
X-CRM114-Status: GOOD (  15.90  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 2021-09-24 12:20, Sam Shih wrote:
> Add basic chip support for Mediatek mt7986a, include
> uart nodes with correct clocks, rng node with correct clock,
> and watchdog node and mt7986a pinctrl node.
> 
> Add cpu node, timer node, gic node, psci and reserved-memory node
> for ARM Trusted Firmware,
> 
> Add clock controller nodes, include 40M clock source, topckgen, 
> infracfg,
> apmixedsys and ethernet subsystem.
> 
> Signed-off-by: Sam Shih <sam.shih@mediatek.com>
> ---
> v3: used the stdout-path instead of console=ttyS0
> v2: modified clock and uart node due to clock driver updated
> ---
>  arch/arm64/boot/dts/mediatek/Makefile        |   1 +
>  arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts |  54 +++++
>  arch/arm64/boot/dts/mediatek/mt7986a.dtsi    | 227 +++++++++++++++++++
>  3 files changed, 282 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts
>  create mode 100644 arch/arm64/boot/dts/mediatek/mt7986a.dtsi

[...]

> +	timer {
> +		compatible = "arm,armv8-timer";
> +		interrupt-parent = <&gic>;
> +		clock-frequency = <13000000>;

No. Please fix your firmware to program CNTFRQ_EL0 on all CPUs.
This may have been OK in 2011, but not anymore.

> +		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
> +			     <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>,
> +			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
> +			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>;
> +	};
> +
> +	soc {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		compatible = "simple-bus";
> +		ranges;
> +
> +		gic: interrupt-controller@c000000 {
> +			compatible = "arm,gic-v3";
> +			#interrupt-cells = <3>;
> +			interrupt-parent = <&gic>;
> +			interrupt-controller;
> +			reg = <0 0x0c000000 0 0x40000>,
> +			      <0 0x0c080000 0 0x200000>;

This looks wrong. 128kB per redistributor frames and 4 CPUs do
no result in 2MB worth of MMIO.

This is also missing the GICV/GICV/GICH regions that are exposed
by the CPUs directly.

         M.
-- 
Jazz is not dead. It just smells funny...

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
