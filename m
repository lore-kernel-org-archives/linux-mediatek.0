Return-Path: <SRS0=ZZ2m=JU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8173DC433B4
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Apr 2021 01:34:06 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7D3706143B
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Apr 2021 01:34:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7D3706143B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:CC:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=NYsFuv5++MwGI5gtBRO6ix+Ds6hTT+JENbIc/we2jrk=; b=iqIi8TmBv4sTXVVekVZwp+sFO
	MoJMzdD1FKYhIOxE6CnrnbwkpG74N3xo0WtKtx267BWDpcrk0XDDST0KAciwbqgkG1jyVsalhkTUf
	nPESg0lwWsLXNVIpPWgpUwtgVAVNGpPVAH2U4XE9Yctayg3D6r941RTYzNtSAhY8XqtY5//wQV+xj
	IWjgiXA8eQUGqDD/4fZGh/mMWQvh6VOYOP37J7JT6qPIdPfw6oUmOGPGKVMCsomh6v3fmOA2u6ONp
	sEcp3jqQ+F85vXjxXO9hNGG0FMcK6Tdp/Yhr1iHuIXBJgpHzabYJzSIwhstap1paFiGWTRyi1EKiF
	ePg6W1h0g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZkhZ-000HOG-Cc; Fri, 23 Apr 2021 01:33:49 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZkdp-000H9X-Oc; Fri, 23 Apr 2021 01:30:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=uPI3I76ev2hEGW8ViAx+aH2J2P8PkgKs+WekwKZHjwA=; b=nO+szj0gsyzDO8IKdxZohB8lWw
 3lIjsLXBkhZYNIcYFA9A0yzZYy+tGqSp7MKSpOoPg+vTQWpY/TcfYc7GWt5fxbX+n9ePtHbWHYCj5
 W2xsy9prfpxbN5x1f6uYDfLiVQ8xvxtCf4c31SeRhqeIqJRVA1m5Rypp8OmG2k4e2S+x5lER1/3Yp
 xRzBmKbBoGWJAbN4OYcZY+hu8JW+AyV57C7BnAZXBOI20ryTup7Tt6TYVmMKlJVzKGeEPsZi3gF92
 Wi8xOqds4Zb0BjN9c+8QG5MFfauN8Skt9dZdrfLotRm51yBuAkpoxayRy8jM4UJyqZ36ICQ1U1UhY
 SoEZdHYA==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZkdj-00E5Ad-27; Fri, 23 Apr 2021 01:29:55 +0000
X-UUID: 223381657915458e8d847153ebb967a2-20210422
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=uPI3I76ev2hEGW8ViAx+aH2J2P8PkgKs+WekwKZHjwA=; 
 b=fvJFxGoKt/dhGUV0b8f8Due0px808hgWCEMSykyNinpn2PL597pXqsUgLI2x9LCfmAPs917ZKksRVKYKN4ivN5pbA2bruXSfBVoU39F2CazwFF2tmq+LctxoKEYceE3DOmyIASNP5JWYWO/Fkt1QCfaV8G/S5VgteMY3sp7WRHw=;
X-UUID: 223381657915458e8d847153ebb967a2-20210422
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 203346969; Thu, 22 Apr 2021 18:29:45 -0700
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 22 Apr 2021 18:29:43 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 23 Apr 2021 09:29:41 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 23 Apr 2021 09:29:41 +0800
Message-ID: <1619141381.28327.8.camel@mtksdaap41>
Subject: Re: [PATCH] drm/mediatek: clear pending flag when cmdq packet is done.
From: CK Hu <ck.hu@mediatek.com>
To: Hsin-Yi Wang <hsinyi@chromium.org>
CC: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, "Dennis YC
 Hsieh" <dennis-yc.hsieh@mediatek.com>, Jassi Brar
 <jaswinder.singh@linaro.org>, <dri-devel@lists.freedesktop.org>,
 <linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>
Date: Fri, 23 Apr 2021 09:29:41 +0800
In-Reply-To: <20210422111004.1338867-1-hsinyi@chromium.org>
References: <20210422111004.1338867-1-hsinyi@chromium.org>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210422_182952_553176_52B8442E 
X-CRM114-Status: GOOD (  22.65  )
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

Hi, Hsin-yi:

