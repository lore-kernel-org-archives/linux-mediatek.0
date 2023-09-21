Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 724F1E7070E
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Sep 2023 10:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oKXLz26nfA8zpMBOcJV3umpROvQlxt0KxQI1oSVBRHA=; b=AG1KNGoHvqYZiJTenuLKPim5VD
	Wtopu/yax0iMyNgKyZMT17uFgWJb3+OGPoRyC5o7IZM/CIPFOIqhwrEL+8cTQcr1UI7+L12MvsyjS
	2UBbNVkneLY0/gUPtE0g6ks3QY1jhiP9jjP9+esZCXPW85axisjX1VKQsgE1Yu/Fu/qVpVJOAwylF
	KrvipEu+LbzJBjQD9fnBu8o5WmpkmF1vCb7YmyHZVyIvIygsdJQtmr+8KnI/mN9/yyPyVAh04+LM8
	HtwHeQAkh/dd5nrdNcpcgSKuzh1SkQ7ptYgBYojuNC9tP5JQluUffryWlA4lqeGacuP7P/fBtRjJU
	cy35qmMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjGxc-005jXc-0U;
	Thu, 21 Sep 2023 10:31:04 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjGxX-005jVL-2y;
	Thu, 21 Sep 2023 10:31:01 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 484DCCE21A5;
	Thu, 21 Sep 2023 10:30:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3D42C32795;
	Thu, 21 Sep 2023 10:30:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695292255;
	bh=NcplQke/2kimQVgoG+ISd0cFiPzeZcW9x/liJMpj0E4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dI7yQh1h1G7/YujiefnLr3jF41n5s9CYMXqMYlterERnUSNccvCtWd+yg8hYvt34g
	 6J+jI7KyEwAYyJRrl5qBT/t4nV8QOeM29n/yyl2dsx75dMyg2NVgWTtu25qfzAG6FS
	 cFB3vt9krEMiCT2VRyg2dEj5fWWBXggTjdOjp0MRsj5zO2OciECzouKK2EeHy6ohqQ
	 nSRkJHDEIvrtKop00HO/GvdgBaEUhALGB+a5NL5JUHTXT/Y8hv9ALM+H8UkbjABojj
	 nodMqz+MOFOWibcX60gR9RBiUrFrGkE55d3PcJ4SvdfveGdsUDxJmzLZTQPBcRFi7B
	 vw5aUBuZjQNKA==
Date: Thu, 21 Sep 2023 11:30:50 +0100
From: Lee Jones <lee@kernel.org>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Mark Brown <broonie@kernel.org>,
	Zhiyong Tao <zhiyong.tao@mediatek.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v3 2/3] regulator: mt6358: Add output voltage fine tuning
 to fixed regulators
Message-ID: <20230921103050.GA3449785@google.com>
References: <20230913082919.1631287-1-wenst@chromium.org>
 <20230913082919.1631287-3-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230913082919.1631287-3-wenst@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230921_033100_384804_07CFF654 
X-CRM114-Status: GOOD (  22.94  )
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

On Wed, 13 Sep 2023, Chen-Yu Tsai wrote:

> The "fixed" LDO regulators found on the MT6358 and MT6366 PMICs have
> either no voltage selection register, or only one valid setting.
> However these do have a fine voltage calibration setting that can
> slightly boost the output voltage from 0 mV to 100 mV, in 10 mV
> increments.
> 
> Add support for this by changing these into linear range regulators.
> Some register definitions that are missing are also added.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
> This patch needs an ack from Lee.
> 
>  drivers/regulator/mt6358-regulator.c | 15 +++++++++++++--

>  include/linux/mfd/mt6358/registers.h |  6 ++++++

Acked-by: Lee Jones <lee@kernel.org>

