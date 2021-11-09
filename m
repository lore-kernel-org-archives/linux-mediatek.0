Return-Path: <SRS0=Xaha=P4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68D3AC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Nov 2021 10:21:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 36016610A0
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Nov 2021 10:21:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 36016610A0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rDjIbs96KVvZtXE6t4gNVtmVhs8aoDdA3OVLbl1Z56I=; b=hJRR97Npj4CKtZ
	+JGh1o4AsweQjLgUumnqc6FDximpgwSbjQuxSkmO+D0I40usijmONKB/5y2ChKyAxx6UKKVLt11rL
	+3Yc6uE3t+/VZ7Xcg5KtrRa8lrnjX1XsAV4BBDACKp/g/PecMBkzPfo5Mj6jsiK1Gl2KwIDBACuy0
	saLEPUitV5ilN7FSuiFaotc6rGLYT9YSYzh31C71GSUYlLKxGuhMKOMuuvZIHvHMvSW07z0bKHU6W
	fXyCKYm7Ry3ZRGgVi+rGeVhNuxKo9ckoOuTuaKj2TjqNNA/I8noV7qWh8yvx/yohaNJYCfPmqz78S
	pOiehcxd2rDSRaZEGvAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mkOFw-001UwG-2m; Tue, 09 Nov 2021 10:21:32 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkOFe-001Uoi-Mg; Tue, 09 Nov 2021 10:21:16 +0000
X-UUID: 1b465f7317974c7cbce8e7a68db26caf-20211109
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=qixhrxsNd93h9WfbpzKUws2e16haCSuiLBS9jrpe5ro=; 
 b=MBn+9oyE1jtfJH43yKImkbaXYayJ4fDotFiAm/lN+hHQMZ5nd3mJ3kxSp+8U4LxcudHWmK8GpxgawZi36KG5lM9a+DGYapHKxTF05U03nttZQ8ltzvN9Fa9PIYp+D7kmeQcjATCMvJIzP9fKUDiOLUUHLGVOifdsREkf6uca7aA=;
X-UUID: 1b465f7317974c7cbce8e7a68db26caf-20211109
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <yunfei.dong@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 961183016; Tue, 09 Nov 2021 03:21:13 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 9 Nov 2021 02:21:11 -0800
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 9 Nov 2021 18:21:09 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs10n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Tue, 9 Nov 2021 18:21:08 +0800
Message-ID: <725aba6313f045f2d91a851e5563e35d3f8b754f.camel@mediatek.com>
Subject: Re: [PATCH v8, 03/17] media: mtk-vcodec: Refactor vcodec pm interface
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
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Tzung-Bi Shih
 <tzungbi@google.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>
Date: Tue, 9 Nov 2021 18:21:08 +0800
In-Reply-To: <2a25abdc-691b-9409-15ed-980af460c6c6@collabora.com>
References: <20211029035527.454-1-yunfei.dong@mediatek.com>
 <20211029035527.454-4-yunfei.dong@mediatek.com>
 <2a25abdc-691b-9409-15ed-980af460c6c6@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211109_022114_795887_7D364995 
