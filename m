Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 903FEC43334
	for <linux-mediatek@archiver.kernel.org>; Sun, 26 Jun 2022 08:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9wvC+OH7U+HX4ezxcVDdejjd5tKC3JDQMIGtr9Z0T+g=; b=XX9ztWY8c38soFOM3r+LWBbpbj
	DY+RjeZT+IElzK38EZPuixnB8428lPbv3gtpGU3mfU+8M2L2qehfF4Mm+yBiJijDN8ENPXv7s94Pd
	cPDD5CTzX1oK4pq4MACO/1XJHbV3Hs5Vucn66ZpWyl5LP5eqkTO+nEbRHkmHQvF/UhIajN/fNS6IM
	3/XL0JWZ6YuHYOXt9OrCuL5rkIocgQKwiSBjs99TmVT/1e4CPoMnb57Dz2IPKH8NPYXmp4ueL2jdr
	aTVIxv80HINYWZrLioSiKB+uiOgMkd0sXkc8Nru7iubBDgnCTN/1QsjlVKL1MfST24airMbyarN9I
	iRPD9AuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5Nhw-00AdhA-2R; Sun, 26 Jun 2022 08:33:28 +0000
Received: from smtp09.smtpout.orange.fr ([80.12.242.131] helo=smtp.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5Nhs-00Adcq-8c
	for linux-mediatek@lists.infradead.org; Sun, 26 Jun 2022 08:33:26 +0000
Received: from [192.168.1.18] ([90.11.190.129])
	by smtp.orange.fr with ESMTPA
	id 5NhgocNcnOXCy5NhhoLboN; Sun, 26 Jun 2022 10:33:15 +0200
X-ME-Helo: [192.168.1.18]
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Sun, 26 Jun 2022 10:33:15 +0200
X-ME-IP: 90.11.190.129
Message-ID: <c8b888fc-dff9-c278-da10-6883c4277289@wanadoo.fr>
Date: Sun, 26 Jun 2022 10:33:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v8 2/8] ASoC: mediatek: mt8186: add platform driver
Content-Language: en-US
To: jiaxin.yu@mediatek.com
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com, aaronyu@google.com,
 alsa-devel@alsa-project.org, angelogioacchino.delregno@collabora.com,
 broonie@kernel.org, devicetree@vger.kernel.org, julianbraha@gmail.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 robh+dt@kernel.org, trevor.wu@mediatek.com, tzungbi@google.com
References: <20220625190852.29130-1-jiaxin.yu@mediatek.com>
 <20220625190852.29130-3-jiaxin.yu@mediatek.com>
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20220625190852.29130-3-jiaxin.yu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220626_013324_489360_91954E7D 
X-CRM114-Status: GOOD (  19.22  )
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

Le 25/06/2022 à 21:08, Jiaxin Yu a écrit :
> Add mt8186 platform and affiliated driver.
> 
> Signed-off-by: Jiaxin Yu <jiaxin.yu-NuS5LvNUpcJWk0Htik3J/w@public.gmane.org>
> ---
>   sound/soc/mediatek/Kconfig                    |   12 +
>   sound/soc/mediatek/Makefile                   |    1 +
>   sound/soc/mediatek/mt8186/Makefile            |   19 +
>   sound/soc/mediatek/mt8186/mt8186-afe-common.h |  235 ++
>   .../soc/mediatek/mt8186/mt8186-afe-control.c  |  255 ++
>   sound/soc/mediatek/mt8186/mt8186-afe-pcm.c    | 3011 +++++++++++++++++
>   6 files changed, 3533 insertions(+)
>   create mode 100644 sound/soc/mediatek/mt8186/Makefile
>   create mode 100644 sound/soc/mediatek/mt8186/mt8186-afe-common.h
>   create mode 100644 sound/soc/mediatek/mt8186/mt8186-afe-control.c
>   create mode 100644 sound/soc/mediatek/mt8186/mt8186-afe-pcm.c

[...]

> +	MT8186_DAI_HOSTLESS_SRC_AAUDIO,
> +	MT8186_DAI_HOSTLESS_SRC_1,	/* just an exmpale */

example?

> +	MT8186_DAI_HOSTLESS_SRC_BARGEIN,
> +	MT8186_DAI_HOSTLESS_UL1,

