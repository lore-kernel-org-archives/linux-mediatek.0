Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 013D4C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Jun 2022 10:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Iki2cZaWyX/eZeRgxB87zIiIiJ2o9bg2evIIlBr5fFk=; b=WdyT9qS/6Ay6s6
	QF/XyzAqiEg25NyqwkOk06xJUy7uINVQUuEkITg29I7apwixc/JvdGtkJkJaL7AvGFwqXm/NYxZy4
	TrOV4g2oI5sRtsVRk3JyFiNfEWhHz59oHehywGoPkZNi1pidgdm1Lv36ZEUbMbOFIvdLfKxJdSv2L
	FTX1rU1K1Jk2WV5mIARI5+nFjI3TqgS9yww7yy1U7tmpWSNbiWa2CVzi5ETnslcVFBgX+euvI5hE8
	v3ocAos8TT68/oKxtP9AQDlJz1i3QuCXUsW4S3h1wxfusoTTrf+m+Va7qqpt4JFk0kxQfoPrHRzWp
	NDhuRQ50l9tCRk3/8p9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzbYN-007TTD-W8; Fri, 10 Jun 2022 10:07:44 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzbSp-007QZR-4d; Fri, 10 Jun 2022 10:02:03 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 11AAB6601739;
	Fri, 10 Jun 2022 11:01:56 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1654855316;
	bh=dsiCCp9lnFOmS3obijt8p1edAXlox7FEodLqv3vHvrI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=AxXNVxBEp5VJxMcRieatCKA2EW2szeAAaQSKNFIYWXLs3xkgJSyCStafvGlTeoK1S
	 60qyl/A4H0X8WG/V5ll8BuJKlAKrOrYXAauH7k6N1KBvpshZpFS+dD0n3XxmUpZ2id
	 ErAn5N50Jy4ibtO88VjwuWC705RtWYIIXPIV4AJxhLYEVh3oNmEtD3jCiYDWpRDK24
	 Djq9U+fG2wldu+YVUSJg6Jny7q8gVZpwRNA8iug+QoiSF4RNXevM3tf0jaCo2D1cjX
	 krpFNdLFxNxVVmPM5JFKMdhCOifaXVpqTfHRhshMKU5bCDIYWbe7oYYXBF5LETJsiR
	 6gQtGSyGCc9tA==
Message-ID: <d7934e1e-6a57-2c9a-76f7-42f0da180699@collabora.com>
Date: Fri, 10 Jun 2022 12:01:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v7 3/8] ASoC: mediatek: mt8186: add mt8186-mt6366 common
 driver
Content-Language: en-US
To: Jiaxin Yu <jiaxin.yu@mediatek.com>, broonie@kernel.org, robh+dt@kernel.org
Cc: aaronyu@google.com, matthias.bgg@gmail.com, trevor.wu@mediatek.com,
 tzungbi@google.com, julianbraha@gmail.com, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220610082724.29256-1-jiaxin.yu@mediatek.com>
 <20220610082724.29256-4-jiaxin.yu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220610082724.29256-4-jiaxin.yu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220610_030159_491271_F211E18B 
X-CRM114-Status: GOOD (  19.19  )
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

Il 10/06/22 10:27, Jiaxin Yu ha scritto:
> Add mt8186-mt6366 common driver for mt8186 series machine.
> 
> Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
> ---
>   sound/soc/mediatek/mt8186/Makefile            |  1 +
>   .../mediatek/mt8186/mt8186-mt6366-common.c    | 59 +++++++++++++++++++
>   .../mediatek/mt8186/mt8186-mt6366-common.h    | 17 ++++++
>   3 files changed, 77 insertions(+)
>   create mode 100644 sound/soc/mediatek/mt8186/mt8186-mt6366-common.c
>   create mode 100644 sound/soc/mediatek/mt8186/mt8186-mt6366-common.h
> 

..snip..

> diff --git a/sound/soc/mediatek/mt8186/mt8186-mt6366-common.c b/sound/soc/mediatek/mt8186/mt8186-mt6366-common.c
> new file mode 100644
> index 000000000000..94e1128e8128
> --- /dev/null
> +++ b/sound/soc/mediatek/mt8186/mt8186-mt6366-common.c
> @@ -0,0 +1,59 @@
> +// SPDX-License-Identifier: GPL-2.0
> +//
> +// mt8186-mt6366-common.c
> +//	--  MT8186 MT6366 ALSA common driver
> +//
> +// Copyright (c) 2022 MediaTek Inc.
> +// Author: Jiaxin Yu <jiaxin.yu@mediatek.com>
> +//
> +#include <sound/soc.h>
> +
> +#include "../../codecs/mt6358.h"
> +#include "../common/mtk-afe-platform-driver.h"
> +#include "mt8186-afe-common.h"
> +#include "mt8186-mt6366-common.h"
> +
> +int mt8186_mt6366_init(struct snd_soc_pcm_runtime *rtd)
> +{
> +	struct snd_soc_component *cmpnt_afe =
> +		snd_soc_rtdcom_lookup(rtd, AFE_PCM_NAME);
> +	struct snd_soc_component *cmpnt_codec =
> +		asoc_rtd_to_codec(rtd, 0)->component;
> +	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt_afe);
> +	struct mt8186_afe_private *afe_priv = afe->platform_priv;
> +	struct snd_soc_dapm_context *dapm = &rtd->card->dapm;
> +	int ret;
> +
> +	/* set mtkaif protocol */
> +	mt6358_set_mtkaif_protocol(cmpnt_codec,
> +				   MT6358_MTKAIF_PROTOCOL_1);
> +	afe_priv->mtkaif_protocol = MT6358_MTKAIF_PROTOCOL_1;
> +
> +	ret = snd_soc_dapm_sync(dapm);
> +	if (ret) {
> +		dev_info(rtd->dev, "failed to snd_soc_dapm_sync\n");

This should be a dev_err().

> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(mt8186_mt6366_init);
> +
> +int mt8186_mt6366_card_set_be_link(struct snd_soc_card *card,
> +				   struct snd_soc_dai_link *link,
> +				   struct device_node *node,
> +				   char *link_name)
> +{
> +	int ret;
> +
> +	if (node && strcmp(link->name, link_name) == 0) {
> +		ret = snd_soc_of_get_dai_link_codecs(card->dev, node, link);
> +		if (ret < 0) {
> +			dev_err_probe(card->dev, ret, "get dai link codecs fail\n");
> +			return ret;

You may at this point just 'return dev_err_probe(...)'.


Regards,
Angelo

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
