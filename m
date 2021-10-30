Return-Path: <SRS0=+UjD=PS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 872E7C433EF
	for <linux-mediatek@archiver.kernel.org>; Sat, 30 Oct 2021 08:50:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4E35961038
	for <linux-mediatek@archiver.kernel.org>; Sat, 30 Oct 2021 08:50:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4E35961038
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BbL0sPHTh8jUhoMyiejp8lkzOmHXrq1IgKzc21Fi5V8=; b=BaGO8t+amxLwiL
	JCkhSd8JGTClf0p5yU3eyQTbSUj991BS0XHcehdo100aFHZiCEcnJmai6a6KwNOTqFYPORilPqE64
	JpCp4/phbAxFsOgAtp2kDmlaNK/m2BidImVDlxHg2YrvHu35IvTG6vYXgn6cOyzcfiRJvNJAlAPev
	/u3vBAs842UDpKTVjJRm+NHFdp9EPDGTvm70ueyDS0UV4QbTF8AekWC6LWYZr84h5iXYLEFcd4tnF
	LI3tc6RR8qLzzwZG1c99XSYFVlpquKe9XZJ4zwObYwMWpAJpocnLEu+C9IcDETM9wOmkn3Se/5tGj
	eidttmoeeyhPpzorgMOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mgk4J-00Cuo9-KH; Sat, 30 Oct 2021 08:50:27 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mgk47-00CukE-1E; Sat, 30 Oct 2021 08:50:16 +0000
X-UUID: 96a15ccbebad4417a0d517587a3da96f-20211030
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=1joBWrxOLNnv6naEfw5acQVYLyvbuOpjrLGQ/Z9923E=; 
 b=fukOpsn9NFxr6gAzOYr+1TDiP27v6H+bEI0ZCx0VY51K7aMXo6bSC2+X7xe2ItYVYgilsaQ4+6pO8jr68JdJ3rcK0351BGb/W+Q5ffuebPOWfr0C2VcRdlNW+rjeVs3HXGthQJWovE62UdtFcaFB+fIxL2pPgA0W6zpMPTGBB4M=;
X-UUID: 96a15ccbebad4417a0d517587a3da96f-20211030
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yunfei.dong@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1738290216; Sat, 30 Oct 2021 01:50:08 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 30 Oct 2021 01:50:06 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 mtkexhb01.mediatek.inc (172.21.101.102) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 30 Oct 2021 16:50:04 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs10n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Sat, 30 Oct 2021 16:50:03 +0800
Message-ID: <b44d4ff55dd9d9c98d75fca3e75abaf42be0c105.camel@mediatek.com>
Subject: Re: [PATCH v8, 04/17] media: mtk-vcodec: Build decoder pm file as
 module
From: "yunfei.dong@mediatek.com" <yunfei.dong@mediatek.com>
To: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>, Alexandre Courbot
 <acourbot@chromium.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, "Tzung-Bi
 Shih" <tzungbi@chromium.org>, Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Tomasz Figa <tfiga@google.com>
CC: Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, Daniel Vetter
 <daniel@ffwll.ch>, dri-devel <dri-devel@lists.freedesktop.org>, Irui Wang
 <irui.wang@mediatek.com>, <linux-media@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <srv_heupstream@mediatek.com>,
 <linux-mediatek@lists.infradead.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Ezequiel Garcia
 <ezequiel@vanguardiasur.com.ar>, Collabora Kernel ML <kernel@collabora.com>
Date: Sat, 30 Oct 2021 16:50:03 +0800
In-Reply-To: <367efd7e-667c-6c0f-a36e-0eff6d323f48@collabora.com>
References: <20211029035527.454-1-yunfei.dong@mediatek.com>
 <20211029035527.454-5-yunfei.dong@mediatek.com>
 <367efd7e-667c-6c0f-a36e-0eff6d323f48@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211030_015015_095670_3F4904C2 
