Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 892B0C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Feb 2022 05:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R4K7HvZgJLlP585ZnI+oE6TemIAiqKWpqW8Nfq8yo4k=; b=vpnAehXBbZZLPp
	syJMw/3KPiXKvHDriJtqIQNYZQRydM2Oa9mrhTwZ1RuaD5yG30tb6GJo37qxEwFijtlMgRnQ4K3/b
	ko8ld7uD+cw2P6ZeI6JHyEo/iom8xp5UM+J+xDUveEM3ZXznQ71VvGAmIzeLer0XhUFgRnw8Qh7rT
	ri6j0PI7LMIcP+7rDmr3LQB+jQdUIEOxmESu999Jaw2U3wA9fAhxCf2lKpcGc7KONREDbi/G3dpdY
	ze58CbVzLk59G3VYSQP+byXLz5LMm9zPVoAOktbj+V5SacZxiBtVG1RSPD3RVY1H2iuavPAgPTBQT
	Jj/ETjA9xY8TWEG1L/tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nN6pU-00GuIU-2w; Thu, 24 Feb 2022 05:38:16 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nN6pE-00GuCx-8l; Thu, 24 Feb 2022 05:38:03 +0000
X-UUID: ab9b76ae29f94a67a9ab53291de53c49-20220223
X-UUID: ab9b76ae29f94a67a9ab53291de53c49-20220223
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 61374618; Wed, 23 Feb 2022 22:37:54 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 23 Feb 2022 21:37:52 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 24 Feb 2022 13:37:51 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 24 Feb 2022 13:37:50 +0800
Message-ID: <4abb07d9673fb0e602ae26de233b45471b9e62e2.camel@mediatek.com>
Subject: Re: [2/3] drm/mediatek: Separate poweron/poweroff from
 enable/disable and define new funcs
From: CK Hu <ck.hu@mediatek.com>
To: <xinlei.lee@mediatek.com>, <chunkuang.hu@kernel.org>,
 <p.zabel@pengutronix.de>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <matthias.bgg@gmail.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <rex-bc.chen@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Jitao Shi
 <jitao.shi@mediatek.com>
Date: Thu, 24 Feb 2022 13:37:50 +0800
In-Reply-To: <1644589818-13066-3-git-send-email-xinlei.lee@mediatek.com>
References: <1644589818-13066-1-git-send-email-xinlei.lee@mediatek.com>
 <1644589818-13066-3-git-send-email-xinlei.lee@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220223_213800_347878_ED8BEE0D 
X-CRM114-Status: GOOD (  22.09  )
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

On Fri, 2022-02-11 at 22:30 +0800, xinlei.lee@mediatek.com wrote:
> From: Jitao Shi <jitao.shi@mediatek.com>
> 
> In order to match the changes of DSI RX devices (for example,
> anx7625), 
> the poweron/poweroff of dsi is extracted from enable/disable and 
> defined as new funcs (pre_enable/post_disable).

Does DSI not work with anx7625 now? This patch is a bug-fix or new
feature? If this patch is a bug-fix, please add 'Fixes' tag [1].

[1] 
https://www.kernel.org/doc/html/v5.16/process/submitting-patches.html

Regards,
CK

> 
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_dsi.c | 45 ++++++++++++++++++++++----
> ------------
>  1 file changed, 26 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c
> b/drivers/gpu/drm/mediatek/mtk_dsi.c
> index 6d7b66d..e47c338 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> @@ -679,16 +679,6 @@ static void mtk_dsi_poweroff(struct mtk_dsi
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
> @@ -703,17 +693,9 @@ static void mtk_dsi_poweroff(struct mtk_dsi
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
> @@ -727,7 +709,16 @@ static void mtk_output_dsi_disable(struct
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
> @@ -765,10 +756,26 @@ static void mtk_dsi_bridge_enable(struct
> drm_bridge *bridge)
>  	mtk_output_dsi_enable(dsi);
>  }
>  
> +static void mtk_dsi_bridge_pre_enable(struct drm_bridge *bridge)
> +{
> +	struct mtk_dsi *dsi = bridge_to_dsi(bridge);
> +
> +	mtk_dsi_poweron(dsi);
> +}
> +
> +static void mtk_dsi_bridge_post_disable(struct drm_bridge *bridge)
> +{
> +	struct mtk_dsi *dsi = bridge_to_dsi(bridge);
> +
> +	mtk_dsi_poweroff(dsi);
> +}
> +
>  static const struct drm_bridge_funcs mtk_dsi_bridge_funcs = {
>  	.attach = mtk_dsi_bridge_attach,
>  	.disable = mtk_dsi_bridge_disable,
>  	.enable = mtk_dsi_bridge_enable,
> +	.pre_enable = mtk_dsi_bridge_pre_enable,
> +	.post_disable = mtk_dsi_bridge_post_disable,
>  	.mode_set = mtk_dsi_bridge_mode_set,
>  };
>  


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
