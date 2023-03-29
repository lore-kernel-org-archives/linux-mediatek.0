Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60644C77B6D
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Mar 2023 13:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hAgg9UxHUHogcinaGXqQ2GqChxp1PVkDmc9X4+kWPMo=; b=sUjGFrCs2cthnL98VmhPchya3E
	RUqmg7ZaiIE6IfwgI1sO3/HjVn5BdLM4GI9hSbVksJAIs1/6gUtWmRhi4ZuIRga8AFJhGlbloJP0N
	sHulaypMNJcT5sJhZLG+B5I4cntDhPTqX0ErhYNOoY+otFuN5CjJsPe6cGPGNA88aCRRY4mtWj0BS
	OC6OMVsaHPA6tTqQEd53TUnN4tGlc+gqP20mHMW+jp2cTlTtSolXihEP6SGRohQQAxh8xnknFLw6n
	gT/FdX7uPz98LNa3iTwn/q8BVRyoCsvDo/9rGtl+00mQAdXAbeC6fhNBwcdmkmJ3I4ImGf3q/m4Bp
	mZuryw6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phVp4-000O57-1e;
	Wed, 29 Mar 2023 13:26:42 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phVp0-000O2c-1V;
	Wed, 29 Mar 2023 13:26:39 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 14A9C6602173;
	Wed, 29 Mar 2023 14:26:36 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1680096397;
	bh=Akn3I83LmPhNsFdfQsd0Py/gG13FOTBQq0PK8POD0YI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DdI6Wu5ogtQNyYqYlQIbp4ALGYlkgUu5oS4FH1W9jxF+PGOls8TlGMwXJPinNagIw
	 rqVMHCdveOCE9FEExlYDETFPk2mVzyWYdkiq5r9fYWm/Cjk4NZ+OL2bOh6tkvQjS+S
	 qGq4EMao1Z36GLTcDv0IxpbFCHHH1/eB4yg+mTwU6wCca/Uf+yIRegSGEKyzSVoLc3
	 vioyYq3uDeZq+ODjEGRLhLQ0iglT6Vn7pyxqtW2b7VSeI5mAneXmgleACYMPg6jsc+
	 dgEzYPEBfsHF18FVR5CHpUNocBMb1FOgxtVcZmrU+WsAH1dDWR1Ed8YQSD0Ti8CGad
	 lia7q4WkeY09Q==
Message-ID: <5b213d2f-4694-5548-9cce-f01dacda9c84@collabora.com>
Date: Wed, 29 Mar 2023 15:26:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v3 11/17] arm64: dts: mediatek: add usb controller support
 for mt8365-evk
Content-Language: en-US
To: Alexandre Mergnat <amergnat@baylibre.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>,
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
References: <20230203-evk-board-support-v3-0-0003e80e0095@baylibre.com>
 <20230203-evk-board-support-v3-11-0003e80e0095@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230203-evk-board-support-v3-11-0003e80e0095@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230329_062638_635446_9ADBD34A 
X-CRM114-Status: GOOD (  16.36  )
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

Il 29/03/23 10:54, Alexandre Mergnat ha scritto:
> This patch add support for SuperSpeed USB, in OTG mode, on micro connector.
> It also add support for the Extensible Host Controller Interface USB.
> 
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>   arch/arm64/boot/dts/mediatek/mt8365-evk.dts | 22 ++++++++++++++++++++++
>   1 file changed, 22 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
> index 22ec332fe9c9..868ee0d160e4 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
> @@ -319,6 +319,28 @@ &pwm {
>   	status = "okay";
>   };
>   
> +&ssusb {
> +	pinctrl-0 = <&usb_pins>;
> +	pinctrl-names = "default";
> +	maximum-speed = "high-speed";
> +	usb-role-switch;
> +	dr_mode = "otg";
> +	vusb33-supply = <&mt6357_vusb33_reg>;
> +	status = "okay";

Order by name please.

P.S.: status can go at the bottom, even if v < s :-)

Thanks,
Angelo

