Return-Path: <SRS0=AkNb=2K=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA2BCC2D0D2
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Dec 2019 05:00:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B0A8821D7D
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Dec 2019 05:00:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PSeRumVm";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="ViDFfWpm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B0A8821D7D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KwurMi3x5aPnhslsIcXyiypdTuZGETKDcYb199QY8nw=; b=PSeRumVmFPJCa+
	eg2MN+vxYMaiDvf+emXyBlSwmZOndqCIlyDEqre0Fp29flFmfTmm+Lwlbk9gOlSHjApTIkYhasLVu
	pGMLYDYt6ioZ8kfDDDNmcLGDLrNeqN4UtONPE1AVYfKA8x6pnXjDSNb6FVvssy/LimTbZllmh6DSY
	vZzziwEZd4Y2Ts0wKGWEp9ceaDbXQgVSbL+loS1O2+58/quNWSS/vppKnGNOxQtsPrWuKSJeRIlXj
	xaIrKnF2EzeHiSsk01WYLl/QbKamaV5+hIRu9lFTUJJeD3zNrCXVoKOwfwSQ0N8tiRx/qnEuVdFUR
	2BM7c4a9IEQu9T1/8AUA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iiAOf-0007UO-OM; Fri, 20 Dec 2019 05:00:17 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iiAOc-0007Td-9e; Fri, 20 Dec 2019 05:00:16 +0000
X-UUID: f9a3e96b7dd64ea89f6fb30d3ee1fc73-20191219
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=WQ5D1NliONHbgSeHA/ensVa+Zzp3vnZWnc4pqGSWPUw=; 
 b=ViDFfWpmL4nqRbLBbLd6J7kfteDPgeCKf97Xw90hMPCCOXSoZKZvh2F+2ihBT1RReFNLMc8bU/iWFT7SfRIIOjxCgHfjMnSmMIKnvrp9qnfBb23r4GShtHKOE9PqT7FAuVcacsclh3wTtETKKiVaFruJL7F+pPWFPB8Fy8A7c58=;
X-UUID: f9a3e96b7dd64ea89f6fb30d3ee1fc73-20191219
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <weiyi.lu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 890832662; Thu, 19 Dec 2019 21:00:08 -0800
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 19 Dec 2019 21:00:22 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 20 Dec 2019 12:59:27 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Fri, 20 Dec 2019 12:59:24 +0800
Message-ID: <1576818001.8410.16.camel@mtksdaap41>
Subject: Re: [PATCH v11 05/10] soc: mediatek: Remove infracfg misc driver
 support
From: Weiyi Lu <weiyi.lu@mediatek.com>
To: Nicolas Boichat <drinkcat@chromium.org>
Date: Fri, 20 Dec 2019 13:00:01 +0800
In-Reply-To: <CANMq1KBLuugcoWb1o=rUkBR7oY5Cf5rX=DCvpVP5D_6FJ8jipw@mail.gmail.com>
References: <1576813564-23927-1-git-send-email-weiyi.lu@mediatek.com>
 <1576813564-23927-6-git-send-email-weiyi.lu@mediatek.com>
 <CANMq1KBLuugcoWb1o=rUkBR7oY5Cf5rX=DCvpVP5D_6FJ8jipw@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191219_210014_348753_489485F1 
X-CRM114-Status: GOOD (  16.08  )
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
Cc: Rob Herring <robh@kernel.org>, srv_heupstream <srv_heupstream@mediatek.com>,
 James Liao <jamesjj.liao@mediatek.com>, lkml <linux-kernel@vger.kernel.org>,
 Fan Chen <fan.chen@mediatek.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Sascha Hauer <kernel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, 2019-12-20 at 12:11 +0800, Nicolas Boichat wrote:
