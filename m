Return-Path: <SRS0=Xaha=P4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1F5CC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Nov 2021 10:20:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6EF79610C8
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Nov 2021 10:20:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6EF79610C8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qSq+m1AArJcRzmkt1+WElgdSSIyVrk2sfSuIGRStOJ4=; b=t5WkI3dcG3bfSO
	Cy28fzTNd/otdBTOS/ES4AS2xoERcHqxAmRoUPxxDKToMXxQsdXQOOyufDnoYDRWJJwTE2B51ecV2
	BJHrb+83Y+U+2pzjJ+BUcwKyDpBgCsYVscbRzDbVVBrE29oa/eU2xrrVF9TiWoFF82HTgM2kll4CI
	L6TF6BCgILY6tobqQPrCSYrBV7HTEsK3dun2yHvQFzrnf5Gpn3eVI8dTX/iq6UlDfWsM6F/yJXLQJ
	DxJT+M6q7ryI2DHhawCAebXVPcHgHbSgc3ukrScX2dBS4IZuimnT+fhma+CEAJvwocq6FtsqSwtso
	ztdIsPukuvQHjxlvKlLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mkOET-001UIn-G3; Tue, 09 Nov 2021 10:20:01 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkOE8-001U6T-6P; Tue, 09 Nov 2021 10:19:41 +0000
X-UUID: ce59b945ce454b5e92e0bafaae70049f-20211109
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=TFv/vUftrCh38jDwGXTl37MHujASck+n35ZeoH79Y+s=; 
 b=C3BoU0HssF401/jjFPsjc/cwldBMKpJZbCqdrSw1VWio68E0/uXD8x3LqJKCFK9qLAeatQOEeEBRpd7WaU2LfBJ1N9okT+9dkHI96mrNEvXFqkmrDY8YcsW6fzOLZMVfB8hc8V0jHDE+Nfw5vXgL70dzjvWxKgGMP4Tera2mxLQ=;
X-UUID: ce59b945ce454b5e92e0bafaae70049f-20211109
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yunfei.dong@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 258453461; Tue, 09 Nov 2021 03:19:34 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 9 Nov 2021 02:19:32 -0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 9 Nov 2021 18:19:30 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs10n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Tue, 9 Nov 2021 18:19:29 +0800
Message-ID: <ed30fae1acf18e5c7e84fce539a4abe78d7a8b61.camel@mediatek.com>
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
Date: Tue, 9 Nov 2021 18:19:29 +0800
In-Reply-To: <367efd7e-667c-6c0f-a36e-0eff6d323f48@collabora.com>
References: <20211029035527.454-1-yunfei.dong@mediatek.com>
 <20211029035527.454-5-yunfei.dong@mediatek.com>
 <367efd7e-667c-6c0f-a36e-0eff6d323f48@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211109_021940_253824_CC5E4D01 
X-CRM114-Status: GOOD (  25.53  )
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

Hi dafna,

Thanks for your suggestion.
On Fri, 2021-10-29 at 13:42 +0200, Dafna Hirschfeld wrote:
> 
> On 29.10.21 05:55, Yunfei Dong wrote:
> > Need to build decoder pm file as module for master and comp
> > use the same pm interface.
> 
> Do you still use the component framework in this patchset?
> In the cover letter you write: "- Use of_platform_populate to manage
> multi hardware, not component framework for patch 4/15"
remove component.
> If that frameworks is not used anymore you should also change the
> commit log, and maybe this patch is not needed anymore?
> 
main device and subdev device all use the same pm interface, so build
the file as module.
> Thanks,
> Dafna
Thanks,
Yunfei Dong
> > 
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
