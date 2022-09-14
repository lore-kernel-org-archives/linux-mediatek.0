Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43C89ECAAD8
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Sep 2022 12:24:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hDmXtsMv6r0QuPhqejOHYJEHUuCgMMCkqeuElwAqIzU=; b=hICDi/cqd8nVnLdyDL9bIpihg8
	G6YNSX4pZCDMD4QZIM1II9YFkB3mebQZVX43+jr0DHEQdMXAfBcKEqkyOmFFri3kCqf9vxzuOdoIe
	fcekGi2XBtVxeMkD5R7ZMHDnFUMLcJTfp4Mb0xM9B0nLA5EqEPLAM0xg3SA9yVM7DOyUMHWsVTTxk
	47PwEZ0JEs7Jcqywx9QTtc1vmaS26Lit943JHPadIxeY4hQVBkuK6crDZhnPgKSA5oNp/DvbPZj7p
	+16Tm/BScxcmjG5Wo6WqykVQuABi5uQyNUuEWsx9y9YZFiy738Y7Sb4jpKREL4FZvc7ij3wj5/9G7
	tXXRvy7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYRQn-00HGDs-Fq; Wed, 14 Sep 2022 12:23:53 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYRQT-00HFYt-7g; Wed, 14 Sep 2022 12:23:34 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id E79E8660201C;
	Wed, 14 Sep 2022 13:23:30 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1663158211;
	bh=Zyj8UOwqqdMNifAcdEPJzAn/naWDZ+dbMV3i/enh2GA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=RZlfeTJxpxw4WHbV/mgUK1ywQDuLu3cltTMWV6CLt9ZS5CupVvjjp/Aj6DeJG4HkP
	 UcU2RLeiRZm33bBfs64EAdXt7kVXy632JhG6hQyhK2pA63t82ai2DKZbQzCs83KPvP
	 yWI6uOoxd/Jrcj67sEvo2/LjErWB9Q7nBtm1iTit0to03euwjNIdclE0RUFc+PFGtY
	 OO9CBxMaVa1MP2FAork2noAqTH7jUz4ADQQ3Cm//47fc4DobPXdw8UzTUnM/nWR9EB
	 o8G5IZGJW7ip8Fhb3MYKEqiwVlMsIqSEYNtLF1Vot/3Bag6mPX25wBS9IulgcaOZJJ
	 ru6tuY7o7kLxA==
Message-ID: <064cd527-a975-a12f-a00b-3e6da3dbecb5@collabora.com>
Date: Wed, 14 Sep 2022 14:23:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v9,5/7] arm64: dts: mt8195: Add efuse node to mt8195
Content-Language: en-US
To: bchihi@baylibre.com, rafael@kernel.org, rui.zhang@intel.com,
 daniel.lezcano@linaro.org, amitk@kernel.org
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 khilman@baylibre.com, mka@chromium.org, robh+dt@kernel.org,
 krzk+dt@kernel.org, matthias.bgg@gmail.com, p.zabel@pengutronix.de,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, james.lo@mediatek.com,
 fan.chen@mediatek.com, louis.yu@mediatek.com, rex-bc.chen@mediatek.com,
 abailon@baylibre.com
References: <20220817080757.352021-1-bchihi@baylibre.com>
 <20220817080757.352021-6-bchihi@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220817080757.352021-6-bchihi@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220914_052333_450201_32741575 
X-CRM114-Status: GOOD (  14.82  )
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

Il 17/08/22 10:07, bchihi@baylibre.com ha scritto:
> From: Alexandre Bailon <abailon@baylibre.com>
> 
> Add efuse node.
> This will be required by the thermal driver to get the calibration data.
> 
> Signed-off-by: Alexandre Bailon <abailon@baylibre.com>
> Co-developed-by: Balsam CHIHI <bchihi@baylibre.com>
> Signed-off-by: Balsam CHIHI <bchihi@baylibre.com>
> ---
>   arch/arm64/boot/dts/mediatek/mt8195.dtsi | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> index 066c14989708..95967a0196d8 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> @@ -733,6 +733,18 @@ u2_intr_p3: usb2-intr-p3@189,2 {
>   				reg = <0x189 0x2>;
>   				bits = <7 5>;
>   			};
> +
> +			lvts_efuse_data1: lvts1-calib@1bc {
> +				reg = <0x1bc 0x14>;
> +			};
> +
> +			lvts_efuse_data2: lvts2-calib@1d0 {
> +				reg = <0x1d0 0x38>;
> +			};
> +
> +			svs_calibration: calib@580 {

The SVS calibration efuse is for the SVS driver, not for the LVTS.
Moreover, you're not using it later when you add the LVTS nodes, so, please
drop this one.

Regards,
Angelo


