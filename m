Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68135C678D4
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Mar 2023 11:24:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uxj0s0GxC8kf4No2xieWTNljWxMWX0typzaKPZDV874=; b=wgVsENG03/Sx8jqcd9yCs8Ehme
	ip49xVC0yj6Zi22GOv4C7IGJ1GXnGJG5yjh9D9CXB+656d6QTnbaqu0xBkljk60GX6QXh/4rCbeju
	vrhGi/2kffqgsn2AEIjeOxUT5srRYFkPylbFk/NMQjFTI4uX4dnjY+sQ4Yno8WgVlPga2IEDnioWh
	iENo7Y94MgHdl2d3Xifb/o2j0oRlts3sIzpWrH3bdnLurHnPlKOyNYB/iaI6vz2CK0MC3FXMLGoLe
	2z1Yv2L/8kW00leclfUebPxPl1jVChemwyOTYVOaJzJbWALafXMwmnEMNPA3gzOggOSyp+m4vp4KW
	5hCF/bxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pY3WI-0067ry-Nm; Fri, 03 Mar 2023 11:24:14 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pY3W8-0067ov-El; Fri, 03 Mar 2023 11:24:06 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 6A62A6602FA9;
	Fri,  3 Mar 2023 11:23:59 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1677842639;
	bh=LUrVv03ntRmaeynFxWkF0Aq+0D78B7f2QaRdCqFRvhk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jSAHtSW5Iqlv5VvIbGIv6Z7RfnLmv3y5WjWuOkns1KNiX2UAdBwHqGwSyAWagFWB4
	 +CUVL5JgWWslgsszY92F/yC+KjCGEuJ1qhyeE0Cq2Wn1w5/7XgXJ09UrAxKXNbuZrk
	 pdpxbBRQkiIXkWOuMM63fGMVR1cKZsbYqtpQPBFpCA8EidRWLwaiOF6dJUP2DEoYIk
	 eVhn9UFNROI6XSq9/Mr6LCBG1s6F5VyJv1IVDepfxpBgwd9gjnQN4Y+U4ZWsKrvItM
	 7uAmvwc2dyytyjg4A4K64rk/sGx5V8c0AC/6IZXmk5LIO3X/R6pScIXA+vEf8nLHqV
	 Bd2Iz9y46+AkA==
Message-ID: <a1e5bc34-2feb-2832-73dd-25d3d64807f7@collabora.com>
Date: Fri, 3 Mar 2023 12:23:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2] arm64: dts: mediatek: Add cpufreq nodes for MT8192
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20230303020014.23580-1-allen-kh.cheng@mediatek.com>
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230303020014.23580-1-allen-kh.cheng@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230303_032404_674978_7AF5B2A6 
X-CRM114-Status: GOOD (  14.48  )
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

Il 03/03/23 03:00, Allen-KH Cheng ha scritto:
> Add the cpufreq nodes for MT8192 SoC.
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> ---
> Change in v1:
>      Fix : this should be <&performance 0>

I didn't say that *all of them should be <&performance 0>.

It's 0 for the cortex-a55 CPUs and it's 1 for the A76 CPUs.

Please fix it.



>      [Allen-KH Cheng <allen-kh.cheng@mediatek.com>]
> ---
> ---
>   arch/arm64/boot/dts/mediatek/mt8192.dtsi | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> index 87b91c8feaf9..48a4fc88fde4 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
> @@ -70,6 +70,7 @@
>   			d-cache-line-size = <64>;
>   			d-cache-sets = <128>;
>   			next-level-cache = <&l2_0>;
> +			performance-domains = <&performance 0>;
>   			capacity-dmips-mhz = <530>;
>   		};
>   
> @@ -87,6 +88,7 @@
>   			d-cache-line-size = <64>;
>   			d-cache-sets = <128>;
>   			next-level-cache = <&l2_0>;
> +			performance-domains = <&performance 0>;
>   			capacity-dmips-mhz = <530>;
>   		};
>   
> @@ -104,6 +106,7 @@
>   			d-cache-line-size = <64>;
>   			d-cache-sets = <128>;
>   			next-level-cache = <&l2_0>;
> +			performance-domains = <&performance 0>;
>   			capacity-dmips-mhz = <530>;
>   		};
>   
> @@ -121,6 +124,7 @@
>   			d-cache-line-size = <64>;
>   			d-cache-sets = <128>;
>   			next-level-cache = <&l2_0>;
> +			performance-domains = <&performance 0>;
>   			capacity-dmips-mhz = <530>;
>   		};

It's 0 until there.

>   
> @@ -138,6 +142,7 @@
>   			d-cache-line-size = <64>;
>   			d-cache-sets = <256>;
>   			next-level-cache = <&l2_1>;
> +			performance-domains = <&performance 0>;

Here, and later (for cortex-a76), it's <&performance 1>.


Regards,
Angelo


