Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4E52CF9C5B
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Sep 2024 08:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PcSAVESOaCGqs83RLJtZ0sT1Uwiuc7hZ2/xQgOgC6gw=; b=UGZDGvIzKyjHSrtX9cVeEz97ec
	aoEXbNQ26x9/UszAY3iDCmVtFIvzCb+ccOHTt4Vh2Cnyse8wY4bdyOr+pzSBcSCKxKBiaIohxD+uM
	iamFoq55gnROXz346T5IW/k6bqn/jH1UeWY2Ma89nII5S8OwmR/LKv3SK8QjzWIrmG6kiWTMApvG9
	OBQiqKS3/nodnjDobFMkw6FA/ShVsfMku0+Go+p7ddYY9Rg8S2OK3okJ4ZLwLxUAg3/5PCZNyjIip
	LrpF1XXIQROlM/6O+9FDPTucET8nJcJxeVrCdtMeN+W7YpjRqBxeWrqQH9Cct409Kjq7auZCyWGZp
	hMRhB4lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ssein-0000000Giir-347N;
	Mon, 23 Sep 2024 08:47:05 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ssehe-0000000GiWm-3YvQ;
	Mon, 23 Sep 2024 08:45:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1727081152;
	bh=mXPvosYulSuPT7ayp0NuQzaRA/qTKHHryuamBJ6tKAg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ab2SuDMwkBRp5z1ddjV1kndbZFoRoDJs/gbRp/1F6QHds+SsCPAzvxlvzwfr1kenn
	 NZiDzC1RWIb20y3TC0kfXXVsLYmVVvs0+TWow8hdLM2B0/jhqI99oyJuR5RGymHlIZ
	 vQ1niFnx6iCwtONJyeTXI6WtJK1pC3JKJVebO6e03M1PGQAg/AilT3w3v6VFyn2m4i
	 iTvp8OTsqw+/CUexEupeYI1I7VjyV69dstsjESnmZPGG4LYz5O+6D3azcm6dhKapdS
	 9lYKdJ1R2mcDAxtgizIdjq1TGMDv2N4nJSqCnYsMc8bJ3GU0ANeYVZliPo/qFcoj/R
	 HaAZMWUNdAj7Q==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4419E17E1063;
	Mon, 23 Sep 2024 10:45:52 +0200 (CEST)
Message-ID: <eb17085d-78ff-4833-a4de-17b9327d776c@collabora.com>
Date: Mon, 23 Sep 2024 10:45:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] arm64: dts: mediatek: mt8390-genio-700-evk: Enable
 Mali GPU
To: Pablo Sun <pablo.sun@mediatek.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-clk@vger.kernel.org
References: <20240920134111.19744-1-pablo.sun@mediatek.com>
 <20240920134111.19744-6-pablo.sun@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240920134111.19744-6-pablo.sun@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240923_014555_075753_D52901BD 
X-CRM114-Status: GOOD (  18.05  )
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

Il 20/09/24 15:41, Pablo Sun ha scritto:
> Configure GPU regulator supplies and enable GPU for GENIO 700 EVK.
> 
> The GPU in MT8390 & MT8188 has two power inputs: "DVDD_GPU" and
> "DVDD_SRAM_GPU". In Genio 700 EVK, DVDD_GPU is supplied by
> mt6359_vproc2_buck_reg, and DVDD_SRAM_GPU is supplied by
> mt6359_vsram_others_ldo_reg.
> 
> According to section 5.2 "Recommended Operating Conditions" in
> MT8390 IoT Application Processor Datasheet v1.9, The recommended
> operating voltage ranges are:
> 
> - DVDD_GPU: min 0.55V, max 0.86V, typical 0.75V
> - DVDD_SRAM_GPU: min 0.71V, max 0.92V, typical 0.85V
> 
> In this commit, we set DVDD_SRAM_GPU to typical 0.85V. It is possbile
> to couple it to the DVDD_GPU in future patches.
> 
> Signed-off-by: Pablo Sun <pablo.sun@mediatek.com>

Is there any real difference between MT8390 and MT8188 in terms of the GPU OPPs?

I see that on MT8188, frequencies up to 880MHz want a DVDD_SRAM_GPU of 0.750V,
then 0.775/0.762/0.750 (bin1-4/5/6) on 915MHz, and 0.800/0.775/0.750 (bin1-4/5/6)
on 950MHz.

Those never call for 0.850V...! So is MT8188 (Chromebooks) wrong, or is MT8390
different in that?

Cheers,
Angelo

> ---
>   .../dts/mediatek/mt8390-genio-700-evk.dts     | 24 +++++++++++++++++++
>   1 file changed, 24 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dts b/arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dts
> index 1474bef7e754..a1d6f4cd4e5f 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dts
> @@ -190,6 +190,11 @@ usb_p2_vbus: regulator-10 {
>   	};
>   };
>   
> +&gpu {
> +	mali-supply = <&mt6359_vproc2_buck_reg>;
> +	status = "okay";
> +};
> +
>   &i2c0 {
>   	pinctrl-names = "default";
>   	pinctrl-0 = <&i2c0_pins>;
> @@ -253,6 +258,14 @@ &i2c6 {
>   	status = "okay";
>   };
>   
> +&mfg0 {
> +	domain-supply = <&mt6359_vproc2_buck_reg>;
> +};
> +
> +&mfg1 {
> +	domain-supply = <&mt6359_vsram_others_ldo_reg>;
> +};
> +
>   &mmc0 {
>   	status = "okay";
>   	pinctrl-names = "default", "state_uhs";
> @@ -314,6 +327,11 @@ &mt6359_vpa_buck_reg {
>   	regulator-max-microvolt = <3100000>;
>   };
>   
> +&mt6359_vproc2_buck_reg {
> +	regulator-min-microvolt = <550000>;
> +	regulator-max-microvolt = <860000>;
> +};
> +
>   &mt6359_vpu_buck_reg {
>   	regulator-always-on;
>   };
> @@ -326,6 +344,12 @@ &mt6359_vsim1_ldo_reg {
>   	regulator-enable-ramp-delay = <480>;
>   };
>   
> +/* for GPU SRAM */
> +&mt6359_vsram_others_ldo_reg {
> +	regulator-min-microvolt = <850000>;
> +	regulator-max-microvolt = <850000>;
> +};
> +
>   &mt6359_vufs_ldo_reg {
>   	regulator-always-on;
>   };


