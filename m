Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BE15C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Apr 2022 03:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=66+oHld8NvoJ8Fqym9ocfKe0bZE5He9QNp/e4Km4Dzo=; b=UdhykP8FzM1xUX
	zRhKhgRwaR2RfbTmmM4F0pXMHWrqgHr869ouTRYwVlkUZxw+OfgIQGI/NvKhdD6KmEKa/JDvcNCSV
	RjPL0PXQSFoWIVqbNvAKBo81MKS8DiTKZFEty9cQGTv2uyfcDgxi2vcEPkyGBADU/HAjIDVzynhlY
	6+0mYDljX6CuAsAPbPLlxrFO1ByKvoWcWw+uZiiJ/cD24QN1sye7ISQfgES0bgxbsQyFYcUB4aAAe
	bTTJxd5qe+vOB/oXCUhhkBgTf+qC5PtGPaPrgON+TVWwEq9V6yeCt46/j5+2VnPgrgIvFzu7pr4dL
	UxC975M8muCPDMNVm4+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhkRa-00Fwm3-VP; Fri, 22 Apr 2022 03:58:55 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhkRY-00Fwl9-25; Fri, 22 Apr 2022 03:58:53 +0000
X-UUID: 1a8c0cee4eee4ba7b466c3c65e58e63f-20220421
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:8299cbf4-b553-481a-92d8-33cef5675936, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:6,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:6
X-CID-META: VersionHash:faefae9, CLOUDID:ccafb8ef-06b0-4305-bfbf-554bfc9d151a,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:4,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 1a8c0cee4eee4ba7b466c3c65e58e63f-20220421
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 128927348; Thu, 21 Apr 2022 20:58:45 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 21 Apr 2022 20:58:44 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 22 Apr 2022 11:58:36 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 22 Apr 2022 11:58:36 +0800
Message-ID: <496c00b0225e8e2ce567225b94e1ce0f3ab8096d.camel@mediatek.com>
Subject: Re: [PATCH V2 02/12] clk: mediatek: reset: Use simple reset operations
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: Chen-Yu Tsai <wenst@chromium.org>
CC: <mturquette@baylibre.com>, <sboyd@kernel.org>, <matthias.bgg@gmail.com>,
 <p.zabel@pengutronix.de>, <angelogioacchino.delregno@collabora.com>,
 <chun-jie.chen@mediatek.com>, <runyang.chen@mediatek.com>,
 <linux-kernel@vger.kernel.org>, <allen-kh.cheng@mediatek.com>,
 <linux-clk@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Fri, 22 Apr 2022 11:58:36 +0800
In-Reply-To: <CAGXv+5FJBKYoEuazH9broYSM4uOy=e_3O-86tOOQrsp0xH=4wQ@mail.gmail.com>
References: <20220420130527.23200-1-rex-bc.chen@mediatek.com>
 <20220420130527.23200-3-rex-bc.chen@mediatek.com>
 <CAGXv+5FJBKYoEuazH9broYSM4uOy=e_3O-86tOOQrsp0xH=4wQ@mail.gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220421_205852_158244_E6CDABF0 
X-CRM114-Status: GOOD (  23.18  )
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

Hello Cehn-Yu,

On Thu, 2022-04-21 at 15:52 +0800, Chen-Yu Tsai wrote:
> On Wed, Apr 20, 2022 at 9:05 PM Rex-BC Chen <rex-bc.chen@mediatek.com
> > wrote:
> > 
> > There are two version for clock reset register control of MediaTek
> > SoCs.
> > The reset operations before MT8183 can use simple reset to cover.
> 
> I would go slightly into more detail, i.e.
> 
>     The old hardware is one bit per reset control, and does not have
>     separate registers for bit set, clear and read-back operations.
> This
>     matches the scheme supported by the simple reset driver. ...
> 
> > Therefore, we replace mtk_reset_ops with reset_simple_ops.
> 
>    ... to remove redundant code.
> 
> The "why" is more important than "what" in commit logs. "What" you
> did
> is already visible in the diff.
> 

Got it, I will modify this in next version.

> > In addition, we also rename mtk_register_reset_controller to
> > mtk_register_reset_controller_simple.
> > 
> > Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> > ---
> >  drivers/clk/mediatek/Kconfig          |  1 +
> >  drivers/clk/mediatek/clk-mt2701-eth.c |  2 +-
> >  drivers/clk/mediatek/clk-mt2701-g3d.c |  2 +-
> >  drivers/clk/mediatek/clk-mt2701-hif.c |  2 +-
> >  drivers/clk/mediatek/clk-mt2701.c     |  4 +--
> >  drivers/clk/mediatek/clk-mt2712.c     |  4 +--
> >  drivers/clk/mediatek/clk-mt7622-eth.c |  2 +-
> >  drivers/clk/mediatek/clk-mt7622-hif.c |  4 +--
> >  drivers/clk/mediatek/clk-mt7622.c     |  4 +--
> >  drivers/clk/mediatek/clk-mt7629-eth.c |  2 +-
> >  drivers/clk/mediatek/clk-mt7629-hif.c |  4 +--
> >  drivers/clk/mediatek/clk-mt8135.c     |  4 +--
> >  drivers/clk/mediatek/clk-mt8173.c     |  4 +--
> >  drivers/clk/mediatek/clk-mtk.h        |  6 ++--
> >  drivers/clk/mediatek/reset.c          | 43 +++------------------
> > ------
> >  15 files changed, 27 insertions(+), 61 deletions(-)
> 
> [...]
> 
> >  void mtk_register_reset_controller_set_clr(struct device_node *np,
> >         unsigned int num_regs, int regofs)
> >  {
> >         mtk_register_reset_controller_common(np, num_regs, regofs,
> > -               &mtk_reset_ops_set_clr);
> > +                                            &mtk_reset_ops_set_clr
> > );
> 
> This change is unrelated and should not be included.
> 
> ChenYu
> 

I add a refinement patch in next version, and I will move this to that
patch.

BRs,
Rex

> 
> >  }
> > 
> >  MODULE_LICENSE("GPL");
> > --
> > 2.18.0
> > 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
