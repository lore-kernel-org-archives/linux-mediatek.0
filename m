Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E5E3C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Jul 2022 22:26:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VOoLANQTxH9NX0ayOpt9gV8hLmqZGDs4vcErvlk2aDM=; b=tkCx4p6Bj852O9AvkSwvM+B3FV
	8/AtpixvobzfFZgFMmmeJNxy4x4Ek6QfmwEdTrHoppxdvoNRcERZE8CQnlw050V8t/zE4tV/2ye8a
	1JqoqNR2jZ/pminLWVqhI/aB9lWhwA96fo3qG/0nJoin/2XFXTP3l0E/GhSMPbDMbFrPY+jQgBDtB
	39nsXRTwjZxYGa9xswr7jSD+bm5iA9POQv+XaLcBFdMsOnnuwLnMJgGIAdxdmCqGDiRjs9wHgTUf1
	ddiewWPvm/SMAVORQCOOhqn05nG+7Nv/PomxFVndwWAomCldEVM0R7L9GpOmhgKY4Fdxiv3BrTfuJ
	8eMGne6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7P5q-007DKz-Mp; Fri, 01 Jul 2022 22:26:30 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7P5f-007DI3-VL; Fri, 01 Jul 2022 22:26:21 +0000
Received: from notapiano (unknown [194.36.25.35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 4E0F566017F5;
	Fri,  1 Jul 2022 23:26:14 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1656714377;
	bh=beS5ia/epfrcQ6hdTw5AHZCvOKhrfWGiS1y5nk9Am2U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=STp0U8Ao78Klox+71MTgbfJRjfjdaEkXSCVsMjF5mHJRTTbTpaseIN+VA/bXaOYc0
	 q4TDttde0IZm4jASx3gX9Qz6dEjt6JtTI4EnLJvcI/GlxsUqPfg/wxObtjCXbTnvrW
	 53xvASSd4bs07A3030tOm4YsYmhAZT1rSni07usd9LH2syDI2ELgG/J8Do7vHzoA2c
	 bRSxM+vyoGri8THfzfKwk3yRO2HZETNaq+cP0G25t56PZWLHZYef26VDjNE8SYG83W
	 kql0SmkB4QuqKSLQk7AQz55lfZlpVaaIHcXuE6ZS8EIkDeW1IqM0G8EYiVC1dU8NKV
	 Pw6wnMVaNLD0w==
Date: Fri, 1 Jul 2022 18:26:09 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com, hsinyi@chromium.org,
	allen-kh.cheng@mediatek.com, gtk3@inbox.ru, luca@z3ntu.xyz,
	sam.shih@mediatek.com, sean.wang@mediatek.com,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, wenst@chromium.org
Subject: Re: [PATCH 04/11] arm64: dts: mediatek: cherry: Add platform
 regulators layout and config
Message-ID: <20220701222609.w6nowe5ng4ndszol@notapiano>
References: <20220630153316.308767-1-angelogioacchino.delregno@collabora.com>
 <20220630153316.308767-5-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220630153316.308767-5-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220701_152620_179241_E64611C5 
X-CRM114-Status: GOOD (  16.96  )
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

On Thu, Jun 30, 2022 at 05:33:09PM +0200, AngeloGioacchino Del Regno wrote:
> Add the regulators layout for this platform, including the basic power
> rails controlled by the EC (and/or always on).
> Moreover, include the MT6359 PMIC devicetree and add some configuration
> for its regulators, essential to keep the machine alive after booting.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../boot/dts/mediatek/mt8195-cherry.dtsi      | 102 ++++++++++++++++++
>  1 file changed, 102 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
> index 14f8f30b1eb3..091338f7d5ff 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
> @@ -5,6 +5,7 @@
>  
>  #include <dt-bindings/gpio/gpio.h>
>  #include "mt8195.dtsi"
> +#include "mt6359.dtsi"
>  
>  / {
>  	aliases {
> @@ -19,6 +20,107 @@ memory@40000000 {
>  		device_type = "memory";
>  		reg = <0 0x40000000 0 0x80000000>;
>  	};
> +
> +	/* system wide LDO 3.3V power rail */
> +	pp3300_z5: regulator-3v3-pp3300-ldo-z5 {

I wouldn't have both "3v3" and "pp3300" in the node name since they mean the
same thing, but feel free to ignore this comment :).

> +		compatible = "regulator-fixed";
> +		regulator-name = "pp3300_ldo_z5";
> +		regulator-always-on;
> +		regulator-boot-on;
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		vin-supply = <&ppvar_sys>;
> +	};
> +
> +	/* separately switched 3.3V power rail */
> +	pp3300_s3: regulator-3v3-pp3300-s3 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "pp3300_s3";
> +		/* automatically sequenced by PMIC EXT_PMIC_EN2 */
> +		regulator-always-on;
> +		regulator-boot-on;

Missing regulator-min/max-microvolt?

> +		vin-supply = <&pp3300_z2>;
> +	};
[..]
> -- 
> 2.35.1
> 

Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Thanks,
Nícolas

