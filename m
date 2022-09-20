Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5F6DC54EE9
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Sep 2022 10:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NEofSzy3wClfu+J+EGfVKlyaoec7bMBb4Wy1LHIT2VM=; b=BrhlKDmOTQpCTZxVqcsu9Lgj/5
	H0rDxdBibvtgs62hIeWfSddvk4HODdf3B6/9Z3EgeuGmPvXSjAR62T2dc2OUkZW4AxHdVcAiwZ/ic
	vEg/9VL4PKPtCi68epKcngYMXxwKS3cvb18amq1DLwoRYRG1aULoJhGgXXPfhowgCm4HAWDisqr9F
	sH9Ooq8W7bncuFjN+KmbpFJoM+94gdZbrnsFA8iDXyDpL/keoDHrzoKM7rtl6LkmnPDS+KraAIyH1
	phsGmn2sXByKSOK4fi21yOkLjJmNSdgm3Ra035sfxR4LriZpK3ds4+JHbQ4QrWpm1tdp6w7A2pdF5
	sPR1RFFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaaLR-002tQh-Rp; Tue, 20 Sep 2022 10:19:13 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaaL6-002tLU-A2; Tue, 20 Sep 2022 10:18:53 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 1FA956600368;
	Tue, 20 Sep 2022 11:18:47 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1663669128;
	bh=B7xp7LNcnfbdR5oIkfuWVwdzNL7IbuXIGjam7V0vK40=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=SaWh1AMtnitMfo9coVDZcsdbltKYBYXw1LJst710ha2g5XKkVzVvVVl3mkwpxxGgm
	 FthnwnKgggKvZyl2L4nVuOYLOoub08A7CWFtDfYuO0n39YHGmR+N89bIZ9WBXTkFfh
	 /z+1CbJhG5nCl6CQS318lSxAGSRxzRwG8pTE8k5bw0LHZhqk3cFrB59Skd3+l7bnlS
	 Nmg6BNozuvtjwsD94fpJMY90oSG3pr5dVxXqS3/fzpUoNpBsct05N4mWFKrVqR51ab
	 xaS5ot7qE+WxpH0LABFAaBp0eYFgvd3dJUPoITu1R6pvxN3hLVfvgDL+LXTZwwaZ4K
	 ewVvTrcPWH7vw==
Message-ID: <32c4822a-a094-5fa3-c2af-e515bf897937@collabora.com>
Date: Tue, 20 Sep 2022 12:18:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v1 05/17] drm/mediatek: hdmi: use a syscon/regmap instead
 of iomem
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
 <20220919-v1-5-4844816c9808@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220919-v1-5-4844816c9808@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220920_031852_595100_30416958 
X-CRM114-Status: GOOD (  13.18  )
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
> To prepare support for newer chips that need to share their address
> range with a dedicated ddc driver, move to a syscon.
> 
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
> index 3196189429bc..5cd05d4fe1a9 100644
> --- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c

..snip..

> @@ -1428,7 +1413,6 @@ static int mtk_hdmi_dt_parse_pdata(struct mtk_hdmi *hdmi,
>   	struct device_node *cec_np, *remote, *i2c_np;
>   	struct platform_device *cec_pdev;
>   	struct regmap *regmap;
> -	struct resource *mem;
>   	int ret;
>   
>   	ret = mtk_hdmi_get_all_clk(hdmi, np);
> @@ -1474,8 +1458,7 @@ static int mtk_hdmi_dt_parse_pdata(struct mtk_hdmi *hdmi,
>   	}
>   	hdmi->sys_regmap = regmap;
>   
> -	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	hdmi->regs = devm_ioremap_resource(dev, mem);
> +	hdmi->regs = syscon_node_to_regmap(dev->of_node);

Nack. You're breaking ABI, this will force everyone to add syscon to devicetree,
hence this breaks retrocompatibility with old devicetrees.

Hint: not here, device_node_to_regmap()

Regards,
Angelo

>   	if (IS_ERR(hdmi->regs)) {
>   		ret = PTR_ERR(hdmi->regs);
>   		goto put_device;