X-CRM114-Status: GOOD (  25.74  )
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
On Fri, 2021-10-29 at 13:35 +0200, Dafna Hirschfeld wrote:
> 
> On 29.10.21 05:55, Yunfei Dong wrote:
> > Using the needed param for pm init/release function and remove
> > unused
> > param mtkdev in 'struct mtk_vcodec_pm'.
> > 
> > Reviewed-by: Tzung-Bi Shih <tzungbi@google.com>
> > Reviewed-By: AngeloGioacchino Del Regno <
> > angelogioacchino.delregno@collabora.com>
> > Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> 
> Hi,
> I already commented on v7 that since the pm implementation for dec
> and enc is identical,
> you should better do the same refactor to enc and dec or better
> remove the code duplication.
> 
Add patch 18 and 19 in v9 to remove decoder and encoder pm interfaces.
> Thanks,
> Dafna
> 
Thanks,
Yunfei Dong
> > ---
> >   .../platform/mtk-vcodec/mtk_vcodec_dec_drv.c  |  6 ++---
> >   .../platform/mtk-vcodec/mtk_vcodec_dec_pm.c   | 22 ++++++++----
> > -------
> >   .../platform/mtk-vcodec/mtk_vcodec_dec_pm.h   |  5 +++--
> >   .../platform/mtk-vcodec/mtk_vcodec_drv.h      |  1 -
> >   .../platform/mtk-vcodec/mtk_vcodec_enc_pm.c   |  1 -
> >   5 files changed, 15 insertions(+), 20 deletions(-)
> > 
> > diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c 
> > b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
> > index 055d50e52720..3ac4c3935e4e 100644
> > --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
> > +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
> > @@ -249,7 +249,7 @@ static int mtk_vcodec_probe(struct
> > platform_device *pdev)
> >   	if (IS_ERR(dev->fw_handler))
> >   		return PTR_ERR(dev->fw_handler);
> >   
> > -	ret = mtk_vcodec_init_dec_pm(dev);
> > +	ret = mtk_vcodec_init_dec_pm(dev->plat_dev, &dev->pm);
> >   	if (ret < 0) {
> >   		dev_err(&pdev->dev, "Failed to get mt vcodec clock
> > source");
> >   		goto err_dec_pm;
> > @@ -378,7 +378,7 @@ static int mtk_vcodec_probe(struct
> > platform_device *pdev)
> >   err_dec_alloc:
> >   	v4l2_device_unregister(&dev->v4l2_dev);
> >   err_res:
> > -	mtk_vcodec_release_dec_pm(dev);
> > +	mtk_vcodec_release_dec_pm(&dev->pm);
> >   err_dec_pm:
> >   	mtk_vcodec_fw_release(dev->fw_handler);
> >   	return ret;
> > @@ -418,7 +418,7 @@ static int mtk_vcodec_dec_remove(struct
> > platform_device *pdev)
> >   		video_unregister_device(dev->vfd_dec);
> >   
> >   	v4l2_device_unregister(&dev->v4l2_dev);
> > -	mtk_vcodec_release_dec_pm(dev);
> > +	mtk_vcodec_release_dec_pm(&dev->pm);
> >   	mtk_vcodec_fw_release(dev->fw_handler);
> >   	return 0;
> >   }
> > diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c
> > b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c
> > index 6038db96f71c..20bd157a855c 100644
> > --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c
> > +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c
> > @@ -13,18 +13,15 @@
> >   #include "mtk_vcodec_dec_pm.h"
> >   #include "mtk_vcodec_util.h"
> >   
> > -int mtk_vcodec_init_dec_pm(struct mtk_vcodec_dev *mtkdev)
> > +int mtk_vcodec_init_dec_pm(struct platform_device *pdev,
> > +	struct mtk_vcodec_pm *pm)
> >   {
> >   	struct device_node *node;
> > -	struct platform_device *pdev;
> > -	struct mtk_vcodec_pm *pm;
> > +	struct platform_device *larb_pdev;
> >   	struct mtk_vcodec_clk *dec_clk;
> >   	struct mtk_vcodec_clk_info *clk_info;
> >   	int i = 0, ret = 0;
> >   
> > -	pdev = mtkdev->plat_dev;
> > -	pm = &mtkdev->pm;
> > -	pm->mtkdev = mtkdev;
> >   	dec_clk = &pm->vdec_clk;
> >   	node = of_parse_phandle(pdev->dev.of_node, "mediatek,larb", 0);
> >   	if (!node) {
> > @@ -32,13 +29,12 @@ int mtk_vcodec_init_dec_pm(struct
> > mtk_vcodec_dev *mtkdev)
> >   		return -1;
> >   	}
> >   
> > -	pdev = of_find_device_by_node(node);
> > +	larb_pdev = of_find_device_by_node(node);
> >   	of_node_put(node);
> > -	if (WARN_ON(!pdev)) {
> > +	if (WARN_ON(!larb_pdev)) {
> >   		return -1;
> >   	}
> > -	pm->larbvdec = &pdev->dev;
> > -	pdev = mtkdev->plat_dev;
> > +	pm->larbvdec = &larb_pdev->dev;
> >   	pm->dev = &pdev->dev;
> >   
> >   	dec_clk->clk_num =
> > @@ -82,10 +78,10 @@ int mtk_vcodec_init_dec_pm(struct
> > mtk_vcodec_dev *mtkdev)
> >   	return ret;
> >   }
> >   
> > -void mtk_vcodec_release_dec_pm(struct mtk_vcodec_dev *dev)
> > +void mtk_vcodec_release_dec_pm(struct mtk_vcodec_pm *pm)
> >   {
> > -	pm_runtime_disable(dev->pm.dev);
> > -	put_device(dev->pm.larbvdec);
> > +	pm_runtime_disable(pm->dev);
> > +	put_device(pm->larbvdec);
> >   }
> >   
> >   int mtk_vcodec_dec_pw_on(struct mtk_vcodec_pm *pm)
> > diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.h
> > b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.h
> > index 280aeaefdb65..a3df6aef6cb9 100644
> > --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.h
> > +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.h
> > @@ -9,8 +9,9 @@
> >   
> >   #include "mtk_vcodec_drv.h"
> >   
> > -int mtk_vcodec_init_dec_pm(struct mtk_vcodec_dev *dev);
> > -void mtk_vcodec_release_dec_pm(struct mtk_vcodec_dev *dev);
> > +int mtk_vcodec_init_dec_pm(struct platform_device *pdev,
> > +	struct mtk_vcodec_pm *pm);
> > +void mtk_vcodec_release_dec_pm(struct mtk_vcodec_pm *pm);
> >   
> >   int mtk_vcodec_dec_pw_on(struct mtk_vcodec_pm *pm);
> >   void mtk_vcodec_dec_pw_off(struct mtk_vcodec_pm *pm);
> > diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> > b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> > index 1d2370608d0d..0fa9d85114b9 100644
> > --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> > +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> > @@ -195,7 +195,6 @@ struct mtk_vcodec_pm {
> >   	struct mtk_vcodec_clk	venc_clk;
> >   	struct device	*larbvenc;
> >   	struct device	*dev;
> > -	struct mtk_vcodec_dev	*mtkdev;
> >   };
> >   
> >   /**
> > diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c
> > b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c
> > index 1b2e4930ed27..0c8c8f86788c 100644
> > --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c
> > +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c
> > @@ -26,7 +26,6 @@ int mtk_vcodec_init_enc_pm(struct mtk_vcodec_dev
> > *mtkdev)
> >   	pdev = mtkdev->plat_dev;
> >   	pm = &mtkdev->pm;
> >   	memset(pm, 0, sizeof(struct mtk_vcodec_pm));
> > -	pm->mtkdev = mtkdev;
> >   	pm->dev = &pdev->dev;
> >   	dev = &pdev->dev;
> >   	enc_clk = &pm->venc_clk;
> > 
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
