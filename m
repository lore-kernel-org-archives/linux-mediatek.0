Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56A09C54EE9
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Sep 2022 12:22:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UWgai7WSvfmxJhMIJAKs348dD9WAfb+4mIy0yD08bLo=; b=zIj+tmoBLOgTvb9DmCPV3YScdH
	peLmLaNmGIN+Pf2vurC327s6JA3AMA2HjIoOhrXGTXBiUY/Hn6IEoinQchab2xIepUZIdK9bqnKJj
	BXv0VUzhIzh/UII3gtjKsXGoWUueNZigAUjed3qfYN3WahljgUj4dmouYHTf9lT7wh0mmiL8EKzLt
	8pqZlKapWuy2Y2LXfTtdJVgpu6zAnO85O1O+LX4xfTGuRmYv2sX7b9JNiY5//856/uXGw1y4wKUzM
	iGBsCF/0EB8H6LjTknMNA1LkIwGPDX2+S1j9JFSBSiYelgnbjsmSy5rvP3ajYv72RPjGjwSeJOGLD
	6CWXTmUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oacGn-003erx-Hq; Tue, 20 Sep 2022 12:22:33 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oacGb-003elr-Th; Tue, 20 Sep 2022 12:22:23 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 16E066601F6E;
	Tue, 20 Sep 2022 13:22:19 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1663676540;
	bh=d5C1UKHSt0P8rgevUzVZlIrzp+iptSFeKnmBaNqfAx8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=mF9gZIO1aOqTgoLykkQMAflYNNiPZ8Oi5tMxaUkgST6FrWwxKo0ySbVOkiqVJgwDf
	 xxDg3pYhlMSk1qFHx8IKPXyLyLnZ+qSl/lQWWn/xlNa+WqGINMfEyTBURD3ElpMbPw
	 YyaJth9oSYylURi12Sy9farhIOhhAoiP7dtbNBbhUDRJUYsVAsm3y/YbtOJLnppu6z
	 v5IAbVSxy8GY3Mbl+d9K8AO1QP/tlIosQZSU0O2iJ47USgJqW0+YNST8sU/wXu54D4
	 Otwcaxki2aVvSJaH2DVEowJaxn5Mw16sia808+hpc7ZBYIOdnbZ5F1zcBhmNPual0P
	 uaDsHHZ0mDk5g==
Message-ID: <812a5de2-dbe3-2f0d-492c-16ea004c996a@collabora.com>
Date: Tue, 20 Sep 2022 14:22:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v1 16/17] drm/mediatek: dpi: Add mt8195 hdmi to DPI driver
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
 <20220919-v1-16-4844816c9808@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220919-v1-16-4844816c9808@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220920_052222_115379_E6C3E772 
X-CRM114-Status: GOOD (  12.87  )
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
> Add the DPI1 hdmi path support in mtk dpi driver
> 
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
> index 630a4e301ef6..91212b7610e8 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> @@ -15,7 +15,10 @@
>   #include <linux/of_graph.h>
>   #include <linux/pinctrl/consumer.h>
>   #include <linux/platform_device.h>
> +#include <linux/reset.h>
>   #include <linux/types.h>
> +#include <linux/regmap.h>
> +#include <linux/mfd/syscon.h>
>   
>   #include <video/videomode.h>
>   
> @@ -66,10 +69,14 @@ struct mtk_dpi {
>   	struct drm_bridge *next_bridge;
>   	struct drm_connector *connector;
>   	void __iomem *regs;
> +	struct reset_control *reset_ctl;
>   	struct device *dev;
>   	struct clk *engine_clk;
> +	struct clk *dpi_ck_cg;
>   	struct clk *pixel_clk;
> +	struct clk *dpi_sel_clk;
>   	struct clk *tvd_clk;
> +	struct clk *hdmi_cg;


You're adding new clocks and then you're making *all clocks*, including the
already existing ones... optional.

That looks seriously odd.... can you please give a devicetree example for
MT8195 in the next version, perhaps in the cover letter?

Would also make it easier to test this entire big series.

Regards,
Angelo


