Return-Path: <SRS0=lKUU=7K=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E7BBC433E1
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 May 2020 12:09:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 12CFB216C4
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 May 2020 12:09:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qcatamFf";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="aYxS9JJ9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 12CFB216C4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l0EeKwx4XKac33GtHm2+OgPbTqpPMr3Bz5lXwo47kXg=; b=qcatamFfZd/TQv
	zfUxjK5bd3NRQRNBNP+RGroRlXvOQYlC6vjb7pVOn1tgbQxPBsj4IHP3t8nOaeUA5ZV8N7IRsgnzs
	9M3+GJwWcHu5/x3Vi/2qXekJKRX20/XwlY34W47EXqEzEJ3B7V3t8CXh0SNyTKppzKFqWVX0es2uU
	G4+0XBY/riruXaR/VBV0GLe4edjEgGrQS3pRlz4n051+JaRgKQwsY91wD/nPPEHc/MGp8XSMWFpgg
	k0RyKyhhH8ZX8D36cefNtGLRUXw2X44t8/VkjJisHcFmhkZ6Ws4HWRoNWGPBv8OGhelI7MSkQ8joN
	6JnBFFfOo7Edzf3bZwcw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jeHLg-0003cH-Q5; Thu, 28 May 2020 12:09:24 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jeHLZ-0003U8-C6
 for linux-mediatek@lists.infradead.org; Thu, 28 May 2020 12:09:20 +0000
X-UUID: ced1af9fda4c4432822c87b2c46c00d6-20200528
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=yhOEVU3OR0lZaZurEspqANd7eY+KkUT5sYWGMaX8JUQ=; 
 b=aYxS9JJ9gsT9F6Vb73SdwydkmdAKHPBVEQblcWh3hNn7FJkxjwnXoiM/0X63XrQx1PrzBjLC8q+u0pS8V18Xcm8rhW1fA+gTju9RSF8DEFPTOj4qw0rwf6jzCojQweTvjLaZOQdqNMZE6k6GAVJikBFAdM1Rm65tDIe4tJvTpro=;
X-UUID: ced1af9fda4c4432822c87b2c46c00d6-20200528
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <hanks.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1410401379; Thu, 28 May 2020 04:09:10 -0800
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 28 May 2020 04:59:10 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 28 May 2020 19:59:03 +0800
Received: from [172.21.77.33] (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 28 May 2020 19:59:03 +0800
Message-ID: <1590667145.4266.6.camel@mtkswgap22>
Subject: Re: [PATCH v5 2/6] pinctrl: mediatek: update pinmux definitions for
 mt6779
From: Hanks Chen <hanks.chen@mediatek.com>
To: Sean Wang <sean.wang@kernel.org>
Date: Thu, 28 May 2020 19:59:05 +0800
In-Reply-To: <CAGp9LzoULALLvO+x2TnO=K=pSD05bJFowB-usAcrpz0ddEN+Ug@mail.gmail.com>
References: <1585128694-13881-1-git-send-email-hanks.chen@mediatek.com>
 <1585128694-13881-3-git-send-email-hanks.chen@mediatek.com>
 <CAGp9LzoULALLvO+x2TnO=K=pSD05bJFowB-usAcrpz0ddEN+Ug@mail.gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200528_050917_436984_B8277F6A 
X-CRM114-Status: GOOD (  13.80  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 wsd_upstream@mediatek.com, Andy Teng <andy.teng@mediatek.com>,
 Linus Walleij <linus.walleij@linaro.org>, lkml <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Mars Cheng <mars.cheng@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 2020-04-02 at 14:54 -0700, Sean Wang wrote:
> Hi, Hanks
> 
> Just a few nitpicks and then Acked-by: Sean Wang <sean.wang@kernel.org>
> 
> On Wed, Mar 25, 2020 at 2:31 AM Hanks Chen <hanks.chen@mediatek.com> wrote:
> >
> > Add devicetree bindings for Mediatek mt6779 SoC Pin Controller.
> >
> > Signed-off-by: Hanks Chen <hanks.chen@mediatek.com>
> > Signed-off-by: Mars Cheng <mars.cheng@mediatek.com>
> > Signed-off-by: Andy Teng <andy.teng@mediatek.com>
> > ---
> >  include/dt-bindings/pinctrl/mt6779-pinfunc.h | 1242 ++++++++++++++++++++++++++
> >  1 file changed, 1242 insertions(+)
> >  create mode 100644 include/dt-bindings/pinctrl/mt6779-pinfunc.h
> >
> > diff --git a/include/dt-bindings/pinctrl/mt6779-pinfunc.h b/include/dt-bindings/pinctrl/mt6779-pinfunc.h
> > new file mode 100644
> > index 0000000..4698d2f
> > --- /dev/null
> > +++ b/include/dt-bindings/pinctrl/mt6779-pinfunc.h
> > @@ -0,0 +1,1242 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +/*
> > + * Copyright (C) 2019 MediaTek Inc.
> > + * Author: Andy Teng <andy.teng@mediatek.com>
> > + *
> > + */
> > +
> > +#ifndef __MT6779_PINFUNC_H
> > +#define __MT6779_PINFUNC_H
> > +
> > +#include "mt65xx.h"
> 
> Use the standard include path instead:  #include <dt-bindings/pinctrl/mt65xx.h>
> 
Got it, I'll revise it in next version
Thanks for your comment.

> > +
> <snip>
> > +
> > +#define PINMUX_GPIO209__FUNC_GPIO209 (MTK_PIN_NO(209) | 0)
> > +
> > +#endif /* __MT6779-PINFUNC_H */
>                    __MT6779_PINFUNC_H
> > --
> > 1.7.9.5

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