> On Fri, Dec 20, 2019 at 11:46 AM Weiyi Lu <weiyi.lu@mediatek.com> wrote:
> >
> > In previous patches, we introduce scpsys-ext driver that covers
> > the functions which infracfg misc driver provided.
> > And then replace bus_prot_mask with bp_table of all compatibles.
> > Now, we're going to remove infracfg misc drvier which is no longer
> > being used.
> >
> > Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
> > ---
> >  drivers/soc/mediatek/Kconfig          | 10 -----
> >  drivers/soc/mediatek/Makefile         |  3 +-
> >  drivers/soc/mediatek/mtk-infracfg.c   | 79 -----------------------------------
> >  include/linux/soc/mediatek/infracfg.h | 39 -----------------
> >  4 files changed, 1 insertion(+), 130 deletions(-)
> >  delete mode 100644 drivers/soc/mediatek/mtk-infracfg.c
> >  delete mode 100644 include/linux/soc/mediatek/infracfg.h
> > [snip]
> > diff --git a/include/linux/soc/mediatek/infracfg.h b/include/linux/soc/mediatek/infracfg.h
> > deleted file mode 100644
> > index fd25f01..0000000
> > --- a/include/linux/soc/mediatek/infracfg.h
> > +++ /dev/null
> > @@ -1,39 +0,0 @@
> > -/* SPDX-License-Identifier: GPL-2.0 */
> > -#ifndef __SOC_MEDIATEK_INFRACFG_H
> > -#define __SOC_MEDIATEK_INFRACFG_H
> > -
> > -#define MT8173_TOP_AXI_PROT_EN_MCI_M2          BIT(0)
> > -#define MT8173_TOP_AXI_PROT_EN_MM_M0           BIT(1)
> > -#define MT8173_TOP_AXI_PROT_EN_MM_M1           BIT(2)
> > -#define MT8173_TOP_AXI_PROT_EN_MMAPB_S         BIT(6)
> > -#define MT8173_TOP_AXI_PROT_EN_L2C_M2          BIT(9)
> > -#define MT8173_TOP_AXI_PROT_EN_L2SS_SMI                BIT(11)
> > -#define MT8173_TOP_AXI_PROT_EN_L2SS_ADD                BIT(12)
> > -#define MT8173_TOP_AXI_PROT_EN_CCI_M2          BIT(13)
> > -#define MT8173_TOP_AXI_PROT_EN_MFG_S           BIT(14)
> > -#define MT8173_TOP_AXI_PROT_EN_PERI_M0         BIT(15)
> > -#define MT8173_TOP_AXI_PROT_EN_PERI_M1         BIT(16)
> > -#define MT8173_TOP_AXI_PROT_EN_DEBUGSYS                BIT(17)
> > -#define MT8173_TOP_AXI_PROT_EN_CQ_DMA          BIT(18)
> > -#define MT8173_TOP_AXI_PROT_EN_GCPU            BIT(19)
> > -#define MT8173_TOP_AXI_PROT_EN_IOMMU           BIT(20)
> > -#define MT8173_TOP_AXI_PROT_EN_MFG_M0          BIT(21)
> > -#define MT8173_TOP_AXI_PROT_EN_MFG_M1          BIT(22)
> > -#define MT8173_TOP_AXI_PROT_EN_MFG_SNOOP_OUT   BIT(23)
> > -
> > -#define MT2701_TOP_AXI_PROT_EN_MM_M0           BIT(1)
> > -#define MT2701_TOP_AXI_PROT_EN_CONN_M          BIT(2)
> > -#define MT2701_TOP_AXI_PROT_EN_CONN_S          BIT(8)
> > -
> > -#define MT7622_TOP_AXI_PROT_EN_ETHSYS          (BIT(3) | BIT(17))
> > -#define MT7622_TOP_AXI_PROT_EN_HIF0            (BIT(24) | BIT(25))
> > -#define MT7622_TOP_AXI_PROT_EN_HIF1            (BIT(26) | BIT(27) | \
> > -                                                BIT(28))
> > -#define MT7622_TOP_AXI_PROT_EN_WB              (BIT(2) | BIT(6) | \
> > -                                                BIT(7) | BIT(8))
> 
> Err wait, don't you need these values in patch 04/10?
> 

Actually I already duplicated those being used into scpsys-ext.h and
then replace the header file in patch 04/10

--- a/drivers/soc/mediatek/mtk-scpsys.c
+++ b/drivers/soc/mediatek/mtk-scpsys.c
@@ -11,7 +11,7 @@ 
-#include <linux/soc/mediatek/infracfg.h>
+#include "scpsys-ext.h"

so I remove the infracfg.h directly in this patch and add those new for
MT8183 in scpsys-ext.h

> > -
> > -int mtk_infracfg_set_bus_protection(struct regmap *infracfg, u32 mask,
> > -               bool reg_update);
> > -int mtk_infracfg_clear_bus_protection(struct regmap *infracfg, u32 mask,
> > -               bool reg_update);
> > -#endif /* __SOC_MEDIATEK_INFRACFG_H */
> > --
> > 1.8.1.1.dirty

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
