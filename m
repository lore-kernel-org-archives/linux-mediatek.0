Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACF85C7619A
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Apr 2023 10:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UWlYQX4Y1ZrzJyCNGQSUMnvOvpF/Z/nFIdYNxxNfrEg=; b=gNfRnIZacmdHgHhBC1M+Xb6qDE
	T8MpnQOxha7cvCdgHyuYDOUB4/p15nVINNbB1ZhdFDsRl4SY6ARU4kuBsjwvgHlYi1vehlcIVlT7I
	tCguavkhPdpuYkpmGRVarkzDpNY/elNex31zloDdUzfZw6ZQY59Ow2W44keRW3kqpX9ZmjV51hUHP
	qy5fKto/QMNGCyOqCeONXGE/q8qjQsR/n5AVtlICgPE0u0U9i8jeWznroMMYaCNTlWbHkDYiww6F5
	lujO3XhC/+Qedd8bDx5tnbRkwbzlHMro5wDr+BKcI2+QHkOPCJfxBRebWY3zqW05ONfVniTh0ZyUO
	06SVUbbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmBIJ-00HJR7-1D;
	Tue, 11 Apr 2023 10:32:11 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmBIF-00HJMR-1w
	for linux-mediatek@lists.infradead.org;
	Tue, 11 Apr 2023 10:32:09 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-3f080f4fbe1so2777685e9.0
        for <linux-mediatek@lists.infradead.org>; Tue, 11 Apr 2023 03:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1681209125; x=1683801125;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UWlYQX4Y1ZrzJyCNGQSUMnvOvpF/Z/nFIdYNxxNfrEg=;
        b=czHW7oszK57m41YR1u+rD3WPMSqPt6wloedBSlnzaMzPEUQ/AHMXNTewQNCzs/8uUD
         IFEphUmtf6E4QUbYANlkCNzJe1Mknn9tNbRgPUXAABh8MhWaBbw1CR71cEdupmHjjTAh
         elfhAUeAnv6GIjWOC7PEKocqH2pcKofnzo9K8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681209125; x=1683801125;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UWlYQX4Y1ZrzJyCNGQSUMnvOvpF/Z/nFIdYNxxNfrEg=;
        b=jmXcpsNdWeho6kdYHp1SQWn5b8s0UPRfCVx79gh/I2dFX6clPPSmy9D6+EluMU0L0c
         LSFHpUO4/l6S5Ioyjo+LNluwAkZFWqHtcCm8HQ55hgmdxQT0+TD54fjnRplmy7eqJSwZ
         iYumRYtm5WJN+VY9YaDqIoiuYlM6hLwpcSKAjRRNBj6wGEo9s+44VN4KCnRNwOioIZAm
         YTmQZhWd/oM12hR4ZsLNEqoFl+EdcZLekiD3DHGoDrrjgOzNHYorwIapZ7CjRdqbpOLD
         Y6GgQqSMZzUFXVw7OKIMRWLqefBYGegBNYjfewWzlwTRFkDpl4e56J/En+SHK1ssXnC5
         fwEg==
X-Gm-Message-State: AAQBX9df1IuYa1ujBzj0r+4B5Wwnhonvdntr5xt23qAEvBn/sAYc1a1Q
	RWrOG92tMe3e0xJNFWTmbgA2rQ==
X-Google-Smtp-Source: AKy350YHW26EoAnUgqXxjoecjfwc/bqx2pfSiH62+M+X8xHeutLKJ3Eqi5SeePtTr8IKBvV/huRCow==
X-Received: by 2002:a5d:50c5:0:b0:2f0:244c:2780 with SMTP id f5-20020a5d50c5000000b002f0244c2780mr4057657wrt.7.1681209125018;
        Tue, 11 Apr 2023 03:32:05 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net. [212.51.149.33])
        by smtp.gmail.com with ESMTPSA id r10-20020adfe68a000000b002c7b229b1basm14182353wrm.15.2023.04.11.03.32.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Apr 2023 03:32:04 -0700 (PDT)
Date: Tue, 11 Apr 2023 12:32:02 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: "Nancy.Lin" <nancy.lin@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com,
	singo.chang@mediatek.com, shawn.sung@mediatek.com