[...]

> +#define MTK_SPK_I2S_0_STR "MTK_SPK_I2S_0"
> +#define MTK_SPK_I2S_1_STR "MTK_SPK_I2S_1"
> +#define MTK_SPK_I2S_2_STR "MTK_SPK_I2S_2"
> +#define MTK_SPK_I2S_3_STR "MTK_SPK_I2S_3"

Out of curiosity, why no 4?
Or, if related to mtk_spk_i2s_type below, why  6, 7, 8 and 9?

> +#define MTK_SPK_I2S_5_STR "MTK_SPK_I2S_5"
> +#define MTK_SPK_I2S_6_STR "MTK_SPK_I2S_6"
> +#define MTK_SPK_I2S_7_STR "MTK_SPK_I2S_7"
> +#define MTK_SPK_I2S_8_STR "MTK_SPK_I2S_8"
> +#define MTK_SPK_I2S_9_STR "MTK_SPK_I2S_9"
> +

[...]

> +
> +enum mtk_spk_i2s_type {
> +	MTK_SPK_I2S_TYPE_INVALID = -1,
> +	MTK_SPK_I2S_0,
> +	MTK_SPK_I2S_1,
> +	MTK_SPK_I2S_2,
> +	MTK_SPK_I2S_3,
> +	MTK_SPK_I2S_5,
> +	MTK_SPK_I2S_TYPE_NUM
> +};

[...]

> +static int mt8186_afe_pcm_dev_probe(struct platform_device *pdev)
> +{
> +	struct mtk_base_afe *afe;
> +	struct mt8186_afe_private *afe_priv;
> +	struct resource *res;
> +	struct reset_control *rstc;
> +	struct device *dev = &pdev->dev;
> +	int i, ret, irq_id;
> +
> +	ret = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(34));
> +	if (ret)
> +		return ret;
> +
> +	afe = devm_kzalloc(dev, sizeof(*afe), GFP_KERNEL);
> +	if (!afe)
> +		return -ENOMEM;
> +	platform_set_drvdata(pdev, afe);
> +
> +	afe->platform_priv = devm_kzalloc(dev, sizeof(*afe_priv), GFP_KERNEL);
> +	if (!afe->platform_priv)
> +		return -ENOMEM;
> +
> +	afe_priv = afe->platform_priv;
> +	afe->dev = &pdev->dev;
> +
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	afe->base_addr = devm_ioremap_resource(&pdev->dev, res);
> +	if (IS_ERR(afe->base_addr))
> +		return PTR_ERR(afe->base_addr);
> +
> +	/* init audio related clock */
> +	ret = mt8186_init_clock(afe);
> +	if (ret) {
> +		dev_err(dev, "init clock error, ret %d\n", ret);
> +		return ret;
> +	}

There is a mt8186_deinit_clock() call in the remove function.
Should this also be called in the error handling path below?
Or should a devm_add_action_or_reset() be used to ease error handling?

> +
> +	/* init memif */
> +	afe->memif_32bit_supported = 0;
> +	afe->memif_size = MT8186_MEMIF_NUM;
> +	afe->memif = devm_kcalloc(dev, afe->memif_size, sizeof(*afe->memif),
> +				  GFP_KERNEL);
> +

Nit: no need for an empty line here.

> +	if (!afe->memif)
> +		return -ENOMEM;
> +

[...]

> +
> +	return 0;
> +
> +err_pm_disable:
> +	pm_runtime_put_noidle(dev);
> +	pm_runtime_set_suspended(dev);
> +
> +	return ret;
> +}
> +
> +static int mt8186_afe_pcm_dev_remove(struct platform_device *pdev)
> +{
> +	struct mtk_base_afe *afe = platform_get_drvdata(pdev);
> +
> +	if (!pm_runtime_status_suspended(&pdev->dev))
> +		mt8186_afe_runtime_suspend(&pdev->dev);

Out of curiosity, is it normal to have some pm_runtime related code here 
that does not look the same as the one in the error handling of the probe?
(I don't know much about pm, but usually, .remove() functions and error 
handling in the probe look quite close)

> +
> +	mt8186_deinit_clock(afe);
> +
> +	return 0;
> +}
> +

[...]

