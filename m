Return-Path: <SRS0=P2Dl=2D=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA43FC43603
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Dec 2019 02:46:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7C2B42173E
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Dec 2019 02:46:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hintf+/t";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="IOK+eQ+6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7C2B42173E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KRhUkgbWai03++GF26Zp/mVt7M3SxNNTdmyz91HVZ84=; b=hintf+/tB2U8Ju
	gUBEpKTsweH/Zg3DeurhONRgs0e+tnVGbipnYCr7FwffceenggouP8b+yTkO5vl7Nh8plgQdGEeKk
	jAYBBD/7jiWqWXEhVEZ0GVn9Iz1613vzQ5BzkX/2dBUNtph03iEpYC5TmAyIy/IXlE9iZMPWhYQVT
	nfgd1VuFUoJBxaxs924Gn5uJCKRe0hAqrV3PIVWngRk3lQP4seJqQqxC8TQ2vB2RCiaFh3KGrg8Yi
	lkHYxRETATXTEZXEUABYI3AX0J7l3ESHCKCgxnGlbR7ACUd97w3plkSiRa48g9I8Fj/kG3FiE6+or
	KkGmzrhl1u/sVyXPXnRg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ifayB-0007aP-3M; Fri, 13 Dec 2019 02:46:19 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ifay7-0007Zo-1o
 for linux-mediatek@lists.infradead.org; Fri, 13 Dec 2019 02:46:18 +0000
X-UUID: 4e18e51ae21b4fcd90758a586506720c-20191212
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=qgX20Ihw5MgZwfm0CAFQR2Pl43ZN58X7FsCH6CTzdhk=; 
 b=IOK+eQ+6vH95CMUQafM9xL1yDt+ZxkCfeMf0klXRD/2yCzjIw+VKURFIZ9VWjg2Ia3UUMI0msQ5AIO3IkE1trGQHSEoTJpFShhSSIaH5lXI/b9ny94JwKUHAcKqFF3MFwmFsAtfsi/Ao4dQk756e3jcIrfqTsvJkGtY9PsoC+8I=;
X-UUID: 4e18e51ae21b4fcd90758a586506720c-20191212
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1216340619; Thu, 12 Dec 2019 18:46:10 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 12 Dec 2019 18:46:24 -0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 13 Dec 2019 10:45:33 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Fri, 13 Dec 2019 10:45:28 +0800
Message-ID: <1576205159.26694.4.camel@mtksdaap41>
Subject: Re: [PATCH v7 7/9] drm/mediatek: change the dsi phytiming calculate
 method
From: CK Hu <ck.hu@mediatek.com>
To: Ryan Case <ryandcase@chromium.org>
Date: Fri, 13 Dec 2019 10:45:59 +0800
In-Reply-To: <CACjz--kPY4DwJjMu+8EWanMWu6oD-OGm-wku3HGFvXea7F-yYw@mail.gmail.com>
References: <20190919065806.111016-1-jitao.shi@mediatek.com>
 <20190919065806.111016-8-jitao.shi@mediatek.com>
 <1569487880.9612.2.camel@mtksdaap41>
 <CAFqH_52oPHH-9GGCgsYVK5K6ys9OrdkMad59+Mm5CzSdbcx7rw@mail.gmail.com>
 <CACjz--kPY4DwJjMu+8EWanMWu6oD-OGm-wku3HGFvXea7F-yYw@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191212_184615_110366_8B631BF7 
