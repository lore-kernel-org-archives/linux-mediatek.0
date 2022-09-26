Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 506A5C07E9D
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Sep 2022 15:29:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HxziGqWI1gZNtRingRByqhIlRJdE/wybCLT0LWXmxs0=; b=Ga+TVvlAkkNc/1/yCdtGWpgOb4
	Ti6qwoBtWQqNl9Eb0GJiK4C40sZKOzlbyCR+DVj68NSQjbIIrxdzg/yWW8kdZ7c91olT6b1h8JHEW
	bK/w2FyHG+kd5ggwJL8z6v2oJv0NoQV65B7/St5Eo83wabJNrWkJrmzYtufsnxLM87+qkXCg1nMq3
	bwF4o+yZDtcFya8UE4YmRB/oOHV0/1PIRhHisOLtQ/R/iQOx0JW8v6SpzVcPg2JivCMOthe57snt0
	R2GweJ289+jzuMW1eWy8QFMr2btm5OuQClDS9G12UXb14WbI4QeKFiiQ5jXf4X+vtRMmfdyVbdI7Z
	z6uwpTsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ocq2n-005eMW-S9; Mon, 26 Sep 2022 15:29:17 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ocq2b-005eIE-Mb; Mon, 26 Sep 2022 15:29:07 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 3555B660225B;
	Mon, 26 Sep 2022 16:29:03 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1664206143;
	bh=nlq4IdmFkNAjJjqacvnPjUw6nzph3yIh2k8BmqgKtv0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=apBByvvEKv5QOCPxB2lfg8MkEDZjihxHUfLC8RJf72npPocYyK+Jg+xC9lbGVV90i
	 TT4l9p1jTX1Q4CnTRBdynjjwsUv+RpC/gza0Ai56MKWcTajHghhpmKyxHE8GKl2kjV
	 UPIRUDRshDBbDgKgBC8Qp+Ga8MkPNe7APt5KQsyTSiYuXHb2tR0q4RjpgLjNBpOR3c
	 RD0DaDBT9FdvNbvb8tgsj5TRGIrgb+Fw7iIYi3DF0xvM1kZOkHlz3RvPljkrEadXrQ
	 ZxwbKze82h03odNQQ/u6gihNO6TSolPSxi6lMkH8qc2LIswVn/jdR8yoW6cHZjNN9A
	 yOGP4m/PuB/oA==
Message-ID: <4d1e8600-f73d-8d2b-2e7a-1b75be7624bd@collabora.com>
Date: Mon, 26 Sep 2022 17:29:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v2] arm64: dts: mt8192: Add vcodec lat and core nodes
Content-Language: en-US
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20220926105047.19419-1-allen-kh.cheng@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220926105047.19419-1-allen-kh.cheng@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220926_082906_168362_67ED052D 
X-CRM114-Status: GOOD (  15.57  )
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

Il 26/09/22 12:50, Allen-KH Cheng ha scritto:
> Add vcodec lat and core nodes for mt8192 SoC.
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> Tested-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
> Change in v1:
>    * Replace node names with video-codec
>      [Allen-KH Cheng <allen-kh.cheng@mediatek.com>]
> ---
> ---
>   arch/arm64/boot/dts/mediatek/mt8192.dtsi | 60 ++++++++++++++++++++++++
>   1 file changed, 60 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> index 6b20376191a7..214dfc6b0ed1 100644
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
> +			vcodec_lat: video-codec@10000 {

Allen, this won't work :-(
Check Documentation/devicetree/bindings/media/mediatek,vcodec-subdev-decoder.yaml
...the schema requires vcodec-lat@[0-9a-f] and vcodec-core@[0-9a-f].

If you want to call them all video-codec@addr, you have to also fix the schema.

P.S.: Did you try to run `make dtbs_check`?

Regards,
Angelo


