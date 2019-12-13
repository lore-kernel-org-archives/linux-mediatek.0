Return-Path: <SRS0=P2Dl=2D=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83D2CC43603
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Dec 2019 08:03:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4F10F206B7
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Dec 2019 08:03:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="efal9N/X";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Q8dA/9WQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4F10F206B7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:
	In-Reply-To:Date:To:From:Subject:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xyw0A6dJAz0KTOENAxz9y0RfD0j4KSuyQzZEhYPD/Wc=; b=efal9N/XUHLDmA
	/+tQ6sLPwyAjSxgSnSID9f6QlD5qWFKUvrWDR72RBvnXmwTl90Tn8Am/kHSVDlxdKUIZ7FYqHaq4T
	IUCpwk8Ng1CUvtEbwFFLurtlU9vgkmaKHGA/KKEe0KephgFVmXmOpZ3ATVWk7CYH7H+78QCyMPJVq
	TbKBYaeEzGnR3QHuXMhtv1NBB88WowUCxh40mlEyluPV1lhSopMGpafr6H6DPTMT05iaBJQbNrfEX
	hdiodhHSwXbD/09JE/m7t8sXgoIK4RFUbTigQKib5371Y3J6g36IyzsD7w5yKZy6lCJMsEBN7rOsP
	HusyUi7HVUSLWsOhVIcQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iffvC-0004Le-N1; Fri, 13 Dec 2019 08:03:34 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iffv1-0004CZ-Jr; Fri, 13 Dec 2019 08:03:25 +0000
X-UUID: b538c21a97f84202bcfd5a1fe8964f26-20191213
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:Reply-To:From:Subject:Message-ID;
 bh=3iGzWvQ973vDVy2jTOS5BARL9ANWb/8ieSVfodrTkr4=; 
 b=Q8dA/9WQLk57H+t7aqd0+s6RFLHlGomn33rqYN8MFiu2AmwQZaL9ZKkEt8OgkmgKMxTk+T9D/0sE+QFrOJkk6QuuL2qT+m9rNVUGt1cOUz7s27C+CivdDGHLC7F15R9xKKnm4i04kZowdudB8TmQA43W7Id36QDeI1vfAXIiVTE=;
X-UUID: b538c21a97f84202bcfd5a1fe8964f26-20191213
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yongqiang.niu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1632271844; Fri, 13 Dec 2019 00:03:15 -0800
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 13 Dec 2019 00:04:17 -0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by mtkmbs05n2.mediatek.inc
 (172.21.101.140) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Fri, 13 Dec 2019 16:02:52 +0800
Received: from [10.17.3.153] (172.27.4.253) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Fri, 13 Dec 2019 16:03:11 +0800
Message-ID: <1576224191.31822.2.camel@mhfsdcap03>
Subject: Re: [PATCH v2, 1/2] drm/mediatek: Fix gamma correction issue
From: Yongqiang Niu <yongqiang.niu@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>
Date: Fri, 13 Dec 2019 16:03:11 +0800
In-Reply-To: <1576223336.9817.3.camel@mtksdaap41>
References: <1576222132-31586-1-git-send-email-yongqiang.niu@mediatek.com>
 <1576222132-31586-2-git-send-email-yongqiang.niu@mediatek.com>
 <1576223336.9817.3.camel@mtksdaap41>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191213_000323_659598_27967D7B 
X-CRM114-Status: GOOD (  16.17  )
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

On Fri, 2019-12-13 at 15:48 +0800, CK Hu wrote:
> Hi, Yongqiang:
> 
> The title is too rough. Any bug of gamma would be this title. I would
> like the title show explicitly what it does.
> 
> On Fri, 2019-12-13 at 15:28 +0800, Yongqiang Niu wrote:
> > if there is no gamma function in the crtc
> > display path, don't add gamma property
> > for crtc
> > 
> > Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> > ---
> >  drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 10 ++++++++--
> >  1 file changed, 8 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> > index ca4fc47..9a8e1d4 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> > @@ -734,6 +734,7 @@ int mtk_drm_crtc_create(struct drm_device *drm_dev,
> >  	int pipe = priv->num_pipes;
> >  	int ret;
> >  	int i;
> > +	uint gamma_lut_size = 0;
> >  
> >  	if (!path)
> >  		return 0;
> > @@ -785,6 +786,9 @@ int mtk_drm_crtc_create(struct drm_device *drm_dev,
> >  		}
> >  
> >  		mtk_crtc->ddp_comp[i] = comp;
> > +
> > +		if (comp->funcs->gamma_set)
> > +			gamma_lut_size = MTK_LUT_SIZE;
> >  	}
> >  
> >  	for (i = 0; i < mtk_crtc->ddp_comp_nr; i++)
> > @@ -805,8 +809,10 @@ int mtk_drm_crtc_create(struct drm_device *drm_dev,
> >  				NULL, pipe);
> >  	if (ret < 0)
> >  		return ret;
> > -	drm_mode_crtc_set_gamma_size(&mtk_crtc->base, MTK_LUT_SIZE);
> > -	drm_crtc_enable_color_mgmt(&mtk_crtc->base, 0, false, MTK_LUT_SIZE);
> > +
> > +	if (gamma_lut_size)
> > +		drm_mode_crtc_set_gamma_size(&mtk_crtc->base, gamma_lut_size);
> > +	drm_crtc_enable_color_mgmt(&mtk_crtc->base, 0, false, gamma_lut_size);
> 
> If there is no gamma, shall we enable color management?
> 
> Regards,
> CK

drm_crtc_enable_color_mgmt will check the gamma_lut_size parameter,
if no gamma, gamma_lut_size will be 0, and gamma_lut_size will not attch
gamma property for the crtc
> 
> >  	priv->num_pipes++;
> >  	mutex_init(&mtk_crtc->hw_lock);
> >  
> 
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
