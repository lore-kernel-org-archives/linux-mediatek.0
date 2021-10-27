Return-Path: <SRS0=3cxa=PP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78383C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Oct 2021 04:06:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 26623610A1
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Oct 2021 04:06:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 26623610A1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yww0V0Nn9pjSows3szJC1uBUvjPRp64dk3+unoz0cUg=; b=f+lD1Eoxz0Kkyi
	y79xgawH3t8n5owC8sVgkcgov+vHPfJqQ0r0r73k0E55adPJ64tXYpRwa2Iy40PdQSq8oRRDihl7Y
	SndsTExi53Rbu9+jBxMJy/qPdIePxrhWCoIlrpSXfX9FHG/kT02dGG2P09bfG5klxBi3HeBuSKx+2
	EjqhoVUXsZE3ltzgRPGgZcpUGk6QTV66oakV6BtHDlRMI3vR7OaZeNzayIbHVot2y96xBIo1SkWGg
	2+GbiX+InHrnfAI+pcikeoc7HbwkjNpzI6m5vZzgLqwntiIlYXGzFxVpnb+kUX0sL97ob3PWosGhG
	FbsDj95aTDcngYyryJ+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfaCG-003oe1-Jr; Wed, 27 Oct 2021 04:05:52 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfaC2-003obr-Ch; Wed, 27 Oct 2021 04:05:41 +0000
X-UUID: f28c6294d6db4c119d8adc0aaa8996a6-20211026
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=p6q/LaSy5VobeQ2ybXdoUeSv4RQ5oLq95IXWCI7MBuM=; 
 b=m9Wwb/Q/8tpi+dC9Z0o18e82Tegp3oOk5Hfd5la9XMKCbzMXCXYWW9rHh4HV+LR1uHlH5H/W3CByywKbqMUcWBCDYYscbTQ/vOWQATF+MkIEezpSISwVuqcFq2RzeGzx90bMBoNkL8WAb5Wz19xDHPb2wUMeOAWqYdGsOQtaFR4=;
X-UUID: f28c6294d6db4c119d8adc0aaa8996a6-20211026
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yunfei.dong@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1544953120; Tue, 26 Oct 2021 21:05:37 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 26 Oct 2021 20:55:35 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Wed, 27 Oct 2021 11:55:33 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 27 Oct 2021 11:55:32 +0800
Message-ID: <8eeb39f16623cf6b6c43f353803acaad2815197f.camel@mediatek.com>
Subject: Re: [PATCH v7, 09/15] media: mtk-vcodec: Generalize power and clock
 on/off interfaces
From: "yunfei.dong@mediatek.com" <yunfei.dong@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Alexandre Courbot <acourbot@chromium.org>, Hans Verkuil
 <hverkuil-cisco@xs4all.nl>, Tzung-Bi Shih <tzungbi@chromium.org>, "Tiffany
 Lin" <tiffany.lin@mediatek.com>, Andrew-CT Chen
 <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Tomasz Figa <tfiga@google.com>
CC: Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>, 
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>, Benjamin Gaignard
 <benjamin.gaignard@collabora.com>, Daniel Vetter <daniel@ffwll.ch>, dri-devel
 <dri-devel@lists.freedesktop.org>, Irui Wang <irui.wang@mediatek.com>,
 <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <srv_heupstream@mediatek.com>, <linux-mediatek@lists.infradead.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Wed, 27 Oct 2021 11:55:32 +0800
In-Reply-To: <4c71a7cb-7259-5d8a-016f-fb2336f9c567@collabora.com>
References: <20211011070247.792-1-yunfei.dong@mediatek.com>
 <20211011070247.792-10-yunfei.dong@mediatek.com>
 <4c71a7cb-7259-5d8a-016f-fb2336f9c567@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211026_210538_456025_5EE4F91A 
X-CRM114-Status: GOOD (  29.44  )
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

Hi AngeloGioacchino,

