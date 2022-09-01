Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C47E2C64991
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Sep 2022 10:58:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JAElCVECM3BW4Dh/WGNeYPLRwtunOlI3Ghfnh4z7gDk=; b=XpaNMDe9IJamJMPjIy1FdzqzXD
	0p7Oz0gw6MZcilYY1D2ojN22b/K/9TEkBeJexRW/SJ1jKY+eAfPzd0XYcMP0TEbwfoi6/IJCj4qHz
	H3woNnYkF/xV9+WLJt6DXS5u6Jsm/a0gWkLs/6QMWFMP1gaf0NeFt19x/4iAyOYVVXPh0DMDaCNY9
	ml4OrpJRknVPLFcCM0/fmi7TLYvGbmI1sGGK1RBuH6QXZsKcW83WovjPLpwlyLYFGoSoSDoeYE2s/
	K7yG4Iie7JdRvS3Tr9w48Du20vEKOOCdgkHOnZEufua0vtNGFtaBVggNXv3IGwKgNVJq4nv6b3XN6
	UMSPPYgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oThuH-00BBgV-78; Thu, 01 Sep 2022 10:58:45 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oThu6-00BBcs-PQ; Thu, 01 Sep 2022 10:58:36 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 7DBDD6601DF7;
	Thu,  1 Sep 2022 11:58:31 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1662029912;
	bh=J0a7JIYzSfLJ+NmiuKc1E8YXYw0cLkKnM9rQliRatI8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Vb4UzK09kZ2A61z7ufCdC23usamdiAglog33FnJ+oLYi3dkxmwmTiRvJlzII0IPS7
	 2LH5JHyAmZE9ywWFhlGNnG5wNUZlRcAS2lEEL5xI7xiQ1Fi8IHDoqHhoBAs9qX9Hx7
	 WmoGU9oPqgb1BR6+8fQQ1vKbqK44R317SHn3VUscV6y2NHCLmwpqQoCuuW0qShEHuB
	 HcwocUN3tEsi9OY15U5kTscZYh7jR/DJMH2GuprZLRnAnnDgnzgcYLMSQ6/kINQ/Ai
	 ucD97vXat0x9ga4eq5wv03AKtE0kj/oW6lSAFMy5pZc+nkZunGShzgl31OZW4rFdYn
	 WHKCxAjQW5dEg==
Message-ID: <3ceeb700-4424-6182-6d14-60c569f7c59d@collabora.com>
Date: Thu, 1 Sep 2022 12:58:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v17 00/10] Add MT8195 DisplayPort driver
Content-Language: en-US
To: Bo-Chen Chen <rex-bc.chen@mediatek.com>, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de, daniel@ffwll.ch, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, mripard@kernel.org, tzimmermann@suse.de,
 matthias.bgg@gmail.com, deller@gmx.de, airlied@linux.ie
Cc: msp@baylibre.com, granquet@baylibre.com, jitao.shi@mediatek.com,
 wenst@chromium.org, ck.hu@mediatek.com, liangxu.xu@mediatek.com,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220901044149.16782-1-rex-bc.chen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220901044149.16782-1-rex-bc.chen@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220901_035834_992197_91924AD1 
X-CRM114-Status: GOOD (  11.60  )
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

Il 01/09/22 06:41, Bo-Chen Chen ha scritto:
> This patch is separated from v10 which is including dp driver, phy driver
> and dpintf driver. This series is only contained the DisplayPort driver.

For the entire series:

Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Thanks!
Angelo

> 
> Bo-Chen Chen (4):
>    drm/mediatek: dp: Add multiple bridge types support
>    drm/mediatek: dp: Add multiple smc commands support
>    drm/mediatek: dp: Add multiple calibration data formats support
>    drm/mediatek: dp: Determine device of next_bridge
> 
> Guillaume Ranquet (2):
>    drm/mediatek: dp: Add MT8195 External DisplayPort support
>    drm/mediatek: dp: Audio support for MT8195
> 
> Jitao Shi (1):
>    drm/mediatek: dp: Add hpd debounce
> 
> Markus Schneider-Pargmann (3):
>    dt-bindings: mediatek,dp: Add Display Port binding
>    video/hdmi: Add audio_infoframe packing for DP
>    drm/mediatek: Add MT8195 Embedded DisplayPort driver
> 
>   .../display/mediatek/mediatek,dp.yaml         |  116 +
>   drivers/gpu/drm/mediatek/Kconfig              |    9 +
>   drivers/gpu/drm/mediatek/Makefile             |    2 +
>   drivers/gpu/drm/mediatek/mtk_dp.c             | 2661 +++++++++++++++++
>   drivers/gpu/drm/mediatek/mtk_dp_reg.h         |  356 +++
>   drivers/video/hdmi.c                          |   82 +-
>   include/drm/display/drm_dp.h                  |    2 +
>   include/linux/hdmi.h                          |    7 +-
>   8 files changed, 3215 insertions(+), 20 deletions(-)
>   create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
>   create mode 100644 drivers/gpu/drm/mediatek/mtk_dp.c
>   create mode 100644 drivers/gpu/drm/mediatek/mtk_dp_reg.h
> 




