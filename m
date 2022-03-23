Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B20AC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Mar 2022 11:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jfl0Qq+Iw4Xtb/39mWDl/cKE1xLScJTXiTj6sCJ8FY4=; b=nA9leomJOgpb69
	b115W0xUkn9dnhUYPefjNpmtj0sInNXUOSoPlrAabldK6VYwWZqErglM/ljYb2tHg/PMtrDydLSyC
	lNldj6j0hRSQ7t9+agziE0o2cDj08GD4XLxMp41d11JjQHzQITq3GOPcMx+2tmYz50ii9ECIO0i+l
	5egqfAplVV9HfXHvRCuqAFP8PsyFymA6Wd5srUMBXDbhmR7bpIDNjhs4emGNCtZJmfVN8+5n1Ieg7
	YMGjYZEEkbPW59XqD1uFxYY27N4BxOhRb9dyi0IirBvUdLMj2g2qGuLyAB0rMrO7rSPPF9HmjnFKo
	8yzYq6xtRb76BE5juSvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWzZY-00DWa8-Qw; Wed, 23 Mar 2022 11:54:40 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWzZL-00DWWF-Ql; Wed, 23 Mar 2022 11:54:29 +0000
X-UUID: 76c6583ba0b644afa1101c597f612571-20220323
X-UUID: 76c6583ba0b644afa1101c597f612571-20220323
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 88770078; Wed, 23 Mar 2022 04:54:24 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 23 Mar 2022 04:54:22 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 23 Mar 2022 19:54:21 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 23 Mar 2022 19:54:20 +0800
Message-ID: <53f433cc2de187096534d522dc19d301a1c0500f.camel@mediatek.com>
Subject: Re: [PATCH v3,4/4] drm/mediatek: Add pull-down MIPI operation in
 mtk_dsi_poweroff function
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: xinlei.lee <xinlei.lee@mediatek.com>, <chunkuang.hu@kernel.org>,
 <p.zabel@pengutronix.de>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <matthias.bgg@gmail.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, <jitao.shi@mediatek.com>
Date: Wed, 23 Mar 2022 19:54:20 +0800
In-Reply-To: <55eba6e4285ee6e4edb436f339b88730cc2c651c.camel@mediatek.com>
References: <1647503611-13144-1-git-send-email-xinlei.lee@mediatek.com>
 <1647503611-13144-5-git-send-email-xinlei.lee@mediatek.com>
 <ebcf547ab6e4481e6c8e60db88eccf58fe7059ed.camel@mediatek.com>
 <55eba6e4285ee6e4edb436f339b88730cc2c651c.camel@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220323_045427_906803_3E6924E2 
X-CRM114-Status: GOOD (  24.85  )
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

On Tue, 2022-03-22 at 18:00 +0800, xinlei.lee wrote:
> On Thu, 2022-03-17 at 20:20 +0800, Rex-BC Chen wrote:
> > Hello Xinlei,
> > 
> > On Thu, 2022-03-17 at 15:53 +0800, xinlei.lee@mediatek.com wrote:
> > > From: Xinlei Lee <xinlei.lee@mediatek.com>
> > > 
> > > In the dsi_enable function, mtk_dsi_rxtx_control is to
> > > pull up the MIPI signal operation. Before dsi_disable,
> > > MIPI should also be pulled down by writing a register instead of
> > > disabling dsi.
> > > 
> > 
> > What will happen if you do not pulled down the mipi before disable
> > dsi?
> > What's differnet for this two setting?
> > 
> > > Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> > > Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
> > > ---
> > >  drivers/gpu/drm/mediatek/mtk_dsi.c | 2 ++
> > >  1 file changed, 2 insertions(+)
> > > 
> > > diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c
> > > b/drivers/gpu/drm/mediatek/mtk_dsi.c
> > > index b509d59235e2..1c6a75a46b67 100644
> > > --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> > > +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> > > @@ -676,6 +676,8 @@ static void mtk_dsi_poweroff(struct mtk_dsi
> > > *dsi)
> > >  	mtk_dsi_reset_engine(dsi);
> > >  	mtk_dsi_lane0_ulp_mode_enter(dsi);
> > >  	mtk_dsi_clk_ulp_mode_enter(dsi);
> > > +	/* set the lane number as 0 */

Hello Xinlei,

I think you can write this comment more detailed, like
"/* set the lane number as 0 to pull down mipi */"

> > > +	writel(0, dsi->regs + DSI_TXRX_CTRL);
> > 
> > So set lane num to 0 means pull down mipi?
> > 
> > BRs,
> > Rex
> > 
> > >  
> > >  	mtk_dsi_disable(dsi);
> > >  
> > 
> > 
> 
> Hi rex:
> 
> 1. 
> If you disable dsi without pulling the mipi signal low, the value of
> the register will still maintain the setting of the mipi signal being
> pulled high. 
> After resume, even if the mipi signal is not pulled high, it will
> still
> be in the high state.
> 

I think you can describe this in commit message


BRs,
Rex

> 2.So set lane num to 0 means pull down mipi
> => yes
> 
> Do you have any suggestions on the next version?
> 
> Best Regards!
> xinlei
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
