Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94CC9C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 May 2022 01:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8jFiacS+v28ACKlQ+HpWgXKYqfB98eYesd6bTKMlPqw=; b=WCSGpC0gQ5ZHRd
	WJsEyNOftnS4ORPeOLeOeqAnwVPsG/lEygIwjyFm0h9YQQO9PWhBB9o5opzum4LCVDy5TilWM2YVU
	XrEsVhgdNmbeQ5MfG5ki1Rdi+gCnJdy+yk16W6fXlvlUFtKVuFBNs5o+CxhHD1ymNCo57Up1nQusd
	FCkytao6PKbgUEe7zFsBt4E3v/FdQfOpLr0LIMiUcMmdOTICmAKeCdpelB8pk6UZE0amw5Ne7OjK7
	RUzSyGBZTbzjabxDKRllSrsI55ES4UQdw6EgILWsC9WjOhhU34x1WAPQk7BWp8lz6p7iAItSqdpon
	OzqZSxU8eSCtxb67oX1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ntg5e-009dZd-5Z; Wed, 25 May 2022 01:45:34 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ntg5Z-009dXI-Nc; Wed, 25 May 2022 01:45:32 +0000
X-UUID: 64f52bbc500e49ceaefa28648e3a1ee4-20220524
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5, REQID:1ac1e89e-7d5d-45a7-913f-b6c6eda19b32, OB:0,
 LO
 B:0,IP:0,URL:5,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:5
X-CID-META: VersionHash:2a19b09, CLOUDID:cdf91ab8-3c45-407b-8f66-25095432a27a,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
 ,QS:0,BEC:nil
X-UUID: 64f52bbc500e49ceaefa28648e3a1ee4-20220524
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 106694288; Tue, 24 May 2022 18:45:19 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 24 May 2022 18:40:33 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; 
 Wed, 25 May 2022 09:40:32 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Wed, 25 May 2022 09:40:32 +0800
Message-ID: <35d23d9ffd1d804fc3253d192f7de3eaebf3fcff.camel@mediatek.com>
Subject: Re: [PATCH v7, 2/4] drm/mediatek: Separate poweron/poweroff from
 enable/disable and define new funcs
From: CK Hu <ck.hu@mediatek.com>
To: <xinlei.lee@mediatek.com>, <chunkuang.hu@kernel.org>,
 <p.zabel@pengutronix.de>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <matthias.bgg@gmail.com>
CC: <jitao.shi@mediatek.com>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <linux-mediatek@lists.infradead.org>, <rex-bc.chen@mediatek.com>,
 <linux-arm-kernel@lists.infradead.org>
Date: Wed, 25 May 2022 09:40:32 +0800
In-Reply-To: <1653012007-11854-3-git-send-email-xinlei.lee@mediatek.com>
References: <1653012007-11854-1-git-send-email-xinlei.lee@mediatek.com>
 <1653012007-11854-3-git-send-email-xinlei.lee@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220524_184529_813114_BFFDE03C 
X-CRM114-Status: GOOD (  26.29  )
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

Hi, Xinlei:

On Fri, 2022-05-20 at 10:00 +0800, xinlei.lee@mediatek.com wrote:
> From: Jitao Shi <jitao.shi@mediatek.com>
> 
> In order to match the changes of "Use the drm_panel_bridge API",
> the poweron/poweroff of dsi is extracted from enable/disable and
> defined as new funcs (atomic_pre_enable/atomic_post_disable).
> 
> Since dsi_poweron is moved from dsi_enable to pre_enable function, in
> order to avoid poweron failure, the operation of dsi register fails
> to
> cause bus hang. Therefore, the protection mechanism is added to the
> dsi_enable function.

Reviewed-by: CK Hu <ck.hu@mediatek.com>

