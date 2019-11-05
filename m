Return-Path: <SRS0=3chi=Y5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B65BCA9ED3
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Nov 2019 01:34:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7139E20717
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Nov 2019 01:34:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YjhQqtzZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7139E20717
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2pueoZFQN6yItp5gxcOUliz8FgvedPGWo1aARhmkT8g=; b=YjhQqtzZ05aiYJ
	dc09zUHQDTVmrB8gtHRrSILazuKP6/YZqt4VFLAfYL7r6LKswDhqFTex+BXftOaQhAl6QOpEQJK9D
	cijWkDbLAphenziKhSdUOp9/kWQV6yobRGMyi3DQcfstNCT4cLNxPMhln2zZP2vOX8VzXf7N/43ez
	e49uNYsh7anZJ1Z0fvQJ3ZCQPvi0MIDr36DLWD9143dxDuN4xZKybCX8KZpA85z5z6T4B4zpbCHXG
	vCMN7knXWloTUW6Gl4SrzpsURc2pECCl4wlXNVsZn47DvZfsV7Klfa6MIBgDKqQUcqoRYKCAz5frs
	kNw7jfNIRuUl5Ut7boog==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iRnkI-00083X-5D; Tue, 05 Nov 2019 01:34:58 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iRnkF-000836-Sd; Tue, 05 Nov 2019 01:34:57 +0000
X-UUID: 563dd96782244e36b8b08035feb81000-20191104
X-UUID: 563dd96782244e36b8b08035feb81000-20191104
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 46241332; Mon, 04 Nov 2019 17:34:41 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 4 Nov 2019 17:34:45 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 5 Nov 2019 09:34:44 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Tue, 5 Nov 2019 09:34:44 +0800
Message-ID: <1572917685.20346.10.camel@mtksdaap41>
Subject: Re: [PATCH] drm/mediatek: Support reflect-y plane rotation
From: CK Hu <ck.hu@mediatek.com>
To: Sean Paul <sean@poorly.run>
Date: Tue, 5 Nov 2019 09:34:45 +0800
In-Reply-To: <20191101132647.189033-1-sean@poorly.run>
References: <20191101132647.189033-1-sean@poorly.run>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191104_173455_932442_53A947FA 
X-CRM114-Status: GOOD (  20.24  )
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
Cc: Daniele Castagna <dcastagna@chromium.org>, dri-devel@lists.freedesktop.org,
 Matthias
 Brugger <matthias.bgg@gmail.com>, Miguel Casas <mcasas@chromium.org>,
 Sean Paul <seanpaul@chromium.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Fritz Koenig <frkoenig@chromium.org>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Mark Yacoub <markyacoub@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi, Sean:

On Fri, 2019-11-01 at 09:26 -0400, Sean Paul wrote:
> From: Sean Paul <seanpaul@chromium.org>
> 
> Expose the rotation property and handle REFLECT_Y rotations.
> 
> Cc: Fritz Koenig <frkoenig@chromium.org>
> Cc: Daniele Castagna <dcastagna@chromium.org>
> Cc: Miguel Casas <mcasas@chromium.org>
> Cc: Mark Yacoub <markyacoub@google.com>
> Signed-off-by: Sean Paul <seanpaul@chromium.org>
> ---
> 
> The hardware also supports REFLECT_X, but I just could not figure out
> how to get it working. If someone is interested in getting this going,
> I'm happy to share notes and my WIP patch. For now, though, I actually
> only need y-flip so I'm giving up on x-flip.
> 
> 
>  drivers/gpu/drm/mediatek/mtk_disp_ovl.c  |  6 ++++++
>  drivers/gpu/drm/mediatek/mtk_drm_plane.c | 11 ++++++++++-
>  drivers/gpu/drm/mediatek/mtk_drm_plane.h |  1 +
>  3 files changed, 17 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> index 14878ebf59d7..6505479ee506 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> @@ -50,6 +50,7 @@
>  					OVL_CON_CLRFMT_RGB : 0)
>  #define	OVL_CON_AEN		BIT(8)
>  #define	OVL_CON_ALPHA		0xff
> +#define	OVL_CON_VIRT_FLIP	BIT(9)
>  
>  struct mtk_disp_ovl_data {
>  	unsigned int addr;
> @@ -229,6 +230,11 @@ static void mtk_ovl_layer_config(struct mtk_ddp_comp *comp, unsigned int idx,
>  	if (idx != 0)
>  		con |= OVL_CON_AEN | OVL_CON_ALPHA;
>  
> +	if (pending->rotation & DRM_MODE_REFLECT_Y) {
> +		con |= OVL_CON_VIRT_FLIP;
> +		addr += (pending->height - 1) * pending->pitch;
> +	}
> +
>  	writel_relaxed(con, comp->regs + DISP_REG_OVL_CON(idx));
>  	writel_relaxed(pitch, comp->regs + DISP_REG_OVL_PITCH(idx));
>  	writel_relaxed(src_size, comp->regs + DISP_REG_OVL_SRC_SIZE(idx));
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_plane.c b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
> index 584a9ecadce6..4d8f2b55334b 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_plane.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
> @@ -88,6 +88,9 @@ static int mtk_plane_atomic_check(struct drm_plane *plane,
>  	if (!fb)
>  		return 0;
>  
> +	if (fb->format->is_yuv && (state->rotation & ~DRM_MODE_ROTATE_0) != 0)
> +		return -EINVAL;
> +

For some crtc, its DMA component (first component in crtc pipe line
which read data from DRAM) may be RDMA [1]. It does not support RDMA
reflect function in this patch, so need to do something to protect this
case. Maybe we should check this plane is bind to a crtc whose DMA
component support reflect or not.

[1]
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/gpu/drm/mediatek/mtk_drm_drv.c?h=v5.4-rc6#n133

Regards,
CK

>  	if (!state->crtc)
>  		return 0;
>  
> @@ -132,6 +135,7 @@ static void mtk_plane_atomic_update(struct drm_plane *plane,
>  	state->pending.y = plane->state->dst.y1;
>  	state->pending.width = drm_rect_width(&plane->state->dst);
>  	state->pending.height = drm_rect_height(&plane->state->dst);
> +	state->pending.rotation = plane->state->rotation;
>  	wmb(); /* Make sure the above parameters are set before update */
>  	state->pending.dirty = true;
>  }
> @@ -166,7 +170,12 @@ int mtk_plane_init(struct drm_device *dev, struct drm_plane *plane,
>  		return err;
>  	}
>  
> -	drm_plane_helper_add(plane, &mtk_plane_helper_funcs);
> +	err = drm_plane_create_rotation_property(plane, 0,
> +						 DRM_MODE_ROTATE_0 |
> +						 DRM_MODE_REFLECT_Y);
> +	if (err)
> +		DRM_INFO("Create rotation property failed, continuing...\n");
>  
> +	drm_plane_helper_add(plane, &mtk_plane_helper_funcs);
>  	return 0;
>  }
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_plane.h b/drivers/gpu/drm/mediatek/mtk_drm_plane.h
> index 6f842df722c7..83b634a997cc 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_plane.h
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_plane.h
> @@ -20,6 +20,7 @@ struct mtk_plane_pending_state {
>  	unsigned int			y;
>  	unsigned int			width;
>  	unsigned int			height;
> +	unsigned int			rotation;
>  	bool				dirty;
>  };
>  



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
