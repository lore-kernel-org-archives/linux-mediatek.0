Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D74FDC636D6
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Feb 2023 16:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:MIME-Version:In-Reply-To:References:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+lujNOKm++OPcngOcRGWEnMWSJ9dfFfJMQ8v/5cWU2M=; b=jcXZ3UTS6Lc1Cp+/YfIJ5jz7NL
	SiMP9n/K/3ZCjMIVE+aKd/eMDFdkDOWuzaGwtBlstq7fDvSdZdnpwm9HC9gTTT8stJWlKgiHxSsKD
	qPltBTXTYhXtYs7ByZgw5mPv0o1lsLGigGsFJQmYFtsUG7h0Zcf/EQNRMzi+wMYdGsri+4aeHUDBs
	DJadqXrthd8Iecg0alq61kHScEjjKNFhPUJW2Qluoag/YHuj4/ddVkNlPz/8TAhcKz1MAjNL5p/s4
	3VD02OLBE5ECXieDgtdZVFEzdCxl8dYiyl/wuAQ6ISPeJVi6cuxHIsh1paWf7kr4Yflhsl/w5JvNl
	Qj2l0/cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pT3yA-00F9Sg-Fs; Fri, 17 Feb 2023 16:52:22 +0000
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pT3y1-00F9OH-KS
	for linux-mediatek@lists.infradead.org; Fri, 17 Feb 2023 16:52:15 +0000
Received: by mail-qt1-x836.google.com with SMTP id d10so1389952qtr.12
        for <linux-mediatek@lists.infradead.org>; Fri, 17 Feb 2023 08:52:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:mime-version:in-reply-to:references
         :user-agent:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+lujNOKm++OPcngOcRGWEnMWSJ9dfFfJMQ8v/5cWU2M=;
        b=ngjtQMSncLTvKcktN401ducOT2ym3TeRYm/owld99p8jhnZImVtVzULGekSPv1UXIm
         OYUR+6zJLcoqpQ3SK1+YGsYOZGHP7G06I+dVyn3eFXymFBlYubmrqDyWr0h5EipMf5Fb
         8vHSWYytKku+pDEhg8TeJaA2A8Phn3t2WIoy1UR6NLgN0A8zMeAfpUlRnciC2NiGEInq
         iTaBzZkiiiuvuAYcSUkHc8VwnUhyV9l2/uv9aQu/k7ieEX2bPdWyWqKLchl91l8rhKxg
         FxGFGIqpdJREmO+/gXFcYffV8BBAnaQyB3xMz3/Xp7Vu1HBmgF8WO2TTADjYA8Yaeduc
         jaUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:mime-version:in-reply-to:references
         :user-agent:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+lujNOKm++OPcngOcRGWEnMWSJ9dfFfJMQ8v/5cWU2M=;
        b=1Ed6SueQay06MViaPCZSgMqCFYvIuJc5JBcdGJ4QuIRHblkdtYEClv+ALtA5xkYznV
         j0teccdHiDC35f0j1m+muhhB4/sgPhJDRiB+A/XgWTbSpDtrC9fs5S0o8Ovs24Pq2i/a
         UwbBFhj5Dk00ubIZW+9VJOpGiC0oE1PyIFddB1eU4u8xlEz9fHXgeaxqOFNLDpZ/iBuY
         FOqqu57AFannjPHw3PS9TKJtUtsxFUt+9nLQiQX4LyAlq9kQQBuKGTnaIMe7bNECK7f2
         hJ1v6c2+km37m/Fee8g2K37sbwk6ULeUOIXLRCkFRy+QWgEs5X9XvDZWZLK/t/h1FCXe
         zA1A==
X-Gm-Message-State: AO0yUKW4PemmKDRj9OLr0Hdw8RGoSDOPYjLc8WKeqEwZm6dTDrRgSgJh
	LwuSTfs59IKttUgkkvs+j/vdPKx4wLX8B+IFIZfwx5bEC7sJB3OV
X-Google-Smtp-Source: AK7set+fHsj9+KPNXoSNbR9V4av/+GsFWw2XClP2/z4uYd0e4fwI9/unNMmK0pPDEJ42UCz43Q3TPjOpjzE9S+/9Y9E=
X-Received: by 2002:a05:622a:1f98:b0:3ba:1506:f2 with SMTP id
 cb24-20020a05622a1f9800b003ba150600f2mr963995qtb.2.1676652720158; Fri, 17 Feb
 2023 08:52:00 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 17 Feb 2023 08:51:59 -0800
From: Guillaume Ranquet <granquet@baylibre.com>
User-Agent: meli 0.7.2
References: <20221227081011.6426-1-nancy.lin@mediatek.com> <20221227081011.6426-5-nancy.lin@mediatek.com>
In-Reply-To: <20221227081011.6426-5-nancy.lin@mediatek.com>
MIME-Version: 1.0
Date: Fri, 17 Feb 2023 08:51:59 -0800
Message-ID: <CABnWg9s1L2Gk5EfNW22HUJVTCnFyo+YvrjQL16XqyLYEf20Fyg@mail.gmail.com>
Subject: Re: [PATCH v29 4/7] drm/mediatek: add dma dev get function
To: linux-mediatek@lists.infradead.org, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Matthias Brugger <matthias.bgg@gmail.com>, krzysztof.kozlowski+dt@linaro.org
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, CK Hu <ck.hu@mediatek.com>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	clang-built-linux@googlegroups.com, 
	Project_Global_Chrome_Upstream_Group@mediatek.com, singo.chang@mediatek.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230217_085213_675951_352C1C23 
