Return-Path: <SRS0=6pE3=3C=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00905C33CA8
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jan 2020 09:23:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7FA7E207FF
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jan 2020 09:23:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HnA85W8u";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="ezmMER8T"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7FA7E207FF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eHFhLhESR21azjvTLCsBpSLdwtWKl3XtgI6LPGDwWYc=; b=HnA85W8uAHlBj5
	cyV8Yz4tAK+7JcQuk1XV+UQqTYtiWzxwMpz00xGwS23/cnq7dvjV3po4j5E23VRx2+6nSMad/8VYE
	FqOwacFdLv5L0V7rFTCuGTy0FCfQhjbWd/TdO4Qm82x8DwbElZ5It8KSOq+eHDUKOXjpkCYC8+hZe
	d4EtIaI0Kv4shMhWtWhwhrWsESSHxQlRjEZH3AgwLb6SD/XH09OjbFCgezY0K/cHUow1SliV4vNZg
	7kFJ42coDaZ1iv4GHAV/HVTWWZEraTcR+cM1w1lHlJHAbUMG28gW4EnzDa4cKCVrA93XIPnNLaCT0
	AGMtCVnqBXdxd0krbSTw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iqvwQ-000631-QN; Mon, 13 Jan 2020 09:23:22 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iqvwD-0005gw-PU; Mon, 13 Jan 2020 09:23:11 +0000
X-UUID: 7491c760f3df40eb8c8dd25af7d99857-20200113
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=03EqN3IpDnYeVpvM1ObMsu1BpXwziE5X5TdFsnPY33Q=; 
 b=ezmMER8TvMpJHbek6FFuMM7i8A56A4U3tGXsBA/IV8Qjj+SvxHtmgQXNDolhqm9tkt2tOLzSdLGDoITgvHjubptDC9jzT3kkbHhZtWa/nuGrBAzPB14xN2k5DDX/kS6Nv8cApHTZvqwQCEDjlkcqWjL4Y/yGeJzKOr4TOlMZFH8=;
X-UUID: 7491c760f3df40eb8c8dd25af7d99857-20200113
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yong.liang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 778286375; Mon, 13 Jan 2020 01:23:01 -0800
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 13 Jan 2020 01:13:42 -0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N2.mediatek.inc
 (172.27.4.87) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Mon, 13 Jan 2020 17:11:42 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Mon, 13 Jan 2020 17:12:16 +0800
Message-ID: <1578906770.20923.22.camel@mhfsdcap03>
Subject: Re: [PATCH v11 1/3] dt-bindings: mediatek: mt8183: Add #reset-cells
From: Yong Liang <yong.liang@mediatek.com>
To: Nicolas Boichat <drinkcat@chromium.org>
Date: Mon, 13 Jan 2020 17:12:50 +0800
In-Reply-To: <CANMq1KBNuJDEn57d0ysc2XG0ezWEvJ2Pm88YihDiSZJ=-E=W9g@mail.gmail.com>
References: <1578639862-14480-1-git-send-email-jiaxin.yu@mediatek.com>
 <1578639862-14480-2-git-send-email-jiaxin.yu@mediatek.com>
 <CANMq1KBNuJDEn57d0ysc2XG0ezWEvJ2Pm88YihDiSZJ=-E=W9g@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: DF2A40E9DBFE98B116BEB7409F16A843F2BF153D6F6462540D4A00352B2557502000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200113_012309_837486_B8B7A10D 
X-CRM114-Status: GOOD (  20.22  )
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
Cc: Devicetree List <devicetree@vger.kernel.org>,
 Freddy Hsin =?UTF-8?Q?=28=E8=BE=9B=E6=81=92=E8=B1=90=29?=
 <Freddy.Hsin@mediatek.com>,
 "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, lkml <linux-kernel@vger.kernel.org>,
 Jiaxin Yu =?UTF-8?Q?=28=E4=BF=9E=E5=AE=B6=E9=91=AB=29?=
 <Jiaxin.Yu@mediatek.com>, "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Yingjoe Chen =?UTF-8?Q?=28=E9=99=B3=E8=8B=B1=E6=B4=B2=29?=
 <Yingjoe.Chen@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Chang-An Chen =?UTF-8?Q?=28=E9=99=B3=E6=98=B6=E5=AE=89=29?=
 <Chang-An.Chen@mediatek.com>,
 "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
 "linux@roeck-us.net" <linux@roeck-us.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 2020-01-13 at 14:10 +0800, Nicolas Boichat wrote:
> Jiaxin,
> 
> On Fri, Jan 10, 2020 at 3:04 PM Jiaxin Yu <jiaxin.yu@mediatek.com> wrote:
> >
> > Add #reset-cells property and update example
> >
> > Signed-off-by: yong.liang <yong.liang@mediatek.com>
> > Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
> > Reviewed-by: Yingjoe Chen <yingjoe.chen@mediatek.com>
> > Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
> > Reviewed-by: Rob Herring <robh@kernel.org>
> > Reviewed-by: Guenter Roeck <groeck7@gmail.com>
> 
> From previous feedback
> (https://patchwork.kernel.org/patch/11318687/#23086211), it seems like
> we lost track of which exact version had the Reviewed-By, so I'd just
> drop all those tags and let people review again.
> 
  Need I do someting?
> > ---
> 
> It would have been nice to mention that this patch depends on
> https://patchwork.kernel.org/patch/11311241/ (as your example makes
> use of it below).

  Can I drop the mtk-wdt.txt of
https://patchwork.kernel.org/patch/11311241/?
  And I want add 8183 in mtk-wdt.txt in this patch.
