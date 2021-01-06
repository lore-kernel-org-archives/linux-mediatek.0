Return-Path: <SRS0=NOVl=GJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE083C433DB
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Jan 2021 07:25:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 10D4C23104
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Jan 2021 07:25:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 10D4C23104
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=HhrhyNMNfj8ve+fXA7ZPHatDr9Byq1C2EuBR5g6N3wo=; b=ClUIfOhzVpnHZcAC696UIEiKf
	IAyUJNBy4kcmXhRuKO+eB+AFbYXFX2ORTHhP1vPKowchsq/8qQZJmTKnTW7lw9QCe0nywGU9voC/H
	hVVxybiaScOAHN60lBaDJTGELwo1EJtiB3AviCpDOb6nXQO18h95E07G1RBcVh5YQMi3/dFMvwR76
	17Lzqdh8qRqHaW7DT5IjfVy6gkpMLOvLnZk70g+gcXHuW6MMciVvIXE0WllD5SNM6zySJ2sZIPisL
	Jzx1Q9hTFqembnyUKhXjazjKnJu+NzdmmM6mPmPlQ43CQx4wUQDmmR8nV7cWzSu9deNDp/dYW0DHq
	mTcXGTm1A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kx3C8-00046w-RF; Wed, 06 Jan 2021 07:25:24 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kx3C3-000462-75; Wed, 06 Jan 2021 07:25:20 +0000
X-UUID: 1a10303b7f464bf0b2408185792a3bb4-20210105
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=HyqKpVXDo0OMnB/olbg+0+Y5A4xW+EaLyHKoHw4JKno=; 
 b=pGZbzjxeiqhUzPcr924WBMnUbnnlXegXLiLmPT02/QVAiVoUXZzw5xim71bIP/kQAMehfEb7ub60MJuhMQZuQGNG5nmdeqUuUDDe2LHlfidt+3g8MKO8yIHjOWZPmj5y4JoUhj4TQ3elQodk4S8CMdNkjzk3U9lagVfgTbUGz0M=;
X-UUID: 1a10303b7f464bf0b2408185792a3bb4-20210105
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <henryc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2016947218; Tue, 05 Jan 2021 23:25:06 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 5 Jan 2021 23:25:05 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 6 Jan 2021 15:25:02 +0800
Received: from [172.21.77.4] (172.21.77.4) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 6 Jan 2021 15:25:02 +0800
Message-ID: <1609917902.23066.1.camel@mtksdaap41>
Subject: Re: [PATCH V6 07/13] dt-bindings: interconnect: add MT6873
 interconnect dt-bindings
From: Henry Chen <henryc.chen@mediatek.com>
To: Georgi Djakov <georgi.djakov@linaro.org>
Date: Wed, 6 Jan 2021 15:25:02 +0800
In-Reply-To: <f8951237-e236-aa99-5dbb-e92415752aa8@linaro.org>
References: <1608790134-27425-1-git-send-email-henryc.chen@mediatek.com>
 <1608790134-27425-8-git-send-email-henryc.chen@mediatek.com>
 <f8951237-e236-aa99-5dbb-e92415752aa8@linaro.org>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 99987DFF16B3EE957DF2E9DDA5039E79F3346D89A75C76A762E9E51AD16E43D02000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210106_022519_488706_D7B61988 
X-CRM114-Status: GOOD (  18.80  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Nicolas Boichat <drinkcat@google.com>,
 James Liao <jamesjj.liao@mediatek.com>, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Stephen Boyd <swboyd@chromium.org>, Fan Chen <fan.chen@mediatek.com>,
 devicetree@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Ryan Case <ryandcase@chromium.org>, Arvin Wang <arvin.wang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 2021-01-04 at 20:34 +0200, Georgi Djakov wrote:
> On 12/24/20 08:08, Henry Chen wrote:
> > From: "henryc.chen" <henryc.chen@mediatek.com>
> > 
> > Add interconnect provider dt-bindings for MT6873.
> > 
> > Signed-off-by: Henry Chen <henryc.chen@mediatek.com>
> 
> checkpatch complains:
> 
> From:/Signed-off-by: email name mismatch:
> 'From: "henryc.chen" <henryc.chen@mediatek.com>' != 'Signed-off-by: Henry Chen 
> <henryc.chen@mediatek.com>'
> 
> Thanks,
> Georgi
It will be fixed in the next version.

Thanks,
Henry

> 
> > ---
> >   include/dt-bindings/interconnect/mtk,mt6873-emi.h | 41 +++++++++++++++++++++++
> >   1 file changed, 41 insertions(+)
> >   create mode 100644 include/dt-bindings/interconnect/mtk,mt6873-emi.h
> > 
> > diff --git a/include/dt-bindings/interconnect/mtk,mt6873-emi.h b/include/dt-bindings/interconnect/mtk,mt6873-emi.h
> > new file mode 100644
> > index 0000000..7a0bbfb
> > --- /dev/null
> > +++ b/include/dt-bindings/interconnect/mtk,mt6873-emi.h
> > @@ -0,0 +1,41 @@
> > +/* SPDX-License-Identifier: GPL-2.0
> > + *
> > + * Copyright (c) 2020 MediaTek Inc.
> > + */
> > +
> > +#ifndef __DT_BINDINGS_INTERCONNECT_MTK_MT6873_EMI_H
> > +#define __DT_BINDINGS_INTERCONNECT_MTK_MT6873_EMI_H
> > +
> > +#define MT6873_SLAVE_DDR_EMI		0
> > +#define MT6873_MASTER_MCUSYS		1
> > +#define MT6873_MASTER_GPUSYS		2
> > +#define MT6873_MASTER_MMSYS		3
> > +#define MT6873_MASTER_MM_VPU		4
> > +#define MT6873_MASTER_MM_DISP		5
> > +#define MT6873_MASTER_MM_VDEC		6
> > +#define MT6873_MASTER_MM_VENC		7
> > +#define MT6873_MASTER_MM_CAM		8
> > +#define MT6873_MASTER_MM_IMG		9
> > +#define MT6873_MASTER_MM_MDP		10
> > +#define MT6873_MASTER_VPUSYS		11
> > +#define MT6873_MASTER_VPU_0		12
> > +#define MT6873_MASTER_VPU_1		13
> > +#define MT6873_MASTER_MDLASYS		14
> > +#define MT6873_MASTER_MDLA_0		15
> > +#define MT6873_MASTER_UFS		16
> > +#define MT6873_MASTER_PCIE		17
> > +#define MT6873_MASTER_USB		18
> > +#define MT6873_MASTER_DBGIF		19
> > +#define MT6873_SLAVE_HRT_DDR_EMI	20
> > +#define MT6873_MASTER_HRT_MMSYS		21
> > +#define MT6873_MASTER_HRT_MM_DISP	22
> > +#define MT6873_MASTER_HRT_MM_VDEC	23
> > +#define MT6873_MASTER_HRT_MM_VENC	24
> > +#define MT6873_MASTER_HRT_MM_CAM	25
> > +#define MT6873_MASTER_HRT_MM_IMG	26
> > +#define MT6873_MASTER_HRT_MM_MDP	27
> > +#define MT6873_MASTER_HRT_DBGIF		28
> > +#define MT6873_MASTER_WIFI		29
> > +#define MT6873_MASTER_BT		30
> > +#define MT6873_MASTER_NETSYS		31
> > +#endif
> > 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
