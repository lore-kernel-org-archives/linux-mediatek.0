Return-Path: <SRS0=uiJf=BH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC3DCC433E5
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Jul 2020 10:25:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9B4EB20792
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Jul 2020 10:25:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MMMxKKVi";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lWtVLdfR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9B4EB20792
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=CqSTnlwT6+9H2H+LRM28PKfJIOK2lCISQFJhNw+3W4c=; b=MMMxKKVieazyM/OQgBz/d+VHn
	z4H9ysbTB5g98w4xXw5srqy3liASj5mqmE6oUhMXBSYsGyj4+QYtYZpZaBjfqJJibkkVdf6sheTiW
	YKJybiuQAU3GpQ1B3Gr9hi/YBJ/WO3+d4xcFmAxE/JOuuUvn0gjZZfU17WE1wjQR146uGVJGPuL4J
	46nFE+n2q9Z2kcXAouEeTMPqTKOGqf/ImwJjIQ/SG1iql6u2h7WIiJZzGu+BM+vbwHV3tfXyYVgsy
	fBWV//TTOcn9sbsXGCABwQng/7J2y8k043ELlGWQHRcc6rLUKSlanM/H/Nm3tCpN1ZYSE1xlpH7jC
	ifpf3/Hdg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k0MnW-00051K-Ll; Tue, 28 Jul 2020 10:25:26 +0000
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k0MnU-00050X-BW; Tue, 28 Jul 2020 10:25:25 +0000
Received: by mail-oi1-x243.google.com with SMTP id l84so4457741oig.10;
 Tue, 28 Jul 2020 03:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=c9eDEWn1oEoc77W2XMgWcgmmSn3pQA5mrUEY8YypgbM=;
 b=lWtVLdfRXKLA0oafpiA7O2552zaBd438hBmjbAkSLj2O9mYcpWWFoSJEsXmZqn6Tvk
 pNQ2x8Gr6+QPnxUd7JYB6ZFYmXjDQ6U/PKiGujZ43GO06+F8+wz2HSehaqn9VnSwdNdz
 B0nkkdpOTNaYWpfTuRyC0J6rVUscABWPvy1FXcOcTPdo6xIMpVuWK6PYhBb0hsnCz93v
 HQiEjjPFf0LDn4rvdSwrf4zpDq/ofqsh8FUWb/4msViF1TXcdKsKpus68w2RXEp33+K/
 eLn4rjz48ppidlmY11a4xuD4kKzJwI4Jn52t7Glw0Mfu/hjOnvap9T2HKRn9Urcf/zqt
 ikDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=c9eDEWn1oEoc77W2XMgWcgmmSn3pQA5mrUEY8YypgbM=;
 b=Y6qqAwPz2rRO2aMgiJl6T/qSnx6JcZEDPYnY4fnueVA6koK2NIQgWGGr/IUFLakIwk
 Mm1RVtITOzBKV36cQFYMvJ+Kvfpp1GohFmITRw1X3LHbVVNS3Kr+oslsL+hSr3mBtzTs
 CgRmB9R46n3MS5LbHqxrQBaDDYeVb+Dg4iCecqJ9UmvG8j3JZpPW1B/dWs+yO229nMBm
 8oZqzV9FV0e8HiUTNNrPCFi7y45eetu5ylldIrd2KJVEWYyJOUEy7mH4PcN8W+2fIM1u
 zJRQjlGIFqCBb2gmj9L6XCWPRo4jpjsAcm6CAbwgzXQYzT7NKjP88O+ySGcyaSsh5Km4
 rlBA==
X-Gm-Message-State: AOAM530gURDruaSFnKxAX6Ntv63V4KnY15t0eFZMA4SCLX7Et7lwfMsu
 jdAHLqFrAwOdKTIopfTEMNTMGGIHYVjQiDm0Q3Y=
X-Google-Smtp-Source: ABdhPJzQ5HZKTcRLoUciu8PdxQvObJp/E6hTnZ1nO7O2D46wmPBVRBbL0JFWuUmbkGTLGTYHLQPqQtDuyN6QViIforY=
X-Received: by 2002:aca:5296:: with SMTP id g144mr2841338oib.129.1595931920837; 
 Tue, 28 Jul 2020 03:25:20 -0700 (PDT)