>  2 files changed, 19 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/regulator/mt6358-regulator.c b/drivers/regulator/mt6358-regulator.c
> index 935c7ad56c7e..ecb2cd1eb34f 100644
> --- a/drivers/regulator/mt6358-regulator.c
> +++ b/drivers/regulator/mt6358-regulator.c
> @@ -123,10 +123,13 @@ struct mt6358_regulator_info {
>  		.type = REGULATOR_VOLTAGE,	\
>  		.id = MT6358_ID_##vreg,	\
>  		.owner = THIS_MODULE,	\
> -		.n_voltages = 1,	\
> +		.n_voltages = 11,	\
> +		.vsel_reg = MT6358_##vreg##_ANA_CON0,	\
> +		.vsel_mask = GENMASK(3, 0),	\
>  		.enable_reg = enreg,	\
>  		.enable_mask = BIT(enbit),	\
>  		.min_uV = volt,	\
> +		.uV_step = 10000, \
>  	},	\
>  	.status_reg = MT6358_LDO_##vreg##_CON1,	\
>  	.qi = BIT(15),							\
> @@ -219,10 +222,13 @@ struct mt6358_regulator_info {
>  		.type = REGULATOR_VOLTAGE,	\
>  		.id = MT6366_ID_##vreg,	\
>  		.owner = THIS_MODULE,	\
> -		.n_voltages = 1,	\
> +		.n_voltages = 11,	\
> +		.vsel_reg = MT6358_##vreg##_ANA_CON0,	\
> +		.vsel_mask = GENMASK(3, 0),	\
>  		.enable_reg = enreg,	\
>  		.enable_mask = BIT(enbit),	\
>  		.min_uV = volt,	\
> +		.uV_step = 10000, \
>  	},	\
>  	.status_reg = MT6358_LDO_##vreg##_CON1,	\
>  	.qi = BIT(15),							\
> @@ -482,8 +488,13 @@ static const struct regulator_ops mt6358_volt_table_ops = {
>  	.get_status = mt6358_get_status,
>  };
>  
> +/* "Fixed" LDOs with output voltage calibration +0 ~ +10 mV */
>  static const struct regulator_ops mt6358_volt_fixed_ops = {
>  	.list_voltage = regulator_list_voltage_linear,
> +	.map_voltage = regulator_map_voltage_linear,
> +	.set_voltage_sel = regulator_set_voltage_sel_regmap,
> +	.get_voltage_sel = mt6358_get_buck_voltage_sel,
> +	.set_voltage_time_sel = regulator_set_voltage_time_sel,
>  	.enable = regulator_enable_regmap,
>  	.disable = regulator_disable_regmap,
>  	.is_enabled = regulator_is_enabled_regmap,
> diff --git a/include/linux/mfd/mt6358/registers.h b/include/linux/mfd/mt6358/registers.h
> index 3d33517f178c..5ea2590be710 100644
> --- a/include/linux/mfd/mt6358/registers.h
> +++ b/include/linux/mfd/mt6358/registers.h
> @@ -262,6 +262,12 @@
>  #define MT6358_LDO_VBIF28_CON3                0x1db0
>  #define MT6358_VCAMA1_ANA_CON0                0x1e08
>  #define MT6358_VCAMA2_ANA_CON0                0x1e0c
> +#define MT6358_VFE28_ANA_CON0                 0x1e10
> +#define MT6358_VCN28_ANA_CON0                 0x1e14
> +#define MT6358_VBIF28_ANA_CON0                0x1e18
> +#define MT6358_VAUD28_ANA_CON0                0x1e1c
> +#define MT6358_VAUX18_ANA_CON0                0x1e20
> +#define MT6358_VXO22_ANA_CON0                 0x1e24
>  #define MT6358_VCN33_ANA_CON0                 0x1e28
>  #define MT6358_VSIM1_ANA_CON0                 0x1e2c
>  #define MT6358_VSIM2_ANA_CON0                 0x1e30
> -- 
> 2.42.0.283.g2d96d420d3-goog
> 

-- 
Lee Jones [李琼斯]

