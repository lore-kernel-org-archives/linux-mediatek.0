Return-Path: <SRS0=P2Dl=2D=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04602C43603
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Dec 2019 07:56:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CC1602253D
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Dec 2019 07:56:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UNgIzWFp";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="cq5jNJlj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CC1602253D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rf1TcanPu+US8mQKiejuuBsJMspY2t7HlQifF9VqUu4=; b=UNgIzWFpLzw/go
	grWOqlO2ZuwvO2MU3AC0BDBRCBBQRNrMNpsL4q6haPhsTNGZ08EXJbUruj3rcerOQi/iRDTKwIW8g
	DPPXBM+rnncTRRU9QXJKC8Dm0/PhxGZXiPvEDBDUSawTtX6HufO48NcFclFZ6ropEczU2MKQJzXxW
	PjlHjxyB0djhxwhAcEsnw0AESKI46SlVKfFOS3JwfHUBx7oEIT9mQX2t/nNUwJyRlbFoQQWYgUYfk
	DKD7kyEXINOoaEzLMO/oagQhc3QWUMCO7sRLRpThkvOnIKSORvXojLU/e16FytarnO70G7hy1Dvrk
	pDK5CJokioN9WTnFjvXw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iffoJ-000233-8u; Fri, 13 Dec 2019 07:56:27 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iffoA-0001ug-2b; Fri, 13 Dec 2019 07:56:19 +0000
X-UUID: 87ab83a0272042f9af9379c92b8b9f37-20191212
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=BtXET+1NElrPbMJwRKiAbYUNzkYHcN515L3qrDyBFRk=; 
 b=cq5jNJlja/2j2iyT88NpKe2zBuz+s9htvrHW45m0a0jERY9i44urEUDGMMVSVwE2CGWmGEH7y/zB7N1QCz8VTu9AhEHJEXC9ToD/zCTALNuy+K3xd54uhD8pXmQix3/Neztxj8I0zQgCijLYFwcGUz0l8JRksYXLUVSfA1gQNd4=;
X-UUID: 87ab83a0272042f9af9379c92b8b9f37-20191212
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 461127659; Thu, 12 Dec 2019 23:56:14 -0800
Received: from MTKMBS31DR.mediatek.inc (172.27.6.102) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 12 Dec 2019 23:50:03 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 MTKMBS31DR.mediatek.inc (172.27.6.102) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 13 Dec 2019 15:48:39 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Fri, 13 Dec 2019 15:48:46 +0800
Message-ID: <1576223336.9817.3.camel@mtksdaap41>
Subject: Re: [PATCH v2, 1/2] drm/mediatek: Fix gamma correction issue
From: CK Hu <ck.hu@mediatek.com>
To: Yongqiang Niu <yongqiang.niu@mediatek.com>
Date: Fri, 13 Dec 2019 15:48:56 +0800
In-Reply-To: <1576222132-31586-2-git-send-email-yongqiang.niu@mediatek.com>
References: <1576222132-31586-1-git-send-email-yongqiang.niu@mediatek.com>
 <1576222132-31586-2-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: B2D976F46AAC6B6E1746EF1ECE6AC29281FF83D79D292527E390BA3DF3F8755E2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191212_235618_121709_74F9320A 
X-CRM114-Status: GOOD (  13.55  )
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

The title is too rough. Any bug of gamma would be this title. I would
like the title show explicitly what it does.

On Fri, 2019-12-13 at 15:28 +0800, Yongqiang Niu wrote:
> if there is no gamma function in the crtc
> display path, don't add gamma property
> for crtc
> 
> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> index ca4fc47..9a8e1d4 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> @@ -734,6 +734,7 @@ int mtk_drm_crtc_create(struct drm_device *drm_dev,
>  	int pipe = priv->num_pipes;
>  	int ret;
>  	int i;
> +	uint gamma_lut_size = 0;
>  
>  	if (!path)
>  		return 0;
> @@ -785,6 +786,9 @@ int mtk_drm_crtc_create(struct drm_device *drm_dev,
>  		}
>  
>  		mtk_crtc->ddp_comp[i] = comp;
> +
> +		if (comp->funcs->gamma_set)
> +			gamma_lut_size = MTK_LUT_SIZE;
>  	}
>  
>  	for (i = 0; i < mtk_crtc->ddp_comp_nr; i++)
> @@ -805,8 +809,10 @@ int mtk_drm_crtc_create(struct drm_device *drm_dev,
>  				NULL, pipe);
>  	if (ret < 0)
>  		return ret;
> -	drm_mode_crtc_set_gamma_size(&mtk_crtc->base, MTK_LUT_SIZE);
> -	drm_crtc_enable_color_mgmt(&mtk_crtc->base, 0, false, MTK_LUT_SIZE);
> +
> +	if (gamma_lut_size)
> +		drm_mode_crtc_set_gamma_size(&mtk_crtc->base, gamma_lut_size);
> +	drm_crtc_enable_color_mgmt(&mtk_crtc->base, 0, false, gamma_lut_size);

If there is no gamma, shall we enable color management?

Regards,
CK

>  	priv->num_pipes++;
>  	mutex_init(&mtk_crtc->hw_lock);
>  

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
