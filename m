Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99DA2C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Jan 2022 09:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bIyZhV6UjfvKDK65GOf6bwLhfixkd0hD0IU7pmzXW0E=; b=wh4CGHBaKId6ky2LN0vdo3qRd3
	UuFbVPez5sRrLJ+OrcBB47PVsIWtsWa9wezdc2TZVJtlhj5K1VXHDj2uRK/H1YL+TX/PzDP6nwmmP
	zsunlugEk0I0qHf7/sb4qrZi7u6rwmUMC9l6F4mBmkC3diE2/158sTHWTPEV2TNTR1TtCXOcxFfaU
	QpU9IPvsg88TG7m7kzdnogY8Xt5yccESIiSdjWtHkwK9w09ET2/1AA9udNgMsg/NR049YGQys4eZQ
	BM9KXkKLkYLivMa96NhmEfcFo1ukSq9ewPtTYPZq8veSc2Z7+dvh5oEQF8k05cdYOtcm89TvKcYSs
	LZnNSDUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n8JMr-008ccv-GS; Fri, 14 Jan 2022 09:59:33 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n8JMe-008cXn-Na; Fri, 14 Jan 2022 09:59:22 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 926421F4673C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1642154359;
 bh=+9biWWnH3dbRTPlizbAy98vfhQMljlSloRSnoFf9s1k=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=LXPvUEKGzuX2+nziPgpVruS368mLNhyyvpWaPM5R66bcq7ptwAUkcyVXOCrgnlbLs
 DTcjGd97r9pd0Mwpo/8UzPTy5fFpHlLSis61jnG9ufUR1f8nB/27zX90LWiX8VapFO
 mEz/c/qs9lgJIr7v/qQi0gJaNoNL17sRB5TyoOa8sqQ5v/Ko7MwMTHIYkAV2RItT8a
 YnTbh6ZAShGuxyYy6A0f5RwzSDkDF6nBOX4Tmqno9FeCPo90/1TwCJg5y7kOmtGqFU
 taR8IAbXtSjvNbjPAM6DVCW3UtwhMGsDl6/zHMBPiBlyJ9dFbh0+PiWw/aH/LCpTXn
 YQE+vsRBE1cbA==
Subject: Re: [v9, 1/3] drm/dsi: transfer DSI HS packets ending at the same time
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
 <20220114092110.12137-2-rex-bc.chen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <6874ebff-3b20-807d-0fa5-ba21986bb787@collabora.com>
Date: Fri, 14 Jan 2022 10:59:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20220114092110.12137-2-rex-bc.chen@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220114_015920_938431_D1736AD3 
X-CRM114-Status: GOOD (  19.67  )
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
> Since a HS transmission is composed of an arbitrary number
> of bytes that may not be an integer multiple of lanes, some
> lanes may run out of data before others.
> (Defined in 6.1.3 of mipi_DSI_specification_v.01-02-00)
> 
> However, for some DSI RX devices (for example, anx7625),
> there is a limitation that packet number should be the same
> on all DSI lanes. In other words, they need to end a HS at
> the same time.
> 
> Because this limitation is for some specific DSI RX devices,
> it is more reasonable to put the enable control in these
> DSI RX drivers. If DSI TX driver knows the information,
> they can adjust the setting for this situation.
> 
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>

Acked-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   include/drm/drm_mipi_dsi.h | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
> index 147e51b6d241..342dfe5a0874 100644
> --- a/include/drm/drm_mipi_dsi.h
> +++ b/include/drm/drm_mipi_dsi.h
> @@ -137,6 +137,8 @@ struct mipi_dsi_host *of_find_mipi_dsi_host_by_node(struct device_node *node);
>   #define MIPI_DSI_CLOCK_NON_CONTINUOUS	BIT(10)
>   /* transmit data in low power */
>   #define MIPI_DSI_MODE_LPM		BIT(11)
> +/* transmit data ending in the same hsync for all lanes */
> +#define MIPI_DSI_HS_PKT_END_ALIGNED	BIT(12)
>   
>   enum mipi_dsi_pixel_format {
>   	MIPI_DSI_FMT_RGB888,
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
