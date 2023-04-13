Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6151EC77B6E
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Apr 2023 13:18:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LVwUeNJLC8xMTEPWAXadoHD3qm8Dh5aUWP+sGxPnrLw=; b=XkT7tmTC7y6FJiKD8qcyOSg8Bv
	aakarjB3kGZ6KfOEzKQWhTcc6j1H9Fnw+0ysBNvIr5NhTHa53kZtwUI3U2vnbEE5U6+c5Ub5FDwtP
	89TuSy0yedDrwOLF/jYZETSkjj6GmhH9jz4RhluTSN/YBHiOgXyiYwlyA58OSUA7HQeOspUgW1dcd
	XVLp7UtkQIQE8t9p8Pj5yjI3mBD4aCw1P6cNXBCIv/sUoLpiqvXCeN95JLCcTvfzhQscGSmKKlkZ+
	OWDv7wV++u1r20cPqehyJQ0UH6Axw9FQtSP49M6axtPoliX5CgXTGRh3Q6Mi1EOiXO4Y44MSptEdr
	AhNSfslg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmwpk-006EYA-2X;
	Thu, 13 Apr 2023 13:17:52 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmwpe-006EUl-2y;
	Thu, 13 Apr 2023 13:17:48 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 593C66603219;
	Thu, 13 Apr 2023 14:17:44 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1681391865;
	bh=R+bkS6zf4+ohM4HlMQeBjxGdxTHQFqSnwecyrY1S5ws=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=N0n+Y06N3L8jygZ9qjWTM90m84pqe5Pa1r6GAp0jKx9i7ETrEDHJM/DCzOdGCfBOA
	 gWCJuInYXSh2NGi+6MrZwjEW33TUsdwYY7H3QYFBFhlBwOfgMvCOWgYhPLYTWAUVwo
	 1gbus8SY+zVHg7EewxoLiuxMatP0Kt8tFM1b+l/fCd3teiYyvEQRdDpVyDJFZaLhkd
	 IdCuJKsSoLMePHf0GhGvlToBw/N23DR+FCDyywWmc3pHCeVqTuJbwcp/6iAE+S7WxW
	 ihNoZ/88DAtPwSE82kR4IJfAY0Eeoq0+t2hYenPg+fr6oT1C1lm1RrBddwNP8Grv3L
	 AUv1fKL13TyTg==
Message-ID: <e36598dd-4f83-90b4-1744-61d18744b02d@collabora.com>
Date: Thu, 13 Apr 2023 15:17:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 3/7] ASoC: mediatek: mt8188: revise ETDM control flow
Content-Language: en-US
To: Trevor Wu <trevor.wu@mediatek.com>, broonie@kernel.org,
 lgirdwood@gmail.com, tiwai@suse.com, perex@perex.cz, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com
Cc: alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20230413104713.7174-1-trevor.wu@mediatek.com>
 <20230413104713.7174-4-trevor.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230413104713.7174-4-trevor.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230413_061747_218157_8BBA1740 
X-CRM114-Status: GOOD (  24.21  )
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