> 
> Fixes: 2dd8075d2185 ("drm/mediatek: mtk_dsi: Use the drm_panel_bridge
> API")
> 
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>
> Reviewed-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_dsi.c | 53 +++++++++++++++++++---------
> --
>  1 file changed, 34 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c
> b/drivers/gpu/drm/mediatek/mtk_dsi.c
> index f880136cec09..d9a6b928dba8 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> @@ -691,16 +691,6 @@ static void mtk_dsi_poweroff(struct mtk_dsi
> *dsi)
>  	if (--dsi->refcount != 0)
>  		return;
>  
> -	/*
> -	 * mtk_dsi_stop() and mtk_dsi_start() is asymmetric, since
> -	 * mtk_dsi_stop() should be called after
> mtk_drm_crtc_atomic_disable(),
> -	 * which needs irq for vblank, and mtk_dsi_stop() will disable
> irq.
> -	 * mtk_dsi_start() needs to be called in
> mtk_output_dsi_enable(),
> -	 * after dsi is fully set.
> -	 */
> -	mtk_dsi_stop(dsi);
> -
> -	mtk_dsi_switch_to_cmd_mode(dsi, VM_DONE_INT_FLAG, 500);
>  	mtk_dsi_reset_engine(dsi);
>  	mtk_dsi_lane0_ulp_mode_enter(dsi);
>  	mtk_dsi_clk_ulp_mode_enter(dsi);
> @@ -715,17 +705,9 @@ static void mtk_dsi_poweroff(struct mtk_dsi
> *dsi)
>  
>  static void mtk_output_dsi_enable(struct mtk_dsi *dsi)
>  {
> -	int ret;
> -
>  	if (dsi->enabled)
>  		return;
>  
> -	ret = mtk_dsi_poweron(dsi);
> -	if (ret < 0) {
> -		DRM_ERROR("failed to power on dsi\n");
> -		return;
> -	}
> -
>  	mtk_dsi_set_mode(dsi);
>  	mtk_dsi_clk_hs_mode(dsi, 1);
>  
> @@ -739,7 +721,16 @@ static void mtk_output_dsi_disable(struct
> mtk_dsi *dsi)
>  	if (!dsi->enabled)
>  		return;
>  
> -	mtk_dsi_poweroff(dsi);
> +	/*
> +	 * mtk_dsi_stop() and mtk_dsi_start() is asymmetric, since
> +	 * mtk_dsi_stop() should be called after
> mtk_drm_crtc_atomic_disable(),
> +	 * which needs irq for vblank, and mtk_dsi_stop() will disable
> irq.
> +	 * mtk_dsi_start() needs to be called in
> mtk_output_dsi_enable(),
> +	 * after dsi is fully set.
> +	 */
> +	mtk_dsi_stop(dsi);
> +
> +	mtk_dsi_switch_to_cmd_mode(dsi, VM_DONE_INT_FLAG, 500);
>  
>  	dsi->enabled = false;
>  }
> @@ -776,13 +767,37 @@ static void mtk_dsi_bridge_atomic_enable(struct
> drm_bridge *bridge,
>  {
>  	struct mtk_dsi *dsi = bridge_to_dsi(bridge);
>  
> +	if (dsi->refcount == 0)
> +		return;
> +
>  	mtk_output_dsi_enable(dsi);
>  }
>  
> +static void mtk_dsi_bridge_atomic_pre_enable(struct drm_bridge
> *bridge,
> +					     struct drm_bridge_state
> *old_bridge_state)
> +{
> +	struct mtk_dsi *dsi = bridge_to_dsi(bridge);
> +	int ret;
> +
> +	ret = mtk_dsi_poweron(dsi);
> +	if (ret < 0)
> +		DRM_ERROR("failed to power on dsi\n");
> +}
> +
> +static void mtk_dsi_bridge_atomic_post_disable(struct drm_bridge
> *bridge,
> +					       struct drm_bridge_state
> *old_bridge_state)
> +{
> +	struct mtk_dsi *dsi = bridge_to_dsi(bridge);
> +
> +	mtk_dsi_poweroff(dsi);
> +}
> +
>  static const struct drm_bridge_funcs mtk_dsi_bridge_funcs = {
>  	.attach = mtk_dsi_bridge_attach,
>  	.atomic_disable = mtk_dsi_bridge_atomic_disable,
>  	.atomic_enable = mtk_dsi_bridge_atomic_enable,
> +	.atomic_pre_enable = mtk_dsi_bridge_atomic_pre_enable,
> +	.atomic_post_disable = mtk_dsi_bridge_atomic_post_disable,
>  	.mode_set = mtk_dsi_bridge_mode_set,
>  };
>  


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
