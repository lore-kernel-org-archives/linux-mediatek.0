Return-Path: <SRS0=8MWw=JJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70AFDC433ED
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Apr 2021 07:19:51 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 05F586121D
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Apr 2021 07:19:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 05F586121D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:CC:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=pbQyKH+yDaW4JndB6ogA5q1LFwb1CVDitZTh5aOwBQo=; b=WSO+GwGx+8cV/L5nuKM5Da7Lk
	PP2BMW+UI0ivAc3Xu+Kw20W0dcZak+Kd7uTquUPhteuiQB6NnpDAahFo3dilzrdCd2PttXbUrbkbZ
	pcMsbucmAH4wMLiN6PhJE+t+ELUgJYX9uVm2zD4Z8w1/W32AZCZO3cvRXpruXVprAMee8VccaArpZ
	qpqb60OEO8mU9VZe1A30oUnyT2wA4McEpSIyrP/VlfdeYSLkI1aW7iiY2p6a5fpUo49kpSwlCBYct
	LjLf9GocK4yIKON/KEICDXnR8JkSJkRWP0IYgh5eSC5FLxdY8DNapAGslvFCbhqtf6r5095lPQZda
	b4UCpGN4A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lVqrC-005x6D-EW; Mon, 12 Apr 2021 07:19:39 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVqr7-005x3A-IY; Mon, 12 Apr 2021 07:19:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=IhR0w7fkxv9QLOyDCj64kNBA7EE1dIlzyNRNY8w1a0w=; b=1o/63E6Fgcf/lVQYbBizdimQld
 xcOqfXsgKt90PW1JzAotQdiBQ1ae0giury8/ylQkJTZRuLpnTt7QKPYWX9ppCqICM8pgT+X58UWFp
 14zBzlxCGfBPZsWqsxlxZGsNSECQ8t7z4vNUGwwNHdWZE9t3VimhV9YvG2RWPnX9TAMJX6wrHZS3M
 RupuIy5ZBBObHDB2H6I9BRl+wmvYdIigEsZ5HSc2kFAWGVRBF1bMXJ1ESXvCIDNH1EagbCgy9TLqf
 GHIPMxX1yMoz5oUp1iEbHPRyrhaa52e+n26U7XQfjwNMqrm4PXx2OQY3nmmELf6Q9647grn/S0dTz
 /zIRqmXw==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVqr4-005vQf-7N; Mon, 12 Apr 2021 07:19:31 +0000
X-UUID: 41d947017d1c40b2bd0888a6c4ae9d25-20210412
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=IhR0w7fkxv9QLOyDCj64kNBA7EE1dIlzyNRNY8w1a0w=; 
 b=dLPWpx6wT8oLrLoarFUAoruHTv5L9gWxemzw1WyTYeW1mre4BLYBfXZoXcmtjRnWZQsrB5PohkfBzwMvAFkb978RAluoyVz9Ua2RPh/v7Y7vczuAwL3lgNmSAkyKpYC5Pu6sZ6MFmYMrSqJxNzCotbQ60hSl997iWCvbSh2UbL4=;
X-UUID: 41d947017d1c40b2bd0888a6c4ae9d25-20210412
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <flora.fu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 797135449; Mon, 12 Apr 2021 00:19:29 -0700
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 12 Apr 2021 00:19:27 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 12 Apr 2021 15:19:25 +0800
Received: from [172.21.84.99] (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 12 Apr 2021 15:19:25 +0800
Message-ID: <1618211965.25062.34.camel@mtksdccf07>
Subject: Re: [PATCH 3/8] dt-bindings: apu: Add MT8192 APU power domain
From: Flora Fu <flora.fu@mediatek.com>
To: Rob Herring <robh@kernel.org>
CC: Matthias Brugger <matthias.bgg@gmail.com>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Pi-Cheng Chen
 <pi-cheng.chen@mediatek.com>, Chiawen Lee <chiawen.lee@mediatek.com>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-clk@vger.kernel.org>, Flora Fu
 <flora.fu@mediatek.com>
Date: Mon, 12 Apr 2021 15:19:25 +0800
In-Reply-To: <20210409182338.GA3895583@robh.at.kernel.org>
References: <1617766086-5502-1-git-send-email-flora.fu@mediatek.com>
 <1617766086-5502-4-git-send-email-flora.fu@mediatek.com>
 <20210409182338.GA3895583@robh.at.kernel.org>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: E6D439E09D1D32AB80FED7FFF7DDF6F5225F21D18AC1F0D6CB82EE2986E5CDF52000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210412_001930_289933_640D87D5 
X-CRM114-Status: GOOD (  20.47  )
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

Hi, Rob,

In mt8192 hardware, we only control top power domain in kernel.
It is unnecessary to create a specific header just for such purpose. 
I will update the patch in the next version.
Thanks for your review.

Thanks,
Flora


On Fri, 2021-04-09 at 13:23 -0500, Rob Herring wrote:
> On Wed, Apr 07, 2021 at 11:28:01AM +0800, Flora Fu wrote:
> > Create MT8192 APU power domain bindings.
> > Add top power domain id.
> > 
> > Signed-off-by: Flora Fu <flora.fu@mediatek.com>
> > ---
> >  include/dt-bindings/power/mt8192-apu-power.h | 11 +++++++++++
> >  1 file changed, 11 insertions(+)
> >  create mode 100644 include/dt-bindings/power/mt8192-apu-power.h
> > 
> > diff --git a/include/dt-bindings/power/mt8192-apu-power.h b/include/dt-bindings/power/mt8192-apu-power.h
> > new file mode 100644
> > index 000000000000..b821bd4811a6
> > --- /dev/null
> > +++ b/include/dt-bindings/power/mt8192-apu-power.h
> > @@ -0,0 +1,11 @@
> > +/* SPDX-License-Identifier: GPL-2.0
> > + *
> > + * Copyright (c) 2021 MediaTek Inc.
> > + */
> > +
> > +#ifndef _DT_BINDINGS_POWER_MT8192_APU_POWER_H
> > +#define _DT_BINDINGS_POWER_MT8192_APU_POWER_H
> > +
> > +#define MT8192_POWER_DOMAIN_APUSYS_TOP	0
> 
> Really, you don't know what the other power domains are? Please make 
> this as complete as possible. These headers create a merge mess.
> 
> Rob

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
