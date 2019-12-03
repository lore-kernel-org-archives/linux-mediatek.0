Return-Path: <SRS0=/i6S=ZZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CE45C432C3
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Dec 2019 07:07:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D53F8206DF
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Dec 2019 07:07:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WaLi2cMs";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Ne4eNhxw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D53F8206DF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+QtuRlt0lTleEQL9g+1Rj5taXLUm/hTny4kkqKnHrxs=; b=WaLi2cMs2t7tpv
	H1q82hxf0yYYwXS02MqCshonNQB9bsjjNFWJckWbdO9c7Uc44lPXQeoXzRk5JkGDkr0JuqUiYrNLh
	J/1Hz19jpqaY5HqrmXIoMi69LZxqEFT+57TLiAdFcHNlUiPGeyEAmlCqWf93hTAWmcRtnAhC+yeLz
	ZyJDQiuhSpzXibYz+FPKsHgZNLvdU78l4N6RWE3WYXP6WLkbPbjJsdAfGtUfHIs0iflFwK2YNS63Q
	HWVWLQY8VGw+yVjHZQdgPwcHTRQvRWaRgxGzzeSwJFVwzSjiZMRHc2Jjsd+0Ys0wARyZ2YSYqf1Sh
	1HN0AZECWA3H9jLKhDdQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ic2HU-0003Ot-Ct; Tue, 03 Dec 2019 07:07:32 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ic2HL-0003FZ-C1; Tue, 03 Dec 2019 07:07:26 +0000
X-UUID: 50f72e20cbc44f9ca2846d6f6b16da09-20191202
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=a2/k+pZCKbnpnNDdJ057Q34lgkPRSTIuTEW5pkAOW5I=; 
 b=Ne4eNhxwxdnmHThN7lSHpTXH59VW01C+njh2X0pGkcw4idOj35DVB3VxC2qcJOL/PzXLZlyLqQqF7BbBjVlb9bH7XQamHcgYlfYxrzkCPO0G/LnlYZ1bTWsKzxhjcoaQOk2x847KHBEnhJrKjnf0FMzA4JoqFHuNqJbqoxVNxXo=;
X-UUID: 50f72e20cbc44f9ca2846d6f6b16da09-20191202
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1365975204; Mon, 02 Dec 2019 23:07:17 -0800
Received: from MTKMBS31DR.mediatek.inc (172.27.6.102) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 2 Dec 2019 23:07:58 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 MTKMBS31DR.mediatek.inc (172.27.6.102) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 3 Dec 2019 15:06:49 +0800
Received: from [172.21.77.4] (172.21.77.4) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Tue, 3 Dec 2019 15:06:53 +0800
Message-ID: <1575356831.22432.7.camel@mtksdaap41>
Subject: Re: [PATCH v1, 2/2] drm/mediatek: Fix external display vblank
 timeout issue
From: CK Hu <ck.hu@mediatek.com>
To: <yongqiang.niu@mediatek.com>
Date: Tue, 3 Dec 2019 15:07:11 +0800
In-Reply-To: <1574817475-22378-3-git-send-email-yongqiang.niu@mediatek.com>
References: <1574817475-22378-1-git-send-email-yongqiang.niu@mediatek.com>
 <1574817475-22378-3-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 92258CFB5CB2D6F8CD1B7935ED5D6D036C039F473DD1311588CF292D18E5CE3E2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191202_230723_425032_38E112BB 
