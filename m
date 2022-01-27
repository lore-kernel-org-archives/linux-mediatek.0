Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5988AC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Jan 2022 01:14:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gH6dgk6txQk0Rs20mvncbAbyVHCFMRoAjQu7FP3BhSI=; b=Dn3T5W7X95PAMW
	xDmO/BbmhMAA8Xs2jzFLoWJr/Wphvd87lPE2w4j3vctVmnfV0hku/YPEC86kq824y2K5HvyCwmmTY
	+vttbWRrHODJIU64BQY6uUYq4HNhotHtG1avrKB/d5lsPX91NKgNKOyONnyGqYWjGsklle8z/YfOQ
	zlh+Bk6s5GDnYnp7+z+zR++98DSK6bJwjTZ/x5AFKo4FHqWGd829DeTuCzVaV5i294kHu/QeiqB5U
	RzL82DSAEIOtORpfk9uaJFAK0WeRhn5YCFKrZEQr4G7NuiJ/6kZZdLwcJXQvO+NzJcMOh8Zp4GM/R
	80it3lqlSdmDsmCWL6Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nCtMd-00DxEt-Rv; Thu, 27 Jan 2022 01:14:15 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nCtMR-00DxBx-Hs; Thu, 27 Jan 2022 01:14:05 +0000
X-UUID: 32aea186ed8b4c6f85484c4f6218e2d0-20220126
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=GpUQ4B4+UDKm6CHnCf5kMC+UPBbboV+yhEs5Ow9GzbI=; 
 b=ebNnpvtBONXtEWRW+ZEsoMD3A0w9+Ama75uRm7KXkrFY1IVjSVcXJnvJiNh2EoyMvAn22rhvKAUIoyYcu0P+qTn4J4kndFVNc67LDk6Z2pJQ+PnFIk/+fSRAcR21e20DDC5qRCSCD7qoRk9m5siok9Ky0mkJ0RV0m2v90X7L5sE=;
X-UUID: 32aea186ed8b4c6f85484c4f6218e2d0-20220126
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <biao.huang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1623214216; Wed, 26 Jan 2022 18:13:59 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 26 Jan 2022 17:13:58 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Thu, 27 Jan 2022 09:13:56 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 27 Jan 2022 09:13:55 +0800
Message-ID: <5ebfab5e96d957d671a055a342dc56e47c7c4d8a.camel@mediatek.com>
Subject: Re: [PATCH net-next v1 2/9] net: ethernet: mtk-star-emac: modify
 IRQ trigger flags
From: Biao Huang <biao.huang@mediatek.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
CC: David Miller <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>,
 Fabien Parent <fparent@baylibre.com>, Jakub Kicinski <kuba@kernel.org>, Felix
 Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>, Sean Wang
 <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, netdev <netdev@vger.kernel.org>,
 devicetree <devicetree@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux ARM
 <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC..."
 <linux-mediatek@lists.infradead.org>, Yinghua Pan
 <ot_yinghua.pan@mediatek.com>, <srv_heupstream@mediatek.com>, Macpaul Lin
 <macpaul.lin@mediatek.com>
Date: Thu, 27 Jan 2022 09:13:55 +0800
In-Reply-To: <CAMRc=McZTped08HwbM+pr-xtsDyddTLjpsCc_f7ucoDM2DNXaw@mail.gmail.com>
References: <20220120070226.1492-1-biao.huang@mediatek.com>
 <20220120070226.1492-3-biao.huang@mediatek.com>
 <CAMRc=McZTped08HwbM+pr-xtsDyddTLjpsCc_f7ucoDM2DNXaw@mail.gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220126_171403_629268_0F187B7D 
X-CRM114-Status: GOOD (  19.02  )
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

Dear Bartosz,
	Thanks for your comments!

On Tue, 2022-01-25 at 11:22 +0100, Bartosz Golaszewski wrote:
> On Thu, Jan 20, 2022 at 8:02 AM Biao Huang <biao.huang@mediatek.com>
> wrote:
> > 
> > If the flags in request_irq() is IRQF_TRIGGER_NONE, the trigger
> > method
> > is determined by "interrupt" property in dts.
> > So, modify the flag from IRQF_TRIGGER_FALLING to IRQF_TRIGGER_NONE.
> > 
> > Signed-off-by: Biao Huang <biao.huang@mediatek.com>
> > Signed-off-by: Yinghua Pan <ot_yinghua.pan@mediatek.com>
> > ---
> >  drivers/net/ethernet/mediatek/mtk_star_emac.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/net/ethernet/mediatek/mtk_star_emac.c
> > b/drivers/net/ethernet/mediatek/mtk_star_emac.c
> > index 26f5020f2e9c..7c2af775d601 100644
> > --- a/drivers/net/ethernet/mediatek/mtk_star_emac.c
> > +++ b/drivers/net/ethernet/mediatek/mtk_star_emac.c
> > @@ -959,7 +959,7 @@ static int mtk_star_enable(struct net_device
> > *ndev)
> > 
> >         /* Request the interrupt */
> >         ret = request_irq(ndev->irq, mtk_star_handle_irq,
> > -                         IRQF_TRIGGER_FALLING, ndev->name, ndev);
> > +                         IRQF_TRIGGER_NONE, ndev->name, ndev);
> >         if (ret)
> >                 goto err_free_skbs;
> > 
> > --
> > 2.25.1
> > 
> 
> Reviewed-by: Bartosz Golaszewski <brgl@bgdev.pl>
I'll add reviewd-by in next send.
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
