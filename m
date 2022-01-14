Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA384C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Jan 2022 09:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J2W7ChHKIUa/dUhSm8FcxL45i5f9PU13+Q7InvYWOVo=; b=HO7pLWXQ4MSnSU0S6OUf4wSA1N
	LsBv4sdvrG2dBHbRpMbt0SZAp4vjmilyP+ZS1P6LCZhCibnT2rEYS1DmWKvc3GZ2HGnbloUvJ71b7
	oyar7YiSs9xUyhz/mFCYZ2vQ3e3Eb0KQJOqa6tc8Zd4k8gblVtHB+RIQl2jhcSYhlxVwErl1FvWuw
	h5KTKEJKuEWNawqozid0qv345CkziYJwY6pWObnvzyOgyxEh37gEoqAHy+iZcgV8sdV+XSLYh7bJJ
	oCR/+BQg9ZvJNAnk/sZCpKM1stwG+Z7afaTGX/4sHbt8cKj2pVzpBqPhQEhWboRnRFMCCDqeMhBVG
	cSV0uOUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n8JKx-008cDk-Sf; Fri, 14 Jan 2022 09:57:35 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n8JKl-008cC9-Rv; Fri, 14 Jan 2022 09:57:25 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 5DC0C1F4673C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1642154242;
 bh=Y9ZEklpVcSHZrMGoj2Y3KVzohZyX3zxs0Ezly9VHhpg=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=JnrT35XwaOs6lYaGiXSrOqPHkN1N7cCn85YEnAVyYjWHUz4/qyKT5UdXY8jtWX9Kr
 l2XdD8n7/lKmhUafoc8Iv+Mksvn9vjkYB8juOV0gCHudna0OsFDhwPtHYxkADBO74J
 bTZyEzpPLpLh7qqnBiM0ANBdxV2Ljb2EQ5lyKKciRpJpFuslb2WAehkTIgqNrGieiJ
 PZcObstdy5bnRWgOr8IHO/ZiPODEkx7zHt9HyMiDFMZ+imWNQLjvxKjVLiqjWSeikV
 O2da0RvCN1fOb3ISg47GotgLR8e5Ud65ryMPNbEKegWaGAUXLYYxEfh14vZNzlX4KA
 jBhexYGY3iZtg==
Subject: Re: [v9, 3/3] drm/bridge: anx7625: config hs packets end aligned to
 avoid screen shift
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, chunkuang.hu@kernel.org,
 matthias.bgg@gmail.com, narmstrong@baylibre.com, robert.foss@linaro.org,
 andrzej.hajda@intel.com, daniel@ffwll.ch, airlied@linux.ie,
 p.zabel@pengutronix.de
Cc: xji@analogixsemi.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Jitao Shi <jitao.shi@mediatek.com>
References: <20220114092110.12137-1-rex-bc.chen@mediatek.com>
 <20220114092110.12137-4-rex-bc.chen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <cd19a827-d132-1011-9445-7e425817102a@collabora.com>
Date: Fri, 14 Jan 2022 10:57:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20220114092110.12137-4-rex-bc.chen@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220114_015724_076028_F146FE04 
X-CRM114-Status: GOOD (  15.96  )
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

Il 14/01/22 10:21, Rex-BC Chen ha scritto:
> This device requires the packets on lanes aligned at the end to fix
> screen shift or scroll.
> 
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>

Acked-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   drivers/gpu/drm/bridge/analogix/anx7625.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
> index 2346dbcc505f..fe32ab0878ae 100644
> --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> @@ -1673,7 +1673,8 @@ static int anx7625_attach_dsi(struct anx7625_data *ctx)
>   	dsi->format = MIPI_DSI_FMT_RGB888;
>   	dsi->mode_flags = MIPI_DSI_MODE_VIDEO	|
>   		MIPI_DSI_MODE_VIDEO_SYNC_PULSE	|
> -		MIPI_DSI_MODE_VIDEO_HSE;
> +		MIPI_DSI_MODE_VIDEO_HSE	|
> +		MIPI_DSI_HS_PKT_END_ALIGNED;
>   
>   	ret = devm_mipi_dsi_attach(dev, dsi);
>   	if (ret) {
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
