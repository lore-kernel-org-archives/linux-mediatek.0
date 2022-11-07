Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75D24C4332F
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Nov 2022 11:20:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kh9C2Om70TAiYR4g/uLgbpdUxfz7VUBIyzW/2AM+dHM=; b=GwgwmaykfXD6Im3J13WGkgscGo
	98VNbU5PjRq07DfMhhYC41WCRK6vd/S1A7tGg/aLCc1BTHG1zPAYjGEYC8q8EkD9+EcliSN0c5vU7
	VobeNLqzJRmn7e/waHhkjESjlHmGOT/GRjIkLHatzSjWZ5V8v6FhN0XAdLGfE2N1gND4jSnJ6vWCH
	1NuSEF1urdS5qeBVmmLC0a1VjPdcsn3+ksDU54GYeHbneSyUUpM1EVM5TQmW3gUf15/WjSv5e0+gs
	svw3ZNeYUzMZ/H/O9LMhWuokkbYG/vQLtP6UnW6JNc5oz01c9FAIsvl6UJtyFlHh/vaXHVvqD5X80
	U1p109Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1os0B9-00E6qu-VK; Mon, 07 Nov 2022 11:20:35 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1os0Aw-00E6kb-4U; Mon, 07 Nov 2022 11:20:23 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 6863D660236A;
	Mon,  7 Nov 2022 11:20:19 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1667820020;
	bh=7z542Aj3CgGqKW5DeYxuUBU2RHuE8LKZ6Cy4e7BxEYA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Dl74wRMaSBKxFLE4SD7wiQV6g95KV0/pfW+wGLhCf8nqePUEfscyhBuTG1xcefTYr
	 jBFnBGZ05LssJGphJq2pOX1JYUMtpHbTQ0yJYPIYtbW3JMOjOwcSzCqAXulqkL2iEk
	 sjMBpX4EU9p7hwvpM4Fl1NZmIfs+g+/MkUUujWn42Hx73WL6JF2VxjD5+iOGqoZeka
	 UpZoIk0zv9Ru/BQHdVRf73NLxu+/uq2u3o9eeb2cqsXu/Dru14nRNsW5/MO3XRw7wM
	 0Kyc6rKQFZiEjvCMEB6rv/nlJrU4hUuHWuUHFiJ7BUSvenGKb9Eoa4QUJw+5P0XOtY
	 Ew95u+utNO9lw==
Message-ID: <988b0a7a-69bb-34e4-e777-1d9516221077@collabora.com>
Date: Mon, 7 Nov 2022 12:20:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v3 12/12] drm/mediatek: dpi: Add mt8195 hdmi to DPI driver
Content-Language: en-US
To: Guillaume Ranquet <granquet@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Jitao shi
 <jitao.shi@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Vinod Koul <vkoul@kernel.org>, CK Hu <ck.hu@mediatek.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Kishon Vijay Abraham I <kishon@ti.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-arm-kernel@lists.infradead.org, stuart.lee@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 mac.shen@mediatek.com, linux-phy@lists.infradead.org
References: <20220919-v3-0-a803f2660127@baylibre.com>
 <20220919-v3-12-a803f2660127@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220919-v3-12-a803f2660127@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221107_032022_342342_46776348 
X-CRM114-Status: GOOD (  17.04  )
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

Il 04/11/22 15:09, Guillaume Ranquet ha scritto:
> Add the DPI1 hdmi path support in mtk dpi driver
> 
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> ---
>   drivers/gpu/drm/mediatek/mtk_dpi.c      | 143 ++++++++++++++++++++++++++++++--
>   drivers/gpu/drm/mediatek/mtk_dpi_regs.h |   5 ++
>   2 files changed, 141 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
> index 508a6d994e83..8052b47042b8 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> @@ -14,7 +14,10 @@
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
> @@ -65,10 +68,14 @@ struct mtk_dpi {
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

I admit that I didn't really check these clocks, but judging by the names,
it is highly possible that one (or more) of them are supposed to be parents
of some others.

The first suspicious ones are dpi_ck_cg and dpi_sel_clk: please check.

I'm also not sure about the hdmi_cg, shouldn't the DPI have a HDMI port in
the graph that you'd declare in devicetree?

Besides... you're doing a lot of work to check if (is_internal_hdmi) for
power up/down paths, but seeing that you're introducing this change after
adding the HDMI driver makes me mostly sure that the internal hdmi that we're
talking about here is the one that is managed by the HDMIV2 driver... and
this means that you should really, really, really rely on connecting inputs
and outputs the right way in the devicetree, as that will most probably make
you able to write practically 0 code to manage power for the DPI... and may
also remove the need of adding the hdmi_cg clock here...

Regards,
Angelo



