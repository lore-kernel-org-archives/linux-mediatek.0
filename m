Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A325EC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Feb 2022 11:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RlXu6+PCE0xmK+LyqZyh+hUw5WfNQ7m2T4UlDHHynOk=; b=H595vkavzbQHgx
	YevUHkb8HNRO2M7p8zG93fgmG3a4bQkr+/qDkRdzTWHM+xZ1NdwEFNe0tN1jCUiDd08gE+1ZQVYUV
	1koXXUEqNhnk8xrfnWVtOaS2J5KqIMu5L5D5LbNsG2nEqiQNX1JUCRekdPhpw9L/UD6+yNjZ4qZEU
	s5QznA5hPtfl6/IxIwnE+a+/xesjlECMIfUn1CV671mcYRMUxxcHSbtsXyhK6XTyCKM9z66d4H9ae
	b2HXxjoBonADTVYU0RzTV91arourRIHGD6jYpnvhOvuiHt46pPYdurdmMRubsQ0m+2UEgzGD/Yjrg
	jwEPmkEmptni26fILhDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKIiW-006mV3-9Y; Wed, 16 Feb 2022 11:43:28 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKIiT-006mU8-Pn; Wed, 16 Feb 2022 11:43:27 +0000
X-UUID: b43ee8472b68402f847d9d348166c3d9-20220216
X-UUID: b43ee8472b68402f847d9d348166c3d9-20220216
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 253471003; Wed, 16 Feb 2022 04:43:22 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 16 Feb 2022 03:36:02 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Wed, 16 Feb 2022 19:36:00 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 16 Feb 2022 19:36:00 +0800
Message-ID: <55c380797ef845992c0d1a7f1d15b986eaf478c0.camel@mediatek.com>
Subject: Re: [v11,1/3] drm/dsi: transfer DSI HS packets ending at the same time
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: <chunkuang.hu@kernel.org>, <matthias.bgg@gmail.com>,
 <narmstrong@baylibre.com>, <robert.foss@linaro.org>,
 <andrzej.hajda@intel.com>, <daniel@ffwll.ch>, <airlied@linux.ie>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <p.zabel@pengutronix.de>
CC: <xji@analogixsemi.com>, <jitao.shi@mediatek.com>,
 <xinlei.lee@mediatek.com>, <angelogioacchino.delregno@collabora.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Wed, 16 Feb 2022 19:36:00 +0800
In-Reply-To: <20220207045625.17713-2-rex-bc.chen@mediatek.com>
References: <20220207045625.17713-1-rex-bc.chen@mediatek.com>
 <20220207045625.17713-2-rex-bc.chen@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220216_034325_856597_7333BB99 
X-CRM114-Status: GOOD (  21.86  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hello common DRM maintainers,

We have proposed a DSI mode_flag definition in
include/drm/drm_mipi_dsi.h.
The maintainer of bridge chip, Andrzej, also reviewed this patch.

Is there any chance that you can give us some suggestions?
We also need your approvement if this series is acceptable.

Also, if the patch is not proper for you, please let us know.

Thanks for your help.

BRs,
Rex

On Mon, 2022-02-07 at 12:56 +0800, Rex-BC Chen wrote:
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
> Acked-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>
> Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
> ---
>  include/drm/drm_mipi_dsi.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
> index 147e51b6d241..51e09a1a106a 100644
> --- a/include/drm/drm_mipi_dsi.h
> +++ b/include/drm/drm_mipi_dsi.h
> @@ -137,6 +137,8 @@ struct mipi_dsi_host
> *of_find_mipi_dsi_host_by_node(struct device_node *node);
>  #define MIPI_DSI_CLOCK_NON_CONTINUOUS	BIT(10)
>  /* transmit data in low power */
>  #define MIPI_DSI_MODE_LPM		BIT(11)
> +/* transmit data ending at the same time for all lanes within one
> hsync */
> +#define MIPI_DSI_HS_PKT_END_ALIGNED	BIT(12)
>  
>  enum mipi_dsi_pixel_format {
>  	MIPI_DSI_FMT_RGB888,


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
