Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 760FDC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Apr 2022 05:11:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=txyTpjBm71iiPl2p77a9/XsD2o80zkEhHCDbTXTqQAU=; b=UMCjmtzGA1dr9M
	f4OYEbbQ6/xbTH2XXbz0uUgBffcACIlZnLE5hGMJcgE3iRa3Rbdl5dvEq4TjeexDhyTu1rXcMr80k
	pG0To1/t1MyCQKMe1XTfNYA+bbAhZmKstAWctg+x/T6872IQJqHqT6Fcf8s4hTwOouWcvuQLVdtIm
	uhfB3N3+ns3BkTIZL/yTcs4vbD1TF4mvzcvp+z2R2K0eYrFAPyWBV7LTZ63KMNyzEGilGLt6JuE8Q
	5PS2jeC51l+nRZlcm4+5GeatvO9RMpxKKiL2KFu8ubB7W+zdxyaVQ8p9E/xjLomfCZZssu3fSMh7y
	/Ar/nrir/x3gfrEFymGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhlZR-00GBCb-F5; Fri, 22 Apr 2022 05:11:05 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhlZ8-00GB4C-VS; Fri, 22 Apr 2022 05:10:48 +0000
X-UUID: 5c727d5bff2341d28fb85af4d0139d45-20220421
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:b2656b75-f0b5-4574-bb93-01ccdae177a6, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:2,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:2
X-CID-META: VersionHash:faefae9, CLOUDID:fbdcbaef-06b0-4305-bfbf-554bfc9d151a,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:4,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 5c727d5bff2341d28fb85af4d0139d45-20220421
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1434160254; Thu, 21 Apr 2022 22:10:42 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 21 Apr 2022 22:00:40 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 22 Apr 2022 13:00:38 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 22 Apr 2022 13:00:38 +0800
Message-ID: <b185812f94da4cef829c7e2a93c6419568196af4.camel@mediatek.com>
Subject: Re: [PATCH V2 03/12] clk: mediatek: reset: Refine functions of set_clr
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 <mturquette@baylibre.com>, <sboyd@kernel.org>
CC: <matthias.bgg@gmail.com>, <p.zabel@pengutronix.de>,
 <chun-jie.chen@mediatek.com>, <wenst@chromium.org>,
 <runyang.chen@mediatek.com>, <linux-kernel@vger.kernel.org>,
 <allen-kh.cheng@mediatek.com>, <linux-clk@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Fri, 22 Apr 2022 13:00:38 +0800
In-Reply-To: <d833bb7f-ee48-602d-9793-5d717d3b5582@collabora.com>
References: <20220420130527.23200-1-rex-bc.chen@mediatek.com>
 <20220420130527.23200-4-rex-bc.chen@mediatek.com>
 <d833bb7f-ee48-602d-9793-5d717d3b5582@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220421_221047_048735_914B8198 
X-CRM114-Status: GOOD (  18.38  )
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

On Thu, 2022-04-21 at 11:07 +0200, AngeloGioacchino Del Regno wrote:
> Il 20/04/22 15:05, Rex-BC Chen ha scritto:
> > To make driver more readable, revise functions of set_clr.
> > - Add to_rst_data().
> > - Extract common code within assert and deassert to
> >    mtk_reset_update_set_clr().
> > 
> > Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> > ---
> >   drivers/clk/mediatek/reset.c | 32 +++++++++++++++++++++--------
> > ---
> >   1 file changed, 21 insertions(+), 11 deletions(-)
> > 
> > diff --git a/drivers/clk/mediatek/reset.c
> > b/drivers/clk/mediatek/reset.c
> > index 9110d0b4229f..6574b19daf0f 100644
> > --- a/drivers/clk/mediatek/reset.c
> > +++ b/drivers/clk/mediatek/reset.c
> > @@ -20,26 +20,36 @@ struct mtk_reset {
> >   	struct reset_controller_dev rcdev;
> >   };
> >   
> > -static int mtk_reset_assert_set_clr(struct reset_controller_dev
> > *rcdev,
> > -	unsigned long id)
> > +static inline struct mtk_reset *to_rst_data(struct
> > reset_controller_dev *rcdev)
> 
> to_mtk_reset() looks more consistent, as many developers are using
> the naming
> "to_{struct_name}".

Hello Angelo,

ok, I will fix this in next version.

> 
> Also, can you please mention the indentation fixes in the commit
> description?
> 

I add another refinement patch in next version.

BRs,
Rex

> Thanks,
> Angelo
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
