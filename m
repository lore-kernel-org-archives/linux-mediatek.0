Return-Path: <SRS0=NAie=2C=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA621C43603
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Dec 2019 04:55:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 95ED4206C3
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Dec 2019 04:55:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="U7JBv/uF";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="f5bMNPM5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 95ED4206C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6vaqSiUupF15dmCwfLyu9AFtSYY//gbvvk6pKOWjCTc=; b=U7JBv/uFBrlZQK
	kfZR5C5JIjOB9TZvdgZDAUzWGN+39BRwhsAzoAM+wq1xM57r8kNjH1aZ/qu6wVDmVSS20Jv8/HN4r
	BIZeONxEp9DNZ5TGGvyI16Y9YxVJAkjwMbdrP8roDLSNnWkKkc5kQ+ZjaCNwtg8TvajN5YiY8D4EL
	BLflQJOkZaHqGYsgqrf7D/48dewz+0ZX9RApE8tAbhF/LPOrrrR3WqY33NdhW0U3IoZhCogDSOREt
	YAXSP5rPCm1kAibUHvzJX4tHiiUTQNIcBjmXr9sL+1tR8fAg6duI58ib2GZueytC4QUCgnfROdTSi
	VsBRuPj57OqtO3tBizrA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ifGW3-00073r-9T; Thu, 12 Dec 2019 04:55:55 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ifGVH-0005Wd-3T; Thu, 12 Dec 2019 04:55:09 +0000
X-UUID: 3a6c49666f6f4259a50432c65f43375e-20191211
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=61QzL2uAhif1inmfHk4F3GpOWbSMt53a76nKAzVwLMU=; 
 b=f5bMNPM5X3vpibe0RnOnQWIHHLjNcUhruZoyv2kTE7kQMw2sq6n8oCiqECQvYoXylolEXoxlHHdzYCtPjixo5Mk4wplOpBb8wMOEzckUSh89XQ0ukV3N+v41y+IA9vePsWjQrTSMqTJAM1tHOscJaSAx8PQJYXxGxJA+hQ4XHSw=;
X-UUID: 3a6c49666f6f4259a50432c65f43375e-20191211
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 2137650125; Wed, 11 Dec 2019 20:55:03 -0800
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 11 Dec 2019 20:51:08 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 MTKMBS31N1.mediatek.inc (172.27.4.69) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 12 Dec 2019 12:49:45 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 12 Dec 2019 12:49:53 +0800
Message-ID: <1576126197.29693.3.camel@mtksdaap41>
Subject: Re: [PATCH] drm/mediatek: Fix can't get component for external
 display plane.
From: CK Hu <ck.hu@mediatek.com>
To: Pi-Hsun Shih <pihsun@chromium.org>
Date: Thu, 12 Dec 2019 12:49:57 +0800
In-Reply-To: <1575264270.16063.0.camel@mtksdaap41>
References: <20191127100419.130300-1-pihsun@chromium.org>
 <1575264270.16063.0.camel@mtksdaap41>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: A33FA4A393275F96C1D67CACE7875D97147C4BC54960F0F3AB9A8D502DF8916C2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191211_205507_193879_3480CE7E 
X-CRM114-Status: GOOD (  17.35  )
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

On Mon, 2019-12-02 at 13:24 +0800, CK Hu wrote:
> Hi, Pi-Hsun:
> 
> 
> On Wed, 2019-11-27 at 18:04 +0800, Pi-Hsun Shih wrote:
> > From: Yongqiang Niu <yongqiang.niu@mediatek.com>
> > 
> > The original logic is ok for primary display, but will not find out
> > component for external display.
> > 
> > For example, plane->index is 6 for external display, but there are only
> > 2 layer nr in external display, and this condition will never happen:
> > if (plane->index < (count + mtk_ddp_comp_layer_nr(comp)))
> > 
> > Fix this by using the offset of the plane to mtk_crtc->planes as index,
> > instead of plane->index.
> 
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> 

Applied to mediatek-drm-fixes-5.5 [1], thanks.

[1]
https://github.com/ckhu-mediatek/linux.git-tags/commits/mediatek-drm-fixes-5.5


Regards,
CK

> Regards,
> CK
> 
> > 
> > Fixes: d6b53f68356f ("drm/mediatek: Add helper to get component for a plane")
> > Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> > Signed-off-by: Pi-Hsun Shih <pihsun@chromium.org>
> > ---
> >  drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> > index f80a8ba75977..b34e7d70702a 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> > @@ -215,11 +215,12 @@ struct mtk_ddp_comp *mtk_drm_ddp_comp_for_plane(struct drm_crtc *crtc,
> >  	struct mtk_drm_crtc *mtk_crtc = to_mtk_crtc(crtc);
> >  	struct mtk_ddp_comp *comp;
> >  	int i, count = 0;
> > +	unsigned int local_index = plane - mtk_crtc->planes;
> >  
> >  	for (i = 0; i < mtk_crtc->ddp_comp_nr; i++) {
> >  		comp = mtk_crtc->ddp_comp[i];
> > -		if (plane->index < (count + mtk_ddp_comp_layer_nr(comp))) {
> > -			*local_layer = plane->index - count;
> > +		if (local_index < (count + mtk_ddp_comp_layer_nr(comp))) {
> > +			*local_layer = local_index - count;
> >  			return comp;
> >  		}
> >  		count += mtk_ddp_comp_layer_nr(comp);
> > 
> > base-commit: 1875ff320f14afe21731a6e4c7b46dd33e45dfaa
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
