Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D892C25B76
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Jun 2024 07:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JhgX7xWJpWDC/+oEnqUkGapcNi4peDkl6s1NMAczQYo=; b=p6Q5GncPb6JPmkCRYhiS9xeTwL
	ZIvQreHsbCjgSqvVL6P+xGrxfRN3q/UtF8OsiBen4S2gaD1MKswUmog6eHhGoChK7GI2iirQ7kVO/
	GZ+n3zPmnQFxE6d60M1yxz9GtKs+Bs4RRFSAzuPvYuVaxyLkKJa7KMPJmnIC2M+skiokrPhav3duZ
	4e9fj4GsaVx1LmpgrqbJ9GyxbvbWjopTo3JmcGbvBx9DQu8iXxpND1RhWIlMicwhSoMoab307otm5
	rV87le3i6EhAFi25xM+twPwD7N3D+yQVr61iOG7Jx7+gV+tXAgg9j0BrZOwtrSMvJK+T7WIbdn2hK
	jwXsBW8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sE2GL-0000000Fuuy-0DhN;
	Mon, 03 Jun 2024 07:37:49 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sE2GH-0000000FuqE-2nAP;
	Mon, 03 Jun 2024 07:37:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1717400262;
	bh=BxNa9VcY68uplMSTvGDz9b9R4IIn+l6Leko6FTfPklU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=kxpcVfitJ/cywzDLGrF2aMskkW8Eqkc7AzU7Kp10V2xnlm8PXU7whCJ27t4GUul4w
	 zkMQWzjUT0DQsXnIXae52C6Tipvq/+IpVwt84n/duByObcXEu8vQt+pemvneiGO05j
	 Hl5L525G5IWb8hItWqWhen7dRptPmc1ocXToCthTTvlm/4Beg+aPx0pKfDr8j0DWQv
	 JfnkMEWOMDSxelZNqR8U2qSxCiJYOaNFyY3kWfVCSu7ZcHatMJJrFuJhL//xiDPOts
	 C86p9RwVLtgK/XdxG6s2pBrFIWBcd/tPW2QC3eOa8zImjUFdu1E67MycOE+2Hr5gfE
	 li/fItRCsU89w==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 5021337813CA;
	Mon,  3 Jun 2024 07:37:41 +0000 (UTC)
Message-ID: <c9c54de1-cac3-45ff-8bc4-996c14a1ecb8@collabora.com>
Date: Mon, 3 Jun 2024 09:37:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: mediatek: mt7981: add I2C controller
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
References: <20240405125505.11837-1-zajec5@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240405125505.11837-1-zajec5@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240603_003745_866045_0A4D4526 
X-CRM114-Status: GOOD (  12.73  )
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

Il 05/04/24 14:55, Rafał Miłecki ha scritto:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> MT7981 has one on-SoC I2C controller that differs from recent Mediatek
> blocks by having a different SLAVE_ADDR register offset (thus a custom
> binding compatible string).
> 
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
> ---
>   arch/arm64/boot/dts/mediatek/mt7981b.dtsi | 17 +++++++++++++++++
>   1 file changed, 17 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt7981b.dtsi b/arch/arm64/boot/dts/mediatek/mt7981b.dtsi
> index 8a6263cc569c..2d7f91196e64 100644
> --- a/arch/arm64/boot/dts/mediatek/mt7981b.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt7981b.dtsi
> @@ -94,6 +94,23 @@ pwm@10048000 {
>   			#pwm-cells = <2>;
>   		};
>   
> +		i2c@11007000 {
> +			compatible = "mediatek,mt7981-i2c";
> +			reg = <0 0x11007000 0 0x1000>,
> +			      <0 0x10217080 0 0x80>;
> +			interrupts = <GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&infracfg CLK_INFRA_I2C0_CK>,
> +				 <&infracfg CLK_INFRA_AP_DMA_CK>,
> +				 <&infracfg CLK_INFRA_I2C_MCK_CK>,
> +				 <&infracfg CLK_INFRA_I2C_PCK_CK>;
> +			clock-names = "main", "dma", "arb", "pmic";
> +			clock-div = <1>;
> +			clock-frequency = <100000>;

If you need to specify clock-div and clock-frequency, those are board-specific
properties and not soc wide.

Please remove those from there and put them in your board specific DT.

Cheers,
Angelo


