Return-Path: <SRS0=ZvcN=NH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3370C4338F
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Aug 2021 02:06:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 56828613B3
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Aug 2021 02:06:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 56828613B3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2+3tCh84vnJCsOGdK77s2RxXU3z9Ayh80TWXI17rnjM=; b=4p75dSSg1sKKEK
	Xiyr3Sgw1glNu7qPqJS/3jaGdkLMchaei9fP1cJ5qXd/D9Fx2O3kzh4p7juMCIl8C2dwtoX+G98jw
	OZoTf6vq9swdHhUsLyHZDiSVYAExLXe7v747/QAuGpZTxNbmEYZPx8IwLkwIf7IsIH4HONp+Y/BEW
	OL0UlWBgjkv2LewTNFLn1oidvQN+/muT2MIERS6in2cefvraPGe6h9tDJxIQR+IoE/qrcfe1GKV3M
	2/CClRMBkl58TaM2Kw84BMWcgRqYw2ODFRMy7FAZDM40q1WCXDFM/JH4p427SVO/8GiWm+o6HSf6O
	v/Wo3EIi8jpc6148hpSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFS0e-00FzYB-D0; Mon, 16 Aug 2021 02:05:52 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFS0O-00FzXW-Pk; Mon, 16 Aug 2021 02:05:40 +0000
X-UUID: c97c11bd8b50489ea9ae624cde32fbb6-20210815
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=IY/K2HULC9MDx2k+nGgYDiCN+M0xKYCMIu4loGHRN/Q=; 
 b=UhjQqsnkNYkYUBKbA6qYjGkUxj/hu2Hd4rplzLK6yC+q//80FyLRmeKhrbNEEXw/JspD1II9D62qwJQ+XPZHzrdOsUZMi15+ypBMCGFrEaxBXPCGJaphSBXePnqEbnI+tOsHk5LAoAtiHZbYacj2UXpWOBe/EFTQvNAagRW1Cx4=;
X-UUID: c97c11bd8b50489ea9ae624cde32fbb6-20210815
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <nancy.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 737512721; Sun, 15 Aug 2021 19:05:33 -0700
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 15 Aug 2021 19:05:05 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 16 Aug 2021 10:05:04 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 16 Aug 2021 10:05:04 +0800
Message-ID: <ec0fa0d41aab77c93981dcc9553fc40596125c0e.camel@mediatek.com>
Subject: Re: [PATCH v2 07/14] soc: mediatek: add mtk-mmsys support for
 mt8195 vdosys1
From: Nancy.Lin <nancy.lin@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Enric Balletbo Serra
 <eballetbo@gmail.com>
CC: CK Hu <ck.hu@mediatek.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 srv_heupstream <srv_heupstream@mediatek.com>, devicetree
 <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>, "jason-jh .
 lin" <jason-jh.lin@mediatek.com>, <singo.chang@mediatek.com>, linux-kernel
 <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, Rob Herring <robh+dt@kernel.org>, 
 "moderated list:ARM/Mediatek SoC support"
 <linux-mediatek@lists.infradead.org>, Linux ARM
 <linux-arm-kernel@lists.infradead.org>
Date: Mon, 16 Aug 2021 10:05:04 +0800
In-Reply-To: <6c1891ed-178e-b589-1630-93d528276b17@gmail.com>
References: <20210722094551.15255-1-nancy.lin@mediatek.com>
 <20210722094551.15255-8-nancy.lin@mediatek.com>
 <CAFqH_53UpoChfrhXf41YRMGGPzjC9N2g3yNQQxc-J=7uPE44Cw@mail.gmail.com>
 <48be9a4ebb455737bfd640c6339f2ce05d02d4cd.camel@mediatek.com>
 <6c1891ed-178e-b589-1630-93d528276b17@gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210815_190536_875239_038F1688 
X-CRM114-Status: GOOD (  30.68  )
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

Hi Matthias,

Thanks for the review.

