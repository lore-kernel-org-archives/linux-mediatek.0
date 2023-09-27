Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A3A6E7F14F
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Sep 2023 23:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UIJ9GVlgZBwN3FGaVaBjMIW7DpzAuX6textERhNBIDc=; b=RydXli6EqUKyOytLBzvA60LXhQ
	V6hq9Qef8j7nFSkclVZH3CVjylitaIY0AT4RvMcPlpadN4BSk3lxyrnw163oN2cvN9s99Ogmzn6f0
	+w5+DyoVWSXr2UBZooEzYMhwLmscvybl9gwCPRL41axDwQmjcLnbbKzWdw87y4cXhmV8Y/vDYqRxS
	vbOhAFZMJ4RB5pKXHz5L+kVL3D/1oMe+QrznguUchBiH9d6dIuqYDdeaJ2vOqgsNcK2Vb1mCbwjFY
	NmFuGTmUdMFQhHXKxsVSbxV3vE/CuiU0PDCju0JPCRCEqKXjsJNgulTo/i5sk5EuBJRfTT7gzU2pr
	0ged2NqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qleQF-001yHV-1A;
	Wed, 27 Sep 2023 23:58:27 +0000
Received: from pidgin.makrotopia.org ([185.142.180.65])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qleQC-001yGe-2x;
	Wed, 27 Sep 2023 23:58:26 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1qleQB-0004AP-2S;
	Wed, 27 Sep 2023 23:58:23 +0000
Date: Thu, 28 Sep 2023 00:56:04 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Frank Wunderlich <linux@fw-web.de>
Subject: Re: [PATCH v3 4/4] thermal/drivers/mediatek/lvts_thermal: add mt7988
 support
Message-ID: <ZRTBFJPL3NwWpMSP@pidgin.makrotopia.org>
References: <20230922055020.6436-1-linux@fw-web.de>
 <20230922055020.6436-5-linux@fw-web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230922055020.6436-5-linux@fw-web.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230927_165824_960323_B870FE3A 
X-CRM114-Status: GOOD (  22.04  )
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
Cc: devicetree@vger.kernel.org, Daniel Lezcano <daniel.lezcano@linaro.org>, "Rafael J. Wysocki" <rafael@kernel.org>, linux-pm@vger.kernel.org, Amit Kucheria <amitk@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Zhang Rui <rui.zhang@intel.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Sep 22, 2023 at 07:50:20AM +0200, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Add Support for Mediatek Filogic 880/MT7988 LVTS.
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>

Tested-by: Daniel Golle <daniel@makrotopia.org>

> ---
> v3:
> - drop comments
> 
> v2:
> - use 105°C for hw shutdown
> - move constants to binding file
> - change coeff.a to temp_factor and coeff.b to temp_offset
> - change to lvts to lvts-ap (Application Processor)
> - drop comments about efuse offsets
> - change comment of mt8195 to be similar to mt7988
> ---
>  drivers/thermal/mediatek/lvts_thermal.c | 38 +++++++++++++++++++++++++
>  1 file changed, 38 insertions(+)
> 
> diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/thermal/mediatek/lvts_thermal.c
> index c2669f405a94..23b4e0b3195c 100644
> --- a/drivers/thermal/mediatek/lvts_thermal.c
> +++ b/drivers/thermal/mediatek/lvts_thermal.c
> @@ -82,6 +82,8 @@
>  #define LVTS_GOLDEN_TEMP_DEFAULT	50
>  #define LVTS_COEFF_A_MT8195			-250460
>  #define LVTS_COEFF_B_MT8195			250460
> +#define LVTS_COEFF_A_MT7988			-204650
> +#define LVTS_COEFF_B_MT7988			204650
>  
>  #define LVTS_MSR_IMMEDIATE_MODE		0
>  #define LVTS_MSR_FILTERED_MODE		1
> @@ -89,6 +91,7 @@
>  #define LVTS_MSR_READ_TIMEOUT_US	400
>  #define LVTS_MSR_READ_WAIT_US		(LVTS_MSR_READ_TIMEOUT_US / 2)
>  
> +#define LVTS_HW_SHUTDOWN_MT7988		105000
>  #define LVTS_HW_SHUTDOWN_MT8195		105000
>  
>  #define LVTS_MINIMUM_THRESHOLD		20000
> @@ -1269,6 +1272,33 @@ static int lvts_remove(struct platform_device *pdev)
>  	return 0;
>  }
>  
> +static const struct lvts_ctrl_data mt7988_lvts_ap_data_ctrl[] = {
> +	{
> +		.cal_offset = { 0x00, 0x04, 0x08, 0x0c },
> +		.lvts_sensor = {
> +			{ .dt_id = MT7988_CPU_0 },
> +			{ .dt_id = MT7988_CPU_1 },
> +			{ .dt_id = MT7988_ETH2P5G_0 },
> +			{ .dt_id = MT7988_ETH2P5G_1 }
> +		},
> +		.num_lvts_sensor = 4,
> +		.offset = 0x0,
> +		.hw_tshut_temp = LVTS_HW_SHUTDOWN_MT7988,
> +	},
> +	{
> +		.cal_offset = { 0x14, 0x18, 0x1c, 0x20 },
> +		.lvts_sensor = {
> +			{ .dt_id = MT7988_TOPS_0},
> +			{ .dt_id = MT7988_TOPS_1},
> +			{ .dt_id = MT7988_ETHWARP_0},
> +			{ .dt_id = MT7988_ETHWARP_1}
> +		},
> +		.num_lvts_sensor = 4,
> +		.offset = 0x100,
> +		.hw_tshut_temp = LVTS_HW_SHUTDOWN_MT7988,
> +	}
> +};
> +
>  static const struct lvts_ctrl_data mt8195_lvts_mcu_data_ctrl[] = {
>  	{
>  		.cal_offset = { 0x04, 0x07 },
> @@ -1348,6 +1378,13 @@ static const struct lvts_ctrl_data mt8195_lvts_ap_data_ctrl[] = {
>  	}
>  };
>  
> +static const struct lvts_data mt7988_lvts_ap_data = {
> +	.lvts_ctrl	= mt7988_lvts_ap_data_ctrl,
> +	.num_lvts_ctrl	= ARRAY_SIZE(mt7988_lvts_ap_data_ctrl),
> +	.temp_factor	= LVTS_COEFF_A_MT7988,
> +	.temp_offset	= LVTS_COEFF_B_MT7988,
> +};
> +
>  static const struct lvts_data mt8195_lvts_mcu_data = {
>  	.lvts_ctrl	= mt8195_lvts_mcu_data_ctrl,
>  	.num_lvts_ctrl	= ARRAY_SIZE(mt8195_lvts_mcu_data_ctrl),
> @@ -1363,6 +1400,7 @@ static const struct lvts_data mt8195_lvts_ap_data = {
>  };
>  
>  static const struct of_device_id lvts_of_match[] = {
> +	{ .compatible = "mediatek,mt7988-lvts-ap", .data = &mt7988_lvts_ap_data },
>  	{ .compatible = "mediatek,mt8195-lvts-mcu", .data = &mt8195_lvts_mcu_data },
>  	{ .compatible = "mediatek,mt8195-lvts-ap", .data = &mt8195_lvts_ap_data },
>  	{},
> -- 
> 2.34.1
> 