Thanks for your suggestion.
On Thu, 2021-10-14 at 12:44 +0200, AngeloGioacchino Del Regno wrote:
> > Generalizes power and clock on/off interfaces to support different
> > hardware.
> > 
> > Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> > ---
> >   .../platform/mtk-vcodec/mtk_vcodec_dec_drv.c  |  6 +-
> >   .../platform/mtk-vcodec/mtk_vcodec_dec_hw.c   |  2 +-
> >   .../platform/mtk-vcodec/mtk_vcodec_dec_hw.h   |  4 +
> >   .../platform/mtk-vcodec/mtk_vcodec_dec_pm.c   | 76
> > ++++++++++++++--
> >   .../platform/mtk-vcodec/mtk_vcodec_dec_pm.h   |  8 +-
> >   .../platform/mtk-vcodec/mtk_vcodec_drv.h      |  2 +
> >   .../platform/mtk-vcodec/mtk_vcodec_util.c     | 87
> > ++++++++++++++++---
> >   .../platform/mtk-vcodec/mtk_vcodec_util.h     |  8 +-
> >   .../media/platform/mtk-vcodec/vdec_drv_if.c   | 21 ++---
> >   9 files changed, 174 insertions(+), 40 deletions(-)
> > 
> > diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c 
> > b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
> > index ff70fa5b34e3..3ea1e96e0ec0 100644
> > --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
> > +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
> > @@ -96,7 +96,7 @@ static irqreturn_t mtk_vcodec_dec_irq_handler(int
> > irq, void *priv)
> >   	void __iomem *vdec_misc_addr = dev->reg_base[VDEC_MISC] +
> >   					VDEC_IRQ_CFG_REG;
> >   
> > -	ctx = mtk_vcodec_get_curr_ctx(dev);
> > +	ctx = mtk_vcodec_get_curr_ctx(dev, MTK_VDEC_CORE);
> >   
> >   	/* check if HW active or not */
> >   	cg_status = readl(dev->reg_base[0]);
> > @@ -245,7 +245,7 @@ static int fops_vcodec_open(struct file *file)
> >   	mtk_vcodec_dec_set_default_params(ctx);
> >   
> >   	if (v4l2_fh_is_singular(&ctx->fh)) {
> > -		ret = mtk_vcodec_dec_pw_on(&dev->pm);
> > +		ret = mtk_vcodec_dec_pw_on(dev, MTK_VDEC_LAT0);
> >   		if (ret < 0)
> >   			goto err_load_fw;
> >   		/*
> > @@ -306,7 +306,7 @@ static int fops_vcodec_release(struct file
> > *file)
> >   	mtk_vcodec_dec_release(ctx);
> >   
> >   	if (v4l2_fh_is_singular(&ctx->fh))
> > -		mtk_vcodec_dec_pw_off(&dev->pm);
> > +		mtk_vcodec_dec_pw_off(dev, MTK_VDEC_LAT0);
> >   	v4l2_fh_del(&ctx->fh);
> >   	v4l2_fh_exit(&ctx->fh);
> >   	v4l2_ctrl_handler_free(&ctx->ctrl_hdl);
> > diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_hw.c
> > b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_hw.c
> > index 0997a5a08156..78d25916395d 100644
> > --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_hw.c
> > +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_hw.c
> > @@ -37,7 +37,7 @@ static irqreturn_t mtk_vdec_comp_irq_handler(int
> > irq, void *priv)
> >   	void __iomem *vdec_misc_addr = dev->reg_base[VDEC_COMP_MISC] +
> >   					VDEC_IRQ_CFG_REG;
> >   
> > -	ctx = mtk_vcodec_get_curr_ctx(dev->master_dev);
> > +	ctx = mtk_vcodec_get_curr_ctx(dev->master_dev, dev->comp_idx);
> >   
> >   	/* check if HW active or not */
> >   	cg_status = readl(dev->reg_base[VDEC_COMP_SYS]);
> > diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_hw.h
> > b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_hw.h
> > index 8d6e818a3474..0a4c2e6f5df2 100644
> > --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_hw.h
> > +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_hw.h
> > @@ -32,6 +32,8 @@ enum mtk_comp_hw_reg_idx {
> >    * @master_dev: master device
> >    * @reg_base: Mapped address of MTK Vcodec registers.
> >    *
> > + * @curr_ctx: The context that is waiting for codec hardware
> > + *
> >    * @dec_irq: decoder irq resource
> >    * @pm: power management control
> >    * @comp_idx: component index
> > @@ -41,6 +43,8 @@ struct mtk_vdec_comp_dev {
> >   	struct mtk_vcodec_dev *master_dev;
> >   	void __iomem *reg_base[VDEC_COMP_MAX];
> >   
> > +	struct mtk_vcodec_ctx *curr_ctx;
> > +
> >   	int dec_irq;
> >   	struct mtk_vcodec_pm pm;
> >   	int comp_idx;
> > diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c
> > b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c
> > index 20bd157a855c..183d4c4e36f0 100644
> > --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c
> > +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c
> > @@ -5,11 +5,13 @@
> >    */
> >   
> >   #include <linux/clk.h>
> > +#include <linux/interrupt.h>
> >   #include <linux/of_address.h>
> >   #include <linux/of_platform.h>
> >   #include <linux/pm_runtime.h>
> >   #include <soc/mediatek/smi.h>
> >   
> > +#include "mtk_vcodec_dec_hw.h"
> >   #include "mtk_vcodec_dec_pm.h"
> >   #include "mtk_vcodec_util.h"
> >   
> > @@ -84,10 +86,23 @@ void mtk_vcodec_release_dec_pm(struct
> > mtk_vcodec_pm *pm)
> >   	put_device(pm->larbvdec);
> >   }
> >   
> > -int mtk_vcodec_dec_pw_on(struct mtk_vcodec_pm *pm)
> > +int mtk_vcodec_dec_pw_on(struct mtk_vcodec_dev *vdec_dev, int
> > comp_idx)
> >   {
> > +	struct mtk_vdec_comp_dev *comp_dev;
> > +	struct mtk_vcodec_pm *pm;
> >   	int ret;
> >   
> > +	if (vdec_dev->vdec_pdata->is_comp_supported) {
> 
> This code is never hit, is_comp_supported is never true.
> 
This parameter is used to separate component(8192) and non-
component(8183) architecture. Add patch 5 to use it.
> > +		comp_dev = mtk_vcodec_get_hw_dev(vdec_dev, comp_idx);
> > +		if (!comp_dev) {
> > +			mtk_v4l2_err("Failed to get hw dev\n");
> > +			return -EINVAL;
> > +		}
> > +		pm = &comp_dev->pm;
> > +	} else {
> > +		pm = &vdec_dev->pm;
> > +	}
> > +
> >   	ret = pm_runtime_resume_and_get(pm->dev);
> >   	if (ret)
> >   		mtk_v4l2_err("pm_runtime_resume_and_get fail %d", ret);
> > @@ -95,20 +110,49 @@ int mtk_vcodec_dec_pw_on(struct mtk_vcodec_pm
> > *pm)
> >   	return ret;
> >   }
> >   
> > -void mtk_vcodec_dec_pw_off(struct mtk_vcodec_pm *pm)
> > +void mtk_vcodec_dec_pw_off(struct mtk_vcodec_dev *vdec_dev, int
> > comp_idx)
> >   {
> > +	struct mtk_vdec_comp_dev *comp_dev;
> > +	struct mtk_vcodec_pm *pm;
> >   	int ret;
> >   
> > +	if (vdec_dev->vdec_pdata->is_comp_supported) {
> 
> Ditto.
> 
> > +		comp_dev = mtk_vcodec_get_hw_dev(vdec_dev, comp_idx);
> > +		if (!comp_dev) {
> > +			mtk_v4l2_err("Failed to get hw dev\n");
> > +			return;
> > +		}
> > +		pm = &comp_dev->pm;
> > +	} else {
> > +		pm = &vdec_dev->pm;
> > +	}
> > +
> >   	ret = pm_runtime_put_sync(pm->dev);
> >   	if (ret)
> >   		mtk_v4l2_err("pm_runtime_put_sync fail %d", ret);
> >   }
> >   
> > -void mtk_vcodec_dec_clock_on(struct mtk_vcodec_pm *pm)
> > +void mtk_vcodec_dec_clock_on(struct mtk_vcodec_dev *vdec_dev, int
> > comp_idx)
> >   {
> > -	struct mtk_vcodec_clk *dec_clk = &pm->vdec_clk;
> > -	int ret, i = 0;
> > +	struct mtk_vdec_comp_dev *comp_dev;
> > +	struct mtk_vcodec_pm *pm;
> > +	struct mtk_vcodec_clk *dec_clk;
> > +	int ret, i;
> > +
> > +	if (vdec_dev->vdec_pdata->is_comp_supported) {
> 
> ...and again...
> 
> > +		comp_dev = mtk_vcodec_get_hw_dev(vdec_dev, comp_idx);
> > +		if (!comp_dev) {
> > +			mtk_v4l2_err("Failed to get hw dev\n");
> > +			return;
> > +		}
> > +		pm = &comp_dev->pm;
> > +		enable_irq(comp_dev->dec_irq);
> > +	} else {
> > +		pm = &vdec_dev->pm;
> > +		enable_irq(vdec_dev->dec_irq);
> > +	}
> >   
> > +	dec_clk = &pm->vdec_clk;
> >   	for (i = 0; i < dec_clk->clk_num; i++) {
> >   		ret = clk_prepare_enable(dec_clk-
> > >clk_info[i].vcodec_clk);
> >   		if (ret) {
> > @@ -130,11 +174,27 @@ void mtk_vcodec_dec_clock_on(struct
> > mtk_vcodec_pm *pm)
> >   		clk_disable_unprepare(dec_clk->clk_info[i].vcodec_clk);
> >   }
> >   
> > -void mtk_vcodec_dec_clock_off(struct mtk_vcodec_pm *pm)
> > +void mtk_vcodec_dec_clock_off(struct mtk_vcodec_dev *vdec_dev, int
> > comp_idx)
> >   {
> > -	struct mtk_vcodec_clk *dec_clk = &pm->vdec_clk;
> > -	int i = 0;
> > +	struct mtk_vdec_comp_dev *comp_dev;
> > +	struct mtk_vcodec_pm *pm;
> > +	struct mtk_vcodec_clk *dec_clk;
> > +	int i;
> >   
> > +	if (vdec_dev->vdec_pdata->is_comp_supported) {
> 
> ...
> 
> > +		comp_dev = mtk_vcodec_get_hw_dev(vdec_dev, comp_idx);
> > +		if (!comp_dev) {
> > +			mtk_v4l2_err("Failed to get hw dev\n");
> > +			return;
> > +		}
> > +		pm = &comp_dev->pm;
> > +		disable_irq(comp_dev->dec_irq);
> > +	} else {
> > +		pm = &vdec_dev->pm;
> > +		disable_irq(vdec_dev->dec_irq);
> > +	}
> > +
> > +	dec_clk = &pm->vdec_clk;
> >   	mtk_smi_larb_put(pm->larbvdec);
> >   	for (i = dec_clk->clk_num - 1; i >= 0; i--)
> >   		clk_disable_unprepare(dec_clk->clk_info[i].vcodec_clk);
> > diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.h
> > b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.h
> > index a3df6aef6cb9..698750572b57 100644
> > --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.h
> > +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.h
> > @@ -13,9 +13,9 @@ int mtk_vcodec_init_dec_pm(struct platform_device
> > *pdev,
> >   	struct mtk_vcodec_pm *pm);
> >   void mtk_vcodec_release_dec_pm(struct mtk_vcodec_pm *pm);
> >   
> > -int mtk_vcodec_dec_pw_on(struct mtk_vcodec_pm *pm);
> > -void mtk_vcodec_dec_pw_off(struct mtk_vcodec_pm *pm);
> > -void mtk_vcodec_dec_clock_on(struct mtk_vcodec_pm *pm);
> > -void mtk_vcodec_dec_clock_off(struct mtk_vcodec_pm *pm);
> > +int mtk_vcodec_dec_pw_on(struct mtk_vcodec_dev *vdec_dev, int
> > comp_idx);
> > +void mtk_vcodec_dec_pw_off(struct mtk_vcodec_dev *vdec_dev, int
> > comp_idx);
> > +void mtk_vcodec_dec_clock_on(struct mtk_vcodec_dev *vdec_dev, int
> > comp_idx);
> > +void mtk_vcodec_dec_clock_off(struct mtk_vcodec_dev *vdec_dev, int
> > comp_idx);
> >   
> >   #endif /* _MTK_VCODEC_DEC_PM_H_ */
> > diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> > b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> > index ab401b2db30e..95c82cb4e568 100644
> > --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> > +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
> > @@ -284,6 +284,7 @@ struct vdec_pic_info {
> >    * @decoded_frame_cnt: number of decoded frames
> >    * @lock: protect variables accessed by V4L2 threads and worker
> > thread such as
> >    *	  mtk_video_dec_buf.
> > + * @hw_id: hardware index used to identify different hardware.
> >    *
> >    * @msg_queue: msg queue used to store lat buffer information.
> >    */
> > @@ -328,6 +329,7 @@ struct mtk_vcodec_ctx {
> >   
> >   	int decoded_frame_cnt;
> >   	struct mutex lock;
> > +	int hw_id;
> >   
> >   	struct vdec_msg_queue msg_queue;
> >   };
> > diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_util.c
> > b/drivers/media/platform/mtk-vcodec/mtk_vcodec_util.c
> > index ac5973b6735f..511b75e49fe7 100644
> > --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_util.c
> > +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_util.c
> > @@ -6,7 +6,10 @@
> >   */
> >   
> >   #include <linux/module.h>
> > +#include <linux/of.h>
> > +#include <linux/of_device.h>
> >   
> > +#include "mtk_vcodec_dec_hw.h"
> >   #include "mtk_vcodec_drv.h"
> >   #include "mtk_vcodec_util.h"
> >   
> > @@ -81,25 +84,87 @@ void mtk_vcodec_mem_free(struct mtk_vcodec_ctx
> > *data,
> >   }
> >   EXPORT_SYMBOL(mtk_vcodec_mem_free);
> >   
> > -void mtk_vcodec_set_curr_ctx(struct mtk_vcodec_dev *dev,
> > -	struct mtk_vcodec_ctx *ctx)
> > +void *mtk_vcodec_get_hw_dev(struct mtk_vcodec_dev *dev, int
> > comp_idx)
> >   {
> > -	unsigned long flags;
> > +	struct platform_device *hw_pdev;
> > +	struct device_node *node;
> > +	struct mtk_vdec_comp_dev *master_dev;
> > +
> > +	if (comp_idx >= MTK_VDEC_HW_MAX || comp_idx < 0) {
> > +		mtk_v4l2_err("Comp idx is out of range:%d", comp_idx);
> > +		return NULL;
> > +	}
> > +
> > +	if (dev->comp_dev[comp_idx])
> > +		return dev->comp_dev[comp_idx];
> > +
> > +	node = dev->component_node[comp_idx];
> > +	if (!node) {
> > +		mtk_v4l2_err("Get lat node fail:%d", comp_idx);
> > +		return NULL;
> > +	}
> > +
> > +	hw_pdev = of_find_device_by_node(node);
> > +	of_node_put(node);
> > +
> > +	if (WARN_ON(!hw_pdev)) {
> > +		mtk_v4l2_err("Get hw id(%d) node fail", comp_idx);
> > +		return NULL;
> > +	}
> > +
> > +	master_dev = platform_get_drvdata(hw_pdev);
> > +	if (!master_dev) {
> > +		mtk_v4l2_err("Get hw id(%d) pdev fail", comp_idx);
> > +		return NULL;
> > +	}
> >   
> > -	spin_lock_irqsave(&dev->irqlock, flags);
> > -	dev->curr_ctx = ctx;
> > -	spin_unlock_irqrestore(&dev->irqlock, flags);
> > +	dev->comp_dev[master_dev->comp_idx] = master_dev;
> > +	return master_dev;
> > +}
> > +EXPORT_SYMBOL(mtk_vcodec_get_hw_dev);
> > +
> > +void mtk_vcodec_set_curr_ctx(struct mtk_vcodec_dev *vdec_dev,
> > +	struct mtk_vcodec_ctx *ctx, int comp_idx)
> > +{
> > +	unsigned long flags;
> > +	struct mtk_vdec_comp_dev *comp_dev;
> > +
> > +	spin_lock_irqsave(&vdec_dev->irqlock, flags);
> > +	if (vdec_dev->vdec_pdata->is_comp_supported) {
> 
> here too...
> 
> > +		comp_dev = mtk_vcodec_get_hw_dev(vdec_dev, comp_idx);
> > +		if (!comp_dev) {
> > +			mtk_v4l2_err("Failed to get hw dev");
> > +			spin_unlock_irqrestore(&vdec_dev->irqlock,
> > flags);
> > +			return;
> > +		}
> > +		comp_dev->curr_ctx = ctx;
> > +	} else {
> > +		vdec_dev->curr_ctx = ctx;
> > +	}
> > +	spin_unlock_irqrestore(&vdec_dev->irqlock, flags);
> >   }
> >   EXPORT_SYMBOL(mtk_vcodec_set_curr_ctx);
> >   
> > -struct mtk_vcodec_ctx *mtk_vcodec_get_curr_ctx(struct
> > mtk_vcodec_dev *dev)
> > +struct mtk_vcodec_ctx *mtk_vcodec_get_curr_ctx(struct
> > mtk_vcodec_dev *vdec_dev,
> > +	unsigned int comp_idx)
> >   {
> >   	unsigned long flags;
> >   	struct mtk_vcodec_ctx *ctx;
> > -
> > -	spin_lock_irqsave(&dev->irqlock, flags);
> > -	ctx = dev->curr_ctx;
> > -	spin_unlock_irqrestore(&dev->irqlock, flags);
> > +	struct mtk_vdec_comp_dev *comp_dev;
> > +
> > +	spin_lock_irqsave(&vdec_dev->irqlock, flags);
> > +	if (vdec_dev->vdec_pdata->is_comp_supported) {
> 
> and here
> 
> > +		comp_dev = mtk_vcodec_get_hw_dev(vdec_dev, comp_idx);
> > +		if (!comp_dev) {
> > +			mtk_v4l2_err("Failed to get hw dev");
> > +			spin_unlock_irqrestore(&vdec_dev->irqlock,
> > flags);
> > +			return NULL;
> > +		}
> > +		ctx = comp_dev->curr_ctx;
> > +	} else {
> > +		ctx = vdec_dev->curr_ctx;
> > +	}
> > +	spin_unlock_irqrestore(&vdec_dev->irqlock, flags);
> >   	return ctx;
> >   }
> >   EXPORT_SYMBOL(mtk_vcodec_get_curr_ctx);
> > diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_util.h
> > b/drivers/media/platform/mtk-vcodec/mtk_vcodec_util.h
> > index b999d7b84ed1..4cb0fc60c94f 100644
> > --- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_util.h
> > +++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_util.h
> > @@ -79,8 +79,10 @@ int mtk_vcodec_mem_alloc(struct mtk_vcodec_ctx
> > *data,
> >   				struct mtk_vcodec_mem *mem);
> >   void mtk_vcodec_mem_free(struct mtk_vcodec_ctx *data,
> >   				struct mtk_vcodec_mem *mem);
> > -void mtk_vcodec_set_curr_ctx(struct mtk_vcodec_dev *dev,
> > -	struct mtk_vcodec_ctx *ctx);
> > -struct mtk_vcodec_ctx *mtk_vcodec_get_curr_ctx(struct
> > mtk_vcodec_dev *dev);
> > +void mtk_vcodec_set_curr_ctx(struct mtk_vcodec_dev *vdec_dev,
> > +				struct mtk_vcodec_ctx *ctx, int
> > comp_idx);
> > +struct mtk_vcodec_ctx *mtk_vcodec_get_curr_ctx(struct
> > mtk_vcodec_dev *vdec_dev,
> > +	unsigned int comp_idx);
> 
> Fix indentation please:
> 
> struct mtk_vcodec_ctx *mtk_vcodec_get_curr_ctx(struct mtk_vcodec_dev
> *vdec_dev,
> 
> 					       unsigned int comp_idx);
> 
> Wil fix in patch v8.

Best Regards,
Yunfei Dong
> Regards,
> - Angelo
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
