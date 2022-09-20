Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E76BECAAD8
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Sep 2022 10:26:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EOMMBnLfeqXKhki2EOS0Ix3jjcDZzKQgSeHs+g2tDRI=; b=VJ+KZpnAZVmnQ90Eq/uj7YbtJE
	M4kywkd1WwF7qcczmTb0W8Q2Pr0Zu0SkRJdSaDaOjWEEfF1JkHKDI6bJjiTdEd+8fwufT3B1+XXtf
	WTd0Yqmtdalv5FxndiSkzCZHQCgua8LMB7Gmx6wBvXEVC4vLhziesxUSlMmLGm4XYNuH7VtH9PIHA
	s+IoUs3BnJlmHxXZhKFB7/7ek9ucgu/DM8HPlIa8KtWzavuC65eatTVDFcNR97werMceZytUFhRFA
	SxZ3M7pF7AL0eVx8N4r1JukY/6yZLKzJ9K9TffrcXOYRu2ae199SUhIC4FOyANDR5z89zDdB2l5Ny
	AghDxvUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaaSE-002vz8-NG; Tue, 20 Sep 2022 10:26:14 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaaRq-002vs3-Hv; Tue, 20 Sep 2022 10:25:53 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id F07716600368;
	Tue, 20 Sep 2022 11:25:47 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1663669549;
	bh=pJFt8yhuO+61RNQoKu/PstmWS0PBWMsonGq/dnFhPCY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=R2oc5TOvtqehwVdIVv4+ZI4lKyrDIUceJdbxMi/4V4X4XDvk3e3SdGay/LYNOYzrC
	 DXxdJO5MyIrCLEkMrhjlY1u96S1/affuMfe8RaXDP7nFTXFnZ4MWC3M1xOzBDeK5m8
	 lEuvNw5Aggj73VIO/CLscBO+EUrcp+7eCblSGS1sIssmA6ELNjdJebtJWOjsFVDR/j
	 uyJbu45SEV9y71RXViboId+7Z/hCjzmzlJV1enTIUR5hQfvCVBwLXemvji4sqsnqRl
	 11BEWGHHH9GsllzQ/+5YTNdKLeZ4jQHIN3tTk5EKUrTsggQa9wzRKM5YpE1h9seXu4
	 qpub0SjqOUUWg==
Message-ID: <153dcb4f-4583-427e-83c7-bdd33e3b11aa@collabora.com>
Date: Tue, 20 Sep 2022 12:25:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v1 07/17] drm/mediatek: extract common functions from the
 mtk hdmi driver
Content-Language: en-US
To: Guillaume Ranquet <granquet@baylibre.com>, Vinod Koul <vkoul@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@linux.ie>,
 Rob Herring <robh+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Daniel Vetter <daniel@ffwll.ch>, Chunfeng Yun <chunfeng.yun@mediatek.com>,
 CK Hu <ck.hu@mediatek.com>, Jitao shi <jitao.shi@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Pablo Sun <pablo.sun@mediatek.com>, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, Mattijs Korpershoek
 <mkorpershoek@baylibre.com>, linux-arm-kernel@lists.infradead.org,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org
References: <20220919-v1-0-4844816c9808@baylibre.com>
 <20220919-v1-7-4844816c9808@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220919-v1-7-4844816c9808@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220920_032551_846929_29FD0596 
X-CRM114-Status: GOOD (  13.84  )
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

Il 19/09/22 18:56, Guillaume Ranquet ha scritto:
> Create a common "framework" that can be used to add support for
> different hdmi IPs within the mediatek range of products.
> 
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> 
> diff --git a/drivers/gpu/drm/mediatek/Makefile b/drivers/gpu/drm/mediatek/Makefile
> index d4d193f60271..008ec69da67b 100644
> --- a/drivers/gpu/drm/mediatek/Makefile
> +++ b/drivers/gpu/drm/mediatek/Makefile
> @@ -22,7 +22,8 @@ obj-$(CONFIG_DRM_MEDIATEK) += mediatek-drm.o
>   
>   mediatek-drm-hdmi-objs := mtk_cec.o \
>   			  mtk_hdmi.o \

abcd ... mtk_hdmi_common.o goes here :-)

> -			  mtk_hdmi_ddc.o
> +			  mtk_hdmi_ddc.o \
> +			  mtk_hdmi_common.o \
>   
>   obj-$(CONFIG_DRM_MEDIATEK_HDMI) += mediatek-drm-hdmi.o
>   
> diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
> index 5cd05d4fe1a9..837d36ec4d64 100644
> --- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
> @@ -32,187 +32,18 @@
>   #include <drm/drm_probe_helper.h>
>   
>   #include "mtk_cec.h"
> -#include "mtk_hdmi.h"
>   #include "mtk_hdmi_regs.h"
> +#include "mtk_hdmi_common.h"
>   
>   #define NCTS_BYTES	7
>   
> -enum mtk_hdmi_clk_id {
> -	MTK_HDMI_CLK_HDMI_PIXEL,
> -	MTK_HDMI_CLK_HDMI_PLL,
> -	MTK_HDMI_CLK_AUD_BCLK,
> -	MTK_HDMI_CLK_AUD_SPDIF,
> -	MTK_HDMI_CLK_COUNT
> +const char * const mtk_hdmi_clk_names_mt8183[MTK_MT8183_HDMI_CLK_COUNT] = {

Why MT8183? This can be either MT8167 or MT2701... or, IMO more appropriately, you
should name the IP version.
Example: MTK_HDMIV123_CLK_COUNT (I don't know what IP version would that be!).

> +	[MTK_MT8183_HDMI_CLK_HDMI_PIXEL] = "pixel",
> +	[MTK_MT8183_HDMI_CLK_HDMI_PLL] = "pll",
> +	[MTK_MT8183_HDMI_CLK_AUD_BCLK] = "bclk",
> +	[MTK_MT8183_HDMI_CLK_AUD_SPDIF] = "spdif",
>   };
>   

Regards,
Angelo



