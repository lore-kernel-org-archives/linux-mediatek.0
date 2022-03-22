Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B4F3C433FE
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Mar 2022 06:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QbWCZtELWDmYfEOTMSgjE8e2qmxsJ1LGxhGMXAF4xW0=; b=ObEZGRm9wV5VK4
	rSmwxC1xO1oN07e6wpFI5l8mjZ6quVcVsG2ii4dPOX9Kymn9SpfzYbd1QcePnRn6XfBzG/CxxW/7u
	DtTjOqVacUgG+KjrpmfsoOP4HULwnP/QU7wLA1DER3mwSPRwbXC7ThYPKFFumfEzdTGFEn7+seEmH
	aMv4t1JtXgiX0Wdey+0ACoSlwqX168fhBQQKOXIbVYZ2hT6L4yWX/+5g+Orm1nC6h04qR41uHjH1R
	X7RnTB75EC+k6f3CWBpVZERmn+kUjcW9kihvbC7+5FVxSAQOI44c0kZ9AKkZaTSbXz9jOBn4+qsM6
	+jkdDjwFexaP4zVeODYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWXoc-00A7jo-VI; Tue, 22 Mar 2022 06:16:22 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWXoZ-00A7ha-HR; Tue, 22 Mar 2022 06:16:21 +0000
X-UUID: 20498178aba24efc88a601651ad2ebd0-20220321
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=r9XiYGF+r4DGdsuWk6ifhhx/SbCV8JDgbYfVePoMcHU=; 
 b=PkqTycJuddS3QqRZW1e6AHJsNzV3w04rRrmxJLfaf9kIddG/V9AYJgWDFL4hPQgl/mj0gJVva4wjmHWZHzJkcYsv4zkf5I82pG4T9PWyzIABqWZ+3/8X+zJVl4tvwes7eE1wM0gHIZrE38nMPW4CpymmBJXjl9sNkywvdaAT92w=;
X-UUID: 20498178aba24efc88a601651ad2ebd0-20220321
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <xinlei.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1276139555; Mon, 21 Mar 2022 23:16:12 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 21 Mar 2022 23:16:11 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Tue, 22 Mar 2022 14:16:09 +0800
Received: from mszsdhlt06 (10.16.6.206) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 22 Mar 2022 14:16:09 +0800
Message-ID: <5318b54772ed03744cd6265d3b65679b86ec0532.camel@mediatek.com>
Subject: Re: [PATCH v3, 1/4] drm/mediatek: Adjust the timing of mipi signal
 from LP00 to LP11
From: xinlei.lee <xinlei.lee@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, <chunkuang.hu@kernel.org>,
 <p.zabel@pengutronix.de>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <matthias.bgg@gmail.com>
CC: <jitao.shi@mediatek.com>, <linux-kernel@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <linux-mediatek@lists.infradead.org>, <rex-bc.chen@mediatek.com>,
 <linux-arm-kernel@lists.infradead.org>
Date: Tue, 22 Mar 2022 14:16:29 +0800
In-Reply-To: <0e4344e084e3306cd265580883c0093c7cb40d45.camel@mediatek.com>
References: <1647503611-13144-1-git-send-email-xinlei.lee@mediatek.com>
 <1647503611-13144-2-git-send-email-xinlei.lee@mediatek.com>
 <0e4344e084e3306cd265580883c0093c7cb40d45.camel@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220321_231619_612831_0DA94A14 
X-CRM114-Status: GOOD (  23.34  )
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

On Mon, 2022-03-21 at 17:36 +0800, CK Hu wrote:
> Hi, Xinlei:
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
> > In the new sequence 2 & 3 & 4 will be moved to dsi_enbale in later
> > patch.
> 
> I think there would be one patch in 5.9 make the wrong sequence, so
> add
> 'Fixes' tag to indicate which patch make the wrong sequence. Use the
> term correct/wrong instead old/new sequence.
> 
> I still do not understand what is the sequence after apply this
> patch?
> 
> Does the sequence is this after apply this patch?
> 1. Set the dsi timing register
> 2. Pull the MIPI signal high
> 3. Delay & Dsi_reset
> 4. dsi clk & lanes leave ulp mode and enter hs mode
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

Hi CK:

Thanks for your review!

You are right, the sequence after patching is:
1. Set the dsi timing register
2. Pull the MIPI signal high
3. Delay & Dsi_reset
4. dsi clk & lanes leave ulp mode and enter hs mode

This modification will not affect the dsi function, just to put the
operation of pulling up the mipi signal in poweron together to
facilitate the separation from the poweron function later.

I will add the "Fixes" tag here as well.

BR!
xinlei
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
