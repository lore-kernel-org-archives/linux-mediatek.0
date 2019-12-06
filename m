Return-Path: <SRS0=uEYr=Z4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14368C43603
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Dec 2019 02:55:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CEDF12173E
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Dec 2019 02:55:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aTbmaPqA";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="i0LWQ+BH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CEDF12173E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bUQ1S4CRvURFRrqgH7LwlECwmtbwlnlm3YlmYlM4eUY=; b=aTbmaPqA1Mr2Xq
	DdapbJrSK1HT3pFxxfxsQVZJP3ek6KK6ipclND/kYbsDa5tIhtPccaxG7TKpUrUJEnvKR9QJ4My4a
	33P/0jfQw5CgOCShyPV2DFlnNnMFUafC5ajjaUE+tTDxdrAaMbO9q9baa83X1yeBJMw8xXH5D5vbn
	JD9io5gtPkewOb4CS9++N9aeDVuYCDOTMEz+eHbos4N7aIMGuYWBHDPlYWSD6mgAr0r3zMtYnsOwS
	cDfVF1UCnK40I9DUIAjMitE0lYP+73nPnqLjjK35rFuRSkAEvV/Ur03s7EHnm/eCyNF3Cl516bpih
	CK2j1V7jDPfqCQloE2Hg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1id3m6-0000nr-LB; Fri, 06 Dec 2019 02:55:22 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1id3lx-0000YC-Uj; Fri, 06 Dec 2019 02:55:16 +0000
X-UUID: d625fe20304a4f3db0697edc4ccd42b2-20191205
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=+m0881iTlxWLsLEeydzi6ozs1V2dNGB1CpLzB3Z+JSE=; 
 b=i0LWQ+BHy0VCdjk3SADTwVtO7KBv5aPsls+cJ0E6hRYE0C2bMcHEfiIGgeWUu0iVO9wO+FsOqqjdOzo+Usdl5ZnwUQ7IZuusNw18tHxOWHFb6qUZs00+DDpR9GLuovKIXT430VlONCpN9RGy1boHke0IrBhuZ6czMkd65R5BYvg=;
X-UUID: d625fe20304a4f3db0697edc4ccd42b2-20191205
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 778458383; Thu, 05 Dec 2019 18:55:05 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 5 Dec 2019 18:55:52 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 6 Dec 2019 10:54:57 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Fri, 6 Dec 2019 10:54:27 +0800
Message-ID: <1575600902.6328.11.camel@mtksdaap41>
Subject: Re: [PATCH v4 7/7] drm/mediatek: apply CMDQ control flow
From: CK Hu <ck.hu@mediatek.com>
To: Bibby Hsieh <bibby.hsieh@mediatek.com>
Date: Fri, 6 Dec 2019 10:55:02 +0800
In-Reply-To: <20191205092749.4021-8-bibby.hsieh@mediatek.com>
References: <20191205092749.4021-1-bibby.hsieh@mediatek.com>
 <20191205092749.4021-8-bibby.hsieh@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191205_185514_000334_F7C2A760 