Il 13/04/23 12:47, Trevor Wu ha scritto:
> Replace register controls in snd_soc_dai_ops with snd_soc_dapm_widgets.
> startup, shutdown and trigger ops are removed, and create DAPM_SUPPLY
> to handle mclk, clock gating and etdm enabling. Additionally, mclk setup
> sequence is also updated because of new supply enabling sequence.
> 
> Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
> ---
>   sound/soc/mediatek/mt8188/mt8188-dai-etdm.c | 790 ++++++++++----------
>   sound/soc/mediatek/mt8188/mt8188-reg.h      |   2 +
>   2 files changed, 406 insertions(+), 386 deletions(-)
> 
> diff --git a/sound/soc/mediatek/mt8188/mt8188-dai-etdm.c b/sound/soc/mediatek/mt8188/mt8188-dai-etdm.c
> index fddecf5bf7c6..c276687630ee 100644
> --- a/sound/soc/mediatek/mt8188/mt8188-dai-etdm.c
> +++ b/sound/soc/mediatek/mt8188/mt8188-dai-etdm.c
> @@ -21,6 +21,13 @@
>   #define ETDM_TO_DAI_ID(x) ((x) + MT8188_AFE_IO_ETDM_START)
>   #define ENUM_TO_STR(x)	#x
>   
> +enum {
> +	SUPPLY_SEQ_ETDM_MCLK,
> +	SUPPLY_SEQ_ETDM_CG,
> +	SUPPLY_SEQ_DPTX_EN,
> +	SUPPLY_SEQ_ETDM_EN,
> +};
> +
>   enum {
>   	MTK_DAI_ETDM_FORMAT_I2S = 0,
>   	MTK_DAI_ETDM_FORMAT_LJ,
> @@ -84,7 +91,6 @@ struct mtk_dai_etdm_rate {
>   };
>   
>   struct mtk_dai_etdm_priv {
> -	unsigned int clock_mode;
>   	unsigned int data_mode;
>   	bool slave_mode;
>   	bool lrck_inv;
> @@ -100,8 +106,6 @@ struct mtk_dai_etdm_priv {
>   	unsigned int cowork_slv_count;
>   	int cowork_slv_id[MT8188_AFE_IO_ETDM_NUM - 1]; //dai_id
>   	bool in_disable_ch[MT8188_ETDM_MAX_CHANNELS];
> -	unsigned int en_ref_cnt;
> -	bool is_prepared;
>   };
>   
>   static const struct mtk_dai_etdm_rate mt8188_etdm_rates[] = {
> @@ -345,14 +349,82 @@ static int mtk_dai_etdm_get_clkdiv_id_by_dai_id(int dai_id)
>   	}
>   }
>   
> +static int get_etdm_id_by_name(struct mtk_base_afe *afe,
> +			       const char *name)
> +{
> +	if (!strncmp(name, "ETDM1_IN", strlen("ETDM1_IN")))
> +		return MT8188_AFE_IO_ETDM1_IN;
> +	else if (!strncmp(name, "ETDM2_IN", strlen("ETDM2_IN")))
> +		return MT8188_AFE_IO_ETDM2_IN;
> +	else if (!strncmp(name, "ETDM1_OUT", strlen("ETDM1_OUT")))
> +		return MT8188_AFE_IO_ETDM1_OUT;
> +	else if (!strncmp(name, "ETDM2_OUT", strlen("ETDM2_OUT")))
> +		return MT8188_AFE_IO_ETDM2_OUT;
> +	else
> +		return -EINVAL;
> +}
> +
> +static struct mtk_dai_etdm_priv *get_etdm_priv_by_name(struct mtk_base_afe *afe,
> +						       const char *name)
> +{
> +	struct mt8188_afe_private *afe_priv = afe->platform_priv;
> +	int dai_id = get_etdm_id_by_name(afe, name);
> +
> +	if (dai_id < MT8188_AFE_IO_ETDM_START ||
> +	    dai_id >= MT8188_AFE_IO_ETDM_END)
> +		return NULL;
> +
> +	return afe_priv->dai_priv[dai_id];
> +}
> +
>   static int mtk_dai_etdm_enable_mclk(struct mtk_base_afe *afe, int dai_id)
>   {
>   	struct mt8188_afe_private *afe_priv = afe->platform_priv;
> +	struct mtk_dai_etdm_priv *etdm_data;
> +	struct etdm_con_reg etdm_reg;
> +	unsigned int val = 0;
> +	unsigned int mask;
> +	int clkmux_id = mtk_dai_etdm_get_clk_id_by_dai_id(dai_id);
>   	int clkdiv_id = mtk_dai_etdm_get_clkdiv_id_by_dai_id(dai_id);
> +	int apll_clk_id;
> +	int apll;
> +	int ret;
> +
> +	if (!is_valid_etdm_dai(dai_id))
> +		return -EINVAL;
> +	etdm_data = afe_priv->dai_priv[dai_id];
>   
> -	if (clkdiv_id < 0)
> +	apll = etdm_data->mclk_apll;
> +	apll_clk_id = mt8188_afe_get_mclk_source_clk_id(apll);
> +
> +	if (clkmux_id < 0 || clkdiv_id < 0)
>   		return -EINVAL;
>   
> +	if (apll_clk_id < 0)
> +		return apll_clk_id;
> +
> +	ret = get_etdm_reg(dai_id, &etdm_reg);
> +	if (ret < 0)
> +		return ret;
> +
> +	mask = ETDM_CON1_MCLK_OUTPUT;
> +	if (etdm_data->mclk_dir == SND_SOC_CLOCK_OUT)
> +		val = ETDM_CON1_MCLK_OUTPUT;
> +	regmap_update_bits(afe->regmap, etdm_reg.con1, mask, val);
> +
> +	/* enable parent clock before select apll*/
> +	mt8188_afe_enable_clk(afe, afe_priv->clk[clkmux_id]);
> +
> +	/* select apll */
> +	ret = mt8188_afe_set_clk_parent(afe, afe_priv->clk[clkmux_id],
> +					afe_priv->clk[apll_clk_id]);
> +	if (ret)
> +		return ret;
> +
> +	/* set rate */
> +	ret = mt8188_afe_set_clk_rate(afe, afe_priv->clk[clkdiv_id],
> +				      etdm_data->mclk_freq);
> +
>   	mt8188_afe_enable_clk(afe, afe_priv->clk[clkdiv_id]);
>   
>   	return 0;
> @@ -361,12 +433,207 @@ static int mtk_dai_etdm_enable_mclk(struct mtk_base_afe *afe, int dai_id)
>   static int mtk_dai_etdm_disable_mclk(struct mtk_base_afe *afe, int dai_id)
>   {
>   	struct mt8188_afe_private *afe_priv = afe->platform_priv;
> +	int clkmux_id = mtk_dai_etdm_get_clk_id_by_dai_id(dai_id);
>   	int clkdiv_id = mtk_dai_etdm_get_clkdiv_id_by_dai_id(dai_id);
>   
> -	if (clkdiv_id < 0)
> +	if (clkmux_id < 0 || clkdiv_id < 0)
>   		return -EINVAL;
>   
>   	mt8188_afe_disable_clk(afe, afe_priv->clk[clkdiv_id]);
> +	mt8188_afe_disable_clk(afe, afe_priv->clk[clkmux_id]);
> +
> +	return 0;
> +}
> +
> +static int mtk_etdm_mclk_connect(struct snd_soc_dapm_widget *source,
> +				 struct snd_soc_dapm_widget *sink)
> +{
> +	struct snd_soc_dapm_widget *w = sink;
> +	struct snd_soc_component *cmpnt = snd_soc_dapm_to_component(w->dapm);
> +	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
> +	struct mt8188_afe_private *afe_priv = afe->platform_priv;
> +	struct mtk_dai_etdm_priv *etdm_priv;
> +	int mclk_id;
> +
> +	mclk_id = get_etdm_id_by_name(afe, source->name);
> +	if (mclk_id < 0) {
> +		dev_info(afe->dev, "mclk_id < 0");

Since you're returning 0, this doesn't appear to be an error and this print is
useless unless it is used for debugging purposes.

Please change it to dev_dbg().

> +		return 0;
> +	}
> +
> +	etdm_priv = get_etdm_priv_by_name(afe, w->name);
> +	if (!etdm_priv) {
> +		dev_info(afe->dev, "etdm_priv == NULL");

dev_dbg()

> +		return 0;
> +	}
> +
> +	if (get_etdm_id_by_name(afe, sink->name) == mclk_id)
> +		return !!(etdm_priv->mclk_freq > 0);
> +
> +	if (etdm_priv->cowork_source_id == mclk_id) {
> +		etdm_priv = afe_priv->dai_priv[mclk_id];
> +		return !!(etdm_priv->mclk_freq > 0);
> +	}
> +
> +	return 0;
> +}
> +
> +static int mtk_etdm_cowork_connect(struct snd_soc_dapm_widget *source,
> +				   struct snd_soc_dapm_widget *sink)
> +{
> +	struct snd_soc_dapm_widget *w = sink;
> +	struct snd_soc_component *cmpnt = snd_soc_dapm_to_component(w->dapm);
> +	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
> +	struct mt8188_afe_private *afe_priv = afe->platform_priv;
> +	struct mtk_dai_etdm_priv *etdm_priv;
> +	int source_id;
> +	int i;
> +
> +	source_id = get_etdm_id_by_name(afe, source->name);
> +	if (source_id < 0) {
> +		dev_info(afe->dev, "%s() source_id < 0\n", __func__);

dev_dbg() please

> +		return 0;
> +	}
> +
> +	etdm_priv = get_etdm_priv_by_name(afe, w->name);
> +	if (!etdm_priv) {
> +		dev_info(afe->dev, "%s() etdm_priv == NULL\n", __func__);

...again... and everywhere else.

> +		return 0;
> +	}
> +

Regards,
Angelo


