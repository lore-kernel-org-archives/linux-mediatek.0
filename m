Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56EAEC433FE
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Dec 2021 09:47:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=60+2WFELKtOYFSoFit/cH0z++5+4w9i0kJbCuae2gM8=; b=Usy+5XhTtTmPAS
	yVqi6Bv+2EmxsjpEjsRC59ooCXls8MIRWADiWvoxZSdxSW1wmkPPz+qbqfBHsPowuw3giP8eUo6kf
	zrFQJFnTWrlCXkAhwlWr6u/KLEXRViB+ihItENlZb2tFoMqAC32tiDcDPuXdwLt7fE+O6rGP7DwqG
	HANtiry1KRjMdtishzUoVaxOqkB0DJNu4lDnT3wfnFoxODWaYisonbfWN+gf2GY+XvNHytaM4V2uk
	VN/BcaAvyy2bMjL/iAcA4KcOYBaj5KPtEVq/d4FnyGBhGAELpGFsS5oJxLAbCKkP19rDF1mrUzmIB
	A2IDlohJqpHMG7+kcM2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n0hAr-00E2Z6-7e; Fri, 24 Dec 2021 09:47:41 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n0hAW-00E2Wg-C8; Fri, 24 Dec 2021 09:47:21 +0000
X-UUID: 5bf099a1bc30444f8bd65066721426fb-20211224
X-UUID: 5bf099a1bc30444f8bd65066721426fb-20211224
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <roger.lu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1377006469; Fri, 24 Dec 2021 02:47:16 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 24 Dec 2021 01:39:07 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 24 Dec 2021 17:38:58 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 24 Dec 2021 17:38:58 +0800
Message-ID: <a6f0704e430453fc6bbbb49eabcd5518c6852f4c.camel@mediatek.com>
Subject: Re: [PATCH v16 4/7] soc: mediatek: SVS: add debug commands
From: Roger Lu <roger.lu@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Enric Balletbo Serra
 <eballetbo@gmail.com>, Kevin Hilman <khilman@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Nicolas Boichat <drinkcat@google.com>, Stephen Boyd
 <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
CC: Fan Chen <fan.chen@mediatek.com>, HenryC Chen <HenryC.Chen@mediatek.com>, 
 YT Lee <yt.lee@mediatek.com>, Xiaoqing Liu <Xiaoqing.Liu@mediatek.com>,
 Charles Yang <Charles.Yang@mediatek.com>, Angus Lin <Angus.Lin@mediatek.com>, 
 Mark Rutland <mark.rutland@arm.com>, Nishanth Menon <nm@ti.com>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-pm@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Fri, 24 Dec 2021 17:38:58 +0800
In-Reply-To: <715c9587-825f-6c22-96a2-273fb7f07bc3@collabora.com>
References: <20210428065440.3704-1-roger.lu@mediatek.com>
 <20210428065440.3704-5-roger.lu@mediatek.com>
 <715c9587-825f-6c22-96a2-273fb7f07bc3@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211224_014720_469234_E035EC98 
X-CRM114-Status: GOOD (  24.44  )
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

Sorry for the late reply.

On Thu, 2021-10-21 at 10:52 +0200, AngeloGioacchino Del Regno wrote:
> Il 28/04/21 08:54, Roger Lu ha scritto:
> > The purpose of SVS is to help find the suitable voltages
> > for DVFS. Therefore, if SVS bank voltages are concerned
> > to be wrong, we can adjust SVS bank voltages by this patch.
> > 
> > Signed-off-by: Roger Lu <roger.lu@mediatek.com>
> > ---
> >   drivers/soc/mediatek/mtk-svs.c | 328 +++++++++++++++++++++++++++++++++
> >   1 file changed, 328 insertions(+)
> > 
> > diff --git a/drivers/soc/mediatek/mtk-svs.c b/drivers/soc/mediatek/mtk-svs.c
> > index 2d2153c92373..8794a2d87baa 100644
> > --- a/drivers/soc/mediatek/mtk-svs.c
> > +++ b/drivers/soc/mediatek/mtk-svs.c
> > @@ -6,6 +6,7 @@
> >   #include <linux/bits.h>
> >   #include <linux/clk.h>
> >   #include <linux/completion.h>
> > +#include <linux/debugfs.h>
> >   #include <linux/device.h>
> >   #include <linux/init.h>
> >   #include <linux/interrupt.h>
> > @@ -24,6 +25,7 @@
> >   #include <linux/pm_runtime.h>
> >   #include <linux/regulator/consumer.h>
> >   #include <linux/reset.h>
> > +#include <linux/seq_file.h>
> >   #include <linux/slab.h>
> >   #include <linux/spinlock.h>
> >   #include <linux/thermal.h>
> > @@ -62,6 +64,39 @@
> >   #define SVSB_INTSTS_COMPLETE		0x1
> >   #define SVSB_INTSTS_CLEAN		0x00ffffff
> >   
> > +#define debug_fops_ro(name)						
> > \
> > +	static int svs_##name##_debug_open(struct inode *inode,		\
> > +					   struct file *filp)		\
> > +	{								\
> > +		return single_open(filp, svs_##name##_debug_show,	\
> > +				   inode->i_private);			\
> > +	}								\
> > +	static const struct file_operations svs_##name##_debug_fops = {	\
> > +		.owner = THIS_MODULE,					\
> > +		.open = svs_##name##_debug_open,			\
> > +		.read = seq_read,					\
> > +		.llseek = seq_lseek,					\
> > +		.release = single_release,				\
> > +	}
> > +
> > +#define debug_fops_rw(name)						
> > \
> > +	static int svs_##name##_debug_open(struct inode *inode,		\
> > +					   struct file *filp)		\
> > +	{								\
> > +		return single_open(filp, svs_##name##_debug_show,	\
> > +				   inode->i_private);			\
> > +	}								\
> > +	static const struct file_operations svs_##name##_debug_fops = {	\
> > +		.owner = THIS_MODULE,					\
> > +		.open = svs_##name##_debug_open,			\
> > +		.read = seq_read,					\
> > +		.write = svs_##name##_debug_write,			\
> > +		.llseek = seq_lseek,					\
> > +		.release = single_release,				\
> > +	}
> > +
> > +#define svs_dentry(name)	{__stringify(name), &svs_##name##_debug_fops}
> > +
> >   static DEFINE_SPINLOCK(mtk_svs_lock);
> >   
> >   /*
> > @@ -83,6 +118,7 @@ enum svsb_phase {
> >   	SVSB_PHASE_INIT01,
> >   	SVSB_PHASE_INIT02,
> >   	SVSB_PHASE_MON,
> > +	SVSB_PHASE_NUM,
> 
> I would move the addition of these last members in the previous (3/7) patch,
> where you introduce the driver in the first place.
> 
> Also, I think that using _MAX instead would be better, as it is pretty
> much a common practice. So, this would become SVSB_PHASE_MAX.

Okay. I'll move it to previous (3/7) patch. Thanks for advice.

> 
> >   };
> >   
> >   enum svs_reg_index {
> > @@ -140,6 +176,7 @@ enum svs_reg_index {
> >   	SPARE2,
> >   	SPARE3,
> >   	THSLPEVEB,
> > +	SVS_REG_NUM,
> 
> ... and this would become SVS_REG_MAX

Okay. I'll move it to previous (3/7) patch. Thanks for advice.

> 
> >   };
> >   
> >   static const u32 svs_regs_v2[] = {
> 
> Apart from that,
> 
> Acked-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
