Return-Path: <SRS0=/i6S=ZZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70D83C432C0
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Dec 2019 07:44:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3E1CA20637
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Dec 2019 07:44:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="az9RrfA4";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="oTUE2q6M"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3E1CA20637
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:
	In-Reply-To:Date:To:From:Subject:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4Nsk1Y9av4No9eQLs6wVnDjobE71oQNQxKnwIHD7mOU=; b=az9RrfA4CLIxjE
	JbGLUhxMhXzfRUq6w+rPPIxdS4MbG/ayEJplhJLV5fs8KBuFraQR+RFoqZbvYvBinJr6906jKjL/G
	Nh6D0wu87FPvPJ1H5LRdrJpVUBh/W/B3D9gZCxoo399TSkXPSMj6VzfbbusWqBxK208/VfK02XaKR
	NQog9nMgxui/C/0wksC+J5oVIv9eXKswMrMFLeP8FZwyiq8dYnPjAs3XSiLee0Rch1jGYdVwjfKw1
	qL5jqKiM9XbuejrRS6bV3U+HXEDhusOjnUGhcsSTBzaXK2ywtxBpwOYLmvjsVyxRN/4MrRQIbiFxZ
	Fu6NOo0GvIfxijpyHMWw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ic2qs-0005wr-3Q; Tue, 03 Dec 2019 07:44:06 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ic2qh-0005mp-9a; Tue, 03 Dec 2019 07:43:56 +0000
X-UUID: b851c9b4fa1f42e5816995e63f720927-20191202
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:Reply-To:From:Subject:Message-ID;
 bh=BVAs28Vtt9E82BQJB0GFe4lxbgi2+ruTeT4/bQX4A4I=; 
 b=oTUE2q6MY8W078arSClmvc1Oi7iDloldyJ4ybXhAT79sAxFit+AIJHUZMlPd2uoi5NgixpcSLq28tk1Iw6bm+mggW5jnY/DD/HuyzwKUJtYecxXHFrD6ZkSlnpdwk9wbLs2Z+9g+FdzY3k4grwcKGS5FzUbXvAh3PpB+/MONYUA=;
X-UUID: b851c9b4fa1f42e5816995e63f720927-20191202
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <yongqiang.niu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 920780151; Mon, 02 Dec 2019 23:43:51 -0800
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 2 Dec 2019 23:44:37 -0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by mtkmbs05n2.mediatek.inc
 (172.21.101.140) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Tue, 3 Dec 2019 15:43:33 +0800
Received: from [10.17.3.153] (172.27.4.253) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Tue, 3 Dec 2019 15:43:37 +0800
Message-ID: <1575359027.10160.2.camel@mhfsdcap03>
Subject: Re: [PATCH v1, 1/2] drm/mediatek: Fixup external display black
 screen issue
From: Yongqiang Niu <yongqiang.niu@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>
Date: Tue, 3 Dec 2019 15:43:47 +0800
In-Reply-To: <1575352101.2457.8.camel@mtksdaap41>
References: <1574817475-22378-1-git-send-email-yongqiang.niu@mediatek.com>
 <1574817475-22378-2-git-send-email-yongqiang.niu@mediatek.com>
 <1575352101.2457.8.camel@mtksdaap41>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191202_234355_351335_72ED1E5D 
X-CRM114-Status: GOOD (  19.67  )
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
Reply-To: yongqiang.niu@mediatek.com
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

