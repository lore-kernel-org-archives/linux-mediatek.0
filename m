Return-Path: <SRS0=DTTl=YY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AED2CA9EC7
	for <linux-mediatek@archiver.kernel.org>; Thu, 31 Oct 2019 02:41:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 61D7020862
	for <linux-mediatek@archiver.kernel.org>; Thu, 31 Oct 2019 02:41:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qQ1Y+GFY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 61D7020862
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bTzz92vZStxDWkB2TF75X7DLZTTyBvBwQ/khiFkZUNY=; b=qQ1Y+GFYeirWw0
	cdaYdZ1FzjwdqbPaRKMZChnxVlbrcFH6EAIcfedaep/zoB6Mx84RQ2fD8dMAl5UL6v8o8sZHGtm0L
	FKHxFtHgkFAGFhojhJ6dlmkGMuLMt2J594YDgWWeVNRpXp2ZqFCl8TX5D/jeW1aOc8w4f2kPPBI7S
	zl/f1/a+rmEi8AaghToNjZrWvp58NlyNa5BmmA2RCWYHikDvpJ7Gv+BcIwO6+puYwcjT+3uewVg/a
	pC0It5+JZB+7fgq05FbQ0D2GYWXCyP6/nlHxZDDydFpQsGLSx15I1ujixJar/bYO6QkRTSqFZxfDO
	NZUkpl6ouhm2PKw+K9EQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iQ0Os-0001VI-3J; Thu, 31 Oct 2019 02:41:26 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iQ0Op-0001UW-WA; Thu, 31 Oct 2019 02:41:25 +0000
X-UUID: 8ac0743666b8453db2446e27b8df2b0b-20191030
X-UUID: 8ac0743666b8453db2446e27b8df2b0b-20191030
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1932025489; Wed, 30 Oct 2019 18:40:52 -0800
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 30 Oct 2019 19:41:13 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 31 Oct 2019 10:41:13 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 31 Oct 2019 10:41:12 +0800
Message-ID: <1572489673.25108.2.camel@mtksdaap41>
Subject: Re: [PATCH] drm/mediatek: Add RGB[A] variants to published plane
 formats
From: CK Hu <ck.hu@mediatek.com>
To: Sean Paul <sean@poorly.run>
Date: Thu, 31 Oct 2019 10:41:13 +0800
In-Reply-To: <20191023195129.165775-1-sean@poorly.run>
References: <20191023195129.165775-1-sean@poorly.run>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191030_194124_044450_347DB770 
X-CRM114-Status: GOOD (  12.34  )
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
Cc: Nicolas Boichat <drinkcat@chromium.org>,
 Daniele Castagna <dcastagna@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Miguel Casas <mcasas@chromium.org>, Sean Paul <seanpaul@chromium.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi, Sean:

On Wed, 2019-10-23 at 15:51 -0400, Sean Paul wrote:
> From: Sean Paul <seanpaul@chromium.org>
> 
> These formats are handled in the rdma code, but for some reason they're
> not published as supported formats for the planes. So add them to the
> list.

Applied to mediatek-drm-fixes-5.4 [1], thanks.

[1]
https://github.com/ckhu-mediatek/linux.git-tags/commits/mediatek-drm-fixes-5.4

Regards,
CK

> 
> Cc: Nicolas Boichat <drinkcat@chromium.org>
> Cc: Daniele Castagna <dcastagna@chromium.org>
> Cc: Miguel Casas <mcasas@chromium.org>
> Tested-by: Miguel Casas <mcasas@chromium.org>
> Signed-off-by: Sean Paul <seanpaul@chromium.org>
> ---
>  drivers/gpu/drm/mediatek/mtk_drm_plane.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_plane.c b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
> index 584a9ecadce6..49d59470cc11 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_plane.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
> @@ -20,6 +20,12 @@
>  static const u32 formats[] = {
>  	DRM_FORMAT_XRGB8888,
>  	DRM_FORMAT_ARGB8888,
> +	DRM_FORMAT_BGRX8888,
> +	DRM_FORMAT_BGRA8888,
> +	DRM_FORMAT_ABGR8888,
> +	DRM_FORMAT_XBGR8888,
> +	DRM_FORMAT_RGB888,
> +	DRM_FORMAT_BGR888,
>  	DRM_FORMAT_RGB565,
>  	DRM_FORMAT_UYVY,
>  	DRM_FORMAT_YUYV,



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
