Return-Path: <SRS0=u2zk=MW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D8CEC4338F
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Jul 2021 03:13:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0E56260ED4
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Jul 2021 03:13:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0E56260ED4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N64Q+URPrxBEuH5S5uTKMYs6cGBZJmcSGmfDYLlzpbc=; b=h+ZHTq1fsLAbHx
	ZCIyGmypBWpQxAZXDsNMnz770aM47JRzmPikEOWEzFF039Ppzo9sYTAeqbSa9mcdBu9Hcn8b34Bn8
	L2jXkLEUwWxZKMOUc+AMhh47NYjVxSlrs44B5cDk+8KWp4oaXxKXMumBEpbGF0sV2y8oSGNQhj2Ch
	ApNZzepsIBqoIWln4QmsfYibbFybEEBSmW4VJNL9Lo2ri28eJRVouqbl9WObuIJcp4AvezQqR0UXH
	fmCeKm/65LFMUFm5PjDavLBpuHKlDP4tpPz6HnG0Kuv+GyBsJ/lOJO5kdI4JWpDdsT+6HAo5PtuLk
	6fmJS7+nw5LynLy6oGCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m9Iy1-006sEX-Ij; Fri, 30 Jul 2021 03:13:45 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m9IxI-006rjp-HD; Fri, 30 Jul 2021 03:13:02 +0000
X-UUID: ea50fadba73b404fbef1650e1c1f11d9-20210729
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=LejJWnZ2JOLo/DhJM3s97omYPuDb/lLAN8IlUBxwa7k=; 
 b=h1+sYkduhXDBwaUJTp2EDoRCqHiU2fZAqAVrU6beVzXSojWToT8zMSE3q3X6js8O/L8optyeXYkCm5sJkapGC1zWUKb5vR4RS1FMmvLLH5AuclJHiJHCa24O1FC7LmwHJ1fdH3VtM7FrGKqin7I2av57DRVK2did+BPU5QyGZes=;
X-UUID: ea50fadba73b404fbef1650e1c1f11d9-20210729
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <chun-jie.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 975429444; Thu, 29 Jul 2021 20:12:57 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 29 Jul 2021 20:12:55 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 30 Jul 2021 11:12:54 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 30 Jul 2021 11:12:53 +0800
Message-ID: <526dc9077c696015d1f1065cb6e7f2c7c446ad61.camel@mediatek.com>
Subject: Re: [v3 3/5] soc: mediatek: pm-domains: Add support for mt8195
From: Chun-Jie Chen <chun-jie.chen@mediatek.com>
To: Chen-Yu Tsai <wenst@chromium.org>
CC: Enric Balletbo i Serra <enric.balletbo@collabora.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Nicolas Boichat <drinkcat@chromium.org>, "Rob
 Herring" <robh+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>, LKML
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, srv_heupstream
 <srv_heupstream@mediatek.com>, Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Fri, 30 Jul 2021 11:12:53 +0800
In-Reply-To: <CAGXv+5EG00P4EzNjm=7nRNwYwEF9aXorhELsmbxtrYM20SW0KQ@mail.gmail.com>
References: <20210705054111.4473-1-chun-jie.chen@mediatek.com>
 <20210705054111.4473-4-chun-jie.chen@mediatek.com>
 <CAGXv+5EG00P4EzNjm=7nRNwYwEF9aXorhELsmbxtrYM20SW0KQ@mail.gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210729_201300_634331_1FCAD713 
X-CRM114-Status: GOOD (  26.20  )
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