X-CRM114-Status: GOOD (  13.40  )
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

On Tue, 27 Dec 2022 09:10, "" wrote:
>This is a preparation for adding support for the ovl_adaptor sub driver
>Ovl_adaptor is a DRM sub driver, which doesn't have dma dev. Add
>dma_dev_get function for getting representative dma dev in ovl_adaptor.
>
>Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
>Reviewed-by: AngeloGioachino Del Regno <angelogioacchino.delregno@collabora.com>
>Reviewed-by: CK Hu <ck.hu@mediatek.com>
>Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>Tested-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
>---
> drivers/gpu/drm/mediatek/mtk_drm_crtc.c     | 15 +++++++++++++++
> drivers/gpu/drm/mediatek/mtk_drm_crtc.h     |  1 +
> drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |  8 ++++++++
> 3 files changed, 24 insertions(+)
>
>diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
>index 112615817dcb..78e20f604158 100644
>--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
>+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
>@@ -58,6 +58,7 @@ struct mtk_drm_crtc {
> #endif
>
> 	struct device			*mmsys_dev;
>+	struct device			*dma_dev;
> 	struct mtk_mutex		*mutex;
> 	unsigned int			ddp_comp_nr;
> 	struct mtk_ddp_comp		**ddp_comp;
>@@ -865,6 +866,13 @@ static int mtk_drm_crtc_init_comp_planes(struct drm_device *drm_dev,
> 	return 0;
> }
>
>+struct device *mtk_drm_crtc_dma_dev_get(struct drm_crtc *crtc)
>+{
>+	struct mtk_drm_crtc *mtk_crtc = to_mtk_crtc(crtc);
>+
>+	return mtk_crtc->dma_dev;
>+}

While testing out the HDMI patchset for i1200, I've ended up with a
panic here with crtc being NULL.

I've fixed the issue on my side by testing crtc prior doing anything
in that function.

Not sure this is the proper fix.

HTH,
Guillaume.

>+
> int mtk_drm_crtc_create(struct drm_device *drm_dev,
> 			const enum mtk_ddp_comp_id *path, unsigned int path_len)
> {
>@@ -953,6 +961,13 @@ int mtk_drm_crtc_create(struct drm_device *drm_dev,
> 			return ret;
> 	}
>
>+	/*
>+	 * Default to use the first component as the dma dev.
>+	 * In the case of ovl_adaptor sub driver, it needs to use the
>+	 * dma_dev_get function to get representative dma dev.
>+	 */
>+	mtk_crtc->dma_dev = mtk_ddp_comp_dma_dev_get(&priv->ddp_comp[path[0]]);
>+
> 	ret = mtk_drm_crtc_init(drm_dev, mtk_crtc, pipe);
> 	if (ret < 0)
> 		return ret;
>diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.h b/drivers/gpu/drm/mediatek/mtk_drm_crtc.h
>index cb9a36c48d4f..f5a6e80c5265 100644
>--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.h
>+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.h
>@@ -22,5 +22,6 @@ int mtk_drm_crtc_plane_check(struct drm_crtc *crtc, struct drm_plane *plane,
> 			     struct mtk_plane_state *state);
> void mtk_drm_crtc_async_update(struct drm_crtc *crtc, struct drm_plane *plane,
> 			       struct drm_atomic_state *plane_state);
>+struct device *mtk_drm_crtc_dma_dev_get(struct drm_crtc *crtc);
>
> #endif /* MTK_DRM_CRTC_H */
>diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
>index 2d0052c23dcb..364f3f7f59fa 100644
>--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
>+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
>@@ -71,6 +71,7 @@ struct mtk_ddp_comp_funcs {
> 	void (*bgclr_in_off)(struct device *dev);
> 	void (*ctm_set)(struct device *dev,
> 			struct drm_crtc_state *state);
>+	struct device * (*dma_dev_get)(struct device *dev);
> };
>
> struct mtk_ddp_comp {
>@@ -203,6 +204,13 @@ static inline void mtk_ddp_ctm_set(struct mtk_ddp_comp *comp,
> 		comp->funcs->ctm_set(comp->dev, state);
> }
>
>+static inline struct device *mtk_ddp_comp_dma_dev_get(struct mtk_ddp_comp *comp)
>+{
>+	if (comp->funcs && comp->funcs->dma_dev_get)
>+		return comp->funcs->dma_dev_get(comp->dev);
>+	return comp->dev;
>+}
>+
> int mtk_ddp_comp_get_id(struct device_node *node,
> 			enum mtk_ddp_comp_type comp_type);
> unsigned int mtk_drm_find_possible_crtc_by_comp(struct drm_device *drm,
>--
>2.18.0
>
>

