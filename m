Return-Path: <SRS0=lqdO=Z3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EEBCC43603
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Dec 2019 07:13:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 739F922B48
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Dec 2019 07:13:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mqxAYczV";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="RPKXGRp0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 739F922B48
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:
	In-Reply-To:Date:To:From:Subject:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xHcx3D54sG+Y/3y/GvJwCfkE/ks+x19EZFmbBB+yuIY=; b=mqxAYczVM69Pvx
	sLdp6e+4aP2pzrw7N6ImdDrEEVen5/tw0qC1fHmlfyCkMO50TJegcTWAJeq1Qj9WufsuTdwbuJWQ8
	IfcfjR84/32RTmkLIsZC8GGDkbCov94enDt3lIGnAiCeOic96sUX4lbw63z9wT4QJ7joGwjD11Xnb
	6wZmtdQOBSA9NsboVu5jR4rKPY+x75WIe3zQvWNOC0u8ai1AcOLSYStt/YYkABTO8rpLKOVkDrzoj
	zTX1+qxc8HcbnRznxGLgCTH2gYbMhMKSKGxwgmAu2N6jYMMEff6u7auW5dQbuF0euR1QKoahNHdWJ
	YHzr2ZuWmXRzlO4djeUA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iclK1-0001ei-FR; Thu, 05 Dec 2019 07:13:09 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iclJy-0001dy-QT; Thu, 05 Dec 2019 07:13:08 +0000
X-UUID: 13d5eeac7ce047c399ccaccd10db84d8-20191204
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:Reply-To:From:Subject:Message-ID;
 bh=MJF+2jLqtT0SflHvg6q5GPIgnEzdpyPSz7LF2tPU4/Y=; 
 b=RPKXGRp0lPIS+PTXHCEJ1myLQp4YgW24OnbstvJXNsUNmgw67SivbzFhDdS91Pi2OtyVP/Ukkt6kF3ssXNJhddu8cY51BgMwHl3CnPQfUn+nZkdhBUV7ptTgNjJ3GE6kvZtsKiQvOEmayc2NcppfCgTc11l/vB4VCeZBfOq3I68=;
X-UUID: 13d5eeac7ce047c399ccaccd10db84d8-20191204
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <yongqiang.niu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1255473439; Wed, 04 Dec 2019 23:13:03 -0800
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 4 Dec 2019 23:13:13 -0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by mtkmbs05n1.mediatek.inc
 (172.21.101.15) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Thu, 5 Dec 2019 15:12:43 +0800
Received: from [10.17.3.153] (172.27.4.253) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 5 Dec 2019 15:12:37 +0800
Message-ID: <1575529976.9400.4.camel@mhfsdcap03>
Subject: Re: [v1,1/2] drm/mediatek: Fixup external display black screen issue
From: Yongqiang Niu <yongqiang.niu@mediatek.com>
To: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Thu, 5 Dec 2019 15:12:56 +0800
In-Reply-To: <CAJMQK-iDnOWCYmxcREGschD=sDfU6yKpUu+koP3YDeO3MPCdhQ@mail.gmail.com>
References: <1574817475-22378-2-git-send-email-yongqiang.niu@mediatek.com>
 <CAJMQK-iDnOWCYmxcREGschD=sDfU6yKpUu+koP3YDeO3MPCdhQ@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191204_231306_871810_91498A08 
X-CRM114-Status: GOOD (  17.12  )
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
Reply-To: Yongqiang Niu <yongqiang.niu@mediatek.com>
Cc: Mark Rutland <mark.rutland@arm.com>,
 Devicetree List <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 lkml <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 CK Hu <ck.hu@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias
 Brugger <matthias.bgg@gmail.com>, "moderated list:ARM/FREESCALE IMX / MXC ARM
 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 2019-12-05 at 14:15 +0800, Hsin-Yi Wang wrote:
