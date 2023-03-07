Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDE01C678D4
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Mar 2023 09:44:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q6xMBracXf/n7V02EVPPNXAFoY0eu3FGJJL0UXttzdY=; b=R8htVaoAj0V0q+LY6EDLPou6Xl
	fS8lFqFiT3W+OTbGZeOB9+v533o24V71Ki1MF8LBaA5GpFmclNKzBqMFBKp5pqoCpIWtu5fMK6ucj
	KZrs3/Un6ykTYpGebuZKXwPsIogwQCagb3PWfi8Z+yCm47YYlJJehaWC/sfhh3cnp0NYoVP3gf64Z
	P4UGj3OHZFGu2yyD0g/CHBBzlr0IVhAu+snfN7c6cxu6HNafg4u4LTHxKpJLLMwDJuVR779h7BSdr
	LJn+zVZYurqbbj8HaDpG76GBeS3gTmTwZUZVcP+fepX/v8gC394vI31a02QDGedXhdFBUXyguTRCQ
	dqOCuYkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZTrm-00GzRE-5E; Tue, 07 Mar 2023 09:44:18 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZTrS-00GzG0-SK; Tue, 07 Mar 2023 09:44:00 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id AA1826602FE6;
	Tue,  7 Mar 2023 09:43:56 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1678182237;
	bh=DBT3ffnUomO4XpSs3uQJEKNgfx80plMtUGZEvV2r8tE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=BT8Mu3NolapWoYEbgr83LNJXuN9DdogBZ5cSwFj+bjXKfQ8ahqFcsjKXYeqs2yXiZ
	 GO0enFGX0WlNfKuElyrhP+WYsZaGS86XY3xorq3SNLweDQgrzhFq+3etbFzbDFXJP+
	 P7zrhqzmFr6DhCjMBkw1u+E5K6IQFF4jYROFS2gk14FZLKSBTNymimQhiruxfRrjIq
	 +KTAYj4xFCUjywHgSvPgcmKsrzm6aFjNyoeJr5OmxZz3irEV9Iah3VcrF5ppwBVqXn
	 xuMP84kaq/AyfhYJanL8xNLuUUqUXp/LnIKBTovEUjoKWXJ8AiRZRhgnX1G+aIzPYV
	 Aoo5OZwZa8RGQ==
Message-ID: <ff81cce8-9203-f90c-5a23-2d1c09fe4267@collabora.com>
Date: Tue, 7 Mar 2023 10:43:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 1/2] arm64: dts: mediatek: add i2c support for mt8365
 SoC
Content-Language: en-US
To: Alexandre Mergnat <amergnat@baylibre.com>,
 Qii Wang <qii.wang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-i2c@vger.kernel.org, Fabien Parent <fparent@baylibre.com>,
 devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>,
 linux-mediatek@lists.infradead.org
References: <20221122-mt8365-i2c-support-v3-0-ad9bb1076d7f@baylibre.com>
 <20221122-mt8365-i2c-support-v3-1-ad9bb1076d7f@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221122-mt8365-i2c-support-v3-1-ad9bb1076d7f@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_014359_101200_F5B19424 
X-CRM114-Status: GOOD (  14.66  )
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

Il 06/03/23 14:47, Alexandre Mergnat ha scritto:
> There are four I2C master channels in MT8365 with a same HW architecture.
> 
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>   arch/arm64/boot/dts/mediatek/mt8365.dtsi | 52 ++++++++++++++++++++++++++++++++
>   1 file changed, 52 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8365.dtsi b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
> index 15ac4c1f0966..553c7516406a 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8365.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
> @@ -282,6 +282,45 @@ pwm: pwm@11006000 {
>   			clock-names = "top", "main", "pwm1", "pwm2", "pwm3";
>   		};
>   
> +		i2c0: i2c@11007000 {
> +			compatible = "mediatek,mt8365-i2c", "mediatek,mt8168-i2c";
> +			reg = <0 0x11007000 0 0xa0>, <0 0x11000080 0 0x80>;
> +			interrupts = <GIC_SPI 28 IRQ_TYPE_LEVEL_LOW>;
> +			clock-div = <1>;
> +			clocks = <&infracfg CLK_IFR_I2C0_AXI>,
> +				 <&infracfg CLK_IFR_AP_DMA>;

You can compress the clocks to one single line, reaching 91 columns, on all of the
new i2c nodes that you're introducing. Please do that.

With that done:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Regards,
Angelo

