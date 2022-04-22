Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF9E6C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Apr 2022 04:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7U4JW4nlwnB58x3ooljJMu7p1grqc/w0yMm+8h8EpaQ=; b=fZR6Is84rJWGS1
	cC+7CRucuJ1g2yMA6tRSq2GH5vNOJj0jjg5lV0VRz4hp5AgchSlfGu93olGmbfrm/IQdxxbByVbGe
	EFoajtw0v3OqiuCe9cWmbSNuJxNVtSKVLTlQVWTdZFLxBJP0umWXbAC5mmzS3I8AXTfIjDGy8eTnL
	ECrg8xTAM3b4g8dTt7VrKIzHNm0180BzN/9FDAccwrNEUcEI7beFRn6NMbZ4JBNqbXtLlcCjNtepX
	03C9xITHn4415v5OCAUIJfUCZ6wL7O5EbV2av0TQEz8RyuozcP0bsHu9Cx3E5XGEjxUIZNtE565D4
	LZMRGSbSqLth0VonzYzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhkT7-00Fx3m-M1; Fri, 22 Apr 2022 04:00:29 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhkT5-00Fx2V-Ba; Fri, 22 Apr 2022 04:00:28 +0000
X-UUID: f8b2247aa5ca4ffa898efa87c28f9b41-20220421
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:1e1b2000-2072-4b0e-984d-629d0bbaeccd, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:6,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:6
X-CID-META: VersionHash:faefae9, CLOUDID:21beb8ef-06b0-4305-bfbf-554bfc9d151a,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:4,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: f8b2247aa5ca4ffa898efa87c28f9b41-20220421
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1193708086; Thu, 21 Apr 2022 21:00:18 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 21 Apr 2022 21:00:17 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 22 Apr 2022 12:00:15 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 22 Apr 2022 12:00:15 +0800
Message-ID: <6238e4bb6854fea0b075a99662a961a2d2d88cde.camel@mediatek.com>
Subject: Re: [PATCH V2 11/12] clk: mediatek: reset: Add infra_ao reset
 support for MT8192
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: Chen-Yu Tsai <wenst@chromium.org>
CC: "mturquette@baylibre.com" <mturquette@baylibre.com>, "sboyd@kernel.org"
 <sboyd@kernel.org>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>, Chun-Jie Chen
 =?UTF-8?Q?=28=E9=99=B3=E6=B5=9A=E6=A1=80=29?= <Chun-Jie.Chen@mediatek.com>,
 Runyang Chen =?UTF-8?Q?=28=E9=99=88=E6=B6=A6=E6=B4=8B=29?=
 <Runyang.Chen@mediatek.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, Allen-KH Cheng
 =?UTF-8?Q?=28=E7=A8=8B=E5=86=A0=E5=8B=B3=29?= <Allen-KH.Cheng@mediatek.com>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-mediatek@lists.infradead.org"
 <linux-mediatek@lists.infradead.org>, Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Fri, 22 Apr 2022 12:00:15 +0800
In-Reply-To: <CAGXv+5HMe7LaXiMJofW4ZT0Ku70mNAt2A=98YzZbx-frF7kQGQ@mail.gmail.com>
References: <20220420130527.23200-1-rex-bc.chen@mediatek.com>
 <20220420130527.23200-12-rex-bc.chen@mediatek.com>
 <CAGXv+5HMe7LaXiMJofW4ZT0Ku70mNAt2A=98YzZbx-frF7kQGQ@mail.gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220421_210027_451494_08305A80 
X-CRM114-Status: GOOD (  27.87  )
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

Hello Chen-Yu,

