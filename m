Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6808CC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Mar 2022 02:56:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XdCCsFuYobBWEfxtHAGFlzkwgL0m3UyOXqOvb/C872I=; b=ZVcwXohSFJEJdT
	ObKGbPef95ZMYOwgTb70y65Um5YYkfpWyaOP0CBivC33o9ypgar1Hh5SD9Skx7ETQnBHvAxeY8U/V
	iJSIxNvbadwliVJbui09ZINnzwluM9bQuiggDOoQMkOhG9dvAWnArBeGtVobiI266RD5U2SCzaU8f
	3FphcPeUTGOiy3+wbkQ5F6lebzpc08TN0jWQb+t0gsj6MwVg4LcvEK7Hl4ABH7nxHy57m+fx5zN1s
	GVMNGfxom6YKhYmQme1NpgionL01MH4zuY2kKG0Vs4ynAW+s1wxDAd4mjHwMVYAK+JJtZcI0c1rp6
	QVuveDhjj8vd5uYCA9VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOsgr-00EkK7-2S; Tue, 01 Mar 2022 02:56:41 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOsgf-00EkGm-IF; Tue, 01 Mar 2022 02:56:30 +0000
X-UUID: dbecc4008c48461aa904005221d91e57-20220228
X-UUID: dbecc4008c48461aa904005221d91e57-20220228
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1850485118; Mon, 28 Feb 2022 19:56:22 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 28 Feb 2022 18:56:21 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 1 Mar 2022 10:56:19 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 1 Mar 2022 10:56:19 +0800
Message-ID: <e784f9eaa2eee5542d89b2c35c4e8767946c3681.camel@mediatek.com>
Subject: Re: [2/4] dt-bindings: reset: mt8186: add toprgu reset-controller
 header file
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: Guenter Roeck <linux@roeck-us.net>, <wim@linux-watchdog.org>,
 <matthias.bgg@gmail.com>, <robh+dt@kernel.org>, <p.zabel@pengutronix.de>
CC: <runyang.chen@mediatek.com>, <linux-watchdog@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Tue, 1 Mar 2022 10:56:19 +0800
In-Reply-To: <b30fed61-9ed4-3ba2-0370-b0007a80d8e9@roeck-us.net>
References: <20220216014505.28428-1-rex-bc.chen@mediatek.com>
 <20220216014505.28428-3-rex-bc.chen@mediatek.com>
 <b30fed61-9ed4-3ba2-0370-b0007a80d8e9@roeck-us.net>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220228_185629_637025_250D598B 
X-CRM114-Status: GOOD (  16.02  )
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

Hello Guenter,

Thanks for your review.
I will do this in next version.

BRs,
Rex

On Fri, 2022-02-25 at 08:37 -0800, Guenter Roeck wrote:
> On 2/15/22 17:45, Rex-BC Chen wrote:
> > From: Runyang Chen <runyang.chen@mediatek.com>
> > 
> > Add toprgu reset-controller header file for MT8186.
> > 
> > Signed-off-by: Runyang Chen <runyang.chen@mediatek.com>
> > Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> 
> With the next patch squashed into this one:
> 
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> 
> > ---
> >   include/dt-bindings/reset/mt8186-resets.h | 33
> > +++++++++++++++++++++++
> >   1 file changed, 33 insertions(+)
> >   create mode 100644 include/dt-bindings/reset/mt8186-resets.h
> > 
> > diff --git a/include/dt-bindings/reset/mt8186-resets.h
> > b/include/dt-bindings/reset/mt8186-resets.h
> > new file mode 100644
> > index 000000000000..36e5764e2e6c
> > --- /dev/null
> > +++ b/include/dt-bindings/reset/mt8186-resets.h
> > @@ -0,0 +1,33 @@
> > +/* SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause) */
> > +/*
> > + * Copyright (c) 2022 MediaTek Inc.
> > + * Author: Runyang Chen <runyang.chen@mediatek.com>
> > + */
> > +
> > +#ifndef _DT_BINDINGS_RESET_CONTROLLER_MT8186
> > +#define _DT_BINDINGS_RESET_CONTROLLER_MT8186
> > +
> > +#define MT8186_TOPRGU_INFRA_SW_RST				0
> > +#define MT8186_TOPRGU_MM_SW_RST					
> > 1
> > +#define MT8186_TOPRGU_MFG_SW_RST				2
> > +#define MT8186_TOPRGU_VENC_SW_RST				3
> > +#define MT8186_TOPRGU_VDEC_SW_RST				4
> > +#define MT8186_TOPRGU_IMG_SW_RST				5
> > +#define MT8186_TOPRGU_DDR_SW_RST				6
> > +#define MT8186_TOPRGU_INFRA_AO_SW_RST				
> > 8
> > +#define MT8186_TOPRGU_CONNSYS_SW_RST				
> > 9
> > +#define MT8186_TOPRGU_APMIXED_SW_RST				
> > 10
> > +#define MT8186_TOPRGU_PWRAP_SW_RST				11
> > +#define MT8186_TOPRGU_CONN_MCU_SW_RST				
> > 12
> > +#define MT8186_TOPRGU_IPNNA_SW_RST				13
> > +#define MT8186_TOPRGU_WPE_SW_RST				14
> > +#define MT8186_TOPRGU_ADSP_SW_RST				15
> > +#define MT8186_TOPRGU_AUDIO_SW_RST				17
> > +#define MT8186_TOPRGU_CAM_MAIN_SW_RST				
> > 18
> > +#define MT8186_TOPRGU_CAM_RAWA_SW_RST				
> > 19
> > +#define MT8186_TOPRGU_CAM_RAWB_SW_RST				
> > 20
> > +#define MT8186_TOPRGU_IPE_SW_RST				21
> > +#define MT8186_TOPRGU_IMG2_SW_RST				22
> > +#define MT8186_TOPRGU_SW_RST_NUM				23
> > +
> > +#endif  /* _DT_BINDINGS_RESET_CONTROLLER_MT8186 */
> 
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
