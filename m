Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2061BC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Mar 2022 12:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cK77XJat1+E9oLOLQw93xjL2orXh6lc4BDFk9mLPao4=; b=Q6OWuFWwX5AoSZ
	Lv0Lh1MB1Zqjh8ZthpNT45UDfk4GN1O+zr5Pq3Og0t/b86UrFxfCuxrR/oIA10ngWz6m7HvkogxcJ
	JPwE63qMP0ab8x+h99qeCAePkIlHltbcQIwDRSxJrX8Ie8gXX/WGaSdDVIzhQV60EQO8Xy+K2zTmR
	DLtgM4G8YIy87xylbyqxCm3RsFgVpH61OnKCodHNzZCofXa+R8GntkutzkoBDqdOqP4cKeN3r/C+z
	Dhf2iuBQhOZ8RQcXufnFSyilV5p+K+6bvYEdHfrZV395Oj/7yY4LztHet/t6B9ht0u7ys7KeSvLB7
	24yhBptseh8gj0MJlXRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nQ6gc-009tHP-1k; Fri, 04 Mar 2022 12:05:30 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nQ6gJ-009t8y-R3; Fri, 04 Mar 2022 12:05:15 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 0B0381F4666B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1646395510;
 bh=VHYyfrj27ghhFNATqiJptaXl35MZfcmk6S/le8aQ8V0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=lBWseeaKZhZUehk0Y28SYbDmAJ1Q/Hne5Swp5jgROU/3jmS5A7rr2qkQRqKMYQJY4
 mmWtA4wfg4dg2WR74NHRBkotetmfIKFd/19UPI1EziPT8FxeP1EryMr7JFB/XA2ZRx
 mSyoWgf1pGFRscJiMo5b2qdPe0ZiwGxdK50aBKTCf7tb8YD3mtWWJ41mOr8uNHbriY
 8OZQUnPQkqpf71Vcnoih32oZyX69Rf73umh86Yn/rFQSaGuCV4/S9OvMT1oP9vl3Uz
 x9yUuOZLt3UOFRI20SlICBP9nhbraU/Da4iFv0zG99PVBysrkjQSg3wMUCiL0Aeo4v
 rxwFr5/NQ7sOQ==
Message-ID: <4e45bd1d-c81c-97be-f505-cd03ffcdd442@collabora.com>
Date: Fri, 4 Mar 2022 13:05:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v2,3/3] drm/mediatek: Add mt8186 dsi compatible to
 mtk_dsi.c
Content-Language: en-US
To: xinlei.lee@mediatek.com, chunkuang.hu@kernel.org, p.zabel@pengutronix.de, 
 airlied@linux.ie, daniel@ffwll.ch, matthias.bgg@gmail.com
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, jitao.shi@mediatek.com,
 allen-kh.cheng@mediatek.com, rex-bc.chen@mediatek.com
References: <1645178869-18048-1-git-send-email-xinlei.lee@mediatek.com>
 <1645178869-18048-4-git-send-email-xinlei.lee@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <1645178869-18048-4-git-send-email-xinlei.lee@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220304_040512_059400_878B3A9C 
X-CRM114-Status: GOOD (  13.87  )
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

Il 18/02/22 11:07, xinlei.lee@mediatek.com ha scritto:
> From: Xinlei Lee <xinlei.lee@mediatek.com>
> 
> Add the compatible because use different cmdq addresses in mt8186.
> 
> Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   drivers/gpu/drm/mediatek/mtk_dsi.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
> index bced4c7d668e..8c61c4f412bc 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> @@ -1140,6 +1140,12 @@ static const struct mtk_dsi_driver_data mt8183_dsi_driver_data = {
>   	.has_size_ctl = true,
>   };
>   
> +static const struct mtk_dsi_driver_data mt8186_dsi_driver_data = {
> +	.reg_cmdq_off = 0xd00,
> +	.has_shadow_ctl = true,
> +	.has_size_ctl = true,
> +};
> +
>   static const struct of_device_id mtk_dsi_of_match[] = {
>   	{ .compatible = "mediatek,mt2701-dsi",
>   	  .data = &mt2701_dsi_driver_data },
> @@ -1147,6 +1153,8 @@ static const struct of_device_id mtk_dsi_of_match[] = {
>   	  .data = &mt8173_dsi_driver_data },
>   	{ .compatible = "mediatek,mt8183-dsi",
>   	  .data = &mt8183_dsi_driver_data },
> +	{ .compatible = "mediatek,mt8186-dsi",
> +	  .data = &mt8186_dsi_driver_data },
>   	{ },
>   };
>   MODULE_DEVICE_TABLE(of, mtk_dsi_of_match);
> 




_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
