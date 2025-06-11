Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6483C678DC
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Jun 2025 14:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tZzaU59oPE6YTmR8ZmhjyU5Qzpkmbkp7Q1ygvd5Av4Y=; b=BlBVND+1iDCoYa
	JRfgZT7J7pSZ5x3ElYfKXSQztWDz9H9iiLWrNFR8aA7tyJQ9NgkuPCbi4hGA1mJjbOrElU3tWqrgb
	qM3AxXo8aYru4Y0viq7wr4ebkN83pIO/UDqUiGNIg4d7WKJzL3ZWhyV3oNUFFn2aLn0Jm4MRPPmNH
	PIFSMOHMlnwmB0/5QfNBtWgFwLZAss7VOjmmNCCzPF6yrU3CQMgTZu/rMG/aaLqQ1xDfChzR0rrz3
	a1uXznIWUgmJX8psUWYCqm8Kk/gmTHOb9a7bSS4ZE9Hdkg6mtfg/6GXzn7CSv646uaBV8Hz/n023w
	QZMvJQGeD8eI68G7JioA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPMks-0000000A9X4-0Swv;
	Wed, 11 Jun 2025 14:48:42 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPHq3-00000009U8z-1qek;
	Wed, 11 Jun 2025 09:33:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=tZzaU59oPE6YTmR8ZmhjyU5Qzpkmbkp7Q1ygvd5Av4Y=; b=i/HdOkfUBHyMZ5vRapPA6BqXCF
	DIsazWQSJw0qO3vFLyAmFJhaBYmPp+yGZsYSHIsnUDxPuX/oDCXCy9C/HlmKAOVsqrSvRPia1ShvZ
	kDBMWRRatfD+TIfpkBe6fVAlJZ/eaF4qYkHUh/3srTOEmAEbC5iwHOZRubP6Njh4phbTZIuPsgjLV
	GJ5BOizE8aqbjNZU5hndzvIAOwgPIZql9ui3qXtbrEiynfHRkTGPNZttevgc6CU0E7eHomAtp+YFb
	oo6kMcmOSS1RJq2dsjIrqBzmRQZl0xc41ggGX//hlGAj+PJLgP1qyjvIsqPkrqUvSCooPGauKIdUl
	LtrC9RoQ==;
Received: from bali.collaboradmins.com ([148.251.105.195])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPHq1-00000002EXQ-0gmN;
	Wed, 11 Jun 2025 09:33:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1749634418;
	bh=oZEcpnP061nNjDS/WgnKTb1UcVd/WXF6k/yr0VPQsvg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Kizb/z0wcw/aH9ltLLM1EZhO+eukqEK/6W7COvd3FhHzaFkMY6jpcQX0Y3jUK6y6w
	 logvkP55UMr/w1LWJkNQTgfe0gSwSyrIPV/bnnpcXaO4tA/QKK50LTVw91PWrcNb45
	 /J/Kfdw8XBbwsl3cosQH2Kpyj/TFkCrZlgFpk6qtz1qjJJqDNfiIOdsQqtPBYFh1A7
	 i0qPQQlgQuQapncN3qsw7/PbGiWHeDTQYTCxUcZUMGjEHnl24SDwe1c9hnc/bgh9ye
	 A+35IOtHqr7+cPMV18Xw3AgB4gsC0WSELGgOAtzJjR+xC0jJhePabvljxkO6AWOxW+
	 tYqNLJlm+Lw+Q==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8EC4417E05C1;
	Wed, 11 Jun 2025 11:33:36 +0200 (CEST)
Message-ID: <fecf4045-9cc4-46d2-ba4a-5818fcfcb059@collabora.com>
Date: Wed, 11 Jun 2025 11:33:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 13/13] arm64: dts: mediatek: mt7988a-bpi-r4: configure
 switch phys and leds
To: Frank Wunderlich <linux@fw-web.de>,
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Georgi Djakov <djakov@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
References: <20250608211452.72920-1-linux@fw-web.de>
 <20250608211452.72920-14-linux@fw-web.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250608211452.72920-14-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_103341_502427_C4A022A2 
X-CRM114-Status: GOOD (  14.54  )
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
Cc: devicetree@vger.kernel.org, Landen Chao <Landen.Chao@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>, netdev@vger.kernel.org, linux-pm@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>, linux-kernel@vger.kernel.org, DENG Qingfang <dqfext@gmail.com>, Johnson Wang <johnson.wang@mediatek.com>, linux-mediatek@lists.infradead.org, Jia-Wei Chang <jia-wei.chang@mediatek.com>, Lorenzo Bianconi <lorenzo@kernel.org>, linux-arm-kernel@lists.infradead.org, Felix Fietkau <nbd@nbd.name>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 08/06/25 23:14, Frank Wunderlich ha scritto:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Assign pinctrl to switch phys and leds.
> 
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> ---
> v2:
> - add labels and led-function and include after dropping from soc dtsi
> ---
>   .../dts/mediatek/mt7988a-bananapi-bpi-r4.dtsi | 61 +++++++++++++++++++
>   1 file changed, 61 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtsi b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtsi
> index d8b9cd794ee3..f10d3617dcac 100644
> --- a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dtsi
> @@ -4,6 +4,7 @@
>   
>   #include <dt-bindings/gpio/gpio.h>
>   #include <dt-bindings/regulator/richtek,rt5190a-regulator.h>
> +#include <dt-bindings/leds/common.h>
>   
>   #include "mt7988a.dtsi"
>   
> @@ -151,6 +152,66 @@ &gmac2 {
>   	phy-mode = "usxgmii";
>   };
>   
> +&gsw_phy0 {
> +	pinctrl-names = "gbe-led";
> +	pinctrl-0 = <&gbe0_led0_pins>;

pinctrl-0
pinctrl-names (here and everywhere else)

> +};
> +
> +&gsw_phy0_led0 {

function
color
status

> +	status = "okay";
> +	function = LED_FUNCTION_WAN;
> +	color = <LED_COLOR_ID_GREEN>;
> +};
> +
> +&gsw_port0 {
> +	label = "wan";
> +};
> +
> +&gsw_phy1 {
> +	pinctrl-names = "gbe-led";
> +	pinctrl-0 = <&gbe1_led0_pins>;
> +};
> +
> +&gsw_phy1_led0 {
> +	status = "okay";
> +	function = LED_FUNCTION_LAN;
> +	color = <LED_COLOR_ID_GREEN>;
> +};
> +
> +&gsw_port1 {
> +	label = "lan1";
> +};
> +
> +&gsw_phy2 {
> +	pinctrl-names = "gbe-led";
> +	pinctrl-0 = <&gbe2_led0_pins>;
> +};
> +
> +&gsw_phy2_led0 {
> +	status = "okay";
> +	function = LED_FUNCTION_LAN;
> +	color = <LED_COLOR_ID_GREEN>;
> +};
> +
> +&gsw_port2 {
> +	label = "lan2";
> +};
> +
> +&gsw_phy3 {

function

pinctrl-0
pinctrl-names


> +	pinctrl-names = "gbe-led";
> +	function = LED_FUNCTION_LAN;
> +	pinctrl-0 = <&gbe3_led0_pins>;
> +};
> +
> +&gsw_phy3_led0 {

color
status

> +	status = "okay";
> +	color = <LED_COLOR_ID_GREEN>;
> +};

...after which

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



