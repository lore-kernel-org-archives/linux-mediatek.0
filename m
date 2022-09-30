Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4506C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Sep 2022 08:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eDWi3XDChFDymfevy7CuQSc9pRdzQLaHoYKcsNtb0wU=; b=1/qeZgJBndfETNoA3CArDRgo1T
	zmRlvjXxuI20AE8kuh2Z+zOuBrBOO9JWKH24xMlOTUhIbgGHgYCT8hfUEAf8heSUTSDz3BT8T3jJn
	l4qkEO2nj8vQR78fmqnTODAem+iZt4zTFO0ScYSV+5ppgaPd4mcGjP0t2V9k/AGQE8AZEyE8js2Fg
	PqS9rjhvpaz07rNL+QplUlkQui3XYCifQWPuKQXXgl2EMR8lnHrM2ec9uPWTNfcUVqENsEk4TsUPq
	OMGOv+To1StB1jeoJWIXmVcEt+3FPoJe2ojswgMqb0U8hM+fWe6tI/jNuz/hkZBdyUivsLfNRYEy9
	Gg5+jZpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oeBWx-0087Dq-W5; Fri, 30 Sep 2022 08:38:00 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oeBWl-008798-5b; Fri, 30 Sep 2022 08:37:48 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 0AFE866022C7;
	Fri, 30 Sep 2022 09:37:45 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1664527065;
	bh=hXP7tMGt4lvZFrdQ9N3TpH0XDUHGm1MVYQ0cksxXiok=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bHq7DgC+/YoPhbpQ2DlRNolNFuBUJCN8LSqY3rX6aMcIdi9S2NLRVABWK6unpXPce
	 DsMs3ebPHieeU8uJzB6P9npvebFoOLixXRJKWCiNkNtXzoq1nOTsWM7b3zjXfmPVrL
	 YctNGImbPkfZ/LXBoKqvqOYbFukNjD2ONVaIK31jqXAgtqgz0apN2sC2fpM6kYpldp
	 p+P1v+8/EOxV6cllV9Qgyg50DYYCDZLne8dsOFYpOJPv5ihn7rYL/beC0On+VRaZo/
	 0x6ZGbaqNNCk25qyOeYo0qZZTeMHwfavidRRquz8i6C1TK8cK3pe7wVMg2gpOq2TrU
	 Mg6oFiKz3P0Iw==
Message-ID: <08017725-7e32-1967-65ee-246b9e692a95@collabora.com>
Date: Fri, 30 Sep 2022 10:37:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v3 2/2] arm64: dts: mt8192: Add vcodec lat and core nodes
Content-Language: en-US
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
References: <20220929131309.18337-1-allen-kh.cheng@mediatek.com>
 <20220929131309.18337-3-allen-kh.cheng@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220929131309.18337-3-allen-kh.cheng@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220930_013747_372324_589A0223 
X-CRM114-Status: GOOD (  16.81  )
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

Il 29/09/22 15:13, Allen-KH Cheng ha scritto:
> Add vcodec lat and core nodes for mt8192 SoC.
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> Tested-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
>   arch/arm64/boot/dts/mediatek/mt8192.dtsi | 60 ++++++++++++++++++++++++
>   1 file changed, 60 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> index 6b20376191a7..fd3c3aaeadba 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> @@ -1449,6 +1449,66 @@
>   			power-domains = <&spm MT8192_POWER_DOMAIN_ISP2>;
>   		};
>   
> +		vcodec_dec: video-codec@16000000 {
> +			compatible = "mediatek,mt8192-vcodec-dec";
> +			reg = <0 0x16000000 0 0x1000>;
> +			mediatek,scp = <&scp>;
> +			iommus = <&iommu0 M4U_PORT_L4_VDEC_MC_EXT>;
> +			dma-ranges = <0x1 0x0 0x0 0x40000000 0x0 0xfff00000>;
> +			#address-cells = <2>;
> +			#size-cells = <2>;
> +			ranges = <0 0 0 0x16000000 0 0x26000>;
> +
> +			vcodec_lat: video-codec-lat@10000 {

There's only one more thing: why do we need the `vcodec_lat:` and `vcodec_core:`
phandles here?

Platforms that do not support the vcodec can simply set `status = disabled;` on
`vcodec_dec`... as it doesn't make real sense to disable only LAT or only CORE.

Please drop these two, after which:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