MIME-Version: 1.0
References: <1595469798-3824-1-git-send-email-yongqiang.niu@mediatek.com>
 <1595469798-3824-3-git-send-email-yongqiang.niu@mediatek.com>
 <CAFqH_51sKR-tUHhdJs4N5KaGq-4+oFsAOhZsJqpFk0ikZjJ=mg@mail.gmail.com>
 <1595647675.13250.18.camel@mhfsdcap03>
In-Reply-To: <1595647675.13250.18.camel@mhfsdcap03>
From: Enric Balletbo Serra <eballetbo@gmail.com>
Date: Tue, 28 Jul 2020 12:25:09 +0200
Message-ID: <CAFqH_52KOJx-80z4Jx2f_Hp9UVH3zrtk5VaJD1nE8OUY-St4YA@mail.gmail.com>
Subject: Re: [v7, PATCH 2/7] mtk-mmsys: add mmsys private data
To: Yongqiang Niu <yongqiang.niu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200728_062524_442240_A782DDD1 
X-CRM114-Status: GOOD (  36.41  )
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, CK Hu <ck.hu@mediatek.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Yongqiang,

Missatge de Yongqiang Niu <yongqiang.niu@mediatek.com> del dia ds., 25
de jul. 2020 a les 5:29:
>
> On Thu, 2020-07-23 at 11:32 +0200, Enric Balletbo Serra wrote:
> > Hi Yongqiang Niu,
> >
> > Thank you for your patch.
> >
> > Missatge de Yongqiang Niu <yongqiang.niu@mediatek.com> del dia dj., 23
> > de jul. 2020 a les 4:05:
> > >
> > > add mmsys private data
> > >
> >
> > I think this change requires a better explanation of what you are
> > doing. Although I'm really uncomfortable with this change, why you
> > need to create a new mt2701-mmsys file?
>
> reason:
> 1.there will more and more Mediatek Soc upstream, and the display path
> connection function mtk_mmsys_ddp_mout_en, mtk_mmsys_ddp_sel_in and
> mtk_mmsys_ddp_sout_sel will complicated more and more,
> 2. many of the connection are only used in some SoC, and useless for
> other SoC and not readable,
> 3. if we add a new SoC connection, we need check is this affect other
> Soc,
> >
> > > Feature: drm/mediatek
> >
> > Remove this.
> next version will remove this
> >
> > > Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> > > ---
> > >  drivers/soc/mediatek/Makefile             |   1 +
> > >  drivers/soc/mediatek/mmsys/Makefile       |   2 +
> > >  drivers/soc/mediatek/mmsys/mt2701-mmsys.c | 250 +++++++++++++++++++++++++++
> > >  drivers/soc/mediatek/mtk-mmsys.c          | 271 +++++-------------------------
> > >  include/linux/soc/mediatek/mtk-mmsys.h    |  15 ++
> > >  5 files changed, 314 insertions(+), 225 deletions(-)
> > >  create mode 100644 drivers/soc/mediatek/mmsys/Makefile
> > >  create mode 100644 drivers/soc/mediatek/mmsys/mt2701-mmsys.c
> > >
> > > diff --git a/drivers/soc/mediatek/Makefile b/drivers/soc/mediatek/Makefile
> > > index 2afa7b9..b37ac2c 100644
> > > --- a/drivers/soc/mediatek/Makefile
> > > +++ b/drivers/soc/mediatek/Makefile
> > > @@ -3,3 +3,4 @@ obj-$(CONFIG_MTK_CMDQ) += mtk-cmdq-helper.o
> > >  obj-$(CONFIG_MTK_PMIC_WRAP) += mtk-pmic-wrap.o
> > >  obj-$(CONFIG_MTK_SCPSYS) += mtk-scpsys.o
> > >  obj-$(CONFIG_MTK_MMSYS) += mtk-mmsys.o
> > > +obj-$(CONFIG_MTK_MMSYS) += mmsys/
> > > diff --git a/drivers/soc/mediatek/mmsys/Makefile b/drivers/soc/mediatek/mmsys/Makefile
> > > new file mode 100644
> > > index 0000000..33b0dab
> > > --- /dev/null
> > > +++ b/drivers/soc/mediatek/mmsys/Makefile
> > > @@ -0,0 +1,2 @@
> > > +# SPDX-License-Identifier: GPL-2.0-only
> > > +obj-y += mt2701-mmsys.o
> > > diff --git a/drivers/soc/mediatek/mmsys/mt2701-mmsys.c b/drivers/soc/mediatek/mmsys/mt2701-mmsys.c
> > > new file mode 100644
> > > index 0000000..b8e53b0
> > > --- /dev/null
> > > +++ b/drivers/soc/mediatek/mmsys/mt2701-mmsys.c
> > > @@ -0,0 +1,250 @@
> > > +// SPDX-License-Identifier: GPL-2.0
> > > +//
> > > +// Copyright (c) 2020 MediaTek Inc.
> > > +
> > > +#include <linux/device.h>
> > > +#include <linux/io.h>
> > > +#include <linux/of_device.h>
> > > +#include <linux/platform_device.h>
> > > +#include <linux/soc/mediatek/mtk-mmsys.h>
> > > +
> > > +#define DISP_REG_CONFIG_DISP_OVL0_MOUT_EN      0x040
> > > +#define DISP_REG_CONFIG_DISP_OVL1_MOUT_EN      0x044
> > > +#define DISP_REG_CONFIG_DISP_OD_MOUT_EN                0x048
> > > +#define DISP_REG_CONFIG_DISP_GAMMA_MOUT_EN     0x04c
> > > +#define DISP_REG_CONFIG_DISP_UFOE_MOUT_EN      0x050
> > > +#define DISP_REG_CONFIG_DISP_COLOR0_SEL_IN     0x084
> > > +#define DISP_REG_CONFIG_DISP_COLOR1_SEL_IN     0x088
> > > +#define DISP_REG_CONFIG_DSIE_SEL_IN            0x0a4
> > > +#define DISP_REG_CONFIG_DSIO_SEL_IN            0x0a8
> > > +#define DISP_REG_CONFIG_DPI_SEL_IN             0x0ac
> > > +#define DISP_REG_CONFIG_DISP_RDMA2_SOUT                0x0b8
> > > +#define DISP_REG_CONFIG_DISP_RDMA0_SOUT_EN     0x0c4
> > > +#define DISP_REG_CONFIG_DISP_RDMA1_SOUT_EN     0x0c8
> > > +#define DISP_REG_CONFIG_MMSYS_CG_CON0          0x100
> > > +
> > > +#define DISP_REG_CONFIG_DISP_OVL_MOUT_EN       0x030
> > > +#define DISP_REG_CONFIG_OUT_SEL                        0x04c
> > > +#define DISP_REG_CONFIG_DSI_SEL                        0x050
> > > +#define DISP_REG_CONFIG_DPI_SEL                        0x064
> > > +
> > > +#define OVL0_MOUT_EN_COLOR0                    0x1
> > > +#define OD_MOUT_EN_RDMA0                       0x1
> > > +#define OD1_MOUT_EN_RDMA1                      BIT(16)
> > > +#define UFOE_MOUT_EN_DSI0                      0x1
> > > +#define COLOR0_SEL_IN_OVL0                     0x1
> > > +#define OVL1_MOUT_EN_COLOR1                    0x1
> > > +#define GAMMA_MOUT_EN_RDMA1                    0x1
> > > +#define RDMA0_SOUT_DPI0                                0x2
> > > +#define RDMA0_SOUT_DPI1                                0x3
> > > +#define RDMA0_SOUT_DSI1                                0x1
> > > +#define RDMA0_SOUT_DSI2                                0x4
> > > +#define RDMA0_SOUT_DSI3                                0x5
> > > +#define RDMA1_SOUT_DPI0                                0x2
> > > +#define RDMA1_SOUT_DPI1                                0x3
> > > +#define RDMA1_SOUT_DSI1                                0x1
> > > +#define RDMA1_SOUT_DSI2                                0x4
> > > +#define RDMA1_SOUT_DSI3                                0x5
> > > +#define RDMA2_SOUT_DPI0                                0x2
> > > +#define RDMA2_SOUT_DPI1                                0x3
> > > +#define RDMA2_SOUT_DSI1                                0x1
> > > +#define RDMA2_SOUT_DSI2                                0x4
> > > +#define RDMA2_SOUT_DSI3                                0x5
> > > +#define DPI0_SEL_IN_RDMA1                      0x1
> > > +#define DPI0_SEL_IN_RDMA2                      0x3
> > > +#define DPI1_SEL_IN_RDMA1                      (0x1 << 8)
> > > +#define DPI1_SEL_IN_RDMA2                      (0x3 << 8)
> > > +#define DSI0_SEL_IN_RDMA1                      0x1
> > > +#define DSI0_SEL_IN_RDMA2                      0x4
> > > +#define DSI1_SEL_IN_RDMA1                      0x1
> > > +#define DSI1_SEL_IN_RDMA2                      0x4
> > > +#define DSI2_SEL_IN_RDMA1                      (0x1 << 16)
> > > +#define DSI2_SEL_IN_RDMA2                      (0x4 << 16)
> > > +#define DSI3_SEL_IN_RDMA1                      (0x1 << 16)
> > > +#define DSI3_SEL_IN_RDMA2                      (0x4 << 16)
> > > +#define COLOR1_SEL_IN_OVL1                     0x1
> > > +
> > > +#define OVL_MOUT_EN_RDMA                       0x1
> > > +#define BLS_TO_DSI_RDMA1_TO_DPI1               0x8
> > > +#define BLS_TO_DPI_RDMA1_TO_DSI                        0x2
> > > +#define DSI_SEL_IN_BLS                         0x0
> > > +#define DPI_SEL_IN_BLS                         0x0
> > > +#define DSI_SEL_IN_RDMA                                0x1
> > > +
> > > +static unsigned int mtk_mmsys_ddp_mout_en(enum mtk_ddp_comp_id cur,
> > > +                                         enum mtk_ddp_comp_id next,
> > > +                                         unsigned int *addr)
> > > +{
> >
> > Can't be reused this function for all devices? You did in the previous
> > series, why not now?
>
> can not reused, that why need add mmsys private data like before
> version.

You did in the previous series, would that mean that your previous
series were wrong or nonworking or break on some SoCs?

I agree that you need per SoC data, what I am complaining is the idea
of having pointers to functions instead of just having the registers
or the media paths per SoC. You can have private data for registers,
something like this:

static const struct mtk_mmsys_driver_data mt8183_mmsys_driver_data = {
        .clk_driver = "clk-mt8183-mm",
        .regs = {
                .ovl0_mout_en = MT8183_DISP_OVL0_MOUT_EN,
                .rdma0_sout_sel_in = MT8183_DISP_RDMA0_SOUT_SEL_IN,
                .rdma0_sout_color0 = MT8183_RDMA0_SOUT_COLOR0,
                .rdma1_sout_sel_in = MT8183_DISP_RDMA1_SOUT_SEL_IN,
                .rdma1_sout_dsi0 = MT8183_RDMA1_SOUT_DSI0,
                .dpi0_sel_in = MT8183_DISP_DPI0_SEL_IN,
                .dpi0_sel_in_rdma1 = MT8183_DPI0_SEL_IN_RDMA1,
                .dsi0_sel_in = MT8183_DISP_DSI0_SEL_IN,
                .dsi0_sel_in_rdma1 = MT8183_DSI0_SEL_IN_RDMA1,
        },
};

And you can also have the media configuration paths in the driver
data, similar to what you did for mt8183 but not for the others. But,
I'd recommend to do this in a second step, and go step-by-step. Your
v6 and v7 are quite different, but IMHO I'm more in favor of what you
did for v6 (as a first step to support mt8183) than this patchset. For
v7 I was expecting just to move the bits that needed to mtk-mmsys, not
such rework. Said all that, I'm not the maintainer and is up to the
maintainer to decide the direction that driver should take.

> but that still not a good idea.
>
> the next path like this will be more readable, and more easy to maintain
> https://patchwork.kernel.org/patch/11679539/

Ack, that's more readable and probably should be the direction to go,
always assuming we have the *data* (mmsys_path_sel, etc.) per SoC and
the functions  mtk_mmsys_ddp_mout_en(),  mtk_mmsys_ddp_sel_in(),
mtk_mmsys_ddp_sout_sel() common for all SoCs.

Thanks,
 Enric

[snip]

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
