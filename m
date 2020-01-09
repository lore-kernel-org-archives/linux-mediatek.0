Return-Path: <SRS0=DZB5=26=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 755A6C33C9E
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Jan 2020 03:10:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 481E02067D
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Jan 2020 03:10:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KJfFJZch";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="BOV8vx+R"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 481E02067D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tC+x3gB6CPZfq5KF4gPBIZoZlrcvC9tr7dJlrA6y+X0=; b=KJfFJZchI40RGY
	VCTF9cPFvnu64vpKxLDCdnhu09M2QXVSP2Qk/v5XA5mXTJRDak6PTjhaVnKXxFNza8fwSPHuFxEyC
	Otzym7fW0BIT8/7WYLXdVghVICk/lZPysFGDNgXXSztRcowy/5GKp8GmSgik77v+ghTcEu6Dd09jx
	ed+RsnrN08V5uzfpgL+Sm8cHmXH04zkk6OomvCO9LHxR4dEbxPUrtU6hrCXfFWO9FcbL4eh7r+FQk
	6oO9e4guGu1Mi/a1pnNY/RXEVoaovncxDr3fUNRFVcS0qc4UXdtabXo6VHcUxGcVkWvuj3kREcK1D
	GadT8p/fvyAazK4V2mSg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ipODJ-00080N-PT; Thu, 09 Jan 2020 03:10:25 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ipOD8-0007rO-GY; Thu, 09 Jan 2020 03:10:17 +0000
X-UUID: 4076c10952db473b8459e5efa70c8246-20200108
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=CvLcLmQtEQDCFrVxh2k8LuEaR4ksyAkc5R169z2PTA0=; 
 b=BOV8vx+ReKxBKjksHc50rHJ2C95agoVwYmtbD9qjoMKD1CokJ5KlNSl75Ce39DJGo4HHnk3CwigmY5LyvtpHaBbEKm8ViHR+laYJGY/QB9f4RcBF6FtB2Iqnebtpc0BPZyKOW7qu2Tpy7iRlBTltzpmcg+GuE1VZOW9VMiBBqk4=;
X-UUID: 4076c10952db473b8459e5efa70c8246-20200108
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yong.liang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 219648473; Wed, 08 Jan 2020 19:10:10 -0800
Received: from MTKMBS31DR.mediatek.inc (172.27.6.102) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 8 Jan 2020 19:10:45 -0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31DR.mediatek.inc
 (172.27.6.102) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Thu, 9 Jan 2020 11:08:18 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 9 Jan 2020 11:10:21 +0800
Message-ID: <1578539400.20923.10.camel@mhfsdcap03>
Subject: Re: [PATCH v10 1/2] dt-bindings: mediatek: mt8183: Add #reset-cells
From: Yong Liang <yong.liang@mediatek.com>
To: Nicolas Boichat <drinkcat@chromium.org>
Date: Thu, 9 Jan 2020 11:10:00 +0800
In-Reply-To: <CANMq1KCrDX+svufQEeqHYgAFmFaBS0paEz0EBBte73ehA5PiGw@mail.gmail.com>
References: <1578280296-18946-1-git-send-email-jiaxin.yu@mediatek.com>
 <1578280296-18946-2-git-send-email-jiaxin.yu@mediatek.com>
 <CANMq1KCrDX+svufQEeqHYgAFmFaBS0paEz0EBBte73ehA5PiGw@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: D25EFC5CE1DF3AC4CFAAAEB2CCCF1058B998E9A6793A7E0B87C17B3A807A55C52000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200108_191014_561908_2543C45D 
X-CRM114-Status: GOOD (  18.02  )
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

On Wed, 2020-01-08 at 17:23 +0800, Nicolas Boichat wrote:
> On Mon, Jan 6, 2020 at 11:11 AM Jiaxin Yu <jiaxin.yu@mediatek.com> wrote:
> >
> > Add #reset-cells property and update example
> >
> > Signed-off-by: yong.liang <yong.liang@mediatek.com>
> > Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
> > Reviewed-by: Yingjoe Chen <yingjoe.chen@mediatek.com>
> > Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
> > ---
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
> Doesn't look related?
  We prefer to send mt2712 and mt8183 together.
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
> 
> Well mt8183-wdt compatible is not yet upstream, do you want to work
> with Yong Liang to send both these bindings in the same series? (you
> can add mt2712 in the same patch as mt8183 binding maybe?)

  We prefer to send mt2712 and mt8183 together. And we want to send this
patch priority.

  Yong.Liang
> 
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
