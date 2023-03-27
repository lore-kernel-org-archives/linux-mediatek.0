Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D08FC7619A
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Mar 2023 08:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DGQjeJPTKfG+U3AMu6eCRFJnGYz8tEB3+G2QIxPs4Zk=; b=z1naOCR/z96xm0QTFWe8S5E0te
	5EdHiOIa0B88YdxMaXtJG5d0mXPybXtIRJoYxQGzuZNxFNtE1tfftNeTbZgxguc8CO4tFNgpEBGWV
	1fj7LS+aPdEooZApw0piUaLCleJxZlICv70iECPyt96vmB+A+k9wuFqxPTB01rFJJhvHuvMI5OP65
	OnOw9yTKHqUVE+vjGuu01eftISzTc3LIz1pQsMSlZM7cJHQAvBuBhg8GyGx03X0Qvor8pruN5au8I
	KwaE7lmcuqYhCkSii041b/fglXgm8ri5gQF7maFkE/SHi+UmAgBgt79tR/ByFNNiINNciOov5Mryb
	vjh/GX1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgiTi-00AKq3-23;
	Mon, 27 Mar 2023 08:45:22 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pgiTf-00AKod-16;
	Mon, 27 Mar 2023 08:45:20 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 4A0C86601F5E;
	Mon, 27 Mar 2023 09:45:17 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1679906717;
	bh=nI/bv+FYvlvhbSwQ/rVx+2wqovQpOadhWJXyJqW4ADA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=IFO/vaqNFG45fpRw/Gm9vcN3rzC+MHK5CV+YTcqpLeuWPnEaoZKqAlm2CRUITPd/S
	 0RlWS8xKkhUTz/HYHiUKWMC8yweaKbZ2rn1QZ8TKIl7Peh5hjc1fc70Mc1Y+slXG2o
	 9EgHkl82N3sz06AzWkMt10YmdOgjjOaPzIwIOJVLhiZq4Q/4VzgvYTJECH92bgOoHM
	 iym+tSwEG7QTFji2jjwN5EZzeHUGslxRo2aSjDfvDHN5/WMBRc5KfBncN7xdpxwOQq
	 xHHayRzCEJzLa0xu2/LkkmIwsUIbxoUqQ9hoBX/HNrH16JdhVJCDcahs2tR5tCMiR8
	 iXWMBXOQKVyIw==
Message-ID: <2a1b1f66-970e-5adb-389e-b9c47a790712@collabora.com>
Date: Mon, 27 Mar 2023 10:45:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v5 2/2] arm64: dts: mediatek: enable i2c0 for mt8365-evk
 board
Content-Language: en-US
To: Alexandre Mergnat <amergnat@baylibre.com>,
 Qii Wang <qii.wang@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, Fabien Parent <fparent@baylibre.com>,
 Rob Herring <robh@kernel.org>
References: <20221122-mt8365-i2c-support-v5-0-6e4f3b54937f@baylibre.com>
 <20221122-mt8365-i2c-support-v5-2-6e4f3b54937f@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221122-mt8365-i2c-support-v5-2-6e4f3b54937f@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230327_014519_512572_ACB2D45F 
X-CRM114-Status: GOOD (  15.83  )
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

Il 27/03/23 10:27, Alexandre Mergnat ha scritto:
> Enable the I2C0 bus provides communication with:
> - The integrated RT9466 Switching Battery Charger.
> - The integrated MT6691 LP4X buck for VDDQ.
> - The integrated MT6691 LP4X buck for VDD2.
> - The pin header, to plug external I2C devices.
> 
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>   arch/arm64/boot/dts/mediatek/mt8365-evk.dts | 16 ++++++++++++++++
>   1 file changed, 16 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
> index 4683704ea235..35cb142004a4 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
> @@ -87,6 +87,13 @@ optee_reserved: optee@43200000 {
>   	};
>   };
>   
> +&i2c0 {
> +	clock-frequency = <100000>;
> +	pinctrl-0 = <&i2c0_pins>;
> +	pinctrl-names = "default";
> +	status = "okay";
> +};
> +
>   &pio {
>   	gpio_keys: gpio-keys-pins {
>   		pins {
> @@ -96,6 +103,15 @@ pins {
>   		};
>   	};
>   
> +	i2c0_pins: i2c0-pins {
> +		pins {
			pinmux = ...pins...
			bias-pull-up = <your-pull-up-adv-value>;
		};

...and please do *not* use the mediatek,pull-up-adv property: this is
supposed to be there only for older devicetrees and there's a replacement
for it.... unless you have any specific reason to do so (and if you do,
you should well explain that).

Besides, if you introduce the usage of that property in any 8365 devicetree,
the previously proposed 8365 pinctrl cleanup will become a bit harder to do.

Cheers,
Angelo



