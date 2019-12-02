Return-Path: <SRS0=7Wwy=ZY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABC24C432C0
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Dec 2019 05:27:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8152B20881
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Dec 2019 05:27:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="COh8aAz8";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="eXjKCPqa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8152B20881
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KM3+T+3oXsymBo0hQX45cGA2UVCN3E7gtGrLlNQyA+Y=; b=COh8aAz8aXuR8V
	l7MYcN+IocG0HDbg7/WR6+QTt2po4L+8q6K237sQ2l/UMnKmmV+JW3tFG/2pqPHmZ1+rDtbYJBTLk
	ZwO5RKxkXYMx271mjqHhwntair9nqxN08xexwAxW6+b2wGQ68lZZnCCONm6+NdGAcoNdtZt6GuTR/
	21WngvKReeMnXgN7wsUnQFtHITjSGfE3KuLxhVEOcADMW2bXWDDk1zg5QIiSfCAMLkNEGZU177zIp
	7hovEdl6whUwiYnY6HtzhEtdDTbnxyqUajrWV2orVEbKfmRYG9V12ZEha41cpa9C5RDlzMmBaVhBi
	upS36SiNGt3qNUZEJQ/w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ibeFY-0004VB-3W; Mon, 02 Dec 2019 05:27:56 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ibeFS-0004Qs-Cu; Mon, 02 Dec 2019 05:27:52 +0000
X-UUID: 7e76a57359354015a90fc1c4d5e4c45c-20191201
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=nHyM0wlDNnnCgrZ3XeFFZizqAnSwx9cK7hjQY20Jc9Q=; 
 b=eXjKCPqaIe1pirlqnlQVTpvo1S6AgRapAviK2OyFlcb1Bx5MBaPcfXsEVGH8FWRfWeo52oSSRXy5widrOcSuA7S/jpivUYHrmrREICaonpbHZ19mAAluQlnPR7uTW1tlrfo6sfK4m+UU4kQayEXAsa8qPC8ZH7xwu9ZSlXBGYp4=;
X-UUID: 7e76a57359354015a90fc1c4d5e4c45c-20191201
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1204004876; Sun, 01 Dec 2019 21:27:30 -0800
Received: from MTKMBS31DR.mediatek.inc (172.27.6.102) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Sun, 1 Dec 2019 21:24:44 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 MTKMBS31DR.mediatek.inc (172.27.6.102) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 2 Dec 2019 13:24:13 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Mon, 2 Dec 2019 13:24:14 +0800
Message-ID: <1575264270.16063.0.camel@mtksdaap41>
Subject: Re: [PATCH] drm/mediatek: Fix can't get component for external
 display plane.
From: CK Hu <ck.hu@mediatek.com>
To: Pi-Hsun Shih <pihsun@chromium.org>
Date: Mon, 2 Dec 2019 13:24:30 +0800
In-Reply-To: <20191127100419.130300-1-pihsun@chromium.org>
References: <20191127100419.130300-1-pihsun@chromium.org>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 55615A5A8EC94A2605C689A4D635FDA520FEA8224007C4A9FD05769092DFE3A42000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191201_212750_439460_5E79AFBC 
X-CRM114-Status: GOOD (  15.99  )
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
Cc: Sean Paul <seanpaul@chromium.org>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, David Airlie <airlied@linux.ie>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS FOR MEDIATEK" <dri-devel@lists.freedesktop.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi, Pi-Hsun:


On Wed, 2019-11-27 at 18:04 +0800, Pi-Hsun Shih wrote:
> From: Yongqiang Niu <yongqiang.niu@mediatek.com>
> 
> The original logic is ok for primary display, but will not find out
> component for external display.
> 
> For example, plane->index is 6 for external display, but there are only
> 2 layer nr in external display, and this condition will never happen:
> if (plane->index < (count + mtk_ddp_comp_layer_nr(comp)))
> 
> Fix this by using the offset of the plane to mtk_crtc->planes as index,
> instead of plane->index.

Reviewed-by: CK Hu <ck.hu@mediatek.com>

Regards,
CK

> 
> Fixes: d6b53f68356f ("drm/mediatek: Add helper to get component for a plane")
> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> Signed-off-by: Pi-Hsun Shih <pihsun@chromium.org>
> ---
>  drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> index f80a8ba75977..b34e7d70702a 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> @@ -215,11 +215,12 @@ struct mtk_ddp_comp *mtk_drm_ddp_comp_for_plane(struct drm_crtc *crtc,
>  	struct mtk_drm_crtc *mtk_crtc = to_mtk_crtc(crtc);
>  	struct mtk_ddp_comp *comp;
>  	int i, count = 0;
> +	unsigned int local_index = plane - mtk_crtc->planes;
>  
>  	for (i = 0; i < mtk_crtc->ddp_comp_nr; i++) {
>  		comp = mtk_crtc->ddp_comp[i];
> -		if (plane->index < (count + mtk_ddp_comp_layer_nr(comp))) {
> -			*local_layer = plane->index - count;
> +		if (local_index < (count + mtk_ddp_comp_layer_nr(comp))) {
> +			*local_layer = local_index - count;
>  			return comp;
>  		}
>  		count += mtk_ddp_comp_layer_nr(comp);
> 
> base-commit: 1875ff320f14afe21731a6e4c7b46dd33e45dfaa

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