On Fri, 2021-08-06 at 14:20 +0200, Matthias Brugger wrote:
> 
> On 28/07/2021 07:34, Nancy.Lin wrote:
> > Hi Enric,
> > 
> > Thanks for your review.
> > 
> > On Fri, 2021-07-23 at 13:05 +0200, Enric Balletbo Serra wrote:
> > > Hi Nancy,
> > > 
> > > Thank you for your patch.
> > > 
> > > Missatge de Nancy.Lin <nancy.lin@mediatek.com> del dia dj., 22 de
> > > jul.
> > > 2021 a les 11:45:
> > > > 
> > > > Add mt8195 vdosys1 clock driver name and routing table to
> > > > the driver data of mtk-mmsys.
> > > > 
> > > > Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> > > > ---
> > > >  drivers/soc/mediatek/mt8195-mmsys.h    | 83
> > > > ++++++++++++++++++++++++--
> > > >  drivers/soc/mediatek/mtk-mmsys.c       | 10 ++++
> > > >  include/linux/soc/mediatek/mtk-mmsys.h |  2 +
> > > >  3 files changed, 90 insertions(+), 5 deletions(-)
> > > > 
> > > > diff --git a/drivers/soc/mediatek/mt8195-mmsys.h
> > > > b/drivers/soc/mediatek/mt8195-mmsys.h
> > > > index 73e9e8286d50..104ba575f765 100644
> > > > --- a/drivers/soc/mediatek/mt8195-mmsys.h
> > > > +++ b/drivers/soc/mediatek/mt8195-mmsys.h
> > > > @@ -64,16 +64,16 @@
> > > >  #define
> > > > SOUT_TO_VPP_MERGE0_P1_SEL                              (1
> > > > << 0)
> > > > 
> > > >  #define
> > > > MT8195_VDO1_MERGE0_ASYNC_SOUT_SEL                      0xf40
> > > > -#define
> > > > SOUT_TO_HDR_VDO_FE0                                    (0
> > > > << 0)
> > > 
> > > This definition was introduced in this patch [1] that didn't land
> > > yet.
> > > And you're removing it now. Could you sync with Jason and only
> > > introduce the bits that are needed for your patches. Also all the
> > > comments I made to the Jason's patch apply here.
> > > 
> > > [1] 
> > > 
https://urldefense.com/v3/__https://patchwork.kernel.org/project/linux-mediatek/patch/20210723090233.24007-3-jason-jh.lin@mediatek.com/__;!!CTRNKA9wMg0ARbw!0rDdPxfBPcZC9icK37sCxT55RMqwRngO0BF4-uDwgYZP7UwQkx7iidkINqLBb7yi$
> > >  
> > > 
> > 
> > OK, I will sync with Jason and modify it.
> > 
> > > > +#define
> > > > SOUT_TO_MIXER_IN1_SEL                                  (1
> > > > << 0)
> > > > 
> > > >  #define
> > > > MT8195_VDO1_MERGE1_ASYNC_SOUT_SEL                      0xf44
> > > > -#define
> > > > SOUT_TO_HDR_VDO_FE1                                    (0
> > > > << 0)
> > > > +#define
> > > > SOUT_TO_MIXER_IN2_SEL                                  (1
> > > > << 0)
> > > > 
> > > >  #define
> > > > MT8195_VDO1_MERGE2_ASYNC_SOUT_SEL                      0xf48
> > > > -#define
> > > > SOUT_TO_HDR_GFX_FE0                                    (0
> > > > << 0)
> > > > +#define
> > > > SOUT_TO_MIXER_IN3_SEL                                  (1
> > > > << 0)
> > > > 
> > > >  #define
> > > > MT8195_VDO1_MERGE3_ASYNC_SOUT_SEL                      0xf4c
> > > > -#define
> > > > SOUT_TO_HDR_GFX_FE1                                    (0
> > > > << 0)
> > > > +#define
> > > > SOUT_TO_MIXER_IN4_SEL                                  (1
> > > > << 0)
> > > > 
> > > >  #define
> > > > MT8195_VDO1_MIXER_IN1_SOUT_SEL                         0xf58
> > > >  #define
> > > > MIXER_IN1_SOUT_TO_DISP_MIXER                           (0
> > > > << 0)
> > > > @@ -88,7 +88,7 @@
> > > >  #define
> > > > MIXER_IN4_SOUT_TO_DISP_MIXER                           (0
> > > > << 0)
> > > > 
> > > >  #define
> > > > MT8195_VDO1_MIXER_OUT_SOUT_SEL                         0xf34
> > > > -#define
> > > > MIXER_SOUT_TO_HDR_VDO_BE0                              (0
> > > > << 0)
> > > > +#define
> > > > MIXER_SOUT_TO_MERGE4_ASYNC_SEL                         (1
> > > > << 0)
> > > > 
> > > >  #define
> > > > MT8195_VDO1_MERGE4_SOUT_SEL                            0xf18
> > > >  #define
> > > > MERGE4_SOUT_TO_VDOSYS0                                 (0
> > > > << 0)
> > > > @@ -185,6 +185,79 @@ static const struct mtk_mmsys_routes
> > > > mmsys_mt8195_routing_table[] = {
> > > >         }, {
> > > >                 DDP_COMPONENT_DSC0, DDP_COMPONENT_MERGE0,
> > > >                 MT8195_VDO0_SEL_OUT,
> > > > SOUT_DSC_WRAP0_OUT_TO_VPP_MERGE
> > > > +       },
> > > > +       {
> > > > +               DDP_COMPONENT_PSEUDO_OVL, DDP_COMPONENT_MERGE5,
> > > > +               MT8195_VDO1_VPP_MERGE0_P0_SEL_IN,
> > > > VPP_MERGE0_P0_SEL_IN_FROM_MDP_RDMA0
> > > > +       },
> > > > +       {
> > > > +               DDP_COMPONENT_PSEUDO_OVL, DDP_COMPONENT_MERGE5,
> > > > +               MT8195_VDO1_VPP_MERGE0_P1_SEL_IN,
> > > > VPP_MERGE0_P1_SEL_IN_FROM_MDP_RDMA1
> > > > +       },
> > > > +       {
> > > > +               DDP_COMPONENT_PSEUDO_OVL, DDP_COMPONENT_MERGE5,
> > > > +               MT8195_VDO1_VPP_MERGE1_P0_SEL_IN,
> > > > VPP_MERGE1_P0_SEL_IN_FROM_MDP_RDMA2
> > > > +       },
> > > > +       {
> > > > +               DDP_COMPONENT_PSEUDO_OVL, DDP_COMPONENT_MERGE5,
> > > > +               MT8195_VDO1_MERGE0_ASYNC_SOUT_SEL,
> > > > SOUT_TO_MIXER_IN1_SEL
> > > > +       },
> > > > +       {
> > > > +               DDP_COMPONENT_PSEUDO_OVL, DDP_COMPONENT_MERGE5,
> > > > +               MT8195_VDO1_MERGE1_ASYNC_SOUT_SEL,
> > > > SOUT_TO_MIXER_IN2_SEL
> > > > +       },
> > > > +       {
> > > > +               DDP_COMPONENT_PSEUDO_OVL, DDP_COMPONENT_MERGE5,
> > > > +               MT8195_VDO1_MERGE2_ASYNC_SOUT_SEL,
> > > > SOUT_TO_MIXER_IN3_SEL
> > > > +       },
> > > > +       {
> > > > +               DDP_COMPONENT_PSEUDO_OVL, DDP_COMPONENT_MERGE5,
> > > > +               MT8195_VDO1_MERGE3_ASYNC_SOUT_SEL,
> > > > SOUT_TO_MIXER_IN4_SEL
> > > > +       },
> > > > +       {
> > > > +               DDP_COMPONENT_PSEUDO_OVL, DDP_COMPONENT_MERGE5,
> > > > +               MT8195_VDO1_MIXER_OUT_SOUT_SEL,
> > > > MIXER_SOUT_TO_MERGE4_ASYNC_SEL
> > > > +       },
> > > > +       {
> > > > +               DDP_COMPONENT_PSEUDO_OVL, DDP_COMPONENT_MERGE5,
> > > > +               MT8195_VDO1_MIXER_IN1_SEL_IN,
> > > > MIXER_IN1_SEL_IN_FROM_MERGE0_ASYNC_SOUT
> > > > +       },
> > > > +       {
> > > > +               DDP_COMPONENT_PSEUDO_OVL, DDP_COMPONENT_MERGE5,
> > > > +               MT8195_VDO1_MIXER_IN2_SEL_IN,
> > > > MIXER_IN2_SEL_IN_FROM_MERGE1_ASYNC_SOUT
> > > > +       },
> > > > +       {
> > > > +               DDP_COMPONENT_PSEUDO_OVL, DDP_COMPONENT_MERGE5,
> > > > +               MT8195_VDO1_MIXER_IN3_SEL_IN,
> > > > MIXER_IN3_SEL_IN_FROM_MERGE2_ASYNC_SOUT
> > > > +       },
> > > > +       {
> > > > +               DDP_COMPONENT_PSEUDO_OVL, DDP_COMPONENT_MERGE5,
> > > > +               MT8195_VDO1_MIXER_IN4_SEL_IN,
> > > > MIXER_IN4_SEL_IN_FROM_MERGE3_ASYNC_SOUT
> > > > +       },
> > > > +       {
> > > > +               DDP_COMPONENT_PSEUDO_OVL, DDP_COMPONENT_MERGE5,
> > > > +               MT8195_VDO1_MIXER_SOUT_SEL_IN,
> > > > MIXER_SOUT_SEL_IN_FROM_DISP_MIXER
> > > > +       },
> > > > +       {
> > > > +               DDP_COMPONENT_PSEUDO_OVL, DDP_COMPONENT_MERGE5,
> > > > +               MT8195_VDO1_MERGE4_ASYNC_SEL_IN,
> > > > MERGE4_ASYNC_SEL_IN_FROM_MIXER_OUT_SOUT
> > > > +       },
> > > > +       {
> > > > +               DDP_COMPONENT_MERGE5, DDP_COMPONENT_DPI1,
> > > > +               MT8195_VDO1_DISP_DPI1_SEL_IN,
> > > > DISP_DPI1_SEL_IN_FROM_VPP_MERGE4_MOUT
> > > > +       },
> > > > +       {
> > > > +               DDP_COMPONENT_MERGE5, DDP_COMPONENT_DPI1,
> > > > +               MT8195_VDO1_MERGE4_SOUT_SEL,
> > > > MERGE4_SOUT_TO_DPI1_SEL
> > > > +       },
> > > > +       {
> > > > +               DDP_COMPONENT_MERGE5, DDP_COMPONENT_DP_INTF1,
> > > > +               MT8195_VDO1_DISP_DP_INTF0_SEL_IN,
> > > > +               DISP_DP_INTF0_SEL_IN_FROM_VPP_MERGE4_MOUT
> > > > +       },
> > > > +       {
> > > > +               DDP_COMPONENT_MERGE5, DDP_COMPONENT_DP_INTF1,
> > > > +               MT8195_VDO1_MERGE4_SOUT_SEL,
> > > > MERGE4_SOUT_TO_DP_INTF0_SEL
> > > >         }
> > > >  };
> > > > 
> > > > diff --git a/drivers/soc/mediatek/mtk-mmsys.c
> > > > b/drivers/soc/mediatek/mtk-mmsys.c
> > > > index 1fb241750897..9e31aad6c5c8 100644
> > > > --- a/drivers/soc/mediatek/mtk-mmsys.c
> > > > +++ b/drivers/soc/mediatek/mtk-mmsys.c
> > > > @@ -59,6 +59,12 @@ static const struct mtk_mmsys_driver_data
> > > > mt8195_vdosys0_driver_data = {
> > > >         .num_routes = ARRAY_SIZE(mmsys_mt8195_routing_table),
> > > >  };
> > > > 
> > > > +static const struct mtk_mmsys_driver_data
> > > > mt8195_vdosys1_driver_data = {
> > > > +       .clk_driver = "clk-mt8195-vdo1",
> > > > +       .routes = mmsys_mt8195_routing_table,
> > > > +       .num_routes = ARRAY_SIZE(mmsys_mt8195_routing_table),
> > > > +};
> > > > +
> > > >  struct mtk_mmsys {
> > > >         void __iomem *regs;
> > > >         const struct mtk_mmsys_driver_data *data;
> > > > @@ -168,6 +174,10 @@ static const struct of_device_id
> > > > of_match_mtk_mmsys[] = {
> > > >                 .compatible = "mediatek,mt8195-vdosys0",
> > > >                 .data = &mt8195_vdosys0_driver_data,
> > > >         },
> > > > +       {
> > > > +               .compatible = "mediatek,mt8195-vdosys1",
> > > 
> > > Why do you need a second compatible, isn't this the same IP
> > > block? I
> > > mean, I understand that you have 2 mmsys blocks, but both are the
> > > same
> > > IP block, right? or are they different?
> > > 
> > > Thanks,
> > >   Enric
> > > 
> > 
> > They(vdosys0 and vdosys1) are different IP block.
> > 
> 
> Please explain in what they are different. From what I see, you use
> the same
> routing table for both compatibles and only register another platform
> device for
> a second clock. Is that correct?
> 
> Regards,
> Matthias
> 
From a hardware point of view, the HW engines of vdosys0 and vdosys1
are different.
1. The components on meiatek-drm of vdosys0 are OVL0, RDMA0, COLOR0,
CCORR, AAL0, GAMMA, DITHER, DSC0, MERGE0, DP_INTF0. Its output panel is
eDP.
2. The components on meiatek-drm of vdosys1 are OVL_ADAPTOR, MERGE5,
DP_INTF1. Its output panel is DP.

In the SoC before, such as mt8173, it has 2 pipelines binding to one
mmsys with the same clock driver and the same power domain.

In mt8195, 2 pipelines are binding to different mmsys, such as vdosys0
and vdosys1. Each mmsys uses different clock drivers and different
power domains.

So I think it is more appropriate to use 2 compatibles to identify
which mmsys represents the pipeline. Another reason for using two
compatibles is that we use different driver
data in mtk-mmsys.c and mtk_drm_drv.c to identify the corresponding
mmsys is vdosys0 or vdosys1.

Their driver data in mtk_drm_drv.c is defined here:
[v7,13/13] drm/mediatek: add mediatek-drm of vdosys0 support for mt8195

https://patchwork.kernel.org/project/linux-mediatek/patch/20210815145610.2050-14-jason-jh.lin@mediatek.com/

[v2,14/14] drm/mediatek: add mediatek-drm of vdosys1 support for MT8195

https://patchwork.kernel.org/project/linux-mediatek/patch/20210722094551.15255-15-nancy.lin@mediatek.com/


There is another series talking about the two mmsys compatible.

https://patchwork.kernel.org/project/linux-mediatek/patch/20210722092624.14401-2-jason-jh.lin@mediatek.com/

Regards,
Nancy

> > > > +               .data = &mt8195_vdosys1_driver_data,
> > > > +       },
> > > >         { }
> > > >  };
> > > > 
> > > > diff --git a/include/linux/soc/mediatek/mtk-mmsys.h
> > > > b/include/linux/soc/mediatek/mtk-mmsys.h
> > > > index 34cb605e5df9..338c71570aeb 100644
> > > > --- a/include/linux/soc/mediatek/mtk-mmsys.h
> > > > +++ b/include/linux/soc/mediatek/mtk-mmsys.h
> > > > @@ -49,6 +49,8 @@ enum mtk_ddp_comp_id {
> > > >         DDP_COMPONENT_DSC1,
> > > >         DDP_COMPONENT_DSC1_VIRTUAL0,
> > > >         DDP_COMPONENT_DP_INTF0,
> > > > +       DDP_COMPONENT_DP_INTF1,
> > > > +       DDP_COMPONENT_PSEUDO_OVL,
> > > >         DDP_COMPONENT_ID_MAX,
> > > >  };
> > > > 
> > > > --
> > > > 2.18.0
> > > > 
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
