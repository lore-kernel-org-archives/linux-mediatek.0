Return-Path: <SRS0=9FsO=BR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52781C433E0
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Aug 2020 12:52:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1F6AA20866
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Aug 2020 12:52:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gFQztnJ7";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="t43ETIaj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1F6AA20866
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=wC74qz5pFK6+w1LFaoqS2opoNL36k9cli1y41x2eQAc=; b=gFQztnJ74uupOO3gkMGoOlQpf
	pX+C5SquN2J8qu6hCUrotmir9ce5HuPlNNXQbFHPaok5aBpKVC5+b6zgVj5zSHzu67/kMDqb/5LpL
	9l7li3fgo9tCzQ3RS2mkjr3HXgS/dwPbjwm+2uSAj7V/aGVSiAcpYvD29G9hQxTodtbX5g/OBWJrM
	iTTaNGpMj3YBeNIfYPTLzJFWWy66vZ0aexjCoD6c+ptKEsfMLrLFIUDAWTHznZtIjaVDzdXyDRZYN
	UkoAg223RICDx9RoDJ57nAvaBPQpas9ydXUFBzqsCmygmlqh23vdJypmp3hgZ7E7V5uE9LgPhjxkS
	TZEdhgGCw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k41rA-0005VQ-Fz; Fri, 07 Aug 2020 12:52:20 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k41r6-0005Tt-CL; Fri, 07 Aug 2020 12:52:18 +0000
X-UUID: 115956a6d49b4c9b976bec7e706466d5-20200807
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=mztOhQW0Qq5rF36HzmEccKSTcbg3ytjmt1H64T/6/Fw=; 
 b=t43ETIajGTKqWq9hYaCkVJTGesRh7ItdyoZ5aolm8/57Bkziyzfy2U/u0+7RQ/71pJm1ciMTVPc/wZWSKBavBMSfIbvpGSIAXSK0wEbevV3U+goJryIqUHkpJH8K1ORfEOyD3EBY7WxDrIZ4mv7iGA6hJRkut9rMbz0+uB7Vi4c=;
X-UUID: 115956a6d49b4c9b976bec7e706466d5-20200807
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <mark-pk.tsai@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1995496136; Fri, 07 Aug 2020 04:52:03 -0800
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 7 Aug 2020 05:52:10 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 7 Aug 2020 20:52:07 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 7 Aug 2020 20:52:07 +0800
From: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
To: <maz@kernel.org>, Daniel Palmer <daniel@0x0f.com>, Mark-PK Tsai
 <mark-pk.tsai@mediatek.com>
Subject: Re: [PATCH 0/2] irqchip: irq-mt58xx: Add mt58xx series interrupt
Date: Fri, 7 Aug 2020 20:52:04 +0800
Message-ID: <20200807125204.2739-1-mark-pk.tsai@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <654a81dcefb3024d762ff338d4bd7f14@kernel.org>
References: <654a81dcefb3024d762ff338d4bd7f14@kernel.org>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200807_085216_571187_D48C1C6E 
X-CRM114-Status: GOOD (  21.19  )
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
Cc: devicetree@vger.kernel.org, alix.wu@mediatek.com, jason@lakedaemon.net,
 yj.chiang@mediatek.com, linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com, tglx@linutronix.de,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Marc Zyngier <maz@kernel.org>

> On 2020-08-06 15:58, Daniel Palmer wrote:
> > Hi Mark-PK,
> > 
> > On Thu, 6 Aug 2020 at 23:08, Mark-PK Tsai <mark-pk.tsai@mediatek.com> 
> > wrote:
> >> > Do you know if it would be possible to confirm if they are
> >> > the
> >> > same thing? MediaTek bought MStar a few years ago so it seems likely
> >> > but I have no hard information.
> >> >
> >> 
> >> Yes, it's for the same interrupt controller IP.
> > 
> > That's good news. :)
> > 
> >> > If they are the same thing could we work on making one series that
> >> > supports both use cases?
> >> 
> >> Sure, and I think the irq controller driver should support both use 
> >> cases.
> >> So how about keep the MTK version driver?
> > 
> > I'm fine with that. Maybe you can push the MTK version and I can send
> > a small patch after that to add the small bits I need?
> 
> In the interest of being vendor agnostic, please rename the properties
> such as mediatek,irqs-map-range to something less brand-specific.
> The compatible string should be enough.

I can't find the suitable property in standard ones that match the custom
properties here.
And the vendor prefixed rule is described in [1].

The interrupt controller is first used in Mstar TV SoCs.
Now it's used in MTK TV and Sigmastar SoCs.
So I think Mstar prefixed would make more sense.
I will rename the driver into mstar-intc, and MTK will maintain this driver.

[1] https://www.kernel.org/doc/Documentation/devicetree/booting-without-of.txt
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
