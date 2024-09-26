Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42C69CCF9E9
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Sep 2024 09:51:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OtDrNzBVfph4kbo0tkgPVJTNDHU2rNCkHw/yRblU4M0=; b=zi7czJm+3pDfznwqSDfEYgvcAm
	2/g3jLqGQA2Ek8LF0JRHcT9VJp2Vv/JhmPFDFziOQGNsWXPVKZZPmj5DfflH+aBemO34gB+XO1cMn
	hK1UwJoMneO3oifIZEvYAqFkLhi5QxJyPX3ZQMYP13CFYhbkdUUD9YsKPu+zQ4RFKq0VfnlcjUMs5
	e8oTo5BFR8WZN7MBSaENfZvQDE5oUzHHu1oAos5agup2ei79jtZi6vCPvr6I5DJ5p3A7m3ZxXvZ6Q
	XvzTARvl5+/Jaeo+13nnkurVOAVxpau6yg3ZVnrC7PVshpGSAKLkS2LZseQayltfX36pLIemohFjl
	0nYiyc2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stl9h-00000007xcE-0FfN;
	Thu, 26 Sep 2024 09:51:25 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stkyY-00000007v1W-0ZIs;
	Thu, 26 Sep 2024 09:39:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1727343592;
	bh=TDiXybMeYtcjqjBx92AhyDoKNyIG5PotfOZAabaX1Gw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=c5d60WBkFGQ5Akzoc/3uBQvHv1XDYHqt+L6fd+vwLMzBBq7UyumanL8oemFcKR+hC
	 qA4ViIZHHhqPYszePwYdkE/dKfYbFRAeCC0RqRy9BwqnkkOp4p6Is+BcgshOjRZiqN
	 YXNU3dsDAidYj28SV846xUFQ7kXBNqjADZCJnbTzGCN0Cs2EVbr+7K8zokSI8jRksP
	 aciFZdCUEh5kzI/uFJ7QNvFkdTe9dNYXoSKY3tSIiIujXrfUOo95HZr74habGRxVZU
	 T59unfzI7Lv7SWJDWhigLdnkAh6ys+O5c0AMrOeYt+SZSdy5GqLxatfIBzHgjll7hw
	 E0t8U8Vo7zwvQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7A3F217E10AF;
	Thu, 26 Sep 2024 11:39:51 +0200 (CEST)
Message-ID: <9f637af5-9836-487a-88b6-1d1ac46e6976@collabora.com>
Date: Thu, 26 Sep 2024 11:39:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] drm: constify read-only regmap structs
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Stefan Agner <stefan@agner.ch>, Alison Wang <alison.wang@nxp.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Orson Zhai <orsonzhai@gmail.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
References: <20240925-drm-const-regmap-v1-0-e609d502401b@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240925-drm-const-regmap-v1-0-e609d502401b@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240926_023954_381097_2112EB8F 
X-CRM114-Status: UNSURE (   8.79  )
X-CRM114-Notice: Please train this message.
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

Il 25/09/24 17:42, Javier Carrasco ha scritto:
> This series adds the const modifier to the remaining regmap_bus and
> regmap_config structs under drm/ that are effectively used as const
> (i.e., only read after their declaration), but kept ad writtable data.
> 
> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>

For the entire series:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
> Javier Carrasco (6):
>        drm/bridge: dpc3433: Constify struct regmap_config
>        drm/fsl-dcu: Constify struct regmap_config
>        drm/mediatek: dp: Constify struct regmap_config
>        drm/meson: Constify struct regmap_config
>        drm/panel: ili9322: Constify struct regmap_bus
>        drm/sprd: Constify struct regmap_bus
> 
>   drivers/gpu/drm/bridge/ti-dlpc3433.c         | 2 +-
>   drivers/gpu/drm/fsl-dcu/fsl_tcon.c           | 2 +-
>   drivers/gpu/drm/mediatek/mtk_dp.c            | 2 +-
>   drivers/gpu/drm/meson/meson_drv.c            | 2 +-
>   drivers/gpu/drm/panel/panel-ilitek-ili9322.c | 2 +-
>   drivers/gpu/drm/sprd/sprd_dsi.c              | 2 +-
>   6 files changed, 6 insertions(+), 6 deletions(-)
> ---
> base-commit: 2b7275670032a98cba266bd1b8905f755b3e650f
> change-id: 20240925-drm-const-regmap-307f2c358d10
> 
> Best regards,



