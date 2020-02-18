Return-Path: <SRS0=iFQR=4G=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D593C34031
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Feb 2020 08:10:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EC1A621D7D
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Feb 2020 08:10:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="e4iKv5Ib";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="uEQFCC26"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EC1A621D7D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tnTExhcItATcMRJUO3/oQJ8L+hx97KJiL4m3wSAe2/M=; b=e4iKv5IburxXyQ
	qVi1sF1FOw9XGlgzRloKQkX1BN3+wW6+lejozo+tiPJiZAVhx0BZfSxLj7vt5zkkmDFeaWDjxCxF0
	Vz/JdQ2b5eThSraVF9s/sS2GGYpitKDqTGpeO/qQGx0A+WoQy/FgMxMxPD+k8uaH7rBtgb4HX7DJ6
	Jer8+2RDlEYyyMJedkOHGIbRkkPc71HuFiSOWhe3Z0WdR+CQEo7NyHhwXVSBZfiNM2Ml350/kzqvJ
	sMzh1qkJ0ehg5zBMUc/A8pwkvrOwsaQRlB8CBrrFq1m1yeTGjzq8GMEhyPksbaU4/oiMVEtVUf4u1
	g6gN+bgdPPqmBGbzlLQg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j3xx7-0001WS-7c; Tue, 18 Feb 2020 08:09:57 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j3xwx-0001O9-2l; Tue, 18 Feb 2020 08:09:48 +0000
X-UUID: 805f3dd1c13b494da7138a80919de9f8-20200218
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=6YFBzKFPnQHNsHeDzbWl+lIwexHJPqvaWd24YzOqLhs=; 
 b=uEQFCC26nQWv+B57IB5CDkNNnyTWvh5DJ79rjtOKATRZ0yanT1o+RGeUqNhi6k3tC/m1avfuI3eR2Xug+bWdaI0c2MSDcVSxzRIJr+HjIQErRGx5a9wwHTVCPrLj0/HtGJxd2+PbsQpt2J5igg4zgilYc1GvY4tCV7uaJDDZ8EQ=;
X-UUID: 805f3dd1c13b494da7138a80919de9f8-20200218
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 2108546678; Tue, 18 Feb 2020 00:09:42 -0800
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 18 Feb 2020 00:00:30 -0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 18 Feb 2020 15:58:43 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Tue, 18 Feb 2020 15:59:20 +0800
Message-ID: <1582012779.17361.0.camel@mtksdaap41>
Subject: Re: [PATCH 2/2] drm/mediatek: move gce event property to mutex
 device node
From: CK Hu <ck.hu@mediatek.com>
To: Bibby Hsieh <bibby.hsieh@mediatek.com>
Date: Tue, 18 Feb 2020 15:59:39 +0800
In-Reply-To: <1581504244.26347.0.camel@mtksdaap41>
References: <20200212095501.12124-1-bibby.hsieh@mediatek.com>
 <20200212095501.12124-2-bibby.hsieh@mediatek.com>
 <1581504244.26347.0.camel@mtksdaap41>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200218_000947_129419_BE41C39A 
X-CRM114-Status: GOOD (  12.84  )
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

On Wed, 2020-02-12 at 18:44 +0800, CK Hu wrote:
> Hi, Bibby:
> 
> On Wed, 2020-02-12 at 17:55 +0800, Bibby Hsieh wrote:
> > According mtk hardware design, stream_done0 and stream_done1 are
> > generated by mutex, so we move gce event property to mutex device mode.
> > 
> 
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> 

Applied to mediatek-drm-fixes-5.6 [1], thanks.

[1]
https://github.com/ckhu-mediatek/linux.git-tags/commits/mediatek-drm-fixes-5.6

Regards,
CK

> > Signed-off-by: Bibby Hsieh <bibby.hsieh@mediatek.com>
> > ---
> >  drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> > index 3c53ea22208c..8a31e5b983db 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> > @@ -819,7 +819,7 @@ int mtk_drm_crtc_create(struct drm_device *drm_dev,
> >  			drm_crtc_index(&mtk_crtc->base));
> >  		mtk_crtc->cmdq_client = NULL;
> >  	}
> > -	ret = of_property_read_u32_index(dev->of_node, "mediatek,gce-events",
> > +	ret = of_property_read_u32_index(priv->mutex_node, "mediatek,gce-events",
> >  					 drm_crtc_index(&mtk_crtc->base),
> >  					 &mtk_crtc->cmdq_event);
> >  	if (ret)
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
