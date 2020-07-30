Return-Path: <SRS0=dQnm=BJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B643C433E0
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Jul 2020 13:15:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C75E52074B
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Jul 2020 13:15:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qVjvVO9G";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="PgrmgBWT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C75E52074B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+B7TLrkG+LClHl4Y1OtoCwgT/GmiVrDXlB1oor9DoHU=; b=qVjvVO9GzdiOPqQa5n++l4hJv
	A8QAlmr8ZZ9Frsp4keWdX+qNwN8+2iYzQ6Y4aA99sm7gM9G7cu7qI8f/OowKMS7NXDNiYuOjbnsKs
	27XuSOZwf3KwgZ0e305+FtBn7DPmh71iXoa15vU6VUrQeIOD9GS5UwK/dCfehSYtsflPX6vzoV2KM
	ankZ3SyPtFBFgcoMVU9p59YaV3+Zf78ouXnqZ7ylVeopeFIrdMrUxO6/+TGxGlxJxudgOjnZPQM4d
	puLe8CV1dua5jCLAD8JLG9rKxL3cMM0pxXr94TpcbT/8QOUCTsPvsmjc4Lc1Mg8O0Dn/rC7zMchbx
	bmjiMX+xg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k18OZ-0001NB-TZ; Thu, 30 Jul 2020 13:14:51 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k18OV-0001Kw-Hs; Thu, 30 Jul 2020 13:14:50 +0000
X-UUID: 9f54c72ce9e74b0d8767cc2cf782187d-20200730
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=9B9LPQrlX3PAUh89jHh+tGfGpsTtq5UlUz9JBjl2JHw=; 
 b=PgrmgBWT3WZWVdd2oqwCC3x5FsNAodG5pA/++tE9xAYO/H0xDjSLafreanQQnY/OxZVmSrlHyOqpoh5RVt+opiVxr+SJffo2jLrCARkjTDAYAXg+b7k2XvPrEuorltJ63VKrkl/0KOz5QEcRgTUVyk7jjEqxT6RGEq5XJERYiTo=;
X-UUID: 9f54c72ce9e74b0d8767cc2cf782187d-20200730
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <hanks.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1598487067; Thu, 30 Jul 2020 05:14:22 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 30 Jul 2020 06:04:31 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 30 Jul 2020 21:04:29 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 30 Jul 2020 21:04:29 +0800
Message-ID: <1596114272.18804.1.camel@mtkswgap22>
Subject: Re: [PATCH v2 0/2] Remove MT6779 UART3 clock support
From: Hanks Chen <hanks.chen@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring
 <robh+dt@kernel.org>
Date: Thu, 30 Jul 2020 21:04:32 +0800
In-Reply-To: <252ba954-ae8f-18a3-55a3-9dd844a4d5b6@gmail.com>
References: <1595387397-13110-1-git-send-email-hanks.chen@mediatek.com>
 <54e4d0b9-e62c-a3cb-7f74-af2891664cf1@gmail.com>
 <1595416581.5511.6.camel@mtkswgap22>
 <252ba954-ae8f-18a3-55a3-9dd844a4d5b6@gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: FF05D014242A87BF7E5C8EAA45B129EDA2912E3E23F1213959CA97F6E6AE6AD42000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200730_091447_789690_B2B9D25F 
X-CRM114-Status: GOOD (  20.78  )
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
Cc: CC Hwang <cc.hwang@mediatek.com>, wsd_upstream@mediatek.com,
 Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 YueHaibing <yuehaibing@huawei.com>, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, mtk01761 <wendell.lin@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi all,

Gentle ping on this patch.

Thanks!

Hanks Chen


On Wed, 2020-07-22 at 17:21 +0200, Matthias Brugger wrote:
> 
> On 22/07/2020 13:16, Hanks Chen wrote:
> > On Wed, 2020-07-22 at 10:43 +0200, Matthias Brugger wrote:
> >>
> >> On 22/07/2020 05:09, Hanks Chen wrote:
> >>> remove the redundant clk interface of uart.
> >>> CLK_INFRA_UART3 is a dummy clk interface,
> >>> it has no effect on the operation of the read/write instruction.
> >>>
> >>> Change since v2:
> >>> Commit "dt-bindings: clock: remove UART3 clock support"
> >>
> >> Sorry just another comment. I think we can make this one patch deleting everything.
> >>
> > Sorry, I don't understand the comment. Do I need to merge them into one
> > big patch?
> > Btw, if I use one patch, I would get check patch fail.
> > ---
> > [2020-07-22 19:12:49,046 ERROR] Run check patch results:
> > WARNING:DT_SPLIT_BINDING_PATCH: DT binding docs and includes should be a
> > separate patch. See:
> > Documentation/devicetree/bindings/submitting-patches.rst
> > ---
> 
> Hm, I think that's a debatable error message from checkpatch, but let's leave it 
> as it is.
> 
> Regards,
> Matthias
> 
> 
> > 
> > Hanks
> > 
> >>> -- remove Fixes tag
> >>> Commit "clk: mediatek: remove UART3 clock support"
> >>> -- remove Fixes tag
> >>>
> >>> Hanks Chen (2):
> >>>     dt-bindings: clock: remove UART3 clock support
> >>>     clk: mediatek: remove UART3 clock support
> >>>
> >>>    drivers/clk/mediatek/clk-mt6779.c      | 2 --
> >>>    include/dt-bindings/clock/mt6779-clk.h | 1 -
> >>>    2 files changed, 3 deletions(-)
> >>>
> > 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
