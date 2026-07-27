Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B93BC531D0
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Jul 2026 11:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z/wNY5epuKoFyNSG5irGOIpMV4A42H3f3RVJTI9wwd8=; b=BxEL4RclTImEKPvITZE4Id8tpn
	pKhyvlBPE4yca+dKFMb+/XaOWg8c3nSJwjJ2XIlOWLQtyx9g01nbTUmMflGWsUO3ow97Xgp8LxQzY
	Zn//d5kYuJbB02ciIQBnkkcWJPGf+l7ZoDRCZvwAY7qp+HluHRdh+g2IG+/rCfpErqSU14jFPVVzH
	OqvThObwjjed51W1V4QtEykQ8aNQsUSZmsZO+DT+lqATeY4pBRPkDU9Qex2BJQMDAXF8H3h3x73Zx
	uvBneSdvwxWh+aTOaIr21Wb1VB0S82Aoaszz+m/EezzVdRTUm0GsnEYz3LEaGG9/+lqJdbbmlaTJT
	tF3PG4XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woJXM-00000002ab4-4AUI;
	Mon, 27 Jul 2026 11:30:24 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woJXK-00000002aa9-154y;
	Mon, 27 Jul 2026 11:30:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1785151819;
	bh=ZFIAFTwas2rhk3bEM2JyYbhvmHOR7sbABrYjwUVNLQM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=eluZNqzoifWatVLkxPgK7atnz3bqNuwlLsmhWgAt8gmaEw3yCwnr9qqvhW72bM3F1
	 dEyCinGMU87TJAOYrWSecCipByGtNnu50ZUum9ecK1LFatVvoNMyICbnzYPWBGPXtL
	 4tGvf/aNUyrSLd3RjFdSuPI7sye3GgjBl0VWX7BG8iiOjrUDveduub/xgLyftAa4Dz
	 ZPTnb6wSz0nWLuknBGtjxbcIlIAZpe2fuHGeYe0QMkXF8jyf8FI7w2AIkLuuRJlg0R
	 sudvXZUvXCgNWYKya2/4uVUATkq/7XrzQyWGxaaAw06YN2+1YIhRQegt6dtUR924IK
	 Gx71BeqleSFiw==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1741017E0213;
	Mon, 27 Jul 2026 13:30:19 +0200 (CEST)
Message-ID: <a3298120-f5be-4a8a-bb71-1d6923a28d6c@collabora.com>
Date: Mon, 27 Jul 2026 13:30:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] arm64: dts: mediatek: alias all enabled serial
 ports
To: Carlo Caione <ccaione@baylibre.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-serial@vger.kernel.org, dlechner@baylibre.com, jstephan@baylibre.com
References: <20260727-ccaione-genio-serial-aliases-v2-0-0f2ae41a8e89@baylibre.com>
 <20260727-ccaione-genio-serial-aliases-v2-1-0f2ae41a8e89@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260727-ccaione-genio-serial-aliases-v2-1-0f2ae41a8e89@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_043022_463965_1F8E4EA4 
X-CRM114-Status: GOOD (  15.36  )
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

On 7/27/26 09:38, Carlo Caione wrote:
> On most MediaTek boards only serial0 is aliased, so the remaining
> enabled uarts get first-free ttyS line numbers from the 8250 core in
> probe order. When the console uart defers on its clocks another uart can
> win line 0: console=ttyS0 then ends up on the wrong port and the boot
> looks like a hang on the serial console, depending on probe order.
> 
> Signed-off-by: Carlo Caione <ccaione@baylibre.com>
> ---
>   arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts    | 1 +
>   arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts              | 1 +
>   arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts  | 2 ++
>   arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts              | 2 ++
>   arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi            | 1 +
>   arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r1.dts | 4 ++++
>   arch/arm64/boot/dts/mediatek/mt8195-demo.dts              | 1 +
>   arch/arm64/boot/dts/mediatek/mt8365-evk.dts               | 2 ++
>   arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi     | 2 ++
>   arch/arm64/boot/dts/mediatek/mt8390-grinn-genio-sbc.dtsi  | 2 ++
>   arch/arm64/boot/dts/mediatek/mt8390-tungsten-smarc.dtsi   | 2 ++
>   arch/arm64/boot/dts/mediatek/mt8395-genio-common.dtsi     | 1 +
>   12 files changed, 21 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts b/arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts
> index 0e086dd487d9..63659e240b1d 100644
> --- a/arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt6795-sony-xperia-m5.dts
> @@ -20,6 +20,7 @@ aliases {
>   		mmc2 = &mmc2;
>   		serial0 = &uart0;
>   		serial1 = &uart1;
> +		serial2 = &uart2;
>   	};
>   
>   	backlight_lcd0: backlight {
> diff --git a/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts b/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts
> index 8c3e2e2578bc..7bccad118d24 100644
> --- a/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts
> @@ -20,6 +20,7 @@ / {
>   
>   	aliases {
>   		serial0 = &uart0;
> +		serial2 = &uart2;

Why is that serial2 and not serial1 = &uart2?

Cheers,
Angelo

>   	};
>   
>   	chosen {

