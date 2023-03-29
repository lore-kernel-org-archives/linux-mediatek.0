Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 234ACC6FD18
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Mar 2023 13:28:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7H2fHJgX8x+QMYGUwxevU3QgPVs1ZPjhWPEi+REatEQ=; b=X2s88egFELmHXaifPISxTw5Bto
	+iyr6oNz9fiBm9xtUPBwrvwSs65ZTTZUDdQkySxlh7uww3TUt3EBNUKOGas6bhf4ZwK+7MQ3mTHoD
	MjjACN2780ibxcjUCpxrGO3lnERCGqHe9T8byWA2sR5slYnMzISoIpxnE3F8UfzcBGr3Dp6jo0CvY
	2LBF5ocMcerFS10u57hQQLtK5Cn3u5HCvLNfu5rpnS57eLoi6Cr+TALX55KAOk9hgTslCcs5NST4U
	qxg/JuUYz13iJnZdKjJ0/RmjhaflvtKLnDB7AnGj5TbKne49OmXXLwNYqsb/8ryDifR3K1W6zmTQs
	ijcPtDdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phVqq-000Ov9-1H;
	Wed, 29 Mar 2023 13:28:32 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phVqm-000Ot0-2t;
	Wed, 29 Mar 2023 13:28:30 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 2C9FD6602173;
	Wed, 29 Mar 2023 14:28:26 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1680096507;
	bh=dPurwcCzBh53xYIIc/DWqjdYl2N/RjAfRStrUt2ymbg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=YrYXYXWRyb7oA/U0bSzyOSnFThy2Xc41itY9aUfaIB03t66o9TALGdUOc/VUTqIl/
	 fjbd9dVCH8uSKhSJ1w4GgWpG7BaH51gbOtuFJRWY79Sjyv5LtxuAJkgdncpwY3OXGX
	 QFCIBe2ofhVNluIrHyTpBRPGz4p3Ywd+Jo1cUB9/yqLPdgP+829FpG7oYtsFbEYIJW
	 6MQBWMTbKOcR+cb/GuKsWVQRW1RRhIHnOI3merM6sWlYnyMZmF6d2mjQgdaRqbZFJH
	 j8qkmwpzgZ76l6YMvx4OoWLopNPIBmEtTNygEnoP0Dn9okK8HNVFPPxKtTuxFCKYsX
	 6XeN1qyHZ40pA==
Message-ID: <f55c727c-79ce-1111-3a0a-45cbefa8bba2@collabora.com>
Date: Wed, 29 Mar 2023 15:28:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v3 14/17] arm64: dts: mediatek: add OPP support for mt8365
 SoC
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
 <20230203-evk-board-support-v3-14-0003e80e0095@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230203-evk-board-support-v3-14-0003e80e0095@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230329_062829_065527_43694C4F 
X-CRM114-Status: GOOD (  15.12  )
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
> In order to have cpufreq support, this patch adds generic Operating
> Performance Points support.
> 
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>   arch/arm64/boot/dts/mediatek/mt8365.dtsi | 85 ++++++++++++++++++++++++++++++++
>   1 file changed, 85 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8365.dtsi b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
> index 394a5a61be59..c3ea3cc97a47 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8365.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8365.dtsi
> @@ -20,6 +20,75 @@ cpus {
>   		#address-cells = <1>;
>   		#size-cells = <0>;
>   
> +	cluster0_opp: opp-table-0 {
> +		compatible = "operating-points-v2";
> +		opp-shared;

One blank line here please, makes it slightly more readable.

> +		opp-850000000 {
> +			opp-hz = /bits/ 64 <850000000>;
> +			opp-microvolt = <650000>;
> +		};

Also, my personal preference is to also leave a blank line between
each opp-xxxx subnode, but that's your choice.

Everything else looks good.