> >  .../devicetree/bindings/watchdog/mtk-wdt.txt  | 10 ++++++---
> >  .../reset-controller/mt2712-resets.h          | 22 +++++++++++++++++++
> >  .../reset-controller/mt8183-resets.h          | 17 ++++++++++++++
> >  3 files changed, 46 insertions(+), 3 deletions(-)
> >  create mode 100644 include/dt-bindings/reset-controller/mt2712-resets.h
> >
> > diff --git a/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt b/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
> > index 92181b648f52..5a76ac262f8d 100644
> > --- a/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
> > +++ b/Documentation/devicetree/bindings/watchdog/mtk-wdt.txt
> > @@ -4,6 +4,7 @@ Required properties:
> >
> >  - compatible should contain:
> >         "mediatek,mt2701-wdt", "mediatek,mt6589-wdt": for MT2701
> > +       "mediatek,mt2712-wdt", "mediatek,mt6589-wdt": for MT2712
> 
> Please separate this as another patch.
  So I can send mtk-wdt.c(MT2712) and mt2712-resets.h in one patch and
send mtk-wdt.c(MT8183) and mt8183-resets.h in another patch?
> 
> >         "mediatek,mt6589-wdt": for MT6589
> >         "mediatek,mt6797-wdt", "mediatek,mt6589-wdt": for MT6797
> >         "mediatek,mt7622-wdt", "mediatek,mt6589-wdt": for MT7622
> > @@ -14,11 +15,14 @@ Required properties:
> >
> >  Optional properties:
> >  - timeout-sec: contains the watchdog timeout in seconds.
> > +- #reset-cells: Should be 1.
> >
> >  Example:
> >
> > -wdt: watchdog@10000000 {
> > -       compatible = "mediatek,mt6589-wdt";
> > -       reg = <0x10000000 0x18>;
> > +watchdog: watchdog@10007000 {
> > +       compatible = "mediatek,mt8183-wdt",
> > +                    "mediatek,mt6589-wdt";
> > +       reg = <0 0x10007000 0 0x100>;
> >         timeout-sec = <10>;
> > +       #reset-cells = <1>;
> >  };
> > diff --git a/include/dt-bindings/reset-controller/mt2712-resets.h b/include/dt-bindings/reset-controller/mt2712-resets.h
> > new file mode 100644
> > index 000000000000..9e7ee762f076
> > --- /dev/null
> > +++ b/include/dt-bindings/reset-controller/mt2712-resets.h
> > @@ -0,0 +1,22 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +/*
> > + * Copyright (c) 2019 MediaTek Inc.
> > + * Author: Yong Liang <yong.liang@mediatek.com>
> > + */
> > +
> > +#ifndef _DT_BINDINGS_RESET_CONTROLLER_MT2712
> > +#define _DT_BINDINGS_RESET_CONTROLLER_MT2712
> > +
> > +#define MT2712_TOPRGU_INFRA_SW_RST                             0
> > +#define MT2712_TOPRGU_MM_SW_RST                                        1
> > +#define MT2712_TOPRGU_MFG_SW_RST                               2
> > +#define MT2712_TOPRGU_VENC_SW_RST                              3
> > +#define MT2712_TOPRGU_VDEC_SW_RST                              4
> > +#define MT2712_TOPRGU_IMG_SW_RST                               5
> > +#define MT2712_TOPRGU_INFRA_AO_SW_RST                          8
> > +#define MT2712_TOPRGU_USB_SW_RST                               9
> > +#define MT2712_TOPRGU_APMIXED_SW_RST                           10
> > +
> > +#define MT2712_TOPRGU_SW_RST_NUM                               11
> > +
> > +#endif  /* _DT_BINDINGS_RESET_CONTROLLER_MT2712 */
> > diff --git a/include/dt-bindings/reset-controller/mt8183-resets.h b/include/dt-bindings/reset-controller/mt8183-resets.h
> > index 8804e34ebdd4..a1bbd41e0d12 100644
> > --- a/include/dt-bindings/reset-controller/mt8183-resets.h
> > +++ b/include/dt-bindings/reset-controller/mt8183-resets.h
> > @@ -78,4 +78,21 @@
> >  #define MT8183_INFRACFG_AO_I2C7_SW_RST                         126
> >  #define MT8183_INFRACFG_AO_I2C8_SW_RST                         127
> >
> > +#define MT8183_INFRACFG_SW_RST_NUM                             128
> > +
> > +#define MT8183_TOPRGU_MM_SW_RST                                        1
> > +#define MT8183_TOPRGU_MFG_SW_RST                               2
> > +#define MT8183_TOPRGU_VENC_SW_RST                              3
> > +#define MT8183_TOPRGU_VDEC_SW_RST                              4
> > +#define MT8183_TOPRGU_IMG_SW_RST                               5
> > +#define MT8183_TOPRGU_MD_SW_RST                                        7
> > +#define MT8183_TOPRGU_CONN_SW_RST                              9
> > +#define MT8183_TOPRGU_CONN_MCU_SW_RST                          12
> > +#define MT8183_TOPRGU_IPU0_SW_RST                              14
> > +#define MT8183_TOPRGU_IPU1_SW_RST                              15
> > +#define MT8183_TOPRGU_AUDIO_SW_RST                             17
> > +#define MT8183_TOPRGU_CAMSYS_SW_RST                            18
> > +
> > +#define MT8183_TOPRGU_SW_RST_NUM                               19
> > +
> >  #endif  /* _DT_BINDINGS_RESET_CONTROLLER_MT8183 */
> > --
> > 2.18.0

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
