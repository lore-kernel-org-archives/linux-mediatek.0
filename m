Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3C0DC43217
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Dec 2022 09:08:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5nGScKX4jj1Jm9+2UQsGpDtkdZmVBUMXPVPLWeGWQXk=; b=ntRRZWAeEMFaxtOD6il/7ixtRf
	sFIcmFmV17ncAbpdwytPxNQivQoQ8Tm+O0Ni6PqQRD8Mv1GyJ3x9jBmvXZFvBkIAoy5VHspGZV4rd
	2oWUHeWmVXdzGy2cdFjDGTRdpdM1sclrs7IhMOQXgSKhVDcFXqUG4023A+pNJ/lMfYRmtNlgZnFOS
	zbmj+smWKYTZ7ejootZjYnnE+Wl7KFVpVDqCxcZaItM/uegasWTjuyLtA2gTJLoDXJAncdfs4DurM
	9di+AZKh591aCEZOLOEOA9OxKNxWdE+luc+Qmf35n2wQyfvWCBdBdpgGHYSxCvys054KPHfX29qLS
	Ci0nkFkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0fY3-006Bh2-32; Thu, 01 Dec 2022 09:08:03 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0fXa-006BVC-Hf; Thu, 01 Dec 2022 09:07:36 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 053B06602B84;
	Thu,  1 Dec 2022 09:07:30 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1669885651;
	bh=8jHjmSVTbJv8cbYTXsHL50wkv2nBgikOZ1z0ILT8YM0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Z4JeI8M/qnmFg2yXh5HVGszAWAtnij7NwUGovyCw1VDdq8aJFaU/BOAgypQoa4QuG
	 zmxc1FKTKI4uJH7RQ9TibRk1ssye11o17QFXQKwdqFoopg2wdbvyKx3QXqndaIef/L
	 hGna4xjprrkUiRqy/czXncySOVxq52/npCTKiiz7vjiwJ7gc9eM2XMvbaAQFym49oK
	 vbvFi81vJUlY1M/l/xZMl7luMFM2v/D+6iQ9nyZ62+qXGGlyc7w5vJTkhqXXZEoGS5
	 QusJN0MzKb6ib1LAhZyQ5w3jUrv19hdmnydvz6gpaX/87pFI01+JBuufV9PNP7ZkTH
	 nd/iPGPb0L4Tw==
Message-ID: <ba14a46f-477f-70af-761d-696fe8a4f41c@collabora.com>
Date: Thu, 1 Dec 2022 10:07:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH] arm64: dts: mt8192: Add adsp power domain controller
Content-Language: en-US
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Chen-Yu Tsai <wenst@chromium.org>
References: <20221201073328.1559-1-allen-kh.cheng@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221201073328.1559-1-allen-kh.cheng@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_010734_839080_77013AEE 
X-CRM114-Status: GOOD (  18.29  )
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

Il 01/12/22 08:33, Allen-KH Cheng ha scritto:
> Add adsp power domain controller node for mt8192 SoC.
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> ---
> Ref: https://lore.kernel.org/all/2ec80bd8-dfef-d2e6-eb41-6e6088043e33@collabora.com/
>      [Allen-KH Cheng <allen-kh.cheng@mediatek.com>]
> ---
> ---
>   arch/arm64/boot/dts/mediatek/mt8192.dtsi | 8 ++++++++
>   include/dt-bindings/power/mt8192-power.h | 1 +
>   2 files changed, 9 insertions(+)
> 

Allen, thanks for this one, but it's incomplete...

First of all, you must add the power domain on the driver itself, specifically,
in drivers/soc/mediatek/mt8192-pm-domains.h - otherwise this change will have no
effect!

...Then, as Chen-Yu said, you should also add the power domain to the scp_adsp
clock node as that's solving the lockup issue...

.......and last, but not least: we need a Fixes tag to backport this fix, here
and on the commit that adds the missing power domain in the driver.

Thanks,
Angelo

> diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> index 424fc89cc6f7..e71afba871fc 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> @@ -514,6 +514,14 @@
>   						};
>   					};
>   				};
> +
> +				power-domain@MT8192_POWER_DOMAIN_ADSP {
> +					reg = <MT8192_POWER_DOMAIN_ADSP>;
> +					clocks = <&topckgen CLK_TOP_ADSP_SEL>;
> +					clock-names = "adsp";
> +					mediatek,infracfg = <&infracfg>;
> +					#power-domain-cells = <0>;
> +				};
>   			};
>   		};
>   
> diff --git a/include/dt-bindings/power/mt8192-power.h b/include/dt-bindings/power/mt8192-power.h
> index 4eaa53d7270a..63e81cd0d06d 100644
> --- a/include/dt-bindings/power/mt8192-power.h
> +++ b/include/dt-bindings/power/mt8192-power.h
> @@ -28,5 +28,6 @@
>   #define MT8192_POWER_DOMAIN_CAM_RAWA	18
>   #define MT8192_POWER_DOMAIN_CAM_RAWB	19
>   #define MT8192_POWER_DOMAIN_CAM_RAWC	20
> +#define MT8192_POWER_DOMAIN_ADSP	21
>   
>   #endif /* _DT_BINDINGS_POWER_MT8192_POWER_H */
> 


