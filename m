Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D84E8C43334
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Jun 2022 14:32:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sUON9+URobwC2j6GQrdY/r0wwHuuIPCY+/+SHvJGTvI=; b=oeWiWbIsC0M8Sp
	sbJhgZJl8QoMairtKLlHjvv6FMYmpd9ZWc8O2q4Ri2f4iN2vzUhhJo7+Xl2DWfVUK60l4F5wcvsji
	mgnKhfwARwvkRiASY/JA1V2yXWrmn569LxrVCc8Tn52UB2nD+dRuQAAEYn0m0YBTNCp/xqRcHOwr0
	OwDWUSUp/K38u3zVDHO00icDI4UKdorweEmgrcSSHzZ5MZ2RVDxRWjGj2Sl4zHpxLk1kRmh9Tz/wT
	hEJJitAuiMDM/+oTj1CDJsAsvvclgw2slnOEKv+JlvwWqNjfymSL0Q4ZRzt1kVM3ofpINuSTjXNzx
	pZco6tQhOjPT1U/ZzIRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyDmU-001XDA-3i; Mon, 06 Jun 2022 14:32:34 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyDmF-001X6n-Vk; Mon, 06 Jun 2022 14:32:21 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 38D496601E94;
	Mon,  6 Jun 2022 15:32:18 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1654525938;
	bh=YMYIIOjdr7X3xgwUiFiBZS3Co4/RxQgCOo0x434ptFE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=T8KWPtQKbM+lkmGY0j+8VgnQys9vQH8Fyd2an0W04VCW9bsCAddlaI0zF/fqgHQzQ
	 mBXQdV0nNgS4PZhqX+Uiks0E46zyNJytUkQ7hKmBQi2I5C6l+oyE61SU/xJcRf46yx
	 OxTv7DUL3Ci3D9jlc21E+dyqt7MpnOM9vI0xC6SfTXB9ZRiq0QrUONZJHRbydTcuXk
	 1GLkxJL2oHvX/p3UQYQH4pE6JFuK2k/boWb+u7pmNrj9CVxcmn74K2LWlIwPVynuXr
	 vqzWnw6Y0HFpziWY82HxloJ+2SLipB86z+lqfr71BdBUXdJ4xDIATSHmLGTvOM+piQ
	 3Ol27qkGt6uIw==
Message-ID: <287b7d3a-a412-0ec9-7be0-c17f3da782b6@collabora.com>
Date: Mon, 6 Jun 2022 16:32:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 2/2] arm64: dts: mediatek: mt8195: add pwm node
Content-Language: en-US
To: Fabien Parent <fparent@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220531114544.144785-1-fparent@baylibre.com>
 <20220531114544.144785-2-fparent@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220531114544.144785-2-fparent@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220606_073220_196384_5A894F44 
X-CRM114-Status: GOOD (  15.91  )
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

Il 31/05/22 13:45, Fabien Parent ha scritto:
> MT8195's PWM IP has 4 PWM blocks.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>

I've verified that the binding is actually right - and it is, the MT8183
data is a perfect match with MT8195.

In any case, there are at least a few MT8195 boards on which the PWM controller
is not used (only the disp-pwm one is used), so please set this node as disabled
by default, after which, you get my:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   arch/arm64/boot/dts/mediatek/mt8195.dtsi | 15 +++++++++++++++
>   1 file changed, 15 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> index d076a376bdcc..366543f27a99 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> @@ -367,6 +367,21 @@ pwrap: pwrap@10024000 {
>   			assigned-clock-parents = <&topckgen CLK_TOP_ULPOSC1_D10>;
>   		};
>   
> +		pwm0: pwm@10048000 {
> +			compatible = "mediatek,mt8195-pwm",
> +				     "mediatek,mt8183-pwm";
> +			reg = <0 0x10048000 0 0x1000>;
> +			#pwm-cells = <2>;
> +			clocks = <&infracfg_ao CLK_INFRA_AO_PWM_H>,
> +				 <&infracfg_ao CLK_INFRA_AO_PWM>,
> +				 <&infracfg_ao CLK_INFRA_AO_PWM1>,
> +				 <&infracfg_ao CLK_INFRA_AO_PWM2>,
> +				 <&infracfg_ao CLK_INFRA_AO_PWM3>,
> +				 <&infracfg_ao CLK_INFRA_AO_PWM4>;
> +			clock-names = "top", "main", "pwm1", "pwm2", "pwm3",
> +				      "pwm4";
> +		};
> +
>   		scp_adsp: clock-controller@10720000 {
>   			compatible = "mediatek,mt8195-scp_adsp";
>   			reg = <0 0x10720000 0 0x1000>;
> 



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
