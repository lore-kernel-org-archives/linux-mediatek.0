Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CE55C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Feb 2022 05:57:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6Tzm6RKctuRRFiT9ckvL8dNjD6udIrff0d/yzdmC1aY=; b=K9S0FxQUyW60fD
	lPvY94i9KYBir+7KAm4Z8fQU2ClcFFYJ0gSzZ95tGRxC/OHAYTBTl1MsoxB6ADPmGF9il3SlVc7D7
	VVlfVV6zmQBc9yyjEaSh2+gZDD82nR3cYcG5Wj6MyUqKESauc6AI8kgWzF14B2Le45MDqYZgT/V/3
	EgMLU++FdqmldVJ8U5E6DDeTNDFjnJK7YRJAbncxQ8KD264e6S1ZwNhsf1erPQG32wYGPCFt/w+ED
	Ow9htjmA6zqgqrtkhJbJiZsIdLZjYgM9shiNLGMXWyqSHCtERGElz2bWpcmiim1Lv2U4fbEJrImlq
	WoqepxBOL8/hQosFs6Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKZnL-0092Sv-LR; Thu, 17 Feb 2022 05:57:35 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKZn8-0092S8-3z; Thu, 17 Feb 2022 05:57:25 +0000
X-UUID: 75dbc166bab147b9babad5b90016058d-20220216
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=PaxfMW3sIrg8cPxfqOurVPn+h735S8Fxa3FjMv+XlpU=; 
 b=MdqeiJU2ZhGHnRN80yhVWxGh6B9Fueka6t0kfwNMezXILcHb8eYNWObIx16euidC37b2yLPrmn38w0u2pFj7pDjT0oyiPtilzN7F5hCVYKylcIDL3B7N7JogjKfx/vp8XznJmdkx7RtaIsPCE/55ypz6STIY2zIz6yzMSH3kbPI=;
X-UUID: 75dbc166bab147b9babad5b90016058d-20220216
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <xinlei.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1918238800; Wed, 16 Feb 2022 22:57:18 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 16 Feb 2022 21:50:48 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 17 Feb 2022 13:50:47 +0800
Received: from mszsdhlt06 (10.16.6.206) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 17 Feb 2022 13:50:46 +0800
Message-ID: <73de8a9631b771cc153996f2921f67fcae306452.camel@mediatek.com>
Subject: Re: [1/3] drm/mediatek: Adjust the timing of mipi signal from LP00
 to LP11
From: xinlei.lee <xinlei.lee@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, <chunkuang.hu@kernel.org>,
 <p.zabel@pengutronix.de>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <matthias.bgg@gmail.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <rex-bc.chen@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Jitao Shi
 <jitao.shi@mediatek.com>
Date: Thu, 17 Feb 2022 13:50:57 +0800
In-Reply-To: <41af2aa3b3a39d32e409ec355e59c5f8b1e47f43.camel@mediatek.com>
References: <1644589818-13066-1-git-send-email-xinlei.lee@mediatek.com>
 <1644589818-13066-2-git-send-email-xinlei.lee@mediatek.com>
 <41af2aa3b3a39d32e409ec355e59c5f8b1e47f43.camel@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220216_215723_645501_00D2F9AB 
X-CRM114-Status: GOOD (  19.25  )
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

On Mon, 2022-02-14 at 10:54 +0800, CK Hu wrote:
> Hi, Xinlei:
> 
> On Fri, 2022-02-11 at 22:30 +0800, xinlei.lee@mediatek.com wrote:
> > From: Jitao Shi <jitao.shi@mediatek.com>
> > 
> > In order to cooperate with patch 3/3 modification,it is necessary
> > to
> > adjust 
> > the position where mipi pulls up the signal.
> 
> After the patch is applied, the series index (3/3) is disappear, so
> do
> not reference series index in commit description. I think this series
> is to adjust the calling sequence, so you could describe as below:
> 
> Old sequence:
> 1. aaa
> 2. bbb
> 3. ccc
> 4. ddd
> 
> New sequence:
> 1. bbb
> 2. aaa
> 3. ddd
> 4. ccc
> 
> and this patch is to adjust 'aaa' and 'bbb'.
> 
> Regards,
> CK
> 
> > 
> > Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> > Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
> > ---
> >  drivers/gpu/drm/mediatek/mtk_dsi.c | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c
> > b/drivers/gpu/drm/mediatek/mtk_dsi.c
> > index 5d90d2eb..6d7b66d 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> > @@ -649,14 +649,14 @@ static int mtk_dsi_poweron(struct mtk_dsi
> > *dsi)
> >  	mtk_dsi_reset_engine(dsi);
> >  	mtk_dsi_phy_timconfig(dsi);
> >  
> > -	mtk_dsi_rxtx_control(dsi);
> > -	usleep_range(30, 100);
> > -	mtk_dsi_reset_dphy(dsi);
> >  	mtk_dsi_ps_control_vact(dsi);
> >  	mtk_dsi_set_vm_cmd(dsi);
> >  	mtk_dsi_config_vdo_timing(dsi);
> >  	mtk_dsi_set_interrupt_enable(dsi);
> >  
> > +	mtk_dsi_rxtx_control(dsi);
> > +	usleep_range(30, 100);
> > +	mtk_dsi_reset_dphy(dsi);
> >  	mtk_dsi_clk_ulp_mode_leave(dsi);
> >  	mtk_dsi_lane0_ulp_mode_leave(dsi);
> >  	mtk_dsi_clk_hs_mode(dsi, 0);
> 
> 

Hi CK:

Thanks for your review!
I will be sending out v2 in the near future based on your suggestion.

Best Regards!
xinlei
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
