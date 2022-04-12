Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 712F2C433FE
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Apr 2022 13:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b82ngNovZ1UkU9B9XefEK0FZjbdJI6f1ZClTb4CBACY=; b=Y2L45Nfh3VeZtA
	hrchlZiv46r3fpQNhDBZ8K1lWDwBS1bpkrnR7rnFc9RTvjfDHjQbIf7Egu2idnwMvYBhCzlQJ0omy
	G+9JcHzrIJEcVRyf6Y99Xtvaqkh5nI3xoYA9ZpyG/y/TIiSR2Aa/dyE3AVfiymy4wfNt5E0NMIOXq
	Fub5Q6Htu2+j/z4s6ZYyT2YB4xCblgcFYlttnupB0wwfQto1fv4NMkMCrAi6C1xm97Kpnf4qT7cUd
	dk9wgciMs45TYXsnO09sc1tMIWMBn5o9VJDYEPg3jxNHOF6CQz4+j8B2ONOWETQvRQisLCnPVNo/8
	IKKaZtVzfFEO8Sqjv1Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neGC5-00EPA9-48; Tue, 12 Apr 2022 13:04:29 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neG9U-00ENya-U5; Tue, 12 Apr 2022 13:01:50 +0000
X-UUID: 6bfbb553eac54853bcba6e9564a99f56-20220412
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=2eNqBKYVDEXgIb1bueRsex+XmlGxHrgJfG0Z1xbMrPU=; 
 b=iToQKtwEHTgCXNzO8yYFQr8PBAtHt1abCN/QrkmRzCj+wyprDt85bfDDxbnn1I6p31wwQFsZaGPM442H1PvPqm4+CdE6+HDdHMj39S7OfPn0A8CsP2+72ZtRTRzi+EWjhZlXpnZM2kw3qz02b9hVnYKOAodNC3pzylfMfhlH7ww=;
X-UUID: 6bfbb553eac54853bcba6e9564a99f56-20220412
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <xinlei.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1715801590; Tue, 12 Apr 2022 06:01:42 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 12 Apr 2022 05:56:21 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 12 Apr 2022 20:56:07 +0800
Received: from mszsdhlt06 (10.16.6.206) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 12 Apr 2022 20:56:05 +0800
Message-ID: <07f7e011dce0f443df3f259b9e1a8b4db90dc803.camel@mediatek.com>
Subject: Re: [PATCH v4,2/2] drm/mediatek: Add mt8186 dpi compatible to
 mtk_dpi.c
From: xinlei.lee <xinlei.lee@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, <chunkuang.hu@kernel.org>,
 <p.zabel@pengutronix.de>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <robh+dt@kernel.org>, <matthias.bgg@gmail.com>
CC: <devicetree@vger.kernel.org>, <jitao.shi@mediatek.com>,
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <linux-mediatek@lists.infradead.org>, <rex-bc.chen@mediatek.com>,
 <linux-arm-kernel@lists.infradead.org>
Date: Tue, 12 Apr 2022 20:56:36 +0800
In-Reply-To: <17f8b17fee57115fb885e86a4b9aab4e7ed2df86.camel@mediatek.com>
References: <1649645584-13186-1-git-send-email-xinlei.lee@mediatek.com>
 <1649645584-13186-3-git-send-email-xinlei.lee@mediatek.com>
 <17f8b17fee57115fb885e86a4b9aab4e7ed2df86.camel@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220412_060149_027878_D7357A57 
X-CRM114-Status: GOOD (  19.89  )
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

On Tue, 2022-04-12 at 16:20 +0800, CK Hu wrote:
> Hi, Xinlei:
> 
> On Mon, 2022-04-11 at 10:53 +0800, xinlei.lee@mediatek.com wrote:
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
> > index 4554e2de1430..824d7da41c6a 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> > @@ -815,6 +815,14 @@ static const struct mtk_dpi_conf mt8183_conf =
> > {
> >  	.num_output_fmts = ARRAY_SIZE(mt8183_output_fmts),
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
> >  static const struct mtk_dpi_conf mt8192_conf = {
> >  	.cal_factor = mt8183_calculate_factor,
> >  	.reg_h_fre_con = 0xe0,
> > @@ -942,6 +950,9 @@ static const struct of_device_id
> > mtk_dpi_of_ids[]
> > = {
> >  	{ .compatible = "mediatek,mt8183-dpi",
> >  	  .data = &mt8183_conf,
> >  	},
> > +	{ .compatible = "mediatek,mt8186-dpi",
> > +	  .data = &mt8186_conf,
> 
> If Nicolas' patch [1] is correct, this should be
> 
> .data = &mt8192_conf,
> 
> Could you help to comfirm patch [1] is correct or not?
> 
> [1] 
> 
https://patchwork.kernel.org/project/linux-mediatek/patch/20220408013950.674477-1-nfraprado@collabora.com/
> 
> Regards,
> CK
> 
> > +	},
> >  	{ .compatible = "mediatek,mt8192-dpi",
> >  	  .data = &mt8192_conf,
> >  	},
> 
> 

Hi CK:

Thanks for your review.
I checked that mt8186_conf & mt8192_conf are the same.
In the next version, I will remove mt8186_conf and reuse mt8192_conf.

Best Regards!
xinlei
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
