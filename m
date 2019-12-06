Return-Path: <SRS0=uEYr=Z4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E30DEC43603
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Dec 2019 01:57:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B29722077B
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Dec 2019 01:57:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oV6/5dac";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="E3Dz5oIG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B29722077B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n54GMYQCU8ameZrZypTMzBrAfJ5aVoEarX0IxaEHVFY=; b=oV6/5dacK/77Vx
	DdeCBTh9NoBDo4D4Ch6P/4LNYQFvmcXT5HeBHcl9LCadEOtKElhSY9KGhlVKDcLxUi5Ec0Hvq2w4p
	FoxXQQgycO55ExP5CtmI1lqdqm2MwkHUpO30wiQpxboH+7PrckOTivnIMgOZcNY9/OCj+zR9bXKb6
	mm/dTwxY8iaNAto9/J9y9NdgV7P2R4bO7Qa6Mi0r0YR6HBKaLgPIVaEMHLNKIhO/6Otoysin+hG/t
	83KIneV4MOoyL9zcmdwWz/Q+PySZ4XXSX5ylu0h1ciP3ANzhW0Spu5BzvpZT/WFCr9WJQLIeaBKOe
	tvdnE3AxfHow2bSh8rOQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1id2rx-0005Qv-60; Fri, 06 Dec 2019 01:57:21 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1id2rn-0005Iv-JD; Fri, 06 Dec 2019 01:57:14 +0000
X-UUID: 21090a38c5bc4ae48441e8c85a4e49c5-20191205
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=Wi+5R0BXr2YmOXq7DcGeu+ejHYe1KpCMZpa0/9X6xfw=; 
 b=E3Dz5oIG8EXHkfoSqa9g8Hs73xTJOfPTZpjNNEGWUQv6pK1ah1qEXr/l+lQTzUbCqTwfwtlF6BlhTJO5EVorF2lQmmHsjlW0EmyHx55XNaKlygl5TYWI9yJ9KpGJatjSyJnIYHqXQ49NtsQR9HPsiFMixzlrth+c0PAun0hzwE8=;
X-UUID: 21090a38c5bc4ae48441e8c85a4e49c5-20191205
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 2095848033; Thu, 05 Dec 2019 17:57:10 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 5 Dec 2019 17:57:21 -0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 6 Dec 2019 09:56:54 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Fri, 6 Dec 2019 09:56:53 +0800
Message-ID: <1575597427.6328.3.camel@mtksdaap41>
Subject: Re: [PATCH v4 4/7] drm/mediatek: disable all the planes in
 atomic_disable
From: CK Hu <ck.hu@mediatek.com>
To: Bibby Hsieh <bibby.hsieh@mediatek.com>
Date: Fri, 6 Dec 2019 09:57:07 +0800
In-Reply-To: <20191205092749.4021-5-bibby.hsieh@mediatek.com>
References: <20191205092749.4021-1-bibby.hsieh@mediatek.com>
 <20191205092749.4021-5-bibby.hsieh@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191205_175711_637820_5BAF53B3 
X-CRM114-Status: GOOD (  11.78  )
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
Cc: drinkcat@chromium.org, srv_heupstream@mediatek.com,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 tfiga@chromium.org, Thierry Reding <thierry.reding@gmail.com>,
 linux-mediatek@lists.infradead.org, Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 2019-12-05 at 17:27 +0800, Bibby Hsieh wrote:
> Under shadow register case, we do not disable all the plane before
> disable all the hardwares. Fix it.

Except the 'Fixes' tag, I could add it,

Reviewed-by: CK Hu <ck.hu@mediatek.com>

> 
> Signed-off-by: Bibby Hsieh <bibby.hsieh@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> index e887a6877bcd..e40c8cf7d74f 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> @@ -550,6 +550,7 @@ static void mtk_drm_crtc_atomic_disable(struct drm_crtc *crtc,
>  	}
>  	mtk_crtc->pending_planes = true;
>  
> +	mtk_drm_crtc_hw_config(mtk_crtc);
>  	/* Wait for planes to be disabled */
>  	drm_crtc_wait_one_vblank(crtc);
>  

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
