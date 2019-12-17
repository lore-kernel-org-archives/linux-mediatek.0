Return-Path: <SRS0=Z+8g=2H=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7F29C43603
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Dec 2019 01:23:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A6EF6206E0
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Dec 2019 01:23:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ogCHlj1J";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="QO19j7mC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A6EF6206E0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SVmhI8lU1Myz+9ycbq3Ss8RWPBBUyTPFbwNLJLeE9cY=; b=ogCHlj1JMRLH0B
	TgCncMa0IgqOX55Eo4yOnIIJSj6ZNgqCncdyt0c/WWhpZavOQwxpG3hCEl0E02inmAE+ExENldfpD
	Ht84VOCBrTrjIhhlxngn6xEnEqWY5QpaoAff8kkfw8fwxc8tbnBTMtWI9uSdPWnhKJqvlaP/0/43U
	JttP9do14jgYYilV9kF2qov7KMhW2UTjJdwXyCcrnosT7AfzhXIucoY2hOvaffIyravvJNI064nqN
	4BKl607dgHSxBATqEZ6scUF0U+NYaJz25VYjjoMUZSrtgmdYQGr/MfR4E4NXMl50ZT5MjOBRCKWpP
	F0xtH0tTNQRPcBm/wAbA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ih1Zt-000623-97; Tue, 17 Dec 2019 01:23:09 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ih1Zj-0005tZ-9X; Tue, 17 Dec 2019 01:23:00 +0000
X-UUID: d9a41071ee714c319a95af6d8d398397-20191216
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=7ltJbMO3G7a13yc8xMgGmW59Fe0DuYrtSAHbe2Yr1Ao=; 
 b=QO19j7mCpO5stgHnM2Y7wG5bS6rtArXufCKoqC1lGtSsvu/BvCpoL25es+GpqDcGgkDfi4r0lp6MHrhmzKjZSj2467UMz/GdU4mjCdKayJ70jYs5RfkFNmfvYfrKNR2gTqXg/A6zT0CxtDoiC5CGjBai5k+nrornpd6yXDZoJ7U=;
X-UUID: d9a41071ee714c319a95af6d8d398397-20191216
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1461388319; Mon, 16 Dec 2019 17:22:54 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 16 Dec 2019 17:14:39 -0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 17 Dec 2019 09:12:16 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Tue, 17 Dec 2019 09:13:29 +0800
Message-ID: <1576545207.7301.3.camel@mtksdaap41>
Subject: Re: [PATCH 05/10] drm/mediatek: plane_state->fb iff plane_state->crtc
From: CK Hu <ck.hu@mediatek.com>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Tue, 17 Dec 2019 09:13:27 +0800
In-Reply-To: <20191213172612.1514842-5-daniel.vetter@ffwll.ch>
References: <20191213172612.1514842-1-daniel.vetter@ffwll.ch>
 <20191213172612.1514842-5-daniel.vetter@ffwll.ch>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 9E43735D7213DE8234B685DBCE55081391D157A1DD971A7AE5DA8369C8620C062000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191216_172259_342516_2373E7AE 
X-CRM114-Status: GOOD (  14.20  )
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
Cc: DRI Development <dri-devel@lists.freedesktop.org>,
 linux-mediatek@lists.infradead.org, Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias
 Brugger <matthias.bgg@gmail.com>, Daniel Vetter <daniel.vetter@intel.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi, Daniel:

On Fri, 2019-12-13 at 18:26 +0100, Daniel Vetter wrote:
> Checking both is one too much, so wrap a WARN_ON around it to stope
> the copypasta.

Even though I don't know what is copypasta,

Acked-by: CK Hu <ck.hu@mediatek.com>

> 
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: CK Hu <ck.hu@mediatek.com>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: Matthias Brugger <matthias.bgg@gmail.com>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-mediatek@lists.infradead.org
> ---
>  drivers/gpu/drm/mediatek/mtk_drm_plane.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_plane.c b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
> index 540ef2faa40a..f0b0325381e0 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_plane.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
> @@ -94,7 +94,7 @@ static int mtk_plane_atomic_check(struct drm_plane *plane,
>  	if (!fb)
>  		return 0;
>  
> -	if (!state->crtc)
> +	if (WARN_ON(!state->crtc))
>  		return 0;
>  
>  	ret = mtk_drm_crtc_plane_check(state->crtc, plane,

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
