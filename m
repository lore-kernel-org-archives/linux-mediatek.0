Return-Path: <SRS0=ljL/=Y6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8223C5DF62
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Nov 2019 09:07:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B52662178F
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Nov 2019 09:07:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LhP+lYTF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B52662178F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6eIVHS6i/hYQ4BsbIP7rwPx2SyedSbfUHvEvGerhvPA=; b=LhP+lYTFQ/fkgv
	1W1AnAR4+Qq9MvuCwA+qb+eBcnWfWMUZkR+UvEE5SvI2JbiBAslkMW4Eryp0PUgsKonFK9djeat0t
	UmhSIsah7gfCPGu2v2BQUNsgXVUraDDKh9OAP+h5jDl4L1/fO2KsGJEZF+tH9sFI00Rn1K4qGzRzn
	DBmvPzUH6FM50WfA2S2GV+QH1lHSuhf3ZBxeXAjGXytrsnDAwddjj2LR+Xfm/AqexBeKc3j0BNtmJ
	EU4UblwWwAONgAGuaEnhYfCmTLGg70hLK75c8f5PaHa7N6sVaadtsp3iECCXBygncruDvZ/NNV7XS
	ySWq/V50qXZUH5n30nrA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iSHHz-0004kX-6R; Wed, 06 Nov 2019 09:07:43 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iSHHx-0004jv-63; Wed, 06 Nov 2019 09:07:42 +0000
X-UUID: 68b43c4d91ef4a59a2437d5299dfd785-20191106
X-UUID: 68b43c4d91ef4a59a2437d5299dfd785-20191106
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1963890153; Wed, 06 Nov 2019 01:07:25 -0800
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 6 Nov 2019 01:07:34 -0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkexhb01.mediatek.inc (172.21.101.102) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 6 Nov 2019 17:07:20 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 6 Nov 2019 17:07:20 +0800
Message-ID: <1573031243.15410.2.camel@mtksdaap41>
Subject: Re: [PATCH v2 7/7] drm/mediatek: Support 180 degree rotation
From: CK Hu <ck.hu@mediatek.com>
To: Sean Paul <sean@poorly.run>
Date: Wed, 6 Nov 2019 17:07:23 +0800
In-Reply-To: <20191105211034.123937-8-sean@poorly.run>
References: <20191105211034.123937-1-sean@poorly.run>
 <20191105211034.123937-8-sean@poorly.run>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191106_010741_228177_55052640 
X-CRM114-Status: GOOD (  13.48  )
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
 frkoenig@chromium.org, mcasas@chromium.org, linux-mediatek@lists.infradead.org,
 p.zabel@pengutronix.de, matthias.bgg@gmail.com,
 Sean Paul <seanpaul@chromium.org>, linux-arm-kernel@lists.infradead.org,
 markyacoub@google.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi, Sean:

On Tue, 2019-11-05 at 16:10 -0500, Sean Paul wrote:
> From: Sean Paul <seanpaul@chromium.org>
> 
> Now that we support both reflections, we can expose 180 degree rotation
> and rely on the simplify routine to convert that into REFLECT_X |
> REFLECT_Y
> 

Patch 1 ~ 6 of this series looks good to me.
For this one, I think the rotation check in mtk_ovl_layer_check() should
be modified.

Regards,
CK

> Signed-off-by: Sean Paul <seanpaul@chromium.org>
> ---
>  drivers/gpu/drm/mediatek/mtk_disp_ovl.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> index f4c4d3fedc5f..4a55bb6e2213 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
> @@ -143,8 +143,8 @@ static unsigned int mtk_ovl_layer_nr(struct mtk_ddp_comp *comp)
>  
>  static unsigned int mtk_ovl_supported_rotations(struct mtk_ddp_comp *comp)
>  {
> -	return DRM_MODE_ROTATE_0 | DRM_MODE_REFLECT_Y |
> -	       DRM_MODE_REFLECT_X;
> +	return DRM_MODE_ROTATE_0 | DRM_MODE_ROTATE_180 |
> +	       DRM_MODE_REFLECT_X | DRM_MODE_REFLECT_Y;
>  }
>  
>  static int mtk_ovl_layer_check(struct mtk_ddp_comp *comp, unsigned int idx,



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