On Thu, 2022-04-21 at 14:53 +0800, Chen-Yu Tsai wrote:
> On Wed, Apr 20, 2022 at 9:05 PM Rex-BC Chen <rex-bc.chen@mediatek.com
> > wrote:
> > 
> > The infra_ao reset is needed for MT8192. Therefore, we add this
> > patch
> > to support it.
> > 
> > Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> > ---
> >  drivers/clk/mediatek/clk-mt8192.c         | 11 +++++++++++
> >  include/dt-bindings/reset/mt8192-resets.h | 11 +++++++++++
> >  2 files changed, 22 insertions(+)
> > 
> > diff --git a/drivers/clk/mediatek/clk-mt8192.c
> > b/drivers/clk/mediatek/clk-mt8192.c
> > index ab27cd66b866..7926b83b9035 100644
> > --- a/drivers/clk/mediatek/clk-mt8192.c
> > +++ b/drivers/clk/mediatek/clk-mt8192.c
> > @@ -1114,6 +1114,13 @@ static const struct mtk_gate top_clks[] = {
> >         GATE_TOP(CLK_TOP_SSUSB_PHY_REF, "ssusb_phy_ref", "clk26m",
> > 25),
> >  };
> > 
> > +static const struct mtk_clk_rst_desc clk_rst_desc = {
> > +       .version = MTK_RST_SET_CLR,
> > +       .reg_num = 4,
> > +       .reg_ofs = 0x0,
> > +       .reset_n_cells = 2,
> 
> If you want to do this, you need to update the bindings first.

OK, I will add another patch for this.

> 
> > +};
> > +
> >  #define MT8192_PLL_FMAX                (3800UL * MHZ)
> >  #define MT8192_PLL_FMIN                (1500UL * MHZ)
> >  #define MT8192_INTEGER_BITS    8
> > @@ -1239,6 +1246,10 @@ static int clk_mt8192_infra_probe(struct
> > platform_device *pdev)
> >         if (r)
> >                 goto free_clk_data;
> > 
> > +       r = mtk_clk_register_rst_ctrl_with_dev(&pdev->dev,
> > &clk_rst_desc);
> > +       if (r)
> > +               goto free_clk_data;
> > +
> >         r = of_clk_add_provider(node, of_clk_src_onecell_get,
> > clk_data);
> >         if (r)
> >                 goto free_clk_data;
> > diff --git a/include/dt-bindings/reset/mt8192-resets.h
> > b/include/dt-bindings/reset/mt8192-resets.h
> > index be9a7ca245b9..feac1ac85906 100644
> > --- a/include/dt-bindings/reset/mt8192-resets.h
> > +++ b/include/dt-bindings/reset/mt8192-resets.h
> > @@ -7,6 +7,7 @@
> >  #ifndef _DT_BINDINGS_RESET_CONTROLLER_MT8192
> >  #define _DT_BINDINGS_RESET_CONTROLLER_MT8192
> > 
> > +/* TOPRGU */
> >  #define
> > MT8192_TOPRGU_MM_SW_RST                                        1
> >  #define MT8192_TOPRGU_MFG_SW_RST                               2
> >  #define MT8192_TOPRGU_VENC_SW_RST                              3
> > @@ -27,4 +28,14 @@
> > 
> >  #define MT8192_TOPRGU_SW_RST_NUM                               23
> > 
> > +/* INFRA RST0 */
> > +#define MT8192_INFRA_RST0_LVTS_AP_RST                          0
> > +/* INFRA RST2 */
> > +#define MT8192_INFRA_RST2_PCIE_PHY_RST                         15
> > +/* INFRA RST3 */
> > +#define MT8192_INFRA_RST3_PTP_RST                              5
> > +/* INFRA RST4 */
> > +#define MT8192_INFRA_RST4_LVTS_MCU                             12
> > +#define MT8192_INFRA_RST4_PCIE_TOP                             1
> > +
> 
> This change should be part of the binding change.
> 
> For these, please also add a patch for the actual device tree
> changes.
> 

OK, I will do this.

BRs,
Rex
> 
> ChenYu
> 
> >  #endif  /* _DT_BINDINGS_RESET_CONTROLLER_MT8192 */
> > --
> > 2.18.0
> > 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
