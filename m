Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90673C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Apr 2022 13:51:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=th3Ff9rw/4J/1xlsNzOkk10/Cexx1PhUThbwHP4BbWQ=; b=p+Uzx3LjA13lrX
	EX7DD745YwDb78IZe/Zki2htIdJIjKzjFuhTX+VgzoaI3UTpNh+hRNWlqUC0xobSE+wYHw8c/gWWS
	qkCkF5zJ0cbK1dJ5qNCqJd43UVv7oMXJ+FeF7vJAI+HFuaZFD4zckWGlW3Au7Fu8UQ/sL9SD0f+NP
	cWxu3IjqkzlAXn1XMGq9CKOdFDKIUNEBbmcuV4QU4Nq05lil6XkONEXhi1MPaMja311x+r7BMXHw9
	+7SLYm0JbcI/tsSFqPckzrxbdvGxjQp/nYfnPwTMxZP4Xf6nW04SoaUTG1fZexUgYXk//eKHbvY2C
	koZRxtCtkuL9avb+EkAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nc64U-006NHu-KT; Wed, 06 Apr 2022 13:51:42 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nc64R-006NH2-Pr; Wed, 06 Apr 2022 13:51:41 +0000
X-UUID: 5d2812ac25aa438c87b705889e2e2ca6-20220406
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=JtwAlvrr65cRqRSOu7ZRWXY1SNZZVYVR37d1eofpjuM=; 
 b=OjuhmbWISNzuW6pHkNnAQ9ebHobrOe6XhLTNiFWmRdtJr2cQE/FSRAWkzH7WaeIAHgwCmp4yE0326XfUZIdoJoT25ZhqiJz7mopRNO67fAE1r7BaOBLCzANaBpwLZgC3OLO7LB8J193Yul65KDAh1cwcJZaulvemV52ksEh1Tsc=;
X-UUID: 5d2812ac25aa438c87b705889e2e2ca6-20220406
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <xinlei.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1512337847; Wed, 06 Apr 2022 06:51:25 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 6 Apr 2022 06:44:24 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 6 Apr 2022 21:44:16 +0800
Received: from mszsdhlt06 (10.16.6.206) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 6 Apr 2022 21:44:15 +0800
Message-ID: <3b4499162fe184a8158f5bd42baae3d16e188f33.camel@mediatek.com>
Subject: Re: [PATCH v2,2/2] drm/mediatek: Add mt8186 dpi compatible to
 mtk_dpi.c
From: xinlei.lee <xinlei.lee@mediatek.com>
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, <chunkuang.hu@kernel.org>,
 <p.zabel@pengutronix.de>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <robh+dt@kernel.org>, <matthias.bgg@gmail.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, <jitao.shi@mediatek.com>
Date: Wed, 6 Apr 2022 21:44:43 +0800
In-Reply-To: <8e3db8a1285e43dcd397eee444b15957074106ab.camel@mediatek.com>
References: <1648727917-3099-1-git-send-email-xinlei.lee@mediatek.com>
 <1648727917-3099-3-git-send-email-xinlei.lee@mediatek.com>
 <8e3db8a1285e43dcd397eee444b15957074106ab.camel@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220406_065139_891717_8FF70ABF 
X-CRM114-Status: GOOD (  19.06  )
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

On Wed, 2022-04-06 at 15:13 +0800, Rex-BC Chen wrote:
> On Thu, 2022-03-31 at 19:58 +0800, xinlei.lee@mediatek.com wrote:
> > From: Xinlei Lee <xinlei.lee@mediatek.com>
> > 
> > Add the compatible because use different .data in mt8186.
> > 
> > Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
> > ---
> >  drivers/gpu/drm/mediatek/mtk_dpi.c | 11 +++++++++++
> >  1 file changed, 11 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c
> > b/drivers/gpu/drm/mediatek/mtk_dpi.c
> > index 4554e2de1430..6fac146cf1fb 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> > @@ -823,6 +823,14 @@ static const struct mtk_dpi_conf mt8192_conf =
> > {
> >  	.num_output_fmts = ARRAY_SIZE(mt8173_output_fmts),
> >  };
> >  
> > +static const struct mtk_dpi_conf mt8186_conf = {
> > +	.cal_factor =  mt8183_calculate_factor,
> > +	.reg_h_fre_con = 0xe0,
> > +	.max_clock_khz = 150000,
> > +	.output_fmts = mt8183_output_fmts,
> > +	.num_output_fmts = ARRAY_SIZE(mt8183_output_fmts),
> > +};
> > +
> 
> Hello Xinlei,
> 
> Could you move 8186 between 8183 and 8192?
> 
> >  static int mtk_dpi_probe(struct platform_device *pdev)
> >  {
> >  	struct device *dev = &pdev->dev;
> > @@ -945,6 +953,9 @@ static const struct of_device_id
> > mtk_dpi_of_ids[]
> > = {
> >  	{ .compatible = "mediatek,mt8192-dpi",
> >  	  .data = &mt8192_conf,
> >  	},
> > +	{ .compatible = "mediatek,mt8186-dpi",
> > +	  .data = &mt8186_conf,
> > +	},
> 
> ditto
> 
> BRs,
> Rex
> >  	{ },
> >  };
> >  MODULE_DEVICE_TABLE(of, mtk_dpi_of_ids);
> 
> 

Hi Rex:

Thanks for your review.
I will put it between 8183 & 8192 in the next version.
In addition, I will add two properties assigned-clocks & assigned-
clock-parents to dtbing.

Best Regards!
xinlei
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