On Tue, 2019-12-03 at 13:48 +0800, CK Hu wrote:
> Hi, Yongqiang:
> 
> On Wed, 2019-11-27 at 09:17 +0800, yongqiang.niu@mediatek.com wrote:
> > From: Yongqiang Niu <yongqiang.niu@mediatek.com>
> > 
> > Problem:
> > overlay hangup when external display hotplut test
> > 
> > Fix:
> > disable overlay when crtc disable
> 
> I think you do two things in this patch. The first is to config layer
> before component start, and the second is disable layer when crtc
> disable. So separate to two patches.
> 
> > 
> > Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> > ---
> >  drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 39 +++++++++++++++++++++------------
> >  1 file changed, 25 insertions(+), 14 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> > index 4fb346c..7eca02f 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> > @@ -369,6 +369,20 @@ static int mtk_crtc_ddp_hw_init(struct mtk_drm_crtc *mtk_crtc)
> >  	mtk_disp_mutex_add_comp(mtk_crtc->mutex, mtk_crtc->ddp_comp[i]->id);
> >  	mtk_disp_mutex_enable(mtk_crtc->mutex);
> >  
> > +	/* Initially configure all planes */
> > +	for (i = 0; i < mtk_crtc->layer_nr; i++) {
> > +		struct drm_plane *plane = &mtk_crtc->planes[i];
> > +		struct mtk_plane_state *plane_state;
> > +		struct mtk_ddp_comp *comp;
> > +		unsigned int local_layer;
> > +
> > +		plane_state = to_mtk_plane_state(plane->state);
> > +		comp = mtk_drm_ddp_comp_for_plane(crtc, plane, &local_layer);
> > +		if (comp)
> > +			mtk_ddp_comp_layer_config(comp, local_layer,
> > +						  plane_state, NULL);
> > +	}
> > +
> >  	for (i = 0; i < mtk_crtc->ddp_comp_nr; i++) {
> >  		struct mtk_ddp_comp *comp = mtk_crtc->ddp_comp[i];
> >  		enum mtk_ddp_comp_id prev;
> > @@ -385,20 +399,6 @@ static int mtk_crtc_ddp_hw_init(struct mtk_drm_crtc *mtk_crtc)
> >  		mtk_ddp_comp_start(comp);
> >  	}
> >  
> > -	/* Initially configure all planes */
> > -	for (i = 0; i < mtk_crtc->layer_nr; i++) {
> > -		struct drm_plane *plane = &mtk_crtc->planes[i];
> > -		struct mtk_plane_state *plane_state;
> > -		struct mtk_ddp_comp *comp;
> > -		unsigned int local_layer;
> > -
> > -		plane_state = to_mtk_plane_state(plane->state);
> > -		comp = mtk_drm_ddp_comp_for_plane(crtc, plane, &local_layer);
> > -		if (comp)
> > -			mtk_ddp_comp_layer_config(comp, local_layer,
> > -						  plane_state, NULL);
> > -	}
> > -
> >  	return 0;
> >  
> >  err_mutex_unprepare:
> > @@ -607,10 +607,21 @@ static void mtk_drm_crtc_atomic_disable(struct drm_crtc *crtc,
> >  	for (i = 0; i < mtk_crtc->layer_nr; i++) {
> >  		struct drm_plane *plane = &mtk_crtc->planes[i];
> >  		struct mtk_plane_state *plane_state;
> > +		struct mtk_ddp_comp *comp = mtk_crtc->ddp_comp[0];
> > +		unsigned int comp_layer_nr = mtk_ddp_comp_layer_nr(comp);
> > +		unsigned int local_layer;
> >  
> >  		plane_state = to_mtk_plane_state(plane->state);
> >  		plane_state->pending.enable = false;
> >  		plane_state->pending.config = true;
> > +
> > +		if (i >= comp_layer_nr) {
> > +			comp = mtk_crtc->ddp_comp[1];
> > +			local_layer = i - comp_layer_nr;
> > +		} else
> > +			local_layer = i;
> > +		mtk_ddp_comp_layer_config(comp, local_layer,
> > +					  plane_state, NULL);
> 
> I'm confused with this part. The design of this loop is to set
> plane_state->pending.enable = false and wait for irq handler to write
> register. Why do you directly write register?
> 
> Regards,
> CK

when cmdq enable, mtk_crtc->cmdq_client will be always true when crtc
create, there is no chance for mtk_crtc_ddp_config process in ddp irq 
callback function
> 
> >  	}
> >  	mtk_crtc->pending_planes = true;
> >  
> 
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