On Tue, 2021-07-20 at 16:51 +0800, Chen-Yu Tsai wrote:
> Hi,
> On Mon, Jul 5, 2021 at 1:42 PM Chun-Jie Chen <
> chun-jie.chen@mediatek.com> wrote:
> > 
> > Add domain control data including bus protection data size
> > change due to more protection steps in mt8195.
> > 
> > Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> > ---
> >  drivers/soc/mediatek/mt8195-pm-domains.h | 738
> > +++++++++++++++++++++++
> >  drivers/soc/mediatek/mtk-pm-domains.c    |   5 +
> >  drivers/soc/mediatek/mtk-pm-domains.h    |   2 +-
> >  include/linux/soc/mediatek/infracfg.h    | 103 ++++
> >  4 files changed, 847 insertions(+), 1 deletion(-)
> >  create mode 100644 drivers/soc/mediatek/mt8195-pm-domains.h
> > 
> > diff --git a/drivers/soc/mediatek/mt8195-pm-domains.h
> > b/drivers/soc/mediatek/mt8195-pm-domains.h
> > new file mode 100644
> > index 000000000000..54bb7af8e9a3
> > --- /dev/null
> > +++ b/drivers/soc/mediatek/mt8195-pm-domains.h
> > @@ -0,0 +1,738 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only */
> > +/*
> > + * Copyright (c) 2021 MediaTek Inc.
> > + * Author: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> > + */
> > +
> > +#ifndef __SOC_MEDIATEK_MT8195_PM_DOMAINS_H
> > +#define __SOC_MEDIATEK_MT8195_PM_DOMAINS_H
> > +
> > +#include "mtk-pm-domains.h"
> > +#include <dt-bindings/power/mt8195-power.h>
> > +
> > +/*
> > + * MT8195 power domain support
> > + */
> > +
> > +static const struct scpsys_domain_data scpsys_domain_data_mt8195[]
> > = {
> 
> The SCPSYS block is not documented in the datasheets available.
> However
> I did look at all the register and bit offsets and confirmed nothing
> overlapped.
> 
> > diff --git a/drivers/soc/mediatek/mtk-pm-domains.c
> > b/drivers/soc/mediatek/mtk-pm-domains.c
> > index 2689f02d7a41..12552c9996ac 100644
> > --- a/drivers/soc/mediatek/mtk-pm-domains.c
> > +++ b/drivers/soc/mediatek/mtk-pm-domains.c
> > @@ -20,6 +20,7 @@
> >  #include "mt8173-pm-domains.h"
> >  #include "mt8183-pm-domains.h"
> >  #include "mt8192-pm-domains.h"
> > +#include "mt8195-pm-domains.h"
> > 
> >  #define MTK_POLL_DELAY_US              10
> >  #define MTK_POLL_TIMEOUT               USEC_PER_SEC
> > @@ -576,6 +577,10 @@ static const struct of_device_id
> > scpsys_of_match[] = {
> >                 .compatible = "mediatek,mt8192-power-controller",
> >                 .data = &mt8192_scpsys_data,
> >         },
> > +       {
> > +               .compatible = "mediatek,mt8195-power-controller",
> > +               .data = &mt8195_scpsys_data,
> > +       },
> >         { }
> >  };
> > 
> > diff --git a/drivers/soc/mediatek/mtk-pm-domains.h
> > b/drivers/soc/mediatek/mtk-pm-domains.h
> > index 8b86ed22ca56..caaa38100093 100644
> > --- a/drivers/soc/mediatek/mtk-pm-domains.h
> > +++ b/drivers/soc/mediatek/mtk-pm-domains.h
> > @@ -37,7 +37,7 @@
> >  #define PWR_STATUS_AUDIO               BIT(24)
> >  #define PWR_STATUS_USB                 BIT(25)
> > 
> > -#define SPM_MAX_BUS_PROT_DATA          5
> > +#define SPM_MAX_BUS_PROT_DATA          6
> > 
> >  #define _BUS_PROT(_mask, _set, _clr, _sta, _update, _ignore) { \
> >                 .bus_prot_mask = (_mask),                       \
> > diff --git a/include/linux/soc/mediatek/infracfg.h
> > b/include/linux/soc/mediatek/infracfg.h
> > index 4615a228da51..3e90fb9b926a 100644
> > --- a/include/linux/soc/mediatek/infracfg.h
> > +++ b/include/linux/soc/mediatek/infracfg.h
> > @@ -2,6 +2,109 @@
> >  #ifndef __SOC_MEDIATEK_INFRACFG_H
> >  #define __SOC_MEDIATEK_INFRACFG_H
> > 
> > +#define MT8195_TOP_AXI_PROT_EN_STA1                     0x228
> > +#define MT8195_TOP_AXI_PROT_EN_1_STA1                   0x258
> > +#define MT8195_TOP_AXI_PROT_EN_SET                     0x2a0
> > +#define MT8195_TOP_AXI_PROT_EN_CLR                      0x2a4
> > +#define MT8195_TOP_AXI_PROT_EN_1_SET                    0x2a8
> > +#define MT8195_TOP_AXI_PROT_EN_1_CLR                    0x2ac
> > +#define MT8195_TOP_AXI_PROT_EN_MM_SET                   0x2d4
> > +#define MT8195_TOP_AXI_PROT_EN_MM_CLR                   0x2d8
> > +#define MT8195_TOP_AXI_PROT_EN_MM_STA1                  0x2ec
> > +#define MT8195_TOP_AXI_PROT_EN_2_SET                    0x714
> > +#define MT8195_TOP_AXI_PROT_EN_2_CLR                    0x718
> > +#define MT8195_TOP_AXI_PROT_EN_2_STA1                   0x724
> > +#define MT8195_TOP_AXI_PROT_EN_VDNR_SET                 0xb84
> > +#define MT8195_TOP_AXI_PROT_EN_VDNR_CLR                 0xb88
> > +#define MT8195_TOP_AXI_PROT_EN_VDNR_STA1                0xb90
> > +#define MT8195_TOP_AXI_PROT_EN_VDNR_1_SET               0xba4
> > +#define MT8195_TOP_AXI_PROT_EN_VDNR_1_CLR               0xba8
> > +#define MT8195_TOP_AXI_PROT_EN_VDNR_1_STA1              0xbb0
> > +#define MT8195_TOP_AXI_PROT_EN_VDNR_2_SET               0xbb8
> > +#define MT8195_TOP_AXI_PROT_EN_VDNR_2_CLR               0xbbc
> > +#define MT8195_TOP_AXI_PROT_EN_VDNR_2_STA1              0xbc4
> > +#define MT8195_TOP_AXI_PROT_EN_SUB_INFRA_VDNR_SET       0xbcc
> > +#define MT8195_TOP_AXI_PROT_EN_SUB_INFRA_VDNR_CLR       0xbd0
> > +#define MT8195_TOP_AXI_PROT_EN_SUB_INFRA_VDNR_STA1      0xbd8
> > +#define MT8195_TOP_AXI_PROT_EN_MM_2_SET                 0xdcc
> > +#define MT8195_TOP_AXI_PROT_EN_MM_2_CLR                 0xdd0
> > +#define MT8195_TOP_AXI_PROT_EN_MM_2_STA1                0xdd8
> 
> These all look correct.
> 
> > +#define MT8195_TOP_AXI_PROT_EN_NNA0                    BIT(1)
> > +#define MT8195_TOP_AXI_PROT_EN_NNA1                    BIT(2)
> > +#define MT8195_TOP_AXI_PROT_EN_NNA                     GENMASK(2,
> > 1)
> > +#define MT8195_TOP_AXI_PROT_EN_VDOSYS0                 BIT(6)
> > +#define MT8195_TOP_AXI_PROT_EN_VPPSYS0                 BIT(10)
> > +#define MT8195_TOP_AXI_PROT_EN_MFG1                    BIT(11)
> > +#define
> > MT8195_TOP_AXI_PROT_EN_MFG1_2ND                        GENMASK(22,
> > 21)
> > +#define MT8195_TOP_AXI_PROT_EN_VPPSYS0_2ND             BIT(23)
> > +#define MT8195_TOP_AXI_PROT_EN_1_MFG1                  GENMASK(20,
> > 19)
> > +#define MT8195_TOP_AXI_PROT_EN_1_CAM                   BIT(22)
> > +#define MT8195_TOP_AXI_PROT_EN_2_CAM                   BIT(0)
> > +#define MT8195_TOP_AXI_PROT_EN_2_MFG1_2ND              GENMASK(6,
> > 5)
> > +#define MT8195_TOP_AXI_PROT_EN_2_MFG1                  BIT(7)
> > +#define MT8195_TOP_AXI_PROT_EN_2_AUDIO_ASRC            (BIT(8) |
> > BIT(17))
> > +#define MT8195_TOP_AXI_PROT_EN_2_AUDIO                 (BIT(9) |
> > BIT(11))
> > +#define MT8195_TOP_AXI_PROT_EN_2_ADSP                  (BIT(12) |
> > GENMASK(16, 14))
> > +#define MT8195_TOP_AXI_PROT_EN_2_NNA0_2ND              BIT(19)
> > +#define MT8195_TOP_AXI_PROT_EN_2_NNA1_2ND              BIT(20)
> > +#define MT8195_TOP_AXI_PROT_EN_2_NNA_2ND               GENMASK(20,
> > 19)
> > +#define MT8195_TOP_AXI_PROT_EN_2_NNA0                  BIT(21)
> > +#define MT8195_TOP_AXI_PROT_EN_2_NNA1                  BIT(22)
> > +#define MT8195_TOP_AXI_PROT_EN_2_NNA                   GENMASK(22,
> > 21)
> > +#define MT8195_TOP_AXI_PROT_EN_MM_CAM                  (BIT(0) |
> > BIT(2) | BIT(4))
> > +#define MT8195_TOP_AXI_PROT_EN_MM_IPE                  BIT(1)
> > +#define MT8195_TOP_AXI_PROT_EN_MM_IMG                  (BIT(1) |
> > BIT(3))
> > +#define MT8195_TOP_AXI_PROT_EN_MM_VPPSYS0              (GENMASK(2,
> > 0) | GENMASK(8, 6) |        \
> > +                                                       GENMASK(12,
> > 10) | GENMASK(21, 19) |     \
> > +                                                       BIT(31))
> > +#define MT8195_TOP_AXI_PROT_EN_MM_VDOSYS0              (GENMASK(5,
> > 3) | BIT(9) |       \
> > +                                                       GENMASK(14,
> > 13) | GENMASK(21, 17) |     \
> > +                                                       BIT(30))
> > +#define MT8195_TOP_AXI_PROT_EN_MM_VPPSYS1              GENMASK(8,
> > 5)
> > +#define MT8195_TOP_AXI_PROT_EN_MM_VENC                 (BIT(9) |
> > BIT(11))
> > +#define MT8195_TOP_AXI_PROT_EN_MM_VENC_CORE1           (BIT(10) |
> > BIT(12))
> > +#define
> > MT8195_TOP_AXI_PROT_EN_MM_VDEC0                        BIT(13)
> > +#define
> > MT8195_TOP_AXI_PROT_EN_MM_VDEC1                        BIT(14)
> > +#define MT8195_TOP_AXI_PROT_EN_MM_VDOSYS1_2ND          BIT(22)
> > +#define MT8195_TOP_AXI_PROT_EN_MM_VPPSYS1_2ND          BIT(23)
> > +#define MT8195_TOP_AXI_PROT_EN_MM_CAM_2ND              BIT(24)
> > +#define MT8195_TOP_AXI_PROT_EN_MM_IMG_2ND              BIT(25)
> > +#define MT8195_TOP_AXI_PROT_EN_MM_VENC_2ND             BIT(26)
> > +#define MT8195_TOP_AXI_PROT_EN_MM_WPESYS               BIT(27)
> > +#define MT8195_TOP_AXI_PROT_EN_MM_VDEC0_2ND            BIT(28)
> > +#define MT8195_TOP_AXI_PROT_EN_MM_VDEC1_2ND            BIT(29)
> > +#define MT8195_TOP_AXI_PROT_EN_MM_VDOSYS0_2ND          GENMASK(29,
> > 22)
> > +#define MT8195_TOP_AXI_PROT_EN_MM_VDOSYS1              GENMASK(31,
> > 30)
> 
> There's significant overlap within this block. This means when the
> base
> VDOSYS0 power domain is on, all the overlapped protection bits get
> turned
> off. I'm not sure that's correct.
> 
> Same goes for IMG, which overlaps with IPE.
> 

