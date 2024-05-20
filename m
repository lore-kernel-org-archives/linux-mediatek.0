Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AC53C04FFE
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 May 2024 10:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LtAk1S/1QW8KtbGOaE7bGy75oL9LKovV4bOqIpT+o6A=; b=Ru/hRPiodiOl+r323soE7SmuT7
	Jw9I2rl9E7i6JsiwrGTMFlLd2VYB1IZU4neNxrLzBr88DXZ42XluF7CLHXzyh59jIvdsXAneKP2M1
	ExVXHXlXGgAaKKBw3fkyUxcpgkGUUA6YlNI4X4Vh2a9JbtzE+FzCrV/mdyOkTO3ZrrbPb7hv4M6NY
	JQsBCRMX5adYsBD+f6bir5oN67ui+3xj4RbBaf8+zUaYO5cdhFiek1cl3FO4ed4BLTVLdvksNgOWp
	nN/xq+FujyQDzd6ZQdkAMoHg2JIlO3j+K5BB5RCrnHUjm+Tab0QQ5XTamWlUHymlb/5/WkbsbljEP
	B3GBI5nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s90He-0000000E9Tc-2u68;
	Mon, 20 May 2024 10:30:22 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s90HZ-0000000E9R4-1byO;
	Mon, 20 May 2024 10:30:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1716201016;
	bh=4aFYaGvqOiJ+8i1j+s6ErI95fgrhOe7P9QJgg8TqH9A=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=MSaBSEkVvttyh3zC6ZrNwFY+aBzRc9cFbbcgiHlUiepPokaejOwLmNuGgEqycHlqx
	 AEoQBlbur8mu86CMP526zqViSmJNtihuvl6Gda6Oh7Q22+sa9wjF+WM/3eey6DKvBG
	 SJAJ/4AqSqPAzoajY1o8Tv10n7oCmny+XX0tygTD/U7Z+zfnRjHVZJf2ris6EKKSUE
	 9azsQpRI1ojbzbwCwPA6MVOtM9NmktAS7zgL8CdDFztavEOnJZo8PKnvgATlGxcNfD
	 fWdDPxb0FgDZtOyP8HztJe0ADF4Ruo0VWKGXVOxwQ5XMztZoPS9PXNwRHPCFeQbwPU
	 +hbDuok8X+gGw==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 5FF4F3782191;
	Mon, 20 May 2024 10:30:14 +0000 (UTC)
Message-ID: <e53833a2-42a9-409c-9f98-306e0a0292a1@collabora.com>
Date: Mon, 20 May 2024 12:30:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 10/16] ASoc: mediatek: mt8365: Add a specific soundcard
 for EVK
To: amergnat@baylibre.com, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Lee Jones <lee@kernel.org>,
 Flora Fu <flora.fu@mediatek.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Nicolas Belin <nbelin@baylibre.com>
References: <20240226-audio-i350-v4-0-082b22186d4c@baylibre.com>
 <20240226-audio-i350-v4-10-082b22186d4c@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240226-audio-i350-v4-10-082b22186d4c@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240520_033017_904491_C2B51840 
X-CRM114-Status: GOOD (  16.50  )
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

Il 26/04/24 19:22, amergnat@baylibre.com ha scritto:
> From: Nicolas Belin <nbelin@baylibre.com>
> 
> Add a specific soundcard for mt8365-evk. It supports audio jack
> in/out, dmics, the amic and lineout.
> 
> Signed-off-by: Nicolas Belin <nbelin@baylibre.com>
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>   sound/soc/mediatek/mt8365/mt8365-mt6357.c | 348 ++++++++++++++++++++++++++++++
>   1 file changed, 348 insertions(+)
> 
> diff --git a/sound/soc/mediatek/mt8365/mt8365-mt6357.c b/sound/soc/mediatek/mt8365/mt8365-mt6357.c
> new file mode 100644
> index 000000000000..a65f668103da
> --- /dev/null
> +++ b/sound/soc/mediatek/mt8365/mt8365-mt6357.c
> @@ -0,0 +1,348 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Mediatek MT8365 Sound Card driver
> + *
> + * Copyright (c) 2024 MediaTek Inc.
> + * Authors: Nicolas Belin <nbelin@baylibre.com>
> + */
> +
> +#include <linux/module.h>
> +#include <linux/of_gpio.h>
> +#include <sound/soc.h>
> +#include <sound/pcm_params.h>
> +#include "mt8365-afe-common.h"
> +#include <linux/pinctrl/consumer.h>
> +#include "../common/mtk-soc-card.h"
> +#include "../common/mtk-soundcard-driver.h"
> +

..snip..

> +
> +static const struct mtk_soundcard_pdata mt8365_mt6357_card = {
> +	.card_name = "mt8365-mt6357",
> +	.card_data = &(struct mtk_platform_card_data) {
> +		.card = &mt8365_mt6357_soc_card,
> +	},
> +	.soc_probe = mt8365_mt6357_dev_probe
> +};
> +
> +static const struct of_device_id mt8365_mt6357_dt_match[] = {
> +	{
> +		.compatible = "mediatek,mt8365-mt6357",
> +		.data = &mt8365_mt6357_card,
> +	},
> +	{ }

Please, compress and add sentinel

{ .compatible = "mediatek,mt8365-mt6357", .data = &mt8365_mt6357_card },
{ /* sentinel */ }

after which

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



