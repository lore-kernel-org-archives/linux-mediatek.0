Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49BAEC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Mar 2022 15:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pJXPMhVKRDo2MBEavIoVqwpQgN5Z7vRksJ8NEArcb1U=; b=ujjM7SLROdyvN5
	qi0KDU8gztTE0bTQAYBhFFdikqQcHQFCgzafV7HFdDipXikxn8DJl5DWI7Nkua9wihETlpf/a+xHA
	+SeSMwsu+XYqehT5kvJmutffvZT7ysf4Ktxbd5qByNgOeL3bA24ofRppJPDeRad9YqGPQnRlDHof5
	7xXIIeeowtgbwgyKaNrQHYsEQArvFUuEYZWKJgzwx13XhFVMwXXHzhnz0ghKiQWyoFmJi4ArRwtKQ
	SVLuAS2NKw8AB7RiCHwPbvaP/3v/r/SC7nUTHmHNbPJpf38iaGymw8WgBt4PEHgzhs1fg+a4lwFVY
	zURMR4xIUnGW+UbGCghA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nSKfJ-00DKyH-87; Thu, 10 Mar 2022 15:25:21 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nSKf6-00DKw5-QN; Thu, 10 Mar 2022 15:25:10 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 6B0911F45A2A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1646925907;
 bh=G44TKaXJ2702MH14xQ2xJ5CzDZDhej3DrvU8W8AmQpM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=SXhuKhFEp8Pn5kLpJ9uE75VypUMiWbTDJVSbQOK8PeLRuwMErkdO4jbich+dzPauC
 qCJWCscyap4JMwtArGtY5HzKtdvHxmWP7UbBPZXUPeHdFbn2BmwfQ33I7MwQG8brbd
 fYowneCd2ko50BtGZSUUzuRyJ/wegpIExSkuV6lgm16tPDRBenjMZEc9g8r/MZCpiT
 JZBtRYcs3DiM/nITjUjJB6X2evoUXrnf21ef/sN5ap4/j6gW50i8UJIkGflgdbeBHL
 docIDtmUfdlSE6vs5URQcIca6NSmP9Jcr8vaydjsb9YA3GvDJgCzFyl9ueHgXddWqI
 r4s8PlBH5D3EQ==
Message-ID: <ead686bc-06ae-c572-999a-af22c183550f@collabora.com>
Date: Thu, 10 Mar 2022 16:25:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH 1/5] ASoC: mediatek: mt8195: add reset controller
Content-Language: en-US
To: Trevor Wu <trevor.wu@mediatek.com>, broonie@kernel.org, tiwai@suse.com,
 robh+dt@kernel.org, matthias.bgg@gmail.com
Cc: alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, aaronyu@google.com, yc.hung@mediatek.com
References: <20220308072435.22460-1-trevor.wu@mediatek.com>
 <20220308072435.22460-2-trevor.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220308072435.22460-2-trevor.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220310_072509_027390_76464FD1 
X-CRM114-Status: GOOD (  17.58  )
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

Il 08/03/22 08:24, Trevor Wu ha scritto:
> Audio hardware is possibly used in the firmware stage, so resetting audio
> hardware before regcache records default register values is required.
> 
> Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   sound/soc/mediatek/mt8195/mt8195-afe-pcm.c | 16 ++++++++++++++++
>   1 file changed, 16 insertions(+)
> 
> diff --git a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
> index 550636500949..72b2c6d629b9 100644
> --- a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
> +++ b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
> @@ -16,6 +16,7 @@
>   #include <linux/of_platform.h>
>   #include <linux/of_reserved_mem.h>
>   #include <linux/pm_runtime.h>
> +#include <linux/reset.h>
>   #include "mt8195-afe-common.h"
>   #include "mt8195-afe-clk.h"
>   #include "mt8195-reg.h"
> @@ -3056,6 +3057,7 @@ static int mt8195_afe_pcm_dev_probe(struct platform_device *pdev)
>   	struct mtk_base_afe *afe;
>   	struct mt8195_afe_private *afe_priv;
>   	struct device *dev = &pdev->dev;
> +	struct reset_control *rstc;
>   	int i, irq_id, ret;
>   	struct snd_soc_component *component;
>   
> @@ -3092,6 +3094,20 @@ static int mt8195_afe_pcm_dev_probe(struct platform_device *pdev)
>   		return ret;
>   	}
>   
> +	/* reset controller to reset audio regs before regmap cache */
> +	rstc = devm_reset_control_get_exclusive(dev, "audiosys");
> +	if (IS_ERR(rstc)) {
> +		ret = PTR_ERR(rstc);
> +		dev_err(dev, "could not get audiosys reset:%d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = reset_control_reset(rstc);
> +	if (ret) {
> +		dev_err(dev, "failed to trigger audio reset:%d\n", ret);
> +		return ret;
> +	}
> +
>   	spin_lock_init(&afe_priv->afe_ctrl_lock);
>   
>   	mutex_init(&afe->irq_alloc_lock);




_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