Because the timing of enable & disable protection are different, we
duplicate some control bit in different power domain.

For example: IMG & IPE are parent and child relation, so IMG must power
on before IPE, IPE must power off before IMG.
We want to clear some bits (protection disable) when power on IMG and
set some bits (protection enable) when power off IPE.

> > +#define
> > MT8195_TOP_AXI_PROT_EN_MM_2_VPPSYS0_2ND                (GENMASK(7,
> > 0) | GENMASK(18, 11))
> > +#define MT8195_TOP_AXI_PROT_EN_MM_2_VENC               BIT(2)
> > +#define MT8195_TOP_AXI_PROT_EN_MM_2_VENC_CORE1         (BIT(3) |
> > BIT(15))
> > +#define
> > MT8195_TOP_AXI_PROT_EN_MM_2_CAM                        (BIT(5) |
> > BIT(17))
> > +#define MT8195_TOP_AXI_PROT_EN_MM_2_VPPSYS1            (GENMASK(7,
> > 6) | BIT(18))
> > +#define MT8195_TOP_AXI_PROT_EN_MM_2_VPPSYS0            (GENMASK(9,
> > 8) | GENMASK(22, 21) | BIT(24))
> > +#define MT8195_TOP_AXI_PROT_EN_MM_2_VDOSYS1            BIT(10)
> > +#define MT8195_TOP_AXI_PROT_EN_MM_2_VDEC2_2ND          BIT(12)
> > +#define MT8195_TOP_AXI_PROT_EN_MM_2_VDEC0_2ND          BIT(13)
> > +#define MT8195_TOP_AXI_PROT_EN_MM_2_WPESYS_2ND         BIT(14)
> > +#define
> > MT8195_TOP_AXI_PROT_EN_MM_2_IMG                        BIT(16)
> > +#define
> > MT8195_TOP_AXI_PROT_EN_MM_2_IPE                        BIT(16)
> 
> And here, IMG and IPE are the same.
> 
> > +#define MT8195_TOP_AXI_PROT_EN_MM_2_VDEC2              BIT(21)
> > +#define MT8195_TOP_AXI_PROT_EN_MM_2_VDEC0              BIT(22)
> > +#define MT8195_TOP_AXI_PROT_EN_MM_2_VDOSYS0            BIT(23)
> > +#define MT8195_TOP_AXI_PROT_EN_MM_2_WPESYS             GENMASK(24,
> > 23)
> > +#define MT8195_TOP_AXI_PROT_EN_VDNR_1_EPD_TX           BIT(1)
> > +#define MT8195_TOP_AXI_PROT_EN_VDNR_1_DP_TX            BIT(2)
> > +#define
> > MT8195_TOP_AXI_PROT_EN_VDNR_PCIE_MAC_P0                (BIT(11) |
> > BIT(28))
> > +#define
> > MT8195_TOP_AXI_PROT_EN_VDNR_PCIE_MAC_P1                (BIT(12) |
> > BIT(29))
> > +#define MT8195_TOP_AXI_PROT_EN_VDNR_1_PCIE_MAC_P0      BIT(13)
> > +#define MT8195_TOP_AXI_PROT_EN_VDNR_1_PCIE_MAC_P1      BIT(14)
> > +#define MT8195_TOP_AXI_PROT_EN_SUB_INFRA_VDNR_MFG1     (BIT(17) |
> > BIT(19))
> > +#define MT8195_TOP_AXI_PROT_EN_SUB_INFRA_VDNR_VPPSYS0  BIT(20)
> > +#define MT8195_TOP_AXI_PROT_EN_SUB_INFRA_VDNR_VDOSYS0  BIT(21)
> > +#define MT8195_TOP_AXI_PROT_EN_VDNR_2_NNA0             BIT(25)
> > +#define MT8195_TOP_AXI_PROT_EN_VDNR_2_NNA1             BIT(26)
> > +#define MT8195_TOP_AXI_PROT_EN_VDNR_2_NNA              GENMASK(26,
> > 25)
> > +
> 
> All these MT8195_TOP_AXI_PROT_EN_* bit offsets aren't documented.
> Besides
> the huge overlap above, it seems NNA also includes NNA0 and NNA1.
> 
> 
> Regards
> ChenYu
> 

The detail of MT8195_TOP_AXI_PROT_EN_* bit is related to the bus
design, so we don't descript the detail in datasheet.

I will remove the unused power domain and data (like NNA) because these
are not used in 8195 chrome project.

Best Regards,
Chun-Jie

> 
> >  #define MT8192_TOP_AXI_PROT_EN_STA1                    0x228
> >  #define MT8192_TOP_AXI_PROT_EN_1_STA1                  0x258
> >  #define MT8192_TOP_AXI_PROT_EN_SET                     0x2a0
> > --
> > 2.18.0
> > _______________________________________________
> > Linux-mediatek mailing list
> > Linux-mediatek@lists.infradead.org
> > 
https://urldefense.com/v3/__http://lists.infradead.org/mailman/listinfo/linux-mediatek__;!!CTRNKA9wMg0ARbw!3jALcSgob2IQknQnQlIPVKd79QdKmXI1Y9X7kaQ2KR8AYdyP0V8Km3u_Cfq8VPMJ4-zn$
> >  
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
