Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD325C54E60
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Mar 2024 11:47:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zi4p6xTyoLW8RCLPWZHPX12XLuSuP6TykNDXaCdvoXU=; b=lwrKlkO7vk5tO92f4t4QuNh+/R
	O7oHt69z8eE1fuk4q1qp1LzDagpWsCl5DkFiqpXWA+eOBOkIvDH+fLGcWxHpTqcmZZsxjQPzKpoLo
	uowzfF1v2ysTp/kSmMFTW7fW9Utj2YCqVBm1Qe07lElVs36kxGRo7FTjJm1KRVaPO1YZJVSRoZo1u
	MdX2jOvi75r5PVgRnk1B2D4fEnJU+MqXoHhquEYj+ilBDB5F/bJ+Xh3OPBASHY1xrhY681Cw8aeGb
	kOf9a9RcrtHL/xIPcStkJuzYw/EXMdo4mWeY9IOVb4g9XwqTh8l+ZQG9f8CiYdIbkcwUPRtJmNx9k
	RXIVjhVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmXwb-0000000CWVl-1iqo;
	Tue, 19 Mar 2024 11:47:49 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmXwY-0000000CWTp-1Nly
	for linux-mediatek@lists.infradead.org;
	Tue, 19 Mar 2024 11:47:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1710848865;
	bh=qP5gXkLN9BbD+xAGyMSyZHGa30YnfxKKydf78AcNovs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Amh5jQdjBcqhcjs7kG7HE2t/lX8p12H9abwdZrLqx/uRR1MOoV+lS1U0ShGDaqHi0
	 P41UQP4qdmLFVglubo0f48fGH587hCJNRM2U5j2j6z8Su6Gx4w+qfPrsh/mTiOOYGM
	 HUmll1+xjDg3c6D1PxSdOi4Esv5K+5QkIK05gQoUIaRa8V0RmYFnA1ZJso1FkGJb3P
	 vZnccgM5Q9r16A9479VmQZLhd17XiZ1D6O0sYQRwUV7k2V1TD1wmAK9U/arAfheueS
	 AcuKJFF+QK5+GvzK/NAC+CBamuk3I7RoXn5WNpIn0DxcFMOnfOCZDpKq38clt7FPwr
	 eM9F/W55w/a7w==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 94C1C378203E;
	Tue, 19 Mar 2024 11:47:44 +0000 (UTC)
Message-ID: <2752f476-db91-46a5-a32f-458b7067063d@collabora.com>
Date: Tue, 19 Mar 2024 12:47:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/13] arm64: dts: mediatek: mt8186: add lvts
 definitions
Content-Language: en-US
To: Nicolas Pitre <nico@fluxnic.net>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, linux-pm@vger.kernel.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org
Cc: Nicolas Pitre <npitre@baylibre.com>
References: <20240318212428.3843952-1-nico@fluxnic.net>
 <20240318212428.3843952-7-nico@fluxnic.net>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240318212428.3843952-7-nico@fluxnic.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240319_044746_537664_AB30BD02 
X-CRM114-Status: GOOD (  12.55  )
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

Il 18/03/24 22:22, Nicolas Pitre ha scritto:
> From: Nicolas Pitre <npitre@baylibre.com>
> 
> Values extracted from vendor source tree.
> 
> Signed-off-by: Nicolas Pitre <npitre@baylibre.com>
> ---
>   arch/arm64/boot/dts/mediatek/mt8186.dtsi | 20 ++++++++++++++++++++
>   1 file changed, 20 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8186.dtsi b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
> index 2fec6fd1c1..7b7a517a41 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8186.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
> @@ -1355,6 +1355,18 @@ spi0: spi@1100a000 {
>   			status = "disabled";
>   		};
>   
> +		lvts: lvts@1100b000 {

This is not generic and LVTS ain't special.

thermal-sensor@1100b000

Also, please use the correct length - you're clashing with the SVS iospace.

> +			compatible = "mediatek,mt8186-lvts";
> +			#thermal-sensor-cells = <1>;
> +			reg = <0 0x1100b000 0 0x1000>;
> +			interrupts = <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks = <&infracfg_ao CLK_INFRA_AO_THERM>;
> +			clock-names = "lvts_clk";
> +			resets = <&infracfg_ao MT8186_INFRA_THERMAL_CTRL_RST>;
> +			nvmem-cells = <&lvts_e_data1 &lvts_e_data2>;
> +			nvmem-cell-names = "e_data1","e_data2";
> +		};
> +
>   		pwm0: pwm@1100e000 {
>   			compatible = "mediatek,mt8186-disp-pwm", "mediatek,mt8183-disp-pwm";
>   			reg = <0 0x1100e000 0 0x1000>;
> @@ -1668,6 +1680,14 @@ efuse: efuse@11cb0000 {
>   			#address-cells = <1>;
>   			#size-cells = <1>;
>   
> +			lvts_e_data1: data1 {

Please always run `make dtbs_check`

Regards,
Angelo

> +				reg = <0x1cc 0x14>;
> +			};
> +
> +			lvts_e_data2: data1-1 {
> +				reg = <0x2f8 0x14>;
> +			};
> +
>   			gpu_speedbin: gpu-speedbin@59c {
>   				reg = <0x59c 0x4>;
>   				bits = <0 3>;

-- 
AngeloGioacchino Del Regno
Senior Software Engineer

Collabora Ltd.
Platinum Building, St John's Innovation Park, Cambridge CB4 0DS, UK
Registered in England & Wales, no. 5513718


