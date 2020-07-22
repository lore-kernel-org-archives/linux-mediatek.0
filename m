Return-Path: <SRS0=76sT=BB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 164ADC433E2
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jul 2020 11:26:34 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D9EFF20771
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jul 2020 11:26:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JnhXc1eS";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="U3FXwPQt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D9EFF20771
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=N4QQWjoK8HEkkBnN6icbts3BHDa7IC6qUmtODZ6bD78=; b=JnhXc1eSWHMpaIHb2XYNAXBvH
	Hj2UJY2au65w5JS/RfPy7uOGJkZ2oGm58IkWLexoX/l5C34PunqrpOKHGsPai6t6it9qpwWnBMta3
	rxL8NuHJM/7eAl1qI5xu3CBNJNDBKJdrVeIQTXXSWToDO5hB1wg5WuqRj1+jMJnKGJs1sts2Ba82z
	/hAnEaSkWFOW89XVqJUXYiewQ07M9qgo+X3ZAw6h3lUwDLpScu7+s8UDZ4C0eKyjpF6Jf3wMzl0b6
	1tQLTkEkyMDd6JreyhgnzVqlcnAJ9axtsLRqJFnBRBptb5tvyK5KUfOshOiglFdPhfTJOaQzwJz7q
	UmCz+I8hA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jyCtE-00004s-DU; Wed, 22 Jul 2020 11:26:24 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyCtB-0008Vq-Uh; Wed, 22 Jul 2020 11:26:23 +0000
X-UUID: b8545c92d4f74044a5885124eff71e46-20200722
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=kUGN4eod9+73obp1QXaVgA/WjQAmxsxhBRuAz9P0fHI=; 
 b=U3FXwPQtliIYH3zOvzWBlPYGdl3P2bV8WM2jNW4aMu7zzIg45fjxVe454gZTPUkn1z7/E3ajOrnb6i61QOarGRJdWkcjuy85O4ouXV6ymOBUgqIMsJE/wOqJILLc3Jrju25f6Rl2m4ZTIPIsf0qxp4m7fgji7MHhrFrMZn1wZFE=;
X-UUID: b8545c92d4f74044a5885124eff71e46-20200722
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <hanks.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 349014290; Wed, 22 Jul 2020 03:23:03 -0800
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 22 Jul 2020 04:16:27 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 22 Jul 2020 19:16:19 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 22 Jul 2020 19:16:20 +0800
Message-ID: <1595416581.5511.6.camel@mtkswgap22>
Subject: Re: [PATCH v2 0/2] Remove MT6779 UART3 clock support
From: Hanks Chen <hanks.chen@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Date: Wed, 22 Jul 2020 19:16:21 +0800
In-Reply-To: <54e4d0b9-e62c-a3cb-7f74-af2891664cf1@gmail.com>
References: <1595387397-13110-1-git-send-email-hanks.chen@mediatek.com>
 <54e4d0b9-e62c-a3cb-7f74-af2891664cf1@gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 8678F406109F856D891B379E590361900A402883DC336283B2FDBEFAF9C867542000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200722_072622_195441_25D25752 
X-CRM114-Status: GOOD (  15.94  )
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

On Wed, 2020-07-22 at 10:43 +0200, Matthias Brugger wrote:
> 
> On 22/07/2020 05:09, Hanks Chen wrote:
> > remove the redundant clk interface of uart.
> > CLK_INFRA_UART3 is a dummy clk interface,
> > it has no effect on the operation of the read/write instruction.
> > 
> > Change since v2:
> > Commit "dt-bindings: clock: remove UART3 clock support"
> 
> Sorry just another comment. I think we can make this one patch deleting everything.
> 
Sorry, I don't understand the comment. Do I need to merge them into one
big patch?
Btw, if I use one patch, I would get check patch fail.
---
[2020-07-22 19:12:49,046 ERROR] Run check patch results:
WARNING:DT_SPLIT_BINDING_PATCH: DT binding docs and includes should be a
separate patch. See:
Documentation/devicetree/bindings/submitting-patches.rst
---

Hanks

> > -- remove Fixes tag
> > Commit "clk: mediatek: remove UART3 clock support"
> > -- remove Fixes tag
> > 
> > Hanks Chen (2):
> >    dt-bindings: clock: remove UART3 clock support
> >    clk: mediatek: remove UART3 clock support
> > 
> >   drivers/clk/mediatek/clk-mt6779.c      | 2 --
> >   include/dt-bindings/clock/mt6779-clk.h | 1 -
> >   2 files changed, 3 deletions(-)
> > 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
