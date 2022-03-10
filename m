Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF41AC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Mar 2022 09:16:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QLbOipOj8e2p/0aOobUZgpHnpBJ7K/Lolz1jKQPLao8=; b=aOLuDm6hWm8J42
	sG7VDDXu1yezPznqNfa2AIP2XxyTKmdhW2T5st6dV4esXHvsf46VDn/3WJ0rxOQRRtvifnk0U1AQP
	z23Q84R7w8wpi8lGNHWSIj6y/8AnfzYIPJt5PCHGtMTbG+T8u1d7obO+lVG8zF23rLmXswY8vnq2v
	4Th/14X1ikuu7L2eXOA1SixnVLV6aZDa8w8DCtW+KHJyKAGw8vgFePDNJOBrwnYtUOI8G7w6hguwV
	zUP8TgOtdwCVHhWiAeCtSUi+B5dXLsv+gs3JFKDLhVWW6OqIb43Cp+CvegxzL5e+IjQKwTfPgtyPy
	cjBQLDgZcTmor6C90DaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nSEtt-00C5MG-2z; Thu, 10 Mar 2022 09:16:01 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nSEtf-00C5Gk-B7; Thu, 10 Mar 2022 09:15:48 +0000
X-UUID: faaa1b1f7a224082b1bf1000e2d82124-20220310
X-UUID: faaa1b1f7a224082b1bf1000e2d82124-20220310
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1058209516; Thu, 10 Mar 2022 02:15:43 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 10 Mar 2022 01:15:42 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 10 Mar 2022 17:15:40 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 10 Mar 2022 17:15:40 +0800
Message-ID: <0a05150360b7d5ec075396820ee7339c49fb5367.camel@mediatek.com>
Subject: Re: [RESEND V2 0/3] Add watchdog support for MT8186 SoC
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: <wim@linux-watchdog.org>, <linux@roeck-us.net>, <matthias.bgg@gmail.com>, 
 <robh+dt@kernel.org>, <p.zabel@pengutronix.de>
CC: <runyang.chen@mediatek.com>, <linux-watchdog@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Thu, 10 Mar 2022 17:15:40 +0800
In-Reply-To: <b2195d5a5d9e7c18eb5e2269a04cb9b8ce431d90.camel@mediatek.com>
References: <20220301054405.25021-1-rex-bc.chen@mediatek.com>
 <b2195d5a5d9e7c18eb5e2269a04cb9b8ce431d90.camel@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220310_011547_420343_C230A6AA 
X-CRM114-Status: GOOD (  16.07  )
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

On Thu, 2022-03-10 at 16:34 +0800, Rex-BC Chen wrote:
> On Tue, 2022-03-01 at 13:44 +0800, Rex-BC Chen wrote:
> > resend v2:
> > 1. Fix topic to V2.
> > 
> > v2:
> > 1. Squash [1] into [2] in v1.
> > 2. Add tags of acked-by and reviewed-by.
> > 
> > [1]: [3/4] dt-bindings: reset: mt8186: add DSI reset bit for MMSYS
> > [2]: [2/4] dt-bindings: reset: mt8186: add toprgu reset-controller
> > header file
> > 
> > v1:
> > 1. Add mt8186-resets.h to define definition of reset bits.
> > 2. Add wdt compatible for MT8186.
> > 
> > Rex-BC Chen (1):
> >   dt-bindings: watchdog: Add compatible for MediaTek MT8186
> > 
> > Runyang Chen (2):
> >   dt-bindings: reset: mt8186: add reset-controller header file
> >   watchdog: mediatek: mt8186: add wdt support
> > 
> >  .../devicetree/bindings/watchdog/mtk-wdt.txt  |  1 +
> >  drivers/watchdog/mtk_wdt.c                    |  6 ++++
> >  include/dt-bindings/reset/mt8186-resets.h     | 36
> > +++++++++++++++++++
> >  3 files changed, 43 insertions(+)
> >  create mode 100644 include/dt-bindings/reset/mt8186-resets.h
> > 
> 
> Hello Guenter,
> 
> All patches are reviewed-by and acked-by.
> Do you have any suggestion for this series?
> 
> Thanks!
> 
> BRs,
> Rex
> 
Hello Guenter,

I am sorry that I did not notice this series is in watchdog-next.
Thanks for accepting this series!

BRs,
Rex


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