X-CRM114-Status: GOOD (  19.51  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi, Yongqiang:

I would like the title could clearly express what does this patch do. I
think what this patch do is to implement prepare/unprepare interface for
dpi driver. And you could describe why do this in commit message.


On Wed, 2019-11-27 at 09:17 +0800, yongqiang.niu@mediatek.com wrote:
> From: Yongqiang Niu <yongqiang.niu@mediatek.com>
> 
> Fix external display vblank timeout issue

I think you move dpi_power_on to more early stage. But why this would
fix vblank timeout. Please describe more about this so that I would
agree this patch. 

This is a bug fix, so please add a 'Fixes' tag.

> 
> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_dpi.c          | 14 +++++++++-----
>  drivers/gpu/drm/mediatek/mtk_drm_crtc.c     |  6 ++++++
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h | 14 ++++++++++++++
>  3 files changed, 29 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
> index be6d95c..38cabbe 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> @@ -387,8 +387,12 @@ static int mtk_dpi_power_on(struct mtk_dpi *dpi)
>  {
>  	int ret;
>  
> -	if (++dpi->refcount != 1)
> +	if (++dpi->refcount != 1) {
> +		dev_warn(dpi->dev, "%s refcount: %d\n", __func__, dpi->refcount);
>  		return 0;
> +	}
> +
> +	DRM_DEBUG_DRIVER("%s refcount %d\n", __func__, dpi->refcount);
>  
>  	ret = clk_prepare_enable(dpi->engine_clk);
>  	if (ret) {
> @@ -563,14 +567,14 @@ static int mtk_dpi_atomic_check(struct drm_encoder *encoder,
>  	.atomic_check = mtk_dpi_atomic_check,
>  };
>  
> -static void mtk_dpi_start(struct mtk_ddp_comp *comp)
> +static void mtk_dpi_prepare(struct mtk_ddp_comp *comp)
>  {
>  	struct mtk_dpi *dpi = container_of(comp, struct mtk_dpi, ddp_comp);
>  
>  	mtk_dpi_power_on(dpi);
>  }
>  
> -static void mtk_dpi_stop(struct mtk_ddp_comp *comp)
> +static void mtk_dpi_unprepare(struct mtk_ddp_comp *comp)
>  {
>  	struct mtk_dpi *dpi = container_of(comp, struct mtk_dpi, ddp_comp);
>  
> @@ -578,8 +582,8 @@ static void mtk_dpi_stop(struct mtk_ddp_comp *comp)
>  }
>  
>  static const struct mtk_ddp_comp_funcs mtk_dpi_funcs = {
> -	.start = mtk_dpi_start,
> -	.stop = mtk_dpi_stop,
> +	.prepare = mtk_dpi_prepare,
> +	.unprepare = mtk_dpi_unprepare,
>  };
>  
>  static int mtk_dpi_bind(struct device *dev, struct device *master, void *data)
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> index 7eca02f..a6d3d97 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> @@ -345,6 +345,9 @@ static int mtk_crtc_ddp_hw_init(struct mtk_drm_crtc *mtk_crtc)
>  		return ret;
>  	}
>  
> +	for (i = 0; i < mtk_crtc->ddp_comp_nr; i++)
> +		mtk_ddp_comp_prepare(mtk_crtc->ddp_comp[i]);
> +
>  	ret = mtk_disp_mutex_prepare(mtk_crtc->mutex);
>  	if (ret < 0) {
>  		DRM_ERROR("Failed to enable mutex clock: %d\n", ret);
> @@ -434,6 +437,9 @@ static void mtk_crtc_ddp_hw_fini(struct mtk_drm_crtc *mtk_crtc)
>  	mtk_crtc_ddp_clk_disable(mtk_crtc);
>  	mtk_disp_mutex_unprepare(mtk_crtc->mutex);
>  
> +	for (i = 0; i < mtk_crtc->ddp_comp_nr; i++)
> +		mtk_ddp_comp_unprepare(mtk_crtc->ddp_comp[i]);
> +
>  	pm_runtime_put(drm->dev);
>  
>  	if (crtc->state->event && !crtc->state->active) {
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> index 5b0a3d4..097b90d 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> @@ -78,6 +78,8 @@ struct mtk_ddp_comp_funcs {
>  	void (*stop)(struct mtk_ddp_comp *comp);
>  	void (*enable_vblank)(struct mtk_ddp_comp *comp, struct drm_crtc *crtc);
>  	void (*disable_vblank)(struct mtk_ddp_comp *comp);
> +	void (*prepare)(struct mtk_ddp_comp *comp);
> +	void (*unprepare)(struct mtk_ddp_comp *comp);
>  	unsigned int (*supported_rotations)(struct mtk_ddp_comp *comp);
>  	unsigned int (*layer_nr)(struct mtk_ddp_comp *comp);
>  	void (*layer_on)(struct mtk_ddp_comp *comp, unsigned int idx,
> @@ -117,6 +119,18 @@ static inline void mtk_ddp_comp_config(struct mtk_ddp_comp *comp,
>  		comp->funcs->config(comp, w, h, vrefresh, bpc, cmdq_pkt);
>  }
>  
> +static inline void mtk_ddp_comp_prepare(struct mtk_ddp_comp *comp)
> +{
> +	if (comp->funcs && comp->funcs->prepare)
> +		comp->funcs->prepare(comp);
> +}
> +
> +static inline void mtk_ddp_comp_unprepare(struct mtk_ddp_comp *comp)
> +{
> +	if (comp->funcs && comp->funcs->unprepare)
> +		comp->funcs->unprepare(comp);
> +}
> +
>  static inline void mtk_ddp_comp_start(struct mtk_ddp_comp *comp)
>  {
>  	if (comp->funcs && comp->funcs->start)

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