X-CRM114-Status: GOOD (  22.32  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Nicolas Boichat <drinkcat@chromium.org>, Jitao Shi <jitao.shi@mediatek.com>,
 srv_heupstream <srv_heupstream@mediatek.com>,
 Enric Balletbo Serra <eballetbo@gmail.com>, stonea168@163.com,
 cawa cheng <cawa.cheng@mediatek.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 sj.huang@mediatek.com, Hsinyu Chao <hychao@chromium.org>, "moderated
 list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Yingjoe
 Chen <yingjoe.chen@mediatek.com>,
 Eddie Huang =?UTF-8?Q?=28=E9=BB=83=E6=99=BA=E5=82=91=29?=
 <eddie.huang@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi, Ryan:

On Thu, 2019-12-12 at 14:47 -0800, Ryan Case wrote:
> Hi Enric,
> 
> On Thu, Dec 12, 2019 at 5:53 AM Enric Balletbo Serra
> <eballetbo@gmail.com> wrote:
> >
> > Hi,
> >
> > Missatge de CK Hu <ck.hu@mediatek.com> del dia dj., 26 de set. 2019 a les 10:51:
> > >
> > > Hi, Jitao:
> > >
> > > On Thu, 2019-09-19 at 14:58 +0800, Jitao Shi wrote:
> > > > Change the method of frame rate calc which can get more accurate
> > > > frame rate.
> > > >
> > > > data rate = pixel_clock * bit_per_pixel / lanes
> > > > Adjust hfp_wc to adapt the additional phy_data
> > > >
> > > > if MIPI_DSI_MODE_VIDEO_BURST
> > > >       hfp_wc = hfp * bpp - data_phy_cycles * lanes - 12 - 6;
> > > > else
> > > >       hfp_wc = hfp * bpp - data_phy_cycles * lanes - 12;
> > > >
> > > > Note:
> > > > //(2: 1 for sync, 1 for phy idle)
> > > > data_phy_cycles = T_hs_exit + T_lpx + T_hs_prepare + T_hs_zero + 2;
> > > >
> > > > bpp: bit per pixel
> > >
> > > Reviewed-by: CK Hu <ck.hu@mediatek.com>
> > >
> > > >
> > > > Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> > > > Tested-by: Ryan Case <ryandcase@chromium.org>
> > > > ---
> > > >  drivers/gpu/drm/mediatek/mtk_dsi.c | 118 ++++++++++++++++++++---------
> >
> > I didn't look in detail yet because looks like there is a lot of maths
> > involved, but this patch introduces a regression for MT8173 or my
> > board (Acer Chromebook R 13 - ELM). I need to revert this patch in
> > order to make the display working, basically, I don't see any error
> > but I only get a black screen. Reverting this patch fixes the issue
> > for me. If anyone knows what could be the problem I'd appreciate.
> 
> I won't pretend to be aware of current status but an in progress patch
> with updated timings that have been tested on elm can be found here:
> https://crrev.com/c/1915442
> 

It seems that patch works fine in elm, so I would wait for the fixup
patch in rc stage. Otherwise, I would revert this patch.

Regards,
CK

> - ryan
> 
> >
> > Thanks,
> >  Enric
> >
> > > >  1 file changed, 81 insertions(+), 37 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
> > > > index b3676426aeb5..b02373b04848 100644
> > > > --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> > > > +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> > > > @@ -136,12 +136,6 @@
> > > >  #define DATA_0                               (0xff << 16)
> > > >  #define DATA_1                               (0xff << 24)
> > > >
> > > > -#define T_LPX                5
> > > > -#define T_HS_PREP    6
> > > > -#define T_HS_TRAIL   8
> > > > -#define T_HS_EXIT    7
> > > > -#define T_HS_ZERO    10
> > > > -
> > > >  #define NS_TO_CYCLE(n, c)    ((n) / (c) + (((n) % (c)) ? 1 : 0))
> > > >
> > > >  #define MTK_DSI_HOST_IS_READ(type) \
> > > > @@ -150,6 +144,25 @@
> > > >       (type == MIPI_DSI_GENERIC_READ_REQUEST_2_PARAM) || \
> > > >       (type == MIPI_DSI_DCS_READ))
> > > >
> > > > +struct mtk_phy_timing {
> > > > +     u32 lpx;
> > > > +     u32 da_hs_prepare;
> > > > +     u32 da_hs_zero;
> > > > +     u32 da_hs_trail;
> > > > +
> > > > +     u32 ta_go;
> > > > +     u32 ta_sure;
> > > > +     u32 ta_get;
> > > > +     u32 da_hs_exit;
> > > > +
> > > > +     u32 clk_hs_zero;
> > > > +     u32 clk_hs_trail;
> > > > +
> > > > +     u32 clk_hs_prepare;
> > > > +     u32 clk_hs_post;
> > > > +     u32 clk_hs_exit;
> > > > +};
> > > > +
> > > >  struct phy;
> > > >
> > > >  struct mtk_dsi_driver_data {
> > > > @@ -180,6 +193,7 @@ struct mtk_dsi {
> > > >       enum mipi_dsi_pixel_format format;
> > > >       unsigned int lanes;
> > > >       struct videomode vm;
> > > > +     struct mtk_phy_timing phy_timing;
> > > >       int refcount;
> > > >       bool enabled;
> > > >       u32 irq_data;
> > > > @@ -213,17 +227,36 @@ static void mtk_dsi_phy_timconfig(struct mtk_dsi *dsi)
> > > >  {
> > > >       u32 timcon0, timcon1, timcon2, timcon3;
> > > >       u32 ui, cycle_time;
> > > > +     struct mtk_phy_timing *timing = &dsi->phy_timing;
> > > > +
> > > > +     ui = DIV_ROUND_UP(1000000000, dsi->data_rate);
> > > > +     cycle_time = div_u64(8000000000ULL, dsi->data_rate);
> > > > +
> > > > +     timing->lpx = NS_TO_CYCLE(60, cycle_time);
> > > > +     timing->da_hs_prepare = NS_TO_CYCLE(50 + 5 * ui, cycle_time);
> > > > +     timing->da_hs_zero = NS_TO_CYCLE(110 + 6 * ui, cycle_time);
> > > > +     timing->da_hs_trail = NS_TO_CYCLE(77 + 4 * ui, cycle_time);
> > > >
> > > > -     ui = 1000 / dsi->data_rate + 0x01;
> > > > -     cycle_time = 8000 / dsi->data_rate + 0x01;
> > > > +     timing->ta_go = 4 * timing->lpx;
> > > > +     timing->ta_sure = 3 * timing->lpx / 2;
> > > > +     timing->ta_get = 5 * timing->lpx;
> > > > +     timing->da_hs_exit = 2 * timing->lpx;
> > > >
> > > > -     timcon0 = T_LPX | T_HS_PREP << 8 | T_HS_ZERO << 16 | T_HS_TRAIL << 24;
> > > > -     timcon1 = 4 * T_LPX | (3 * T_LPX / 2) << 8 | 5 * T_LPX << 16 |
> > > > -               T_HS_EXIT << 24;
> > > > -     timcon2 = ((NS_TO_CYCLE(0x64, cycle_time) + 0xa) << 24) |
> > > > -               (NS_TO_CYCLE(0x150, cycle_time) << 16);
> > > > -     timcon3 = NS_TO_CYCLE(0x40, cycle_time) | (2 * T_LPX) << 16 |
> > > > -               NS_TO_CYCLE(80 + 52 * ui, cycle_time) << 8;
> > > > +     timing->clk_hs_zero = NS_TO_CYCLE(336, cycle_time);
> > > > +     timing->clk_hs_trail = NS_TO_CYCLE(100, cycle_time) + 10;
> > > > +
> > > > +     timing->clk_hs_prepare = NS_TO_CYCLE(64, cycle_time);
> > > > +     timing->clk_hs_post = NS_TO_CYCLE(80 + 52 * ui, cycle_time);
> > > > +     timing->clk_hs_exit = 2 * timing->lpx;
> > > > +
> > > > +     timcon0 = timing->lpx | timing->da_hs_prepare << 8 |
> > > > +               timing->da_hs_zero << 16 | timing->da_hs_trail << 24;
> > > > +     timcon1 = timing->ta_go | timing->ta_sure << 8 |
> > > > +               timing->ta_get << 16 | timing->da_hs_exit << 24;
> > > > +     timcon2 = 1 << 8 | timing->clk_hs_zero << 16 |
> > > > +               timing->clk_hs_trail << 24;
> > > > +     timcon3 = timing->clk_hs_prepare | timing->clk_hs_post << 8 |
> > > > +               timing->clk_hs_exit << 16;
> > > >
> > > >       writel(timcon0, dsi->regs + DSI_PHY_TIMECON0);
> > > >       writel(timcon1, dsi->regs + DSI_PHY_TIMECON1);
> > > > @@ -410,7 +443,8 @@ static void mtk_dsi_config_vdo_timing(struct mtk_dsi *dsi)
> > > >       u32 horizontal_sync_active_byte;
> > > >       u32 horizontal_backporch_byte;
> > > >       u32 horizontal_frontporch_byte;
> > > > -     u32 dsi_tmp_buf_bpp;
> > > > +     u32 dsi_tmp_buf_bpp, data_phy_cycles;
> > > > +     struct mtk_phy_timing *timing = &dsi->phy_timing;
> > > >
> > > >       struct videomode *vm = &dsi->vm;
> > > >
> > > > @@ -437,7 +471,34 @@ static void mtk_dsi_config_vdo_timing(struct mtk_dsi *dsi)
> > > >               horizontal_backporch_byte = ((vm->hback_porch + vm->hsync_len) *
> > > >                       dsi_tmp_buf_bpp - 10);
> > > >
> > > > -     horizontal_frontporch_byte = (vm->hfront_porch * dsi_tmp_buf_bpp - 12);
> > > > +     data_phy_cycles = timing->lpx + timing->da_hs_prepare +
> > > > +                               timing->da_hs_zero + timing->da_hs_exit + 2;
> > > > +
> > > > +     if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_BURST) {
> > > > +             if (vm->hfront_porch * dsi_tmp_buf_bpp >
> > > > +                 data_phy_cycles * dsi->lanes + 18) {
> > > > +                     horizontal_frontporch_byte = vm->hfront_porch *
> > > > +                                                  dsi_tmp_buf_bpp -
> > > > +                                                  data_phy_cycles *
> > > > +                                                  dsi->lanes - 18;
> > > > +             } else {
> > > > +                     DRM_WARN("HFP less than d-phy, FPS will under 60Hz\n");
> > > > +                     horizontal_frontporch_byte = vm->hfront_porch *
> > > > +                                                  dsi_tmp_buf_bpp;
> > > > +             }
> > > > +     } else {
> > > > +             if (vm->hfront_porch * dsi_tmp_buf_bpp >
> > > > +                 data_phy_cycles * dsi->lanes + 12) {
> > > > +                     horizontal_frontporch_byte = vm->hfront_porch *
> > > > +                                                  dsi_tmp_buf_bpp -
> > > > +                                                  data_phy_cycles *
> > > > +                                                  dsi->lanes - 12;
> > > > +             } else {
> > > > +                     DRM_WARN("HFP less than d-phy, FPS will under 60Hz\n");
> > > > +                     horizontal_frontporch_byte = vm->hfront_porch *
> > > > +                                                  dsi_tmp_buf_bpp;
> > > > +             }
> > > > +     }
> > > >
> > > >       writel(horizontal_sync_active_byte, dsi->regs + DSI_HSA_WC);
> > > >       writel(horizontal_backporch_byte, dsi->regs + DSI_HBP_WC);
> > > > @@ -537,8 +598,7 @@ static int mtk_dsi_poweron(struct mtk_dsi *dsi)
> > > >  {
> > > >       struct device *dev = dsi->host.dev;
> > > >       int ret;
> > > > -     u64 pixel_clock, total_bits;
> > > > -     u32 htotal, htotal_bits, bit_per_pixel, overhead_cycles, overhead_bits;
> > > > +     u32 bit_per_pixel;
> > > >
> > > >       if (++dsi->refcount != 1)
> > > >               return 0;
> > > > @@ -557,24 +617,8 @@ static int mtk_dsi_poweron(struct mtk_dsi *dsi)
> > > >               break;
> > > >       }
> > > >
> > > > -     /**
> > > > -      * htotal_time = htotal * byte_per_pixel / num_lanes
> > > > -      * overhead_time = lpx + hs_prepare + hs_zero + hs_trail + hs_exit
> > > > -      * mipi_ratio = (htotal_time + overhead_time) / htotal_time
> > > > -      * data_rate = pixel_clock * bit_per_pixel * mipi_ratio / num_lanes;
> > > > -      */
> > > > -     pixel_clock = dsi->vm.pixelclock;
> > > > -     htotal = dsi->vm.hactive + dsi->vm.hback_porch + dsi->vm.hfront_porch +
> > > > -                     dsi->vm.hsync_len;
> > > > -     htotal_bits = htotal * bit_per_pixel;
> > > > -
> > > > -     overhead_cycles = T_LPX + T_HS_PREP + T_HS_ZERO + T_HS_TRAIL +
> > > > -                     T_HS_EXIT;
> > > > -     overhead_bits = overhead_cycles * dsi->lanes * 8;
> > > > -     total_bits = htotal_bits + overhead_bits;
> > > > -
> > > > -     dsi->data_rate = DIV_ROUND_UP_ULL(pixel_clock * total_bits,
> > > > -                                       htotal * dsi->lanes);
> > > > +     dsi->data_rate = DIV_ROUND_UP_ULL(dsi->vm.pixelclock * bit_per_pixel,
> > > > +                                       dsi->lanes);
> > > >
> > > >       ret = clk_set_rate(dsi->hs_clk, dsi->data_rate);
> > > >       if (ret < 0) {
> > >
> > >
> > > _______________________________________________
> > > dri-devel mailing list
> > > dri-devel@lists.freedesktop.org
> > > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> 
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