X-CRM114-Status: GOOD (  16.58  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: drinkcat@chromium.org, Yongqiang Niu <yongqiang.niu@mediatek.com>,
 srv_heupstream@mediatek.com, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, tfiga@chromium.org,
 Thierry Reding <thierry.reding@gmail.com>, linux-mediatek@lists.infradead.org,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi, Bibby:

On Thu, 2019-12-05 at 17:27 +0800, Bibby Hsieh wrote:
> Unlike other SoCs, MT8183 does not have "shadow"
> registers for performaing an atomic video mode
> set or page flip at vblank/vsync.
> 
> The CMDQ (Commend Queue) in MT8183 is used to help
> update all relevant display controller registers
> with critical time limation.

Reviewed-by: CK Hu <ck.hu@mediatek.com>
> 
> Signed-off-by: YT Shen <yt.shen@mediatek.com>
> Signed-off-by: CK Hu <ck.hu@mediatek.com>
> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
> Signed-off-by: Bibby Hsieh <bibby.hsieh@mediatek.com>
> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 56 +++++++++++++++++++++----
>  1 file changed, 49 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> index 8c6231ed6f55..496dffe962af 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> @@ -12,6 +12,8 @@
>  #include <drm/drm_plane_helper.h>
>  #include <drm/drm_probe_helper.h>
>  #include <drm/drm_vblank.h>
> +#include <linux/of_address.h>
> +#include <linux/soc/mediatek/mtk-cmdq.h>
>  
>  #include "mtk_drm_drv.h"
>  #include "mtk_drm_crtc.h"
> @@ -43,6 +45,9 @@ struct mtk_drm_crtc {
>  	bool				pending_planes;
>  	bool				pending_async_planes;
>  
> +	struct cmdq_client		*cmdq_client;
> +	u32				cmdq_event;
> +
>  	void __iomem			*config_regs;
>  	const struct mtk_mmsys_reg_data *mmsys_reg_data;
>  	struct mtk_disp_mutex		*mutex;
> @@ -234,6 +239,13 @@ struct mtk_ddp_comp *mtk_drm_ddp_comp_for_plane(struct drm_crtc *crtc,
>  	return NULL;
>  }
>  
> +#ifdef CONFIG_MTK_CMDQ
> +static void ddp_cmdq_cb(struct cmdq_cb_data data)
> +{
> +	cmdq_pkt_destroy(data.data);
> +}
> +#endif
> +
>  static int mtk_crtc_ddp_hw_init(struct mtk_drm_crtc *mtk_crtc)
>  {
>  	struct drm_crtc *crtc = &mtk_crtc->base;
> @@ -378,7 +390,8 @@ static void mtk_crtc_ddp_hw_fini(struct mtk_drm_crtc *mtk_crtc)
>  	}
>  }
>  
> -static void mtk_crtc_ddp_config(struct drm_crtc *crtc)
> +static void mtk_crtc_ddp_config(struct drm_crtc *crtc,
> +				struct cmdq_pkt *cmdq_handle)
>  {
>  	struct mtk_drm_crtc *mtk_crtc = to_mtk_crtc(crtc);
>  	struct mtk_crtc_state *state = to_mtk_crtc_state(mtk_crtc->base.state);
> @@ -394,7 +407,8 @@ static void mtk_crtc_ddp_config(struct drm_crtc *crtc)
>  	if (state->pending_config) {
>  		mtk_ddp_comp_config(comp, state->pending_width,
>  				    state->pending_height,
> -				    state->pending_vrefresh, 0, NULL);
> +				    state->pending_vrefresh, 0,
> +				    cmdq_handle);
>  
>  		state->pending_config = false;
>  	}
> @@ -414,7 +428,8 @@ static void mtk_crtc_ddp_config(struct drm_crtc *crtc)
>  
>  			if (comp)
>  				mtk_ddp_comp_layer_config(comp, local_layer,
> -							  plane_state, NULL);
> +							  plane_state,
> +							  cmdq_handle);
>  			plane_state->pending.config = false;
>  		}
>  		mtk_crtc->pending_planes = false;
> @@ -435,7 +450,8 @@ static void mtk_crtc_ddp_config(struct drm_crtc *crtc)
>  
>  			if (comp)
>  				mtk_ddp_comp_layer_config(comp, local_layer,
> -							  plane_state, NULL);
> +							  plane_state,
> +							  cmdq_handle);
>  			plane_state->pending.async_config = false;
>  		}
>  		mtk_crtc->pending_async_planes = false;
> @@ -444,6 +460,7 @@ static void mtk_crtc_ddp_config(struct drm_crtc *crtc)
>  
>  static void mtk_drm_crtc_hw_config(struct mtk_drm_crtc *mtk_crtc)
>  {
> +	struct cmdq_pkt *cmdq_handle;
>  	struct drm_crtc *crtc = &mtk_crtc->base;
>  	struct mtk_drm_private *priv = crtc->dev->dev_private;
>  	unsigned int pending_planes = 0, pending_async_planes = 0;
> @@ -472,9 +489,18 @@ static void mtk_drm_crtc_hw_config(struct mtk_drm_crtc *mtk_crtc)
>  
>  	if (priv->data->shadow_register) {
>  		mtk_disp_mutex_acquire(mtk_crtc->mutex);
> -		mtk_crtc_ddp_config(crtc);
> +		mtk_crtc_ddp_config(crtc, NULL);
>  		mtk_disp_mutex_release(mtk_crtc->mutex);
>  	}
> +#ifdef CONFIG_MTK_CMDQ
> +	if (mtk_crtc->cmdq_client) {
> +		cmdq_handle = cmdq_pkt_create(mtk_crtc->cmdq_client, PAGE_SIZE);
> +		cmdq_pkt_clear_event(cmdq_handle, mtk_crtc->cmdq_event);
> +		cmdq_pkt_wfe(cmdq_handle, mtk_crtc->cmdq_event);
> +		mtk_crtc_ddp_config(crtc, cmdq_handle);
> +		cmdq_pkt_flush_async(cmdq_handle, ddp_cmdq_cb, cmdq_handle);
> +	}
> +#endif
>  	mutex_unlock(&mtk_crtc->hw_lock);
>  }
>  
> @@ -643,8 +669,8 @@ void mtk_crtc_ddp_irq(struct drm_crtc *crtc, struct mtk_ddp_comp *comp)
>  	struct mtk_drm_crtc *mtk_crtc = to_mtk_crtc(crtc);
>  	struct mtk_drm_private *priv = crtc->dev->dev_private;
>  
> -	if (!priv->data->shadow_register)
> -		mtk_crtc_ddp_config(crtc);
> +	if (!priv->data->shadow_register && !mtk_crtc->cmdq_client)
> +		mtk_crtc_ddp_config(crtc, NULL);
>  
>  	mtk_drm_finish_page_flip(mtk_crtc);
>  }
> @@ -787,5 +813,21 @@ int mtk_drm_crtc_create(struct drm_device *drm_dev,
>  	priv->num_pipes++;
>  	mutex_init(&mtk_crtc->hw_lock);
>  
> +#ifdef CONFIG_MTK_CMDQ
> +	mtk_crtc->cmdq_client =
> +			cmdq_mbox_create(dev, drm_crtc_index(&mtk_crtc->base),
> +					 2000);
> +	if (IS_ERR(mtk_crtc->cmdq_client)) {
> +		dev_dbg(dev, "mtk_crtc %d failed to create mailbox client, writing register by CPU now\n",
> +			drm_crtc_index(&mtk_crtc->base));
> +		mtk_crtc->cmdq_client = NULL;
> +	}
> +	ret = of_property_read_u32_index(dev->of_node, "mediatek,gce-events",
> +					 drm_crtc_index(&mtk_crtc->base),
> +					 &mtk_crtc->cmdq_event);
> +	if (ret)
> +		dev_dbg(dev, "mtk_crtc %d failed to get mediatek,gce-events property\n",
> +			drm_crtc_index(&mtk_crtc->base));
> +#endif
>  	return 0;
>  }

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
