Return-Path: <SRS0=iFQR=4G=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3071C34031
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Feb 2020 08:23:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 95784206E2
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Feb 2020 08:23:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="K+JpM/68";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="mVf66q9c"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 95784206E2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9CQ2KxUMG1OfvgylSvEf6ZaMBI2y3EURtRCElAwTM90=; b=K+JpM/68wL89DO
	1ht61z9OV4N4t0gOXzBv1sTn+hpj5jX2F2qj9nrdv95qJOqO62y04QUbDZEIiZlDwhqBGyAR0oiTc
	ayLHvh8zl4zCPWztZ85Io1b2/d+MLQabqOgjwbrY28YTsllxZ8c2GulwATUK2eSifE2KVsTP++US7
	h7m46D9kzUk2vhU/pxFgeNNmcxGljqS48WPmH+7SJ8pHpdnvZEVgebBqp6rDfJHkoRFrDz4lAI4oL
	t/TbR5a+B4WBSIM2rUF6gHdnm8Cs0q8E/r6RFs0mC0k8z7XD2LMbY44tCpJqpy+7PHm0lwuu2I4y0
	TO+6/XVJHXv1opTfB+7g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j3y9i-0006aW-Mj; Tue, 18 Feb 2020 08:22:58 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j3y9Z-0006T4-6Y; Tue, 18 Feb 2020 08:22:50 +0000
X-UUID: 32f66428ddab4b8c8274d972f209aaf7-20200218
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=SfaeYyzD1vskIHsIX3CHP6DvU8UKTsX3PGwgpB+tsvc=; 
 b=mVf66q9caClDpvIVT7XpzG1PZLpTugIeklyrENikbbWCe88V8ZUSqYDnJ/FM65a8FTiEeBSkR4or2kQYIVUXA+Prp5pf4UZPj7CbYIdGy8MadR+o1djiyBN+N9gIAQDtxnqjhBb3VHIf4ziOQuT7HbYR114CQcRJ+LxH/ntw9y8=;
X-UUID: 32f66428ddab4b8c8274d972f209aaf7-20200218
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 634183460; Tue, 18 Feb 2020 00:22:45 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 18 Feb 2020 00:22:42 -0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 18 Feb 2020 16:22:07 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Tue, 18 Feb 2020 16:22:24 +0800
Message-ID: <1582014162.20566.2.camel@mtksdaap41>
Subject: Re: [PATCH 2/3] drm/mediatek: make sure previous message done or be
 aborted before send
From: CK Hu <ck.hu@mediatek.com>
To: Bibby Hsieh <bibby.hsieh@mediatek.com>
Date: Tue, 18 Feb 2020 16:22:42 +0800
In-Reply-To: <1581662912.17949.4.camel@mtksdaap41>
References: <20200214044954.16923-1-bibby.hsieh@mediatek.com>
 <20200214044954.16923-2-bibby.hsieh@mediatek.com>
 <1581662912.17949.4.camel@mtksdaap41>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 971137264DABD4948DC8DF38BF36DD743309BA80C941579AAD6973CA1A1390162000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200218_002249_249372_D5F56B34 
X-CRM114-Status: GOOD (  19.15  )
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

On Fri, 2020-02-14 at 14:48 +0800, CK Hu wrote:
> Hi, Bibby:
> 
> On Fri, 2020-02-14 at 12:49 +0800, Bibby Hsieh wrote:
> > Mediatek CMDQ driver removed atomic parameter and implementation
> > related to atomic. DRM driver need to make sure previous message
> > done or be aborted before we send next message.
> > 
> > If previous message is still waiting for event, it means the
> > setting hasn't been updated into display hardware register,
> > we can abort the message and send next message to update the
> > newest setting into display hardware.
> > If previous message already started, we have to wait it until
> > transmission has been completed.
> > 
> > So we flush mbox client before we send new message to controller
> > driver.
> > 
> 
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> 
> > This patch depends on ptach:
> > [0/3] Remove atomic_exec
> > https://patchwork.kernel.org/cover/11381677/
> > 

This patch does not depend on any patch, so applied to
mediatek-drm-fixes-5.6 [1], thanks.

[1]
https://github.com/ckhu-mediatek/linux.git-tags/commits/mediatek-drm-fixes-5.6

Regards,
CK

> > Signed-off-by: Bibby Hsieh <bibby.hsieh@mediatek.com>
> > ---
> >  drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> > index 3c53ea22208c..e35b66c5ba0f 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> > @@ -491,6 +491,7 @@ static void mtk_drm_crtc_hw_config(struct mtk_drm_crtc *mtk_crtc)
> >  	}
> >  #if IS_ENABLED(CONFIG_MTK_CMDQ)
> >  	if (mtk_crtc->cmdq_client) {
> > +		mbox_flush(mtk_crtc->cmdq_client->chan, 2000);
> >  		cmdq_handle = cmdq_pkt_create(mtk_crtc->cmdq_client, PAGE_SIZE);
> >  		cmdq_pkt_clear_event(cmdq_handle, mtk_crtc->cmdq_event);
> >  		cmdq_pkt_wfe(cmdq_handle, mtk_crtc->cmdq_event);
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
