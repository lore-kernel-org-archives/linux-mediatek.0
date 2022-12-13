Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C933EC4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Dec 2022 10:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vc5uXKVAE2YUv86H9GjMKa7o5oMNjSMTC+mbRY3KC8Q=; b=AYrMfVEw+ebMk4urgfpKuMWKYy
	6EfQPNDUuQKWUktg0HY/jhfdFGrbJledovs33weF6XQqL+BdTAaeB484KqUVmdNn+NkKa290KkOkl
	QPGLE3zdytdd49JoJLgctppj93U31EnAodUDQZlRKLA/bY2mxlOhaZaTrup5I3zAb+M4Ys5aql44X
	as308XPBJtnL9tpJBhc0s1N4ez3VaQag4bnbsPjmp4CtwN0hQrkJfA3XwxUgZ7y7S91o57BwfqHoB
	XshZpC6rZojVxDAlMI91xbXZJEtuLL2IDcMKz2vLnHEJqEejl9JFvB4xyKnsOiap6L26dj9lF9b3O
	/8uLxpPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p52pC-00Fr9S-8D; Tue, 13 Dec 2022 10:47:50 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p52n2-00FoJf-Bc; Tue, 13 Dec 2022 10:45:37 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 6BCFC6602AB2;
	Tue, 13 Dec 2022 10:45:34 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1670928335;
	bh=w1yA+xs8yCYHN5qeaHYkgBaLhwgeFIfgr7wKK0PyC9g=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=BBnxouu90Jw41QL+9sQ3fE7jPlrtNm0wtOLRX1u1SHrbK8ptogo5MnN6bK2ZDvokw
	 //dOdy3sb79D2TwptTYBpkcm403QVTXMxTAlz9+nMbqhV5ipBf5R7JPM2gyfFAVch1
	 Pkan9wOs3Pv/c8ssp38ZO1/iH8Lse9++MnyzVqtuT34i0tcDQeEs+Yw6vGbls3VpRj
	 BGfQHWMbZ8ahJ8e5Kf22dFJFCdgPw55eG+aLP3FBIU/UUgOgDZ43YPeCzDSBQa+bBi
	 GyhteaSB5XtFQCUCkmr5yokeDPJsaU778tetZXPKzdYG9gJUxsLM/DDyuLmh3zOJM+
	 ay4McLmBmQPRg==
Message-ID: <869cfa5a-2cfa-e5b7-b8f5-a79b9b364b25@collabora.com>
Date: Tue, 13 Dec 2022 11:45:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v3 05/12] ASoC: mediatek: mt8188: support etdm in platform
 driver
Content-Language: en-US
To: Trevor Wu <trevor.wu@mediatek.com>, broonie@kernel.org,
 lgirdwood@gmail.com, tiwai@suse.com, perex@perex.cz, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 p.zabel@pengutronix.de
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20221208033148.21866-1-trevor.wu@mediatek.com>
 <20221208033148.21866-6-trevor.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221208033148.21866-6-trevor.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221213_024536_577190_8C1C56DE 
X-CRM114-Status: GOOD (  23.91  )
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

Il 08/12/22 04:31, Trevor Wu ha scritto:
> Add mt8188 etdm dai driver support.
> 
> Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
> ---
> I don't add Reviewed-by tag because one new header file is included
> in the patch to resolve compiling issue found by kernel test robot.
> Additionally, I re-layout the code for better understanding of the
> follow-up patch.
> ---
>   sound/soc/mediatek/mt8188/mt8188-dai-etdm.c | 2591 +++++++++++++++++++
>   1 file changed, 2591 insertions(+)
>   create mode 100644 sound/soc/mediatek/mt8188/mt8188-dai-etdm.c
> 
> diff --git a/sound/soc/mediatek/mt8188/mt8188-dai-etdm.c b/sound/soc/mediatek/mt8188/mt8188-dai-etdm.c
> new file mode 100644
> index 000000000000..c653fa5e3f85
> --- /dev/null
> +++ b/sound/soc/mediatek/mt8188/mt8188-dai-etdm.c

..snip..

> +
> +static void mt8188_dai_etdm_parse_of(struct mtk_base_afe *afe)
> +{
> +	const struct device_node *of_node = afe->dev->of_node;
> +	struct mt8188_afe_private *afe_priv = afe->platform_priv;
> +	struct mtk_dai_etdm_priv *etdm_data;
> +	int i, j;
> +	char prop[48];
> +	u8 disable_chn[MT8188_ETDM_MAX_CHANNELS];
> +	int max_chn = MT8188_ETDM_MAX_CHANNELS;
> +	u32 sel;
> +	int ret;
> +	int dai_id;
> +	unsigned int sync_id;
> +	struct {
> +		const char *name;
> +		const unsigned int sync_id;
> +	} of_afe_etdms[MT8188_AFE_IO_ETDM_NUM] = {
> +		{"etdm-in1", ETDM_SYNC_FROM_IN1},
> +		{"etdm-in2", ETDM_SYNC_FROM_IN2},
> +		{"etdm-out1", ETDM_SYNC_FROM_OUT1},
> +		{"etdm-out2", ETDM_SYNC_FROM_OUT2},
> +		{"etdm-out3", ETDM_SYNC_FROM_OUT3},
> +	};
> +
> +	for (i = 0; i < MT8188_AFE_IO_ETDM_NUM; i++) {
> +		dai_id = ETDM_TO_DAI_ID(i);
> +		etdm_data = afe_priv->dai_priv[dai_id];
> +
> +		ret = snprintf(prop, sizeof(prop),
> +			       "mediatek,%s-mclk-always-on-rate",
> +			       of_afe_etdms[i].name);
> +		if (ret < 0) {
> +			dev_info(afe->dev, "%s snprintf err=%d\n",

Is this property optional? If yes, this dev_info() must be a dev_dbg(),
otherwise, this must be a dev_err().

Please fix all prints to use the right message level.

> +				 __func__, ret);
> +			return;

Also, is it possible to specify this property only on selected eTDMs?

As it is right now, if anyone wants to specify this only on, for example,
etdm-out1 and out2, that won't work.
In that case, you should replace that return with a `continue`.

P.S.: I'm raising this question because you're not forcing "all or nothing"
       in commit [10/12] where you introduce the bindings for this driver,
       so I suppose that returning (hence stopping to parse) is a mistake.

> +		}
> +		ret = of_property_read_u32(of_node, prop, &sel);
> +		if (ret == 0) {
> +			etdm_data->mclk_dir = SND_SOC_CLOCK_OUT;
> +			if (mtk_dai_etdm_cal_mclk(afe, sel, dai_id))
> +				dev_info(afe->dev, "%s unsupported mclk %uHz\n",
> +					 __func__, sel);
> +		}
> +


Regards,
Angelo


