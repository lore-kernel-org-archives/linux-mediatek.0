Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C09A2C71153
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Aug 2023 17:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0g7jjj3vNpeLfuRVTNngNpoO7bevpCaI/oACADLwRPY=; b=Ergt+X/Zpy4YQC4oAu0xKj6e7J
	9V/HmnFKGxNvNyoJHhPaOFiNtyXKR991yAlufv6468qJwhc2uKL9HiWI+dXCsFs4u5wqQ3o3LkpY0
	Nlur15cf5dgMhoIRXWZ8TMdZEmvsMdv6KcVwK+Gzfq8xla/BTocV98DW9PNXNC4n3yIcKi6L5ucEb
	z1R6e1e05GOgQKEkmMQgMrdbOjFQO7mJH0Ne1Co0I8PdPhm9b/7K3ZOFmmxIxQUpeeJ5sAK00aVYg
	WHkOYnhmsNRjk0F7bHJOkfdtfxbJMLRuRIAv/CbQIIz3H/kMgwT4bkoXk+cHbWgpmjrfRV2wEDyuE
	RGGfSZqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qb2rj-00C0kO-1J;
	Tue, 29 Aug 2023 17:50:59 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qb2rf-00C0jK-1O;
	Tue, 29 Aug 2023 17:50:56 +0000
Received: from notapiano (zone.collabora.co.uk [167.235.23.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 0191466071FD;
	Tue, 29 Aug 2023 18:50:50 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1693331453;
	bh=8DcTnMbWDXxwqColZlQlOY7oUF8gVbQDDNW2xabsrNw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q3R+QoB9Kw2lSCg6+NXqE1Eq6rtXbsdm3PjqUjH3EavQBFElFDJIS+fnaM/I/NsoG
	 kwuL90cxyuNRlGaO1oVhWxUZ09hYXON51/eN1wnpaLhL6W0GDX4B0NFb3uGhDDYEyN
	 ikuK5dpSltaVRUKYrvJCK3ByjsTqJBNhCdJCFkk4itrZc4oHDJu+wi1bZ5fgLgMOMj
	 YbPj6OPVbjwdQDuXqyxIShCcoc20KP9uf961mrDPwlxJg2iGlP3nX3JbArffDR9mXL
	 TPhJ2IDmaRLuwQ84hTZGI2k03KvpzODTVgEuUEkalLauPr35eU6sMpN4MPosBw+3Fj
	 ppWx17RC2WQSQ==
Date: Tue, 29 Aug 2023 13:50:46 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Michael Walle <mwalle@kernel.org>
Subject: Re: [PATCH 2/2] drm/mediatek: dpi/dsi: fix possible_crtcs calculation
Message-ID: <fca464b9-9f32-4420-90fd-05e851871c25@notapiano>
References: <20230829131941.3353439-1-mwalle@kernel.org>
 <20230829131941.3353439-2-mwalle@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230829131941.3353439-2-mwalle@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230829_105055_600529_6A54290E 
X-CRM114-Status: GOOD (  22.43  )
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Jitao Shi <jitao.shi@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, Stu Hsieh <stu.hsieh@mediatek.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, "Nancy . Lin" <nancy.lin@mediatek.com>, linux-mediatek@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, David Airlie <airlied@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Aug 29, 2023 at 03:19:41PM +0200, Michael Walle wrote:
> mtk_drm_find_possible_crtc_by_comp() assumed that the main path will
> always have the CRTC with id 0, the ext id 1 and the third id 2. This
> is only true if the paths are all available. But paths are optional (see
> also comment in mtk_drm_kms_init()), e.g. the main path might not be
> enabled or available at all. Then the CRTC IDs will shift one up, e.g.
> ext will be 1 and the third path will be 2.
> 
> To fix that, dynamically calculate the IDs by the precence of the paths.
> 
> Fixes: 5aa8e7647676 ("drm/mediatek: dpi/dsi: Change the getting possible_crtc way")
> Suggested-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> Signed-off-by: Michael Walle <mwalle@kernel.org>
> ---
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 41 ++++++++++++++-------
>  1 file changed, 27 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> index 771f4e173353..f3064bff64e8 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
> @@ -526,21 +526,34 @@ unsigned int mtk_drm_find_possible_crtc_by_comp(struct drm_device *drm,
>  						struct device *dev)
>  {
>  	struct mtk_drm_private *private = drm->dev_private;
> -	unsigned int ret = 0;
> -
> -	if (mtk_drm_find_comp_in_ddp(dev, private->data->main_path, private->data->main_len,
> -				     private->ddp_comp))
> -		ret = BIT(0);
> -	else if (mtk_drm_find_comp_in_ddp(dev, private->data->ext_path,
> -					  private->data->ext_len, private->ddp_comp))
> -		ret = BIT(1);
> -	else if (mtk_drm_find_comp_in_ddp(dev, private->data->third_path,
> -					  private->data->third_len, private->ddp_comp))
> -		ret = BIT(2);
> -	else
> -		DRM_INFO("Failed to find comp in ddp table\n");
> +	int i = 0;
> +
> +	if (private->data->main_path) {
> +		if (mtk_drm_find_comp_in_ddp(dev, private->data->main_path,
> +					     private->data->main_len,
> +					     private->ddp_comp))
> +			return BIT(i);
> +		i++;
> +	}
> +
> +	if (private->data->ext_path) {
> +		if (mtk_drm_find_comp_in_ddp(dev, private->data->ext_path,
> +					     private->data->ext_len,
> +					     private->ddp_comp))
> +			return BIT(i);
> +		i++;

This won't work. On MT8195 there are two display IPs, vdosys0 and vdosys1,
vdosys0 only has the main path while vdosys1 only has the external path. So you
need to loop over each one in all_drm_private[j] to get the right crtc ID for
MT8195.

Thanks,
Nícolas