Subject: Re: [PATCH v3 1/2] drm/mediatek: Add mdp_rdma get format function
Message-ID: <ZDU3IiewmLW1pDyn@phenom.ffwll.local>
Mail-Followup-To: "Nancy.Lin" <nancy.lin@mediatek.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	David Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com,
	singo.chang@mediatek.com, shawn.sung@mediatek.com
References: <20230330032614.18837-1-nancy.lin@mediatek.com>
 <20230330032614.18837-2-nancy.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230330032614.18837-2-nancy.lin@mediatek.com>
X-Operating-System: Linux phenom 6.1.0-7-amd64 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230411_033207_644802_0DC5A503 
X-CRM114-Status: GOOD (  18.47  )
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

On Thu, Mar 30, 2023 at 11:26:13AM +0800, Nancy.Lin wrote:
> Add mdp_rdma get_format and get_num_formats function.
> 
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>

The mtk get_formats stuff seems like a lot of midlayering for not much
reasons? Is that really needed?

Just a drive-by questions I had while merging the pr.
-Daniel

> ---
>  drivers/gpu/drm/mediatek/mtk_disp_drv.h |  3 +++
>  drivers/gpu/drm/mediatek/mtk_mdp_rdma.c | 24 ++++++++++++++++++++++++
>  2 files changed, 27 insertions(+)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_drv.h b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
> index 0d28b2e2069c..17b169530beb 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_drv.h
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_drv.h
> @@ -152,4 +152,7 @@ void mtk_mdp_rdma_start(struct device *dev, struct cmdq_pkt *cmdq_pkt);
>  void mtk_mdp_rdma_stop(struct device *dev, struct cmdq_pkt *cmdq_pkt);
>  void mtk_mdp_rdma_config(struct device *dev, struct mtk_mdp_rdma_cfg *cfg,
>  			 struct cmdq_pkt *cmdq_pkt);
> +const u32 *mtk_mdp_rdma_get_formats(struct device *dev);
> +size_t mtk_mdp_rdma_get_num_formats(struct device *dev);
> +
>  #endif
> diff --git a/drivers/gpu/drm/mediatek/mtk_mdp_rdma.c b/drivers/gpu/drm/mediatek/mtk_mdp_rdma.c
> index eecfa98ff52e..e06db6e56b5f 100644
> --- a/drivers/gpu/drm/mediatek/mtk_mdp_rdma.c
> +++ b/drivers/gpu/drm/mediatek/mtk_mdp_rdma.c
> @@ -62,6 +62,20 @@
>  #define RDMA_CSC_FULL709_TO_RGB			5
>  #define RDMA_CSC_BT601_TO_RGB			6
>  
> +static const u32 formats[] = {
> +	DRM_FORMAT_XRGB8888,
> +	DRM_FORMAT_ARGB8888,
> +	DRM_FORMAT_BGRX8888,
> +	DRM_FORMAT_BGRA8888,
> +	DRM_FORMAT_ABGR8888,
> +	DRM_FORMAT_XBGR8888,
> +	DRM_FORMAT_RGB888,
> +	DRM_FORMAT_BGR888,
> +	DRM_FORMAT_RGB565,
> +	DRM_FORMAT_UYVY,
> +	DRM_FORMAT_YUYV,
> +};
> +
>  enum rdma_format {
>  	RDMA_INPUT_FORMAT_RGB565 = 0,
>  	RDMA_INPUT_FORMAT_RGB888 = 1,
> @@ -219,6 +233,16 @@ void mtk_mdp_rdma_config(struct device *dev, struct mtk_mdp_rdma_cfg *cfg,
>  			   MDP_RDMA_MF_CLIP_SIZE, FLD_MF_CLIP_H);
>  }
>  
> +const u32 *mtk_mdp_rdma_get_formats(struct device *dev)
> +{
> +	return formats;
> +}
> +
> +size_t mtk_mdp_rdma_get_num_formats(struct device *dev)
> +{
> +	return ARRAY_SIZE(formats);
> +}
> +
>  int mtk_mdp_rdma_clk_enable(struct device *dev)
>  {
>  	struct mtk_mdp_rdma *rdma = dev_get_drvdata(dev);
> -- 
> 2.18.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

