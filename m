Return-Path: <SRS0=7p0Y=4B=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62898C352A3
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Feb 2020 04:05:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 33C42206D7
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Feb 2020 04:05:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CQQZQGSa";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="UkKKLj5t"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 33C42206D7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L96fUIMC7nfV5PQAAf1YEillTFY+aST4666CwIhvusE=; b=CQQZQGSaZY/Jnf
	cVFlyUR9WUCTn6jQ4HDM94DuwAk7YA4QuEQyirbM1Xx/B9znckssFLCLK20mw3UTaxK79O7PxA1gU
	+4+9o+NHPQXfKwQyCHn52/xqvc88h/vRiHU09/0DdQGyV49Kzz5HutawR148uiMA7lImf28O0WZYp
	o9JeUNjni12lLZHls4rWjCZRGfYhoHA2BY2bD6ehyhK2gKld4XspOK/n6UZb117FWJIbyK1PCwtAe
	ozbFDm5mU5awYlgRTCJQgiblTSXSU8gcjN0JsW9q9NIGqLybwVZpqgmvBksKWHz/GOFOR1BsNYdpi
	Bn6eEarzmBxP9+YQf9Yg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j25l0-0004Iy-6n; Thu, 13 Feb 2020 04:05:42 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j25k6-0002Go-AQ; Thu, 13 Feb 2020 04:04:47 +0000
X-UUID: 20a0d15c02454d47a5184a2662bffe58-20200212
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=AWHKi/bi0HkO6LeGddbfc6Yc3pqDeHpmuHU4Mk2li9M=; 
 b=UkKKLj5tzbNwYgYlmFqEGo/YfHOL9OuvekZyN/NKtmeL5yIZY/knOWoJmxtCoQAEhPGL2AYBp5v4YGRndrp1qXOfr7BuqWA5heOJDwFJb5VbXLbhnmZCtxtfpAfvvdXu++GfNHvmqt90Sj7HnQCvAMHEDooirPzggmyFy2jcHLw=;
X-UUID: 20a0d15c02454d47a5184a2662bffe58-20200212
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1624175233; Wed, 12 Feb 2020 20:04:42 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 12 Feb 2020 19:54:51 -0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 13 Feb 2020 11:53:55 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 13 Feb 2020 11:55:07 +0800
Message-ID: <1581566078.12071.0.camel@mtksdaap41>
Subject: Re: [PATCH 1/2] drm/mediatek: add plane check in async_check function
From: CK Hu <ck.hu@mediatek.com>
To: Bibby Hsieh <bibby.hsieh@mediatek.com>
Date: Thu, 13 Feb 2020 11:54:38 +0800
In-Reply-To: <20200213012353.26815-1-bibby.hsieh@mediatek.com>
References: <20200213012353.26815-1-bibby.hsieh@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200212_200446_369659_4795BF6D 
X-CRM114-Status: GOOD (  14.06  )
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

Hi, Bibby:

On Thu, 2020-02-13 at 09:23 +0800, Bibby Hsieh wrote:
> MTK do rotation checking and transferring in layer check function,
> but we do not check that in atomic_check,
> so add back in atomic_check function.
> 

Reviewed-by: CK Hu <ck.hu@mediatek.com>

> Fixes: 920fffcc8912 ("drm/mediatek: update cursors by using async atomic update")
> 
> Signed-off-by: Bibby Hsieh <bibby.hsieh@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_drm_plane.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_plane.c b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
> index 189744d34f53..d32b494ff1de 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_plane.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
> @@ -81,6 +81,7 @@ static int mtk_plane_atomic_async_check(struct drm_plane *plane,
>  					struct drm_plane_state *state)
>  {
>  	struct drm_crtc_state *crtc_state;
> +	int ret;
>  
>  	if (plane != state->crtc->cursor)
>  		return -EINVAL;
> @@ -91,6 +92,11 @@ static int mtk_plane_atomic_async_check(struct drm_plane *plane,
>  	if (!plane->state->fb)
>  		return -EINVAL;
>  
> +	ret = mtk_drm_crtc_plane_check(state->crtc, plane,
> +				       to_mtk_plane_state(state));
> +	if (ret)
> +		return ret;
> +
>  	if (state->state)
>  		crtc_state = drm_atomic_get_existing_crtc_state(state->state,
>  								state->crtc);

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
