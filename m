Return-Path: <SRS0=2SDw=3U=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_DBL_ABUSE_MALW,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7120C33CB2
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 Jan 2020 03:32:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 78A4C2082E
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 Jan 2020 03:32:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="D8dll7H9";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="IvQcUXyt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 78A4C2082E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9GxbNAajSokhMzkMa8/yIRfbGo0wdjf4Xmmbv7vx5n8=; b=D8dll7H9kDqLsM
	Hi/gTpZmfasoFXsrFxYtfh/u8RSSqxyBw6UsYTP2BgFJ5W9JHZrSqNvFPqKiZ7e8zeu1DEgRvMqxR
	9A5nWxkvjGgy517DEs2MqJvkb7dZSQGCCFSpkZKu6qa7JY1sBGuAMSVPbz6mxNNrFa9LFyQL/1Z20
	YQZ4/82itJSNLF+P6iCaeQ6oy4+4BrKmdAEluHTWIOmN/JTBUjg5riZRFZHcWOa3iNTVIcmrNed2g
	VjWDiEVRJ25IF6bzo+AROn3s7c3hQxibCnW0dxFLFNxueDckLFA6fxqVQk0plrH0b1cYa1deWDf76
	SraUZM052FH6LsV9N+yQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ixN2R-0002IX-2n; Fri, 31 Jan 2020 03:32:11 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ixN2G-0002Bo-I6; Fri, 31 Jan 2020 03:32:03 +0000
X-UUID: 99fb086db79d4560a4f977375ac377c5-20200130
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=aM+4JU8dbdbMJaZA71HRgLbTyLydRZ9ekqagS3/8Hfk=; 
 b=IvQcUXytaGU00ahMsrciJ1XzRHD9HY5+yAM+X6LsliMw4nfOdppPhP7/cJqasut0Thv+ej+UZwtVVrsa0/+7C2uNGYLUoUrpBe8Y+bufMwoRflCjuCMCK49UbOLiV2nBQo4Y6ACCyKtGFbAIL8ezA0l7KZc0DyopZFBwsk40czs=;
X-UUID: 99fb086db79d4560a4f977375ac377c5-20200130
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1949332648; Thu, 30 Jan 2020 19:31:52 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 30 Jan 2020 19:27:07 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 31 Jan 2020 11:26:12 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Fri, 31 Jan 2020 11:26:05 +0800
Message-ID: <1580441226.9516.1.camel@mtksdaap41>
Subject: Re: [PATCH] drm/mediatek: Ensure the cursor plane is on top of
 other overlays
From: CK Hu <ck.hu@mediatek.com>
To: Sean Paul <sean@poorly.run>
Date: Fri, 31 Jan 2020 11:27:06 +0800
In-Reply-To: <20200130192511.81205-1-sean@poorly.run>
References: <20200130192511.81205-1-sean@poorly.run>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 810A1D44145352546047498F0C8DF1C0A427603B091BFE8EAD7B2B7BBFEFBB822000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200130_193200_606794_15FEBC54 
X-CRM114-Status: GOOD (  14.74  )
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
Cc: dcastagna@chromium.org, dri-devel@lists.freedesktop.org,
 Sean Paul <seanpaul@chromium.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias
 Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi, Sean:

On Thu, 2020-01-30 at 14:24 -0500, Sean Paul wrote:
> From: Sean Paul <seanpaul@chromium.org>
> 
> Currently the cursor is placed on the first overlay plane, which means
> it will be at the bottom of the stack when the hw does the compositing
> with anything other than primary plane. Since mtk doesn't support plane
> zpos, change the cursor location to the top-most plane.
> 

Reviewed-by: CK Hu <ck.hu@mediatek.com>

> Signed-off-by: Sean Paul <seanpaul@chromium.org>
> ---
>  drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> index 0dfcd1787e651..4ac76b9613926 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> @@ -689,11 +689,12 @@ static int mtk_drm_crtc_num_comp_planes(struct mtk_drm_crtc *mtk_crtc,
>  }
>  
>  static inline
> -enum drm_plane_type mtk_drm_crtc_plane_type(unsigned int plane_idx)
> +enum drm_plane_type mtk_drm_crtc_plane_type(unsigned int plane_idx,
> +					    unsigned int num_planes)
>  {
>  	if (plane_idx == 0)
>  		return DRM_PLANE_TYPE_PRIMARY;
> -	else if (plane_idx == 1)
> +	else if (plane_idx == (num_planes - 1))
>  		return DRM_PLANE_TYPE_CURSOR;
>  	else
>  		return DRM_PLANE_TYPE_OVERLAY;
> @@ -712,7 +713,8 @@ static int mtk_drm_crtc_init_comp_planes(struct drm_device *drm_dev,
>  		ret = mtk_plane_init(drm_dev,
>  				&mtk_crtc->planes[mtk_crtc->layer_nr],
>  				BIT(pipe),
> -				mtk_drm_crtc_plane_type(mtk_crtc->layer_nr),
> +				mtk_drm_crtc_plane_type(mtk_crtc->layer_nr,
> +							num_planes),
>  				mtk_ddp_comp_supported_rotations(comp));
>  		if (ret)
>  			return ret;

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
