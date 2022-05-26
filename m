Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3193C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 May 2022 14:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=02WJZXsLGAxzUYxTMidG5QKUqd7i5s5YO8ZTLd4i9W8=; b=dCXunACWp2ycLp
	bBMJuRmoH3T471EsPzZl52djJtB9JMBSHsrOjZQT+aROAGD0aeN5oS4GLYb2l1gIsHoanGAPdCTrk
	TMA9/tEfEOaVH397uBdPffLcWbb+qqjqEo7IA+InIvnLJxdXojwpqbm7u2OIlN7IAya2QEVmaHzCC
	4lwax+jjTaSzCMu4h+8EiJnzGh5HWMmrIRdxzKXXXaG2/UXS0aqw120xojY+Qs7lOYuMyDRfr5BPC
	k0jhBavi13WTwFTYtImfG4m7fP85LWvrbsiJ66a8Gnbm9pHNpRM98vMHMzWYSSRW2Wc+hWQ7JiJAm
	2vzCZTz8FSh1YyRaMs+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nuEhz-00FBKs-4P; Thu, 26 May 2022 14:43:27 +0000
Received: from relay08.th.seeweb.it ([5.144.164.169])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nuEha-00FB7e-6G
	for linux-mediatek@lists.infradead.org; Thu, 26 May 2022 14:43:05 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 958283FA27;
	Thu, 26 May 2022 17:05:07 +0200 (CEST)
Message-ID: <256a5147-82b1-9453-574e-7c96f244d266@somainline.org>
Date: Thu, 26 May 2022 16:42:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v7 5/6] arm64: dts: mt8195: Add efuse node to mt8195
Content-Language: en-US
To: Alexandre Bailon <abailon@baylibre.com>, rafael@kernel.org,
 rui.zhang@intel.com, daniel.lezcano@linaro.org, amitk@kernel.org
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 khilman@baylibre.com, mka@chromium.org, robh+dt@kernel.org,
 krzk+dt@kernel.org, matthias.bgg@gmail.com, p.zabel@pengutronix.de,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, james.lo@mediatek.com,
 fan.chen@mediatek.com, louis.yu@mediatek.com, rex-bc.chen@mediatek.com
References: <20220524152552.246193-1-abailon@baylibre.com>
 <20220524152552.246193-6-abailon@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
In-Reply-To: <20220524152552.246193-6-abailon@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220526_074302_414709_239FAF00 
X-CRM114-Status: GOOD (  12.72  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 24/05/22 17:25, Alexandre Bailon ha scritto:
> This adds the efuse node. This will be required by the thermal driver
> to get the calibration data.
> 
> Signed-off-by: Alexandre Bailon <abailon@baylibre.com>
> ---
>   arch/arm64/boot/dts/mediatek/mt8195.dtsi | 17 +++++++++++++++++
>   1 file changed, 17 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> index 0011a8ba8f96..51443e83d906 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> @@ -1238,6 +1238,23 @@ nor_flash: spi@1132c000 {
>   			status = "disabled";
>   		};
>   
> +		efuse: efuse@11c10000 {
> +			compatible = "mediatek,efuse";
> +			reg = <0 0x11c10000 0 0x1000>;
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +
> +			lvts_e_data1: data1 {

lvts1-calib@1bc

> +				reg = <0x1bc 0x14>;
> +			};
> +			lvts_e_data2: data1-1 {

lvts2-calib@1d0

> +				reg = <0x1d0 0x38>;
> +			};
> +			svs_calibration: calib@580 {
> +				reg = <0x580 0x64>;
> +			};
> +		};
> +
>   		u3phy2: t-phy@11c40000 {
>   			compatible = "mediatek,mt8195-tphy", "mediatek,generic-tphy-v3";
>   			#address-cells = <1>;


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
