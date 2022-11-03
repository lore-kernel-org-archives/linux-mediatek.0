Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 942EFC433FE
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Nov 2022 21:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0LtHN9ebKoXgbIhYW5VspWV9kpGgGCiRA3q0gUA4nvg=; b=Nqj+1qUCgXtleOfwb4o+xp29SG
	tVxtC0L7T0uDewLVvJ73eyFWC+cgF8yVfvnm70l4F3HQeEr7O91LbmoM0jarxly44galnIT2vYokX
	drLkiy+bwvmc2+TTg0dIyXM+Q+P8lAe0fwvRdn24tWNRbuig/xzxnoTsTju1f/cKwVk+Lbpdwr8hz
	8K4ySprfKKylCT52WeHVaB/5SZqpNvnjt41J1Gn6RgfQxY2Jy4DU03ykkhI5w8POL1PRotDcMhgpk
	aMF1ERbt/YZ5jz6H4QcYHIG/ga6nmn5I5trNf5FjtQWC8TWzGMTJ2jwe9kJ0CoiTDUdUfE3Y6y2TW
	4j7SABOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqhl6-001knD-7f; Thu, 03 Nov 2022 21:28:20 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqhku-001klE-HO; Thu, 03 Nov 2022 21:28:10 +0000
Received: from notapiano (unknown [IPv6:2600:4041:5b1a:cd00:524d:e95d:1a9c:492a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id B5E7B6602962;
	Thu,  3 Nov 2022 21:28:04 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1667510886;
	bh=Bo6jAy9n7EIhWM93CDe2w2Ldd+vTyxvumeVAJrhRaig=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b0WJzCft7a5ZU1yL7SAlojfM2J+IppIcj0zQTcbb8pxyMVeyXLAVv3qWzQjUhxd0e
	 P3q4fyK3Bm2btG0ROUqy0jkxR0SxW02pdciQQpSYXkrL60pupIlzUHbUtUUGYD+q5E
	 q/5sSIdsFObiLXgH8pP9g67nLHAceARjocg06/z+uSuzorjo8+0irx1w+s2Xk7Ujcm
	 UmmS0Bem2aJVxw0Ze2BZe9WXhdDxw/F4R69QT7KGNtdrOAv1QcRnFZLSqeFQuBsIeJ
	 Al6WX/lm8O5B8VtxsP5Wswwi+gN6GUK1lOSG47tPrma/eorY5/VVKIYKEtnKmOBlUa
	 P73ztZIw+DJpw==
Date: Thu, 3 Nov 2022 17:28:00 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: "Nancy.Lin" <nancy.lin@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, wim@linux-watchdog.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux@roeck-us.net, David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	"jason-jh . lin" <jason-jh.lin@mediatek.com>,
	Yongqiang Niu <yongqiang.niu@mediatek.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
	llvm@lists.linux.dev, singo.chang@mediatek.com,
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v27 6/7] drm/mediatek: add drm ovl_adaptor sub driver for
 MT8195
Message-ID: <20221103212800.43nxlxpconqkasvc@notapiano>
References: <20221103032610.9217-1-nancy.lin@mediatek.com>
 <20221103032610.9217-7-nancy.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221103032610.9217-7-nancy.lin@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221103_142808_738844_141C4FF4 
X-CRM114-Status: GOOD (  15.25  )
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

On Thu, Nov 03, 2022 at 11:26:09AM +0800, Nancy.Lin wrote:
> Add drm ovl_adaptor sub driver. Bring up ovl_adaptor sub driver if
> the component exists in the path.
> 
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Tested-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> Tested-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> Change-Id: I0501f3c80e78ec8279366cba9c137a2edd7a852e
> ---
>  drivers/gpu/drm/mediatek/mtk_drm_crtc.c     |  61 ++++-----
>  drivers/gpu/drm/mediatek/mtk_drm_crtc.h     |   2 +-
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 129 ++++++++++++--------
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h |  50 +++++++-
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c      |  78 ++++++------
>  drivers/gpu/drm/mediatek/mtk_drm_drv.h      |  12 +-
>  6 files changed, 209 insertions(+), 123 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> index 30dcb65d8a5a..ce5617ad04cb 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
[..]
>  int mtk_drm_crtc_create(struct drm_device *drm_dev,
> -			const enum mtk_ddp_comp_id *path, unsigned int path_len,
> +			const unsigned int *path, unsigned int path_len,

Hi Nancy,

why is 'enum mtk_ddp_comp_id' being changed to 'unsigned int' throughout this
patch? Was this intentional?

I saw that this change happened between v16 [1] and v17 [2], but I didn't see
any reply or mention about this in the commit message or cover letter.

Thanks,
Nícolas

[1] https://lore.kernel.org/all/20220318142009.2796-21-nancy.lin@mediatek.com/
[2] https://lore.kernel.org/all/20220416020749.29010-20-nancy.lin@mediatek.com/

