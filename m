Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 912C1C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Apr 2022 10:39:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qA529lOgC5L8BFxT7PQFGO20//eEK1dKP5Z1lfcCAEI=; b=oU5sj6P73l4oEL
	KbcMXOX443zOK6cUb/7+f7UJd7t8pVS8yiuSbqcw2Oufmd0ZZrDaqGVVpWdiT4QTdiFzdlAsTe5Bx
	jN/Xcd7pe8b9gI6h/9qom9QqfVoohphM9/J3c04sOVlwqP4MNQnxvKPvpvuBUiZpewajcBNPVBfW2
	R6Mwa0zexeJWSrTZ9XizOVY1wqnCKZ6cUYbDplGDOwJMXkz/f00fCSMIJsagDxCFAtv1caY/cZshQ
	DfAU6cHv7bEwfmRhsCb1+5CllS1YwvmZo9zdqs8QghDpFjWiR4JlUY6LI474wdopZE6Gu6R95UdQ8
	quAIBDhH5UNENh/k49vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njIbO-00DxQ2-Dd; Tue, 26 Apr 2022 10:39:26 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njIaf-00Dx3V-Q8; Tue, 26 Apr 2022 10:38:43 +0000
X-UUID: ef85be2eefd24b508ea67840233896c8-20220426
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:09c560dc-e691-484e-9fb7-9f8efc44afa6, OB:0,
 LO
 B:0,IP:0,URL:8,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:8
X-CID-META: VersionHash:faefae9, CLOUDID:624fc02e-6199-437e-8ab4-9920b4bc5b76,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: ef85be2eefd24b508ea67840233896c8-20220426
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <nancy.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1499099446; Tue, 26 Apr 2022 03:38:39 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 26 Apr 2022 03:28:36 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 26 Apr 2022 18:28:34 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 26 Apr 2022 18:28:34 +0800
Message-ID: <2e336c54b07cf5b661fd4a613545a932bca792fb.camel@mediatek.com>
Subject: Re: [PATCH v17 13/21] drm/mediatek: add display merge async reset
 control
From: Nancy.Lin <nancy.lin@mediatek.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, <wim@linux-watchdog.org>, "AngeloGioacchino Del
 Regno" <angelogioacchino.delregno@collabora.com>, <linux@roeck-us.net>
CC: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, "Nathan
 Chancellor" <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>,
 "jason-jh . lin" <jason-jh.lin@mediatek.com>, Yongqiang Niu
 <yongqiang.niu@mediatek.com>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <dri-devel@lists.freedesktop.org>,
 <llvm@lists.linux.dev>, <singo.chang@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Tue, 26 Apr 2022 18:28:34 +0800
In-Reply-To: <b4f438026fe208f8f6511de34c7e84c8c59d843c.camel@pengutronix.de>
References: <20220416020749.29010-1-nancy.lin@mediatek.com>
 <20220416020749.29010-14-nancy.lin@mediatek.com>
 <b4f438026fe208f8f6511de34c7e84c8c59d843c.camel@pengutronix.de>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220426_033841_872041_D064CFCA 
X-CRM114-Status: GOOD (  21.97  )
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

Hi Philipp,

Thanks for the review.

On Mon, 2022-04-25 at 11:58 +0200, Philipp Zabel wrote:
> On Sa, 2022-04-16 at 10:07 +0800, Nancy.Lin wrote:
> > Add merge async reset control in mtk_merge_stop. Async hw doesn't
> > do self
> > reset on each sof signal(start of frame), so need to reset the
> > async to
> > clear the hw status for the next merge start.
> > 
> > Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> > Reviewed-by: CK Hu <ck.hu@mediatek.com>
> > Reviewed-by: AngeloGioacchino Del Regno <
> > angelogioacchino.delregno@collabora.com>
> > ---
> >  drivers/gpu/drm/mediatek/mtk_disp_merge.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/mediatek/mtk_disp_merge.c
> > b/drivers/gpu/drm/mediatek/mtk_disp_merge.c
> > index 9dca145cfb71..177473fa8160 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_disp_merge.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_disp_merge.c
> > @@ -8,6 +8,7 @@
> >  #include <linux/of_device.h>
> >  #include <linux/of_irq.h>
> >  #include <linux/platform_device.h>
> > +#include <linux/reset.h>
> >  #include <linux/soc/mediatek/mtk-cmdq.h>
> >  
> > 
> > 
> > 
> >  #include "mtk_drm_ddp_comp.h"
> > @@ -79,6 +80,9 @@ void mtk_merge_stop(struct device *dev)
> >  	struct mtk_disp_merge *priv = dev_get_drvdata(dev);
> >  
> > 
> > 
> > 
> >  	mtk_merge_stop_cmdq(dev, NULL);
> > +
> > +	if (priv->async_clk)
> > +		device_reset_optional(dev);
> 
> To avoid the overhead of looking up the reset control in the device
> tree every time, it would be better to request a reset control during
> probe using devm_reset_control_get_optional_exclusive(). Here you'd
> just call reset_control_reset().
> 
> regards
> Philipp

OK. I will refine it in the next revision.

Regards,
Nancy


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