On Thu, 2021-04-22 at 19:10 +0800, Hsin-Yi Wang wrote:
> From: CK Hu <ck.hu@mediatek.com>
> 
> In cmdq mode, packet may be flushed before it is executed, so
> the pending flag should be cleared after cmdq packet is done.
> 
> Signed-off-by: CK Hu <ck.hu@mediatek.com>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
>  drivers/gpu/drm/mediatek/mtk_drm_crtc.c  | 56 +++++++++++++++++++++---
>  include/linux/mailbox/mtk-cmdq-mailbox.h |  1 +
>  2 files changed, 51 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> index 40df2c823187..051bf0eb00d3 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> @@ -224,6 +224,45 @@ struct mtk_ddp_comp *mtk_drm_ddp_comp_for_plane(struct drm_crtc *crtc,
>  #if IS_REACHABLE(CONFIG_MTK_CMDQ)
>  static void ddp_cmdq_cb(struct cmdq_cb_data data)
>  {
> +	struct cmdq_pkt *pkt = (struct cmdq_pkt *)data.data;
> +	struct mtk_drm_crtc *mtk_crtc = (struct mtk_drm_crtc *)pkt->crtc;
> +	struct mtk_crtc_state *state = to_mtk_crtc_state(mtk_crtc->base.state);
> +	unsigned int i;
> +
> +	if (data.sta == CMDQ_CB_ERROR)

I prefer use standard error status instead of proprietary one, so I send
a patch [1]. I would like this patch depend on [1].

[1]
https://patchwork.kernel.org/project/linux-mediatek/patch/20210314233323.23377-2-chunkuang.hu@kernel.org/

> +		goto destroy_pkt;
> +
> +	if (state->pending_config) {
> +		state->pending_config = false;
> +	}
> +
> +	if (mtk_crtc->pending_planes) {
> +		for (i = 0; i < mtk_crtc->layer_nr; i++) {
> +			struct drm_plane *plane = &mtk_crtc->planes[i];
> +			struct mtk_plane_state *plane_state;
> +
> +			plane_state = to_mtk_plane_state(plane->state);
> +
> +			if (plane_state->pending.config)
> +				plane_state->pending.config = false;
> +		}
> +		mtk_crtc->pending_planes = false;
> +	}
> +
> +	if (mtk_crtc->pending_async_planes) {
> +		for (i = 0; i < mtk_crtc->layer_nr; i++) {
> +			struct drm_plane *plane = &mtk_crtc->planes[i];
> +			struct mtk_plane_state *plane_state;
> +
> +			plane_state = to_mtk_plane_state(plane->state);
> +
> +			if (plane_state->pending.async_config)
> +				plane_state->pending.async_config = false;
> +		}
> +		mtk_crtc->pending_async_planes = false;
> +	}
> +
> +destroy_pkt:
>  	cmdq_pkt_destroy(data.data);
>  }
>  #endif
> @@ -377,8 +416,8 @@ static void mtk_crtc_ddp_config(struct drm_crtc *crtc,
>  				    state->pending_height,
>  				    state->pending_vrefresh, 0,
>  				    cmdq_handle);
> -
> -		state->pending_config = false;
> +		if (!cmdq_handle)
> +			state->pending_config = false;
>  	}
>  
>  	if (mtk_crtc->pending_planes) {
> @@ -398,9 +437,11 @@ static void mtk_crtc_ddp_config(struct drm_crtc *crtc,
>  				mtk_ddp_comp_layer_config(comp, local_layer,
>  							  plane_state,
>  							  cmdq_handle);
> -			plane_state->pending.config = false;
> +			if (!cmdq_handle)
> +				plane_state->pending.config = false;
>  		}
> -		mtk_crtc->pending_planes = false;
> +		if (!cmdq_handle)
> +			mtk_crtc->pending_planes = false;
>  	}
>  
>  	if (mtk_crtc->pending_async_planes) {
> @@ -420,9 +461,11 @@ static void mtk_crtc_ddp_config(struct drm_crtc *crtc,
>  				mtk_ddp_comp_layer_config(comp, local_layer,
>  							  plane_state,
>  							  cmdq_handle);
> -			plane_state->pending.async_config = false;
> +			if (!cmdq_handle)
> +				plane_state->pending.async_config = false;
>  		}
> -		mtk_crtc->pending_async_planes = false;
> +		if (!cmdq_handle)
> +			mtk_crtc->pending_async_planes = false;
>  	}
>  }
>  
> @@ -475,6 +518,7 @@ static void mtk_drm_crtc_update_config(struct mtk_drm_crtc *mtk_crtc,
>  		cmdq_pkt_wfe(cmdq_handle, mtk_crtc->cmdq_event, false);
>  		mtk_crtc_ddp_config(crtc, cmdq_handle);
>  		cmdq_pkt_finalize(cmdq_handle);
> +		cmdq_handle->crtc = mtk_crtc;
>  		cmdq_pkt_flush_async(cmdq_handle, ddp_cmdq_cb, cmdq_handle);
>  	}
>  #endif
> diff --git a/include/linux/mailbox/mtk-cmdq-mailbox.h b/include/linux/mailbox/mtk-cmdq-mailbox.h
> index d5a983d65f05..c06b14ec03e5 100644
> --- a/include/linux/mailbox/mtk-cmdq-mailbox.h
> +++ b/include/linux/mailbox/mtk-cmdq-mailbox.h
> @@ -90,6 +90,7 @@ struct cmdq_pkt {
>  	struct cmdq_task_cb	cb;
>  	struct cmdq_task_cb	async_cb;
>  	void			*cl;
> +	void			*crtc;

Not all client need crtc, so I would like to use another structure to
include cmdq_pkt and crtc and cast that structure to cmdq_pkt. I have a
plan to use mailbox rx_callback instead of cmdq_task_cb [2] (not
upstreamed yet), and it is an example that crtc include cmdq_pkt. To
upstream [2] would take a long time, you could choose to depend on [2]
or not.

[2]
https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/commit/?h=mediatek-cmdq&id=2c3289b1550ea1105a02750928df738753ddf8e1

Regards,
CK

>  };
>  
>  u8 cmdq_get_shift_pa(struct mbox_chan *chan);

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
