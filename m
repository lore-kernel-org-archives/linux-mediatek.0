Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B570C7619A
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Apr 2023 08:24:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VtGarPOO0xayOIjqJwciYlaIxxnKZAoXWCjSoHZlApk=; b=hcJZ+LYUktqXwpu+zobb0R7Vo3
	DPLm4fg2GgHmw1SDx4GNUTDKdBn5z9l5zxsiTJLiJJ5P2QIXRTVsHg2gucccCkphv5PpEQfjXdt5+
	zW/r/ixpHUtfqH10IPBvsztg2y7OZTHhBAEMCrHEOknXqRaSOkSEo3NqiHM3Tsg0Kf6srpLfCFzB6
	c3EewhqjK0DCTstDA8BzOMekDV4rifd+WsD5jua9bFOpEzDnK+comg6s5EwrSnpRGl0D9bEuzOmHV
	V1EWJONHvFb4ejGCW18K7KCKJd6if1oj2NsUczD6j60fDP9iu2z5PnOkf37N7CUeIsaeKblFJL8L+
	TZ2X2FqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pm9I7-00GqyU-1d;
	Tue, 11 Apr 2023 08:23:51 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pm9I4-00Gqwt-1f;
	Tue, 11 Apr 2023 08:23:49 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 34C7A66031E7;
	Tue, 11 Apr 2023 09:23:46 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1681201427;
	bh=ADMedLVs+5KiqFHy8L8bjUE/ArcSYR2VhiaJnz4uVYU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Ex0QZOkYYonI2GaXDXmpvLjO1kGk4e9pV9pMaq1azU0MkJ+Q+PdGIs3tW+wE/nSHW
	 InXeUbo7lf4DVMWGJhOtljvh6QJnLnOBu0fJ609FlfYDv2ThMVHW7MlZp6GOkuefuZ
	 Vly30hfbDTsOZebvEGp082LmdoRb6eW5+Qpw9R8UECSGUv8XG/nW5Udi/8X+kg7vNf
	 0fkI8rIHfDoaR67AC3ryK3bgSFSbkCA0KsmrQJyB/ub1RfTPZ80a04n91qDGrBmQSz
	 xLoNmyOI7CjxBRumsu/mtvAs0RcmQdGdJindPGVMM+Goe+xJU10EpQwmpf7kHU//f/
	 d39jvrHFMQE4A==
Message-ID: <ce6a9e78-efae-c430-c990-ceafdfc7be41@collabora.com>
Date: Tue, 11 Apr 2023 10:23:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v5 07/12] arm64: dts: mediatek: set vmc regulator as
 always on
Content-Language: en-US
To: amergnat@baylibre.com, Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chaotian Jing <chaotian.jing@mediatek.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Wenbin Mei <wenbin.mei@mediatek.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Zhiyong Tao <zhiyong.tao@mediatek.com>,
 =?UTF-8?Q?Bernhard_Rosenkr=c3=a4nzer?= <bero@baylibre.com>
Cc: linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-mmc@vger.kernel.org,
 linux-gpio@vger.kernel.org, Alexandre Bailon <abailon@baylibre.com>,
 Fabien Parent <fparent@baylibre.com>,
 Amjad Ouled-Ameur <aouledameur@baylibre.com>
References: <20230203-evk-board-support-v5-0-1883c1b405ad@baylibre.com>
 <20230203-evk-board-support-v5-7-1883c1b405ad@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230203-evk-board-support-v5-7-1883c1b405ad@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230411_012348_680794_155A5721 
X-CRM114-Status: GOOD (  15.61  )
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

Il 07/04/23 14:59, amergnat@baylibre.com ha scritto:
> From: Fabien Parent <fparent@baylibre.com>
> 
> MSDC1 IP block is powered by VMC. Make sure it is always on.
> 

Can't we set vmc as parent of vemc?

> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>   arch/arm64/boot/dts/mediatek/mt8365-evk.dts | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
> index cd920d09c3fe..1c36d8f19525 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
> @@ -137,6 +137,11 @@ &mt6357_pmic {
>   	#interrupt-cells = <2>;
>   };
>   
> +/* Needed by MSDC1 */
> +&mt6357_vmc_reg {
> +	regulator-always-on;
> +};
> +
>   &pio {
>   	gpio_keys: gpio-keys-pins {
>   		pins {
> 