> On Wed, Nov 27, 2019 at 1:17 AM <yongqiang.niu@mediatek.com> wrote:
> >
> > From: Yongqiang Niu <yongqiang.niu@mediatek.com>
> >
> > Problem:
> > overlay hangup when external display hotplut test
> >
> > Fix:
> > disable overlay when crtc disable
> >
> > Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> > ---
> >  drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 39 +++++++++++++++++++++------------
> >  1 file changed, 25 insertions(+), 14 deletions(-)
> >
> > --
> > 1.8.1.1.dirty
> >
> > diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> > index 4fb346c..7eca02f 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> > @@ -369,6 +369,20 @@ static int mtk_crtc_ddp_hw_init(struct mtk_drm_crtc *mtk_crtc)
> >         mtk_disp_mutex_add_comp(mtk_crtc->mutex, mtk_crtc->ddp_comp[i]->id);
> >         mtk_disp_mutex_enable(mtk_crtc->mutex);
> >
> > +       /* Initially configure all planes */
> > +       for (i = 0; i < mtk_crtc->layer_nr; i++) {
> > +               struct drm_plane *plane = &mtk_crtc->planes[i];
> > +               struct mtk_plane_state *plane_state;
> > +               struct mtk_ddp_comp *comp;
> > +               unsigned int local_layer;
> > +
> > +               plane_state = to_mtk_plane_state(plane->state);
> > +               comp = mtk_drm_ddp_comp_for_plane(crtc, plane, &local_layer);
> > +               if (comp)
> > +                       mtk_ddp_comp_layer_config(comp, local_layer,
> > +                                                 plane_state, NULL);
> > +       }
> > +
> >         for (i = 0; i < mtk_crtc->ddp_comp_nr; i++) {
> >                 struct mtk_ddp_comp *comp = mtk_crtc->ddp_comp[i];
> >                 enum mtk_ddp_comp_id prev;
> > @@ -385,20 +399,6 @@ static int mtk_crtc_ddp_hw_init(struct mtk_drm_crtc *mtk_crtc)
> >                 mtk_ddp_comp_start(comp);
> >         }
> >
> > -       /* Initially configure all planes */
> > -       for (i = 0; i < mtk_crtc->layer_nr; i++) {
> > -               struct drm_plane *plane = &mtk_crtc->planes[i];
> > -               struct mtk_plane_state *plane_state;
> > -               struct mtk_ddp_comp *comp;
> > -               unsigned int local_layer;
> > -
> > -               plane_state = to_mtk_plane_state(plane->state);
> > -               comp = mtk_drm_ddp_comp_for_plane(crtc, plane, &local_layer);
> > -               if (comp)
> > -                       mtk_ddp_comp_layer_config(comp, local_layer,
> > -                                                 plane_state, NULL);
> > -       }
> > -
> >         return 0;
> >
> >  err_mutex_unprepare:
> > @@ -607,10 +607,21 @@ static void mtk_drm_crtc_atomic_disable(struct drm_crtc *crtc,
> >         for (i = 0; i < mtk_crtc->layer_nr; i++) {
> >                 struct drm_plane *plane = &mtk_crtc->planes[i];
> >                 struct mtk_plane_state *plane_state;
> > +               struct mtk_ddp_comp *comp = mtk_crtc->ddp_comp[0];
> > +               unsigned int comp_layer_nr = mtk_ddp_comp_layer_nr(comp);
> > +               unsigned int local_layer;
> >
> >                 plane_state = to_mtk_plane_state(plane->state);
> >                 plane_state->pending.enable = false;
> >                 plane_state->pending.config = true;
> > +
> > +               if (i >= comp_layer_nr) {
> > +                       comp = mtk_crtc->ddp_comp[1];
> > +                       local_layer = i - comp_layer_nr;
> > +               } else
> > +                       local_layer = i;
> > +               mtk_ddp_comp_layer_config(comp, local_layer,
> > +                                         plane_state, NULL);
> This part should be moved to mtk_crtc_ddp_hw_fini(), or at least
> called after drm_crtc_vblank_off(). Otherwise we would see
> drm_wait_one_vblank warnings on 8173 when display turns off.
> 
> [   25.696182] Call trace:
> [   25.698624]  drm_wait_one_vblank+0x1f0/0x1fc
> [   25.702886]  drm_crtc_wait_one_vblank+0x20/0x2c
> [   25.707415]  mtk_drm_crtc_atomic_disable+0xf0/0x308
> [   25.712287]  drm_atomic_helper_commit_modeset_disables+0x1b8/0x3c0
> [   25.718461]  mtk_atomic_complete+0x88/0x16c
> [   25.722638]  mtk_atomic_commit+0xa8/0xb0
> [   25.726553]  drm_atomic_commit+0x50/0x5c
> [   25.730469]  drm_atomic_helper_set_config+0x98/0xa0
> [   25.735341]  drm_mode_setcrtc+0x280/0x608
> [   25.739344]  drm_ioctl_kernel+0xcc/0x10c
> [   25.743261]  drm_ioctl+0x240/0x3c0
> [   25.746658]  drm_compat_ioctl+0xd8/0xe8
> [   25.750487]  __se_compat_sys_ioctl+0x100/0x26fc
> [   25.755009]  __arm64_compat_sys_ioctl+0x20/0x2c
> [   25.759534]  el0_svc_common+0xa4/0x154
> [   25.763277]  el0_svc_compat_handler+0x2c/0x38
> [   25.767628]  el0_svc_compat+0x8/0x18
> [   25.771195] ---[ end trace f4619fdac8f1c0ff ]---
> 
> >
please double confirm is this dump stack log is ruining on MT8173 real
IC or not.
if yes, that may caused ovl hang when disable layer not in blanking,
then cause vblank time out.
i will disable overlay with cmdq in next version.


> 
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
