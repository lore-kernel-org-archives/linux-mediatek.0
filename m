Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B7A7C4332F
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Dec 2023 11:09:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KkikXQvmrJIAeqiK9VYDTGMgButQJmRcjF0BWv7GClU=; b=SooCw610csNUmDMzYHbhGghYQm
	Xd4H1IUnWEMf7nN7CETPUsCQ+LZBCazPP0l13yqiXvkqlB7wT5lRElFzxtKVjibvDtNUshYzrqiNf
	Weo/X1L+I1E6gLlNA6VUx5UhD/feTWBHY2Xn9L92+oHwQzZkyoy75+S44ZmbiEHIVjO77s0oCTbGS
	JV6xnK6375f9cXV08ypVBZCmSJIM72nJnSneBA1Ti3OWl8Y2jg6SBgaYScQ8sLaAE5XYsj8p4o4tT
	Vfa/NAukTXPQdEn2j0ii7hrH2psw1SzdtMjlsJWwI12dM9L4YiEuGr1ilkhjFnmAGV1k/31R0cUal
	8f0Xai1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDN7A-00ELsg-0K;
	Wed, 13 Dec 2023 11:09:20 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDN73-00ELnI-0W;
	Wed, 13 Dec 2023 11:09:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1702465751;
	bh=NEHwKtbRnYhX3LWvP/fAiGtmTiEiGlfArlGHrTXrUNA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=AIljSdK/n19r3+FHLdHy6sFro3d9Xknwrhfn+lvGWIJ47oCtK1u492nOkSoELAQkN
	 8pJMb0JW5iigzv9ssllNrsPkeDxxoDLoCWtPsBqkBgL2M+VGUjZ/siQ2W2bm4nE9oB
	 AffkJps4SxHvNZFpFLJNDBcd8B2sM9VJk/KDAl+hD/SRXf6cFComQy18fU5fiDXiN3
	 MZzLkul80r6gY8pJ61Mj97xrTVhTKzY9H7gJjst/e9YLA58B42Ta65HAPYGQPnjm0s
	 HTqhQUw+Rx8+9gCiaphCqOIxkWjLkFExDWJ/Xqnjc/HM5zxVucjG77tIqwxNMd/cM2
	 kkXyZdyUetn3Q==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id CBFAE3781453;
	Wed, 13 Dec 2023 11:09:10 +0000 (UTC)
Message-ID: <bc5dafe4-5487-4794-97f1-f4e4d967a665@collabora.com>
Date: Wed, 13 Dec 2023 12:09:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: mediatek: remove broken pmic interrupt property
Content-Language: en-US
To: Arnd Bergmann <arnd@kernel.org>, soc@kernel.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Ben Lok <ben.lok@mediatek.com>,
 Macpaul Lin <macpaul.lin@mediatek.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20231212214737.230115-1-arnd@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231212214737.230115-1-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231213_030913_332084_4E5F5335 
X-CRM114-Status: GOOD (  17.93  )
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

Il 12/12/23 22:47, Arnd Bergmann ha scritto:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The pmic is connected to the GIC, which uses four-cell interrupt properties,
> but its interrupt is specified as two-cell that would only make sense for
> the GPIO irqchip:
> 
> arch/arm64/boot/dts/mediatek/mt8195.dtsi:464.4-27: Warning (interrupts_property): /soc/i2c@11d01000/pmic@34:#interrupt-cells: size is (8), expected multiple of 16
> 
> Remove the interrupt for now to shut up the warning. When someone figures out
> what the correct interrupt and parent are, we can add it back.
> 

Please, can anyone from MediaTek comment on that?

I see a mt6360_pins on PIO:
			pinmux = <PINMUX_GPIO17__FUNC_GPIO17>,
				 <PINMUX_GPIO128__FUNC_GPIO128>;

...and that's GPIO128, which may effectively be the IRQ pin for MT6360.

Still, I'm not sure whether the interrupt is on GIC or PIO, please clarify,
otherwise we will have to get this commit upstream.

Thanks,
Angelo

> Fixes: f2b543a191b6 ("arm64: dts: mediatek: add device-tree for Genio 1200 EVK board")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>   arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dts | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dts b/arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dts
> index 70b465f7c6a7..a409ef998746 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dts
> @@ -238,8 +238,6 @@ &i2c6 {
>   	mt6360: pmic@34 {
>   		compatible = "mediatek,mt6360";
>   		reg = <0x34>;
> -		interrupts = <128 IRQ_TYPE_EDGE_FALLING>;
> -		interrupt-names = "IRQB";
>   		interrupt-controller;
>   		#interrupt-cells = <1>;
>   		pinctrl-0 = <&mt6360_pins>;