X-CRM114-Status: GOOD (  25.64  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Danfa,

Thanks for your feedback.
On Fri, 2021-10-29 at 13:42 +0200, Dafna Hirschfeld wrote:
> 
> On 29.10.21 05:55, Yunfei Dong wrote:
> > Need to build decoder pm file as module for master and comp
> > use the same pm interface.
> 
> Do you still use the component framework in this patchset?
> In the cover letter you write: "- Use of_platform_populate to manage
> multi hardware, not component framework for patch 4/15"
> If that frameworks is not used anymore you should also change the
> commit log, and maybe this patch is not needed anymore?
> 
Not use component framework.

For iommu limit, not only parent device, the child device also need to
register as platform device. So the child device need to call
module_platform_driver. The child and parent device all need to call pm
interface to open/close pm/clk/irq. So build pm file as module, and
export necessary function.
> > 

Thanks
Yunfei Dong
> Thanks,
> Dafna
> > Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> > ---
> > v8: add new patch to build pm file as module
> > ---
> >   drivers/media/platform/mtk-vcodec/Makefile            | 6 ++++--
> >   drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c | 9
> > +++++++++
> >   2 files changed, 13 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/media/platform/mtk-vcodec/Makefile
> > b/drivers/media/platform/mtk-vcodec/Makefile
> > index ca8e9e7a9c4e..5d36e05535d7 100644
> > --- a/drivers/media/platform/mtk-vcodec/Makefile
> > +++ b/drivers/media/platform/mtk-vcodec/Makefile
> > @@ -2,7 +2,8 @@
> >   
> >   obj-$(CONFIG_VIDEO_MEDIATEK_VCODEC) += mtk-vcodec-dec.o \
> >   				       mtk-vcodec-enc.o \
> > -				       mtk-vcodec-common.o
> > +				       mtk-vcodec-common.o \
> > +				       mtk-vcodec-dec-common.o
> >   
> >   mtk-vcodec-dec-y := vdec/vdec_h264_if.o \
> >   		vdec/vdec_vp8_if.o \
> > @@ -14,7 +15,8 @@ mtk-vcodec-dec-y := vdec/vdec_h264_if.o \
> >   		mtk_vcodec_dec.o \
> >   		mtk_vcodec_dec_stateful.o \
> >   		mtk_vcodec_dec_stateless.o \
> > -		mtk_vcodec_dec_pm.o \
> > +
> > +mtk-vcodec-dec-common-y := mtk_vcodec_dec_pm.o
> >   
> >   mtk-vcodec-enc-y := venc/venc_vp8_if.o \
> >   		venc/venc_h264_if.o \
> > diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c
> > b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c
> > index 20bd157a855c..09a281e3065a 100644
> > --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c
> > +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c
> > @@ -77,12 +77,14 @@ int mtk_vcodec_init_dec_pm(struct
> > platform_device *pdev,
> >   	put_device(pm->larbvdec);
> >   	return ret;
> >   }
> > +EXPORT_SYMBOL_GPL(mtk_vcodec_init_dec_pm);
> >   
> >   void mtk_vcodec_release_dec_pm(struct mtk_vcodec_pm *pm)
> >   {
> >   	pm_runtime_disable(pm->dev);
> >   	put_device(pm->larbvdec);
> >   }
> > +EXPORT_SYMBOL_GPL(mtk_vcodec_release_dec_pm);
> >   
> >   int mtk_vcodec_dec_pw_on(struct mtk_vcodec_pm *pm)
> >   {
> > @@ -94,6 +96,7 @@ int mtk_vcodec_dec_pw_on(struct mtk_vcodec_pm
> > *pm)
> >   
> >   	return ret;
> >   }
> > +EXPORT_SYMBOL_GPL(mtk_vcodec_dec_pw_on);
> >   
> >   void mtk_vcodec_dec_pw_off(struct mtk_vcodec_pm *pm)
> >   {
> > @@ -103,6 +106,7 @@ void mtk_vcodec_dec_pw_off(struct mtk_vcodec_pm
> > *pm)
> >   	if (ret)
> >   		mtk_v4l2_err("pm_runtime_put_sync fail %d", ret);
> >   }
> > +EXPORT_SYMBOL_GPL(mtk_vcodec_dec_pw_off);
> >   
> >   void mtk_vcodec_dec_clock_on(struct mtk_vcodec_pm *pm)
> >   {
> > @@ -129,6 +133,7 @@ void mtk_vcodec_dec_clock_on(struct
> > mtk_vcodec_pm *pm)
> >   	for (i -= 1; i >= 0; i--)
> >   		clk_disable_unprepare(dec_clk->clk_info[i].vcodec_clk);
> >   }
> > +EXPORT_SYMBOL_GPL(mtk_vcodec_dec_clock_on);
> >   
> >   void mtk_vcodec_dec_clock_off(struct mtk_vcodec_pm *pm)
> >   {
> > @@ -139,3 +144,7 @@ void mtk_vcodec_dec_clock_off(struct
> > mtk_vcodec_pm *pm)
> >   	for (i = dec_clk->clk_num - 1; i >= 0; i--)
> >   		clk_disable_unprepare(dec_clk->clk_info[i].vcodec_clk);
> >   }
> > +EXPORT_SYMBOL_GPL(mtk_vcodec_dec_clock_off);
> > +
> > +MODULE_LICENSE("GPL v2");
> > +MODULE_DESCRIPTION("Mediatek video decoder driver");
> > 
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
