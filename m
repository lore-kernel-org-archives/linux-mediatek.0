Return-Path: <SRS0=xfzx=33=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 655E1C352A2
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Feb 2020 08:35:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3A0CC20726
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Feb 2020 08:35:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Q+M/F+eu";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="i85HRCam"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3A0CC20726
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=joxPdjToDCSd5XCgGI1nNmrwc9mDjAFsQ2+OjOprtj8=; b=Q+M/F+eur0+hQG
	ITD5wf8YJZPY4LTBWOtO/bFUP0bEwA+8lwNwa/wx3rVgFfHVvC/K4jCN0wiNxi7F/WF2TIHJOB29r
	Ke7Ce5zcCk8yP3w5NCLaVW561WnJ7zwkKkbvL/8lboNOuDbdv6C7SoC7TMppfQ/DHJwGHvKTdBOij
	AvoSd8LFeoYvmb5ugXEeEk6qI5z8hCzA3gvm5QHF1uYWx7KGIqOpSVO5ErgCasahkMsPpQWufIwk0
	F4RqG3sE2gD+brRyExwhvffenlQY8gBSbWr42mwg0dNYvdjez8c9brXU3iwaPOV1zK+Qdels9vG/e
	RQ+5gaD8eukNv13Wl9jw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1izz6Y-0004ha-F9; Fri, 07 Feb 2020 08:35:14 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1izz6U-00040P-Ud; Fri, 07 Feb 2020 08:35:12 +0000
X-UUID: 6b447a0611e3417bb4baeaa46fc103f3-20200207
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=hXWVZ6oSwC7pNQrHxmaSfz6HN+UgtHEL8vkKF8UU45A=; 
 b=i85HRCamkErv65eH5EQ5F4f1Uyu2I6hSbtMVf1IKSu6XRS4JO8CFSpiWBCpjm38ZVuFL54Kde34iD7s3cj6qzxmqwA3i4CVcGqwzMg+6BXlW+FBT8Z5xZygfBb9KjSJJ/74B2zVpNAx5s6efEp8nlntQPFoFjvVOWUxZzLqDDUU=;
X-UUID: 6b447a0611e3417bb4baeaa46fc103f3-20200207
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 238207271; Fri, 07 Feb 2020 00:35:02 -0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 7 Feb 2020 00:35:00 -0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by mtkcas08.mediatek.inc
 (172.21.101.126) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Fri, 7 Feb 2020 16:35:28 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Fri, 7 Feb 2020 16:35:28 +0800
Message-ID: <1581064499.590.0.camel@mtksdaap41>
Subject: Re: [PATCH] drm/mediatek: Find the cursor plane instead of hard
 coding it
From: CK Hu <ck.hu@mediatek.com>
To: Evan Benn <evanbenn@chromium.org>
Date: Fri, 7 Feb 2020 16:34:59 +0800
In-Reply-To: <20200207152348.1.Ie0633018fc787dda6e869cae23df76ae30f2a686@changeid>
References: <20200206140140.GA18465@art_vandelay>
 <20200207152348.1.Ie0633018fc787dda6e869cae23df76ae30f2a686@changeid>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200207_003511_069902_F1DE2945 
X-CRM114-Status: GOOD (  12.17  )
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi, Evan:

On Fri, 2020-02-07 at 15:23 +1100, Evan Benn wrote:
> The cursor and primary planes were hard coded.
> Now search for them for passing to drm_crtc_init_with_planes
> 

Reviewed-by: CK Hu <ck.hu@mediatek.com>

> Signed-off-by: Evan Benn <evanbenn@chromium.org>
> ---
> 
>  drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 18 ++++++++++++------
>  1 file changed, 12 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> index 7b392d6c71cc..935652990afa 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> @@ -658,10 +658,18 @@ static const struct drm_crtc_helper_funcs mtk_crtc_helper_funcs = {
>  
>  static int mtk_drm_crtc_init(struct drm_device *drm,
>  			     struct mtk_drm_crtc *mtk_crtc,
> -			     struct drm_plane *primary,
> -			     struct drm_plane *cursor, unsigned int pipe)
> +			     unsigned int pipe)
>  {
> -	int ret;
> +	struct drm_plane *primary = NULL;
> +	struct drm_plane *cursor = NULL;
> +	int i, ret;
> +
> +	for (i = 0; i < mtk_crtc->layer_nr; i++) {
> +		if (mtk_crtc->planes[i].type == DRM_PLANE_TYPE_PRIMARY)
> +			primary = &mtk_crtc->planes[i];
> +		else if (mtk_crtc->planes[i].type == DRM_PLANE_TYPE_CURSOR)
> +			cursor = &mtk_crtc->planes[i];
> +	}
>  
>  	ret = drm_crtc_init_with_planes(drm, &mtk_crtc->base, primary, cursor,
>  					&mtk_crtc_funcs, NULL);
> @@ -830,9 +838,7 @@ int mtk_drm_crtc_create(struct drm_device *drm_dev,
>  			return ret;
>  	}
>  
> -	ret = mtk_drm_crtc_init(drm_dev, mtk_crtc, &mtk_crtc->planes[0],
> -				mtk_crtc->layer_nr > 1 ? &mtk_crtc->planes[1] :
> -				NULL, pipe);
> +	ret = mtk_drm_crtc_init(drm_dev, mtk_crtc, pipe);
>  	if (ret < 0)
>  		return ret;
>  

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
