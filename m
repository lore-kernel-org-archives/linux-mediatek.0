Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65C39C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Mar 2022 10:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d4SZUdDKlKQu9FX81epa0O8EpVyDs5AbRhsWXMqwjQU=; b=0IqP2OVATcVpVS
	efeoTFxm0q/T++2y2N3J2KuQAqcInBi1/8m2dW16hcvMmXQp1H4TJfYvBb5MrqfLTC1SHanUjLITF
	9cWMHw8AjmPT2lIQzD+Lj5qMLUdMbrxJc94M2QiS04emIZ/dWH/rZAfjFC0N+xTH+Av14gIxiDYMa
	Y8pH9MOnrYyh9yFUPFhQDQCp7kDuWVjfHE5Kduoyc/0LUanfITzM+qVhUcxvV4oBpQM98CpIxZGk1
	kgv6l8LV729nDmosH65QI5cXE3VHXCGi92rF8UOPnB68CfpN/W8giYrniEM12CFyKsibIA2S1BoWL
	ReZkj/pKytdrcDpBMdKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWbJF-00Af7v-0J; Tue, 22 Mar 2022 10:00:13 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWbJC-00Af7N-LQ; Tue, 22 Mar 2022 10:00:12 +0000
X-UUID: 8928262ff5f049a490f8d8aa82b98291-20220322
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=803QjYBM9TC9/gGxHXbmDE6nVV/Vo+kxPLk/Xcp+MZE=; 
 b=s3v2A8LAmMiaw0FCi4cF5rcjdT8O089KtHBtl8H/zmgv3xIhst1YnBzBffylve7yd0Qs+NOtzeQ9K5cRAv29R7aRkiZ1ppyCKHRn0okQ8NzGmyTYrLRcO6kZAAwHUXV8SkZ3E/7XdKv5IULx4QYY2nDRYrYG8nTWlQIAia0GePU=;
X-UUID: 8928262ff5f049a490f8d8aa82b98291-20220322
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <xinlei.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 99002686; Tue, 22 Mar 2022 03:00:07 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 22 Mar 2022 03:00:05 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Tue, 22 Mar 2022 18:00:04 +0800
Received: from mszsdhlt06 (10.16.6.206) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 22 Mar 2022 18:00:03 +0800
Message-ID: <55eba6e4285ee6e4edb436f339b88730cc2c651c.camel@mediatek.com>
Subject: Re: [PATCH v3,4/4] drm/mediatek: Add pull-down MIPI operation in
 mtk_dsi_poweroff function
From: xinlei.lee <xinlei.lee@mediatek.com>
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, <chunkuang.hu@kernel.org>,
 <p.zabel@pengutronix.de>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <matthias.bgg@gmail.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, <jitao.shi@mediatek.com>
Date: Tue, 22 Mar 2022 18:00:24 +0800
In-Reply-To: <ebcf547ab6e4481e6c8e60db88eccf58fe7059ed.camel@mediatek.com>
References: <1647503611-13144-1-git-send-email-xinlei.lee@mediatek.com>
 <1647503611-13144-5-git-send-email-xinlei.lee@mediatek.com>
 <ebcf547ab6e4481e6c8e60db88eccf58fe7059ed.camel@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220322_030010_736196_A060D4F8 
X-CRM114-Status: GOOD (  20.74  )
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

On Thu, 2022-03-17 at 20:20 +0800, Rex-BC Chen wrote:
> Hello Xinlei,
> 
> On Thu, 2022-03-17 at 15:53 +0800, xinlei.lee@mediatek.com wrote:
> > From: Xinlei Lee <xinlei.lee@mediatek.com>
> > 
> > In the dsi_enable function, mtk_dsi_rxtx_control is to
> > pull up the MIPI signal operation. Before dsi_disable,
> > MIPI should also be pulled down by writing a register instead of
> > disabling dsi.
> > 
> 
> What will happen if you do not pulled down the mipi before disable
> dsi?
> What's differnet for this two setting?
> 
> > Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> > Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
> > ---
> >  drivers/gpu/drm/mediatek/mtk_dsi.c | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c
> > b/drivers/gpu/drm/mediatek/mtk_dsi.c
> > index b509d59235e2..1c6a75a46b67 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> > @@ -676,6 +676,8 @@ static void mtk_dsi_poweroff(struct mtk_dsi
> > *dsi)
> >  	mtk_dsi_reset_engine(dsi);
> >  	mtk_dsi_lane0_ulp_mode_enter(dsi);
> >  	mtk_dsi_clk_ulp_mode_enter(dsi);
> > +	/* set the lane number as 0 */
> > +	writel(0, dsi->regs + DSI_TXRX_CTRL);
> 
> So set lane num to 0 means pull down mipi?
> 
> BRs,
> Rex
> 
> >  
> >  	mtk_dsi_disable(dsi);
> >  
> 
> 

Hi rex:

1. 
If you disable dsi without pulling the mipi signal low, the value of
the register will still maintain the setting of the mipi signal being
pulled high. 
After resume, even if the mipi signal is not pulled high, it will still
be in the high state.

2.So set lane num to 0 means pull down mipi
=> yes

Do you have any suggestions on the next version?

Best Regards!
xinlei
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
