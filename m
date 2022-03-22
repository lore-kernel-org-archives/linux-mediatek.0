Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1B56C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Mar 2022 06:10:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v49tS9xKfD4dbGJW7ld3PCSrbzTyUMi8eVjWZ8jfN80=; b=dqpKdh8OZopvI2
	OS0yFVQ/wYJkswb7d//rgaUUoEr1MPSqxw36GxSwz3Zm755PVFTroG6UBG8w10Rx4R0pe7D9q7uwO
	gpJkdPs9rZR01faFf2kN0ROot8Zsg89sVwctpZL3LnPhxAZ2S0PMucIxplmr+s9JPHOxfJDWr26CJ
	nyShR+a4sLSe+dRYQcwUrSTl+PzCFDoCIk27cLEFvAB4nxco3UnUEIQMexv8oa57Xy1ClKCLdp6Cb
	jYv7jyzN6+zOwFq84hmCpLrAagrT6hfOgdOT4APMgIwKQa8b4LiThmKaSEbMZhK8uULkLTiYiD/xL
	O53E+OOP+sOsL4dkAepg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWXiS-00A5r9-AT; Tue, 22 Mar 2022 06:10:00 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWXiD-00A5pb-Gg; Tue, 22 Mar 2022 06:09:48 +0000
X-UUID: f2be2262357943bf89767eb8d439bb45-20220321
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=7W32S13NNaB9h0MWNsObJlUZSrQBOYZFQxHSffzezfM=; 
 b=FI8XgwaKm/S0EI1Jq8UI6EDM+M/JXnL0Vy1ORVeHnwIiM72CXXQsismB5eMlESaRNGBOo7kD0gkYhDozduyj2/MrtPkgGmAEN/cwDKpdUUYMu6kAqhTWCRGnMtZw3CVahl6aiuxwGnlwP8NXXCjJb6iyCm6knwS43Ib6zeu0InA=;
X-UUID: f2be2262357943bf89767eb8d439bb45-20220321
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <xinlei.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1628651889; Mon, 21 Mar 2022 23:09:40 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 21 Mar 2022 22:59:37 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 22 Mar 2022 13:59:36 +0800
Received: from mszsdhlt06 (10.16.6.206) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 22 Mar 2022 13:59:35 +0800
Message-ID: <ca8c83e15808b7c6a54ebd28cead59c18f814023.camel@mediatek.com>
Subject: Re: [PATCH v3,1/4] drm/mediatek: Adjust the timing of mipi signal
 from LP00 to LP11
From: xinlei.lee <xinlei.lee@mediatek.com>
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, <chunkuang.hu@kernel.org>,
 <p.zabel@pengutronix.de>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <matthias.bgg@gmail.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, <jitao.shi@mediatek.com>
Date: Tue, 22 Mar 2022 13:59:56 +0800
In-Reply-To: <235c5bca8da7118bad6bb5cb3c8cba6e022e4411.camel@mediatek.com>
References: <1647503611-13144-1-git-send-email-xinlei.lee@mediatek.com>
 <1647503611-13144-2-git-send-email-xinlei.lee@mediatek.com>
 <235c5bca8da7118bad6bb5cb3c8cba6e022e4411.camel@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220321_230946_999935_66A5DFC9 
X-CRM114-Status: GOOD (  23.37  )
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

On Thu, 2022-03-17 at 19:13 +0800, Rex-BC Chen wrote:
> Hello Xinlei,
> 
> Thanks for your patch, and there are something I want to know:
> 
> On Thu, 2022-03-17 at 15:53 +0800, xinlei.lee@mediatek.com wrote:
> > From: Jitao Shi <jitao.shi@mediatek.com>
> > 
> > Old sequence:
> > 1. Pull the MIPI signal high
> > 2. Delay & Dsi_reset
> > 3. Set the dsi timing register
> > 4. dsi clk & lanes leave ulp mode and enter hs mode
> > 
> > New sequence:
> > 1. Set the dsi timing register
> > 2. Pull the MIPI signal high
> > 3. Delay & Dsi_reset
> > 4. dsi clk & lanes leave ulp mode and enter hs mode
> > 
> 
> Could you explain why you want to change original power on sequence?
> From this commit message, I don't know why you want to do this.
> If the reason is in cover letter, I think you should move them here.
> 
> > In the new sequence 2 & 3 & 4 will be moved to dsi_enbale in later
> > patch.
> 
> I think this is no need to describe here.
> 
> BRs,
> Rex
> > 
> > Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> > Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
> > ---
> >  drivers/gpu/drm/mediatek/mtk_dsi.c | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c
> > b/drivers/gpu/drm/mediatek/mtk_dsi.c
> > index ccb0511b9cd5..262c027d8c2f 100644
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
Hi Rex:

Thanks for your review!
Explain to you that this change does not actually affect the function
of dsi. We have verified this.
After this modification, it is convenient to move them into the if
(!dsi->lanes_ready) condition, which is just an adjustment action.
If you still have questions about my later explanation, please give
another suggestion.

Thanks!
xinlei

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
